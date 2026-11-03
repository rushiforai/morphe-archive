package app.tikkamasalla.stremio.introskip

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

/*
 * Version-independent anchors for the Compose builds (TV 1.10.x / 1.12.x, phone 2.x).
 *
 * Two kinds of anchor survive R8 in every Stremio build seen so far (1.6.12, 1.10.4,
 * 1.12.0, 2.5.0):
 *  1. stremio-core-kotlin (package com.stremio.core): a JNI library whose classes and
 *     generated protobuf getters keep their names. Core.dispatch(Action, Field) is the
 *     single funnel for every UI -> core action (stream load, TimeChanged, Seek, Unload).
 *  2. JNI-bound engine classes: dev.jdtech.mpv.MPVLib (1.10.4+) and org.videolan.libvlc.*.
 *     The app's own player interface is obfuscated in 1.12.0, but its MPV implementation
 *     is the only class with an MPVLib field, and its setTime is the only (J)V method there
 *     that writes "time-pos". From that one method the patch resolves the interface and
 *     its setTime name at patch time, so the extension never reflects on obfuscated names.
 */

const val PORT_HOOKS = "Lapp/tikkamasalla/stremio/introskip/PortHooks;"
private const val MPVLIB = "Ldev/jdtech/mpv/MPVLib;"

/** com.stremio.core.Core.dispatch(Action, Field): same name and signature in 1.6.12 .. 2.5.0. */
object CoreDispatchFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/core/Core;",
    name = "dispatch",
    returnType = "V",
    parameters = listOf("Lcom/stremio/core/runtime/msg/Action;", "Lcom/stremio/core/Field;"),
)

/**
 * The app's MPV player setTime(long): (J)V, writes the mpv property "time-pos", in the
 * class that holds the MPVLib instance. 1.10.4: MpvPlayer.setTime; 1.12.0: co4.Q.
 * Absent in 1.6.12 (no MPV engine there).
 */
object MpvSetTimeFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("J"),
    strings = listOf("time-pos"),
    custom = { method, classDef ->
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
            classDef.fields.any { it.type == MPVLIB }
    },
)

/** Extension stubs whose bodies are generated once the player interface is resolved. */
object PortSeekStubFingerprint : Fingerprint(
    definingClass = PORT_HOOKS,
    name = "seekImpl",
    parameters = listOf("Ljava/lang/Object;", "J"),
)

object PortTimeStubFingerprint : Fingerprint(
    definingClass = PORT_HOOKS,
    name = "timeImpl",
    parameters = listOf("Ljava/lang/Object;"),
)

object PortDurationStubFingerprint : Fingerprint(
    definingClass = PORT_HOOKS,
    name = "durationImpl",
    parameters = listOf("Ljava/lang/Object;"),
)

object PortPlayingStubFingerprint : Fingerprint(
    definingClass = PORT_HOOKS,
    name = "playingImpl",
    parameters = listOf("Ljava/lang/Object;"),
)

object PortHasPlayingStubFingerprint : Fingerprint(
    definingClass = PORT_HOOKS,
    name = "hasPlayingStub",
    parameters = listOf(),
)

/**
 * PlayerFragment's view factory on the Compose TV builds: PlayerFragment.onCreateView (1.10.x),
 * obfuscated name in 1.12.0 (`y`); the only method there that takes a LayoutInflater and returns a View.
 */
object PlayerScreenViewFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/views/player/PlayerFragment;",
    returnType = "Landroid/view/View;",
    custom = { method, _ -> method.parameterTypes.firstOrNull()?.toString() == "Landroid/view/LayoutInflater;" },
)

/** stremio-core-kotlin's generated decoder of the Player model (named in every build: JNI-bound). */
object PlayerModelFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/core/models/PlayerKt;",
    name = "decodeWithImpl",
    returnType = "Lcom/stremio/core/models/Player;",
)

/** stremio-core-kotlin's generated decoder of the MetaDetails model (named in every build: JNI-bound). */
object MetaDetailsModelFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/core/models/Meta_detailsKt;",
    name = "decodeWithImpl",
    returnType = "Lcom/stremio/core/models/MetaDetails;",
)

