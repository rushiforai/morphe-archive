package app.cesbar.patches.citymapper

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction


object isFlagEnabledFingerprint : Fingerprint (
	name = "isEnabled",
	accessFlags = listOf(AccessFlags.PUBLIC),
	parameters = listOf(),
	returnType = "Z",
	filters = listOf(
		methodCall(name = "getSharedPreferences")
	)
)

object subscriptionCheckFingerprint : Fingerprint (
	strings = listOf("purchased_subscription_id"),
	filters = listOf(
		methodCall(name = "getString")
	)
)


val bypassPairIpPatch = bytecodePatch (
    name = "Enable Club",
    description = "Enable Citymapper Club subscription"
){
    compatibleWith(Constants.COMPATIBILITY)


    execute {

        // Enable USE_FAKE_SUBSCRIPTION dev flag
        val className = isFlagEnabledFingerprint.method.definingClass
        isFlagEnabledFingerprint.method.addInstructions(0, """
            invoke-virtual {p0}, $className->name()Ljava/lang/String;
            move-result-object v0
            const-string v1, "USE_FAKE_SUBSCRIPTION"
            invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :cond_continue
            const/4 v0, 1
            return v0
            :cond_continue
        """.trimIndent())

        // Set purchased_subscription_id to "com.citymapper.daily.club_yearly_v1"
        val instructions = subscriptionCheckFingerprint.method.implementation?.instructions?.toList() ?:return@execute

        val idx = instructions.indexOfFirst {
            it is ReferenceInstruction &&
            (it as ReferenceInstruction).reference.toString().contains("Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;")
        }
        if (idx < 0) throw PatchException("`purchased_subscription_id` check not found.")
        
        subscriptionCheckFingerprint.method.addInstructions(idx+2, """
            const-string p0, "com.citymapper.daily.club_yearly_v1"
        """.trimIndent())

    }
}