/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.dm.saveMessages

import app.crimera.patches.instagram.utils.Constants.PATCHES_DESCRIPTOR
import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val HOOK_EXTENSION_CLASS = "$PATCHES_DESCRIPTOR/dm/SavedMessagesHook;"

// Hook 4 walks viewModel -> descriptor -> DirectThreadKey -> threadId in the extension, so the
// obfuscated names are rewritten into these placeholder-returning methods at patch time.
internal object OpenThreadDescriptorFieldExtension :
    Fingerprint(name = "openThreadDescriptorField", definingClass = HOOK_EXTENSION_CLASS)

internal object OpenThreadConverterClassExtension :
    Fingerprint(name = "openThreadConverterClass", definingClass = HOOK_EXTENSION_CLASS)

internal object OpenThreadConverterMethodExtension :
    Fingerprint(name = "openThreadConverterMethod", definingClass = HOOK_EXTENSION_CLASS)

internal object OpenThreadIdFieldExtension :
    Fingerprint(name = "openThreadIdField", definingClass = HOOK_EXTENSION_CLASS)

// The parser; named because the item's serializer (A00) writes the same keys. From 452 the keys are
// read in a per-field helper of the parser class, so the class rather than the method holds them.
internal object DirectItemFieldParserFingerprint : Fingerprint(
    name = "unsafeParseFromJson",
    custom = { _, classDef ->
        classDef.methods.any { method ->
            val strings = method.implementation?.instructions?.mapNotNull {
                (it as? ReferenceInstruction)?.reference as? StringReference
            }?.map { it.string }.orEmpty()
            "item_id" in strings && "hide_in_thread" in strings
        }
    },
)

// Stand-in for the retention period the patch option sets.
internal object RetentionDaysExtensionFingerprint :
    Fingerprint(name = "retentionDays", definingClass = HOOK_EXTENSION_CLASS)

// MQTT post-processing step (not on the REST path).
internal object DirectItemPostprocessFingerprint : Fingerprint(
    strings = listOf("DirectMessage.postprocess.%s", "Encountered DirectMessage with null type"),
)

// SQLite DAO hide-by-id. Injected at entry so our DB record is still present when the hook fires.
// (DirectThreadKey, server id, client id) up to 452; from 453 the run() of a task built with them.
internal object DirectItemDbHideFingerprint : Fingerprint(
    strings = listOf("Both message ID and client context is null."),
    returnType = "V",
)

// DM thread deserializer dispatch.
internal object ThreadUsersDispatchFingerprint : Fingerprint(
    strings = listOf("users", "admin_user_ids", "left_users", "thread_v2_id", "input_mode"),
)
