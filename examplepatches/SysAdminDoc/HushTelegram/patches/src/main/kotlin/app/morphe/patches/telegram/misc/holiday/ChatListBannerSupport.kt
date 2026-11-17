/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.holiday

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructions
import app.morphe.util.names.origName
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val CHAT_LIST_BANNER = "$EXTENSION_PACKAGE/misc/ChatListBanner;"
private const val BANNER_VIEW = "Landroid/view/View;"
private const val BANNER_CANVAS = "Landroid/graphics/Canvas;"
private const val BANNER_FRAME = "Landroid/widget/FrameLayout;"

/**
 * The chat list banner (#86): the top bar's own draw, where the banner goes in first, and the one
 * read of the bar's blur flag, where a bar that drew a banner says no to the blurred list Telegram
 * would paint over it. [holiday] is the flag Telegram sets on the chat list's bar for its holiday
 * image, which is how the extension tells that bar from every other, and [title]/[titleColor] read
 * the color the theme gives its title.
 */
internal class ChatListBannerSite(
    val draw: MutableMethod,
    val blurAt: Int,
    val bar: String,
    val holiday: FieldReference,
    val title: Method,
    val titleColor: Method,
) {
    /** Both hooks on a copy first, so a refusal leaves the app untouched. */
    fun rehearse() = insert(MutableMethod(ImmutableMethod.of(draw)))

    fun insert(target: MutableMethod = draw) {
        val read = target.controlBody()[blurAt]
        val flag = (read as TwoRegisterInstruction).registerA
        val owner = read.registerB
        // The blur answer first, so the draw call going in at 0 doesn't move it.
        target.addInstructions(blurAt + 1, """
            invoke-static {v$owner, v$flag}, $CHAT_LIST_BANNER->blur(${BANNER_VIEW}I)I
            move-result v$flag
        """)
        target.addInstructions(0, "invoke-static/range {p0 .. p1}, $CHAT_LIST_BANNER->draw($BANNER_VIEW$BANNER_CANVAS)V")
    }

    /** Writes the extension's stubs, then the two hooks. */
    fun apply(context: BytecodePatchContext) = with(context) {
        writeStub(CHAT_LIST_BANNER, "holiday", 2, """
            instance-of v0, p0, $bar
            if-eqz v0, :none
            check-cast p0, $bar
            iget-boolean v0, p0, $holiday
            :none
            return v0
        """)
        writeStub(CHAT_LIST_BANNER, "titleColor", 3, """
            instance-of v0, p0, $bar
            if-eqz v0, :none
            check-cast p0, $bar
            invoke-virtual {p0}, ${title.bannerReference()}
            move-result-object v1
            if-eqz v1, :none
            invoke-virtual {v1}, ${titleColor.bannerReference()}
            move-result v0
            return v0
            :none
            const/4 v0, 0x0
            return v0
        """)
        insert()
    }
}

private fun Method.bannerReference() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

/**
 * Finds every target, or throws naming the first one missing, before anything is changed.
 *
 * The top bar is the class whose drawChild reads the snow flag ([sites]). Its dispatchDraw draws its
 * own pieces, then, when [setDrawBlurBackground] turned the blur on (the one boolean that setter
 * stores, as it clears the bar's background), a rectangle of the blurred list across the whole bar,
 * then the bar's children. setSupportsHolidayImage stores its argument first thing, and Telegram
 * calls it only for the chat list's own bar. getTitleTextView answers the title, whose getTextColor
 * is the color the theme gives it.
 */
