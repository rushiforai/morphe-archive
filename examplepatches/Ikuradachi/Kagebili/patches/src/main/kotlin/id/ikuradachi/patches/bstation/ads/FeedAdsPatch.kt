package id.ikuradachi.patches.bstation.ads

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import id.ikuradachi.patches.bstation.content.HomeContentAcceptanceFingerprint

private const val BASIC_ITEM = "Lcom/bilibili/pegasus/api/model/BasicIndexItem;"
private const val CARD_TYPE = "Lcom/bilibili/pegasus/card/base/CardTypeEnum;"

internal fun BytecodePatchContext.applyFeedAds(hideQuestionCards: Boolean) {
    HomeContentAcceptanceFingerprint.matchAll(1..1)
    val host = HomeContentAcceptanceFingerprint.classDef
    val target = HomeContentAcceptanceFingerprint.method
    val helperName = "morpheAcceptFeedDebloat"
    check(host.methods.none { it.name == helperName }) { "Duplicate injected helper $helperName" }

    val instructions = target.implementation!!.instructions.toList()
    val returnIndex = instructions.withIndex().single { it.value.opcode == Opcode.RETURN }.index
    val accepted = (instructions[returnIndex] as OneRegisterInstruction).registerA
    check(target.implementation!!.registerCount <= 16) { "Feed admission registers exceed invoke-static encoding" }

    val hiddenTypes = buildList {
        add("INTL_SINGLE_ADS")
        add("INTL_DIRECT_AD")
        if (hideQuestionCards == true) {
            add("INTL_SINGLE_INTEREST_QUESTION")
            add("INTL_SINGLE_RATING_QUESTION")
        }
    }
    val checks = hiddenTypes.joinToString("\n") { type -> """
        sget-object v1, $CARD_TYPE->$type:$CARD_TYPE
        invoke-virtual {v1}, $CARD_TYPE->getValue()I
        move-result v1
        if-eq v0, v1, :reject
    """.trimIndent() }
    val helper = MutableMethod(ImmutableMethod(
        host.type, helperName,
        listOf(BASIC_ITEM, "Z").map { ImmutableMethodParameter(it, emptySet(), null) },
        "Z", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, emptySet(), emptySet(),
        MutableMethodImplementation(4),
    ))
    // shortcut: only the observed feed admission path is filtered; trace alternate paths before extending.
    helper.addInstructions(0, """
        if-eqz p1, :reject
        if-eqz p0, :keep
        invoke-virtual {p0}, Lcom/bilibili/bilifeed/card/FeedItem;->getViewType()I
        move-result v0
        $checks
        :keep
        return p1
        :reject
        const/4 v0, 0x0
        return v0
    """.trimIndent())
    host.methods.add(helper)

    // Read the current return so this composes with the optional UGC filter in either patch order.
    target.addInstructions(returnIndex, """
        invoke-static {p1, v$accepted}, ${host.type}->$helperName(${BASIC_ITEM}Z)Z
        move-result v$accepted
    """.trimIndent())
}
