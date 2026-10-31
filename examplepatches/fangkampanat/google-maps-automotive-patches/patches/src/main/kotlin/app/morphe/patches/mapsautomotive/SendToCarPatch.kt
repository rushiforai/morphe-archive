package app.morphe.patches.mapsautomotive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.w3c.dom.Node
import java.util.logging.Logger

// Send to car, a separate patch on top of the core one. Phone Maps sends a trip through Google's
// notification service (Chime, "GnpSdk" in Maps) as a maps.app.goo.gl link; on the car Maps opens it
// as a route preview. Three things stood in the way with MicroG-RE 7.2.2:
// push actions under Google's names, the GnpSdk identity, and the short link, which Maps expands
// through Firebase Dynamic Links and MicroG-RE answers without data (MicroG-RE #329). The identity and
// the links follow the feature switch at run time (SendToCarLinks); the push routes are fixed.
// Required: a missing anchor, an ambiguity or an unknown layout fails the patch.

private const val SEND_TO_CAR_LINKS_CLASS = "Lapp/morphe/extension/mapsautomotive/patches/SendToCarLinks;"
private const val LINK_TARGET_INTERFACE = "Lapp/morphe/extension/mapsautomotive/patches/SendToCarLinks\$Target;"
private const val OPEN_MAPS_LINK = "morpheOpenMapsLink"
private const val CLEAR_SENT_TRIP = "morpheClearSentTrip"
private const val CHIME_PACKAGE = "chimePackage"
private const val EXTENSION_PREFIX = "Lapp/morphe/extension/"
private const val CONTEXT = "Landroid/content/Context;"
private const val INTENT = "Landroid/content/Intent;"
private const val URI = "Landroid/net/Uri;"
private const val STRING = "Ljava/lang/String;"
private const val PATTERN = "Ljava/util/regex/Pattern;"
private const val GET_PACKAGE_NAME = "Landroid/content/Context;->getPackageName()Ljava/lang/String;"
private const val USER_SERIAL = "Landroid/os/UserManager;->getSerialNumberForUser(Landroid/os/UserHandle;)J"
private const val GSERVICES_KEY_ERROR = "Exception reading GServices key"
private const val GNP_TAG = "GnpSdk"
private const val DYNAMIC_LINK_REGISTRAR = "Lcom/google/firebase/dynamiclinks/internal/FirebaseDynamicLinkRegistrar;"
// Maps' own short-link pattern, as compiled in its URL pattern class.
private const val SHORT_LINK_PATTERN = "^https?://maps\\.app\\.goo\\.gl/.+"
private val sendToCarLogger = Logger.getLogger("app.morphe.patches.mapsautomotive.SendToCarPatch")

// MicroG-RE 7.2.2 serves and sends push (GCM/FCM/IID) only under its own names, so Maps' token
// requests, the registration reply and the delivered messages need them too. Without them Chime never
// registers the car.
private const val PUSH_RECEIVE_ACTION = "com.google.android.c2dm.intent.RECEIVE"
private val pushActionRoutes = mapOf(
    "com.google.android.c2dm.intent.REGISTER" to "$C2DM_PACKAGE_NAME.intent.REGISTER",
    "com.google.android.c2dm.intent.REGISTRATION" to "$C2DM_PACKAGE_NAME.intent.REGISTRATION",
    PUSH_RECEIVE_ACTION to "$C2DM_PACKAGE_NAME.intent.RECEIVE",
    "com.google.android.c2dm.intent.UNREGISTER" to "$C2DM_PACKAGE_NAME.intent.UNREGISTER",
    "com.google.android.gcm.intent.SEND" to "$GMS_CORE_VENDOR_GROUP.android.gcm.intent.SEND",
    "com.google.iid.TOKEN_REQUEST" to "$GMS_CORE_VENDOR_GROUP.iid.TOKEN_REQUEST",
)
// The token request (two ways), the registration reply and message intake; UNREGISTER and
// gcm.intent.SEND are routed when present.
private val requiredPushActions = listOf(
    "com.google.android.c2dm.intent.REGISTER",
    "com.google.iid.TOKEN_REQUEST",
    "com.google.android.c2dm.intent.REGISTRATION",
    PUSH_RECEIVE_ACTION,
)

