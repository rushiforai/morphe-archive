package app.template.patches.protonpass

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// Proton Pass: Password Manager (proton.android.pass / proton.android.pass.fdroid) v1.41.3
//
// Plan.<init> is the single injection point used by ProtonPassUnlockPatch: it replaces
// planType with PlanType$Paid$Plus, forces hideUpgrade and sets all PlanLimit fields to
// Unlimited. See ProtonPassUnlockPatch.kt for the verified register and rewriting details.
//
internal val PlanConstructorFingerprint = Fingerprint(
    definingClass = "Lproton/android/pass/domain/Plan;",
    name = "<init>",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf(
        "Landroidx/credentials/Credential;",
        "Z",
        "Lproton/android/pass/domain/PlanLimit;",
        "Lproton/android/pass/domain/PlanLimit;",
        "Lproton/android/pass/domain/PlanLimit;",
        "J",
    ),
)
