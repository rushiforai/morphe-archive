package app.template.patches.sofascore.misc.update

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val COMPONENT_ACTIVITY = "Landroidx/activity/ComponentActivity;"
private const val CONTEXT = "Landroid/content/Context;"
private const val TASK = "Lcom/google/android/gms/tasks/Task;"
private const val PENDING_INTENT = "Landroid/app/PendingIntent;"

private fun Method.calls(definingClass: String, name: String) = implementation?.instructions?.any {
    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
        ref.definingClass == definingClass && ref.name == name
    } == true
} == true

// The update check: (Context, <activity result launcher>)V asking Play Core for the update info.
private fun Method.isUpdateCheck() = returnType == "V" && implementation != null &&
    parameterTypes.size == 2 && parameterTypes[0].toString() == CONTEXT &&
    calls(TASK, "addOnSuccessListener")

// The update flow: (<AppUpdateInfo>, <launcher>)V launching Play's update screen through the
// info's PendingIntent.
private fun Method.isUpdateFlow() = returnType == "V" && implementation != null &&
    parameterTypes.size == 2 && calls(PENDING_INTENT, "getIntentSender")

// Sofascore's in-app update helper (R8-renamed, o7o in 26.10.26), built per activity with
// (ComponentActivity, coordinator layout id). The check's success listener decides between an
// immediate update (Remote Config "force_update_to_version" above the installed build, or an
// update older than 60 days) and a flexible one at most once a day; MainActivity.onStart resumes an
// update in progress through the same flow method. A patched build is re-signed, so Play cannot
// install its update. With both methods returning at once there is no check and no update screen.
private fun ClassDef.isUpdateHelper() =
    methods.any { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(COMPONENT_ACTIVITY, "I") } &&
        methods.any { it.isUpdateCheck() } &&
        methods.any { it.isUpdateFlow() }

// The Feed's "update the app" card (2026-11-22): static (Context)Z deciding whether the card shows,
// from Remote Config "feed_min_version" above the installed build and the PREF_FEED_UPDATE_* prefs
// (26.11.09: an R8-relocated class; its only caller is the Feed ViewModel's <init>, which keeps the
// answer in the feed state). nd9.invoke also holds PREF_FEED_UPDATE_ON_VERSION, but is no (Context)Z.
internal object FeedUpdateCardFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf(CONTEXT),
    strings = listOf("feed_min_version", "PREF_FEED_UPDATE_ON_VERSION"),
)

@Suppress("unused")
val disableUpdatePromptsPatch = bytecodePatch(
    name = "Disable update prompts",
    description = "Disables the update prompts.",
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        val helpers = mutableListOf<String>()
        classDefForEach { if (it.isUpdateHelper()) helpers += it.type }
        val helper = helpers.singleOrNull()
            ?: throw PatchException("Expected one in-app update helper, found $helpers")

        val methods = mutableClassDefBy(helper).methods
        val check = methods.singleOrNull { it.isUpdateCheck() }
            ?: throw PatchException("$helper: expected one update check")
        val flow = methods.singleOrNull { it.isUpdateFlow() }
            ?: throw PatchException("$helper: expected one update flow")
        val feedCard = FeedUpdateCardFingerprint.method
        check.returnEarly()
        flow.returnEarly()
        // The Feed's update card never shows (const/4 v0, 0x0; return v0). The skipped part only
        // resets PREF_FEED_UPDATE_COUNTER after an app update, a counter for this card.
        feedCard.returnEarly(false)
    }
}
