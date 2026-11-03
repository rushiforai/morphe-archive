package app.tikkamasalla.stremio.subs

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.tikkamasalla.stremio.introskip.hookEveryReturn
import app.tikkamasalla.stremio.introskip.PlayerInterface
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/** Finds Media3 SubtitleView.setCues(List), the single funnel every cue passes through. */
object SubtitleViewSetCuesFingerprint : Fingerprint(
    definingClass = "Landroidx/media3/ui/SubtitleView;",
    name = "setCues",
    parameters = listOf("Ljava/util/List;"),
)

const val SDH_PORT = "Lapp/tikkamasalla/stremio/subs/SdhPort;"
private const val LIST = "Ljava/util/List;"
private const val STR = "Ljava/lang/String;"
private val IPUTS = setOf(Opcode.IPUT, Opcode.IPUT_OBJECT, Opcode.IPUT_BOOLEAN)

/** The app's own Track data class (com.stremio.common.players.Track; obfuscated in 1.12.0 / 2.5.0): its toString. */
object TrackToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = STR,
    parameters = listOf(),
    strings = listOf("Track(type="),
)

/** Type of the Track class while the patch runs; findTrack is recognised by it. */
private var trackType: String? = null

/**
 * The default-track picker the Compose player screen calls once the tracks are known:
 * static findTrack(List tracks, String id, String lang, String pref1, String pref2) -> Track
 * (PlayerExtKt.findTrack in 1.10.4, ld5.b in 1.12.0, u55.b in 2.5.0). Unique by shape.
 */
object FindTrackFingerprint : Fingerprint(
    custom = { method, _ ->
        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == trackType &&
            method.parameterTypes.map { it.toString() } == listOf(LIST, STR, STR, STR, STR)
    },
)

/** dev.jdtech.mpv.MPVLib.init(): named in every build with the MPV engine (1.10.4+). */
object MpvLibInitFingerprint : Fingerprint(
    definingClass = "Ldev/jdtech/mpv/MPVLib;",
    name = "init",
    returnType = "V",
    parameters = listOf(),
)

object SdhConfigStubFingerprint : Fingerprint(
    definingClass = SDH_PORT,
    name = "config",
    parameters = listOf(),
)

/** What the patch learned about the app's track model. */
class TrackModel(val type: String, val config: String, val setTrack: String)

/**
 * Resolves, from named anchors only, the Track class, its field names (read off the 12-argument
 * constructor: param i is stored into field i), and the player interface's setTrack(Track).
 * Returns null when any piece is missing (1.6.12 has no such model).
 */
fun BytecodePatchContext.resolveTrackModel(iface: PlayerInterface): TrackModel? {
    val trackClass = TrackToStringFingerprint.originalClassDefOrNull ?: return null
    val ctor = trackClass.methods.firstOrNull { m ->
        val p = m.parameterTypes.map { it.toString() }
        m.name == "<init>" && p.size == 12 && p[1] == STR && p[2] == "Landroid/net/Uri;" && p[3] == STR &&
            p[4] == STR && p[5] == "Z" && p[6] == "Z" && p[7] == "Z"
    } ?: return null
    val impl = ctor.implementation ?: return null
    val firstParam = impl.registerCount - 12
    val thisRegister = firstParam - 1
    val fields = HashMap<Int, String>()
    impl.instructions.forEach { i ->
        if (i is TwoRegisterInstruction && i is ReferenceInstruction && i.reference is FieldReference &&
            i.opcode in IPUTS && i.registerB == thisRegister
        ) {
            val index = i.registerA - firstParam
            if (index in 0..11) fields[index] = (i.reference as FieldReference).name
        }
    }
    val names = listOf("type" to 0, "id" to 1, "uri" to 2, "label" to 3, "language" to 4, "commentary" to 6, "forced" to 7)
    if (names.any { it.second !in fields }) return null
    val setTrack = classDefByOrNull(iface.type)?.methods?.firstOrNull { m ->
        m.returnType == "V" && m.parameterTypes.map { it.toString() } == listOf(trackClass.type)
    }?.name ?: return null
    val config = (listOf("setTrack" to setTrack) + names.map { it.first to fields[it.second]!! })
        .joinToString(";") { "${it.first}=${it.second}" }
    return TrackModel(trackClass.type, config, setTrack)
}

/**
 * Hooks the three Track entry points: findTrack (entry + result), every player engine's setTrack,
 * and the SdhPort.config() stub. Returns false (nothing changed) when findTrack is not found.
 */
fun BytecodePatchContext.hookTrackSelection(iface: PlayerInterface, model: TrackModel): Boolean {
    trackType = model.type
    val findTrack = FindTrackFingerprint.method
    // The return itself is replaced (not preceded): branches that target the return keep hitting the hook.
    hookEveryReturn(findTrack, Opcode.RETURN_OBJECT) { register ->
        """
            invoke-static/range {v$register .. v$register}, $SDH_PORT->onFindTrackResult(Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$register
            check-cast v$register, ${model.type}
        """
    }
    findTrack.addInstructions(0, "invoke-static/range {p0 .. p1}, $SDH_PORT->onFindTrack(Ljava/lang/Object;Ljava/lang/Object;)V")

    val all = mutableListOf<ClassDef>()
    classDefForEach { all += it }
    val types = all.filter { iface.type in it.interfaces && !AccessFlags.INTERFACE.isSet(it.accessFlags) }
        .map { it.type }.toMutableSet()
    var grew = true
    while (grew) {
        grew = false
        all.forEach { c -> if (c.type !in types && c.superclass in types) { types += c.type; grew = true } }
    }
    all.filter { it.type in types }.forEach { classDef ->
        mutableClassDefBy(classDef).methods
            .filter { it.name == model.setTrack && it.returnType == "V" && it.implementation != null &&
                it.parameterTypes.map { p -> p.toString() } == listOf(model.type) }
            .forEach { it.addInstructions(0, "invoke-static/range {p0 .. p1}, $SDH_PORT->onSetTrack(Ljava/lang/Object;Ljava/lang/Object;)V") }
    }
    SdhConfigStubFingerprint.method.addInstructions(
        0,
        """
            const-string v0, "${model.config}"
            return-object v0
        """.trimIndent(),
    )
    return true
}
