/*
 * Adapted from Hushfacebook's SharedPermissions.kt at
 * https://github.com/SysAdminDoc/Hushfacebook/blob/15b8e9ed9315464a3e2d1a821b4e26ad47bbc28c/patches/src/main/kotlin/app/morphe/patches/facebook/coexist/SharedPermissions.kt
 * Copyright 2026 Hushfacebook contributors. GPL-3.0.
 */
package app.hushmessenger.patches.coexist

import app.hushmessenger.patches.MessengerTarget
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Document
import org.w3c.dom.Element

private const val PATCH_NAME = "Install beside Meta apps"
private const val META_PREFIX = "com.facebook."
private const val SHARED_PREFIX = "app.hushfacebook."
private const val APP_COMMUNICATION = "com.facebook.permission.prod.FB_APP_COMMUNICATION"
private const val RECEIVER_ACCESS = "com.facebook.receiver.permission.ACCESS"
private const val APP_COMMUNICATION_FORMAT = "com.facebook.permission.%s.FB_APP_COMMUNICATION"

private val sharedNames = listOf(APP_COMMUNICATION, RECEIVER_ACCESS)
private val dexNames = sharedNames + APP_COMMUNICATION_FORMAT
private val expectedManifestMentions = mapOf(APP_COMMUNICATION to 26, RECEIVER_ACCESS to 3)
private val expectedManifestRoles = mapOf(
    APP_COMMUNICATION to mapOf(
        "permission:name" to 1,
        "uses-permission:name" to 1,
        "activity:permission" to 7,
        "provider:permission" to 1,
        "receiver:permission" to 13,
        "service:permission" to 3,
    ),
    RECEIVER_ACCESS to mapOf(
        "permission:name" to 1,
        "uses-permission:name" to 1,
        "receiver:permission" to 1,
    ),
)

// Component names and instruction sites match both supported arm64 APKs.
internal val expectedGuardOwners = mapOf(
    APP_COMMUNICATION to mapOf(
        "activity" to setOf(
            "com.facebook.messenger.intents.SecureIntentHandlerActivity",
            "com.facebook.messenger.intents.SecureSameTaskIntentHandlerActivity",
            "com.facebook.common.keyguard.KeyguardPendingIntentActivity",
            "com.facebook.messaging.marketplace.viewlisting.ThreadNotificationViewListingActivity",
            "com.facebook.messaging.integrity.supportinbox.ui.detail.MessengerSupportInboxItemDetailActivity",
            "com.facebook.messaging.rtc.incall.activity.InCallActivity",
            "com.facebook.messaging.threadmute.ThreadNotificationMuteDialogActivity",
        ),
        "provider" to setOf("com.facebook.messaging.push.dedup.provider.ClientMessagePushDedupInfoProvider"),
        "receiver" to setOf(
            "com.facebook.messaging.bubbles.shortcuts.BubblesShortcutsThreadsRemovedBroadcastReceiver",
            "com.facebook.messaging.chatheads.service.ChatHeadsServiceBroadcastReceiver",
            "com.facebook.messaging.notify.client.MessagesNotificationBroadcastReceiver",
            "com.facebook.messaging.stella.contacts.StellaContactBroadcastReceiver",
            "com.facebook.messaging.integrity.featurelimits.alarmmanager.FeatureLimitExpiredBroadcastReceiver",
            "com.facebook.messaging.bubbles.receiver.BubblesBroadcastReceiver",
            "com.facebook.conditionalworker.ConditionalWorkerServiceReceiver",
            "com.facebook.messaging.livelocation.bindings.MessengerForegroundLiveLocationBroadcastReceiver",
            "com.facebook.rtc.receivers.RtcStartCallReceiver",
            "com.facebook.rtc.receivers.RtcShowCallUiReceiver",
            "com.facebook.rtc.receivers.RtcPictureInPictureReceiver",
            "com.facebook.push.negativefeedback.PushNegativeFeedbackReceiver",
            "com.facebook.delayedworker.DelayedWorkerServiceReceiver",
        ),
        "service" to setOf(
            "com.facebook.rtc.notification.metaai.MetaAiNotificationForegroundService",
            "com.facebook.rtc.notification.RtcNotificationForegroundService",
            "com.facebook.rp.platform.metaai.rsys.service.MetaAICallDismissalService",
        ),
    ),
    RECEIVER_ACCESS to mapOf(
        "receiver" to setOf("com.facebook.device_id.UniqueIdSupplier"),
    ),
)

