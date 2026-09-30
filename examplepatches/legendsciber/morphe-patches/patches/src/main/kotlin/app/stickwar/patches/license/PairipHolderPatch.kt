package app.stickwar.patches.license

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.stickwar.patches.shared.Constants.COMPATIBILITY_STICKWAR
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val HOLDER = "Lcom/google/android/gms/common/signatureverification/jSPC/FqbnDGC;"

private val HOLDER_FIELDS = listOf(
    "AxIxOs", "CVpalAmh", "CWGMOjjM", "FBxfhbAU", "HNuuB", "IdWoxVmcycu", "IuN", "IvvjrfepPjdilP",
    "KKhv", "NmvqxxlvXacfA", "PitAnABPKPoSm", "Pqg", "SsgxMWqJu", "UJHpMuke", "Uqq", "UvNUsIDNqGqdN",
    "VKilUZ", "WEJNNe", "XjvihEui", "YCtznLwLCc", "bPUfsLluOmUPE", "dBvUYtGaBDpIvP", "dGlS",
    "dOSIpAhrgMWe", "dTkZICeoAnUlR", "epiwuVcNFfObBv", "fWDqKsY", "fvDuKaYpuJu", "gJf",
    "htfJubBvw", "jUtBXEbfW", "ksFULTEoKOog", "ktLNDwyzGv", "nHMNLmG", "nkvCzhkgGkvMsY", "oWZatAKJdTu",
    "qkRdGmUOx", "rbkTq", "rnotOMb", "rzGxc", "sgEwaxGrx", "ttCpVuru", "uMpN", "uViXjSrNyMxN",
    "vLt", "vtfVGkjppp", "wLwXmiDGzaKQIR", "ylu", "zQDph",
)

/**
 * PairIP ships its obfuscated string constants in holder classes that contain
 * *only* field declarations — no methods, no `<clinit>`. The native VM program
 * normally fills them in at startup. With `VMRunner.invoke` neutralised they stay
 * `null`, and the first Java code that reads one dies:
 *
 * ```
 * java.lang.NullPointerException: Null libraryName
 *   at com.google.firebase.platforminfo.AutoValue_LibraryVersion.<init>
 *   at com.google.firebase.FirebaseCommonRegistrar.getComponents
 * ```
 *
 * `FirebaseCommonRegistrar.getComponents` is the only reader of
 * `FqbnDGC.FBxfhbAU` in the whole APK. Rather than patch the AutoValue-generated
 * constructor (a constructor must still call `super()`, so it cannot simply be
 * nop'd), this patch synthesises the missing `<clinit>` and assigns `""` to every
 * String field, so any holder read yields an empty string instead of null.
 *
 * The method is only added when the class genuinely has no `<clinit>` yet, and the
 * whole holder step is skipped when the class is absent.
 */
@Suppress("unused")
val stickWarPairipHolderPatch = bytecodePatch(
    name = "Stick War PairIP string holder init",
    description = "Adds the missing <clinit> to the PairIP string holder so its constants are empty strings instead of null.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_STICKWAR)

    execute {
        val holder = mutableClassDefByOrNull(HOLDER) ?: return@execute
        if (holder.methods.any { it.name == "<clinit>" }) return@execute
        val clinit = ImmutableMethod(
            HOLDER,
            "<clinit>",
            emptyList(),
            "V",
            AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value,
            null,
            null,
            ImmutableMethodImplementation(1, emptyList(), null, null),
        ).toMutable()
        holder.methods.add(clinit)
        val body = buildString {
            append("const-string v0, \"\"\n")
            for (field in HOLDER_FIELDS) {
                append("sput-object v0, $HOLDER->$field:Ljava/lang/String;\n")
            }
            append("return-void")
        }
        clinit.addInstructions(0, body)
    }
}