private val pushReceiverPatch = resourcePatch {
    dependsOn(manifestPatch)
    execute {
        document("AndroidManifest.xml").use { document ->
            routePushActions(document.documentElement)
            validatePushReceiver(document)
        }
    }
}

@Suppress("unused")
val sendToCarPatch = bytecodePatch(
    name = "Send to car",
    description = "Lets phone Maps send a trip to Maps Car through MicroG-RE (push routes, the notification " +
        "service identity and maps.app.goo.gl links).",
    default = true,
) {
    compatibleWith(compatibility)
    dependsOn(automotiveMicroGPatch, pushReceiverPatch)

    execute {
        routePushStrings()
        useOriginalPackageForChime()
        expandSendToCarLinks()
        IncludedFeatures.features += "send_to_car"
    }
}

private fun routePushActions(node: Node) {
    if (node is Element && node.tagName == "action") {
        pushActionRoutes[node.getAttribute("android:name")]?.let { node.setAttribute("android:name", it) }
    }
    val children = node.childNodes
    for (index in 0 until children.length) routePushActions(children.item(index))
}

// The push receiver is protected by the (renamed) c2dm SEND permission and must now listen to
// MicroG-RE's RECEIVE action; no Google c2dm name may be left in the manifest.
private fun validatePushReceiver(document: Document) {
    val receivers = document.getElementsByTagName("receiver")
    var routed = 0
    for (index in 0 until receivers.length) {
        val receiver = receivers.item(index) as? Element ?: continue
        if (receiver.getAttribute("android:permission") != "$C2DM_PACKAGE_NAME.permission.SEND") continue
        val actions = receiver.getElementsByTagName("action")
        for (action in 0 until actions.length) {
            if ((actions.item(action) as Element).getAttribute("android:name") == pushActionRoutes[PUSH_RECEIVE_ACTION]) routed++
        }
    }
    if (routed != 1) throw PatchException("Expected one push receiver with MicroG-RE's RECEIVE action, found $routed")

    val stale = mutableListOf<String>()
    fun collect(node: Node) {
        if (node is Element) {
            val attributes = node.attributes
            for (index in 0 until attributes.length) {
                val value = attributes.item(index).nodeValue
                if (value.startsWith("com.google.android.c2dm.") || value in pushActionRoutes) stale += value
            }
        }
        val children = node.childNodes
        for (index in 0 until children.length) collect(children.item(index))
    }
    collect(document.documentElement)
    if (stale.isNotEmpty()) throw PatchException("Push names left unrouted in the manifest: ${stale.joinToString()}")
    sendToCarLogger.info("Push receiver routed to MicroG-RE's RECEIVE action")
}

// The same names in Maps' code. An unrecognized push layout (another mechanism, or none) fails
// instead of leaving Send to car broken.
private fun BytecodePatchContext.routePushStrings() {
    val routes = replaceStringLiterals { pushActionRoutes[it] }
    val missing = requiredPushActions.filter { it !in routes }
    if (missing.isNotEmpty()) throw PatchException("Push actions not found in Maps code: ${missing.joinToString()}")
    sendToCarLogger.info("Routed push actions to MicroG-RE: $routes")
}