internal val expectedDexSites = mapOf(
    "LX/0iX;->A04(Landroid/app/Application;)V@18" to APP_COMMUNICATION_FORMAT,
    "LX/15l;->A03()V@25" to APP_COMMUNICATION,
    "LX/1f4;->A05(Lcom/facebook/auth/usersession/FbUserSession;LX/1f4;Ljava/lang/String;Ljava/lang/String;)V@36" to APP_COMMUNICATION,
    "LX/2Qr;->A01(Landroid/content/Intent;LX/2Qr;)V@24" to APP_COMMUNICATION_FORMAT,
    "LX/33K;->A04(LX/5X3;Ljava/lang/Object;II)Ljava/lang/Object;@1433" to APP_COMMUNICATION_FORMAT,
    "Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;->A0Z(Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;I)V@507" to APP_COMMUNICATION_FORMAT,
)

/** The same six loads in build 346013370, under that build's names. Generated from its record. */
internal val expectedDexSites346013370 = mapOf(
    "LX/0iY;->A04(Landroid/app/Application;)V@18" to APP_COMMUNICATION_FORMAT,
    "LX/15l;->A03()V@25" to APP_COMMUNICATION,
    "LX/1f3;->A05(Lcom/facebook/auth/usersession/FbUserSession;LX/1f3;Ljava/lang/String;Ljava/lang/String;)V@36" to APP_COMMUNICATION,
    "LX/2Qq;->A01(Landroid/content/Intent;LX/2Qq;)V@24" to APP_COMMUNICATION_FORMAT,
    "LX/33J;->A04(LX/5X7;Ljava/lang/Object;II)Ljava/lang/Object;@1433" to APP_COMMUNICATION_FORMAT,
    "Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;->A0Z(Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;I)V@894" to APP_COMMUNICATION_FORMAT,
)

/** The same six loads in build 346013423, under that build's names. Generated from its record. */
internal val expectedDexSites346013423 = mapOf(
    "LX/0Vx;->A03()V@25" to APP_COMMUNICATION,
    "LX/0iV;->A04(Landroid/app/Application;)V@18" to APP_COMMUNICATION_FORMAT,
    "LX/1fv;->A05(Lcom/facebook/auth/usersession/FbUserSession;LX/1fv;Ljava/lang/String;Ljava/lang/String;)V@36" to APP_COMMUNICATION,
    "LX/2S3;->A01(Landroid/content/Intent;LX/2S3;)V@24" to APP_COMMUNICATION_FORMAT,
    "LX/34l;->A05(Ljava/lang/Object;IILX/5aO;)Ljava/lang/Object;@816" to APP_COMMUNICATION_FORMAT,
    "Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;->A0Z(Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;I)V@772" to APP_COMMUNICATION_FORMAT,
)

/** The same six loads in builds 346013357, 346013358, 346013359, 346013391, 346013443, 346013444 and 346013445. Generated from 346013357's record. */
internal val expectedDexSites346013357 = mapOf(
    "LX/0iX;->A04(Landroid/app/Application;)V@18" to APP_COMMUNICATION_FORMAT,
    "LX/15l;->A03()V@25" to APP_COMMUNICATION,
    "LX/1f4;->A05(Lcom/facebook/auth/usersession/FbUserSession;LX/1f4;Ljava/lang/String;Ljava/lang/String;)V@36" to APP_COMMUNICATION,
    "LX/2Qr;->A01(Landroid/content/Intent;LX/2Qr;)V@24" to APP_COMMUNICATION_FORMAT,
    "LX/33K;->A04(LX/5Ww;Ljava/lang/Object;II)Ljava/lang/Object;@1433" to APP_COMMUNICATION_FORMAT,
    "Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;->A0Z(Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;I)V@507" to APP_COMMUNICATION_FORMAT,
)

