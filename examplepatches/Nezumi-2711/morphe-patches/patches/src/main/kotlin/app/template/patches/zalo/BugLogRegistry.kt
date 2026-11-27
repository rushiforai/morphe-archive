package app.template.patches.zalo

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.Label
import com.android.tools.smali.dexlib2.builder.BuilderSwitchPayload
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction10t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction20t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction30t
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31t
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import java.util.WeakHashMap

// Build-time registry behind the bug log's patch attribution. Each patch records, from its execute
// block, that it was applied (with its option values) and which Zalo methods it modified. When the
// Bug log patch is applied, its finalize block bakes all of it into the extension: the applied-patch
// manifest for the session header, the modified-method list for crash attribution, and a hook
// breadcrumb at the start of every hooked method. Without the Bug log patch nothing is baked and the
// registration calls cost nothing at runtime.

/** Bug-log patch ids: the patch name in kebab-case. Each must have a constant in the extension enum `buglog/Patch`. */
internal object PatchId {
    const val CORE = "core"
    const val AMOLED_DARK_THEME = "amoled-dark-theme"
    const val BUG_LOG = "bug-log"
    const val BYPASS_CONVERSATION_PROTECTION = "bypass-conversation-protection"
    const val CALL_RECORDING = "call-recording"
    const val CHAT_HEADS_INSTEAD_OF_ANDROID_BUBBLES = "chat-heads-instead-of-android-bubbles"
    const val CHAT_REACTION_PICKER = "chat-reaction-picker"
    const val CLONE_PACKAGE = "clone-package"
    const val CUSTOM_FONT = "custom-font"
    const val CUSTOM_SOUNDS = "custom-sounds"
    const val DRIVE_BACKUP_VIA_MICROG = "drive-backup-via-microg"
    const val HIDE_BUSINESS_BOX_IN_MESSAGES = "hide-business-box-in-messages"
    const val HIDE_DISCOVERY_TAB = "hide-discovery-tab"
    const val HIDE_MEDIA_BOX_IN_MESSAGES = "hide-media-box-in-messages"
    const val HIDE_OA_ACCOUNTS_IN_MESSAGES = "hide-oa-accounts-in-messages"
    const val HIDE_ADS_IN_MESSAGES = "hide-ads-in-messages"
    const val HIDE_DELIVERY_RECEIPTS = "hide-delivery-receipts"
    const val HIDE_FEED_ADS = "hide-feed-ads"
    const val HIDE_READ_RECEIPTS = "hide-read-receipts"
    const val HIDE_TEXT_TYPING = "hide-text-typing"
    const val KEEP_RECALLED_MESSAGES = "keep-recalled-messages"
    const val MARK_AS_READ_FROM_NOTIFICATIONS = "mark-as-read-from-notifications"
    const val NATIVE_SIGNATURE_FIX = "native-signature-fix"
    const val OPEN_LINKS_IN_EXTERNAL_BROWSER = "open-links-in-external-browser"
    const val SAVE_MEDIA = "save-media"
    const val SEND_PHOTOS_IN_ORIGINAL_QUALITY = "send-photos-in-original-quality"
    const val UNLIMITED_QUICK_MESSAGES = "unlimited-quick-messages"
    const val VIEW_ONLINE_STATUS_PRIVATELY = "view-online-status-privately"
}

private class BugLogRegistry {
    /** Patch id to its build-time option values, in registration order. */
    val applied = LinkedHashMap<String, Map<String, String>>()
    /** Patches that log their own breadcrumb instead of getting an injected one. */
    val selfReportedHooks = LinkedHashSet<String>()
    /** Method descriptor ("Lcls;->name(args)R") to the patches that modified it. */
    val touched = LinkedHashMap<String, LinkedHashSet<String>>()
    /** Method descriptor to the method and the patches whose breadcrumb goes at its start. */
    val hits = LinkedHashMap<String, Pair<MutableMethod, LinkedHashSet<String>>>()
}

// Keyed by patcher run so a second run in the same JVM (Manager, desktop) starts clean.
private val registries = WeakHashMap<BytecodePatchContext, BugLogRegistry>()

private val BytecodePatchContext.bugLogRegistry: BugLogRegistry
    get() = synchronized(registries) { registries.getOrPut(this) { BugLogRegistry() } }

private fun Method.descriptor() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