// GnpSdk puts Context.getPackageName() into its registration and device-info requests, while MicroG-RE
// signs Maps in as SPOOFED_PACKAGE_NAME; Google rejects the mismatch, as it did for re-signed YouTube
// (morphe-patches #3481). These requests are the ones built next to the device identity GnpSdk sends:
// the GServices android ID and the user serial, read directly or through static (Context)Long helpers.
// The registration request calls such a builder of its own class. Each package read there passes
// through SendToCarLinks.chimePackage, which gives the original AAOS package while Send to car is on;
// GnpSdk's other reads (PackageManager lookups, intents, metrics) stay.
private fun BytecodePatchContext.useOriginalPackageForChime() {
    val mapsClasses = buildList { classDefForEach { if (!it.type.startsWith(EXTENSION_PREFIX)) add(it) } }

    val gservicesHelpers = mutableSetOf<String>()
    val serialHelpers = mutableSetOf<String>()
    mapsClasses.forEach { classDef ->
        classDef.methods.forEach { method ->
            if (!AccessFlags.STATIC.isSet(method.accessFlags) || method.returnType != "Ljava/lang/Long;" ||
                method.parameterTypes.map { it.toString() } != listOf(CONTEXT)
            ) return@forEach
            when {
                method.hasStringStarting(GSERVICES_KEY_ERROR) -> gservicesHelpers += method.key()
                method.callsAny(setOf(USER_SERIAL)) -> serialHelpers += method.key()
            }
        }
    }
    if (gservicesHelpers.isEmpty() || serialHelpers.isEmpty()) {
        throw PatchException("GnpSdk identity helpers not found: GServices $gservicesHelpers, serial $serialHelpers")
    }

    val identity = gservicesHelpers + serialHelpers + USER_SERIAL
    val direct = mapsClasses.flatMap { classDef ->
        classDef.methods.filter { it.packageReads().isNotEmpty() && it.callsAny(identity) }
    }
    val directKeys = direct.map { it.key() }.toSet()
    val viaBuilder = mapsClasses.flatMap { classDef ->
        val ownBuilders = directKeys.filter { it.startsWith(classDef.type + "->") }.toSet()
        if (ownBuilders.isEmpty()) return@flatMap emptyList()
        classDef.methods.filter { it.key() !in directKeys && it.packageReads().isNotEmpty() && it.callsAny(ownBuilders) }
    }
    val builders = direct + viaBuilder

    builders.forEach {
        if (classDefByOrNull(it.definingClass)?.isTagged(GNP_TAG) != true) throw PatchException("Package read outside GnpSdk: $it")
    }
    if (direct.none { it.hasStringStarting(GSERVICES_KEY_ERROR) }) throw PatchException("GnpSdk device-info builder not found")
    if (direct.none { it.callsAny(gservicesHelpers + serialHelpers) }) throw PatchException("GnpSdk registration builder not found")

    requireExtensionMethod(SEND_TO_CAR_LINKS_CLASS, CHIME_PACKAGE, listOf(STRING), STRING)
    var reads = 0
    builders.forEach { method ->
        val mutable = mutableMethodOf(method)
        val code = mutable.implementation!!.instructions
        // From the last read, so the earlier indices stay valid.
        mutable.packageReads().sortedDescending().forEach { index ->
            val result = code.getOrNull(index + 1)
            if (result?.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("Unexpected GnpSdk package read in $method")
            val register = (result as OneRegisterInstruction).registerA
            mutable.addInstructions(
                index + 2,
                """
                    invoke-static/range { v$register .. v$register }, $SEND_TO_CAR_LINKS_CLASS->$CHIME_PACKAGE($STRING)$STRING
                    move-result-object v$register
                """.trimIndent(),
            )
            reads++
        }
    }
    sendToCarLogger.info(
        "GnpSdk identity: $reads package reads in ${builders.size} methods pass through $CHIME_PACKAGE: " +
            builders.joinToString { it.key() },
    )
}

// Maps' legacy intent processor hands a maps.app.goo.gl link to FirebaseDynamicLinks.getDynamicLink(Intent)
// and continues, in the success listener, with its own Maps-URL handler (processor, Intent, Uri, URL).
// Before that call the processor asks SendToCarLinks, which follows the link's redirect itself and then
// calls the same handler through a bridge the processor gets here; Dynamic Links is then skipped. Any
// other link, or a "no" from the extension, takes Maps' Dynamic Links path as before.
private fun BytecodePatchContext.expandSendToCarLinks() {
    requireSendToCarExtension()
    val getter = dynamicLinkGetter()
    val pattern = shortLinkPatternField()

    val sites = mutableListOf<Pair<Method, Int>>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_PREFIX)) return@classDefForEach
        classDef.methods.forEach { method ->
            method.implementation?.instructions?.forEachIndexed { index, instruction ->
                if (memberKey(instruction) == getter.key()) sites += method to index
            }
        }
    }
    val (site, call) = sites.singleOrNull()
        ?: throw PatchException("Expected one getDynamicLink call, found ${sites.joinToString { "${it.first}@${it.second}" }}")
    if (site.returnType != "Z" || site.parameterTypes.map { it.toString() } != listOf(INTENT, URI)) {
        throw PatchException("getDynamicLink is called from an unexpected method: $site")
    }
    val processor = site.definingClass

    val mutable = mutableMethodOf(site)
    val code = mutable.implementation!!.instructions
    val block = dynamicLinkBlock(code, call, getter, pattern, processor)
        ?: throw PatchException("Unexpected Dynamic Links block in $site at $call")
    val (open, url) = mapsUrlContinuation(block.listener, processor)
    if (site.implementation!!.instructions.none { memberKey(it) == open.key() }) {
        throw PatchException("$site does not call the Maps URL handler $open itself")
    }
    // On the extension's path the block's registers carry other values to the merge point.
    if (!mutable.deadFrom(call + 8, setOf(block.task, block.listenerRegister, block.failureRegister))) {
        throw PatchException("Registers of the Dynamic Links block are still used after it in $site")
    }

    val (tripHelper, clearTrip) = sentTripClear(processor, site)

    addOpenMapsLinkBridge(processor, url, open)
    addClearSentTripBridge(processor, tripHelper, clearTrip)
    mutable.addInstructionsWithLabels(
        call,
        """
            invoke-static { v${block.processor}, v${block.intent}, v${block.referrer} }, $SEND_TO_CAR_LINKS_CLASS->expand(Ljava/lang/Object;$INTENT$URI)Z
            move-result v${block.listenerRegister}
            if-eqz v${block.listenerRegister}, :morphe_dynamic_link
            const/4 v${block.listenerRegister}, 0x0
            goto/16 :morphe_short_link_expanded
        """.trimIndent(),
        ExternalLabel("morphe_dynamic_link", code[call]),
        ExternalLabel("morphe_short_link_expanded", code[call + 8]),
    )
    sendToCarLogger.info(
        "Send to car links: $site at $call (getDynamicLink $getter, pattern $pattern), " +
            "listener ${block.listener}, continuation $url + $open, sent-trip clear $tripHelper + $clearTrip",
    )
}

