/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.downloads.reel

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * Download any reel run whole on each declared build's own sidebar and the classes it reaches: the
 * block goes in three instructions before the assembly call, borrowing v0 to v2 and a fourth local
 * for the story, each proved free there by the liveness of the whole builder, and each register it
 * reads unchanged up to the call. The build's one FbShortsSideBarComponent render, which the button
 * can't go in, gets a counter as its first instruction and nothing else (#18).
 */
class DownloadReelFixtureTest {
    private val sidebarName = "UDDSideBarComponent"
    private val function1 = "Lkotlin/jvm/functions/Function1;"
    private val session = "Lcom/facebook/auth/usersession/FbUserSession;"
    private val otherSidebarName = "FbShortsSideBarComponent"

    /** A render of the same Litho method as [builder]: its name, its one scoped parameter and its return type. */
    private fun rendersLike(method: Method, builder: Method) = method.name == builder.name &&
        method.parameterTypes.map(CharSequence::toString) == builder.parameterTypes.map(CharSequence::toString) &&
        method.returnType == builder.returnType && holdsString(method, otherSidebarName)

    /** The story's local, v3 and up, on each declared build. */
    private val storyLocal = mapOf(
        AppCompatibilities.FACEBOOK_TARGET_VERSION to 3,
        AppCompatibilities.FACEBOOK_PREVIOUS_VERSION to 3,
    )

    private fun callsButtonFactory(method: Method) = method.implementation?.instructions?.any { instruction ->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.parameterTypes?.let { types ->
            types.count { it.toString() == function1 } == 4 && types.firstOrNull()?.toString() == session
        } == true
    } == true

    /** Every class the builder names: the owners of what it calls and reads, and the types it makes or casts to. */
    private fun namedBy(method: Method): Set<String> = method.implementation!!.instructions.mapNotNull { instruction ->
        when (val reference = (instruction as? ReferenceInstruction)?.reference) {
            is MethodReference -> reference.definingClass
            is FieldReference -> reference.definingClass
            is TypeReference -> reference.type
            else -> null
        }
    }.filter { it.startsWith("L") }.toSet()

    @Test
    fun `the reel button goes in with proved registers on each declared build`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertEquals("the declared builds", storyLocal.keys, versions)
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val (component, builder) = FixtureDex.classesHolding(bundle, sidebarName).flatMap { classDef ->
                    classDef.methods.filter { holdsString(it, sidebarName) && it.parameterTypes.size == 1 && callsButtonFactory(it) }
                        .map { classDef to it }
                }.single()

                val types = namedBy(builder) + component.fields.map { it.type } + builder.parameterTypes.map { it.toString() } +
                    setOf(function1, "Lcom/facebook/video/engine/api/VideoDataSource;")
                val classes = mutableMapOf<String, ClassDef>()
                FixtureDex.classes(bundle, types).forEach { (type, classDef) -> classes[type] = classDef }
                FixtureDex.classesHolding(bundle, "fds_control_download_video").forEach { classes.putIfAbsent(it.type, it) }
                // The other sidebar, whose render the patch counts in Hook status (#18).
                val others = FixtureDex.classesHolding(bundle, otherSidebarName).filter { classDef ->
                    classDef.type != component.type && classDef.methods.any { rendersLike(it, builder) }
                }
                assertEquals("${bundle.name}: the other sidebar components", 1, others.size)
                val other = others.single()
                classes.putIfAbsent(other.type, other)
                classes[component.type] = component
                classes[SETTINGS_STATUS] = ExtensionDex.classDef(SETTINGS_STATUS)
                val context = PatchContexts.of(classes.values)

                downloadReelPatch.execute(context)

                val patched = context.mutableClassDefBy(component.type).methods.single {
                    it.name == builder.name && it.parameterTypes.map(CharSequence::toString) == builder.parameterTypes.map(CharSequence::toString)
                }
                val body = patched.implementation!!.instructions.toList()
                val original = builder.implementation!!.instructions.toList()
                val assemblyAt = original.indexOfFirst { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.parameterTypes
                        ?.count { it.toString() == "Ljava/util/ArrayList;" } == 2
                }
                val injectAt = assemblyAt - 3
                assertEquals(
                    "${bundle.name}: the block's first call",
                    "Lapp/morphe/extension/facebook/download/ReelDownload;->showsButton()Z",
                    (body[injectAt] as ReferenceInstruction).reference.toString(),
                )
                val helper = body.single { instruction ->
                    ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.name == "hushfacebookDownloadButton"
                } as FiveRegisterInstruction
                assertEquals(
                    "${bundle.name}: the helper call's registers",
                    listOf(0, 1, 2, storyLocal.getValue(version)),
                    listOf(helper.registerC, helper.registerD, helper.registerE, helper.registerF),
                )
                val otherRender = context.mutableClassDefBy(other.type).methods.single { rendersLike(it, builder) }
                val otherOriginal = other.methods.single { rendersLike(it, builder) }
                assertEquals(
                    "${bundle.name}: the other sidebar counts itself first thing",
                    "Lapp/morphe/extension/facebook/download/ReelDownload;->otherSidebarBuilt()V",
                    (otherRender.implementation!!.instructions.first() as ReferenceInstruction).reference.toString(),
                )
                assertEquals(
                    "${bundle.name}: the counter is the only thing added to the other sidebar",
                    otherOriginal.implementation!!.instructions.count() + 1,
                    otherRender.implementation!!.instructions.count(),
                )
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
