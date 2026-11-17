package app.template.patches.beeper.premium

import app.morphe.patcher.Fingerprint

// The Beeper SDK reads the server's account caps from a JSON object ("max-accounts" and
// "max-accounts-per-bridge") and publishes them as two Integer flows; ChatAccountList turns those into
// ChatAccountListState.canAddAccount / maxAccountsPerBridge. The SDK class is R8-renamed, so it is found
// by the two JSON keys, which are protocol field names and cannot be renamed.
internal object SdkAccountCapsFingerprint : Fingerprint(
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("max-accounts", "max-accounts-per-bridge"),
    // The serializer descriptor's <clinit> holds the same two keys.
    custom = { method, _ -> method.name != "<clinit>" && method.implementation != null },
)

// ChatAccountsRepo.chatAccountsState builds the remaining-accounts counters (ChatAccountsState) from
// the same "max-accounts" value. The coroutine class name is kept by R8 (Kotlin debug metadata).
internal object RepoAccountCapFingerprint : Fingerprint(
    definingClass = "Lcom/beeper/bridge/ChatAccountsRepo\$chatAccountsState\$1;",
    name = "invokeSuspend",
    strings = listOf("max-accounts"),
)
