package app.bookspiko.patches.books.misc.gms

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.newInstance
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

// region GoogleAuthUtil (play-services-auth-base, bundled and obfuscated in the app)

/**
 * Static initializer holding the supported account types array and the
 * `ComponentName("com.google.android.gms", "com.google.android.gms.auth.GetToken")` used to bind
 * the token service.
 */
internal object GoogleAuthUtilClinitFingerprint : Fingerprint(
    name = "<clinit>",
    returnType = "V",
    strings = listOf(
        "com.google.work",
        "cn.google",
        "com.google.android.gms.auth.GetToken",
        "GoogleAuthUtil",
    ),
)

/** `getAccountId(Context, String accountName)`: builds `Account(name, "com.google")`. */
internal object GoogleAuthUtilGetAccountIdFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
    strings = listOf("accountName must be provided", "^^_account_id_^^"),
)

/** `getAccounts(Context)`: queries the GMS account content provider with `get_accounts`. */
internal object GoogleAuthUtilGetAccountsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "[Landroid/accounts/Account;",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("com.google.android.gms.auth.accounts", "get_accounts", "callingActivity"),
)

/** Token request validation: throws "Account type X is not supported." for non Google types. */
internal object GoogleAuthUtilTokenAccountTypeCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/String;",
    parameters = listOf("Landroid/content/Context;", "Landroid/accounts/Account;", "Ljava/lang/String;", "L"),
    strings = listOf("Account type ", " is not supported.", "com.google.work"),
)

// endregion

// region Play services common / account picker

/** Builds the `CHOOSE_ACCOUNT` intent and pins it to the Google Play services package. */
internal object AccountPickerIntentFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Landroid/content/Intent;",
    strings = listOf(
        "com.google.android.gms.common.account.CHOOSE_ACCOUNT",
        "com.google.android.gms.common.account.CHOOSE_ACCOUNT_USERTILE",
        "allowableAccountTypes",
    ),
)

/** `isGoogleAccountType(String)`: "Unexpected Account type %s, only Google accounts are supported." */
internal object GoogleAccountTypeValidatorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("com.google", "com.google.work", "cn.google", "__logged_out_type"),
)

/** Registers an `OnAccountsUpdateListener` restricted to Google accounts. */
internal object AccountsUpdateListenerFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        fieldAccess(type = "Landroid/accounts/OnAccountsUpdateListener;"),
        string("com.google"),
        methodCall(
            parameters = listOf(
                "Landroid/accounts/AccountManager;",
                "Landroid/accounts/OnAccountsUpdateListener;",
                "Landroid/os/Handler;",
                "Z",
                "[Ljava/lang/String;",
            ),
            returnType = "V",
        ),
    ),
)

/** `AccountManager.addAccount("com.google", ...)` with an "introMessage" option. */
internal object AddAccountFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/app/Activity;",
        "Landroid/accounts/AccountManagerCallback;",
        "Ljava/lang/CharSequence;",
    ),
    strings = listOf("introMessage", "com.google"),
    filters = listOf(
        methodCall(smali = "Landroid/accounts/AccountManager;->addAccount(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Landroid/os/Bundle;Landroid/app/Activity;Landroid/accounts/AccountManagerCallback;Landroid/os/Handler;)Landroid/accounts/AccountManagerFuture;"),
    ),
)

/** OneGoogle account menu "Add another account" click handler. */
internal object OneGoogleAddAccountClickFingerprint : Fingerprint(
    name = "onClick",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    strings = listOf("ACCOUNT_MANAGER", "ADD_ACCOUNT_ACTIVITY", "com.google"),
)

// endregion

// region Play Books (BaseBooksActivity and AppSingleton)

/** BaseBooksActivity.onActivityResult: account picker result -> `Account(authAccount, "com.google")`. */
internal object BaseBooksActivityOnActivityResultFingerprint : Fingerprint(
    name = "onActivityResult",
    returnType = "V",
    parameters = listOf("I", "I", "Landroid/content/Intent;"),
    strings = listOf("authAccount", "com.google"),
    filters = listOf(
        newInstance("Landroid/accounts/Account;"),
        methodCall(smali = "Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V"),
    ),
)