/** The phone (2.x) activity; the TV one is [MainActivityOnCreateFingerprint]. */
object PhoneMainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/android/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

object MainActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/stremio/tv/MainActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

/** Interfaces of a class and of its superclasses (app classes only). */
private fun BytecodePatchContext.allInterfaces(start: ClassDef): List<String> {
    val out = mutableListOf<String>()
    var current: ClassDef? = start
    var guard = 0
    while (current != null && guard++ < 8) {
        out += current.interfaces
        val parent = current.superclass ?: break
        current = classDefByOrNull(parent)
    }
    return out
}

/** Result of resolving the app's own player interface (com.stremio.common.players.Player). */
class PlayerInterface(
    val type: String,
    val setTime: String,
    val getTime: String?,
    val getDuration: String?,
    val isPlaying: String?,
)

/**
 * Resolves the app's player interface from the MPV setTime method: the interface (direct or
 * via a superclass) that declares a (J)V method of the same name. Returns null when the build
 * has no MPV engine (1.6.12) or the shape is ambiguous.
 */
fun BytecodePatchContext.resolvePlayerInterface(): PlayerInterface? {
    val setTimeName = MpvSetTimeFingerprint.originalMethodOrNull?.name ?: return null
    val mpvClass = MpvSetTimeFingerprint.originalClassDefOrNull ?: return null
    val candidates = allInterfaces(mpvClass).mapNotNull { classDefByOrNull(it) }.filter { iface ->
        iface.methods.any { m ->
            m.name == setTimeName && m.returnType == "V" &&
                m.parameterTypes.map { it.toString() } == listOf("J")
        }
    }
    if (candidates.size != 1) return null
    val iface = candidates.single()
    val longGetters = iface.methods.filter { it.returnType == "J" && it.parameterTypes.isEmpty() }
    val duration = longGetters.firstOrNull { it.name == "getDuration" }?.name
    val time = longGetters.firstOrNull { it.name == "getTime" }?.name
        ?: longGetters.filter { it.name != "getDuration" }.singleOrNull()?.name
    val playing = iface.methods.firstOrNull {
        it.name == "isPlaying" && it.returnType == "Z" && it.parameterTypes.isEmpty()
    }?.name
    return PlayerInterface(iface.type, setTimeName, time, duration, playing)
}

/**
 * Calls PortHooks.onStremioPlayer(this) at the end of every constructor of every class that
 * implements the player interface (ExoPlayer wrapper, MpvPlayer, LibVLC and YouTube players).
 * Returns the number of constructors hooked.
 */
fun BytecodePatchContext.hookPlayerConstructors(iface: PlayerInterface): Int {
    // Direct implementors plus their subclasses: R8 drops trivial constructors of abstract
    // bases (1.12.0: w10, the VLC/YouTube base, has none), so subclasses are hooked too.
    // A double call (base and subclass constructor) only re-stores the same instance.
    val all = mutableListOf<ClassDef>()
    classDefForEach { all += it }
    val types = mutableSetOf<String>()
    all.filter { iface.type in it.interfaces && !AccessFlags.INTERFACE.isSet(it.accessFlags) }
        .forEach { types += it.type }
    var grew = true
    while (grew) {
        grew = false
        all.forEach { c -> if (c.type !in types && c.superclass in types) { types += c.type; grew = true } }
    }
    val implementors = all.filter { it.type in types }
    var hooked = 0
    implementors.forEach { classDef ->
        mutableClassDefBy(classDef).methods.filter { it.name == "<init>" }.forEach { ctor ->
            val instructions = ctor.implementation?.instructions ?: return@forEach
            val returns = instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
            // Built directly: the inline smali compiler rejects snippets for constructors.
            val impl = ctor.implementation!!
            val paramRegs = ctor.parameterTypes.sumOf { t -> if (t.toString() == "J" || t.toString() == "D") 2 else 1 }
            val thisRegister = impl.registerCount - paramRegs - 1
            returns.reversed().forEach { index ->
                // The return itself is replaced (hook, then return-void), never preceded: a branch that
                // targets the return keeps hitting the hook (see hookEveryReturn).
                ctor.replaceInstruction(
                    index,
                    // Range form: valid for any register number (35c is limited to v0..v15).
                    BuilderInstruction3rc(
                        Opcode.INVOKE_STATIC_RANGE, thisRegister, 1,
                        ImmutableMethodReference(PORT_HOOKS, "onStremioPlayer", listOf("Ljava/lang/Object;"), "V"),
                    ),
                )
                ctor.addInstruction(index + 1, BuilderInstruction10x(Opcode.RETURN_VOID))
            }
            if (returns.isNotEmpty()) hooked++
        }
    }
    return hooked
}

