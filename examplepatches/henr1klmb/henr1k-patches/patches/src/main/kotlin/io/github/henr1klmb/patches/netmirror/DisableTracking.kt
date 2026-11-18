package io.github.henr1klmb.patches.netmirror

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val HELPER = "Lio/github/henr1klmb/patches/shared/WebViewHelper;"

@Suppress("unused")
val disableTrackersPatch = patch(
    name = "Disable tracking",
    description = "Disables Tracking and Analytics.",
) {
    compatibleWith(NETMIRROR_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        MainWebViewClientFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p1}, $HELPER->injectTrackerBlock(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        RNDeviceUniqueIdFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const-string v0, "0000000000000000"
                return-object v0
            """.trimIndent(),
        )
    }
}