private fun Method.isExtensionCode() = definingClass.startsWith(EXTENSION_DESCRIPTOR_PREFIX)

/**
 * Records that [patchId] is applied, with its build-time [options]. Call once from the patch's
 * execute block. [selfReportedHook] marks a patch whose extension logs its own breadcrumb.
 */
internal fun BytecodePatchContext.registerApplied(
    patchId: String,
    options: Map<String, Any?> = emptyMap(),
    selfReportedHook: Boolean = false,
) {
    val registry = bugLogRegistry
    registry.applied[patchId] = options.mapValues { (_, value) -> value?.toString() ?: "null" }
    if (selfReportedHook) registry.selfReportedHooks += patchId
}

/** Records that [patchId] modified the Zalo [method], for crash attribution. Extension methods are ignored. */
internal fun BytecodePatchContext.registerTouched(patchId: String, method: Method) {
    if (method.isExtensionCode()) return
    bugLogRegistry.touched.getOrPut(method.descriptor()) { LinkedHashSet() } += patchId
}

/**
 * Queues the [patchId] hook breadcrumb (`Hits.<camelCaseId>()`, no arguments, so no register is
 * touched) for the start of [method]. Inserted by the Bug log patch's finalize block, after every
 * patch has finished editing, so no patch's instruction indexes shift under it.
 */
internal fun BytecodePatchContext.injectHit(method: MutableMethod, patchId: String) {
    if (method.isExtensionCode() || method.implementation == null) return
    bugLogRegistry.hits.getOrPut(method.descriptor()) { method to LinkedHashSet() }.second += patchId
}

/** [registerTouched] plus [injectHit] for each runtime hook [methods] of [patchId]. */
internal fun BytecodePatchContext.registerHooks(patchId: String, vararg methods: MutableMethod) {
    methods.forEach { method ->
        registerTouched(patchId, method)
        injectHit(method, patchId)
    }
}

/**
 * Smali added with plain `addInstructions(index, smali)` keeps its own branch labels attached to the
 * inline compiler's scratch method. Their offsets are only right while nothing is inserted above the
 * snippet, and the breadcrumb is inserted at index 0, so the branch would land a few code units short
 * and ART rejects the class. Re-point every such branch at the same instruction in this method first.
 */
private fun MutableMethod.rebindScratchLabels() {
    val implementation = implementation ?: return
    val instructions = implementation.instructions
    instructions.toList().forEachIndexed { index, instruction ->
        if (instruction is BuilderSwitchPayload) {
            check(instruction.switchElements.none { it.target.isScratch() }) {
                "Bug log: switch in ${descriptor()} targets a scratch label; add that smali with addInstructionsWithLabels"
            }
            return@forEachIndexed
        }
        if (instruction !is BuilderOffsetInstruction) return@forEachIndexed
        if (!instruction.target.isScratch()) return@forEachIndexed
        val target = instruction.target.location.instruction
        val targetIndex = if (target == null) -1 else instructions.indexOfFirst { it === target }
        check(targetIndex >= 0) {
            "Bug log: branch at $index in ${descriptor()} targets a label outside the method; add that smali with addInstructionsWithLabels"
        }
        val label = implementation.newLabelForIndex(targetIndex)
        val rebound = when (instruction) {
            is BuilderInstruction10t -> BuilderInstruction10t(instruction.opcode, label)
            is BuilderInstruction20t -> BuilderInstruction20t(instruction.opcode, label)
            is BuilderInstruction30t -> BuilderInstruction30t(instruction.opcode, label)
            is BuilderInstruction21t -> BuilderInstruction21t(instruction.opcode, instruction.registerA, label)
            is BuilderInstruction22t -> BuilderInstruction22t(instruction.opcode, instruction.registerA, instruction.registerB, label)
            is BuilderInstruction31t -> BuilderInstruction31t(instruction.opcode, instruction.registerA, label)
            else -> error("Bug log: cannot rebind ${instruction.opcode} in ${descriptor()}")
        }
        implementation.replaceInstruction(index, rebound)
    }
}

/** True when the label's location belongs to another method (its instruction has moved on). */
private fun Label.isScratch(): Boolean {
    val target = location.instruction as? BuilderInstruction
    return target == null || target.location !== location
}

