/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.chattypefolders.CLIENT_ACTIVATED
import app.morphe.patches.telegram.misc.chattypefolders.CLIENT_USER_ID
import app.morphe.patches.telegram.misc.chattypefolders.USER_CONFIG
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy

internal const val HIDDEN_ACCOUNTS = "$EXTENSION_PACKAGE/misc/HiddenAccounts;"
private const val ADD_ACCOUNT_LABEL = "Lorg/telegram/messenger/R\$string;->AddAccount:I"
private const val ACCOUNTS_HOOK = "$HIDDEN_ACCOUNTS->activated(Ljava/lang/Object;)Z"

/**
 * The account lists Telegram builds (the switcher on the main screen and the one in Settings):
 * each is a method that adds the Add account row and asks every account slot whether it is
 * signed in. [calls] are those questions, to be put to the extension instead.
 */
internal class HiddenAccountsPlan(val calls: List<Pair<MutableMethod, List<Int>>>)

/** What [resolveHiddenAccounts] found: the plan, or why this build's account lists can't hide an account. */
internal class HiddenAccountsResult(val plan: HiddenAccountsPlan?, val missing: String?)

/**
 * Finds the account lists and checks the stubs can be given Telegram's code, or reports why not.
 * Nothing is changed until [applyHiddenAccounts], so a refusal leaves the app untouched.
 */
internal fun BytecodePatchContext.resolveHiddenAccounts(): HiddenAccountsResult {
    fun refuse(why: String) = HiddenAccountsResult(null, why)
    try {
        requireStatusMethod("hiddenAccounts")
        controlHook(HIDDEN_ACCOUNTS, "activated", listOf("Ljava/lang/Object;"), "Z")
        controlHook(HIDDEN_ACCOUNTS, "isActive", listOf("Ljava/lang/Object;"), "Z")
        controlHook(HIDDEN_ACCOUNTS, "userIdOf", listOf("Ljava/lang/Object;"), "J")
    } catch (failed: Exception) {
        return refuse("the account hider's hooks are missing (${failed.javaClass.simpleName}: ${failed.message})")
    }
    val lists = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.reference(ADD_ACCOUNT_LABEL) and Mention.reference(CLIENT_ACTIVATED)) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.filter { m ->
            m.controlBody().let { body -> body.any { it.controlRef() == ADD_ACCOUNT_LABEL } && body.any { it.controlRef() == CLIENT_ACTIVATED } }
        }.forEach { lists += cls.type to "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
    }
    if (lists.isEmpty()) return refuse("Telegram's account lists are missing")
    val calls = mutableListOf<Pair<MutableMethod, List<Int>>>()
    for ((type, signature) in lists) {
        val method = tgMutableClassDefBy(type).methods.single { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == signature }
        val body = method.controlBody()
        val at = body.indices.filter { body[it].controlRef() == CLIENT_ACTIVATED }
        // A plain one-register call, so it can be swapped for a static call on the same register.
        if (!at.all { body[it].opcode == Opcode.INVOKE_VIRTUAL && body[it].namedRegisters().size == 1 }) {
            return refuse("an account list no longer asks with a plain call ($type)")
        }
        calls += method to at
    }
    return HiddenAccountsResult(HiddenAccountsPlan(calls), null)
}

/** The stubs' bodies: the signed-in question as Telegram answers it, and who the account is. */
internal fun BytecodePatchContext.writeHiddenAccountsStubs() {
    writeStub(HIDDEN_ACCOUNTS, "isActive", 2, """
        check-cast p0, $USER_CONFIG
        invoke-virtual {p0}, $CLIENT_ACTIVATED
        move-result v0
        return v0
    """)
    writeStub(HIDDEN_ACCOUNTS, "userIdOf", 3, """
        check-cast p0, $USER_CONFIG
        invoke-virtual {p0}, $CLIENT_USER_ID
        move-result-wide v0
        return-wide v0
    """)
}

/** Puts each account list's signed-in questions to the extension, on the same register. */
internal fun applyHiddenAccounts(plan: HiddenAccountsPlan) {
    for ((method, at) in plan.calls) {
        for (index in at) {
            val register = method.controlBody()[index].namedRegisters().single()
            method.replaceInstruction(index, "invoke-static {v$register}, $ACCOUNTS_HOOK")
        }
    }
}
