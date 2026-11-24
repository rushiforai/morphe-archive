package app.fluffy.patches.galaxymaxhz.unlock

import app.fluffy.patches.galaxymaxhz.ApkHashFeederFingerprint
import app.fluffy.patches.galaxymaxhz.LicenseInfoBuilderFingerprint
import app.fluffy.patches.galaxymaxhz.LicenseRefreshFingerprint
import app.fluffy.patches.galaxymaxhz.LoadingGateFingerprint
import app.fluffy.patches.galaxymaxhz.ProfileConfigFetcherFingerprint
import app.fluffy.patches.galaxymaxhz.RemoteProfilesCallFingerprint
import app.fluffy.patches.galaxymaxhz.SignedRequestLauncherFingerprint
import app.fluffy.patches.galaxymaxhz.VerdictGFingerprint
import app.fluffy.patches.galaxymaxhz.VerdictHFingerprint
import app.fluffy.patches.shared.Constants.COMPATIBILITY_GALAXYMAXHZ
import app.fluffy.patches.waypoint.clearBody
import app.fluffy.patches.waypoint.ensureRegisters
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction11x
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction22c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction31i
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// Static part of the licence server response. Everything version-specific is
// computed at runtime: the licence type comes from xf/b.f * xf/b.h and the
// update-check keys echo the installed package version, so the check always
// completes with "up to date" without carrying release metadata that would
// go stale.
private const val OFFLINE_LICENSE_BASE_JSON =
    "{\"0x0\":0,\"0x11\":0,\"0x9\":\"01/01/2099 00:00:00\"," +
        "\"0x4\":\"GPA-LOCAL-PREMIUM\"," +
        "\"0x24\":\"https://forum.xda-developers.com/conversations/add?to=tribalfs\"," +
        "\"0x12\":\"https://api.tribalfs.com/gmh/buy\"," +
        "\"0x36\":\"https://github.com/tribalfs/GalaxyMaxHzPub/wiki/Frequently-Asked-Questions-(FAQs)\"," +
        "\"0x8\":true,\"0x6\":true,\"0x7\":\"Premium\"}"

private fun Instruction?.methodReference(): MethodReference? =
    (this as? ReferenceInstruction)?.reference as? MethodReference

private fun Method.indexOfCall(definingClass: String, name: String): Int =
    instructions.indexOfFirst { instruction ->
        val reference = instruction.methodReference()
        reference?.definingClass == definingClass && reference.name == name
    }

