package app.jouss.patches.starsense.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// Matches SkyBoxUnlockFragment.isUnlocked() — checks SharedPreferences for stored unlock code
object IsUnlockedFingerprint : Fingerprint(
    definingClass = "Lcom/simulationcurriculum/skysafari/SkyBoxUnlockFragment;",
    name = "isUnlocked",
    returnType = "Z",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Landroid/preference/PreferenceManager;", name = "getDefaultSharedPreferences"),
        string("SkyBoxUnlockCode"),
        methodCall(definingClass = "Landroid/content/SharedPreferences;", name = "getString"),
    )
)
