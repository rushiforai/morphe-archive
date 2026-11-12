/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.freeproxies

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.proxymenu.BLOCKED_COUNTRY
import app.morphe.patches.telegram.misc.proxymenu.PROXY_LIST
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgClassDefBy
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method

private const val PATCH = "Free proxies"
internal const val FREE_PROXIES = "$EXTENSION_PACKAGE/misc/FreeProxies;"
internal const val TELEGRAM_PROXIES = "$EXTENSION_PACKAGE/misc/TelegramProxies;"
internal const val SIGN_IN_BUTTON = "$FREE_PROXIES->signInButton(I)Z"
internal const val SHARED_CONFIG = "Lorg/telegram/messenger/SharedConfig;"
internal const val PROXY_INFO = "Lorg/telegram/messenger/SharedConfig\$ProxyInfo;"
internal const val CONNECTIONS_MANAGER = "Lorg/telegram/tgnet/ConnectionsManager;"
internal const val CONNECTION_STATE = "$CONNECTIONS_MANAGER->getConnectionState()I"
private const val GLOBAL_SETTINGS =
    "Lorg/telegram/messenger/MessagesController;->getGlobalMainSettings()Landroid/content/SharedPreferences;"
private const val NOTIFICATIONS = "Lorg/telegram/messenger/NotificationCenter;"
private const val PREFERENCES = "Landroid/content/SharedPreferences;"
private const val EDITOR = "Landroid/content/SharedPreferences\$Editor;"
private const val URI = "Landroid/net/Uri;"
private const val LIST_EMPTY = "Ljava/util/ArrayList;->isEmpty()Z"
internal const val PROXY_ORDER = "$EXTENSION_PACKAGE/misc/ProxyOrder;"
internal const val PROXY_ORDER_SORT = "${PROXY_ORDER}->sort(Ljava/util/List;Ljava/util/Comparator;)V"
internal const val PROXY_LIST_SCREEN = "Lorg/telegram/ui/ProxyListActivity;"
internal const val SORT = "Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V"
private const val ADD_ALL = "Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z"
private const val PROXY_ENABLED = "proxy_enabled"
private const val SIGN_IN_LABEL = "hush_sign_in_proxy"

/**
 * Free proxies (#66).
 *
 * The extension's FreeProxies downloads a public MTProto list, times a connect to each proxy and
 * keeps the fastest in Telegram's proxy list. Telegram's proxy classes have a new obfuscated name
 * in every build, so the patch writes TelegramProxies' stubs with the names it finds: the list
 * entry (`SharedConfig.ProxyInfo`), and the address it holds, found as the second parameter of
 * `ConnectionsManager.setProxySettings`, with that class's link reader and settings writer.
 *
 * The phone number screen shows its proxy button only with a proxy on, or where Telegram is
 * blocked and a proxy is saved. The patch asks the extension right before the blockedCountry read,
 * and true jumps to where the proxy-on path shows the button.
 */
@Suppress("unused")
val freeProxiesPatch = bytecodePatch(
    name = PATCH,
    description = "Downloads a public list of MTProto proxies, times them and keeps the 10 fastest in Telegram's " +
        "proxy list, refreshed every 6 hours. Telegram connects through them unless you use a proxy of your own. " +
        "The phone number screen also always has the proxy button, so you can add one before you sign in, " +
        "and Proxy order puts Telegram's proxy list in an order of your own, with pinned proxies on top. " +
        "Finding proxies starts off. Turn it on in HushTelegram settings > Chat list.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        // Both are found before either changes, so a build missing one keeps Telegram as it was.
        val calls = resolveProxyCalls()
        val site = resolveSignInProxy()
        // Proxy order stands on its own: a build whose proxy screen moved keeps the rest.
        val order = try {
            resolveProxyOrder()
        } catch (unfit: PatchException) {
            patchLog.warning("$PATCH: ${unfit.message}. The patch goes on without proxy order.")
            null
        }
        writeProxyStubs(calls)
        val free = site.method.freeLocalsAt(PATCH, site.read, 1, listOf(site.show)).single()
        site.method.addInstructionsWithLabels(
            site.read,
            """
                const/4 v$free, 0x1
                invoke-static {v$free}, $SIGN_IN_BUTTON
                move-result v$free
                if-nez v$free, :$SIGN_IN_LABEL
            """,
            ExternalLabel(SIGN_IN_LABEL, site.method.getInstruction(site.show)),
        )
        if (order != null) {
            order.apply()
            enableCapability("proxyOrder")
        }
        enableStatus("freeProxies")
    }
}

