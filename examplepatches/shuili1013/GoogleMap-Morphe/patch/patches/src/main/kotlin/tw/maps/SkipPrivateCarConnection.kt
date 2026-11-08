package tw.maps

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.SupportedAbi
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Maps 26.44's global CarConnectionHandler.onCarConnected (`pxt.b()`) calls Android Auto's
 * private car service through the `Lbeop;` token (`ltf.x(5, ...)`). Android Auto only serves
 * Google-signed callers, so a re-signed Maps gets
 * `SecurityException: Wrong signature - go/gearhead-retail-device`, uncaught on the main
 * thread, and the whole app dies while the native car adapter is starting
 * (shown on the head unit as "Maps isn't responding").
 *
 * A re-signed Maps can never use that private channel, so skip the handler -- the same
 * outcome as its own "service is not created" early return. The Dutch native-navigation
 * adapter draws the car screen over its own separate connection and does not need it.
 */
@Suppress("unused")
val skipPrivateCarConnection = bytecodePatch(
    name = "Skip private Android Auto car connection",
    description = "26.44.06.1006895251 only. Stops a re-signed Maps from crashing when Android Auto " +
        "rejects its private car-service call (\"Wrong signature\"). Needed for native navigation on Android Auto.",
    default = true,
) {
    compatibleWith(
        Compatibility(
            name = "Google Maps",
            packageName = "com.google.android.apps.maps",
            apkFileType = ApkFileType.APKM,
            targets = listOf(
                AppTarget(
                    version = "26.44.06.1006895251",
                    versionCodes = mapOf(SupportedAbi.ARM64_V8A to 1068856906),
                    isExperimental = true,
                ),
            ),
        ),
    )
    execute {
        val method = mutableClassDefBy("Lpxt;").methods.singleOrNull {
            it.name == "b" && it.parameterTypes.isEmpty() && it.returnType == "V"
        } ?: throw PatchException("pxt.b() not found; Maps changed")
        val instructions = method.implementation?.instructions?.toList()
            ?: throw PatchException("pxt.b() has no body")

        // Fingerprint: this must be CarConnectionHandler.onCarConnected calling the private service.
        val isHandler = instructions.any {
            (it.opcode == Opcode.CONST_STRING || it.opcode == Opcode.CONST_STRING_JUMBO) &&
                ((it as ReferenceInstruction).reference as StringReference).string == "CarConnectionHandler.onCarConnected"
        }
        val callsPrivateService = instructions.any {
            val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
            ref?.definingClass == "Lltf;" && ref.name == "x"
        }
        if (!isHandler || !callsPrivateService) {
            throw PatchException("pxt.b() is no longer CarConnectionHandler.onCarConnected; Maps changed")
        }
        if (instructions.first().opcode == Opcode.RETURN_VOID) throw PatchException("Already applied")

        method.addInstructions(0, "return-void")
    }
}
