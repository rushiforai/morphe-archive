package io.github.jordanwoodson.patches.twitch.shared

import java.io.File
import java.security.MessageDigest

fun main(args: Array<String>) {
    val stock = File(args[0]).readBytes()
    val bundle = HermesBundle(stock)
    check(bundle.function("global").flags and 8 != 0) { "HBC98 full header lost exception flag" }
    check(bundle.function("applyModeration").flags and 8 != 0)
    // Metro module numbers of Twitch 31.8.0; production code finds each by its exports.
    check(bundle.metroModule(listOf("createElement", "useContext", "memo")) == 73)
    check(bundle.metroModule(listOf("NativeModules", "View", "Text", "StyleSheet"), false) == 5)
    check(bundle.metroModule(listOf("ChatTextMetricsContext", "ChatFontScaleContext")) == 3282)
    check(bundle.metroModule(listOf("ChatMessageRow")) == 3281)
    check(bundle.metroModule(listOf("useChatStore", "useChatSelector")) == 3302)
    check(bundle.metroModule(listOf("MessageBody")) == 3483)
    check(bundle.metroModule(listOf("TimestampPart", "formatTimestamp")) == 3476)
    check(bundle.metroModule(listOf("badgeKey", "buildBadgeRegistry")) == 3478)
    check(bundle.metroModule(listOf("useClassicStagePresentation")) == 4946)
    check(bundle.metroModule(listOf("useColumnTrackWidth", "COLUMN_TRANSITION_MS")) == 4949)
    check(bundle.metroModule(listOf("OneChatOverlayHost")) == 4910)
    check(bundle.metroModule(listOf("useTheatreChatStore")) == 4484)
    check(bundle.metroModule(listOf("ClassicChatColumn")) == 4166)
    check(bundle.metroModule(listOf("ChatArea")) == 4482)
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
