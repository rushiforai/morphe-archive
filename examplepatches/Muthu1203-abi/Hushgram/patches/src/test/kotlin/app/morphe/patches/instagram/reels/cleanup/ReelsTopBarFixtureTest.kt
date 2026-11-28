/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.reels.cleanup

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Hide the top bar on the Reels tab (#14) changes no Instagram code: the extension's ReelsTopBar
 * finds the bar at runtime by the class name Instagram keeps, and reads where its viewer was opened
 * from out of the bar's config objects, each holding one ClipsViewerSource whose constant names
 * Instagram keeps too. These hold that shape on every 450 build, so a build that renamed the bar or
 * moved the source would fail here rather than leave the switch doing nothing.
 */
class ReelsTopBarFixtureTest {
    /** The extension looks for the same names this test does. */
    @Test
    fun theExtensionLooksForTheseNames() {
        assertEquals(BAR_CLASS, ExtensionDex.stringConstant(TOP_BAR, "BAR_CLASS"))
        assertEquals(SOURCE_CLASS, ExtensionDex.stringConstant(TOP_BAR, "SOURCE_CLASS"))
        assertEquals("clips_viewer_action_bar", ExtensionDex.stringConstant(TOP_BAR, "BAR_ID"))
    }

    @Test
    fun eachDeclaredBuildHasTheBarAndItsSource() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                hasTheBarAndItsSource(bundle, bundle.name)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun eachOtherBuildHasTheBarAndItsSource() {
        val builds = Fixtures.otherBuilds()
        for (apk in builds) hasTheBarAndItsSource(apk, apk.parentFile.name)
        assertTrue("no other build was read", builds.isNotEmpty())
    }

    private fun hasTheBarAndItsSource(bundle: File, label: String) {
        val found = FixtureDex.classes(bundle, setOf(BAR, SOURCE))
        val bar = found[BAR] ?: throw AssertionError("$label: no $BAR")
        val source = found[SOURCE] ?: throw AssertionError("$label: no $SOURCE")
        assertEquals("$label: the bar is a RelativeLayout, a view", "Landroid/widget/RelativeLayout;", bar.superclass)

        assertEquals("$label: the source is an enum", "Ljava/lang/Enum;", source.superclass)
        val names = source.methods.filter { it.name == "<clinit>" }.flatMap { it.implementation?.instructions?.toList().orEmpty() }
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.toSet()
        for (name in REELS_TAB) assertTrue("$label: the source names no $name", name in names)

        // As ReelsTopBar.sourceFieldsOf reads it: the bar's instance fields of its own source type,
        // or whose declared type has an instance field of it.
        val direct = bar.fields.filter { !isStatic(it.accessFlags) && it.type == SOURCE }
        val holderTypes = bar.fields.filter { !isStatic(it.accessFlags) && !it.type.startsWith("[") && !isPlatform(it.type) }
            .map { it.type }.toSet()
        val holders: Map<String, ClassDef> = FixtureDex.classes(bundle, holderTypes)
        val held = bar.fields.filter { !isStatic(it.accessFlags) }.filter { field ->
            val type = holders[field.type] ?: return@filter false
            !AccessFlags.INTERFACE.isSet(type.accessFlags) &&
                type.fields.any { !isStatic(it.accessFlags) && it.type == SOURCE }
        }
        assertTrue("$label: the bar holds no source, directly or in a config", direct.size + held.size >= 1)
    }

    private fun isStatic(flags: Int) = AccessFlags.STATIC.isSet(flags)

    private fun isPlatform(type: String) =
        listOf("Landroid/", "Ljava/", "Ljavax/", "Landroidx/", "Lkotlin/").any { type.startsWith(it) }

    private companion object {
        const val TOP_BAR = "Lapp/hushgram/extension/instagram/reels/ReelsTopBar;"
        const val BAR_CLASS = "instagram.features.clips.viewer.actionbar.ClipsViewerActionBar"
        const val SOURCE_CLASS = "com.instagram.clips.intf.ClipsViewerSource"
        const val BAR = "Linstagram/features/clips/viewer/actionbar/ClipsViewerActionBar;"
        const val SOURCE = "Lcom/instagram/clips/intf/ClipsViewerSource;"
        val REELS_TAB = listOf("CLIPS_TAB", "CLIPS_TAB_HOMECOMING")
    }
}
