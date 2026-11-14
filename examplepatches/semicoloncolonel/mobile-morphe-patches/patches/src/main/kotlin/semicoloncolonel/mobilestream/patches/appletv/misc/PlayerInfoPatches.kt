package semicoloncolonel.mobilestream.patches.appletv.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import semicoloncolonel.mobilestream.patches.appletv.shared.Constants
import semicoloncolonel.mobilestream.patches.shared.misc.returnEarly

// Apple TV phone app 3.0.0. Each stream carries its title's details as HLS
// session data ("com.apple.hls.*"), which the player reads into one object,
// SessionData: the time the credits start (upNextStart), the rating card
// shown for a few seconds when a title starts (ratingImage and advisory
// lines), product placement notices, and photosensitivity and high-motion
// warnings.
//
// At the end of SessionData's constructor, PlayerInfo.decorate changes it as
// the patches below choose. Field names come from SessionData's own toString
// labels ("upNextStart=", "ratingImage=", ...).
//
// The Android TV app shares the package name but not this code, so these
// patches do nothing there.

private const val INFO = "Lsemicoloncolonel/mobilestream/extension/appletv/PlayerInfo;"

internal object SessionDataToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf(", rtAudienceScore="),
)

// PostPlaySessionData(upNextStart, featureDuration): when the player starts
// the up next screen. Without upNextStart, it uses 20 seconds before the end
// of the feature.
internal object PostPlayDataToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    strings = listOf("PostPlaySessionData(upNextStart="),
)

private fun flagFingerprint(name: String, returnType: String) = Fingerprint(
    definingClass = INFO,
    name = name,
    returnType = returnType,
)

// label=field for every "label=" in toString. Labels and field reads come in
// the same order, though a helper call can load two labels before their
// fields, so they are paired first in, first out.
internal fun fieldLabels(classDef: ClassDef): Map<String, String> {
    val toString = classDef.methods.first { it.name == "toString" && it.parameterTypes.isEmpty() }
    val labels = mutableMapOf<String, String>()
    val pending = ArrayDeque<String>()
    toString.implementation!!.instructions.forEach { instruction ->
        when (instruction.opcode) {
            Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO -> {
                val text = ((instruction as ReferenceInstruction).reference as StringReference).string
                if (text.endsWith("=")) pending.addLast(text.dropLast(1).substringAfterLast('(').substringAfterLast(',').trim())
            }
            Opcode.IGET, Opcode.IGET_OBJECT, Opcode.IGET_BOOLEAN, Opcode.IGET_WIDE -> {
                val field = (instruction as ReferenceInstruction).reference as FieldReference
                if (field.definingClass == classDef.type && pending.isNotEmpty()) {
                    labels[pending.removeFirst()] = field.name
                }
            }
            else -> {}
        }
    }
    return labels
}

// Installs PlayerInfo.decorate once, for both patches.
private val playerInfoHookPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        val sessionData = SessionDataToStringFingerprint.classDefOrNull ?: return@execute
        val labels = fieldLabels(sessionData)
        listOf("upNextStart", "advisoryInfo", "ratingImage").forEach {
            if (it !in labels) throw PatchException("Apple TV session data: $it not found")
        }

        mutableClassDefBy(sessionData.type).methods.filter { it.name == "<init>" && it.parameterTypes.isNotEmpty() }.forEach { init ->
            init.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .reversed()
                .forEach { index ->
                    init.addInstruction(index, "invoke-static/range { p0 .. p0 }, $INFO->decorate(Ljava/lang/Object;)V")
                }
        }

        val fields = labels.entries.joinToString(";") { "${it.key}=${it.value}" }
        flagFingerprint("fields", "Ljava/lang/String;").method
            .returnEarly("const-string v0, \"$fields\"\nreturn-object v0")
    }
}

@Suppress("unused")
val hidePlayerOverlaysPatch = bytecodePatch(
    name = "Hide player overlays",
    description = "Hides the overlays you choose: the rating card when a title starts, product placement notices, " +
        "and photosensitivity and high-motion warnings.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(playerInfoHookPatch)

    val ratingCard by booleanOption(
        key = "hideRatingCard",
        default = true,
        title = "Hide the rating card",
        description = "Hides the age rating and content advisories shown when a title starts.",
        required = true,
    )
    val productPlacement by booleanOption(
        key = "hideProductPlacement",
        default = true,
        title = "Hide product placement notices",
        description = "Hides the notice that a title contains paid product placement.",
        required = true,
    )
    val healthWarnings by booleanOption(
        key = "hideHealthWarnings",
        default = false,
        title = "Hide photosensitivity warnings",
        description = "Hides the photosensitivity and high-motion warnings.",
        required = true,
    )

    execute {
        if (SessionDataToStringFingerprint.classDefOrNull == null) return@execute
        mapOf(
            "hideRatingCard" to ratingCard,
            "hideProductPlacement" to productPlacement,
            "hideHealthWarnings" to healthWarnings,
        ).forEach { (name, on) ->
            flagFingerprint(name, "Z").method.returnEarly("const/4 v0, ${if (on == true) "0x1" else "0x0"}\nreturn v0")
        }
    }
}

@Suppress("unused")
val disableUpNextPatch = bytecodePatch(
    name = "Disable up next",
    description = "Lets the credits play full screen, instead of shrinking the video into a corner " +
        "to show the next episode or a recommendation.",
    default = false,
) {
    category("Playback")
    compatibleWith(Constants.COMPATIBILITY)
    dependsOn(playerInfoHookPatch)

    execute {
        if (SessionDataToStringFingerprint.classDefOrNull == null) return@execute
        flagFingerprint("disableUpNext", "Z").method.returnEarly("const/4 v0, 0x1\nreturn v0")

        val postPlay = PostPlayDataToStringFingerprint.classDefOrNull
            ?: throw PatchException("Apple TV post-play data not found")
        mutableClassDefBy(postPlay.type).methods.filter { it.name == "<init>" && it.parameterTypes.isNotEmpty() }.forEach { init ->
            init.implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .reversed()
                .forEach { index ->
                    init.addInstruction(index, "invoke-static/range { p0 .. p0 }, $INFO->postPlay(Ljava/lang/Object;)V")
                }
        }
    }
}
