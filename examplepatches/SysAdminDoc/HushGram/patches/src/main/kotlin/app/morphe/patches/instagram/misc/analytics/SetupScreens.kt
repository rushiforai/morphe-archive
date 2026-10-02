/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.analytics

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.instagram.misc.settings.EXTENSION_ROOT
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** The only string the Bloks screen opener's full-screen method holds that no other method does. */
internal const val SCREEN_FETCH = "BKDataFetcher.fetch"

private const val SCREEN_CONFIG = "Lcom/instagram/bloks/hosting/IgBloksScreenConfig;"

/** What the opener's constructor takes: the screen's app id, then two maps of its parameters. */
private val OPENER_CONSTRUCTOR = listOf("Ljava/lang/String;", "Ljava/util/Map;", "Ljava/util/Map;")

/** An instance method opening a Bloks screen: full screen, bottom sheet, or pushed. */
private fun Method.opensScreen() = !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" &&
    parameterTypes.map(Any::toString) == listOf("Landroid/content/Context;", SCREEN_CONFIG)

/**
 * Asks [hook] with the screen's app id first thing in each of the Bloks screen opener's ways of
 * showing a screen, and on a yes returns before it shows anything. The server sends the "Set up on
 * new device" screens, which ask for contacts and location, as Bloks screens by app id, so the app
 * id is the one thing that tells them apart. They come back on every start while the events saying
 * they were seen are refused, which is why Disable analytics skips them.
 *
 * The opener keeps the app id in the String field its (String, Map, Map) constructor stores its
 * first argument in; the hook reads that field off `this` itself, so it doesn't matter which of the
 * opener's methods the server's screen goes through. Answers null when the calls went in, or why not.
 */
internal fun BytecodePatchContext.skipSetupScreens(hook: String): String? {
    val openers = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        if (classDef.methods.any { it.opensScreen() && SCREEN_FETCH in it.strings() }) openers += classDef.type
    }
    val opener = openers.distinct().singleOrNull()
        ?: return "expected one class opening a Bloks screen with $SCREEN_FETCH, found ${openers.distinct().size}"
    val mutable = mutableClassDefBy(opener)

    val constructor = mutable.methods.singleOrNull {
        it.name == "<init>" && it.parameterTypes.map(Any::toString) == OPENER_CONSTRUCTOR
    } ?: return "$opener has no (String, Map, Map) constructor to read the screen's app id from"
    val appIdArgument = constructor.implementation!!.registerCount - OPENER_CONSTRUCTOR.size
    val appId = constructor.implementation!!.instructions.firstNotNullOfOrNull { instruction ->
        if (instruction.opcode != Opcode.IPUT_OBJECT || (instruction as TwoRegisterInstruction).registerA != appIdArgument) {
            return@firstNotNullOfOrNull null
        }
        ((instruction as ReferenceInstruction).reference as FieldReference)
            .takeIf { it.definingClass == opener && it.type == "Ljava/lang/String;" }
    } ?: return "$opener's constructor keeps its app id in no String field of its own"

    val methods = mutable.methods.filter { it.opensScreen() }
    // `this` sits right under the two arguments; v0 must be a local below it to hold the answer.
    methods.firstOrNull { it.implementation!!.registerCount - 3 < 1 }?.let {
        return "$opener->${it.name} has no spare register"
    }
    methods.forEach { method ->
        val self = method.implementation!!.registerCount - 3
        method.addInstructionsWithLabels(
            0,
            """
                move-object/from16 v0, v$self
                iget-object v0, v0, $appId
                invoke-static { v0 }, $hook
                move-result v0
                if-eqz v0, :open
                return-void
            """,
            ExternalLabel("open", method.getInstruction(0)),
        )
    }
    return null
}

private fun Method.strings(): Set<String> = implementation?.instructions?.mapNotNull { instruction ->
    if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) null
    else ((instruction as ReferenceInstruction).reference as StringReference).string
}?.toSet().orEmpty()