/** The same six loads in builds 346013374 and 346013375. Generated from 346013374's record. */
internal val expectedDexSites346013374 = mapOf(
    "LX/0iY;->A04(Landroid/app/Application;)V@18" to APP_COMMUNICATION_FORMAT,
    "LX/15l;->A03()V@25" to APP_COMMUNICATION,
    "LX/1f3;->A05(Lcom/facebook/auth/usersession/FbUserSession;LX/1f3;Ljava/lang/String;Ljava/lang/String;)V@36" to APP_COMMUNICATION,
    "LX/2Qq;->A01(Landroid/content/Intent;LX/2Qq;)V@24" to APP_COMMUNICATION_FORMAT,
    "LX/33J;->A03(Ljava/lang/Object;LX/5Yu;II)Ljava/lang/Object;@1514" to APP_COMMUNICATION_FORMAT,
    "Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;->A0Z(Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;I)V@821" to APP_COMMUNICATION_FORMAT,
)

/** The same six loads in all 16 builds of 581.0.0.49.91. Generated from 346213494's record. */
internal val expectedDexSites346213494 = mapOf(
    "LX/0S7;->A03()V@25" to APP_COMMUNICATION,
    "LX/0iw;->A04(Landroid/app/Application;)V@18" to APP_COMMUNICATION_FORMAT,
    "LX/1ev;->A05(Lcom/facebook/auth/usersession/FbUserSession;LX/1ev;Ljava/lang/String;Ljava/lang/String;)V@38" to APP_COMMUNICATION,
    "LX/2Fd;->A01(Landroid/content/Intent;LX/2Fd;)V@24" to APP_COMMUNICATION_FORMAT,
    "LX/33E;->A04(ILX/5ac;Ljava/lang/Object;)Ljava/lang/Object;@135" to APP_COMMUNICATION_FORMAT,
    "Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;->A0a(Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;I)V@507" to APP_COMMUNICATION_FORMAT,
)

/** Each supported build's permission loads, by version code, as scripts/profiles records them. */
internal val expectedDexSitesByBuild: Map<Int, Map<String, String>> = mapOf(
    346013387 to expectedDexSites,
    346013440 to expectedDexSites,
    346013442 to expectedDexSites,
    346013354 to expectedDexSites,
    346013370 to expectedDexSites346013370,
    346013394 to expectedDexSites,
    346013423 to expectedDexSites346013423,
    346013355 to expectedDexSites,
    346013356 to expectedDexSites,
    346013357 to expectedDexSites346013357,
    346013358 to expectedDexSites346013357,
    346013359 to expectedDexSites346013357,
    346013372 to expectedDexSites346013370,
    346013374 to expectedDexSites346013374,
    346013375 to expectedDexSites346013374,
    346013391 to expectedDexSites346013357,
    346013427 to expectedDexSites346013423,
    346013441 to expectedDexSites,
    346013443 to expectedDexSites346013357,
    346013444 to expectedDexSites346013357,
    346013445 to expectedDexSites346013357,
    346213494 to expectedDexSites346213494,
    346213498 to expectedDexSites346213494,
    346213510 to expectedDexSites346213494,
    346213514 to expectedDexSites346213494,
    346213528 to expectedDexSites346213494,
    346213531 to expectedDexSites346213494,
    346213532 to expectedDexSites346213494,
    346213564 to expectedDexSites346213494,
    346213567 to expectedDexSites346213494,
    346213568 to expectedDexSites346213494,
    346213580 to expectedDexSites346213494,
    346213581 to expectedDexSites346213494,
    346213582 to expectedDexSites346213494,
    346213583 to expectedDexSites346213494,
    346213584 to expectedDexSites346213494,
    346213585 to expectedDexSites346213494,
)