/**
 * Runs [hook] at EVERY return of [opcode] (RETURN_VOID or RETURN_OBJECT) in [method]; [hook] gets the register
 * of the returned object (0 for void) and yields the smali lines to run first (the original register is
 * still returned afterwards). Returns the number of return sites hooked.
 *
 * Why not addInstructions(returnIndex, ...): Morphe keeps the labels on the return, so a branch that jumps
 * straight to a return skips an instruction inserted before it, and a method with several returns only
 * runs the hook on the path that reaches the hooked one. Here the return is replaced by the first hook line
 * (labels stay on it) and the rest of the hook plus a copy of the return follow it. [only] limits it to the
 * return at that instruction index.
 */
fun hookEveryReturn(method: MutableMethod, opcode: Opcode, only: Int? = null, hook: (register: Int) -> String): Int {
    val returns = method.implementation!!.instructions.withIndex()
        .filter { it.value.opcode == opcode && (only == null || it.index == only) }
        .map { it.index to ((it.value as? OneRegisterInstruction)?.registerA ?: 0) }
    returns.reversed().forEach { (index, register) ->
        val lines = hook(register).trimIndent().lines().filter { it.isNotBlank() }
        val ret = if (opcode == Opcode.RETURN_VOID) "return-void" else "return-object v$register"
        method.replaceInstruction(index, lines.first())
        method.addInstructions(index + 1, (lines.drop(1) + ret).joinToString("\n"))
    }
    return returns.size
}

/**
 * Calls [hook] (static, one Object/View argument) on the register that holds the returned object at each
 * return-object of the method. [replace] stores the hook's result back into that register (view wrap).
 * Returns the number of return sites hooked.
 */
fun hookReturnObject(method: MutableMethod, hook: String, replace: Boolean): Int =
    hookEveryReturn(method, Opcode.RETURN_OBJECT) { register ->
        if (replace) {
            "invoke-static/range {v$register .. v$register}, $hook\nmove-result-object v$register"
        } else {
            "invoke-static/range {v$register .. v$register}, $hook"
        }
    }

/** Calls the static [hook] with this (p0) at every return-void of the method; [hook] is a full method reference. */
fun hookReturnVoidWithThis(method: MutableMethod, hook: String): Int =
    hookEveryReturn(method, Opcode.RETURN_VOID) { "invoke-static {p0}, $hook" }

/** Generates the stub bodies: direct interface calls, no runtime reflection. */
fun BytecodePatchContext.generatePlayerStubs(iface: PlayerInterface) {
    PortSeekStubFingerprint.method.addInstructions(
        0,
        """
            check-cast p0, ${iface.type}
            invoke-interface {p0, p1, p2}, ${iface.type}->${iface.setTime}(J)V
            const/4 v0, 0x1
            return v0
        """.trimIndent(),
    )
    iface.getTime?.let { name ->
        PortTimeStubFingerprint.method.addInstructions(
            0,
            """
                check-cast p0, ${iface.type}
                invoke-interface {p0}, ${iface.type}->$name()J
                move-result-wide v0
                return-wide v0
            """.trimIndent(),
        )
    }
    iface.getDuration?.let { name ->
        PortDurationStubFingerprint.method.addInstructions(
            0,
            """
                check-cast p0, ${iface.type}
                invoke-interface {p0}, ${iface.type}->$name()J
                move-result-wide v0
                return-wide v0
            """.trimIndent(),
        )
    }
    iface.isPlaying?.let { name ->
        PortPlayingStubFingerprint.method.addInstructions(
            0,
            """
                check-cast p0, ${iface.type}
                invoke-interface {p0}, ${iface.type}->$name()Z
                move-result v0
                return v0
            """.trimIndent(),
        )
        PortHasPlayingStubFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}
