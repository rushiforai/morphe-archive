/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.notifications

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.facebook.misc.extension.parameterRegisterNumber
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Block promotional notifications on every Facebook build the bundle declares: the tray manager's
 * one post method, the only method loading `show_notif_start`, which reaches
 * `NotificationManager.notify`; the builder it takes, holding the push in one field; the push's
 * `mType`, which the deserializer fills from the payload's `type`; Facebook reading that type as a
 * NotificationType constant name, before the first colon and ignoring case; every kind the
 * extension can block being one of those constants, and none of the kinds that must always post.
 * Then the patch itself, run on those classes. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class NotificationFixtureTest {
    private val notificationType = "Lcom/facebook/notifications/constants/push/NotificationType;"
    private val deserializer = "Lcom/facebook/notifications/push/model/SystemTrayNotificationDeserializer;"
    private val kindsClass = "Lapp/morphe/extension/facebook/notifications/NotificationKinds;"
    private val string = "Ljava/lang/String;"
    private val constantName = Regex("[A-Z][A-Z0-9_]*")

    /**
     * Kinds that must always post, each a constant on both builds: messages, friend requests,
     * comments and mentions on your content, and the login and security alerts.
     */
    private val alwaysPost = listOf(
        "MSG", "ORCA_MESSAGE", "MESSAGE_REQUEST", "MESSAGING_IN_BLUE_DIRECT_MESSAGE", "FRIEND", "FRIEND_CONFIRMED",
        "FEED_COMMENT", "COMMENT_MENTION", "MENTION", "MENTIONS_COMMENT", "GROUP_COMMENT_REPLY", "PHOTO_COMMENT",
        "LOGIN_APPROVALS_PUSH_AUTH", "HOTP_LOGIN_APPROVALS", "PLATFORM_LOGIN_APPROVAL", "LA_PUSH_AUTHENTICATE",
        "AUTHENTICATION_FAILED", "DEVICE_REQUEST", "DEFAULT_PUSH_OF_JEWEL_NOTIF",
    )

    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Method.calls(owner: String, name: String) =
        implementation?.instructions?.any { it.call?.let { call -> call.definingClass == owner && call.name == name } == true } == true

    private fun Method.parameters() = parameterTypes.map { it.toString() }

    /** The string literals [method] loads, in order. */
    private fun literals(method: Method): List<String> =
        method.implementation?.instructions?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
            .orEmpty()

    /** The kinds the extension's switches can block, read from the dex the bundle carries. */
    private fun extensionKinds(): Set<String> {
        val kinds = ExtensionDex.classDef(kindsClass).methods.flatMap(::literals).filter { constantName.matches(it) }.toSet()
        assertEquals("kinds the extension can block: $kinds", 12, kinds.size)
        return kinds
    }

    @Test
    fun `each declared build has one post method, typed pushes and every blockable kind`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val kinds = extensionKinds()
        assertEquals("a kind that must always post can be blocked", emptySet<String>(), kinds.intersect(alwaysPost.toSet()))
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val holders = FixtureDex.classesHolding(bundle, SHOW_START)
                assertEquals("$name: classes loading \"$SHOW_START\"", listOf(TRAY_MANAGER), holders.map { it.type })
                val manager = holders.single()
                assertEquals("$name: methods loading \"$SHOW_START\"", 1, manager.methods.count { holdsString(it, SHOW_START) })
                val posts = manager.methods.filter(::isPostMethod)
                assertEquals("$name: post methods", 1, posts.size)
                val post = posts.single()
                assertTrue("$name: the post method has no local register", post.localRegisterCount() >= 1)

                // It goes on to the one method of the manager that calls NotificationManager.notify.
                val posters = manager.methods.filter { it.calls("Landroid/app/NotificationManager;", "notify") }
                assertEquals("$name: the manager's methods calling notify", 1, posters.size)
                assertTrue("$name: the post method doesn't reach notify",
                    post.calls(TRAY_MANAGER, posters.single().name))

                val builderType = post.parameters()[BUILDER_PARAMETER]
                val classes = FixtureDex.classes(bundle, setOf(builderType, TRAY_NOTIFICATION, notificationType, deserializer))
                val builder = classes.getValue(builderType)
                val field = notificationField(builder)
                assertNotNull("$name: the builder's push field", field)
                val push = classes.getValue(TRAY_NOTIFICATION)
                assertTrue("$name: the push has no String mType", hasTypeField(push))
                // The payload's "type" is what the deserializer puts in mType.
                val mapped = classes.getValue(deserializer).methods.flatMap(::literals).toSet()
                assertTrue("$name: the deserializer doesn't map type to mType", "type" in mapped && TYPE_FIELD in mapped)

                assertFacebookReadsTypesAsConstantNames(name, push, classes.getValue(notificationType))
                val constants = constantNames(classes.getValue(notificationType))
                assertTrue("$name: only ${constants.size} NotificationType constants", constants.size >= 400)
                assertEquals("$name: kinds the extension blocks that aren't NotificationType constants",
                    emptySet<String>(), kinds - constants)
                assertEquals("$name: kinds that always post that aren't NotificationType constants",
                    emptySet<String>(), alwaysPost.toSet() - constants)

                // The patch, on this build's own classes.
                val context = PatchContexts.of(
                    (listOf(manager, builder, push) +
                        listOf(ExtensionDex.classDef(SETTINGS_STATUS), ExtensionDex.classDef(kindsClass))).distinctBy { it.type },
                )
                blockPromotionalNotificationsPatch.execute(context)
                val patched = context.mutableClassDefBy(TRAY_MANAGER).methods.single {
                    it.name == post.name && it.parameters() == post.parameters()
                }.implementation!!.instructions.toList()
                assertEquals("$name: the post method grew by the hook", post.implementation!!.instructions.count() + 9, patched.size)
                assertEquals(Opcode.MOVE_OBJECT_FROM16, patched[0].opcode)
                assertEquals("$name: the builder read", post.parameterRegisterNumber(BUILDER_PARAMETER),
                    (patched[0] as TwoRegisterInstruction).registerB)
                val pushRead = (patched[2] as ReferenceInstruction).reference as FieldReference
                assertEquals("$name: the push read", "${field!!.definingClass}->${field.name}:${field.type}",
                    "${pushRead.definingClass}->${pushRead.name}:${pushRead.type}")
                val typeRead = (patched[4] as ReferenceInstruction).reference as FieldReference
                assertEquals("$name: the type read", "$TRAY_NOTIFICATION->$TYPE_FIELD:$string",
                    "${typeRead.definingClass}->${typeRead.name}:${typeRead.type}")
                assertEquals("$name: the hook", BLOCK, patched[5].call.toString())
                assertEquals(Opcode.RETURN_VOID, patched[8].opcode)
                assertEquals("$name: the post method's own first instruction after the hook",
                    post.implementation!!.instructions.first().opcode, patched[9].opcode)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    /** Every string NotificationType's static initializer loads: the name of each of its constants. */
    private fun constantNames(type: ClassDef): Set<String> {
        val initializer = type.methods.single { it.name == "<clinit>" }
        val names = literals(initializer)
        assertTrue("a NotificationType initializer string isn't a constant name",
            names.all { constantName.matches(it) })
        return names.toSet()
    }

    /**
     * How Facebook reads mType: the push's static (String)NotificationType method cuts at the first
     * ':' and asks NotificationType's static lookup, whose match is an instance (String)Z method
     * comparing the string with the constant's toString() ignoring case.
     */
    private fun assertFacebookReadsTypesAsConstantNames(name: String, push: ClassDef, type: ClassDef) {
        val readers = push.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.parameters() == listOf(string) && it.returnType == notificationType
        }
        assertEquals("$name: the push's type readers", 1, readers.size)
        val reader = readers.single()
        assertTrue("$name: the type reader doesn't cut at ':'", reader.implementation!!.instructions.any {
            it is NarrowLiteralInstruction && it.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) &&
                it.narrowLiteral == ':'.code
        })
        assertTrue("$name: the type reader doesn't cut", reader.calls(string, "substring"))
        val lookups = type.methods.filter {
            AccessFlags.STATIC.isSet(it.accessFlags) && it.parameters() == listOf(string) && it.returnType == notificationType &&
                it.name != "valueOf"
        }
        assertEquals("$name: NotificationType's lookups", 1, lookups.size)
        assertTrue("$name: the type reader doesn't ask the lookup", reader.calls(notificationType, lookups.single().name))
        val matches = type.methods.filter {
            !AccessFlags.STATIC.isSet(it.accessFlags) && it.parameters() == listOf(string) && it.returnType == "Z"
        }
        assertEquals("$name: NotificationType's matches", 1, matches.size)
        assertTrue("$name: the match isn't by name ignoring case",
            matches.single().calls(string, "equalsIgnoreCase") && matches.single().calls("Ljava/lang/Object;", "toString"))
        assertTrue("$name: the lookup doesn't use the match", lookups.single().calls(notificationType, matches.single().name))
    }
}
