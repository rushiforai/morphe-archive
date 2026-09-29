/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

private const val CONTEXT_TYPE = "Landroid/content/Context;"
private const val VIEW = "Lfixture/ViewResolver;"
private const val THEME = "Lfixture/ThemeResolver;"
private const val TOKEN = "Lfixture/Token;"

/**
 * How route one finds the FDS theme resolver without a Facebook build: through FdsColorScheme's
 * wrapper to the view resolver, and from there to the one method it asks for an int. Every shape
 * that would leave the hook on the wrong method stops the patch instead.
 */
class ThemeResolverTest {
    @Before
    @After
    fun forgetMatches() = FdsSchemeResolveFingerprint.clearMatch()

    private fun method(
        owner: String,
        name: String,
        parameters: List<String>,
        registers: Int,
        smali: String,
        static: Boolean = true,
    ): Method = MutableMethod(
        ImmutableMethod(
            owner, name, parameters.map { ImmutableMethodParameter(it, null, null) }, "I",
            AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0),
            null, null, ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructionsWithLabels(0, smali) }.let(ImmutableMethod::of)

    private fun classDef(type: String, methods: List<Method>, fields: List<ImmutableField> = emptyList()): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, fields, methods)

    /** FdsColorScheme's wrapper: reads its context and asks the view resolver for the token's colour. */
    private val scheme = classDef(
        FDS_COLOR_SCHEME,
        listOf(
            method(
                FDS_COLOR_SCHEME, "A00", listOf("Lfixture/Key;"), 4,
                """
                    iget-object v1, p0, $FDS_COLOR_SCHEME->A00:$CONTEXT_TYPE
                    invoke-static { p1 }, Lfixture/Keys;->token(Lfixture/Key;)$TOKEN
                    move-result-object v0
                    invoke-static { v1, v0 }, $VIEW->A01($CONTEXT_TYPE$TOKEN)I
                    move-result v0
                    return v0
                """,
                static = false,
            ),
        ),
        listOf(ImmutableField(FDS_COLOR_SCHEME, "A00", CONTEXT_TYPE, AccessFlags.PUBLIC.value, null, null, null)),
    )

    /** The view resolver: throws on a missing token, otherwise returns what [asks] answers. */
    private fun viewResolver(asks: String) = classDef(
        VIEW,
        listOf(
            method(
                VIEW, "A01", listOf(CONTEXT_TYPE, TOKEN), 4,
                """
                    sget-object v0, $THEME->INSTANCE:$THEME
                    if-eqz p1, :missing
                    $asks
                    move-result v0
                    return v0
                    :missing
                    new-instance v0, Ljava/lang/IllegalStateException;
                    invoke-direct { v0 }, Ljava/lang/IllegalStateException;-><init>()V
                    throw v0
                """,
            ),
        ),
    )

    private val themeResolver = classDef(
        THEME,
        listOf(
            method(THEME, "A00", listOf(CONTEXT_TYPE, TOKEN), 4, "const/4 v0, 0x0\nreturn v0", static = false),
            method(THEME, "A00", listOf(CONTEXT_TYPE, "Lfixture/Other;"), 4, "const/4 v0, 0x0\nreturn v0", static = false),
        ),
    )

    private fun found(vararg classes: ClassDef): String = with(PatchContexts.of(classes.toList())) {
        fdsThemeResolver().let { "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
    }

    @Test
    fun `route one's view code hook goes on the resolver the view resolver asks`() {
        val asks = "invoke-virtual { v0, p0, p1 }, $THEME->A00($CONTEXT_TYPE$TOKEN)I"
        assertEquals("$THEME->A00($CONTEXT_TYPE$TOKEN)I", found(scheme, viewResolver(asks), themeResolver))
    }

    /** Negative control: a view resolver that asks two methods for an int could hand either one's answer back. */
    @Test
    fun `a view resolver asking two methods for an int stops the patch`() {
        val asks = """
            invoke-virtual { v0, p0, p1 }, $THEME->A00($CONTEXT_TYPE$TOKEN)I
            move-result v1
            invoke-static { p0, p1 }, $VIEW->A02($CONTEXT_TYPE$TOKEN)I
        """
        val refused = assertThrows(PatchException::class.java) { found(scheme, viewResolver(asks), themeResolver) }
        assertTrue(refused.message, refused.message.orEmpty().contains("calls 2 methods that answer an int"))
    }

    /** Negative control: an int from something other than the context and the token is no colour for the token. */
    @Test
    fun `a resolver that doesn't take the context and the token stops the patch`() {
        val asks = "invoke-virtual { v0, p0, p1 }, $THEME->A00(${CONTEXT_TYPE}Lfixture/Other;)I"
        val refused = assertThrows(PatchException::class.java) { found(scheme, viewResolver(asks), themeResolver) }
        assertTrue(refused.message, refused.message.orEmpty().contains("doesn't take the view resolver's"))
    }
}