internal fun expectedDexSitesFor(
    versionCode: String?,
    sites: Map<Int, Map<String, String>> = expectedDexSitesByBuild,
): Map<String, String> = versionCode?.toIntOrNull()?.let(sites::get) ?: expectedDexSites

private fun renamed(name: String): String =
    SHARED_PREFIX + name.removePrefix(META_PREFIX)

private fun unsupportedApk(reason: String, versions: Map<String, List<Int>> = MessengerTarget.VERSIONS) =
    PatchException("$PATCH_NAME: $reason. Use an unmodified arm64 Messenger ${MessengerTarget.supportedApks(versions)}.")

internal fun validateVersionCode(versionCode: String, versions: Map<String, List<Int>> = MessengerTarget.VERSIONS) {
    if (versions.values.none { versionCode.toIntOrNull() in it }) {
        throw unsupportedApk("version code $versionCode is not supported", versions)
    }
}

/**
 * Rename declarations, requests and guarded components together. Removing a declaration would
 * let Messenger install but leave its signature-protected receivers and services unprotected.
 */
internal fun Document.renameSharedPermissions() {
    val mentions = sharedNames.associateWith { mutableListOf<org.w3c.dom.Attr>() }
    val declarations = sharedNames.associateWith { 0 }.toMutableMap()
    val protectionLevels = mutableMapOf<String, String>()
    val roles = sharedNames.associateWith { mutableMapOf<String, Int>() }
    val guardOwners = sharedNames.associateWith { mutableMapOf<String, MutableSet<String>>() }
    val renamedNames = sharedNames.map(::renamed).toSet()
    val elements = getElementsByTagName("*")
    for (i in 0 until elements.length) {
        val element = elements.item(i) as? Element ?: continue
        val attributes = element.attributes
        for (j in 0 until attributes.length) {
            val attr = attributes.item(j) as? org.w3c.dom.Attr ?: continue
            if (attr.value in renamedNames) {
                throw unsupportedApk("${attr.value} is already in the manifest")
            }
            if (attr.value !in sharedNames) continue
            mentions.getValue(attr.value).add(attr)
            val role = "${element.tagName}:${attr.nodeName.substringAfter(':')}"
            roles.getValue(attr.value).merge(role, 1, Int::plus)
            if (role.endsWith(":permission")) {
                guardOwners.getValue(attr.value)
                    .getOrPut(element.tagName) { mutableSetOf() }
                    .add(element.getAttribute("android:name"))
            }
            if (element.tagName == "permission" && attr.nodeName.substringAfter(':') == "name") {
                declarations[attr.value] = declarations.getValue(attr.value) + 1
                protectionLevels[attr.value] = element.getAttribute("android:protectionLevel")
            }
        }
    }
    for (name in sharedNames) {
        if (declarations.getValue(name) != 1) {
            throw unsupportedApk("the manifest must declare $name exactly once")
        }
        val level = protectionLevels.getValue(name).trim()
        val numericLevel = if (level.startsWith("0x", ignoreCase = true)) level.substring(2).toLongOrNull(16)
            else level.toLongOrNull()
        if (level != "signature" && numericLevel != 2L) {
            throw unsupportedApk("the protection level for $name must remain signature (0x2)")
        }
        val actual = mentions.getValue(name).size
        val expected = expectedManifestMentions.getValue(name)
        if (actual != expected) {
            throw unsupportedApk("expected $expected manifest uses of $name, found $actual")
        }
        if (roles.getValue(name) != expectedManifestRoles.getValue(name)) {
            throw unsupportedApk("manifest roles for $name differ from the tested build")
        }
        if (guardOwners.getValue(name) != expectedGuardOwners.getValue(name)) {
            throw unsupportedApk("component guards for $name differ from the tested build")
        }
    }
    mentions.values.flatten().forEach { it.value = renamed(it.value) }
}

