package app.asken.patches.devirt

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.asken.patches.shared.Constants.ASKEN_COMPATIBILITY

@Suppress("unused")
val devirtualizePatch = bytecodePatch(
    name = "De-virtualize PairIP methods",
    description = "PairIP relocated 20 framework-override method bodies into runtime-generated classes reached via reflected Methods that are null once PairIP is removed. Restores safe behavior: ContentProvider.onCreate returns true, other ContentProvider/onBind return null/0, Activity lifecycle overrides delegate to super. Third-party login/deeplink/health flows degrade gracefully; core features are unaffected."
) {
    compatibleWith(ASKEN_COMPATIBILITY)
    execute {
        Vm0Fingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        Vm1Fingerprint.method.addInstructions(0, "invoke-super {p0}, Landroid/app/Activity;->onStart()V\nreturn-void")
        Vm2Fingerprint.method.addInstructions(0, "invoke-super {p0}, Landroid/app/Activity;->onStop()V\nreturn-void")
        Vm3Fingerprint.method.addInstructions(0, "invoke-super {p0}, Landroid/app/Activity;->onStart()V\nreturn-void")
        Vm4Fingerprint.method.addInstructions(0, "invoke-super {p0}, Landroid/app/Activity;->onStop()V\nreturn-void")
        Vm5Fingerprint.method.addInstructions(0, "invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V\nreturn-void")
        Vm6Fingerprint.method.addInstructions(0, "invoke-super {p0}, Landroid/app/Activity;->onDestroy()V\nreturn-void")
        Vm7Fingerprint.method.addInstructions(0, "invoke-super {p0}, Landroid/app/Activity;->onStart()V\nreturn-void")
        Vm8Fingerprint.method.addInstructions(0, "invoke-super {p0}, Landroid/app/Activity;->onStop()V\nreturn-void")
        Vm9Fingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        Vm10Fingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        Vm11Fingerprint.method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        Vm12Fingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn-object v0")
        Vm13Fingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
        Vm14Fingerprint.method.addInstructions(0, "invoke-super {p0}, Landroidx/fragment/app/q;->onStart()V\nreturn-void")
        Vm15Fingerprint.method.addInstructions(0, "invoke-super {p0}, Landroidx/fragment/app/q;->onStop()V\nreturn-void")
        Vm16Fingerprint.method.addInstructions(0, "invoke-super {p0}, Landroidx/fragment/app/q;->onStart()V\nreturn-void")
        Vm17Fingerprint.method.addInstructions(0, "invoke-super {p0}, Landroidx/fragment/app/q;->onStop()V\nreturn-void")
        Vm18Fingerprint.method.addInstructions(0, "invoke-super {p0}, Landroid/app/Activity;->onStart()V\nreturn-void")
        Vm19Fingerprint.method.addInstructions(0, "invoke-super {p0}, Landroid/app/Activity;->onStop()V\nreturn-void")
    }
}
