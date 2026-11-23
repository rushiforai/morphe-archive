package app.chmateuaspoof.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.w3c.dom.Element

private const val TARGET_VERSION = "0.8.10.226 dev"
private const val EXT = "Lapp/morphe/extension/chmateuaspoof"
private const val UA = "$EXT/UaSpoof;"
private const val SETTINGS = "$EXT/UaSpoofSettings;"
private const val ENTRY = "$EXT/UaSpoofHaiagaruEntry;"
private const val ACTIVITY = "app.morphe.extension.chmateuaspoof.UaSpoofActivity"
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"

// ChMate 0.8.10.226 dev bindings (verified against the stock APK, SHA-256 7290a076…4dd9c4).
private const val APPLICATION = "Ljp/syoboi/a2chMate/RoidonApp;"
private const val REQUEST = "Lo/zzdA;" // okhttp3.Request: url h, method c, headers a
private const val CHALLENGE_DIALOG = "Lo/isOpenJSSEPreferred;" // native Cloudflare challenge WebView
private const val IN_APP_BROWSER = "Lo/TTLandingPageActivity7;" // native in-app browser WebView
// Haiagaru 1.46.0 settings screen (extension classes; inspected in the official 1.46.0 bundle).
private const val HAIAGARU_GROUPS_CLASS = "Lapp/morphe/extension/chmate/HaiagaruSettingsActivityKt;"
private const val HAIAGARU_CATEGORY_CLASS = "Lapp/morphe/extension/chmate/Haiagaru;"
private const val HAIAGARU_GROUP = "Lapp/morphe/extension/chmate/SettingsGroup;"
private const val SET_UA = "Landroid/webkit/WebSettings;->setUserAgentString(Ljava/lang/String;)V"
private val CONNECTION_TYPES = setOf(
    "Ljava/net/URLConnection;", "Ljava/net/HttpURLConnection;", "Ljavax/net/ssl/HttpsURLConnection;",
)
private val CONNECT_CALLS = setOf("connect", "getInputStream", "getOutputStream", "getResponseCode")

private val chMate226 = Compatibility(
    name = "ChMate",
    packageName = "jp.co.airfront.android.a2chMate",
    apkFileType = ApkFileType.APK,
    appIconColor = 0x607D8B,
    targets = listOf(AppTarget(version = TARGET_VERSION, minSdk = 23)),
)

/** Adds the code-built settings screen as a separate launcher entry. Runs in finalize so that
 *  launcher relabelling by other patches (e.g. package rename) cannot overwrite its label. */
private val settingsActivityPatch = resourcePatch {
    finalize {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element
            val activities = document.getElementsByTagName("activity")
            for (i in 0 until activities.length) {
                if ((activities.item(i) as Element).getAttributeNS(ANDROID_NS, "name") == ACTIVITY) return@use
            }
            val activity = document.createElement("activity")
            activity.setAttributeNS(ANDROID_NS, "android:name", ACTIVITY)
            activity.setAttributeNS(ANDROID_NS, "android:label", "UA Spoof")
            activity.setAttributeNS(ANDROID_NS, "android:exported", "true")
            activity.setAttributeNS(ANDROID_NS, "android:taskAffinity", "")
            activity.setAttributeNS(ANDROID_NS, "android:excludeFromRecents", "true")
            val filter = document.createElement("intent-filter")
            val action = document.createElement("action")
            action.setAttributeNS(ANDROID_NS, "android:name", "android.intent.action.MAIN")
            val category = document.createElement("category")
            category.setAttributeNS(ANDROID_NS, "android:name", "android.intent.category.LAUNCHER")
            filter.appendChild(action)
            filter.appendChild(category)
            activity.appendChild(filter)
            application.appendChild(activity)
        }
    }
}