// Maps keeps a sent trip and shows it again at each start until the route preview opened for it is
// destroyed. It watches for that only when it parses the intent itself, never for a link (its own
// Dynamic Links callback included), so on a car where every start is a cold start the trip came back
// each time. The processor's lifecycle observer clears it with one no-argument call on the processor's
// send-to-car helper and then unregisters itself; the bridge makes the same call once a link is open.
private fun BytecodePatchContext.sentTripClear(processor: String, site: Method): Pair<FieldReference, MethodReference> {
    val processorClass = classDefByOrNull(processor) ?: throw PatchException("Missing intent processor $processor")
    val observers = processorClass.methods.filter { it.name == "<init>" }.flatMap { init ->
        val code = init.implementation?.instructions?.toList().orEmpty()
        code.indices.mapNotNull { index ->
            if (code[index].opcode != Opcode.NEW_INSTANCE) return@mapNotNull null
            val type = ((code[index] as ReferenceInstruction).reference as TypeReference).type
            val constructor = code.getOrNull(index + 1)?.takeIf { it.opcode == Opcode.INVOKE_DIRECT }
                ?.let { (it as ReferenceInstruction).reference as MethodReference }
            type.takeIf {
                constructor?.definingClass == type && constructor.name == "<init>" &&
                    constructor.parameterTypes.map { parameter -> parameter.toString() } == listOf(processor)
            }
        }
    }.toSet()

    val found = observers.flatMap { observer ->
        (classDefByOrNull(observer)?.methods ?: emptyList()).mapNotNull { method ->
            val code = method.implementation?.instructions?.toList() ?: return@mapNotNull null
            val unregisters = code.any { instruction ->
                instruction.opcode == Opcode.INVOKE_VIRTUAL && (instruction as ReferenceInstruction).reference.let {
                    it is MethodReference && it.definingClass == processor && it.parameterTypes.isEmpty() && it.returnType == "V"
                }
            }
            val helpers = code.filter { it.opcode == Opcode.IGET_OBJECT }
                .map { (it as ReferenceInstruction).reference as FieldReference }
                .filter { it.definingClass == processor }
            val clears = code.filter { it.opcode == Opcode.INVOKE_VIRTUAL }
                .map { (it as ReferenceInstruction).reference as MethodReference }
                .filter { call -> call.parameterTypes.isEmpty() && call.returnType == "V" && helpers.any { it.type == call.definingClass } }
            val clear = clears.singleOrNull()
            if (!unregisters || clear == null) null else helpers.first { it.type == clear.definingClass } to clear
        }
    }.distinctBy { it.first.key() + it.second.key() }
    val (helper, clear) = found.singleOrNull()
        ?: throw PatchException("Expected one sent-trip clear in $processor's observers, found ${found.map { it.second.key() }}")
    // The helper is the one the processor asks about the intent (its send-to-car type) before Dynamic Links.
    if (site.implementation!!.instructions.none { instruction ->
            instruction.opcode == Opcode.INVOKE_VIRTUAL && (instruction as ReferenceInstruction).reference.let {
                it is MethodReference && it.definingClass == helper.type &&
                    it.parameterTypes.map { type -> type.toString() } == listOf(INTENT)
            }
        }
    ) throw PatchException("$site does not ask ${helper.type} about the intent")
    return helper to clear
}

