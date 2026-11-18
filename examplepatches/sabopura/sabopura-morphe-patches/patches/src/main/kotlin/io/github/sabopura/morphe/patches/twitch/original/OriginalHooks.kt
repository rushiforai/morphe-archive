package io.github.sabopura.morphe.patches.twitch.original

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import io.github.sabopura.morphe.patches.twitch.chat.describedFields
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.classesMatching
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings
import io.github.sabopura.morphe.patches.twitch.support.fieldBridge
import io.github.sabopura.morphe.patches.twitch.support.replaceBridge
import io.github.sabopura.morphe.patches.twitch.support.requirePublicField
import io.github.sabopura.morphe.patches.twitch.support.uniqueContract
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val ORIGINAL = "Lio/github/sabopura/morphe/extension/twitch/original/Original;"
private const val RAID = "Lio/github/sabopura/morphe/extension/twitch/original/RaidHold;"
private const val WATCH = "Lio/github/sabopura/morphe/extension/twitch/original/PlayerWatch;"
private const val QUICK_PHRASES = "io.github.sabopura.morphe.extension.twitch.original.QuickPhrases"
private const val HYPE_VIEW = "io.github.sabopura.morphe.extension.twitch.original.HypeMeterView"
private const val START_ACTIVITY = "Landroid/content/Context;->startActivity(Landroid/content/Intent;)V"

private fun Element.androidId() = getAttribute("android:id").substringAfter('/')

private fun Document.descendants(): List<Element> {
    val nodes = documentElement.getElementsByTagName("*")
    return (0 until nodes.length).map { nodes.item(it) as Element }
}

/** The app context and activity tracking the original patches read; hidden, selected by each of them. */
internal val originalRuntimeHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        mutableClassDefBy("Ltv/twitch/android/app/consumer/TwitchApplication;")
            .methods.single { it.name == "onCreate" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "invoke-static/range {p0 .. p0}, $ORIGINAL->initialize(Landroid/content/Context;)V")
    }
}

/** Android 11+ needs this for an app to reach the installed text-to-speech engine. */
internal val ttsQueriesPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            val root = document.documentElement
            val queries = (0 until root.childNodes.length).map { root.childNodes.item(it) }
                .filterIsInstance<Element>().firstOrNull { it.tagName == "queries" }
                ?: document.createElement("queries").also { root.insertBefore(it, root.firstChild) }
            val intent = document.createElement("intent")
            val action = document.createElement("action")
            action.setAttribute("android:name", "android.intent.action.TTS_SERVICE")
            intent.appendChild(action)
            queries.appendChild(intent)
        }
    }
}

private fun Method.startsActivity() =
    implementation?.instructions?.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.toString() == START_ACTIVITY } == true

/**
 * Stops Twitch's single point of navigation from opening a theatre destination that carries a raid id,
 * whichever presenter asked for it, and lets a later tap make the same call.
 */