internal fun BytecodePatchContext.resolveChatListBanner(sites: HolidayLookSites): ChatListBannerSite {
    controlHook(CHAT_LIST_BANNER, "draw", listOf(BANNER_VIEW, BANNER_CANVAS), "V")
    controlHook(CHAT_LIST_BANNER, "blur", listOf(BANNER_VIEW, "I"), "I")
    controlHook(CHAT_LIST_BANNER, "holiday", listOf(BANNER_VIEW), "I")
    controlHook(CHAT_LIST_BANNER, "titleColor", listOf(BANNER_VIEW), "I")

    val bar = sites.readers.filter { it.origName == "drawChild" }.map { it.definingClass }.distinct().controlSingle("top bar")
    val barClass = tgMutableClassDefBy(bar)
    controlShape(AccessFlags.PUBLIC.isSet(barClass.accessFlags) && barClass.superclass == BANNER_FRAME,
        "the top bar is no longer a public FrameLayout")

    // The bar's own draw: nothing jumps back to its start, and it ends by drawing its children.
    val draw = barClass.methods.filter {
        it.name == "dispatchDraw" && it.parameterTypes.map { p -> p.toString() } == listOf(BANNER_CANVAS) && it.returnType == "V" &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }.controlSingle("top bar's draw")
    val body = draw.controlBody()
    val flow = ControlFlow.of(draw)
    controlShape(flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it }, "something jumps back to the start of the top bar's draw")
    controlShape(body.any { (it.opcode == Opcode.INVOKE_SUPER || it.opcode == Opcode.INVOKE_SUPER_RANGE) &&
        it.call()?.let { call -> call.definingClass == BANNER_FRAME && call.name == "dispatchDraw" } == true },
        "the top bar's draw no longer draws its children")

    // The chat list's mark: setSupportsHolidayImage stores its argument first thing.
    val supports = barClass.methods.filter {
        it.name == "setSupportsHolidayImage" && it.parameterTypes.map { p -> p.toString() } == listOf("Z") && it.returnType == "V"
    }.controlSingle("top bar's holiday image switch")
    val stored = supports.controlBody().firstOrNull()
    val holiday = stored?.takeIf { it.opcode == Opcode.IPUT_BOOLEAN }?.controlField()
    controlShape(holiday != null && holiday.definingClass == bar && holiday.type == "Z",
        "the top bar's holiday image switch no longer stores its flag first")
    requireReachable(holiday.toString(), static = false)

    // The blur switch: the one flag of the bar's own setDrawBlurBackground stores, as it clears the background.
    val blurSetter = barClass.methods.filter {
        it.name == "setDrawBlurBackground" && it.parameterTypes.size == 1 && it.returnType == "V"
    }.controlSingle("top bar's blur switch")
    val blurBody = blurSetter.controlBody()
    val blurFlag = blurBody.filter { it.opcode == Opcode.IPUT_BOOLEAN }.mapNotNull { it.controlField() }
        .filter { it.definingClass == bar && it.type == "Z" }.distinctBy { it.toString() }.controlSingle("top bar's blur flag")
    controlShape(blurBody.any { it.call()?.name == "setBackground" }, "the top bar's blur switch no longer clears its background")
    controlShape(blurFlag.toString() != holiday.toString(), "the top bar's blur flag is its holiday flag")

    // The draw reads that flag once and skips the blurred rectangle on false; nothing else lands on the skip.
    val reads = body.indices.filter { body[it].opcode == Opcode.IGET_BOOLEAN && body[it].controlField()?.toString() == blurFlag.toString() }
    val blurAt = reads.controlSingle("top bar's read of its blur flag")
    val read = body[blurAt] as TwoRegisterInstruction
    val skip = body.getOrNull(blurAt + 1)
    controlShape(skip != null && skip.opcode == Opcode.IF_EQZ && skip.namedRegisters() == listOf(read.registerA),
        "the top bar's draw no longer skips the blur on its flag")
    controlShape(read.registerA < 16 && read.registerB < 16 && read.registerA != read.registerB,
        "the top bar's blur read uses registers a hook can't pass")
    controlShape(flow.normal.indices.none { it != blurAt && blurAt + 1 in flow.normal[it] } && flow.exceptional.none { blurAt + 1 in it },
        "something jumps to the top bar's blur check")

    // The title and the color the theme gives it.
    val title = barClass.methods.filter {
        it.name == "getTitleTextView" && it.parameterTypes.isEmpty() && !AccessFlags.STATIC.isSet(it.accessFlags)
    }.controlSingle("top bar's title")
    requireReachable(title.bannerReference(), static = false)
    val titleClass = tgClassDefByOrNull(title.returnType)
    controlShape(titleClass != null && AccessFlags.PUBLIC.isSet(titleClass.accessFlags), "the top bar's title is no longer a public view")
    val titleColor = titleClass!!.methods.filter {
        it.name == "getTextColor" && it.parameterTypes.isEmpty() && it.returnType == "I" && !AccessFlags.STATIC.isSet(it.accessFlags)
    }.controlSingle("top bar title's color")
    requireReachable(titleColor.bannerReference(), static = false)

    return ChatListBannerSite(draw, blurAt, bar, holiday!!, title, titleColor)
}