// SendToCarLinks.Target on the processor: morpheClearSentTrip() makes Maps' own clear call.
private fun BytecodePatchContext.addClearSentTripBridge(processor: String, helper: FieldReference, clear: MethodReference) {
    val processorClass = mutableClassDefBy(processor)
    if (processorClass.methods.any { it.name == CLEAR_SENT_TRIP }) throw PatchException("$processor already has $CLEAR_SENT_TRIP")
    processorClass.methods.add(
        ImmutableMethod(
            processor,
            CLEAR_SENT_TRIP,
            emptyList(),
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(2),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    iget-object v0, p0, ${helper.key()}
                    invoke-virtual { v0 }, ${clear.key()}
                    return-void
                """.trimIndent(),
            )
        },
    )
}

private fun BytecodePatchContext.requireSendToCarExtension() {
    val links = classDefByOrNull(SEND_TO_CAR_LINKS_CLASS)
        ?: throw PatchException("Missing extension class $SEND_TO_CAR_LINKS_CLASS")
    if (links.methods.none {
            it.name == "expand" && it.returnType == "Z" && AccessFlags.STATIC.isSet(it.accessFlags) &&
                it.parameterTypes.map { type -> type.toString() } == listOf("Ljava/lang/Object;", INTENT, URI)
        }
    ) throw PatchException("SendToCarLinks lacks expand")
    val target = classDefByOrNull(LINK_TARGET_INTERFACE)
        ?: throw PatchException("Missing extension interface $LINK_TARGET_INTERFACE")
    if (target.methods.none {
            it.name == OPEN_MAPS_LINK && it.returnType == "V" &&
                it.parameterTypes.map { type -> type.toString() } == listOf(INTENT, URI, STRING)
        }
    ) throw PatchException("SendToCarLinks.Target lacks $OPEN_MAPS_LINK")
    if (target.methods.none { it.name == CLEAR_SENT_TRIP && it.returnType == "V" && it.parameterTypes.isEmpty() }) {
        throw PatchException("SendToCarLinks.Target lacks $CLEAR_SENT_TRIP")
    }
}

// FirebaseDynamicLinks: the abstract superclass, with a static getInstance(), of the implementation the
// (unobfuscated) registrar creates; its one abstract (Intent) method is getDynamicLink.
private fun BytecodePatchContext.dynamicLinkGetter(): MethodReference {
    val registrar = classDefByOrNull(DYNAMIC_LINK_REGISTRAR) ?: throw PatchException("Missing $DYNAMIC_LINK_REGISTRAR")
    val created = registrar.methods.flatMap { method ->
        method.implementation?.instructions?.filter { it.opcode == Opcode.NEW_INSTANCE }
            ?.map { ((it as ReferenceInstruction).reference as TypeReference).type }.orEmpty()
    }.toSet()
    val getters = created.mapNotNull { type ->
        val base = classDefByOrNull(type)?.superclass?.let { classDefByOrNull(it) } ?: return@mapNotNull null
        if (!AccessFlags.ABSTRACT.isSet(base.accessFlags)) return@mapNotNull null
        if (base.methods.none {
                it.name == "getInstance" && it.parameterTypes.isEmpty() && it.returnType == base.type &&
                    AccessFlags.STATIC.isSet(it.accessFlags)
            }
        ) return@mapNotNull null
        base.methods.filter {
            AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.parameterTypes.map { type -> type.toString() } == listOf(INTENT)
        }.singleOrNull()
    }.distinctBy { it.key() }
    return getters.singleOrNull()
        ?: throw PatchException("Expected one FirebaseDynamicLinks.getDynamicLink, found ${getters.joinToString { it.key() }}")
}

// The static Pattern field that Maps' URL pattern class compiles from the short-link pattern.
private fun BytecodePatchContext.shortLinkPatternField(): FieldReference {
    val found = mutableListOf<FieldReference>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(EXTENSION_PREFIX)) return@classDefForEach
        val code = classDef.methods.firstOrNull { it.name == "<clinit>" }?.implementation?.instructions?.toList()
            ?: return@classDefForEach
        code.forEachIndexed { index, instruction ->
            if (instruction.stringLiteral() != SHORT_LINK_PATTERN) return@forEachIndexed
            val store = (index + 1 until minOf(code.size, index + 6)).firstOrNull { code[it].opcode == Opcode.SPUT_OBJECT }
                ?: throw PatchException("The short-link pattern is not stored in a static field in ${classDef.type}")
            val field = (code[store] as ReferenceInstruction).reference as FieldReference
            if (field.definingClass != classDef.type || field.type != PATTERN) {
                throw PatchException("Unexpected short-link pattern store $field")
            }
            found += field
        }
    }
    return found.singleOrNull() ?: throw PatchException("Expected one short-link pattern field, found $found")
}

private class DynamicLinkBlock(
    val processor: Int,
    val intent: Int,
    val referrer: Int,
    val task: Int,
    val listener: String,
    val listenerRegister: Int,
    val failureRegister: Int,
)

// The provider read, getDynamicLink(intent), new SuccessListener(processor, intent, uri, int),
// addOnSuccessListener, new FailureListener, addOnFailureListener; the short-link Pattern is the last one
// read before. Nothing in it may be a branch target and the registers must fit the inserted code.
private fun dynamicLinkBlock(
    code: List<BuilderInstruction>,
    call: Int,
    getter: MethodReference,
    pattern: FieldReference,
    processor: String,
): DynamicLinkBlock? {
    if (call < 1 || call + 8 > code.lastIndex) return null
    if ((call..call + 7).any { code[it].location.labels.isNotEmpty() }) return null
    val lastPattern = (call - 1 downTo maxOf(0, call - 40)).firstOrNull {
        code[it].opcode == Opcode.SGET_OBJECT && ((code[it] as ReferenceInstruction).reference as FieldReference).type == PATTERN
    } ?: return null
    if (memberKey(code[lastPattern]) != pattern.key()) return null

    val cast = code[call - 1]
    val dynamicLink = code[call] as? FiveRegisterInstruction ?: return null
    if (cast.opcode != Opcode.CHECK_CAST || ((cast as ReferenceInstruction).reference as TypeReference).type != getter.definingClass) return null
    if (dynamicLink.registerCount != 2 || cast.registerA() != dynamicLink.registerC) return null
    val intent = dynamicLink.registerD

    val result = code[call + 1]
    val newListener = code[call + 2]
    val initListener = code[call + 3] as? FiveRegisterInstruction ?: return null
    val addSuccess = code[call + 4] as? FiveRegisterInstruction ?: return null
    val newFailure = code[call + 5]
    val initFailure = code[call + 6]
    val addFailure = code[call + 7] as? FiveRegisterInstruction ?: return null
    if (result.opcode != Opcode.MOVE_RESULT_OBJECT || newListener.opcode != Opcode.NEW_INSTANCE ||
        initListener.opcode != Opcode.INVOKE_DIRECT || addSuccess.opcode != Opcode.INVOKE_VIRTUAL ||
        newFailure.opcode != Opcode.NEW_INSTANCE || initFailure.opcode != Opcode.INVOKE_DIRECT ||
        addFailure.opcode != Opcode.INVOKE_VIRTUAL
    ) return null
    val task = result.registerA()
    val listener = ((newListener as ReferenceInstruction).reference as TypeReference).type
    val listenerInit = (initListener as ReferenceInstruction).reference as MethodReference
    if (listenerInit.definingClass != listener || listenerInit.name != "<init>" ||
        listenerInit.parameterTypes.map { it.toString() } != listOf(processor, INTENT, URI, "I") ||
        initListener.registerCount != 5 || initListener.registerC != newListener.registerA() ||
        initListener.registerE != intent
    ) return null
    for (add in listOf(addSuccess, addFailure)) {
        val reference = (add as ReferenceInstruction).reference as MethodReference
        if (reference.definingClass != getter.returnType || reference.parameterTypes.size != 1 || add.registerCount != 2 ||
            add.registerC != task
        ) return null
    }
    if (addSuccess.registerD != newListener.registerA() || addFailure.registerD != newFailure.registerA()) return null
    val block = DynamicLinkBlock(
        processor = initListener.registerD,
        intent = intent,
        referrer = initListener.registerF,
        task = task,
        listener = listener,
        listenerRegister = newListener.registerA(),
        failureRegister = newFailure.registerA(),
    )
    // invoke-static and const/4 take registers v0-v15.
    if (listOf(block.processor, block.intent, block.referrer, block.listenerRegister).any { it > 15 }) return null
    return block
}

// In the success listener: the URL source of the intent (one static (Intent) call) and the processor's
// Maps-URL handler (processor, source, Intent, Uri, String) it calls with the expanded link.
private fun BytecodePatchContext.mapsUrlContinuation(listener: String, processor: String): Pair<MethodReference, MethodReference> {
    val listenerClass = classDefByOrNull(listener) ?: throw PatchException("Missing Dynamic Links listener $listener")
    val handlers = listenerClass.methods.flatMap { method ->
        method.implementation?.instructions?.mapNotNull { instruction ->
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
            val parameters = reference.parameterTypes.map { it.toString() }
            if (instruction.opcode == Opcode.INVOKE_VIRTUAL && reference.definingClass == processor && reference.returnType == "V" &&
                parameters.size == 4 && parameters.drop(1) == listOf(INTENT, URI, STRING)
            ) method to reference else null
        }.orEmpty()
    }
    val (method, open) = handlers.singleOrNull()
        ?: throw PatchException("Expected one Maps URL handler call in $listener, found ${handlers.map { it.second.key() }}")
    val sources = method.implementation!!.instructions.mapNotNull { instruction ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@mapNotNull null
        reference.takeIf {
            instruction.opcode == Opcode.INVOKE_STATIC && it.parameterTypes.map { type -> type.toString() } == listOf(INTENT) &&
                it.returnType == open.parameterTypes.first().toString()
        }
    }.distinctBy { it.key() }
    val url = sources.singleOrNull()
        ?: throw PatchException("Expected one URL source call in $method, found ${sources.map { it.key() }}")
    return open to url
}

// SendToCarLinks.Target on the processor: morpheOpenMapsLink(intent, referrer, url) runs Maps' own
// continuation after Dynamic Links with the expanded link.
private fun BytecodePatchContext.addOpenMapsLinkBridge(processor: String, url: MethodReference, open: MethodReference) {
    val processorClass = mutableClassDefBy(processor)
    if (processorClass.methods.any { it.name == OPEN_MAPS_LINK }) throw PatchException("$processor already has $OPEN_MAPS_LINK")
    if (LINK_TARGET_INTERFACE !in processorClass.interfaces) processorClass.interfaces.add(LINK_TARGET_INTERFACE)
    processorClass.methods.add(
        ImmutableMethod(
            processor,
            OPEN_MAPS_LINK,
            listOf(INTENT, URI, STRING).map { ImmutableMethodParameter(it, null, null) },
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
            null,
            null,
            MutableMethodImplementation(5),
        ).toMutable().apply {
            addInstructions(
                0,
                """
                    invoke-static { p1 }, ${url.key()}
                    move-result-object v0
                    invoke-virtual { p0, v0, p1, p2, p3 }, ${open.key()}
                    return-void
                """.trimIndent(),
            )
        },
    )
}

// Whether every path from [start] writes each of [registers] before reading it (bounded walk; a
// switch, a try range or too many steps count as "read").
private fun MutableMethod.deadFrom(start: Int, registers: Set<Int>): Boolean {
    val implementation = implementation!!
    val code = implementation.instructions
    val tries = implementation.tryBlocks.map { it.start.location.index until it.end.location.index }
    val seen = mutableSetOf<Pair<Int, Set<Int>>>()
    val work = ArrayDeque(listOf(start to registers))
    var steps = 0
    while (work.isNotEmpty()) {
        val (index, pending) = work.removeLast()
        if (pending.isEmpty() || !seen.add(index to pending)) continue
        if (++steps > 1000 || index !in code.indices || tries.any { index in it }) return false
        val instruction = code[index]
        if (pending.any { instruction.readsRegister(it) }) return false
        val left = pending.filterNot { instruction.writesRegister(it) }.toSet()
        val name = instruction.opcode.name
        when {
            name.startsWith("return") || instruction.opcode == Opcode.THROW -> Unit
            name.endsWith("switch") -> return false
            instruction is BuilderOffsetInstruction -> {
                work += instruction.target.location.index to left
                if (!name.startsWith("goto")) work += index + 1 to left
            }
            else -> work += index + 1 to left
        }
    }
    return true
}

private fun Instruction.listedRegisters(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
    is TwoRegisterInstruction -> listOf(registerA, registerB)
    is OneRegisterInstruction -> listOf(registerA)
    else -> emptyList()
}

private fun Instruction.writesRegister(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val target = (this as OneRegisterInstruction).registerA
    return register == target || opcode.setsWideRegister() && register == target + 1
}

// Conservative: a wide operand also reads the register after it.
private fun Instruction.readsRegister(register: Int): Boolean {
    val listed = listedRegisters()
    val read = when {
        !opcode.setsRegister() -> listed
        opcode.name.endsWith("/2addr") -> listed
        else -> listed.drop(1)
    }
    val wide = this !is FiveRegisterInstruction && this !is RegisterRangeInstruction &&
        listOf("wide", "long", "double").any { it in opcode.name }
    return register in read || wide && (register - 1) in read
}

private fun Instruction.registerA() = (this as OneRegisterInstruction).registerA

private fun Method.packageReads(): List<Int> =
    implementation?.instructions?.mapIndexedNotNull { index, instruction ->
        index.takeIf { memberKey(instruction) == GET_PACKAGE_NAME }
    }.orEmpty()

private fun Method.callsAny(keys: Set<String>) =
    implementation?.instructions?.any { memberKey(it) in keys } == true

private fun Method.hasStringStarting(prefix: String) =
    implementation?.instructions?.any { it.stringLiteral()?.startsWith(prefix) == true } == true

private fun ClassDef.isTagged(tag: String) =
    methods.firstOrNull { it.name == "<clinit>" }?.implementation?.instructions?.any { it.stringLiteral() == tag } == true

private fun MethodReference.key() = "$definingClass->$name${parameterTypes.joinToString("", "(", ")")}$returnType"

private fun FieldReference.key() = "$definingClass->$name:$type"

private fun Instruction.stringLiteral() = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