@Suppress("unused")
val chMateUaSpoofPatch = bytecodePatch(
    name = "ChMate UA Spoof",
    description = "Optional full User-Agent spoofing for ChMate 0.8.10.226 dev (default OFF, own settings " +
        "screen \"UA Spoof\"). Applies after Haiagaru's viewing UA and keeps Haiagaru's eddibb reading-auth UA.",
    default = true,
) {
    compatibleWith(chMate226)
    dependsOn(settingsActivityPatch)
    extendWith("extensions/chmateuaspoof.mpe")

    execute {
        if (packageMetadata.versionName != TARGET_VERSION) {
            throw PatchException("ChMate UA Spoof supports only ChMate $TARGET_VERSION, found ${packageMetadata.versionName}")
        }
    }

    // All hooks are placed in finalize, which the patcher runs only after every patch's execute
    // block (independent of patch names/order). So each hook is inserted directly before the
    // original call/return, i.e. after Haiagaru's hook at the same boundary, and runs last.
    finalize {
        hookStartup()
        val constructors = hookRequestConstructors()
        val webViews = hookWebViews()
        val connections = hookConnections()
        val entry = hookHaiagaruSettings()
        println("ChMate UA Spoof: $constructors request constructors, $webViews WebView UA calls, " +
            "$connections java.net boundaries, Haiagaru settings entry: $entry")
    }
}

private fun MutableClass.mutable(method: Method): MutableMethod = methods.first {
    it.name == method.name && it.returnType == method.returnType &&
        it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
}

private fun BytecodePatchContext.hookStartup() {
    val attach = mutableClassDefBy(APPLICATION).methods.singleOrNull {
        it.name == "attachBaseContext" && it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;")
    } ?: throw PatchException("UA Spoof: Application.attachBaseContext missing")
    attach.addInstruction(0, "invoke-static/range {p1 .. p1}, $SETTINGS->init(Landroid/content/Context;)V")
}

/** Appends one group to Haiagaru's settings top list and supplies its controls. Only the two
 *  return/entry points are touched; existing groups and categories are passed through unchanged.
 *  Skipped (launcher screen only) when Haiagaru's settings classes do not match 1.46.0. */
private fun BytecodePatchContext.hookHaiagaruSettings(): String {
    val groupsClass = classDefByOrNull(HAIAGARU_GROUPS_CLASS)
    val categoryClass = classDefByOrNull(HAIAGARU_CATEGORY_CLASS)
    if (groupsClass == null || categoryClass == null || classDefByOrNull(HAIAGARU_GROUP) == null) return "skipped (Haiagaru not found)"
    val groups = groupsClass.methods.singleOrNull {
        it.name == "settingsGroups" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/util/List;" && it.implementation != null
    }
    val category = categoryClass.methods.singleOrNull {
        it.name == "settingsCategory" && it.returnType == "Landroid/widget/LinearLayout;" && it.implementation != null &&
            it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/app/Activity;", "Ljava/lang/String;")
    }
    if (groups == null || category == null) return "skipped (Haiagaru settings signatures differ)"
    if ((category.implementation!!.registerCount) < 3) return "skipped (no local register)"

    val groupsMethod = mutableClassDefBy(HAIAGARU_GROUPS_CLASS).mutable(groups)
    val code = groupsMethod.implementation!!.instructions.toList()
    val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }
    if (returns.isEmpty()) throw PatchException("UA Spoof: Haiagaru settingsGroups has no return")
    returns.asReversed().forEach { index ->
        val register = (code[index] as OneRegisterInstruction).registerA
        // Replacing the return keeps any branch label on our call, so every path passes through it.
        groupsMethod.replaceInstruction(index, "invoke-static/range {v$register .. v$register}, " +
            "$ENTRY->groups(Ljava/util/List;)Ljava/util/List;")
        groupsMethod.addInstructions(index + 1, "move-result-object v$register\nreturn-object v$register")
    }

    val categoryMethod = mutableClassDefBy(HAIAGARU_CATEGORY_CLASS).mutable(category)
    categoryMethod.addInstructionsWithLabels(0, """
        invoke-static/range {p0 .. p1}, $ENTRY->category(Landroid/app/Activity;Ljava/lang/String;)Landroid/widget/LinearLayout;
        move-result-object v0
        if-eqz v0, :haiagaru
        return-object v0
    """, ExternalLabel("haiagaru", categoryMethod.getInstruction(0)))
    return "added"
}

