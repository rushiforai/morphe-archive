package app.hushmessenger.patches.coexist

import app.hushmessenger.patches.MessengerTarget
import app.hushmessenger.patches.controls.hookId
import app.hushmessenger.patches.controls.settingsExtension
import app.hushmessenger.patches.messengerClasses
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.packageMetadata
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val RENAMED_PATCH_NAME = "Keep a renamed copy working"

private const val COMPAT = "Lapp/hushmessenger/extension/CloneCompat;"

/** Each name Messenger builds from its own package, and the extension field that gives it for the running copy. */
internal val RUNNING_NAMES = linkedMapOf(
    TAM_AUTHORITY to "$COMPAT->ATTACHMENTS:Ljava/lang/String;",
    DEDUP_AUTHORITY to "$COMPAT->PUSH_DEDUP:Ljava/lang/String;",
    DEDUP_URIS[0] to "$COMPAT->MUTED_CHATS:Ljava/lang/String;",
    DEDUP_URIS[1] to "$COMPAT->FRIENDSHIPS:Ljava/lang/String;",
)

/** Where the lookup takes the running package name, unless something already took that read out of it. */
private fun MutableMethod.lookupSite(pools: Set<String>): Pair<Int, Int>? = try {
    if (isBackupLookup(pools)) backupLookupSite(pools) else null
} catch (changed: PatchException) {
    null
}

/** Where the attachment check loads Messenger's own authority, unless it holds another name already. */
private fun MutableMethod.checkSite(): Pair<Int, Int>? = try {
    if (isAttachmentCheck()) attachmentSite() else null
} catch (changed: PatchException) {
    null
}

/** Whether [this] already keeps Messenger's own name in [register] at [at]. */
private fun MutableMethod.keepsOwnName(at: Int, register: Int): Boolean {
    val instruction = implementation?.instructions?.elementAtOrNull(at) ?: return false
    if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) return false
    return (instruction as OneRegisterInstruction).registerA == register &&
        ((instruction as ReferenceInstruction).reference as StringReference).string == MessengerTarget.PACKAGE
}

private fun MutableMethod.stringAt(at: Int): String? {
    val instruction = implementation?.instructions?.elementAtOrNull(at) ?: return null
    if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) return null
    return ((instruction as ReferenceInstruction).reference as StringReference).string
}

private fun MutableMethod.registerAt(at: Int): Int? =
    (implementation?.instructions?.elementAtOrNull(at) as? OneRegisterInstruction)?.registerA?.takeIf { it <= 255 }

/**
 * Keeps a copy that runs under another package name working, whichever patch renamed it.
 *
 * The encrypted-backup lookup picks its preferences by the running package name and throws NoSuchElementException on
 * any name but Messenger's, which leaves the copy on its loading screen (#185), so it keeps Messenger's own name. The
 * attachment provider check and the push dedup provider's authority and URIs read the running copy's names from the
 * extension instead of Messenger's, so the copy hands attachments through its own provider and keeps its muted chats
 * in its own storage rather than in the storage of the app it was copied from, which Android refuses.
 *
 * A site Clone install pinned to the name it chose while patching is left as it is, and so is one another patch has
 * already changed. Returns how many sites changed.
 */
internal fun applyRunningNames(
    lookup: MutableMethod,
    check: MutableMethod,
    dedup: List<Pair<MutableMethod, Int>> = emptyList(),
    pools: Set<String> = emptySet(),
): Int {
    var changed = 0
    // Both sites are read before the first change, so neither depends on the other's edit.
    val lookupSite = lookup.lookupSite(pools)
    val checkSite = check.checkSite()
    if (lookupSite != null) {
        val (at, register) = lookupSite
        if (!lookup.keepsOwnName(at, register)) {
            lookup.addInstruction(at, "const-string/jumbo v$register, \"${MessengerTarget.PACKAGE}\"")
            changed++
        }
    }
    if (checkSite != null) {
        val (at, register) = checkSite
        check.replaceInstruction(at, "sget-object v$register, ${RUNNING_NAMES.getValue(TAM_AUTHORITY)}")
        changed++
    }
    // Last site first in each method, since an instruction of another length can move the padding before a switch table.
    for ((method, at) in dedup.sortedByDescending { it.second }) {
        val field = method.stringAt(at)?.let { RUNNING_NAMES[it] } ?: continue
        val register = method.registerAt(at) ?: continue
        method.replaceInstruction(at, "sget-object v$register, $field")
        changed++
    }
    return changed
}

/**
 * Morphe's own package rename and the other patches that give a copy its own name leave Messenger reading its original
 * name out of its code, where it crashes or writes into the app it was copied from. HushMessenger's Clone install
 * writes the name it chose into those places itself, and this covers a rename by anything else.
 */
@Suppress("unused")
val renamedCopyPatch = patch(
    name = RENAMED_PATCH_NAME,
    description = "Keeps a copy of Messenger working when another patch gives it a new package name. Without it the copy " +
        "stops at its loading screen, and its attachments and muted chats go to the Messenger it was copied from. " +
        "HushMessenger's own Clone install already does this for the copies it makes. Works as soon as you patch it in, " +
        "with no switch.",
    default = true,
) {
    category("Fixes")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(settingsExtension)
    // In finalize, so every site Clone install or another patch has already changed is left as it is.
    finalize {
        val classes = messengerClasses()
        val pools = ownNamePoolKeys(classes)
        val checks = expectedCloneSitesFor(packageMetadata.versionCode).filterNot { '@' in it }
        fun method(id: String) = mutableClassDefBy(id.substringBefore("->")).methods.single { it.hookId() == id }
        // Each site's own instruction is read again from the method itself, so a name already pinned is recognized.
        val dedup = findDedupSites(classes).map { site ->
            method(site.substringBefore('@')) to site.substringAfter('@').toInt()
        }
        applyRunningNames(
            method(checks.single { it.endsWith("-><init>()V") }),
            method(checks.single { it.endsWith(ATTACHMENT_CHECK) }),
            dedup,
            pools,
        )
    }
}