/** `keep-recalled-messages` to `keepRecalledMessages`, the breadcrumb method in `buglog/Hits`. */
internal fun hitMethodName(patchId: String): String {
    val parts = patchId.split('-')
    return parts.first() + parts.drop(1).joinToString("") { part -> part.replaceFirstChar(Char::uppercaseChar) }
}

/** `keep-recalled-messages` to `KEEP_RECALLED_MESSAGES`, the constant in `buglog/Patch`. */
private fun enumConstantName(patchId: String) = patchId.uppercase().replace('-', '_')

/** Escapes [value] for a smali string literal; non-ASCII as \u escapes. */
private fun smaliString(value: String) = buildString {
    value.forEach { char ->
        when {
            char == '\\' -> append("\\\\")
            char == '"' -> append("\\\"")
            char == '\n' -> append("\\n")
            char.code < 0x20 || char.code > 0x7e -> append("\\u%04x".format(char.code))
            else -> append(char)
        }
    }
}

/** Replaces the body of the static `String name()` stub in [classType] with `return value`. */
internal fun BytecodePatchContext.bakeStringStub(classType: String, name: String, value: String) {
    val stub = mutableClassDefBy(classType).methods.single {
        it.name == name && it.parameterTypes.isEmpty() && it.returnType == "Ljava/lang/String;"
    }
    val implementation = stub.implementation!!
    check(implementation.registerCount >= 1) { "$classType->$name has no register for the baked value" }
    repeat(implementation.instructions.size) { implementation.removeInstruction(0) }
    stub.addInstructions(0, "const-string v0, \"${smaliString(value)}\"\nreturn-object v0")
}

/**
 * Bakes the registry into the extension. Called from the Bug log patch's finalize block, which runs
 * after every patch's execute block. Fails the build when a registered patch id has no constant in
 * the extension enum, so ids cannot silently drift from the Java side.
 */
internal fun BytecodePatchContext.bakeBugLogRegistry() {
    val registry = bugLogRegistry

    val enumClass = classDefBy(NEZUMI_LOG_PATCH)
    val constants = enumClass.fields
        .filter { AccessFlags.ENUM.isSet(it.accessFlags) && it.type == NEZUMI_LOG_PATCH }
        .map { it.name }.toSet()
    val enumStrings = enumClass.methods.filter { it.name == "<clinit>" }
        .flatMap { it.implementation?.instructions ?: emptyList() }
        .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
        .toSet()
    val ids = registry.applied.keys + registry.touched.values.flatten() + registry.hits.values.flatMap { it.second }
    ids.distinct().forEach { id ->
        check(enumConstantName(id) in constants && id in enumStrings) {
            "Bug log: patch id \"$id\" has no constant ${enumConstantName(id)}(\"$id\") in $NEZUMI_LOG_PATCH. " +
                "Add it to the extension enum buglog/Patch (and a breadcrumb method to buglog/Hits)."
        }
    }

    val hitsClass = classDefBy(NEZUMI_LOG_HITS)
    registry.hits.values.forEach { (method, patchIds) ->
        method.rebindScratchLabels()
        // Reverse so the breadcrumbs end up in registration order at the top of the method.
        patchIds.reversed().forEach { id ->
            val name = hitMethodName(id)
            check(hitsClass.methods.any {
                it.name == name && it.parameterTypes.isEmpty() && it.returnType == "V" &&
                    AccessFlags.STATIC.isSet(it.accessFlags)
            }) { "Bug log: $NEZUMI_LOG_HITS has no static $name()V breadcrumb for patch id \"$id\"" }
            method.addInstruction(0, "invoke-static {}, $NEZUMI_LOG_HITS->$name()V")
        }
    }

    val hooked = registry.hits.values.flatMap { it.second }.toSet() + registry.selfReportedHooks
    val manifest = registry.applied.entries.joinToString("\n") { (id, options) ->
        buildString {
            append(id).append(if (id in hooked) " [hook]" else " [no-hook]")
            if (options.isNotEmpty()) append(' ').append(options.entries.joinToString(", ") { "${it.key}=${it.value}" })
        }
    }
    bakeStringStub(NEZUMI_LOG, "appliedPatches", manifest)

    val touched = registry.touched.entries.flatMap { (descriptor, patchIds) -> patchIds.map { "$descriptor=$it" } }
    bakeStringStub(NEZUMI_LOG, "touchedMethods", touched.joinToString("\n"))
}
