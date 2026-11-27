package local.wazemaps

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*

internal fun Method.code() = implementation?.instructions?.toList().orEmpty()
internal fun Method.calls() = code().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
internal fun Method.strings() = code().mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
internal fun Method.parameters(vararg types: String) = parameterTypes.map(CharSequence::toString) == types.toList()
private fun <T> List<T>.unique(label: String): T = singleOrNull()
    ?: throw PatchException("Waze structure changed: $label matched $size candidates. No ambiguous hook will be applied.")

internal fun BytecodePatchContext.findMethod(label: String, test: (Method) -> Boolean): MutableMethod {
    val matches = mutableListOf<Method>()
    classDefForEach { type ->
        if (!type.type.startsWith("Llocal/wazemaps/")) type.methods.filterTo(matches, test)
    }
    val match = matches.unique(label)
    return mutableClassDefBy(match.definingClass).methods.single { it == match }
}

internal fun BytecodePatchContext.resourcePrepare(): MutableMethod = findMethod("resource preparation") {
    it.parameters() && it.returnType == "V" && "Resources extraction unnecessary" in it.strings() &&
        it.calls().any { ref -> ref.name == "getPackageInfo" && ref.definingClass == "Landroid/content/pm/PackageManager;" }
}

internal fun BytecodePatchContext.resourceHooks(): List<MutableMethod> {
    val prepare = resourcePrepare()
    val owner = mutableClassDefBy(prepare.definingClass)
    val extraction = owner.methods.filter { "assets/res/skins" in it.strings() && it.parameters("Z") && it.returnType == "V" }
        .toList().unique("skin extraction")
    if (!reachesResourceExtraction(prepare, extraction, owner.methods.toList()))
        throw PatchException("Skin preparation no longer reaches synchronous extraction")
    val reset = owner.methods.filter { method ->
        method.parameters() && method.returnType == "V" && reachesResourceExtraction(method, extraction, owner.methods.toList()) &&
            method.calls().any { it.definingClass == "Ljava/io/File;" && it.name == "delete" } && "version" in method.strings()
    }.toList().unique("resource reset")
    return listOf(prepare, reset)
}

/** Only synchronous static calls in the resource owner may bridge extraction. */
internal fun reachesResourceExtraction(start: Method, extraction: Method, methods: List<Method>): Boolean {
    val visited = mutableSetOf<Method>()
    fun reaches(method: Method): Boolean {
        if (method == extraction) return true
        if (!visited.add(method)) return false
        return method.code().any { instruction ->
            if (instruction.opcode !in setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)) return@any false
            val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            methods.singleOrNull { it == ref && it.definingClass == start.definingClass && it.parameters("Z") &&
                it.returnType == "V" && AccessFlags.STATIC.isSet(it.accessFlags) }?.let(::reaches) == true
        }
    }
    return reaches(start)
}

internal fun BytecodePatchContext.settingsRenderer(): MutableMethod = findMethod("settings row renderer") { method ->
    method.returnType == "Landroid/view/View;" && method.parameterTypes.size == 1 && "page" in method.strings() &&
        method.calls().any { ref ->
            ref.definingClass == method.definingClass && ref.returnType == "Landroid/view/View;" &&
                ref.parameterTypes == method.parameterTypes && classDefBy(method.definingClass).methods.any {
                    it == ref && AccessFlags.ABSTRACT.isSet(it.accessFlags)
                }
        }
}

internal fun reachesAssetOpen(start: Method, methods: List<Method>): Boolean {
    val visited = mutableSetOf<Method>()
    fun reaches(method: Method): Boolean = visited.add(method) && method.calls().any { ref ->
        (ref.definingClass == "Landroid/content/res/AssetManager;" && ref.name == "open" && ref.returnType == "Ljava/io/InputStream;") ||
            methods.singleOrNull { it == ref && it.definingClass == start.definingClass && it.returnType == "Ljava/io/InputStream;" }
                ?.let(::reaches) == true
    }
    return reaches(start)
}

