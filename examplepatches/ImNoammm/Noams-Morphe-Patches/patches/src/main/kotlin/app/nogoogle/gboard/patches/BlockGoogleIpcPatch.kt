package app.nogoogle.gboard.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/** Which receiver types a rewritten call may have. */
private enum class Receiver { CONTEXT, ACTIVITY, CONTENT_RESOLVER }

/** A framework method whose call sites are redirected to the same-named GoogleBlocker method. */
private class Rule(val receiver: Receiver, val name: String, val proto: String) {
    // proto is "(<params>)<return>" of the instance method.
    val staticDescriptor: String
        get() {
            val first = when (receiver) {
                Receiver.CONTEXT -> "Landroid/content/Context;"
                Receiver.ACTIVITY -> "Landroid/app/Activity;"
                Receiver.CONTENT_RESOLVER -> "Landroid/content/ContentResolver;"
            }
            return "$EXTENSION->$name(" + first + proto.removePrefix("(")
        }
}

private val RULES = listOf(
    Rule(Receiver.CONTEXT, "bindService", "(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z"),
    Rule(Receiver.CONTEXT, "bindService", "(Landroid/content/Intent;ILjava/util/concurrent/Executor;Landroid/content/ServiceConnection;)Z"),
    Rule(Receiver.CONTEXT, "bindServiceAsUser", "(Landroid/content/Intent;Landroid/content/ServiceConnection;ILandroid/os/UserHandle;)Z"),
    Rule(Receiver.CONTEXT, "startService", "(Landroid/content/Intent;)Landroid/content/ComponentName;"),
    Rule(Receiver.CONTEXT, "startForegroundService", "(Landroid/content/Intent;)Landroid/content/ComponentName;"),
    Rule(Receiver.CONTEXT, "sendBroadcast", "(Landroid/content/Intent;)V"),
    Rule(Receiver.CONTEXT, "sendBroadcast", "(Landroid/content/Intent;Ljava/lang/String;)V"),
    Rule(Receiver.CONTEXT, "startActivity", "(Landroid/content/Intent;)V"),
    Rule(Receiver.CONTEXT, "startActivity", "(Landroid/content/Intent;Landroid/os/Bundle;)V"),
    Rule(Receiver.CONTEXT, "startActivities", "([Landroid/content/Intent;)V"),
    Rule(Receiver.CONTEXT, "startActivities", "([Landroid/content/Intent;Landroid/os/Bundle;)V"),
    Rule(Receiver.CONTEXT, "getSystemService", "(Ljava/lang/String;)Ljava/lang/Object;"),
    Rule(Receiver.CONTEXT, "getSystemService", "(Ljava/lang/Class;)Ljava/lang/Object;"),
    Rule(Receiver.ACTIVITY, "startActivityForResult", "(Landroid/content/Intent;I)V"),
    Rule(Receiver.ACTIVITY, "startActivityForResult", "(Landroid/content/Intent;ILandroid/os/Bundle;)V"),
    Rule(Receiver.CONTENT_RESOLVER, "query", "(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;"),
    Rule(Receiver.CONTENT_RESOLVER, "insert", "(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;"),
    Rule(Receiver.CONTENT_RESOLVER, "update", "(Landroid/net/Uri;Landroid/content/ContentValues;Ljava/lang/String;[Ljava/lang/String;)I"),
    Rule(Receiver.CONTENT_RESOLVER, "delete", "(Landroid/net/Uri;Ljava/lang/String;[Ljava/lang/String;)I"),
    Rule(Receiver.CONTENT_RESOLVER, "getType", "(Landroid/net/Uri;)Ljava/lang/String;"),
    Rule(Receiver.CONTENT_RESOLVER, "openInputStream", "(Landroid/net/Uri;)Ljava/io/InputStream;"),
    Rule(Receiver.CONTENT_RESOLVER, "openFileDescriptor", "(Landroid/net/Uri;Ljava/lang/String;)Landroid/os/ParcelFileDescriptor;"),
    Rule(Receiver.CONTENT_RESOLVER, "openFileDescriptor", "(Landroid/net/Uri;Ljava/lang/String;Landroid/os/CancellationSignal;)Landroid/os/ParcelFileDescriptor;"),
    Rule(Receiver.CONTENT_RESOLVER, "openAssetFileDescriptor", "(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/res/AssetFileDescriptor;"),
    Rule(Receiver.CONTENT_RESOLVER, "registerContentObserver", "(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V"),
    Rule(Receiver.CONTENT_RESOLVER, "acquireUnstableContentProviderClient", "(Landroid/net/Uri;)Landroid/content/ContentProviderClient;"),
    Rule(Receiver.CONTENT_RESOLVER, "acquireUnstableContentProviderClient", "(Ljava/lang/String;)Landroid/content/ContentProviderClient;"),
    Rule(Receiver.CONTENT_RESOLVER, "acquireContentProviderClient", "(Landroid/net/Uri;)Landroid/content/ContentProviderClient;"),
    Rule(Receiver.CONTENT_RESOLVER, "acquireContentProviderClient", "(Ljava/lang/String;)Landroid/content/ContentProviderClient;"),
    Rule(Receiver.CONTENT_RESOLVER, "call", "(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;"),
    Rule(Receiver.CONTENT_RESOLVER, "call", "(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;"),
).groupBy { it.name + it.proto }

