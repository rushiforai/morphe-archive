package patches.weeronline

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val unlockPlus = bytecodePatch(
    name = "Unlock Plus",
    description = "Unlocks locally enforced Weeronline Plus features, including paid dashboard tiles, tile " +
        "visibility and reordering, rain notifications for saved locations, and ad-free presentation. Does not " +
        "create a Play Store purchase or guarantee server-side notification delivery.",
) {
    compatibleWith(weeronline)
    execute {
        Fingerprint(
            definingClass = "$APP/data/repository/UserRepositoryImpl;",
            name = "isAdFree",
            returnType = "Z",
            parameters = emptyList(),
        ).method.addInstructions(0, "const/4 v0, 0x1\nreturn v0")

        Fingerprint(
            definingClass = "$APP/iap/IAPStatusImpl\$2;",
            name = "invokeSuspend",
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Ljava/lang/Object;"),
        ).method.addInstructions(0, "sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;\nreturn-object v0")
    }
}