internal fun isSkinAssetLoader(method: Method, methods: List<Method>): Boolean =
    method.parameters("Ljava/lang/String;") && method.returnType == "Ljava/io/InputStream;" &&
        "res/skins/default/" in method.strings() &&
        // The skin filename is forwarded unchanged. Encoded-path loaders prepend a directory.
        (method.calls().any { it.definingClass == "Landroid/content/res/AssetManager;" && it.name == "open" } ||
            method.calls().none { it.definingClass in setOf("Ljava/lang/StringBuilder;", "Ljava/lang/String;") &&
                it.name in setOf("append", "concat", "format") }) &&
        reachesAssetOpen(method, methods)

internal fun BytecodePatchContext.assetLoader(): MutableMethod = findMethod("skin asset stream") { method ->
    method.parameters("Ljava/lang/String;") && method.returnType == "Ljava/io/InputStream;" &&
        "res/skins/default/" in method.strings() && isSkinAssetLoader(method, classDefBy(method.definingClass).methods.toList())
}

internal fun isBadgeRenderer(method: Method): Boolean =
    method.parameters("Landroid/content/Context;") && method.returnType == "Landroid/graphics/drawable/Drawable;" &&
        !AccessFlags.STATIC.isSet(method.accessFlags) &&
        ("_ui.png" in method.strings() || method.strings().containsAll(listOf("_ui", ".png"))) &&
        method.calls().any { ref -> ref.returnType == "Landroid/graphics/drawable/Drawable;" &&
            ref.parameterTypes.map(CharSequence::toString) in listOf(listOf("Ljava/lang/String;"),
                listOf("Landroid/content/res/Resources;", "Ljava/lang/String;"),
                listOf("Ljava/lang/String;", "Landroid/content/res/Resources;")) } &&
        method.calls().any { it.definingClass == "Ljava/lang/Integer;" && it.name == "intValue" }

internal fun BytecodePatchContext.isSubtype(type: String, parent: String): Boolean =
    generateSequence(type) { classDefByOrNull(it)?.superclass }.any { it == parent }

