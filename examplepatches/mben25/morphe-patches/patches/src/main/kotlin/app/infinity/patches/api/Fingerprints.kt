package app.infinity.patches.api

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.Opcode

/** The OAuth redirect URI the stock app ships with. */
internal const val STOCK_REDIRECT_URI = "infinity://localhost"

/**
 * Common substring of every user agent literal the app embeds.
 *
 * Deliberately excludes the leading `android:`, because some call sites embed the value
 * without that prefix (two of the eleven in 8.3.4). Keying on the prefixed form would
 * leave those requests identifying as the stock app.
 */
internal const val USER_AGENT_PREFIX = "ml.docilealligator.infinityforreddit:"

/**
 * Every call site of the native `APIUtils.getId()`, which returns the OAuth client ID
 * baked into `libinfinity.so`.
 *
 * `getId` is declared `native` and therefore has no bytecode body to rewrite, so the
 * patch has to rewrite the four call sites instead (APIUtils itself, LoginActivity,
 * AppAuthLoginActivity and LoginChromeCustomTabActivity as of 8.3.4). The method name
 * survives R8 because JNI binding is by name, which makes this a stable anchor.
 */
internal val clientIdFingerprint = Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lml/docilealligator/infinityforreddit/utils/APIUtils;",
            name = "getId",
            parameters = emptyList(),
            returnType = "Ljava/lang/String;"
        )
    )
)

/**
 * Every method embedding one of the app's user agent literals.
 *
 * Matched on the version-independent prefix rather than on the APK's version name:
 * 8.3.3 shipped two *stale* literals (8.3.0 and 8.3.0-beta2) left behind in unrelated
 * classes, and keying on the exact version would leave those un-spoofed. 8.3.4 happens
 * to carry only current literals, but the prefix costs nothing and survives the next slip.
 *
 * [Fingerprint.strings] compares with `String.contains`, so the prefix is enough.
 */
internal val anyUserAgentFingerprint = Fingerprint(
    strings = listOf(USER_AGENT_PREFIX)
)

/**
 * Every method embedding the default OAuth redirect URI.
 *
 * Scoped to the app's own package so the patch does not rewrite the literal inside
 * unrelated library code.
 */
internal val redirectUriFingerprint = Fingerprint(
    definingClass = "Lml/docilealligator",
    strings = listOf(STOCK_REDIRECT_URI)
)

/**
 * The obfuscated OAuth helpers that also embed the redirect URI (`ko` and `lp3` in
 * 8.3.4, `np.a$c` in 8.3.3 — the names and the count move every release).
 *
 * They sit outside the `ml.docilealligator` package, so [redirectUriFingerprint] cannot
 * reach them; without this the AppAuth login flow and the WebView client would still
 * send the stock redirect URI.
 */
internal val obfuscatedRedirectUriFingerprint = Fingerprint(
    strings = listOf(STOCK_REDIRECT_URI),
    custom = { _, classDef ->
        !classDef.type.startsWith("Lml/docilealligator") &&
                !classDef.type.startsWith("Lapp/morphe")
    }
)

/**
 * `Infinity->y()`, which force-opens the subscription/paywall activity on launch.
 *
 * In 8.3.3 this method no longer builds the `Intent` itself — it hands the flag to the
 * `SubscriptionActivityNew$c` companion via `b(Context;ZZLjava/lang/Integer;)V`. The
 * upstream Patcheddit fingerprint still required an `Intent-><init>` call inside
 * `Infinity`, which is why it stopped matching and failed the whole Spoof client patch.
 *
 * The `0x10008000` intent-flag literal (FLAG_ACTIVITY_NEW_TASK | FLAG_ACTIVITY_CLEAR_TOP)
 * did survive the refactor, so it is matched on its own and the boxing call that follows
 * it, which is a shape that holds across both the old and the new layout.
 */
internal val infinityStartSubscriptionActivityFingerprint = Fingerprint(
    definingClass = "Lml/docilealligator/infinityforreddit/Infinity;",
    filters = listOf(
        literal(0x10008000),
        methodCall(
            definingClass = "Ljava/lang/Integer;",
            name = "valueOf",
            opcode = Opcode.INVOKE_STATIC
        )
    )
)

/**
 * The billing client's `onServiceConnected` callback.
 *
 * The `"Billing service connected"` log literal is gone in 8.3.3, so this fingerprint is
 * expected to miss; the patch resolves it with `methodOrNull` and simply skips it. Kept
 * so older builds, which still carry the literal, continue to be handled.
 */
internal val billingClientOnServiceConnectedFingerprint = Fingerprint(
    strings = listOf("Billing service connected")
)
