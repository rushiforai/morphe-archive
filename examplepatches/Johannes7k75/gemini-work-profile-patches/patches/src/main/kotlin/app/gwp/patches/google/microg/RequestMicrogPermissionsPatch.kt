package app.gwp.patches.google.microg

import app.gwp.patches.shared.Constants.COMPATIBILITY_GOOGLE
import app.gwp.patches.shared.Constants.MICROG_EXTENDED_ACCESS
import app.gwp.patches.shared.addMethod
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.AccessFlags

private const val HELPER = "gwpRequestMicrogPermissions"

@Suppress("unused")
val requestMicrogPermissionsPatch = patch(
    name = "Request microG permissions",
    description = "Asks for account access and microG extended access when Gemini starts, " +
        "so signing in works without granting them manually.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE)
    dependsOn(microgSupportPatch)

    execute {
        val activity = mutableClassDefBy(
            classDefByOrNull(ROBIN_MAIN_ACTIVITY) ?: throw PatchException("Gemini MainActivity not found")
        )

        // Own helper with its own registers: v0..v2 locals, p0 = this.
        activity.addMethod(HELPER, emptyList(), "V", AccessFlags.PRIVATE.value or AccessFlags.FINAL.value, locals = 3, """
            const-string v0, "$MICROG_EXTENDED_ACCESS"
            invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I
            move-result v0
            if-nez v0, :request
            const-string v0, "android.permission.GET_ACCOUNTS"
            invoke-virtual {p0, v0}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I
            move-result v0
            if-eqz v0, :done
            :request
            const/4 v0, 0x2
            new-array v0, v0, [Ljava/lang/String;
            const/4 v1, 0x0
            const-string v2, "android.permission.GET_ACCOUNTS"
            aput-object v2, v0, v1
            const/4 v1, 0x1
            const-string v2, "$MICROG_EXTENDED_ACCESS"
            aput-object v2, v0, v1
            const/16 v1, 0x6d47
            invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->requestPermissions([Ljava/lang/String;I)V
            :done
            return-void
        """)

        // Call it once per activity creation, at the start of onPostCreate where p0 is always `this`.
        val call = "invoke-direct/range {p0 .. p0}, ${activity.type}->$HELPER()V"
        val onPostCreate = activity.methods.singleOrNull {
            it.name == "onPostCreate" && it.parameterTypes == listOf("Landroid/os/Bundle;") && it.implementation != null
        }
        if (onPostCreate != null) {
            onPostCreate.addInstructions(0, call)
        } else {
            activity.addMethod("onPostCreate", listOf("Landroid/os/Bundle;"), "V", AccessFlags.PROTECTED.value, locals = 0, """
                invoke-super {p0, p1}, ${activity.superclass}->onPostCreate(Landroid/os/Bundle;)V
                $call
                return-void
            """)
        }
    }
}
