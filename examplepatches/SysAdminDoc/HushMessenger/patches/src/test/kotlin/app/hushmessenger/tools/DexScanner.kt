package app.hushmessenger.tools

import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import java.io.File

object DexScanner {
    private fun Method.id() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    private fun ClassDef.redexName(): String? = fields
        .firstOrNull { it.name == "__redex_internal_original_name" }
        ?.initialValue?.let { (it as? StringEncodedValue)?.value }

    private fun loadClasses(apkPath: String): List<ClassDef> {
        val container = DexFileFactory.loadDexContainer(File(apkPath), Opcodes.forApi(35))
        return container.dexEntryNames.flatMap { name ->
            container.getEntry(name)!!.dexFile.classes
        }
    }

    private fun scanFlagSecure(classes: List<ClassDef>) {
        println("\n=== FLAG_SECURE (0x2000 + Window.setFlags/addFlags) ===\n")
        val windowMethods = setOf(
            "Landroid/view/Window;->setFlags(II)V",
            "Landroid/view/Window;->addFlags(I)V",
            "Landroid/view/Window;->clearFlags(I)V",
        )
        var count = 0
        for (cls in classes) {
            for (method in cls.methods) {
                val code = method.implementation?.instructions?.toList() ?: continue
                val refs = code.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
                val hasWindowCall = refs.any { it in windowMethods }
                val hasFlag = code.any {
                    (it as? WideLiteralInstruction)?.wideLiteral == 0x2000L
                }
                if (hasWindowCall && hasFlag) {
                    count++
                    println("  MATCH: ${method.id()}")
                    println("    Class: ${cls.type}")
                    println("    Redex: ${cls.redexName() ?: "(none)"}")
                    val strs = code.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
                    if (strs.isNotEmpty()) println("    Strings: ${strs.take(10)}")
                    println()
                }
            }
        }
        println("  FLAG_SECURE candidate methods: $count")

        println("\n--- All methods referencing Window.setFlags/addFlags/clearFlags (no 0x2000 filter) ---\n")
        var total = 0
        for (cls in classes) {
            for (method in cls.methods) {
                val code = method.implementation?.instructions?.toList() ?: continue
                val refs = code.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
                val matched = refs.filter { it in windowMethods }
                if (matched.isNotEmpty()) {
                    total++
                    val literals = code.mapNotNull { (it as? WideLiteralInstruction)?.wideLiteral }
                        .filter { it in 1..0xFFFF }.distinct()
                    println("  ${method.id()}  flags=${literals.map { "0x${it.toString(16)}" }}  calls=${matched.distinct()}")
                }
            }
        }
        println("  Total Window flag methods: $total")

        println("\n--- ScreenshotContentObserver and related classes ---\n")
        val screenshotClasses = listOf(
            "Lcom/facebook/screenshot/ScreenshotContentObserver;",
            "Lcom/facebook/screenshot/",
        )
        for (cls in classes) {
            if (screenshotClasses.any { cls.type.startsWith(it.removeSuffix(";")) }) {
                println("  CLASS: ${cls.type}")
                println("    Redex: ${cls.redexName() ?: "(none)"}")
                for (m in cls.methods) {
                    if (m.implementation != null) println("    ${m.id()}  [${m.implementation!!.instructions.count()} insn]")
                }
                println()
            }
        }
        for (cls in classes) {
            for (method in cls.methods) {
                val code = method.implementation?.instructions?.toList() ?: continue
                val refs = code.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
                if (refs.any { it.contains("ScreenshotContentObserver") }) {
                    println("  REFERENCES ScreenshotContentObserver: ${method.id()}")
                    println("    Redex: ${cls.redexName() ?: "(none)"}")
                    val strs = code.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
                    if (strs.isNotEmpty()) println("    Strings: ${strs.take(5)}")
                    println()
                }
            }
        }
    }

