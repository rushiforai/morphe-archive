package app.template.patches.mereframe

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.MEREFRAME_COMPATIBILITY
import app.template.patches.shared.clearBody
import com.android.tools.smali.dexlib2.Opcode

/**
 * Mereframe 0.8.4 (vc 118) contains a self-defense layer: on launch it decides
 * whether the installation is "legitimate" (Play-signed, expected installer)
 * and, on refusal, substitutes the real entry points with
 * InstallationProblemActivity / RejectedInstallationService. ANY re-signed
 * patched APK (e.g. after Morphe patching) trips this gate and the app never
 * starts. This patch is therefore the REQUIRED companion for anything else in
 * our bundle - it neutralizes the three enforcement points:
 *
 * 1. UnnamedApp.a()Z  -> always true (the startup verdict shared by three
 *    gate call sites): full body replaced with `const/4 v0, 0x1; return v0`.
 * 2. InstallationComponentFactory.instantiateActivity: the rejected branch is
 *    entered via `if-eqz p0` on the booleanValue verdict; forcing the just-
 *    produced result register to 1 (const/4 p0, 0x1 in place of the
 *    move-result) makes the branch never taken - normal reflective
 *    instantiation always runs, dead rejection code unreferenced.
 * 3. InstallationComponentFactory.instantiateService: same trick on the
 *    `if-nez p0` that guards the RejectedInstallationService substitution.
 *
 * Both edits rewrite existing instructions in place - no labels are
 * introduced or referenced. Layout is build-pinned (0.8.4/vc 118) and every
 * precondition is asserted (opcode + register flow), failing loudly rather
 * than half-patching.
 */
@Suppress("unused")
val allowReSignedInstallPatch = bytecodePatch(
    name = "Allow re-signed/sideloaded installs",
    description = "Neutralizes Mereframe's install-integrity checks so patched (re-signed) builds " +
        "start normally instead of showing the installation-refused screen. Required for any other " +
        "patch here to be usable.",
    default = true,
) {
    compatibleWith(MEREFRAME_COMPATIBILITY)

    execute {
        // 1) Startup verdict -> always accepted, WITH the method's bootstrap
        // side effects preserved. The stock body does four things our first
        // replacement accidentally killed: (a) seeds the cached verdict
        // Lqm;->b:LWh;.b:Z read by factory/license workers via LC2 case 0xb;
        // (b) registers Eb ActivityLifecycleCallbacks (per-activity session
        // wiring - skip it and the camera preview init dies mid-launch, the
        // exact field report); (c) publishes Jm.c = getCacheDir() used by the
        // 64MB+ RAW frame-buffer allocator (Jm.g); (d) flips UnnamedApp.b as
        // the "bootstrapped" idempotency flag. We replay all of them, then
        // return true - the install-legality/licensing adjudication is the
        // only behavior we suppress.
        Fingerprint(
            definingClass = "Lapp/unnamed/rawrecording/UnnamedApp;",
            name = "a",
            returnType = "Z",
            parameters = emptyList(),
        ).method.apply {
            clearBody()
            addInstructions(
                0,
                """
                const/4 v0, 0x1
                sget-object v1, Lqm;->b:LWh;
                iput-boolean v0, v1, LWh;->b:Z
                new-instance v1, LEb;
                invoke-direct {v1}, LEb;-><init>()V
                invoke-virtual {p0, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application${'$'}ActivityLifecycleCallbacks;)V
                invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;
                move-result-object v1
                sput-object v1, LJm;->c:Ljava/io/File;
                iput-boolean v0, p0, Lapp/unnamed/rawrecording/UnnamedApp;->b:Z
                return v0
                """,
            )
        }

        // 2 & 3) Component factories: the guard conditional is preceded by
        // `move-result p0` of Ljava/lang/Boolean;->booleanValue()Z on the
        // supplied verdict. Replacing that move-result with `const/4 p0, 0x1`
        // forces the verdict to accepted (true) for both polarities
        // (`if-eqz` in instantiateActivity, `if-nez` in instantiateService).
        listOf(
            Triple(
                "Landroid/app/Activity;" to "instantiateActivity",
                Opcode.IF_EQZ,
                0,
            ),
            Triple(
                "Landroid/app/Service;" to "instantiateService",
                Opcode.IF_NEZ,
                0,
            ),
        ).forEach { (guard, opcode, guardOrdinal) ->
            val (returnType, name) = guard
            Fingerprint(
                definingClass = "Lapp/unnamed/rawrecording/InstallationComponentFactory;",
                name = name,
                returnType = returnType,
                parameters = listOf("Ljava/lang/ClassLoader;", "Ljava/lang/String;", "Landroid/content/Intent;"),
            ).method.apply {
                val instructions = implementation!!.instructions
                val guardIndices = instructions.mapIndexedNotNull { i, ins ->
                    if (ins.opcode == opcode) i else null
                }
                require(guardIndices.isNotEmpty()) { "$name: guard conditional not found" }
                val ifIdx = guardIndices[guardOrdinal]
                val moveIdx = ifIdx - 1
                require(moveIdx >= 0 && instructions.elementAt(moveIdx).opcode == Opcode.MOVE_RESULT) {
                    "$name: expected move-result before guard, got ${instructions.elementAt(moveIdx)}"
                }
                replaceInstruction(moveIdx, "const/4 p0, 0x1")
            }
        }
    }
}
