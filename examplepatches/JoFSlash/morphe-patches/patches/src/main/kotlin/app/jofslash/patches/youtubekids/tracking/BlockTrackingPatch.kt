package app.jofslash.patches.youtubekids.tracking

import app.jofslash.patches.youtubekids.shared.Constants.COMPATIBILITY_YOUTUBE_KIDS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/youtubekids/Tracking;"
private const val DROPPING_LIST = "Lapp/jofslash/extension/youtubekids/Tracking\$DroppingList;"

// The HTTP ping request (stats, ad and error pings): new Ping(byte[] body) is always a "qoe" ping.
internal object PingRequestConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("[B"),
    strings = listOf("qoe"),
)

// The batch of interaction events (InnerTube log_event) the event dispatcher sends.
internal object LogEventRequestConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    strings = listOf("log_event"),
)

@Suppress("unused")
val blockTrackingPatch = bytecodePatch(
    name = "Block tracking",
    description = "Stops the playback quality reports, error reports, ad tracking and remarketing pings, and " +
            "the interaction events (what is tapped and shown). The watch statistics are kept, because " +
            "Watch it again is filled from them. Analytics in the Google services library is off in the " +
            "app already, and its Clearcut logs go to MicroG-RE, which drops them.",
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_YOUTUBE_KIDS)

    extendWith("extensions/youtubekids.mpe")

    execute {
        // Pings: every one goes through PingSender.send(identity, ping, callback).
        val ping = PingRequestConstructorFingerprint.classDef
        val uriField = ping.fields.singleOrNull { it.type == "Landroid/net/Uri;" }
            ?: throw PatchException("Couldn't find the ping's URI")
        val tagField = ping.fields.singleOrNull {
            it.type == "Ljava/lang/String;" && AccessFlags.FINAL.isSet(it.accessFlags)
        } ?: throw PatchException("Couldn't find the ping's tag")

        val senders = mutableListOf<ClassDef>()
        classDefForEach { classDef ->
            if (classDef.methods.any { it.isPingSend(ping.type) }) senders += classDef
        }
        val send: List<MutableMethod> = senders.flatMap { classDef ->
            mutableClassDefBy(classDef).methods.filter { it.isPingSend(ping.type) }
        }
        if (send.size != 1) throw PatchException("Expected one ping sender, found ${send.size}")
        send.single().apply {
            if (implementation!!.registerCount - parameterTypes.size - 1 < 2) {
                throw PatchException("The ping sender has too few registers")
            }
            addInstructionsWithLabels(
                0,
                """
                    iget-object v0, p2, $uriField
                    iget-object v1, p2, $tagField
                    invoke-static { v0, v1 }, $EXTENSION_CLASS->blockPing(Landroid/net/Uri;Ljava/lang/String;)Z
                    move-result v0
                    if-eqz v0, :send
                    return-void
                    :send
                    nop
                """
            )
        }

        // log_event: the request's event list drops what is added, so the dispatcher sees no
        // events and returns before sending.
        LogEventRequestConstructorFingerprint.let {
            val listField = it.classDef.fields.singleOrNull { field -> field.type == "Ljava/util/List;" }
                ?: throw PatchException("Couldn't find the log_event list")
            val method = it.method
            val returnIndex = method.instructions.indexOfLast { insn -> insn.opcode == Opcode.RETURN_VOID }
            method.addInstructions(
                returnIndex,
                """
                    new-instance v0, $DROPPING_LIST
                    invoke-direct { v0 }, $DROPPING_LIST-><init>()V
                    iput-object v0, p0, $listField
                """
            )
        }
    }
}

/** PingSender.send(identity, ping, callback): void, the ping as the second of three parameters. */
private fun com.android.tools.smali.dexlib2.iface.Method.isPingSend(pingType: String) =
    returnType == "V" && parameterTypes.size == 3 && parameterTypes[1].toString() == pingType &&
            !AccessFlags.STATIC.isSet(accessFlags)
