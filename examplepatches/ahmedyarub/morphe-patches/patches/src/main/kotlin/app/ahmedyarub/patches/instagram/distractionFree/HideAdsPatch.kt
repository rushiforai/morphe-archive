package app.ahmedyarub.patches.instagram.distractionFree

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.library.instagram.patches.overrideMobileConfigBooleanFlag
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.getFreeRegisterProvider
import app.morphe.util.getReference
import app.morphe.util.registersUsed
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/**
 * Adapted from brosssh's Instagram patches.
 * https://github.com/brosssh/morphe-patches
 *
 * The method reporting whether a feed item is an ad pod. Anchored on a log string rather than
 * on any obfuscated name, which is why it has survived app updates unchanged.
 */
private object DisableAdsFingerprint : Fingerprint(
    strings = listOf("Is ad pod"),
)

/**
 * Adapted from piko <https://github.com/crimera/piko>, GPLv3.
 *
 * The item filter of contextual feeds, the Following feed among them. Its first check is for
 * the self profile feed.
 */
private object ContextualFeedFilterFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/Object;"),
    filters = listOf(string("feed_contextual_self_profile")),
)

/** Where the ad controller inserts an ad into the timeline. It asks the ad's Media whether it is one. */
private object FeedAdInsertionFingerprint : Fingerprint(
    returnType = "Z",
    filters = listOf(
        string("instagram_ad_async_ad_controller_action_success"),
        string("timeline_request"),
    ),
)

/**
 * `ig_android_controller_migration::use_v2_controller`.
 *
 * Turning the v2 feed controller off keeps the app on the path where the ad pod check above
 * is actually consulted.
 */
private const val USE_V2_CONTROLLER_FLAG = "110800::0"

private const val MEDIA = "Lcom/instagram/feed/media/Media;"

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Hides ads in the feed and in the Following feed.",
    default = true
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(
        overrideMobileConfigBooleanFlag(
            override = USE_V2_CONTROLLER_FLAG to false
        )
    )

    execute {
        DisableAdsFingerprint.method.returnEarly(false)

        fun List<Instruction>.uniqueVirtualCall(predicate: (MethodReference) -> Boolean) =
            filter { it.opcode == Opcode.INVOKE_VIRTUAL || it.opcode == Opcode.INVOKE_VIRTUAL_RANGE }
                .mapNotNull { it.getReference<MethodReference>() }
                .filter(predicate)
                .distinctBy { it.toString() }
                .singleOrNull()

        // Up to 452 the controller calls Media's is-ad getter; from 453 it calls the getter's static
        // helper inline, and the getter is the one Media boolean getter calling that helper.
        val insertion = FeedAdInsertionFingerprint.method.instructions.toList()
        val isAd = insertion.uniqueVirtualCall {
            it.definingClass == MEDIA && it.parameterTypes.isEmpty() && it.returnType == "Z"
        }?.name ?: run {
            val helpers = insertion.filter { it.opcode == Opcode.INVOKE_STATIC }
                .mapNotNull { it.getReference<MethodReference>() }
                .filter { it.returnType == "Z" && it.parameterTypes.size == 1 }
                .map { it.toString() }
                .toSet()
            classDefBy(MEDIA).methods.filter { getter ->
                getter.returnType == "Z" && getter.parameterTypes.isEmpty() &&
                    getter.implementation?.instructions?.any { it.getReference<MethodReference>()?.toString() in helpers } == true
            }.singleOrNull()?.name
        }?.let { name -> "$MEDIA->$name()Z" } ?: throw PatchException("The ad controller does not ask Media whether it is an ad once")

        // The Following feed gets its ads in its own response, so the ad pod check above never
        // sees them. The filter now rejects any item whose Media is an ad.
        ContextualFeedFilterFingerprint.method.apply {
            val code = instructions
            val cast = code.first()
            val itemType = cast.getReference<TypeReference>()?.type
            val parameterRegister = implementation!!.registerCount - 1
            if (AccessFlags.STATIC.isSet(accessFlags) || cast.opcode != Opcode.CHECK_CAST ||
                cast.registersUsed != listOf(parameterRegister) || itemType == null
            ) {
                throw PatchException("The contextual feed filter does not start by casting its item")
            }

            val getMedia = code.uniqueVirtualCall {
                it.definingClass == itemType && it.parameterTypes.isEmpty() && it.returnType == MEDIA
            } ?: throw PatchException("The contextual feed filter does not read the item's Media once")

            val register = getFreeRegisterProvider(index = 1, numberOfFreeRegistersNeeded = 1).getFreeRegister()
            addInstructionsWithLabels(
                1,
                """
                if-eqz p1, :original
                invoke-virtual/range { p1 .. p1 }, $getMedia
                move-result-object v$register
                if-eqz v$register, :original
                invoke-virtual/range { v$register .. v$register }, $isAd
                move-result v$register
                if-eqz v$register, :original
                const/4 v$register, 0x0
                return v$register
                """,
                ExternalLabel("original", code[1]),
            )
        }
    }
}