private fun Method.requireCall(definingClass: String, name: String): Int {
    val index = indexOfCall(definingClass, name)
    if (index < 0) throw PatchException("$name call not found ($definingClass)")
    return index
}

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks premium locally and fully offline. Every signed licence " +
        "and config request is answered with a valid premium response, the startup " +
        "APK self-check that would keep the app loading forever is bypassed, and " +
        "refresh-rate profiles come from the app's own bundled device table. The " +
        "licence server never validates a re-signed install, so no server connection " +
        "is needed or attempted.",
) {
    compatibleWith(COMPATIBILITY_GALAXYMAXHZ)

    execute {
        // Feed the native tamper init back the hash it passed in. The stored
        // field is taken from the original body (it moved between versions)
        // and returning the caller's own value satisfies the comparison on
        // any build.
        ApkHashFeederFingerprint.method.apply {
            val storedField = instructions
                .filter { it.opcode == Opcode.SPUT_WIDE }
                .mapNotNull { (it as? ReferenceInstruction)?.reference as? FieldReference }
                .singleOrNull()
                ?: throw PatchException("stored-hash field not found in the hash feeder")
            clearBody()
            addInstructions(
                0,
                """
                sput-wide p1, ${storedField.definingClass}->${storedField.name}:J
                return-wide p1
                """.trimIndent(),
            )
        }

        // Build the licence-info object directly with the premium licence
        // type (xf/b.f * xf/b.h, computed at runtime) and no expiry.
        LicenseInfoBuilderFingerprint.method.apply {
            ensureRegisters(13)
            clearBody()
            addInstructions(
                0,
                """
                sget v1, Lxf/b;->f:I
                sget v2, Lxf/b;->h:I
                mul-int/2addr v1, v2
                invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
                move-result-object v1
                move-object/from16 v2, p5
                const-wide/16 v3, 0x0
                invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
                move-result-object v3
                const/4 v5, 0x1
                new-instance v6, Landroidx/appcompat/util/SeslUtil;
                invoke-direct {v6, v1, v2, v3, v5}, Landroidx/appcompat/util/SeslUtil;-><init>(Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Long;Z)V
                return-object v6
                """.trimIndent(),
            )
        }

        VerdictGFingerprint.method.apply {
            ensureRegisters(1)
            clearBody()
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }
        VerdictHFingerprint.method.apply {
            ensureRegisters(1)
            clearBody()
            addInstructions(0, "const/4 v0, 0x1\nreturn v0")
        }

        // The licence-info constructor stores its boolean flag straight into
        // the field; force that flag to premium before the store.
        mutableClassDefBy("Landroidx/appcompat/util/SeslUtil;")
            .methods.first {
                it.name == "<init>" &&
                    it.parameterTypes == listOf(
                        "Ljava/lang/Integer;",
                        "Ljava/lang/String;",
                        "Ljava/lang/Long;",
                        "Z",
                    )
            }.apply { addInstructions(0, "const/4 p4, 0x1") }

        // Read the bundled profile table (the same raw resource the original
        // call passes to the native reader) in Java, so a re-signed install
        // still gets the bundled per-device entry. Registers and the resource
        // id come from the original instructions.
        RemoteProfilesCallFingerprint.method.apply {
            val callIndex = requireCall("Lt0/c1;", "z")
            if (instructions.getOrNull(callIndex + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("profile-table call is not followed by move-result-object")
            }
            val invoke = instructions[callIndex] as? Instruction35c
                ?: throw PatchException("profile-table call is not a 35c invoke")
            val context = invoke.registerD
            val scanner = invoke.registerC
            val idRegister = invoke.registerE
            val result = (instructions[callIndex + 1] as Instruction11x).registerA
            if (context == scanner || context == idRegister) {
                throw PatchException("profile-table call reuses the context register")
            }
            val idInstruction = instructions.take(callIndex)
                .mapNotNull { it as? Instruction31i }
                .lastOrNull { it.registerA == idRegister }
                ?: throw PatchException("profile-table resource id not found before the call")
            val hex = java.lang.Long.toHexString(
                (idInstruction as com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction).narrowLiteral.toLong() and 0xffffffffL,
            )
            removeInstructions(callIndex, 2)
            addInstructions(
                callIndex,
                """
                invoke-virtual {v$context}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;
                move-result-object v$result
                const v$idRegister, 0x$hex
                invoke-virtual {v$result, v$idRegister}, Landroid/content/res/Resources;->openRawResource(I)Ljava/io/InputStream;
                move-result-object v$result
                new-instance v$scanner, Ljava/util/Scanner;
                invoke-direct {v$scanner, v$result}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V
                const-string v$result, "\\A"
                invoke-virtual {v$scanner, v$result}, Ljava/util/Scanner;->useDelimiter(Ljava/lang/String;)Ljava/util/Scanner;
                move-result-object v$scanner
                invoke-virtual {v$scanner}, Ljava/util/Scanner;->next()Ljava/lang/String;
                move-result-object v$result
                new-instance v$idRegister, Lorg/json/JSONObject;
                invoke-direct {v$idRegister, v$result}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
                move-object v$result, v$idRegister
                """.trimIndent(),
            )
        }

        // Answer every signed request synchronously with the offline premium
        // response; the callers' own parsers store and apply it. The licence
        // type and the update-check keys are computed at runtime.
        SignedRequestLauncherFingerprint.method.apply {
            ensureRegisters(11)
            clearBody()
            val smaliJson = OFFLINE_LICENSE_BASE_JSON.replace("\"", "\\\"")
            addInstructions(
                0,
                """
                const-string v0, "$smaliJson"
                new-instance v1, Lorg/json/JSONObject;
                invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
                sget v3, Lxf/b;->f:I
                sget v4, Lxf/b;->h:I
                mul-int/2addr v3, v4
                const-string v2, "0x10"
                invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
                iget-object v2, p0, Lka/e;->a:Landroid/content/Context;
                invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;
                move-result-object v0
                invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
                move-result-object v3
                const/4 v4, 0x0
                invoke-virtual {v0, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;
                move-result-object v0
                const-string v3, "latestVersion"
                iget-object v4, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
                invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v3, "latestVersionCode"
                iget v4, v0, Landroid/content/pm/PackageInfo;->versionCode:I
                invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
                const-string v3, "url"
                const-string v4, ""
                invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v3, "releaseNotes"
                new-instance v4, Lorg/json/JSONArray;
                invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V
                invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
                const-string v3, "updateId"
                const/4 v4, 0x1
                invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
                new-instance v2, Lka/c;
                invoke-direct {v2, v1}, Lka/c;-><init>(Lorg/json/JSONObject;)V
                return-object v2
                """.trimIndent(),
            )
        }

        // The one caller that must not see that response (it expects the
        // server-tuned profile array) fails cleanly onto the bundled table.
        // The output and a dead argument register come from the original call.
        ProfileConfigFetcherFingerprint.method.apply {
            val callIndex = requireCall("Lka/e;", "b")
            if (instructions.getOrNull(callIndex + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) {
                throw PatchException("signed-request call is not followed by move-result-object")
            }
            val result = (instructions[callIndex + 1] as Instruction11x).registerA
            val temp = when (val invoke = instructions[callIndex]) {
                is Instruction3rc -> invoke.startRegister
                is Instruction35c -> invoke.registerC
                else -> throw PatchException("unexpected invoke format at the signed-request call")
            }
            if (result == temp) {
                throw PatchException("signed-request call reuses its result register")
            }
            removeInstructions(callIndex, 2)
            addInstructions(
                callIndex,
                """
                new-instance v$result, Lka/a;
                const-string v$temp, "offline"
                invoke-direct {v$result, v$temp}, Lka/a;-><init>(Ljava/lang/String;)V
                """.trimIndent(),
            )
        }

        // The licence refresh awaits a pending-request flow that nothing feeds
        // without the donate-app activation; send the request with no
        // parameters instead of parking forever. The branch is located by the
        // field read that precedes it, whatever the field's class is.
        LicenseRefreshFingerprint.method.apply {
            val impl = implementation!!
            var branchIndex = -1
            for (i in 1 until impl.instructions.size) {
                val previous = impl.instructions[i - 1]
                if (previous is Instruction22c &&
                    previous.reference is FieldReference &&
                    (previous.reference as FieldReference).name == "r" &&
                    impl.instructions[i].opcode == Opcode.IF_NEZ
                ) {
                    branchIndex = i
                    break
                }
            }
            if (branchIndex < 0) throw PatchException("pending-request await branch not found")
            val target = (impl.instructions[branchIndex] as BuilderInstruction21t).target
            replaceInstruction(branchIndex, BuilderInstruction10t(Opcode.GOTO, target))
        }

        // The loading-state clear compares the stored hash against the runtime
        // Adler-32 of the installed dex; a patched dex can never match.
        LoadingGateFingerprint.method.apply {
            val impl = implementation!!
            var branchIndex = -1
            for (i in 1 until impl.instructions.size) {
                if (impl.instructions[i - 1].opcode == Opcode.CMP_LONG &&
                    impl.instructions[i].opcode == Opcode.IF_EQZ
                ) {
                    branchIndex = i
                    break
                }
            }
            if (branchIndex < 0) throw PatchException("hash comparison branch not found")
            val target = (impl.instructions[branchIndex] as BuilderInstruction21t).target
            replaceInstruction(branchIndex, BuilderInstruction10t(Opcode.GOTO, target))
        }
    }
}
