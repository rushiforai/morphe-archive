package app.timetree.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.bytecodePatch
import app.timetree.patches.shared.ACC_STATIC
import app.timetree.patches.shared.ADS_AD_EMPTY
import app.timetree.patches.shared.AdsStreamFingerprint
import app.timetree.patches.shared.PACKAGE_NAME
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Short-circuits the ad pipeline at its source by making the ad stream lambda emit
 * `AdsAdModel.Empty` instead of a real ad.
 *
 * The lambda is located by [AdsStreamFingerprint] (an unobfuscated domain type it captures),
 * so obfuscated class and method names never matter.
 *
 * To emit the empty stream the patch must call whatever RxJava factory the app itself was
 * compiled against, with the exact descriptor. R8 renames `Observable.just` to something like
 * `f` *and* narrows its return type to `ObservableJust`, and ART resolves calls on the exact
 * name+descriptor pair, so a hand-written reference resolves to nothing. Three sources are
 * tried in order:
 *
 * 1. a static RxJava call inside the lambda itself (copied verbatim),
 * 2. any other static call in the lambda taking a single `Object`,
 * 3. a static `(Object) -> Lio/reactivex/...` method found on `io.reactivex.Observable`.
 *
 * If none exists — which happens when upstream moves the ad stream off RxJava — the patch
 * logs what it saw and stays out of the way instead of failing the whole patching run. The
 * other two patches still apply, so the app ends up without splash ads and with every ad slot
 * switch disabled.
 */
@Suppress("unused")
val removeInFeedAdsPatch = bytecodePatch(
    name = "Remove in-app ads",
    description = "Emits AdsAdModel.Empty for every ad placement, so calendar banners, " +
        "in-feed ad cards and premium-upsell ad slots are never rendered. " +
        "Anchored on unobfuscated domain types and reuses the app's own method ids.",
) {
    compatibleWith(
        Compatibility(
            packageName = PACKAGE_NAME,
            name = "TimeTree",
            description = "Shared calendar app. Patch targets the ad stream of the free build.",
            apkFileType = ApkFileType.APK,
            targets = listOf(AppTarget(version = null)),
        ),
    )

    execute {
        val emptyClass = classDefBy(ADS_AD_EMPTY)
        val singleton = emptyClass.fields.firstOrNull {
            it.type == ADS_AD_EMPTY && (it.accessFlags and ACC_STATIC) != 0
        } ?: throw IllegalStateException(
            "AdsAdModel.Empty no longer exposes a static instance field",
        )

        val original = AdsStreamFingerprint.originalMethod
        val instructions = original.implementation?.instructions?.toList().orEmpty()

        val staticCalls: List<MethodReference> = instructions
            .filterIsInstance<ReferenceInstruction>()
            .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
            .mapNotNull { it.reference as? MethodReference }

        val fromLambda = staticCalls
            .firstOrNull { reference ->
                reference.parameterTypes.size == 1 &&
                    reference.parameterTypes[0] == "Ljava/lang/Object;" &&
                    (reference.definingClass.startsWith("Lio/reactivex/") ||
                        reference.returnType.startsWith("Lio/reactivex/"))
            }
            ?.let(::describe)
            ?: staticCalls
                .firstOrNull { reference ->
                    reference.parameterTypes.size == 1 &&
                        reference.parameterTypes[0] == "Ljava/lang/Object;"
                }
                ?.let(::describe)

        // Two sources, both taken from the app itself, so the descriptor is always the one
        // that build was compiled against.
        val call = fromLambda

        if (call == null) {
            println(
                "TimeTreeAdsPatch: 'Remove in-app ads' skipped. " +
                    "Lambda ${original.name} in ${AdsStreamFingerprint.originalClassDef.type} " +
                    "no longer calls a static RxJava factory, so the ad stream is built some " +
                    "other way. Static calls seen: " +
                    staticCalls.joinToString { describe(it) },
            )
            return@execute
        }

        println("TimeTreeAdsPatch: 'Remove in-app ads' injecting $call")

        AdsStreamFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, $ADS_AD_EMPTY->${singleton.name}:$ADS_AD_EMPTY
                invoke-static {v0}, $call
                move-result-object v0
                return-object v0
            """,
        )
    }
}

private fun describe(reference: MethodReference): String = buildString {
    append(reference.definingClass)
    append("->")
    append(reference.name)
    append("(")
    reference.parameterTypes.forEach { append(it) }
    append(")")
    append(reference.returnType)
}

