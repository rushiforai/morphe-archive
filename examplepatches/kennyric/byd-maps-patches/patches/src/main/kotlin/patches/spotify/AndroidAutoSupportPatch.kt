package patches.spotify

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.returnEarly
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import patches.shared.androidAutoHostVisibility

private const val CAR_APP_BINDER = "Landroidx/car/app/CarAppBinder;"
private const val HOST_VALIDATOR_FACTORY = "getHostValidator"
private val CAR_APP_HOST_VALIDATOR_PARAMETERS = listOf(
    "Landroid/content/pm/PackageManager;", "Ljava/util/HashMap;", "Z",
)

/** Packages Google's Android Auto and Spotify's own test harness report as the car host. */
private val GOOGLE_CAR_HOSTS = setOf(
    "com.google.android.projection.gearhead",
    "com.spotify.auto.mediatest",
)

/**
 * Android Auto support for every car system, not only Google's.
 *
 * Spotify ships Google's Car App Library 1.9 for its own car screen. That screen is where
 * Home, Library, Search and Liked Songs live, and the library validates its host against a
 * bundled allow-list, so third party Android Auto systems only got the legacy media browser
 * (Home without the library). This patch:
 *
 * - accepts every host in the Car App Library host validator, so the car screen connects;
 * - accepts every media-browser caller in the media-browser admission check;
 * - offers the Browse, Recently played and Your Library roots to every host instead of only
 *   Google's Android Auto and Spotify's media test harness;
 * - accepts every host package in the media-browser root filters;
 * - allows the app to resolve any installed host package on Android 11 and newer.
 *
 * Spotify's account, catalogue, playback and signing services are unchanged.
 */
@Suppress("unused")
val spotifyAndroidAutoSupport = bytecodePatch(
    name = "Android Auto support",
    description = "Allows compatible Android Auto hosts to connect to Spotify's native car " +
        "screen and browse Home, Recently played and Library.",
    default = true,
) {
    compatibleWith(spotifyAndroidAuto)
    dependsOn(originalAndroidAutoInput, androidAutoHostVisibility)

    execute {
        // 1. Car App Library host validator: its last constructor argument is the "accept any
        // host" switch. Spotify passes false, which enforces its bundled allow-list.
        val binder = mutableClassDefBy(CAR_APP_BINDER)
        val validatorFactory = binder.methods.singleOrNull { it.name == HOST_VALIDATOR_FACTORY }
            ?: throw PatchException("Spotify car app host validator changed")
        val constructors = validatorFactory.implementation!!.instructions.withIndex().filter { (_, instruction) ->
            if (instruction.opcode != Opcode.INVOKE_DIRECT && instruction.opcode != Opcode.INVOKE_DIRECT_RANGE) {
                return@filter false
            }
            val reference = instruction.getReference<MethodReference>() ?: return@filter false
            reference.name == "<init>" &&
                reference.parameterTypes.map(CharSequence::toString) == CAR_APP_HOST_VALIDATOR_PARAMETERS
        }.toList()
        check(constructors.size == 1) { "Spotify car app host validator construction changed" }
        val (constructorIndex, constructor) = constructors.single()
        val allowAllRegister = (constructor as? FiveRegisterInstruction)?.registerF
            ?: throw PatchException("Spotify car app host validator arguments changed")
        validatorFactory.addInstruction(constructorIndex, "const/4 v$allowAllRegister, 0x1")

        // 2. Media-browser admission: accepts any caller package/uid.
        val admission = Fingerprint(
            returnType = "Z",
            parameters = listOf("I", "Ljava/lang/String;"),
            strings = listOf("android.media.session.MediaController"),
        ).method
        admission.returnEarly(true)

        // 3. Media-browser roots: every gearhead/mediatest comparison becomes true, so Browse,
        // Recently played and Your Library are offered to every host. The other conditions of
        // each filter stay untouched.
        val rootFilter = Fingerprint(
            returnType = "Z",
            parameters = listOf("L"),
            strings = listOf(
                "com.spotify.browse", "com.spotify.recently-played",
                "com.spotify.your-library", "com.google.android.projection.gearhead",
            ),
        ).method
        val instructions = rootFilter.implementation!!.instructions.toList()
        val carHostRegisters = instructions.filterIsInstance<ReferenceInstruction>()
            .filter { instruction ->
                instruction.opcode == Opcode.CONST_STRING &&
                    (instruction.reference as? StringReference)?.string in GOOGLE_CAR_HOSTS
            }
            .map { (it as OneRegisterInstruction).registerA }
            .toSet()
        check(carHostRegisters.isNotEmpty()) { "Spotify car host constants changed" }

        val verdicts = instructions.indices.filter { index ->
            val instruction = instructions[index]
            if (instruction.opcode != Opcode.INVOKE_STATIC) return@filter false
            val reference = instruction.getReference<MethodReference>() ?: return@filter false
            val secondArgument = when (instruction) {
                is FiveRegisterInstruction -> instruction.registerD
                is RegisterRangeInstruction -> instruction.startRegister + 1
                else -> return@filter false
            }
            reference.parameterTypes.size == 2 && secondArgument in carHostRegisters &&
                instructions.getOrNull(index + 1)?.opcode == Opcode.MOVE_RESULT
        }
        check(verdicts.isNotEmpty()) { "Spotify car host checks changed" }
        verdicts.forEach { index ->
            val register = (instructions[index + 1] as OneRegisterInstruction).registerA
            rootFilter.replaceInstruction(index + 1, "const/4 v$register, 0x1")
        }

        // 4. The AA root provider has its own caller allow-list, separate from admission and
        // child-loader filters. Identify it by the root it actually supplies; the class with
        // gearhead and driving-mode constants is a metrics filter, not this provider.
        val rootProvider = Fingerprint(
            returnType = "Ljava/lang/String;",
            parameters = emptyList(),
            strings = listOf("spotify_media_browser_root_android_auto"),
        ).method.definingClass
        val acceptsCaller = mutableClassDefBy(rootProvider).methods
            .singleOrNull { method ->
                method.implementation != null && method.returnType == "Z" &&
                    method.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/String;") &&
                    GOOGLE_CAR_HOSTS.all { host ->
                        method.implementation!!.instructions.any { it.referencesString(host) }
                    }
            }
            ?: throw PatchException("Spotify Android Auto root-provider caller allow-list changed")
        acceptsCaller.returnEarly(true)
    }
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.referencesString(value: String): Boolean =
    opcode == Opcode.CONST_STRING && (this as? ReferenceInstruction)?.let {
        (it.reference as? StringReference)?.string == value
    } == true