    private fun scanReadReceipts(classes: List<ClassDef>) {
        println("\n=== READ RECEIPTS ===\n")
        val patterns = listOf(
            "read_receipt", "ReadReceipt", "readreceipt",
            "mark_read", "markRead", "MarkRead", "mark_as_read", "MarkAsRead",
            "readWatermark", "read_watermark", "ReadWatermark",
            "sendReadReceipt", "SendReadReceipt",
            "readState", "ReadState", "read_state",
            "ThreadViewData", "threadview",
            "seen_timestamp", "SeenTimestamp",
            "last_read", "lastRead", "LastRead",
        )

        println("--- String anchor matches ---\n")
        var count = 0
        for (cls in classes) {
            for (method in cls.methods) {
                val code = method.implementation?.instructions?.toList() ?: continue
                val strings = code.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
                val matched = strings.filter { str -> patterns.any { p -> str.contains(p, ignoreCase = true) } }
                if (matched.isNotEmpty()) {
                    count++
                    println("  ${method.id()}")
                    println("    Redex: ${cls.redexName() ?: "(none)"}")
                    println("    Matched strings: $matched")
                    println()
                }
            }
        }
        println("  Read receipt string matches: $count")

        println("\n--- Redex original names matching read/receipt/seen ---\n")
        var redexCount = 0
        for (cls in classes) {
            val name = cls.redexName() ?: continue
            if (name.contains("ReadReceipt", ignoreCase = true) ||
                name.contains("MarkRead", ignoreCase = true) ||
                name.contains("MarkAsRead", ignoreCase = true) ||
                name.contains("ReadWatermark", ignoreCase = true) ||
                name.contains("SendSeen", ignoreCase = true) ||
                name.contains("ReadState", ignoreCase = true) ||
                (name.contains("Read", ignoreCase = false) && name.contains("Receipt", ignoreCase = false))) {
                redexCount++
                println("  ${cls.type} -> $name")
                for (m in cls.methods) {
                    if (m.implementation != null) println("    ${m.id()}")
                }
                println()
            }
        }
        println("  Redex read-receipt classes: $redexCount")

        println("\n--- MailboxSDKJNI / MailboxCoreJNI (known non-obfuscated read-receipt dispatch) ---\n")
        val jniClasses = listOf(
            "Lcom/facebook/sdk/mca/MailboxSDKJNI;",
            "Lcom/facebook/core/mca/MailboxCoreJNI;",
            "Lcom/facebook/msys/mca/Mailbox;",
        )
        for (cls in classes) {
            if (cls.type in jniClasses) {
                println("  CLASS: ${cls.type}")
                for (m in cls.methods) {
                    if (m.name.startsWith("dispatch")) println("    ${m.id()}")
                }
                println()
            }
        }
    }

    private fun scanAntiUnsend(classes: List<ClassDef>) {
        println("\n=== ANTI-UNSEND / MESSAGE RECALL ===\n")
        val patterns = listOf(
            "unsend", "Unsend", "unsent",
            "message_recall", "MessageRecall", "messageRecall",
            "deleteForEveryone", "delete_for_everyone",
            "removeForEveryone", "remove_for_everyone",
            "revokeMessage", "revoke_message",
            "destroyMessage", "destroy_message",
            "retractMessage", "retract_message",
            "deleteMessage", "delete_message",
        )

        println("--- String anchor matches ---\n")
        var count = 0
        for (cls in classes) {
            for (method in cls.methods) {
                val code = method.implementation?.instructions?.toList() ?: continue
                val strings = code.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
                val matched = strings.filter { str -> patterns.any { p -> str.contains(p, ignoreCase = true) } }
                if (matched.isNotEmpty()) {
                    count++
                    println("  ${method.id()}")
                    println("    Redex: ${cls.redexName() ?: "(none)"}")
                    println("    Matched strings: $matched")
                    println()
                }
            }
        }
        println("  Anti-unsend string matches: $count")

        println("\n--- Redex original names matching unsend/recall/retract ---\n")
        var redexCount = 0
        for (cls in classes) {
            val name = cls.redexName() ?: continue
            if (name.contains("Unsend", ignoreCase = true) ||
                name.contains("Recall", ignoreCase = true) ||
                name.contains("Retract", ignoreCase = true) ||
                name.contains("DeleteForEveryone", ignoreCase = true) ||
                name.contains("RemoveForEveryone", ignoreCase = true) ||
                name.contains("MessageRemove", ignoreCase = true)) {
                redexCount++
                println("  ${cls.type} -> $name")
                for (m in cls.methods) {
                    if (m.implementation != null) println("    ${m.id()}")
                }
                println()
            }
        }
        println("  Redex unsend classes: $redexCount")

        println("\n--- MSYS message operation classes (message_unsend dispatch) ---\n")
        val msysPatterns = listOf(
            "NOTIFIED_DESTROY_MESSAGE", "DESTROY_MESSAGE",
            "message_unsend", "MESSAGE_UNSEND", "messageUnsend",
            "msg_remove", "msg_unsend", "msg_retract",
        )
        for (cls in classes) {
            for (method in cls.methods) {
                val code = method.implementation?.instructions?.toList() ?: continue
                val strings = code.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
                val matched = strings.filter { str -> msysPatterns.any { p -> str.contains(p, ignoreCase = true) } }
                if (matched.isNotEmpty()) {
                    println("  ${method.id()}")
                    println("    Redex: ${cls.redexName() ?: "(none)"}")
                    println("    Matched: $matched")
                    println()
                }
            }
        }
    }