/** Framework classes that are (or extend) android.content.Context. */
private val FRAMEWORK_CONTEXTS = setOf(
    "Landroid/content/Context;", "Landroid/content/ContextWrapper;",
    "Landroid/view/ContextThemeWrapper;", "Landroid/app/Application;", "Landroid/app/Service;",
    "Landroid/app/IntentService;", "Landroid/app/job/JobService;",
    "Landroid/inputmethodservice/InputMethodService;",
    "Landroid/inputmethodservice/AbstractInputMethodService;",
    "Landroid/service/textservice/SpellCheckerService;",
    "Landroid/accessibilityservice/AccessibilityService;", "Landroid/app/backup/BackupAgent;",
    "Landroid/app/backup/BackupAgentHelper;", "Landroid/app/Activity;",
    "Landroid/app/ListActivity;", "Landroid/app/ExpandableListActivity;",
    "Landroid/preference/PreferenceActivity;", "Landroid/app/NativeActivity;",
    "Landroid/app/TabActivity;", "Landroid/app/ActivityGroup;", "Landroid/app/AliasActivity;",
    "Landroid/app/LauncherActivity;",
    "Landroid/service/notification/NotificationListenerService;",
    "Landroid/widget/RemoteViewsService;", "Landroid/service/quicksettings/TileService;",
)
private val FRAMEWORK_ACTIVITIES = setOf(
    "Landroid/app/Activity;", "Landroid/app/ListActivity;", "Landroid/app/ExpandableListActivity;",
    "Landroid/preference/PreferenceActivity;", "Landroid/app/NativeActivity;",
    "Landroid/app/TabActivity;", "Landroid/app/ActivityGroup;", "Landroid/app/AliasActivity;",
    "Landroid/app/LauncherActivity;",
)

private const val TTS_INIT_PREFIX = "Landroid/speech/tts/TextToSpeech;-><init>(Landroid/content/Context;"

private fun MethodReference.protoString() =
    parameterTypes.joinToString("", "(", ")") + returnType

private fun MethodReference.descriptor() = "$definingClass->$name${protoString()}"

private fun Method.sameSignature(other: Method) =
    name == other.name && returnType == other.returnType &&
        parameterTypes.map { it.toString() } == other.parameterTypes.map { it.toString() }

