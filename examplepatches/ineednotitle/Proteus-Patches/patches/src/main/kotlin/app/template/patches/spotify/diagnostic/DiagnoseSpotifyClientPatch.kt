package app.template.patches.spotify.diagnostic

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.template.patches.shared.Constants.SPOTIFY_COMPATIBILITY
import app.template.patches.shared.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val HELPER = "Lapp/template/extension/extension/SpotifyDiagHook;"

private fun Instruction.packageInfoReference(): MethodReference? {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    val reference = getReference<MethodReference>() ?: return null
    if (reference.definingClass != "Landroid/content/pm/PackageManager;" || reference.name != "getPackageInfo") return null
    val parameters = reference.parameterTypes.map { it.toString() }
    return reference.takeIf {
        reference.returnType == "Landroid/content/pm/PackageInfo;" && parameters.size == 2 &&
            parameters[0] == "Ljava/lang/String;" &&
            parameters[1] in setOf("I", "Landroid/content/pm/PackageManager\$PackageInfoFlags;")
    }
}

// DIAGNOSTIC - not a fix. Logs signing-certificate queries and
// integrity-request outcomes without changing them. Does not log
// authentication tokens or account data. Experimental diagnostic, not a
// playback fix.
//
// What it observes (read-only):
//   • the running app's signing certificates (SHA-256, at startup and on every
//     getPackageInfo the app itself performs — only queries about the app's
//     own package are logged),
//   • the entry and outcome of the client-integrity verification (result
//     presence, failure class and HTTP code only — never messages or bodies),
//   • client-token acquisition outcomes (acquired / failure code — never the
//     token payload),
//   • native HTTP response status by allowlisted host/service category (never
//     raw URLs, paths or queries),
//   • home-load failures (cause chain and code identifiers only).
//
// Every hook forwards to the original code path unchanged; the logger is
// bounded and never throws into the app. The anchors (SpotifyApplication
// onCreate chain, home-failure event, integrity verification, token parser and
// HttpResponse constructor) are pinned to the 9.1.94.1929 build; a missing
// anchor fails the patch loudly at patch time.