    private fun scanVanishMode(classes: List<ClassDef>) {
        println("\n=== VANISH MODE / DISAPPEARING MESSAGES ===\n")
        val patterns = listOf(
            "vanish", "Vanish", "VanishMode",
            "disappearing", "Disappearing",
            "ephemeral", "Ephemeral",
            "self_destruct", "selfDestruct",
            "expiring_message", "ExpiringMessage",
        )
        var count = 0
        for (cls in classes) {
            for (method in cls.methods) {
                val code = method.implementation?.instructions?.toList() ?: continue
                val strings = code.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
                val matched = strings.filter { str -> patterns.any { p -> str.contains(p, ignoreCase = true) } }
                if (matched.isNotEmpty()) {
                    count++
                    println("  ${method.id()}")
                    println("    Redex: ${cls.redexName() ?: "(none)"}")
                    println("    Matched strings: ${matched.take(5)}")
                    println()
                }
            }
        }
        println("  Vanish/ephemeral matches: $count")

        println("\n--- Redex names with Vanish/Disappearing/Ephemeral ---\n")
        var redexCount = 0
        for (cls in classes) {
            val name = cls.redexName() ?: continue
            if (name.contains("Vanish", ignoreCase = true) ||
                name.contains("Disappearing", ignoreCase = true) ||
                name.contains("Ephemeral", ignoreCase = true) ||
                name.contains("ScreenCapture", ignoreCase = true) ||
                name.contains("Screenshot", ignoreCase = true)) {
                redexCount++
                println("  ${cls.type} -> $name")
                println()
            }
        }
        println("  Redex vanish/ephemeral classes: $redexCount")
    }

    @JvmStatic fun main(args: Array<String>) {
        require(args.isNotEmpty()) { "Usage: DexScanner <apk-path> [feature]" }
        val apkPath = args[0]
        val feature = args.getOrNull(1) ?: "all"
        require(File(apkPath).isFile) { "APK not found: $apkPath" }

        println("Loading DEX from: $apkPath")
        val classes = loadClasses(apkPath)
        println("Loaded ${classes.size} classes")

        when (feature) {
            "flag_secure" -> scanFlagSecure(classes)
            "read_receipt" -> scanReadReceipts(classes)
            "anti_unsend" -> scanAntiUnsend(classes)
            "vanish" -> scanVanishMode(classes)
            "all" -> {
                scanFlagSecure(classes)
                scanReadReceipts(classes)
                scanAntiUnsend(classes)
                scanVanishMode(classes)
            }
            else -> println("Unknown feature: $feature (use flag_secure, read_receipt, anti_unsend, vanish, or all)")
        }
    }
}