internal fun BytecodePatchContext.moodGate(): MutableMethod = findMethod("mood catalogue beta gate") { method ->
    isSubtype(method.definingClass, "Landroid/app/Activity;") && method.code().any {
        ((it as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
            field.definingClass == "Lcom/waze/config/ConfigValues;" && field.name == "CONFIG_VALUE_MOODS_BETA_ENABLED"
        } == true
    }
}

internal fun BytecodePatchContext.moodScreen(): MutableMethod {
    val gate = moodGate()
    val owner = mutableClassDefBy(gate.definingClass)
    val create = owner.methods.filter { it.name == "onCreate" && it.parameters("Landroid/os/Bundle;") && it.returnType == "V" }
        .toList().unique("mood screen lifecycle")
    val visited = mutableSetOf<Method>()
    fun reaches(method: Method): Boolean = method == gate || (visited.add(method) &&
        method.calls().any { ref -> owner.methods.find { it == ref }?.let(::reaches) == true })
    if (!reaches(create)) throw PatchException("Mood catalogue is not reached from screen creation")
    return create
}

internal fun Instruction.arguments(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}

/** Follow a named config object to its boolean result within one basic block. */
internal fun booleanConfigResult(method: Method, fieldName: String): Pair<Int, Int> {
    val code = method.code()
    val offsets = mutableListOf<Int>()
    var address = 0
    for (instruction in code) { offsets.add(address); address += instruction.codeUnits }
    val incoming = code.indices.mapNotNull { index ->
        (code[index] as? OffsetInstruction)?.let { offsets[index] + it.codeOffset }
    }.toSet()
    val start = code.indices.filter {
        ((code[it] as? ReferenceInstruction)?.reference as? FieldReference)?.let { field ->
            field.definingClass == "Lcom/waze/config/ConfigValues;" && field.name == fieldName
        } == true
    }.unique("$fieldName read")
    if (code[start].opcode != Opcode.SGET_OBJECT) throw PatchException("Config gate is no longer an object read")
    val field = (code[start] as ReferenceInstruction).reference as FieldReference
    val objects = mutableSetOf((code[start] as OneRegisterInstruction).registerA)
    val boxed = mutableSetOf<Int>()
    var pending: String? = null
    for (index in start + 1 until code.size) {
        val instruction = code[index]
        if (offsets[index] in incoming || instruction is OffsetInstruction || !instruction.opcode.canContinue()) break
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (ref != null && instruction.arguments().isNotEmpty()) {
            val args = instruction.arguments()
            pending = when {
                ref.definingClass == "Ljava/lang/Boolean;" && ref.name == "booleanValue" && args.singleOrNull() in boxed -> "Z"
                ref.definingClass == field.type && ref.parameterTypes.isEmpty() && args.singleOrNull() in objects &&
                    ref.returnType in setOf("Z", "Ljava/lang/Boolean;", "Ljava/lang/Object;") -> ref.returnType
                ref.definingClass == "Lcom/waze/ConfigManager;" && ref.parameterTypes.map(CharSequence::toString) == listOf(field.type) &&
                    args.size == 2 && args[1] in objects && ref.returnType == "Z" -> "Z"
                else -> null
            }
            continue
        }
        if (instruction.opcode == Opcode.MOVE_RESULT && pending == "Z")
            return index to (instruction as OneRegisterInstruction).registerA
        val dest = (instruction as? OneRegisterInstruction)?.registerA
        if (instruction.opcode == Opcode.CHECK_CAST) continue
        val source = (instruction as? TwoRegisterInstruction)?.registerB
        val move = instruction.opcode in setOf(Opcode.MOVE_OBJECT, Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_16)
        val objectMove = move && source in objects
        val boxedMove = move && source in boxed
        if (instruction.opcode.setsRegister() && dest != null) { objects.remove(dest); boxed.remove(dest) }
        if (objectMove) objects.add(dest!!)
        if (boxedMove || (instruction.opcode == Opcode.MOVE_RESULT_OBJECT && pending in setOf("Ljava/lang/Boolean;", "Ljava/lang/Object;"))) boxed.add(dest!!)
        pending = null
    }
    throw PatchException("Cannot trace $fieldName to a boolean result without crossing control flow")
}

internal fun BytecodePatchContext.configSynced(): MutableMethod {
    val manager = mutableClassDefBy("Lcom/waze/ConfigManager;")
    val fromServer = manager.methods.filter { it.name == "onConfigSyncedFromServer" && it.parameters() && it.returnType == "V" }.toList()
    if (fromServer.isNotEmpty()) return fromServer.unique("server config callback").also {
        if (it.implementation == null || it.calls().isEmpty()) throw PatchException("Server config callback has no dispatcher")
    }
    return manager.methods.filter { method ->
        method.parameters() && method.returnType == "V" && method.calls().any {
            it.definingClass == "Lcom/waze/NativeManager;" && it.name == "runMainThreadTask" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Runnable;")
        } && method.calls().any { it.name == "clear" && it.definingClass == "Ljava/util/List;" } &&
            method.code().any { instruction -> instruction.opcode == Opcode.IPUT_BOOLEAN }
    }.toList().unique("configuration sync completion")
}

internal fun BytecodePatchContext.configGetter(fields: List<String>, boxed: String, primitive: String): MutableMethod {
    val values = classDefBy("Lcom/waze/config/ConfigValues;")
    val types = fields.map { name -> values.fields.filter { it.name == name }.toList().unique("config $name").type }.distinct()
    val type = types.unique("common config type")
    return mutableClassDefBy(type).methods.filter { method ->
        method.parameters() && method.returnType == boxed && method.implementation != null &&
            method.calls().any { it.returnType == primitive && it.parameterTypes.map(CharSequence::toString) == listOf(type) } &&
            method.calls().any { it.definingClass == boxed && it.name == "valueOf" }
    }.toList().unique("$boxed config getter").also {
        if (it.implementation!!.registerCount < 2) throw PatchException("Config getter has no scratch register")
    }
}

private fun BytecodePatchContext.configId(getter: Method): String {
    // Resolve the identifier getter through the actual native read, not a guessed int field.
    val primitive = if (getter.returnType == "Ljava/lang/Long;") "J" else "Z"
    val target = if (primitive == "J") "getConfigValueLongNTV" else "getConfigValueBoolNTV"
    val method = classDefBy("Lcom/waze/ConfigManager;").methods.filter { method ->
        method.parameters(getter.definingClass) && method.returnType == primitive &&
            method.calls().any { it.definingClass == "Lcom/waze/ConfigManager;" && it.name == target }
    }.toList().unique("native config reader")
    val nativeIndex = method.code().indexOfFirst {
        val ref = (it as? ReferenceInstruction)?.reference as? MethodReference
        ref?.definingClass == "Lcom/waze/ConfigManager;" && ref.name == target
    }
    if (nativeIndex < 2) throw PatchException("Native config read changed: $target")
    val instructions = method.code()
    val idRegister = when (val call = instructions[nativeIndex]) {
        is FiveRegisterInstruction -> call.registerD
        is RegisterRangeInstruction -> call.startRegister + 1
        else -> throw PatchException("Native config read register layout changed")
    }
    val resultIndex = (0 until nativeIndex).lastOrNull {
        (instructions[it] as? OneRegisterInstruction)?.registerA == idRegister && instructions[it].opcode == Opcode.MOVE_RESULT
    } ?: throw PatchException("Native config identifier result missing")
    if (resultIndex != nativeIndex - 1) throw PatchException("Native config identifier data flow changed")
    val id = ((instructions[resultIndex - 1] as? ReferenceInstruction)?.reference as? MethodReference)
        ?: throw PatchException("Native config identifier getter missing")
    if (id.parameterTypes.isNotEmpty() || id.returnType != "I") throw PatchException("Unexpected config identifier signature")
    val hierarchy = generateSequence(classDefBy(getter.definingClass)) { type -> type.superclass?.let { classDefByOrNull(it) } }
    if (hierarchy.none { it.type == id.definingClass }) throw PatchException("Config identifier belongs to a different type")
    val declaration = hierarchy.flatMap { it.methods }.firstOrNull {
        it.name == id.name && it.parameterTypes.isEmpty() && it.returnType == "I"
    } ?: throw PatchException("Config identifier declaration missing")
    if (!AccessFlags.PUBLIC.isSet(declaration.accessFlags)) throw PatchException("Config identifier is no longer public")
    return id.name
}

/** Rebind only the selected extension's reflection literals, including nested callback classes.
 * The source literals are fixture defaults; no target APK is identified by these old names.
 */
internal fun BytecodePatchContext.bindExtension(extension: String, context: Boolean = false, rows: Boolean = false, config: Method? = null) {
    fun api(type: String, name: String, result: String, static: Boolean, vararg parameters: String) {
        val declarations = generateSequence(classDefBy(type)) { owner -> owner.superclass?.let { classDefByOrNull(it) } }
            .map { owner -> owner.methods.filter { it.name == name && it.returnType == result && it.parameters(*parameters) }.toList() }
            .firstOrNull { it.isNotEmpty() }.orEmpty()
        val method = declarations.unique("runtime API $type->$name")
        if (!AccessFlags.PUBLIC.isSet(method.accessFlags) || AccessFlags.STATIC.isSet(method.accessFlags) != static)
            throw PatchException("Runtime API access changed: $type->$name")
    }
    val native = "Lcom/waze/NativeManager;"
    api(native, "Post", "Z", true, "Ljava/lang/Runnable;")
    if (config != null || extension.endsWith("/AndroidAutoSettings;")) {
        api(native, "isAppStarted", "Z", true)
        api(native, "getInstance", native, true)
    }
    if (config != null) api("Lcom/waze/ConfigManager;", "getInstance", "Lcom/waze/ConfigManager;", true)
    if (extension.endsWith("/AndroidAutoSettings;")) {
        api(native, "isLoggedInNTV", "Z", false)
        val account = "Lcom/waze/mywaze/MyWazeNativeManager;"
        api(account, "getInstance", account, true)
        api(account, "isGuestUser", "Z", false)
    }
    val bindings = linkedMapOf<String, String>()
    if (context) {
        val prepare = resourcePrepare()
        val resolver = prepare.calls().filter {
            (it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/Class;") && it.returnType == "Ljava/lang/Object;") ||
                (it.parameterTypes.isEmpty() && isSubtype(it.returnType, "Landroid/content/Context;"))
        }.distinct().unique("application resolver")
        val resolved = classDefBy(resolver.definingClass).methods.filter { it == resolver }.toList().unique("application resolver method")
        if (!AccessFlags.PUBLIC.isSet(resolved.accessFlags) || !AccessFlags.STATIC.isSet(resolved.accessFlags) ||
            (resolver.parameterTypes.isNotEmpty() && prepare.code().none {
                ((it as? ReferenceInstruction)?.reference as? TypeReference)?.type == "Landroid/app/Application;"
            }))
            throw PatchException("Application resolver contract changed")
        val bridge = mutableClassDefBy(extension).methods.filter { it.name == "application" && it.parameters() && it.returnType == "Landroid/content/Context;" }
            .toList().unique("extension application bridge")
        if (bridge.implementation!!.registerCount < 1) throw PatchException("Application bridge has no scratch register")
        val invoke = if (resolver.parameterTypes.isEmpty()) "invoke-static {}, $resolver" else
            "const-class v0, Landroid/app/Application;\ninvoke-static {v0}, $resolver"
        bridge.addInstructions(0, "$invoke\nmove-result-object v0\ncheck-cast v0, Landroid/content/Context;\nreturn-object v0")
        println("Waze application bridge $extension -> $resolver")
    }
    if (rows) {
        // The custom view name is part of Waze's XML layout contract, unlike its methods.
        val row = classDefBy("Lcom/waze/settings/tree/views/WazeSettingsView;")
        val title = row.methods.filter { method -> method.parameters("Ljava/lang/String;") && method.returnType in setOf("V", row.type) &&
            method.calls().count { it.name == "setText" && it.parameterTypes.map(CharSequence::toString) == listOf("Ljava/lang/CharSequence;") } == 1 &&
            method.calls().none { it.name in setOf("setVisibility", "getHint") }
        }.toList().unique("settings title setter")
        val subtitle = row.methods.filter { method -> method.parameters("Ljava/lang/String;") && method.returnType in setOf("V", row.type) &&
            method.calls().any { it.name == "getHint" } && method.calls().any { it.name == "setText" } && method.calls().any { it.name == "setVisibility" }
        }.toList().unique("settings subtitle setter")
        fun inflates(method: Method, seen: MutableSet<Method> = mutableSetOf()): Boolean = seen.add(method) &&
            (method.calls().any { it.definingClass == "Landroid/view/LayoutInflater;" && it.name == "inflate" } ||
                method.calls().any { ref -> row.methods.find { it == ref }?.let { inflates(it, seen) } == true })
        val style = row.methods.filter { method -> method.parameters("I") && method.returnType in setOf("V", row.type) &&
            method.code().any { instruction -> instruction.opcode == Opcode.IPUT &&
                ((instruction as? ReferenceInstruction)?.reference as? FieldReference)?.definingClass == row.type } && inflates(method)
        }.toList().unique("settings style setter")
        for (method in listOf(title, subtitle, style)) if (!AccessFlags.PUBLIC.isSet(method.accessFlags))
            throw PatchException("Settings binding is no longer public")
        bindings.putAll(mapOf("N" to title.name, "P" to subtitle.name, "B" to style.name))
    }
    if (config != null) bindings["e"] = configId(config)
    val classes = mutableListOf<String>()
    classDefForEach { if (it.type == extension || it.type.startsWith(extension.removeSuffix(";") + "$")) classes.add(it.type) }
    val seen = mutableSetOf<String>()
    for (type in classes) for (method in mutableClassDefBy(type).methods) {
        method.code().forEachIndexed { index, instruction ->
            val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
            if (value in bindings) {
                val register = (instruction as OneRegisterInstruction).registerA
                val replacement = bindings.getValue(value!!)
                if (!replacement.matches(Regex("[A-Za-z0-9_.$]+"))) throw PatchException("Invalid discovered binding")
                method.replaceInstruction(index, "const-string v$register, \"$replacement\"")
                seen.add(value)
            }
        }
    }
    if (seen != bindings.keys) throw PatchException("Extension binding sites missing: ${bindings.keys - seen}")
    println("Waze bindings $extension: $bindings")
}
