package app.sofatime.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.sofatime.shared.Constants.SOFATIME_COMPATIBILITY

@Suppress("unused")
val googleSignInPatch = bytecodePatch(
    name = "Bypass Google Sign-In",
    description = "Bypasses SHA-1 check by using embedded WebView OAuth for Google Sign-In.",
) {
    compatibleWith(SOFATIME_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        Fingerprint(
            definingClass = "Lmp8;",
            name = "w",
            parameters = listOf("Landroid/content/Context;", "Lwp0;"),
            returnType = "Ljava/io/Serializable;",
        ).method.addInstructions(0, """
            invoke-static {p0, p1}, Lapp/sofatime/GoogleSignInHelper;->startGoogleSignIn(Landroid/content/Context;Ljava/lang/Object;)V
            sget-object v0, Lgr0;->a:Lgr0;
            return-object v0
        """)
    }
}
