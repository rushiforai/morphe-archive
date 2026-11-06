package app.bookspiko.patches.books.misc.gms

import app.bookspiko.patches.books.misc.extension.sharedExtensionPatch
import app.bookspiko.patches.books.shared.Constants.COMPATIBILITY_PLAY_BOOKS
import app.bookspiko.patches.books.shared.Constants.GMS_EXTENSION_CLASS
import app.bookspiko.patches.books.shared.Constants.PLAY_BOOKS_PACKAGE
import app.bookspiko.patches.books.shared.accountConstructorType
import app.bookspiko.patches.books.shared.filledNewArray
import app.bookspiko.patches.books.shared.methodArgument
import app.bookspiko.patches.books.shared.registersUsed
import app.bookspiko.patches.books.shared.replaceStringLiteral
import app.bookspiko.patches.books.shared.stringEquals
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.util.logging.Logger

internal const val GOOGLE_ACCOUNT_TYPE = "com.google"
private const val HAS_CAPABILITIES_REQUEST = "Lcom/google/android/gms/auth/HasCapabilitiesRequest;"
private const val GOOGLE_PLAY_SERVICES_PACKAGE = "com.google.android.gms"
private const val GOOGLE_ACCOUNTS_AUTHORITY = "com.google.android.gms.auth.accounts"

/**
 * Signature Google's OAuth backend has registered for the Play Books client.
 * The APK signer used on Android 13 (v3.1 rotation, `bd32424203e0fb25f36b57e5aa356f9bdd1da998`)
 * is rejected with `UNREGISTERED_ON_API_CONSOLE`.
 */
private const val PLAY_BOOKS_SIGNATURE = "38918a453d07199354f8b19af05ec6562ced5788"

