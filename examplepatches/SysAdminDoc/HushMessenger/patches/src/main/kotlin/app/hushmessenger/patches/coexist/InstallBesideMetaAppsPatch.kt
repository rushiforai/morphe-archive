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

// Component names and instruction sites match every supported APK.
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

/** The six permission loads in 585.0.0.53.94's arm64 builds. Generated from 347015062's record. */
internal val expectedDexSites347015062 = mapOf(
    "LX/0iw;->A04(Landroid/app/Application;)V@18" to APP_COMMUNICATION_FORMAT,
    "LX/0zv;->A03()V@25" to APP_COMMUNICATION,
    "LX/1f9;->A05(Lcom/facebook/auth/usersession/FbUserSession;LX/1f9;Ljava/lang/String;Ljava/lang/String;)V@38" to APP_COMMUNICATION,
    "LX/2Hb;->A01(Landroid/content/Intent;LX/2Hb;)V@24" to APP_COMMUNICATION_FORMAT,
    "LX/32z;->A04(Ljava/lang/Object;ILX/5dq;I)Ljava/lang/Object;@809" to APP_COMMUNICATION_FORMAT,
    "Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;->A0g(Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;I)V@580" to APP_COMMUNICATION_FORMAT,
)

/** The six permission loads in 585.0.0.53.94's armv7 build. Generated from 347014974's record. */
internal val expectedDexSites347014974 = mapOf(
    "LX/0if;->A04(Landroid/app/Application;)V@18" to APP_COMMUNICATION_FORMAT,
    "LX/13i;->A03()V@25" to APP_COMMUNICATION,
    "LX/1gL;->A05(Lcom/facebook/auth/usersession/FbUserSession;LX/1gL;Ljava/lang/String;Ljava/lang/String;)V@38" to APP_COMMUNICATION,
    "LX/2J5;->A01(Landroid/content/Intent;LX/2J5;)V@24" to APP_COMMUNICATION_FORMAT,
    "LX/34e;->A05(Ljava/lang/Object;ILX/5gb;I)Ljava/lang/Object;@800" to APP_COMMUNICATION_FORMAT,
    "Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;->A0f(Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;I)V@621" to APP_COMMUNICATION_FORMAT,
)

/** The six permission loads in 585.0.0.53.94's other armv7 build. Generated from 347014990's record. */
internal val expectedDexSites347014990 = mapOf(
    "LX/0if;->A04(Landroid/app/Application;)V@18" to APP_COMMUNICATION_FORMAT,
    "LX/12Z;->A03()V@25" to APP_COMMUNICATION,
    "LX/1fZ;->A05(Lcom/facebook/auth/usersession/FbUserSession;LX/1fZ;Ljava/lang/String;Ljava/lang/String;)V@38" to APP_COMMUNICATION,
    "LX/2I1;->A01(Landroid/content/Intent;LX/2I1;)V@24" to APP_COMMUNICATION_FORMAT,
    "LX/33P;->A05(Ljava/lang/Object;ILX/5dE;I)Ljava/lang/Object;@768" to APP_COMMUNICATION_FORMAT,
    "Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;->A0f(Lcom/facebook/common/appinit/invoker/OnApplicationInitInvoker;I)V@610" to APP_COMMUNICATION_FORMAT,
)

/** The loads an unknown build is checked against. */
internal val expectedDexSites = expectedDexSites347015062

/** Each supported build's permission loads, by version code, as scripts/profiles records them. */
internal val expectedDexSitesByBuild: Map<Int, Map<String, String>> = mapOf(
    347014974 to expectedDexSites347014974,
    347014990 to expectedDexSites347014990,
    347014996 to expectedDexSites347015062,
    347015062 to expectedDexSites347015062,
    347015064 to expectedDexSites347015062,
    347015065 to expectedDexSites347015062,
    347015067 to expectedDexSites347015062,
)

internal fun expectedDexSitesFor(
    versionCode: String?,
    sites: Map<Int, Map<String, String>> = expectedDexSitesByBuild,
): Map<String, String> = versionCode?.toIntOrNull()?.let(sites::get) ?: expectedDexSites

private fun renamed(name: String): String =
    SHARED_PREFIX + name.removePrefix(META_PREFIX)

private fun unsupportedApk(reason: String, versions: Map<String, List<Int>> = MessengerTarget.VERSIONS) =
    PatchException("$PATCH_NAME: $reason. Use an unmodified Messenger ${MessengerTarget.supportedApks(versions)}.")

/**
 * Every patch that touches Messenger runs this first, and Manager shows whichever dependent patch
 * failed first ("Failed patch: Allow chat bubbles"). So the message opens with the build, not a
 * patch name, for the line people read and paste.
 */
internal fun validateVersionCode(versionCode: String, versions: Map<String, List<Int>> = MessengerTarget.VERSIONS) {
    if (versions.values.none { versionCode.toIntOrNull() in it }) {
        throw PatchException(
            "This Messenger build (version code $versionCode) isn't supported yet, so nothing was patched. " +
                "Use an unmodified Messenger ${MessengerTarget.supportedApks(versions)}. " +
                "APKMirror lists the version code of every download.",
        )
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
