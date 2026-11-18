package patches.flitsmeister

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import patches.shared.androidAutoHostVisibility

@Suppress("unused")
val carHostPatch = bytecodePatch(
    name = "Allow any Android Auto host",
    description = "Lets any Android Auto compatible host connect to Flitsmeister's car screens, including DriveDeck, Gearslip, MyCar, Flywheel, BetterAuto, AndroidAuto and AARE, " +
        "whatever its package name or signing key. Google's Android Auto keeps working.",
    default = true,
) {
    compatibleWith(flitsmeister)
    dependsOn(originalInput, startupCompatibility, androidAutoHostVisibility)
    execute {
        // HostValidator.validateHost resolves the package and ties its UID to the Binder caller
        // before it asks isAllowListed(package, signatures), so a forged package claim is still
        // rejected. Answer the allowlist question with yes for every real host.
        val method = exact("Landroidx/car/app/validation/HostValidator;", "isAllowListed", "Z",
            "Ljava/lang/String;", "[Landroid/content/pm/Signature;").method
        val implementation = method.implementation ?: throw PatchException("Flitsmeister host allowlist has no code")
        if (implementation.registerCount <= method.parameterTypes.size + 1)
            throw PatchException("Flitsmeister host allowlist check has no free register")
        method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
