/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-15.
 */
package app.morphe.patches.music.interaction.smartshuffle

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.music.interaction.playlisttracktap.CommandResolverFingerprint
import app.morphe.patches.music.layout.theme.ElementsContainerFingerprint
import app.morphe.patches.music.video.information.videoIdHook
import app.morphe.patches.shared.misc.spoof.accountIdentityFingerprint
import app.morphe.util.findMutableMethodOf
import app.morphe.util.fingerprint.matchSingle
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val UI = "Lapp/morphe/extension/music/patches/smartshuffle/SmartShuffleUi;"
private const val MANAGER = "Lapp/morphe/extension/music/patches/smartshuffle/SmartShuffleManager;"
private const val OBJECT = "Ljava/lang/Object;"
private const val VIEW = "Landroid/view/View;"
private const val GROUP = "Landroid/view/ViewGroup;"
private const val JAM_MENU = "Lapp/morphe/extension/music/patches/jam/JamMenu;"

internal fun smartShuffleTouchBridge(owner: String, superclass: String) = ImmutableMethod(
    owner, "dispatchTouchEvent", listOf(ImmutableMethodParameter("Landroid/view/MotionEvent;", null, null)),
    "Z", AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(3),
).toMutable().apply {
    addInstructions(0, """
        invoke-static {p1}, $UI->onTouch(Landroid/view/MotionEvent;)V
        invoke-super {p0, p1}, $superclass->dispatchTouchEvent(Landroid/view/MotionEvent;)Z
        move-result v0
        return v0
    """)
}

internal fun installSmartShuffleRowHook(method: MutableMethod, index: Int, view: Int, occurrence: Int) {
    method.addInstructions(index + 1, """
        invoke-static {v$view, v$occurrence}, $UI->onQueueRowBound($VIEW$OBJECT)V
    """)
}

internal fun isSmartShuffleHeaderAttach(instruction: Instruction): Boolean {
    val call = instruction.getReference<MethodReference>() ?: return false
    return instruction.opcode == Opcode.INVOKE_STATIC && call.returnType == VIEW &&
        call.parameterTypes.map(CharSequence::toString).let {
            it.size == 4 && it[0] == OBJECT && it[1] == GROUP && it[2].startsWith("L") && it[3].startsWith("L")
        }
}

/** Resolve every UI boundary without adding a single hook. Jam is already installed by the dependency. */
internal fun BytecodePatchContext.resolveSmartShuffleUi(): () -> Unit {
    val header = ElementsContainerFingerprint.matchSingle().classDef
    val headerBind = header.methods.single { method ->
        AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.FINAL.isSet(method.accessFlags) &&
            !AccessFlags.SYNTHETIC.isSet(method.accessFlags) && method.returnType == "V" &&
            method.parameterTypes.size == 2 && method.parameterTypes[1] != OBJECT &&
            method.implementation?.instructions?.any(::isSmartShuffleHeaderAttach) == true
    }
    val headerCode = headerBind.implementation!!.instructions.toList()
    val attach = headerCode.indexOfFirst(::isSmartShuffleHeaderAttach)
    val container = (headerCode[attach] as FiveRegisterInstruction).registerD
    val model = headerBind.implementation!!.registerCount - 1
    check(container <= 15 && model <= 15 && headerCode[attach + 1].opcode != Opcode.MOVE_RESULT_OBJECT) {
        "Unsupported playlist header attachment registers"
    }
    val bind = mutableClassDefBy(header.type).findMutableMethodOf(headerBind)
    val resolver = CommandResolverFingerprint.method
    val activity = mutableClassDefBy("Lcom/google/android/apps/youtube/music/activities/MusicActivity;")
    val touchMethods = activity.methods.filter {
        it.name == "dispatchTouchEvent" && it.parameterTypes.map(CharSequence::toString) ==
            listOf("Landroid/view/MotionEvent;") && it.returnType == "Z"
    }
    check(touchMethods.size <= 1) { "Ambiguous Music touch dispatcher" }
    val touch = touchMethods.singleOrNull()
    val touchBridge = if (touch == null) smartShuffleTouchBridge(activity.type, activity.superclass!!) else null
    check((touch == null || touch.implementation != null) && resolver.implementation != null)

    // Jam's queue wrapper already exposes both the real row root and p3 = concrete native queue occurrence.
    // Unlike the general list presenter, this does not bind a video-only proto model.
    val classes = buildList {
        classDefForEach { owner ->
            if (owner.methods.none { it.parameterTypes.isEmpty() && it.returnType == VIEW }) return@classDefForEach
            if (owner.methods.none {
                it.parameterTypes.size == 1 && it.parameterTypes[0] == VIEW && it.returnType == "Z"
            }) return@classDefForEach
            if (owner.methods.any { it.parameterTypes.size == 3 && it.returnType == "V" }) {
                add(mutableClassDefBy(owner.type))
            }
        }
    }
    val queueBinders = classes.flatMap { owner ->
        owner.methods.mapNotNull { method ->
            val index = method.implementation?.instructions?.indexOfFirst { instruction ->
                instruction.getReference<MethodReference>()?.let {
                    it.definingClass == JAM_MENU && it.name == "bind" &&
                        it.parameterTypes.map(CharSequence::toString).lastOrNull() == OBJECT
                } == true
            } ?: -1
            if (index < 0) null else Triple(owner.type, method, index)
        }
    }
    check(queueBinders.size == 1) { "Missing or ambiguous native queue occurrence row binder" }
    val (rowType, rowMethod, rowIndex) = queueBinders.single()
    check(rowMethod.parameterTypes.size == 3 && rowMethod.returnType == "V")
    val row = mutableClassDefBy(rowType).findMutableMethodOf(rowMethod)
    val rowCall = row.implementation!!.instructions.toList()[rowIndex] as FiveRegisterInstruction
    val rowView = rowCall.registerC
    val rowItem = rowCall.registerE
    check(rowView <= 15 && rowItem <= 15)

    val account = accountIdentityFingerprint.method
    check(account.parameterTypes.take(4).map(CharSequence::toString) ==
        listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Z")) {
        "Unsupported native account identity constructor"
    }
    val accountWords = account.parameterTypes.sumOf { if (it == "J" || it == "D") 2 else 1 }
    check(account.implementation!!.registerCount - accountWords - 1 + 4 <= 15) {
        "Unsupported native account identity registers"
    }

    return {
        bind.addInstructions(attach + 1, """
            invoke-static {v$container, v$model}, $UI->onHeaderBound($GROUP$OBJECT)V
        """)
        resolver.addInstructions(0, """
            invoke-static {p1}, $UI->onCommand($OBJECT)V
        """)
        if (touch != null) {
            touch.addInstructions(0, """
                invoke-static {p1}, $UI->onTouch(Landroid/view/MotionEvent;)V
            """)
        } else {
            activity.methods.add(touchBridge!!)
        }
        installSmartShuffleRowHook(row, rowIndex, rowView, rowItem)
        account.addInstructions(0, """
            invoke-static {p1, p3, p4}, $UI->onAccountIdentity(Ljava/lang/String;Ljava/lang/String;Z)V
        """)
        videoIdHook("$MANAGER->onPlaybackStarted(Ljava/lang/String;)V")
    }
}
