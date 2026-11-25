package app.template.patches.telegram.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.PlusUpdateButtonUpdateFingerprint
import app.template.patches.telegram.TelegramPlus13221UpdateButtonUpdateFingerprint
import app.template.patches.telegram.PlusR8IsAppUpdateAvailableFingerprint
import app.template.patches.telegram.TelegramPlus13221R8IsAppUpdateAvailableFingerprint
import app.template.patches.telegram.PlusR8HasPendingAppUpdateFingerprint
import app.template.patches.telegram.TelegramPlus13221R8HasPendingAppUpdateFingerprint
import app.template.patches.telegram.TelegramR8IsAppUpdateAvailableWebFingerprint
import app.template.patches.telegram.TelegramR8CheckPromoInfoInternalNormalFingerprint
import app.template.patches.telegram.TelegramR8CheckPromoInfoInternalWebFingerprint
import app.template.patches.telegram.signature.telegramSpoofDependency
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

private val sharedConfigIsAppUpdateAvailableFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/SharedConfig;",
    name = "isAppUpdateAvailable",
    returnType = "Z",
)

private val sharedConfigSetNewAppVersionAvailableFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/SharedConfig;",
    name = "setNewAppVersionAvailable",
    returnType = "Z",
    parameters = listOf("Lorg/telegram/tgnet/TLRPC\$TL_help_appUpdate;"),
)

private val messagesControllerCheckPromoInfoInternalFingerprint = Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "checkPromoInfoInternal",
    returnType = "V",
    parameters = listOf("Z"),
)

// Telegram 13.3.1 uses different update-cache owners in the two APK variants:
// Android stores the update in pz.j1; Web stores it in rz.j1. These fields and
// their SPUT_OBJECT writes are present in the supplied DEX files.
private val telegramR8UpdateObjectStoreAndroidFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lorg/telegram/messenger/pz;",
            name = "j1",
            type = "Lorg/telegram/tgnet/TLRPC\$TL_help_appUpdate;",
            opcode = Opcode.SPUT_OBJECT,
        ),
    ),
)

private val telegramR8UpdateObjectStoreWebFingerprint = Fingerprint(
    filters = listOf(
        fieldAccess(
            definingClass = "Lorg/telegram/messenger/rz;",
            name = "j1",
            type = "Lorg/telegram/tgnet/TLRPC\$TL_help_appUpdate;",
            opcode = Opcode.SPUT_OBJECT,
        ),
    ),
)

@Suppress("unused")
val telegramDisableAutoUpdatePatch = bytecodePatch(
    name = "Disable auto-update",
    description = "Disables Telegram update availability, update-version storage and proxy sponsor-channel insertion.",
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
    )
    dependsOn(telegramSpoofDependency())

    execute {
        val updateAvailable =
            TelegramR8IsAppUpdateAvailableWebFingerprint.methodOrNull
                ?: TelegramPlus13221R8IsAppUpdateAvailableFingerprint.methodOrNull
                ?: PlusR8IsAppUpdateAvailableFingerprint.methodOrNull
                ?: sharedConfigIsAppUpdateAvailableFingerprint.methodOrNull
        if (updateAvailable != null) {
            updateAvailable.addInstructions(0, """
                const/4 v0, 0x0
                return v0
            """)
        } else {
            // Current Android and Web APKs both inline the update-availability gate.
            // Their update-object owners differ (pz.j1 vs rz.j1). Replace only
            // exact SPUT_OBJECT writes to those fields with a null store. This clears
            // any previously cached update instead of leaving stale update state behind. The legacy named predicate remains above.
            val updateStores = (
                telegramR8UpdateObjectStoreAndroidFingerprint.matchAllOrNull().orEmpty() +
                    telegramR8UpdateObjectStoreWebFingerprint.matchAllOrNull().orEmpty()
                ).distinctBy { match -> match.method to match.instructionMatches.map { it.index } }
            if (updateStores.isNotEmpty()) {
                updateStores.forEach { match ->
                    match.instructionMatches.map { it.index }.distinct().sortedDescending().forEach { index ->
                        val instruction = requireNotNull(match.method.implementation?.instructions?.elementAtOrNull(index)) {
                            "Update-cache write instruction $index disappeared before mutation"
                        }
                        val register = (instruction as? OneRegisterInstruction)?.registerA
                            ?: error("Update-cache SPUT_OBJECT at $index has no single source register")
                        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                            ?: error("Update-cache SPUT_OBJECT at $index has no field reference")
                        require(field.type == "Lorg/telegram/tgnet/TLRPC\$TL_help_appUpdate;") {
                            "Unexpected update-cache field type ${field.type}"
                        }
                        match.method.replaceInstruction(
                            index,
                            "const/4 v$register, 0x0\nsput-object v$register, ${field.definingClass}->${field.name}:${field.type}",
                        )
                    }
                }
            } else {
                require(
                    sharedConfigSetNewAppVersionAvailableFingerprint.methodOrNull != null ||
                        TelegramPlus13221R8IsAppUpdateAvailableFingerprint.methodOrNull != null ||
                        PlusR8IsAppUpdateAvailableFingerprint.methodOrNull != null ||
                        TelegramPlus13221UpdateButtonUpdateFingerprint.methodOrNull != null ||
                        PlusUpdateButtonUpdateFingerprint.methodOrNull != null
                ) {
                    "Missing current pz.j1/rz.j1 update-store hooks and legacy/Plus update UI hooks"
                }
            }
        }

        // Plus has a second UI-facing predicate which checks the pending update object
        // directly. Disable it as well, so drawer/update-button surfaces stay hidden even
        // if an update response populated the cached object through another callback.
        (TelegramPlus13221R8HasPendingAppUpdateFingerprint.methodOrNull
            ?: PlusR8HasPendingAppUpdateFingerprint.methodOrNull)?.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        // setNewAppVersionAvailable(TL_help_appUpdate) was removed/inlined by R8 in
        // 13.2.2; keep the named hook only for Plus/legacy variants where it is local.
        sharedConfigSetNewAppVersionAvailableFingerprint.methodOrNull?.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        val checkPromoInfo =
            TelegramR8CheckPromoInfoInternalNormalFingerprint.methodOrNull
                ?: TelegramR8CheckPromoInfoInternalWebFingerprint.methodOrNull
                ?: messagesControllerCheckPromoInfoInternalFingerprint.methodOrNull
        checkPromoInfo?.addInstructions(0, "return-void")

        (TelegramPlus13221UpdateButtonUpdateFingerprint.methodOrNull
            ?: PlusUpdateButtonUpdateFingerprint.methodOrNull)?.addInstructions(0, "return-void")
    }
}