/**
 * Telegram's proxy classes in this build, by the build's names: [info] the list entry, [data] the
 * address, port and secret it holds in [field], made into an entry by [init], read from a link by
 * [parse] and written to Telegram's settings by [write].
 */
internal class ProxyCalls(
    val info: String,
    val data: String,
    val init: String,
    val field: String,
    val parse: String,
    val write: String,
)

internal fun BytecodePatchContext.resolveProxyCalls(): ProxyCalls {
    requireStatusMethod("freeProxies")
    controlHook(FREE_PROXIES, "signInButton", listOf("I"), "Z")
    val apply = tgClassDefBy(CONNECTIONS_MANAGER).methods.filter {
        it.name == "setProxySettings" && AccessFlags.STATIC.isSet(it.accessFlags) && it.returnType == "V" &&
            it.parameterTypes.size == 2 && it.parameterTypes[0].toString() == "Z"
    }.controlSingle("Telegram's call that connects through a proxy")
    val data = apply.parameterTypes[1].toString()
    controlShape(data.startsWith("L"), "Telegram's proxy call no longer takes a proxy object")
    val holder = tgClassDefBy(data)
    val info = tgClassDefBy(PROXY_INFO)
    val init = info.methods.filter { it.name == "<init>" && it.parameterTypeNames() == listOf(data) }
        .controlSingle("the proxy list entry made from a proxy")
    val field = info.fields.filter { it.type == data && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .controlSingle("the proxy a proxy list entry holds")
    val parse = holder.methods.filter {
        AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypeNames() == listOf(URI) && it.returnType == data
    }.controlSingle("Telegram's proxy link reader")
    val write = holder.methods.filter {
        !AccessFlags.STATIC.isSet(it.accessFlags) && it.parameterTypeNames() == listOf(EDITOR) && it.returnType == "V"
    }.controlSingle("Telegram's proxy settings writer")
    // FreeProxies tells a saved proxy from a new one by equals, as Telegram's addProxy does.
    controlShape(holder.methods.any {
        it.name == "equals" && it.parameterTypeNames() == listOf("Ljava/lang/Object;") && it.returnType == "Z" &&
            !AccessFlags.STATIC.isSet(it.accessFlags)
    }, "Telegram's proxy no longer compares by its address, port and secret")
    controlShape(
        listOf(info.accessFlags, holder.accessFlags, init.accessFlags, field.accessFlags, parse.accessFlags,
            write.accessFlags, apply.accessFlags).all { AccessFlags.PUBLIC.isSet(it) },
        "Telegram's proxy classes are no longer public",
    )
    return ProxyCalls(
        info = info.type,
        data = data,
        init = "${info.type}-><init>($data)V",
        field = "${info.type}->${field.name}:$data",
        parse = "$data->${parse.name}($URI)$data",
        write = "$data->${write.name}($EDITOR)V",
    )
}

private fun Method.parameterTypeNames() = parameterTypes.map(CharSequence::toString)

/** The phone number screen's proxy button update, its blockedCountry read at [read], and [show], where the proxy-on path shows the button. */
internal class SignInProxySite(val method: MutableMethod, val read: Int, val show: Int)

internal fun BytecodePatchContext.resolveSignInProxy(): SignInProxySite {
    val updates = mutableListOf<Pair<String, Method>>()
    forEachClassMentioning(
        Mention.string(PROXY_ENABLED) and Mention.reference(BLOCKED_COUNTRY) and Mention.reference(CONNECTION_STATE),
    ) { cls ->
        cls.methods.filter { method ->
            method.controlBody().let { body ->
                body.any { it.controlString() == PROXY_ENABLED } && body.any { it.controlRef() == BLOCKED_COUNTRY } &&
                    body.any { it.controlRef() == CONNECTION_STATE }
            }
        }.forEach { updates += cls.type to it }
    }
    val (type, found) = updates.controlSingle("the phone number screen's proxy button update")
    val method = tgMutableClassDefBy(type).methods.single {
        it.name == found.name && it.returnType == found.returnType && it.parameterTypeNames() == found.parameterTypeNames()
    }
    val body = method.controlBody()
    val flow = ControlFlow.of(method)
    val read = body.indices.filter { body[it].opcode == Opcode.IGET_BOOLEAN && body[it].controlRef() == BLOCKED_COUNTRY }
        .controlSingle("the phone number screen's blocked country read")
    controlShape(read in 3 until body.size - 6, "the phone number screen's blocked country read has no proxy checks around it")
    val country = body[read].namedRegisters().first()
    controlShape(
        body[read + 1].opcode == Opcode.IF_EQZ && body[read + 1].namedRegisters() == listOf(country) &&
            body[read + 2].opcode == Opcode.SGET_OBJECT && body[read + 2].controlRef() == PROXY_LIST &&
            body[read + 3].controlRef() == LIST_EMPTY && body[read + 4].opcode == Opcode.MOVE_RESULT &&
            body[read + 5].opcode == Opcode.IF_EQZ,
        "the phone number screen no longer checks for a saved proxy after the blocked country",
    )
    // Telegram reads the controller for the blocked country only once the proxy-on path has
    // returned, and that path is what shows the button at once.
    controlShape(body[read - 3].opcode == Opcode.RETURN_VOID, "the phone number screen's proxy-on path no longer ends before the blocked country")
    val gate = body.indices.filter { at ->
        body[at].opcode == Opcode.IF_EQZ && flow.normal[at].toSet() == setOf(at + 1, read - 2)
    }.controlSingle("the phone number screen's proxy-on check")
    val show = gate + 1
    controlShape(
        show + 3 == read - 3 && body[show].opcode == Opcode.IGET_OBJECT && body[show + 1].call() != null &&
            body[show + 2].call() != null,
        "the phone number screen's proxy-on path no longer just shows the button",
    )
    controlShape(
        flow.normal[read - 1] == listOf(read) && body.indices.none { at -> at != read - 1 && read in flow.normal[at] },
        "the phone number screen's blocked country read has another way in",
    )
    return SignInProxySite(method, read, show)
}

/** The proxy screen's row update [method], and [at], its one sort of the proxies it's about to show. */
internal class ProxyOrderSite(val method: MutableMethod, val at: Int) {
    /** Hands the sort, with the same list and Telegram's comparator, to ProxyOrder. */
    fun apply() {
        val registers = method.controlBody()[at].namedRegisters()
        method.replaceInstruction(at, "invoke-static {${registers.joinToString { "v$it" }}}, $PROXY_ORDER_SORT")
    }
}

/**
 * Telegram's proxy screen copies the proxy list into the rows it shows and sorts them, the one in
 * use first and the rest by speed. Saving the list sorts it the same way, so this sort is where an
 * order of the person's own can go.
 */
internal fun BytecodePatchContext.resolveProxyOrder(): ProxyOrderSite {
    requireStatusMethod("proxyOrder")
    controlHook(PROXY_ORDER, "sort", listOf("Ljava/util/List;", "Ljava/util/Comparator;"), "V")
    val screen = tgMutableClassDefByOrNull(PROXY_LIST_SCREEN)
    controlShape(screen != null, "Telegram's proxy screen is missing")
    val method = screen!!.methods.filter { method -> method.controlBody().any { it.controlRef() == SORT } }
        .controlSingle("the proxy screen's sort")
    controlShape(method.returnType == "V" && method.parameterTypeNames() == listOf("Z") &&
        !AccessFlags.STATIC.isSet(method.accessFlags), "the proxy screen's row update changed shape")
    val body = method.controlBody()
    val at = body.indices.filter { body[it].controlRef() == SORT }.controlSingle("the proxy screen's one sort")
    controlShape(body[at].opcode == Opcode.INVOKE_STATIC && body[at].namedRegisters().size == 2,
        "the proxy screen's sort is no longer a plain call")
    val copied = body.indices.filter { body[it].controlRef() == PROXY_LIST && it < at }
    controlShape(copied.isNotEmpty() && body.indices.any { it in copied.first() until at && body[it].controlRef() == ADD_ALL },
        "the proxy screen no longer sorts a copy of Telegram's proxy list")
    return ProxyOrderSite(method, at)
}

/** TelegramProxies' stubs, each a few instructions on the classes found for this build. */
private fun BytecodePatchContext.writeProxyStubs(calls: ProxyCalls) {
    writeStub(TELEGRAM_PROXIES, "parse", 2, """
        invoke-static { p0 }, ${calls.parse}
        move-result-object v0
        return-object v0
    """)
    // addProxy hands back the entry already saved for the same proxy, or saves this one on top.
    writeStub(TELEGRAM_PROXIES, "add", 2, """
        new-instance v0, ${calls.info}
        check-cast p0, ${calls.data}
        invoke-direct { v0, p0 }, ${calls.init}
        invoke-static { v0 }, $SHARED_CONFIG->addProxy($PROXY_INFO)$PROXY_INFO
        move-result-object v0
        return-object v0
    """)
    // What tapping a proxy in Telegram's list does: Use proxy on, the proxy written to the
    // settings, the connection moved and the screens told.
    writeStub(TELEGRAM_PROXIES, "use", 5, """
        check-cast p0, ${calls.info}
        invoke-static { }, $GLOBAL_SETTINGS
        move-result-object v0
        invoke-interface { v0 }, $PREFERENCES->edit()$EDITOR
        move-result-object v0
        const-string v1, "$PROXY_ENABLED"
        const/4 v2, 0x1
        invoke-interface { v0, v1, v2 }, $EDITOR->putBoolean(Ljava/lang/String;Z)$EDITOR
        iget-object v1, p0, ${calls.field}
        invoke-virtual { v1, v0 }, ${calls.write}
        invoke-interface { v0 }, $EDITOR->commit()Z
        sput-object p0, $SHARED_CONFIG->currentProxy:$PROXY_INFO
        invoke-static { v2, v1 }, $CONNECTIONS_MANAGER->setProxySettings(Z${calls.data})V
        invoke-static { }, $NOTIFICATIONS->getGlobalInstance()$NOTIFICATIONS
        move-result-object v0
        sget v2, $NOTIFICATIONS->proxySettingsChanged:I
        const/4 v3, 0x0
        new-array v3, v3, [Ljava/lang/Object;
        invoke-virtual { v0, v2, v3 }, $NOTIFICATIONS->postNotificationName(I[Ljava/lang/Object;)V
        return-void
    """)
    writeStub(TELEGRAM_PROXIES, "enabled", 3, """
        invoke-static { }, $GLOBAL_SETTINGS
        move-result-object v0
        const-string v1, "$PROXY_ENABLED"
        const/4 v2, 0x0
        invoke-interface { v0, v1, v2 }, $PREFERENCES->getBoolean(Ljava/lang/String;Z)Z
        move-result v0
        return v0
    """)
    writeStub(TELEGRAM_PROXIES, "current", 1, """
        sget-object v0, $SHARED_CONFIG->currentProxy:$PROXY_INFO
        return-object v0
    """)
    writeStub(TELEGRAM_PROXIES, "proxies", 1, """
        invoke-static { }, $SHARED_CONFIG->loadProxyList()V
        sget-object v0, $PROXY_LIST
        return-object v0
    """)
    writeStub(TELEGRAM_PROXIES, "proxy", 2, """
        check-cast p0, ${calls.info}
        iget-object v0, p0, ${calls.field}
        return-object v0
    """)
    // ProxyOrder knows a proxy by what this writes, which is the same in every build.
    writeStub(TELEGRAM_PROXIES, "describe", 3, """
        check-cast p0, ${calls.info}
        iget-object v0, p0, ${calls.field}
        invoke-virtual { v0, p1 }, ${calls.write}
        return-void
    """)
    writeStub(TELEGRAM_PROXIES, "delete", 1, """
        check-cast p0, ${calls.info}
        invoke-static { p0 }, $SHARED_CONFIG->deleteProxy($PROXY_INFO)V
        return-void
    """)
    writeStub(TELEGRAM_PROXIES, "rotate", 1, """
        const/4 v0, 0x1
        sput-boolean v0, $SHARED_CONFIG->proxyRotationEnabled:Z
        invoke-static { }, $SHARED_CONFIG->saveConfig()V
        return-void
    """)
}
