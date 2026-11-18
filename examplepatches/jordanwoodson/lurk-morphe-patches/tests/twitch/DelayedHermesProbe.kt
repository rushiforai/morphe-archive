package io.github.jordanwoodson.patches.twitch.shared

import java.io.File
import java.security.MessageDigest

fun main(args: Array<String>) {
    val stock = File(args[0]).readBytes()
    val bundle = HermesBundle(stock)
    check(bundle.function("global").flags and 8 != 0) { "HBC98 full header lost exception flag" }
    check(bundle.function("applyModeration").flags and 8 != 0)
    // Metro module numbers of Twitch 32.1.0; production code finds each by its exports.
    bundle.metroModule(listOf("createElement", "useContext", "memo")).let { check(it == 73) { "listOf(createElement, useContext, memo): $it" } }
    bundle.metroModule(listOf("NativeModules", "View", "Text", "StyleSheet"), false).let { check(it == 5) { "listOf(NativeModules, View, Text, StyleSheet): $it" } }
    bundle.metroModule(listOf("ChatTextMetricsContext", "ChatFontScaleContext")).let { check(it == 3408) { "listOf(ChatTextMetricsContext, ChatFontScaleContext): $it" } }
    bundle.metroModule(listOf("ChatMessageRow")).let { check(it == 3407) { "listOf(ChatMessageRow): $it" } }
    bundle.metroModule(listOf("useChatStore", "useChatSelector")).let { check(it == 3427) { "listOf(useChatStore, useChatSelector): $it" } }
    bundle.metroModule(listOf("MessageBody")).let { check(it == 3613) { "listOf(MessageBody): $it" } }
    bundle.metroModule(listOf("TimestampPart", "formatTimestamp")).let { check(it == 3600) { "listOf(TimestampPart, formatTimestamp): $it" } }
    bundle.metroModule(listOf("badgeKey", "buildBadgeRegistry")).let { check(it == 3605) { "listOf(badgeKey, buildBadgeRegistry): $it" } }
    bundle.metroModule(listOf("useClassicStagePresentation")).let { check(it == 5282) { "listOf(useClassicStagePresentation): $it" } }
    bundle.metroModule(listOf("useColumnTrackWidth", "COLUMN_TRANSITION_MS")).let { check(it == 5284) { "listOf(useColumnTrackWidth, COLUMN_TRANSITION_MS): $it" } }
    bundle.metroModule(listOf("OneChatOverlayHost")).let { check(it == 5122) { "listOf(OneChatOverlayHost): $it" } }
    bundle.metroModule(listOf("useTheatreChatStore")).let { check(it == 4779) { "listOf(useTheatreChatStore): $it" } }
    bundle.metroModule(listOf("ClassicChatColumn")).let { check(it == 4285) { "listOf(ClassicChatColumn): $it" } }
    bundle.metroModule(listOf("ChatArea")).let { check(it == 4662) { "listOf(ChatArea): $it" } }
    val donorBytes=File(args[1]).readBytes()
    val donor=HermesBundle(donorBytes,compiledPredicate=true)
    val predicate=donor.function("lurkDelayedPredicate")
    fun reject(at:Int,value:Int,label:String) {
        val changed=donorBytes.copyOf();changed[at]=value.toByte()
        MessageDigest.getInstance("SHA-1").digest(changed.copyOfRange(0,changed.size-20)).copyInto(changed,changed.size-20)
        val target=HermesBundle(stock)
        check(runCatching { target.installDelayedPredicate(changed) }.isFailure) { "Accepted unsupported donor: $label" }
        check(target.delayedAppend==null) { "Failed donor mutated main: $label" }
    }
    reject(predicate.offset,255,"opcode")
    reject(predicate.offset+1,255,"register")
    reject(predicate.offset+2,1,"parent depth")
    reject(predicate.headerOffset+36,0x5a,"unknown flag")
    bundle.installDelayedPredicate(File(args[1]).readBytes())
    val embedded = bundle.preview()
    check(embedded.size > stock.size)
    check(embedded.copyOfRange(108,112).contentEquals(stock.copyOfRange(108,112)))
    val append = bundle.delayedAppend!!
    val restored = embedded.copyOf(stock.size)
    append.originalHeader.copyInto(restored, append.headerOffset)
    stock.copyOfRange(32,36).copyInto(restored,32)
    MessageDigest.getInstance("SHA-1").digest(restored.copyOfRange(0,restored.size-20)).copyInto(restored,restored.size-20)
    check(restored.contentEquals(stock)) { "All-off restoration is not stock-identical" }
    check(MessageDigest.getInstance("SHA-1").digest(embedded.copyOfRange(0,embedded.size-20))
        .contentEquals(embedded.copyOfRange(embedded.size-20,embedded.size)))
    check(runCatching { bundle.installDelayedPredicate(File(args[1]).readBytes()) }.isFailure)
    File(args[2]).writeBytes(embedded)
    File(args[3]).writeText(bundle.manifest())
    println("PASS full-header flags, bounded compiled predicate append, footer, exact off restoration")
}
