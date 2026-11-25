/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.interaction.favorites

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.pinedrama.misc.extension.sharedExtensionPatch
import app.morphe.patches.pinedrama.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.pinedrama.misc.settings.configurableBytecodePatch as bytecodePatch
import app.morphe.patches.pinedrama.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstruction
import app.morphe.util.addInstructions
import app.morphe.util.getReference
import app.morphe.util.implementationOrPatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val LIST_TOOLS = "Lapp/morphe/extension/pinedrama/favorites/ListTools;"

val listToolsPatch = bytecodePatch(
    name = "List search and tap to top",
    description = "Adds a search bar above the History and Favorites lists, on your profile and in " +
        "My list, that finds a title anywhere in them, and tapping the tab you're already on takes its list " +
        "back to the top. On by default. Turn either off in HushPine settings.",
    default = true,
) {
    category("Settings")
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.pineDrama())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/pinedrama/settings/SettingsStatus;->enableListTools()V",
        )

        // The same refresh gate Keep list position answers: each History and Favorites page
        // hands it the page's list as it's built, which is the one moment every list passes by.
        val destroy = HistoryListPageDestroyFingerprint.method
        val gateType = destroy.implementationOrPatchException("List search and tap to top").instructions
            .firstOrNull { it.opcode == Opcode.IGET_OBJECT }
            ?.getReference<FieldReference>()?.type
            ?: throw PatchException("List search and tap to top: the History page holds no refresh gate.")
        val watch = mutableClassDefBy(gateType).methods.singleOrNull { it.isRefreshGateWatch() }
            ?: throw PatchException("List search and tap to top: $gateType has no single watch method.")

        watch.addInstruction(0, "invoke-static {p1}, $LIST_TOOLS->attach(Landroid/view/View;)V")

        // The My list tab builds its History and Favorites pages another way, with no gate.
        // Each one hands over its own list whenever it comes into view.
        val resume = MyListPageResumeFingerprint.method
        val list = myListPageList(MyListPageResumeFingerprint.classDef.methods)
        if (resume.implementationOrPatchException("List search and tap to top").registerCount < 2) {
            throw PatchException("List search and tap to top: the My list page has no free register.")
        }
        resume.addInstructions(
            0,
            """
                invoke-virtual/range {p0 .. p0}, $MY_LIST_PAGE->${list.name}()${list.returnType}
                move-result-object v0
                invoke-static {v0}, $LIST_TOOLS->attach(Landroid/view/View;)V
            """,
        )
    }
}

internal const val MY_LIST_PAGE =
    "Lcom/ss/android/ugc/aweme/series/feed/mylist/assme/opt/SeriesHistorySubPageFragment;"

/** A My list page (History or Favorites on the bottom tab) coming into view. */
internal object MyListPageResumeFingerprint : Fingerprint(
    definingClass = MY_LIST_PAGE,
    name = "onResume",
    returnType = "V",
    parameters = emptyList(),
)

/** The page's getter for its list: the one view it looks up by id in its own view. */
internal fun myListPageList(methods: Iterable<Method>): Method {
    val getters = methods.filter { it.isPageListGetter() }
    return getters.singleOrNull()
        ?: throw PatchException("List search and tap to top: the My list page has ${getters.size} list getters.")
}

private fun Method.isPageListGetter(): Boolean {
    if (parameterTypes.isNotEmpty() || !returnType.startsWith("L") || AccessFlags.STATIC.isSet(accessFlags)) return false
    val code = implementation?.instructions?.toList() ?: return false
    fun calls(name: String, returns: String) = code.any { instruction ->
        instruction.getReference<MethodReference>()?.let { it.name == name && it.returnType == returns } == true
    }
    return calls("getView", "Landroid/view/View;") && calls("findViewById", "Landroid/view/View;") &&
        code.any { it.opcode == Opcode.CHECK_CAST } && code.last().opcode == Opcode.RETURN_OBJECT
}
