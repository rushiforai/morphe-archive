package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * Messenger's half of Meta's family device ID (#59). It goes through the installed apps for other Meta apps, asks each
 * one's phoneid provider for its ID, and sends them the GET_PHONE_ID broadcast so they answer with theirs.
 */
internal const val PHONE_ID_SYNC = "phone_id_sync"

/** The authority suffix of every Meta app's phoneid provider. Only the requester's queries name it. */
internal const val PHONE_ID_PROVIDER = ".provider.phoneid"

/** The ordered broadcast Meta's apps answer with their ID. */
internal const val GET_PHONE_ID = "com.facebook.GET_PHONE_ID"

internal const val INSTALLED_PACKAGES = "Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;"

private fun phoneIdChanged(detail: String): Nothing =
    throw PatchException("Messenger controls: the device ID sync changed ($detail)")

private fun Method.strings() =
    implementation?.instructions?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }.orEmpty()

private fun Method.calls() =
    implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }.orEmpty()

/** The requester's app list: a static (requester)ArrayList holding one getInstalledPackages call. */
internal fun Method.isPhoneIdAppList() =
    AccessFlags.STATIC.isSet(accessFlags) && returnType == "Ljava/util/ArrayList;" &&
        parameterTypes.map { it.toString() } == listOf(definingClass) && calls().count { it.toString() == INSTALLED_PACKAGES } == 1

/** The requester's sync: an instance (String)V that sends GET_PHONE_ID as an ordered broadcast. */
internal fun Method.isPhoneIdBroadcast() =
    !AccessFlags.STATIC.isSet(accessFlags) && returnType == "V" && parameterTypes.map { it.toString() } == listOf("Ljava/lang/String;") &&
        GET_PHONE_ID in strings() && calls().any { it.name == "sendOrderedBroadcast" }

/**
 * The requester's app list and its sync, but only while they're the whole exchange. One class holds the phoneid
 * provider queries, the sync is the app's only sender of GET_PHONE_ID and takes its apps from the list, and every other
 * caller of a query (on 583 the inlined copy app start runs) takes its apps from the list too. With the list empty and
 * the sync gone, no provider is asked and no broadcast goes out. A build that asks any other way gets no hook, so the
 * switch never claims more than it stops.
 */
internal fun findPhoneIdSync(classes: Iterable<ClassDef>): List<Method> {
    val all = classes.toList()
    val requesters = mutableSetOf<ClassDef>()
    val senders = mutableListOf<Method>()
    val provider = StringMatch(PHONE_ID_PROVIDER)
    val getPhoneId = StringMatch(GET_PHONE_ID)
    for (cls in all) for (method in cls.methods) {
        val refs = method.implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference }.orEmpty()
        if (refs.any { provider.matches(it) }) requesters.add(cls)
        if (refs.any { getPhoneId.matches(it) }) senders.add(method)
    }
    val requester = requesters.singleOrNull() ?: return emptyList()
    val list = requester.methods.singleOrNull { it.isPhoneIdAppList() } ?: return emptyList()
    val sync = requester.methods.singleOrNull { it.isPhoneIdBroadcast() } ?: return emptyList()
    val listId = list.hookId()
    if (sync.calls().none { it.toString() == listId }) return emptyList()
    if (senders.singleOrNull()?.hookId() != sync.hookId()) return emptyList()
    val queries = requester.methods.filter { PHONE_ID_PROVIDER in it.strings() }.map { it.hookId() }.toSet()
    val queryCalls = queries.map(::MemberMatch)
    val listCall = MemberMatch(listId)
    val syncId = sync.hookId()
    for (cls in all) for (method in cls.methods) {
        val called = method.calls()
        if (called.none { ref -> queryCalls.any { it.matches(ref) } }) continue
        val id = method.hookId()
        if (id in queries) continue
        if (id != syncId && called.none { listCall.matches(it) }) return emptyList()
    }
    return listOf(list, sync)
}

internal fun MutableMethod.validatePhoneIdSync() {
    if (!isPhoneIdAppList() && !isPhoneIdBroadcast()) phoneIdChanged("unexpected method ${hookId()}")
    validateScratch()
}

/**
 * While the switch is on the list comes back empty before Messenger reads the installed apps, which is also what it
 * gets on a phone with no other Meta app, and the sync returns before it asks or broadcasts anything. Messenger keeps
 * the ID it already has. Off, Pause and safe mode run Messenger's own code.
 */
internal fun MutableMethod.injectPhoneIdSync() {
    validatePhoneIdSync()
    val stop = if (isPhoneIdAppList()) """
        new-instance v0, Ljava/util/ArrayList;
        invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V
        return-object v0
    """ else "return-void"
    addInstructionsWithLabels(0, """
        invoke-static {}, $SETTINGS->stopPhoneIdSync()Z
        move-result v0
        if-eqz v0, :stock_behavior
    """.trimIndent() + "\n" + stop.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}