/** BaseBooksActivity.onResume: picks the account and configures the allowed account types. */
internal object BaseBooksActivityOnResumeFingerprint : Fingerprint(
    name = "onResume",
    returnType = "V",
    parameters = listOf(),
    strings = listOf("GMSCore check: unresolvable error %s", "login_hint", "com.google"),
)

/** BaseBooksActivity: resolves the account of an intent (authAccount extra, email or AccountData). */
internal object BaseBooksActivityAccountFromIntentFingerprint : Fingerprint(
    returnType = "Landroid/accounts/Account;",
    parameters = listOf("Landroid/content/Intent;"),
    strings = listOf("authAccount", "email", "com.google"),
    filters = listOf(
        methodCall(smali = "Landroid/accounts/Account;-><init>(Ljava/lang/String;Ljava/lang/String;)V"),
    ),
)

/**
 * Account selected in the app, restored from SharedPreferences ("account" = name) as
 * `Account(name, "com.google")`. The account list compares name and type, so with a GmsCore account
 * the saved one never matched and the account picker opened on every start.
 */
internal object SavedAccountFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    parameters = listOf("L", "Landroid/content/SharedPreferences;"),
    strings = listOf("account", "com.google"),
    filters = listOf(
        methodCall(smali = "Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;"),
        newInstance("Landroid/accounts/Account;"),
    ),
)

/**
 * `AppSingleton.getAccountComponent(Account)` keys a ConcurrentMap by the whole Account,
 * so `(email, com.google)` and `(email, app.revanced)` would create two components that
 * open the same per-email DataStore files and crash.
 */
internal object AppSingletonGetAccountComponentFingerprint : Fingerprint(
    definingClass = "/AppSingleton;",
    name = "getAccountComponent",
    parameters = listOf("Landroid/accounts/Account;"),
    custom = { method, _ -> !AccessFlags.BRIDGE.isSet(method.accessFlags) },
)

/**
 * Lists the per-account storage directories ("accounts/<email>", "ext_accounts/<n>") as
 * `Account(email, "com.google")`. When the accounts change, AccountDirectoryAccountsChangedHandler
 * deletes every directory whose Account is not on the device. With a GmsCore account that never
 * matched, so downloaded books and the account's local data were deleted on every accounts change.
 */
internal object AccountDirectoriesFingerprint : Fingerprint(
    returnType = "Ljava/util/List;",
    parameters = listOf(),
    strings = listOf("com.google"),
    filters = listOf(
        methodCall(smali = "Ljava/io/File;->list()[Ljava/lang/String;"),
        methodCall(smali = "Ljava/io/File;->isDirectory()Z"),
        newInstance("Landroid/accounts/Account;"),
    ),
)

/**
 * `CapabilityFetcherImpl.getCapabilityForAccount(Account, Boolean)`: asks GoogleAuthUtil whether the
 * account has a capability and handles an IOException from Google Play services. GmsCore answers
 * the re-signed app with a SecurityException ("missing google package permission for ACCOUNT"),
 * which crashed the app, e.g. when opening an EPUB from a file manager.
 */
internal object CapabilityFetcherFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("Landroid/accounts/Account;", "Z"),
    strings = listOf("getCapabilityForAccount", "Capability IOException for GMS service"),
)

/**
 * Accounts that are supervised (Family Link, "service_uca"). If the query fails and no earlier answer
 * is stored, the app assumes a supervised account ("UnicornAccountDefaults__is_unicorn" defaults to
 * true) and hides Shop, Wishlist and the Shelves, Series and Upcoming tabs. With a GmsCore account
 * the query goes to Google Play services, which refuses the re-signed app.
 */
internal object SupervisedAccountsFingerprint : Fingerprint(
    returnType = "[Landroid/accounts/Account;",
    parameters = listOf(),
    strings = listOf("service_uca", "Found a unicorn account that can make purchases."),
)

// endregion