@Suppress("unused")
val gmsCoreSupportPatch = bytecodePatch(
    name = "GmsCore support",
    description = "Lets a re-signed Play Books sign in through GmsCore (ReVanced GmsCore / microG) " +
        "without root. Only the account, token and account picker paths are redirected; " +
        "every other Google Play services API keeps talking to the installed Play services.",
) {
    compatibleWith(COMPATIBILITY_PLAY_BOOKS)

    val vendorGroupIdOption = stringOption(
        key = "gmsCoreVendorGroupId",
        default = "app.revanced",
        values = mapOf("ReVanced GmsCore" to "app.revanced"),
        title = "GmsCore vendor group ID",
        description = "Prefix of the GmsCore build to use. The GmsCore package is <vendor>.android.gms " +
            "and its account type is <vendor>.",
        required = true,
    ) { !it.isNullOrBlank() && !it.contains(' ') }

    val spoofedSignatureOption = stringOption(
        key = "spoofedPackageSignature",
        default = PLAY_BOOKS_SIGNATURE,
        title = "Spoofed package signature",
        description = "SHA-1 certificate digest GmsCore reports to Google for OAuth.",
        required = true,
    ) { it != null && it.matches(Regex("[0-9a-fA-F]{40}")) }

    dependsOn(
        sharedExtensionPatch,
        gmsCoreSupportResourcePatch(PLAY_BOOKS_PACKAGE, vendorGroupIdOption, spoofedSignatureOption),
    )

    execute {
        val accountType = vendorGroupIdOption.value!!
        val gmsCorePackage = "$accountType.android.gms"
        val accountsAuthority = "$gmsCorePackage.auth.accounts"

        // region GoogleAuthUtil: account provider, token service and account type.

        GoogleAuthUtilClinitFingerprint.method.apply {
            // Supported account types { "com.google", "com.google.work", "cn.google" }.
            replaceStringLiteral(GOOGLE_ACCOUNT_TYPE, accountType, filledNewArray)
            // ComponentName(<package>, "com.google.android.gms.auth.GetToken"): only the package
            // changes, GmsCore exports the service under the original class name.
            replaceStringLiteral(
                GOOGLE_PLAY_SERVICES_PACKAGE,
                gmsCorePackage,
                methodArgument("Landroid/content/ComponentName;", "<init>", 1),
            )
        }

        GoogleAuthUtilGetAccountIdFingerprint.method.replaceStringLiteral(
            GOOGLE_ACCOUNT_TYPE,
            accountType,
            accountConstructorType,
        )

        GoogleAuthUtilGetAccountsFingerprint.method.apply {
            replaceStringLiteral(
                GOOGLE_ACCOUNTS_AUTHORITY,
                accountsAuthority,
                methodArgument(
                    "Landroid/content/ContentResolver;",
                    "acquireUnstableContentProviderClient",
                    1,
                ),
            )
            // Argument of ContentProviderClient.call("get_accounts", <type>, extras).
            // GmsCore only returns accounts of the requested type.
            replaceStringLiteral(GOOGLE_ACCOUNT_TYPE, accountType)
        }

        // Deliberately unchanged: getAccounts(Context, String[] features) keeps "com.google".
        // Play Books asks for features ["service_uca"]. With the GmsCore account type, GmsCore filters
        // its accounts by that feature and returns an empty list, so the app stays on the sign-in
        // screen. With "com.google" the call fails and the app falls back to the account provider
        // above, which is what the working manual build did.

        GoogleAuthUtilTokenAccountTypeCheckFingerprint.method.replaceStringLiteral(
            GOOGLE_ACCOUNT_TYPE,
            accountType,
            stringEquals,
        )

        // endregion

        // region Account picker and account types used by the app itself.

        // Open GmsCore's AccountPickerActivity, which handles the same CHOOSE_ACCOUNT action,
        // instead of the Play services one that rejects the re-signed caller.
        AccountPickerIntentFingerprint.method.replaceStringLiteral(
            GOOGLE_PLAY_SERVICES_PACKAGE,
            gmsCorePackage,
            methodArgument("Landroid/content/Intent;", "setPackage", 1),
        )

        AccountsUpdateListenerFingerprint.method.replaceStringLiteral(
            GOOGLE_ACCOUNT_TYPE,
            accountType,
            filledNewArray,
        )

        val addAccount = methodArgument("Landroid/accounts/AccountManager;", "addAccount", 1)
        AddAccountFingerprint.method.replaceStringLiteral(GOOGLE_ACCOUNT_TYPE, accountType, addAccount)
        OneGoogleAddAccountClickFingerprint.method.replaceStringLiteral(GOOGLE_ACCOUNT_TYPE, accountType, addAccount)

        BaseBooksActivityOnActivityResultFingerprint.method.replaceStringLiteral(
            GOOGLE_ACCOUNT_TYPE,
            accountType,
            accountConstructorType,
        )

        BaseBooksActivityOnResumeFingerprint.method.apply {
            // Allowed account types for the account picker:
            // Collections.singletonList(type) or new String[] { type }.
            replaceStringLiteral(
                GOOGLE_ACCOUNT_TYPE,
                accountType,
                methodArgument("Ljava/util/Collections;", "singletonList", 0),
                filledNewArray,
            )

            // Request the GET_ACCOUNTS runtime permission GmsCore requires to list accounts, and skip
            // the account handling of this onResume() while the permission dialog is shown.
            val superIndex = instructions.indexOfFirst { instruction ->
                (instruction.opcode == Opcode.INVOKE_SUPER || instruction.opcode == Opcode.INVOKE_SUPER_RANGE) &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).name == "onResume"
            }
            if (superIndex < 0) throw PatchException("super.onResume() not found in ${this.definingClass}")

            // A register the next instruction overwrites without reading is free at this point.
            val next = getInstruction(superIndex + 1)
            val freeRegister = next.registersUsed.firstOrNull()?.takeIf { register ->
                next.opcode.setsRegister() && register !in next.registersUsed.drop(1)
            } ?: throw PatchException("No free register after super.onResume() in ${this.definingClass}")

            addInstructionsWithLabels(
                superIndex + 1,
                """
                    invoke-static/range { p0 .. p0 }, $GMS_EXTENSION_CLASS->onActivityResumed(Landroid/app/Activity;)Z
                    move-result v$freeRegister
                    if-eqz v$freeRegister, :continue
                    return-void
                """,
                ExternalLabel("continue", next),
            )
        }

        // Remember the selected account across starts (see SavedAccountFingerprint).
        SavedAccountFingerprint.method.replaceStringLiteral(GOOGLE_ACCOUNT_TYPE, accountType, accountConstructorType)

        // Keep the account's downloads when the accounts change (see AccountDirectoriesFingerprint).
        AccountDirectoriesFingerprint.method.replaceStringLiteral(GOOGLE_ACCOUNT_TYPE, accountType, accountConstructorType)

        BaseBooksActivityAccountFromIntentFingerprint.method.replaceStringLiteral(
            GOOGLE_ACCOUNT_TYPE,
            accountType,
            accountConstructorType,
        )

        // endregion

        // region Account type validators.

        // Accept the GmsCore account type in addition to the Google ones
        // ("Unexpected Account type app.revanced, only Google accounts are supported.").
        GoogleAccountTypeValidatorFingerprint.method.apply {
            if (implementation!!.registerCount - parameters.size < 1) {
                throw PatchException("No free register in $definingClass->$name")
            }
            addInstructionsWithLabels(
                0,
                """
                    const-string v0, "$accountType"
                    invoke-virtual { v0, p0 }, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                    move-result v0
                    if-eqz v0, :original
                    const/4 v0, 0x1
                    return v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // endregion

        // region One account component per e-mail address.

        // Map (email, com.google) to (email, <vendor>) before the component cache lookup, otherwise
        // two components open the same accounts/<email>/ DataStore files:
        // "There are multiple DataStores active for the same file".
        AppSingletonGetAccountComponentFingerprint.method.apply {
            if (implementation!!.registerCount - parameters.size - 1 < 2) {
                throw PatchException("Not enough free registers in $definingClass->$name")
            }
            addInstructions(
                0,
                """
                    move-object/from16 v0, p1
                    const-string v1, "$accountType"
                    invoke-static { v0, v1 }, $GMS_EXTENSION_CLASS->normalizeAccount(Landroid/accounts/Account;Ljava/lang/String;)Landroid/accounts/Account;
                    move-result-object v0
                    move-object/from16 p1, v0
                """,
            )
        }

        // endregion

        // region Capability check (see CapabilityFetcherFingerprint).

        // Handle GmsCore's SecurityException like the IOException the app already handles.
        // Skipped with a warning when not found, so that sign-in still works on other versions.
        CapabilityFetcherFingerprint.methodOrNull?.let { method ->
            val implementation = method.implementation!!
            val call = method.instructions.indexOfFirst { instruction ->
                instruction.opcode == Opcode.INVOKE_STATIC &&
                    ((instruction as ReferenceInstruction).reference as MethodReference).parameterTypes
                        .map { it.toString() } == listOf("Landroid/content/Context;", HAS_CAPABILITIES_REQUEST)
            }
            val ioCatch = implementation.tryBlocks.firstOrNull { block ->
                block.exceptionHandler.exceptionType == "Ljava/io/IOException;" &&
                    call >= block.start.location.index && call < block.end.location.index
            } ?: throw PatchException("IOException handler around hasCapabilities not found in ${method.definingClass}")
            implementation.addCatch(
                "Ljava/lang/SecurityException;",
                ioCatch.start,
                ioCatch.end,
                ioCatch.exceptionHandler.handler,
            )
        } ?: Logger.getLogger(this::class.java.name).warning("Capability check not found, skipped")

        // endregion

        // region Not a supervised account (see SupervisedAccountsFingerprint).

        SupervisedAccountsFingerprint.method.addInstructions(
            0,
            """
                invoke-static { }, $GMS_EXTENSION_CLASS->supervisedAccounts()[Landroid/accounts/Account;
                move-result-object v0
                return-object v0
            """,
        )

        // endregion
    }
}