internal fun Instruction.registerList(): String = when (this) {
    is RegisterRangeInstruction ->
        "{v$startRegister .. v${startRegister + registerCount - 1}}"
    is FiveRegisterInstruction ->
        listOf(registerC, registerD, registerE, registerF, registerG)
            .take(registerCount).joinToString(", ", "{", "}") { "v$it" }
    else -> throw PatchException("Unexpected invoke format $opcode")
}

private fun BytecodePatchContext.extendsAny(type: String, framework: Set<String>): Boolean {
    var current: String? = type
    var depth = 0
    while (current != null && depth++ < 32) {
        if (current in framework) return true
        if (current.startsWith("Landroid/") || current.startsWith("Ljava/")) return false
        current = classDefByOrNull(current)?.superclass
    }
    return false
}

private fun BytecodePatchContext.receiverMatches(rule: Rule, owner: String, cache: MutableMap<String, Boolean>): Boolean =
    when (rule.receiver) {
        Receiver.CONTENT_RESOLVER -> owner == "Landroid/content/ContentResolver;"
        Receiver.CONTEXT -> cache.getOrPut("C$owner") { extendsAny(owner, FRAMEWORK_CONTEXTS) }
        Receiver.ACTIVITY -> cache.getOrPut("A$owner") { extendsAny(owner, FRAMEWORK_ACTIVITIES) }
    }

private sealed class Edit(val index: Int) {
    class Redirect(index: Int, val rule: Rule) : Edit(index)
    class WrapContext(index: Int, val register: Int) : Edit(index)
}

@Suppress("unused")
val blockGoogleIpcPatch = bytecodePatch(
    name = "Block Google IPC",
    description = "Routes every service bind/start, broadcast, activity launch, content-provider " +
        "access and system-service lookup through a filter that drops anything addressed to " +
        "Google apps, Google content providers or Google web hosts (GMS, Google app, Android " +
        "System Intelligence, Google TTS, Play Store, Chrome). Also hands framework classes " +
        "that bind internally (TextToSpeech) a filtering Context, forces the no-op text " +
        "classifier and hides the system translation service.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(extensionPatch)

    execute {
        val receiverCache = HashMap<String, Boolean>()
        val pending = ArrayList<Pair<ClassDef, Map<Method, List<Edit>>>>()

        classDefForEach { classDef ->
            if (classDef.type.startsWith("Lapp/nogoogle/")) return@classDefForEach
            var perMethod: MutableMap<Method, List<Edit>>? = null
            for (method in classDef.methods) {
                val instructions = method.implementation?.instructions ?: continue
                var edits: MutableList<Edit>? = null
                instructions.forEachIndexed { index, instruction ->
                    val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed
                    when (instruction.opcode) {
                        Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE -> {
                            val rule = RULES[ref.name + ref.protoString()]
                                ?.firstOrNull { receiverMatches(it, ref.definingClass, receiverCache) }
                                ?: return@forEachIndexed
                            (edits ?: ArrayList<Edit>().also { edits = it }).add(Edit.Redirect(index, rule))
                        }
                        Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE -> {
                            if (!ref.descriptor().startsWith(TTS_INIT_PREFIX)) return@forEachIndexed
                            val contextRegister = when (instruction) {
                                is RegisterRangeInstruction -> instruction.startRegister + 1
                                is FiveRegisterInstruction -> instruction.registerD
                                else -> return@forEachIndexed
                            }
                            (edits ?: ArrayList<Edit>().also { edits = it })
                                .add(Edit.WrapContext(index, contextRegister))
                        }
                        else -> {}
                    }
                }
                edits?.let { (perMethod ?: LinkedHashMap<Method, List<Edit>>().also { perMethod = it })[method] = it }
            }
            perMethod?.let { pending += classDef to it }
        }

        var redirected = 0
        var wrapped = 0
        for ((classDef, methods) in pending) {
            val mutableClass = mutableClassDefBy(classDef)
            for ((method, edits) in methods) {
                val mutableMethod = mutableClass.methods.first { it.sameSignature(method) }
                // Highest index first so earlier indices stay valid after insertions.
                for (edit in edits.sortedByDescending { it.index }) {
                    when (edit) {
                        is Edit.Redirect -> {
                            val original = mutableMethod.getInstruction(edit.index)
                            val range = original is RegisterRangeInstruction
                            val op = if (range) "invoke-static/range" else "invoke-static"
                            mutableMethod.replaceInstruction(
                                edit.index,
                                "$op ${original.registerList()}, ${edit.rule.staticDescriptor}",
                            )
                            redirected++
                        }
                        is Edit.WrapContext -> {
                            val r = "v${edit.register}"
                            mutableMethod.addInstructions(
                                edit.index,
                                """
                                    invoke-static/range {$r .. $r}, $EXTENSION->wrap(Landroid/content/Context;)Landroid/content/Context;
                                    move-result-object $r
                                """,
                            )
                            wrapped++
                        }
                    }
                }
            }
        }
        if (redirected == 0) throw PatchException("No IPC call sites found")
        println("Block Google IPC: redirected $redirected call sites, wrapped $wrapped contexts")
    }
}