@Suppress("unused")
val spotifyDiagnoseSpotifyClientPatch = bytecodePatch(
    name = "Diagnose Spotify client",
    description = "Logs signing-certificate queries and integrity-request outcomes without changing them. " +
        "Does not log authentication tokens or account data. Experimental diagnostic, not a playback fix.",
    default = false,
) {
    compatibleWith(SPOTIFY_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        // SpotifyApplication inherits onCreate in this build.
        var application = classDefBy("Lcom/spotify/music/SpotifyApplication;")
        while (application.methods.none { it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V" }) {
            application = runCatching { classDefBy(application.superclass ?: "") }.getOrNull()
                ?: throw PatchException("Could not find the application onCreate implementation")
        }
        val startup = mutableClassDefBy(application).methods.single {
            it.name == "onCreate" && it.parameterTypes.isEmpty() && it.returnType == "V" && it.implementation != null
        }
        startup.addInstructions(0, "invoke-static/range { p0 .. p0 }, $HELPER->onStartup(Landroid/content/Context;)V")

        // Observe the actual Home failure, not unrelated successful native requests.
        Fingerprint(
            definingClass = "Lcom/spotify/home/evopage/mobius/Event\$FailedToLoadHomeStructure;",
            name = "<init>",
            parameters = listOf("Ljava/lang/Throwable;", "Lp/ttd0;", "Ljava/lang/String;", "Z"),
        ).method.addInstructions(
            0,
            "invoke-static/range { p1 .. p1 }, $HELPER->onHomeFailure(Ljava/lang/Throwable;)V",
        )

        val homeFetch = Fingerprint(
            definingClass = "Lp/q62;",
            name = "b",
            parameters = listOf(
                "Ljava/lang/String;", "Lp/ttd0;", "Z", "Z", "Ljava/lang/String;",
                "Ljava/lang/String;", "Z", "Ljava/lang/String;", "Lp/ocm;",
            ),
            returnType = "Ljava/lang/Object;",
        ).method
        val statusReads = homeFetch.implementation!!.instructions.withIndex().filter { (_, instruction) ->
            val field = instruction.getReference<FieldReference>()
            instruction.opcode == Opcode.IGET && field?.definingClass == "Lp/d321;" &&
                field.name == "d" && field.type == "I"
        }.toList()
        if (statusReads.size != 1) throw PatchException("Home HTTP failure status path changed")
        statusReads.forEach { (index, instruction) ->
            val register = (instruction as TwoRegisterInstruction).registerA
            homeFetch.addInstructions(
                index + 1,
                "invoke-static/range { v$register .. v$register }, $HELPER->onHomeHttpStatus(I)V",
            )
        }

        // Only observe the verified request route; never alter the verdict or
        // coroutine state.
        val verification = Fingerprint(
            returnType = "Ljava/lang/Object;",
            parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "L"),
            filters = listOf(
                methodCall(definingClass = "Lcom/spotify/integrity/integrityimpl/proto/VerifyRequest;", name = "n"),
                string("Unknown error"),
            ),
        ).method
        val body = verification.implementation!!.instructions.toList()
        val insertions = mutableListOf<Pair<Int, String>>()
        body.forEachIndexed { index, instruction ->
            val reference = instruction.getReference<MethodReference>() ?: return@forEachIndexed
            if (reference.definingClass == "Lcom/spotify/integrity/integrityimpl/proto/VerifyResponse;" &&
                reference.returnType == "Ljava/lang/String;" && reference.parameterTypes.isEmpty()
            ) {
                val result = body.getOrNull(index + 1) as? OneRegisterInstruction
                    ?: throw PatchException("Integrity response register changed")
                if (body[index + 1].opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("Integrity response changed")
                insertions += index + 2 to
                    "invoke-static/range { v${result.registerA} .. v${result.registerA} }, $HELPER->onVerificationResponse(Ljava/lang/String;)V"
            }
            if (reference.definingClass == "Ljava/lang/Throwable;" && reference.name == "getMessage") {
                val register = (instruction as? FiveRegisterInstruction)?.registerC
                    ?: throw PatchException("Integrity exception register changed")
                insertions += index to
                    "invoke-static/range { v$register .. v$register }, $HELPER->onVerificationFailure(Ljava/lang/Throwable;)V"
            }
        }
        if (insertions.size != 2) throw PatchException("Expected one integrity response and one exception path")
        insertions.sortedByDescending { it.first }.forEach { (index, code) -> verification.addInstructions(index, code) }
        verification.addInstructions(0, "invoke-static {}, $HELPER->onVerificationStarted()V")

        val tokenResult = "Lcom/spotify/connectivity/auth/clienttoken/esperanto/proto/EsClientToken\$AcquireResult;"
        val tokenFailure = "Lcom/spotify/connectivity/auth/clienttoken/esperanto/proto/EsClientToken\$AcquireFailure;"
        if (!classDefBy(tokenResult).fields.map { it.name }.containsAll(listOf("resultCase_", "result_")) ||
            classDefBy(tokenFailure).fields.none { it.name == "code_" && it.type == "I" }
        ) throw PatchException("Client token diagnostic schema changed")
        val tokenParser = Fingerprint(
            definingClass = tokenResult,
            parameters = listOf("[B"),
            returnType = tokenResult,
        ).method
        val tokenReturns = tokenParser.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_OBJECT }.toList()
        if (tokenReturns.size != 1) throw PatchException("Client token parser return changed")
        tokenReturns.forEach { (index, instruction) ->
            val register = (instruction as OneRegisterInstruction).registerA
            tokenParser.addInstructions(
                index,
                "invoke-static/range { v$register .. v$register }, $HELPER->onClientTokenResult(Ljava/lang/Object;)V",
            )
        }

        // Native HTTP responses cross this constructor. Do not pass headers or
        // bodies to the logger.
        Fingerprint(
            definingClass = "Lcom/spotify/core/http/HttpResponse;",
            name = "<init>",
            parameters = listOf("I", "Ljava/lang/String;", "Ljava/lang/String;"),
        ).method.addInstructions(
            0,
            "invoke-static/range { p1 .. p2 }, $HELPER->onHttpResponse(ILjava/lang/String;)V",
        )

        // Wrap every getPackageInfo call the app makes about its own package
        // (signing-certificate queries) so the result can be observed.
        var observedCalls = 0
        val callers = mutableListOf<String>()
        classDefForEach { classDef ->
            if (!classDef.type.startsWith("Lapp/template/extension/") && classDef.methods.any { method ->
                    method.implementation?.instructions?.any { it.packageInfoReference() != null } == true
                }) callers += classDef.type
        }
        callers.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                method.implementation?.instructions?.toList()?.forEachIndexed { index, instruction ->
                    val reference = instruction.packageInfoReference() ?: return@forEachIndexed
                    val parameters = reference.parameterTypes.joinToString("")
                    val target = "$HELPER->getPackageInfo(Landroid/content/pm/PackageManager;$parameters)Landroid/content/pm/PackageInfo;"
                    val call = when (instruction) {
                        is FiveRegisterInstruction ->
                            "invoke-static { v${instruction.registerC}, v${instruction.registerD}, v${instruction.registerE} }, $target"

                        is RegisterRangeInstruction ->
                            "invoke-static/range { v${instruction.startRegister} .. v${instruction.startRegister + 2} }, $target"

                        else -> throw PatchException("Unexpected package info invocation")
                    }
                    method.replaceInstruction(index, call)
                    observedCalls++
                }
            }
        }
        if (observedCalls == 0) throw PatchException("No package info queries found")
    }
}