private fun BytecodePatchContext.hookRequestConstructors(): Int {
    val request = mutableClassDefBy(REQUEST)
    if (request.instanceFields.count { it.type == "Lokhttp3/Headers;" } != 1 ||
        request.instanceFields.none { it.name == "a" && it.type == "Lokhttp3/Headers;" } ||
        request.instanceFields.none { it.name == "c" && it.type == "Ljava/lang/String;" } ||
        request.instanceFields.none { it.name == "h" && it.type == "Lo/zzgb;" }
    ) throw PatchException("UA Spoof: native request fields changed")
    val constructors = request.methods.filter { it.name == "<init>" && it.implementation != null }
    if (constructors.size != 3) throw PatchException("UA Spoof: expected 3 request constructors, found ${constructors.size}")
    constructors.forEach { method ->
        val code = method.implementation!!.instructions.toList()
        val words = method.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
        val receiver = method.implementation!!.registerCount - words - 1
        if (code.any { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == receiver })
            throw PatchException("UA Spoof: request constructor reuses its receiver register")
        val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_VOID }
        if (returns.isEmpty()) throw PatchException("UA Spoof: request constructor has no return")
        returns.asReversed().forEach { index ->
            // Replacing keeps any branch label on our call, so no path reaches return without it.
            method.replaceInstruction(index, "invoke-static/range {p0 .. p0}, $UA->prepareRequest(Ljava/lang/Object;)V")
            method.addInstruction(index + 1, "return-void")
        }
    }
    return constructors.size
}

private fun BytecodePatchContext.hookWebViews(): Int {
    var total = 0
    for (type in listOf(CHALLENGE_DIALOG, IN_APP_BROWSER)) {
        val cls = mutableClassDefBy(type)
        var count = 0
        cls.methods.toList().forEach { method ->
            val code = method.implementation?.instructions?.toList() ?: return@forEach
            code.indices.reversed().forEach { index ->
                val instruction = code[index]
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return@forEach
                if (ref.toString() != SET_UA) return@forEach
                if (instruction.opcode != Opcode.INVOKE_VIRTUAL || instruction !is FiveRegisterInstruction)
                    throw PatchException("UA Spoof: unexpected WebView UA call in $type")
                method.replaceInstruction(index,
                    "invoke-static {v${instruction.registerC}, v${instruction.registerD}}, " +
                        "$SETTINGS->setUserAgentString(Landroid/webkit/WebSettings;Ljava/lang/String;)V")
                count++
            }
        }
        if (count != 1) throw PatchException("UA Spoof: expected 1 WebView UA call in $type, found $count")
        total += count
    }
    return total
}

private fun BytecodePatchContext.hookConnections(): Int {
    // Collect first, then mutate; native classes only (extensions keep their own UA policy).
    val targets = mutableListOf<Pair<ClassDef, Method>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach
        cls.methods.forEach { method ->
            val code = method.implementation?.instructions ?: return@forEach
            if (code.any { it.isConnectCall() }) targets += cls to method
        }
    }
    var count = 0
    targets.groupBy({ it.first.type }, { it.second }).forEach { (type, methods) ->
        val mutable = mutableClassDefBy(type)
        methods.forEach { original ->
            val method = mutable.mutable(original)
            val code = method.implementation!!.instructions.toList()
            code.indices.reversed().forEach { index ->
                val instruction = code[index]
                if (!instruction.isConnectCall()) return@forEach
                val ref = (instruction as ReferenceInstruction).reference
                val (receiver, originalCall) = when (instruction) {
                    is FiveRegisterInstruction -> {
                        if (instruction.registerCount != 1) throw PatchException("UA Spoof: unexpected connection call in $type")
                        instruction.registerC to "invoke-virtual {v${instruction.registerC}}, $ref"
                    }
                    is RegisterRangeInstruction -> {
                        if (instruction.registerCount != 1) throw PatchException("UA Spoof: unexpected connection call in $type")
                        instruction.startRegister to
                            "invoke-virtual/range {v${instruction.startRegister} .. v${instruction.startRegister}}, $ref"
                    }
                    else -> throw PatchException("UA Spoof: unsupported connection invocation in $type")
                }
                // Replace the call with our hook (branch labels stay on the hook) and re-add the
                // original call right after it. Anything placed before (Haiagaru's prepare) runs first.
                method.replaceInstruction(index, "invoke-static/range {v$receiver .. v$receiver}, $UA->prepare(Ljava/net/URLConnection;)V")
                method.addInstruction(index + 1, originalCall)
                count++
            }
        }
    }
    if (count == 0) throw PatchException("UA Spoof: native connection calls missing")
    return count
}

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.isConnectCall(): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val ref = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return ref.definingClass in CONNECTION_TYPES && ref.name in CONNECT_CALLS && ref.parameterTypes.isEmpty()
}