internal val raidHoldHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    val bridges = linkedMapOf<String, FieldReference>()
    var navigate: Triple<ClassDef, Method, Unit>? = null

    execute {
        val theatre = classesWithStrings("Theatre(model=", ", raidId=").uniqueContract("theatre destination")
        val fields = describedFields(theatre)
        val raidId = fields[", raidId="]?.takeIf { it.type == "Ljava/lang/String;" }
            ?: throw PatchException("Raid hold: theatre has no raid id field")
        val model = fields["Theatre(model="]
            ?: throw PatchException("Raid hold: theatre has no model field")
        requirePublicField(raidId, "Raid hold")
        requirePublicField(model, "Raid hold")
        bridges["raidId"] = raidId
        bridges["stream"] = model

        val destination = theatre.interfaces.singleOrNull()
            ?: throw PatchException("Raid hold: theatre destination is not a single interface")
        fun isOpen(method: Method) = method.returnType == "V" && method.parameterTypes.size == 2 &&
            method.parameterTypes[1].toString() == destination && method.startsActivity()
        val router = classesMatching { it.methods.any(::isOpen) }.uniqueContract("navigation router")
        val open = router.methods.single(::isOpen)
        val method = mutableClassDefBy(router).methods.single(::isOpen)
        if (method.implementation!!.registerCount - 3 < 1) throw PatchException("Raid hold: router has no free register")
        method.addInstructionsWithLabels(0, """
            move-object/from16 v0, p2
            instance-of v0, v0, ${theatre.type}
            if-eqz v0, :keep
            invoke-static/range {p0 .. p2}, $RAID->onNavigate(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :keep
            return-void
        """, ExternalLabel("keep", method.getInstruction(0)))
        navigate = Triple(router, open, Unit)
    }

    finalize {
        bridges.forEach { (name, field) -> replaceBridge(RAID, name, fieldBridge(field)) }
        val (router, open) = navigate!!
        val (activity, destination) = open.parameterTypes.map { it.toString() }
        replaceBridge(RAID, "navigate", """
            check-cast p0, ${router.type}
            check-cast p1, $activity
            check-cast p2, $destination
            invoke-virtual {p0, p1, p2}, $open
            return-void
        """)
    }
}

/** Tells the slow on-screen tick that a player started. */
internal val playerWatchHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        mutableClassDefBy("Lcom/amazonaws/ivs/player/CorePlayerImpl;")
            .methods.single { it.name == "play" && it.parameterTypes.isEmpty() }
            .addInstructions(0, "invoke-static {}, $WATCH->started()V")
    }
}

/** Reads the login of the channel Twitch connects chat to. */
internal val channelProfileHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val join = io.github.sabopura.morphe.patches.twitch.chat.channelJoinMethod(this)
        join.addInstructions(0, io.github.sabopura.morphe.patches.twitch.chat.channelJoinHook(
            join, "$ORIGINAL->onChannelJoin(Ljava/lang/Object;Ljava/lang/String;)V"))
    }
}

/** The row of phrase chips directly above the chat box, resized away when it has nothing to show. */
internal val quickPhrasesResources = resourcePatch {
    execute {
        document("res/layout/chat_message_input_view.xml").use { document ->
            val views = document.descendants()
            val input = views.singleOrNull { it.androidId() == "chat_input_background" }
                ?: throw PatchException("Quick phrases: chat input background not found")
            val row = document.createElement(QUICK_PHRASES)
            row.setAttribute("android:id", "@+id/sabopura_quick_phrases")
            row.setAttribute("android:layout_width", "0dp")
            row.setAttribute("android:layout_height", "wrap_content")
            row.setAttribute("app:layout_constraintEnd_toEndOf", "parent")
            row.setAttribute("app:layout_constraintStart_toStartOf", "parent")
            row.setAttribute("app:layout_constraintTop_toBottomOf", "@id/chat_tray_container")
            input.parentNode.insertBefore(row, input)
            input.setAttribute("app:layout_constraintTop_toBottomOf", "@id/sabopura_quick_phrases")
        }
    }
}

/** A small sparkline in the bottom corner of every native player, above the video and below its controls. */
internal val hypeMeterResources = resourcePatch {
    execute {
        document("res/layout/player_view_delegate.xml").use { document ->
            val video = document.descendants().firstOrNull { it.androidId() == "playback_view_container" }
                ?: throw PatchException("Hype meter: player layout lost playback_view_container")
            val meter = document.createElement(HYPE_VIEW)
            meter.setAttribute("android:id", "@+id/sabopura_hype_meter")
            meter.setAttribute("android:layout_width", "120dp")
            meter.setAttribute("android:layout_height", "48dp")
            meter.setAttribute("android:layout_gravity", "bottom|start")
            meter.setAttribute("android:layout_marginStart", "12dp")
            meter.setAttribute("android:layout_marginBottom", "48dp")
            video.parentNode.insertBefore(meter, video.nextSibling)
        }
    }
}