@Suppress("unused")
val disableGooglePlayServicesPatch = bytecodePatch(
    name = "Disable Google Play services",
    description = "Makes Gboard's Play services availability check always report " +
        "SERVICE_MISSING, so GMS-backed code paths (Clearcut logging, Phenotype, federated " +
        "learning, sign-in, feedback) are skipped instead of retried.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        val targets = ArrayList<Pair<ClassDef, Method>>()
        classDefForEach { classDef ->
            for (method in classDef.methods) {
                if (method.returnType != "I" || !AccessFlags.STATIC.isSet(method.accessFlags)) continue
                if (method.parameterTypes.map { it.toString() } != listOf("Landroid/content/Context;", "I")) continue
                val strings = method.implementation?.instructions?.mapNotNull {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
                } ?: continue
                if (strings.any { it.startsWith("Google Play services out of date for ") } &&
                    strings.contains("com.google.android.gms")
                ) {
                    targets += classDef to method
                }
            }
        }
        if (targets.isEmpty()) throw PatchException("isGooglePlayServicesAvailable not found")
        for ((classDef, method) in targets) {
            val m = mutableClassDefBy(classDef).methods.first { it.sameSignature(method) }
            // ConnectionResult.SERVICE_MISSING = 1 while the mod-menu switch is on.
            m.addInstructionsWithLabels(
                0,
                """
                    invoke-static {}, Lapp/nogoogle/gboard/FlagOverrides;->gmsAvailability()I
                    move-result v0
                    if-ltz v0, :stock
                    return v0
                """,
                ExternalLabel("stock", m.getInstruction(0)),
            )
        }
    }
}

@Suppress("unused")
val signatureSelfCheckPatch = bytecodePatch(
    name = "Fix signature self-check",
    description = "Gboard verifies that its own APK is signed by Google and refuses to start " +
        "otherwise. This lets the check pass for Gboard's own package only; other packages " +
        "are still checked, so no Google app is ever trusted by the patched keyboard.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        val classDef = classDefBy { cd ->
            cd.methods.any { m ->
                m.name == "<clinit>" && m.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string ==
                        "com/google/android/libraries/inputmethod/utils/SignatureUtils"
                } == true
            }
        }
        val method = mutableClassDefBy(classDef).methods.single { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "Z" &&
                m.parameterTypes.map { it.toString() } ==
                listOf("Landroid/content/Context;", "Ljava/lang/String;") &&
                m.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { r ->
                        r.definingClass == "Ljava/util/Arrays;" && r.name == "equals"
                    } == true
                } == true
        }
        method.addInstructionsWithLabels(
            0,
            """
                invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;
                move-result-object v0
                invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :original
                const/4 v0, 0x1
                return v0
            """,
            ExternalLabel("original", method.getInstruction(0)),
        )
    }
}
