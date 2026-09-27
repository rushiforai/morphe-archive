/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test

/**
 * Route one of the AMOLED and Material You themes as the patch runs it, on each declared build's
 * own colour classes: four resolvers and six returns, each hook reading the colour token from a
 * register that still holds it there. A build whose resolver reused the token's register before a
 * return would stop here, naming it.
 */
class ColourResolverFixtureTest {
    @Before
    @After
    fun forgetMatches() {
        DarkSchemeResolveFingerprint.clearMatch()
        FdsSchemeResolveFingerprint.clearMatch()
    }

    /** The class the FdsColorScheme wrapper hands the context and token to: the view resolver's. */
    private fun viewResolverClass(scheme: ClassDef): String = scheme.methods.mapNotNull { method ->
        val instructions = method.implementation?.instructions?.toList() ?: return@mapNotNull null
        val readsContext = instructions.any {
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
                field.definingClass == FDS_COLOR_SCHEME && field.type == "Landroid/content/Context;"
            } == true
        }
        if (method.returnType != "I" || !readsContext) return@mapNotNull null
        instructions.firstNotNullOfOrNull { instruction ->
            ((instruction as? ReferenceInstruction)?.reference as? MethodReference)
                ?.takeIf { instruction.opcode == Opcode.INVOKE_STATIC && it.returnType == "I" }
                ?.definingClass
        }
    }.distinct().single()

    @Test
    fun `route one hooks four resolvers and six returns, each token intact, on each declared build`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                forgetMatches()
                val named = FixtureDex.classes(bundle, setOf(DARK_COLOR_SCHEME, FDS_COLORS, FDS_COLOR_SCHEME))
                val viewResolver = viewResolverClass(named.getValue(FDS_COLOR_SCHEME))
                val classes = named + FixtureDex.classes(bundle, setOf(viewResolver))
                val context = PatchContexts.of(classes.values)

                with(context) {
                    DarkSchemeResolveFingerprint.method.hookColorReturns(tokenParameterIndex = 0, target = APPLY)
                    hookFdsColorsResolvers(target = APPLY)
                    fdsViewResolver().hookColorReturns(tokenParameterIndex = 1, target = APPLY)
                }

                val hooked = classes.keys.flatMap { type -> context.mutableClassDefBy(type).methods }
                    .associate { method ->
                        "${method.definingClass}->${method.name}(${method.parameterTypes.joinToString("")})" to
                            (method.implementation?.instructions?.count {
                            (it as? ReferenceInstruction)?.reference?.toString() == APPLY
                        } ?: 0)
                    }
                    .filterValues { it > 0 }
                assertEquals("${bundle.name}: resolvers hooked, $hooked", 4, hooked.size)
                assertEquals("${bundle.name}: returns hooked, $hooked", 6, hooked.values.sum())
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