private val validatePermissionBytecode = bytecodePatch(description = "Validate Messenger shared-permission bytecode") {
    execute {
        validateVersionCode(packageMetadata.versionCode)
        checkedPermissionMethods()
    }
}

private val renameManifest = resourcePatch(description = "Rename Messenger shared permissions") {
    dependsOn(validatePermissionBytecode)
    execute {
        validateVersionCode(packageMetadata.versionCode)
        document("AndroidManifest.xml").use { it.renameSharedPermissions() }
    }
}

private fun Instruction.sharedName(): String? {
    if (opcode != Opcode.CONST_STRING && opcode != Opcode.CONST_STRING_JUMBO) return null
    val literal = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
    return literal?.takeIf { it in dexNames }
}

private fun Method.hasSharedName(): Boolean =
    implementation?.instructions?.any { it.sharedName() != null } == true

private fun Method.siteId(index: Int): String =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType@$index"

internal fun validateDexSites(
    sites: List<Pair<String, String>>,
    expected: Map<String, String> = expectedDexSites,
    versions: Map<String, List<Int>> = MessengerTarget.VERSIONS,
) {
    if (sites.size != expected.size) {
        throw unsupportedApk("expected ${expected.size} permission loads, found ${sites.size}", versions)
    }
    if (sites.toMap() != expected) {
        throw unsupportedApk("permission instruction sites differ from the tested build", versions)
    }
}

private fun MutableMethod.renameSharedNames(): Int {
    val sites = (implementation ?: return 0).instructions.withIndex()
        .mapNotNull { (index, instruction) -> instruction.sharedName()?.let { index to it } }
    for ((index, oldName) in sites.asReversed()) {
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        if (register > 255) {
            throw unsupportedApk("$definingClass->$name uses v$register for a permission")
        }
        replaceInstruction(index, "const-string/jumbo v$register, \"${renamed(oldName)}\"")
    }
    return sites.size
}

private fun BytecodePatchContext.checkedPermissionMethods(): List<MutableMethod> {
    val classes = dexNames.flatMap { classDefByStrings(it, StringComparisonType.EQUALS) }
        .map { it.type }.distinct()
    val methods = classes.flatMap { type ->
        mutableClassDefBy(type).methods.filter { it.hasSharedName() }
    }
    val sites = methods.flatMap { method ->
        method.implementation?.instructions?.withIndex()?.mapNotNull { (index, instruction) ->
            instruction.sharedName()?.let { method.siteId(index) to it }
        } ?: emptyList()
    }
    validateDexSites(sites, expectedDexSitesFor(packageMetadata.versionCode))
    return methods
}

private fun BytecodePatchContext.renameDexNames(): Int {
    val methods = checkedPermissionMethods()
    val renamed = methods.sumOf { it.renameSharedNames() }
    if (renamed != expectedDexSitesFor(packageMetadata.versionCode).size || methods.any { it.hasSharedName() }) {
        throw PatchException("$PATCH_NAME: not all permission loads were renamed")
    }
    return renamed
}

/**
 * A re-signed Messenger and stock Meta apps otherwise declare two signature permissions under
 * the same names. The shared prefix is deliberately the one used by Hushfacebook. Pairing the
 * two patched apps still requires one signing key and separate cross-app trust checks.
 */
@Suppress("unused")
val installBesideMetaAppsPatch = bytecodePatch(
    name = PATCH_NAME,
    description = "Lets your patched Messenger install next to Facebook and other Meta apps. Without it, the apps can clash over shared permissions and the install can stop at a blank screen. Works as soon as you patch it in, with no switch.",
    default = true,
) {
    category("Fixes")
    compatibleWith(MessengerTarget.COMPATIBILITY)
    dependsOn(renameManifest)
    execute {
        renameDexNames()
    }
}
