package app.nogoogle.gboard.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22t
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.w3c.dom.Element

private const val EXT = "Lapp/nogoogle/gboard"
private const val VOICE = "$EXT/voice/VoiceController;"
private const val TRANSLATE = "$EXT/translate/LocalTranslate;"
private const val FLAGS = "$EXT/FlagOverrides;"
private const val KEYBOARD_DIRECTION = "$EXT/KeyboardDirection;"
private const val TABS = "$EXT/ExpressionTabs;"
private const val PORTED = "$EXT/extras/PortedFeatures;"
private const val GIF_BRIDGE = "$EXT/gif/GifBridge;"
private const val GIF_EXTENSION_INTERFACE =
    "Lcom/google/android/apps/inputmethod/libs/expression/extension/IGifKeyboardExtension;"
private const val GIF_SEARCH_KEYBOARD = "Lcom/google/android/apps/inputmethod/libs/search/gif/GifSearchKeyboard;"
internal const val GIF_HELPER_PACKAGE = "app.nogoogle.gifproxy"
internal const val MOD_MENU_ACTIVITY = "app.nogoogle.gboard.ModMenuActivity"

private fun Method.strings(): List<String> =
    implementation?.instructions?.mapNotNull {
        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string
    } ?: emptyList()

private fun Method.params() = parameterTypes.map { it.toString() }

private fun Method.sameAs(other: Method) =
    name == other.name && returnType == other.returnType && params() == other.params()

private fun BytecodePatchContext.findMethods(predicate: (ClassDef, Method) -> Boolean): List<Pair<ClassDef, Method>> {
    val found = ArrayList<Pair<ClassDef, Method>>()
    classDefForEach { cd ->
        if (cd.type.startsWith("$EXT/")) return@classDefForEach
        for (m in cd.methods) if (predicate(cd, m)) found += cd to m
    }
    return found
}

private fun BytecodePatchContext.mutable(target: Pair<ClassDef, Method>): MutableMethod =
    mutableClassDefBy(target.first).methods.first { it.sameAs(target.second) }

private fun BytecodePatchContext.single(what: String, predicate: (ClassDef, Method) -> Boolean): MutableMethod {
    val found = findMethods(predicate)
    if (found.size != 1) throw PatchException("$what: expected 1 match, found ${found.size}")
    return mutable(found.single())
}

/** All runtime code (blocker, mod menu, voice, translate) lives in one extension. */
internal val extensionPatch = bytecodePatch {
    extendWith("extensions/nogoogle.mpe")
}

/** Declares the settings activity (No-Google menu and Gboard patches page). */
internal val modMenuActivityPatch = resourcePatch {
    finalize {
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as Element
            val activities = doc.getElementsByTagName("activity")
            for (i in 0 until activities.length) {
                val a = activities.item(i) as Element
                if (MOD_MENU_ACTIVITY == a.getAttributeNS(ANDROID_NS, "name").ifEmpty { a.getAttribute("android:name") }) return@use
            }
            val activity = doc.createElement("activity")
            activity.setAttributeNS(ANDROID_NS, "android:name", MOD_MENU_ACTIVITY)
            activity.setAttributeNS(ANDROID_NS, "android:exported", "false")
            activity.setAttributeNS(ANDROID_NS, "android:label", "No-Google")
            activity.setAttributeNS(ANDROID_NS, "android:configChanges", "orientation|screenSize|uiMode")
            app.appendChild(activity)
        }
    }
}

private val SETTINGS_ORDER = listOf("nogoogle_mod_menu", "nogoogle_gboard_patches")

/** Adds an entry at the top of Gboard's settings that opens the settings activity. */
internal fun ResourcePatchContext.addSettingsEntry(key: String, title: String, summary: String, section: String?) {
    val pkg = document("AndroidManifest.xml").use { it.documentElement.getAttribute("package") }
    var added = 0
    for (path in listOf("res/xml/settings.xml", "res/xml/settings_legacy.xml")) {
        if (!get(path, false).exists()) continue
        document(path).use { doc ->
            val root = doc.documentElement
            val header = "com.google.android.libraries.inputmethod.settings.widget.HeaderPreference"
            val pref = doc.createElement(header)
            pref.setAttributeNS(ANDROID_NS, "android:key", key)
            pref.setAttributeNS(ANDROID_NS, "android:title", title)
            pref.setAttributeNS(ANDROID_NS, "android:summary", summary)
            pref.setAttributeNS(ANDROID_NS, "android:persistent", "false")
            // Reuse an existing header's icon so it matches the list.
            val nodes = root.getElementsByTagName(header)
            for (i in 0 until nodes.length) {
                val icon = (nodes.item(i) as Element).getAttributeNS(ANDROID_NS, "icon")
                    .ifEmpty { (nodes.item(i) as Element).getAttribute("android:icon") }
                if (icon.isNotEmpty()) {
                    pref.setAttributeNS(ANDROID_NS, "android:icon", icon)
                    break
                }
            }
            val intent = doc.createElement("intent")
            intent.setAttributeNS(ANDROID_NS, "android:action", "android.intent.action.MAIN")
            intent.setAttributeNS(ANDROID_NS, "android:targetPackage", pkg)
            intent.setAttributeNS(ANDROID_NS, "android:targetClass", MOD_MENU_ACTIVITY)
            if (section != null) {
                val extra = doc.createElement("extra")
                extra.setAttributeNS(ANDROID_NS, "android:name", "section")
                extra.setAttributeNS(ANDROID_NS, "android:value", section)
                intent.appendChild(extra)
            }
            pref.appendChild(intent)
            // Put ours first so they are easy to find, in SETTINGS_ORDER whatever order the patches run in.
            val rank = SETTINGS_ORDER.indexOf(key)
            val next = (0 until root.childNodes.length).map { root.childNodes.item(it) }.filterIsInstance<Element>()
                .firstOrNull { el ->
                    val r = SETTINGS_ORDER.indexOf(el.getAttributeNS(ANDROID_NS, "key").ifEmpty { el.getAttribute("android:key") })
                    r < 0 || r > rank
                }
            if (next != null) root.insertBefore(pref, next) else root.appendChild(pref)
            added++
        }
    }
    if (added == 0) throw PatchException("Gboard settings XML not found")
}

@Suppress("unused")
val modMenuPatch = resourcePatch(
    name = "No-Google settings",
    description = "Adds a \"No-Google\" entry to Gboard's settings with switches for every " +
        "runtime patch: blocking categories, Play services, GIF sources and the sticker tab, " +
        "keyboard direction, offline voice typing (engine, model, threads, auto stop), offline " +
        "translation (engine), model downloads and import, and a log of blocked calls.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(extensionPatch, modMenuActivityPatch)

    finalize {
        addSettingsEntry("nogoogle_mod_menu", "No-Google", "Privacy, offline voice & translation", null)
    }
}

private val NATIVE_LIBS = listOf("libnogoogle_jni.so", "libnogoogle_llm.so", "libc++_shared.so")

internal val nativeLibrariesPatch = resourcePatch {
    execute {
        for (lib in NATIVE_LIBS) {
            val bytes = object {}.javaClass.getResourceAsStream("/nogoogle-native/arm64-v8a/$lib")
                ?.readBytes() ?: throw PatchException("$lib missing from the patch bundle")
            val target = get("lib/arm64-v8a/$lib", false)
            target.parentFile.mkdirs()
            target.writeBytes(bytes)
        }
        // The patcher stores added files compressed; let Android extract native libs at install.
        document("AndroidManifest.xml").use { doc ->
            val app = doc.getElementsByTagName("application").item(0) as Element
            val plain = app.getAttributeNode("android:extractNativeLibs")
            val namespaced = app.getAttributeNodeNS(ANDROID_NS, "extractNativeLibs")
            when {
                plain != null -> plain.value = "true"
                namespaced != null -> namespaced.value = "true"
                else -> app.setAttributeNS(ANDROID_NS, "android:extractNativeLibs", "true")
            }
        }
    }
}

@Suppress("unused")
val offlineVoicePatch = bytecodePatch(
    name = "Offline voice typing",
    description = "Replaces Gboard's voice typing (Google servers / Google app) with on-device " +
        "Whisper (whisper.cpp) in the keyboard's current language. Phrases are transcribed while " +
        "you talk and typed when you tap Done; ACFT models only encode the recorded audio, so they " +
        "are several times faster. Models are downloaded in No-Google settings (through the " +
        "network helper app) or copied into the app's models folder.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(extensionPatch, nativeLibrariesPatch)

    execute {
        // Capture the InputMethodService so the controller can type through it.
        val imeClass = findMethods { cd, m ->
            cd.superclass == "Landroid/inputmethodservice/InputMethodService;" && m.name == "onCreate" &&
                m.params().isEmpty() && m.implementation != null
        }.singleOrNull() ?: throw PatchException("InputMethodService.onCreate not found")
        mutable(imeClass).addInstructions(0, "invoke-static {p0}, $VOICE->attach(Landroid/inputmethodservice/InputMethodService;)V")

        findMethods { cd, m ->
            cd.type == imeClass.first.type && m.name == "onFinishInputView" && m.params() == listOf("Z")
        }.singleOrNull()?.let {
            mutable(it).addInstructions(0, "invoke-static {}, $VOICE->onFinishInputView()V")
        }

        // VoiceInputHandler: the LAUNCH_VOICE_IME branch (mic key). Hook right before Gboard checks
        // for "auto start voice", passing the event data register.
        val handler = single("LAUNCH_VOICE_IME handler") { _, m ->
            m.returnType == "Z" && m.strings().any { it.startsWith("handling LAUNCH_VOICE_IME") } &&
                m.strings().contains("auto start voice")
        }
        val ins = handler.implementation!!.instructions
        val autoIdx = ins.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "auto start voice"
        }
        val equalsCall = ins.drop(autoIdx).firstOrNull {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "equals"
        } as? com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
            ?: throw PatchException("auto start voice check not found")
        val data = equalsCall.registerC
        val scratch = (ins[autoIdx] as OneRegisterInstruction).registerA
        if (data > 15 || scratch > 255) throw PatchException("unexpected registers in voice handler")
        handler.addInstructionsWithLabels(
            autoIdx,
            """
                invoke-static {v$data}, $VOICE->onLaunchVoice(Ljava/lang/Object;)Z
                move-result v$scratch
                if-eqz v$scratch, :stock
                return v$scratch
            """,
            ExternalLabel("stock", handler.getInstruction(autoIdx)),
        )
    }
}

/** Translate panel texts that name Google Translate, by their English text, and what they become. */
private val TRANSLATE_TEXTS = mapOf(
    "Using Google Translate" to "Offline translation (Hy-MT, Firefox Translations), not Google",
    "Type here to translate" to "Type here: offline translation, not Google",
    "Connecting to Google Translate server" to "Loading the offline translator…",
    "Cannot connect to Google Translate server" to "Offline translation failed",
)

/** Says what really translates, in every language Gboard ships (the names are obfuscated). */
private val translateTextsPatch = resourcePatch {
    execute {
        val names = HashMap<String, String>()
        document("res/values/strings.xml").use { doc ->
            val strings = doc.getElementsByTagName("string")
            for (i in 0 until strings.length) {
                val e = strings.item(i) as Element
                TRANSLATE_TEXTS[e.textContent]?.let { names[e.getAttribute("name")] = it }
            }
        }
        if (names.size != TRANSLATE_TEXTS.size) {
            throw PatchException("translate texts: found ${names.size} of ${TRANSLATE_TEXTS.size}")
        }
        get("res", false).listFiles { f: java.io.File -> f.isDirectory && f.name.startsWith("values") }?.forEach { dir ->
            if (!java.io.File(dir, "strings.xml").exists()) return@forEach
            document("res/${dir.name}/strings.xml").use { doc ->
                val strings = doc.getElementsByTagName("string")
                for (i in 0 until strings.length) {
                    val e = strings.item(i) as Element
                    names[e.getAttribute("name")]?.let { e.textContent = it }
                }
            }
        }
    }
}

@Suppress("unused")
val offlineTranslatePatch = bytecodePatch(
    name = "Offline translation",
    description = "Replaces Google Translate in Gboard's translate panel with on-device models: " +
        "Tencent Hy-MT (LLM, llama.cpp) for quality, with Firefox Translations (Bergamot, slimt) " +
        "shown instantly while Hy-MT works; the panel's texts say so instead of naming Google " +
        "Translate. Models are read from the app's models folder.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(extensionPatch, nativeLibrariesPatch, translateTextsPatch)

    execute {
        // The translate-provider interface = the one SystemTranslateProvider implements that has
        // a (Locale, callback) method.
        val system = classDefBy("Lcom/google/android/apps/inputmethod/libs/translate/SystemTranslateProvider;")
        val iface = system.interfaces.firstOrNull { name ->
            classDefByOrNull(name)?.methods?.any { it.params().firstOrNull() == "Ljava/util/Locale;" } == true
        } ?: throw PatchException("Translate provider interface not found")

        // Cloud provider factory: no-arg method returning the interface that builds a provider
        // from a Context (Google Translate client).
        val factory = single("cloud translate factory") { cd, m ->
            m.returnType == iface && m.params().isEmpty() && cd.type != system.type &&
                m.implementation?.instructions?.any { ins ->
                    ins.opcode == Opcode.INVOKE_DIRECT && ((ins as ReferenceInstruction).reference as? MethodReference)
                        ?.let { it.name == "<init>" && it.parameterTypes.firstOrNull()?.toString() == "Landroid/content/Context;" } == true
                } == true
        }
        factory.addInstructionsWithLabels(
            0,
            """
                const-class v0, $iface
                invoke-static {v0}, $TRANSLATE->create(Ljava/lang/Class;)Ljava/lang/Object;
                move-result-object v0
                if-eqz v0, :stock
                check-cast v0, $iface
                return-object v0
            """,
            ExternalLabel("stock", factory.getInstruction(0)),
        )
    }
}

/**
 * Feature flag getter → FlagOverrides.apply(name, value): our online-feature switches (only with
 * runtimeTogglesPatch) and the features ported from Gboard-patches. Class with <init>(String, Class), name field a:String and g()Object.
 */
internal val flagHookPatch = bytecodePatch {
    dependsOn(extensionPatch)

    execute {
        val flagGetter = findMethods { cd, m ->
            m.name == "g" && m.params().isEmpty() && m.returnType == "Ljava/lang/Object;" &&
                cd.methods.any { it.name == "<init>" && it.params() == listOf("Ljava/lang/String;", "Ljava/lang/Class;") } &&
                cd.fields.any { it.name == "a" && it.type == "Ljava/lang/String;" } &&
                cd.methods.any { it.name == "h" && it.params().isEmpty() && it.returnType == "Ljava/lang/String;" }
        }.singleOrNull() ?: throw PatchException("Flag getter not found")
        val flagClass = flagGetter.first.type
        val getter = mutable(flagGetter)
        val instructions = getter.implementation!!.instructions
        // iget-object vValue, vHolder, ...->a:Ljava/lang/Object;  followed by return-object vValue
        val loadIndex = instructions.indices.firstOrNull { i ->
            val ins = instructions[i]
            ins.opcode == Opcode.IGET_OBJECT &&
                ((ins as ReferenceInstruction).reference as FieldReference).type == "Ljava/lang/Object;" &&
                instructions.getOrNull(i + 1)?.opcode == Opcode.RETURN_OBJECT
        } ?: throw PatchException("Flag value load not found")
        val load = instructions[loadIndex] as TwoRegisterInstruction
        val value = load.registerA
        val locals = getter.implementation!!.registerCount - 1 // minus p0
        val temp = (0 until locals).firstOrNull { it != load.registerB && it != value }
            ?: throw PatchException("No free register in flag getter")
        if (temp > 15 || value > 15) throw PatchException("Flag getter registers out of range")
        getter.addInstructions(loadIndex + 1, """
            invoke-static {v$temp, v$value}, $FLAGS->apply(Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;
            move-result-object v$value
        """)
        getter.addInstructions(loadIndex, "iget-object v$temp, p0, $flagClass->a:Ljava/lang/String;")
    }
}

@Suppress("unused")
val runtimeTogglesPatch = bytecodePatch(
    name = "Runtime feature toggles",
    description = "Lets the No-Google settings turn off Gboard features that only work through " +
        "Google servers (Emoji Kitchen, Tenor, Assistant voice, proofread…) and hide the GIF and " +
        "sticker tabs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(extensionPatch, flagHookPatch)

    execute {
        // The flag hook is shared with the Gboard-patches features: the online rules come with this patch.
        mutableClassDefBy(FLAGS).methods.single { it.name == "<clinit>" }.addInstructions(0, """
            const/4 v0, 0x1
            sput-boolean v0, $FLAGS->onlineRules:Z
        """)
        // The toolbar's items are the ids in one string array, which AccessPointOrderHelper reads when it is
        // built; the saved and default toolbar orders keep only ids from it. Without the sticker id there,
        // the toolbar, its saved order and its item count all agree. (Another class logs under its name.)
        val helper = "com/google/android/libraries/inputmethod/accesspoint/impl/AccessPointOrderHelper"
        val init = single("AccessPointOrderHelper constructor") { cd, m ->
            m.name == "<init>" && m.implementation?.instructions?.any { it.isStringArrayRead() } == true &&
                cd.methods.any { helper in it.strings() }
        }
        val read = init.implementation!!.instructions.indexOfFirst { it.isStringArrayRead() }
        if (read < 0) throw PatchException("toolbar item ids not found")
        val ids = (init.getInstruction(read + 1) as OneRegisterInstruction).registerA
        init.addInstructions(read + 2, """
            invoke-static/range {v$ids .. v$ids}, $TABS->accessPoints([Ljava/lang/String;)[Ljava/lang/String;
            move-result-object v$ids
        """)
    }
}

@Suppress("unused")
val keyboardLtrPatch = bytecodePatch(
    name = "Keyboard stays left-to-right",
    description = "Right-to-left languages (Hebrew, Arabic…) change only the letters on the keys: the " +
        "toolbar, suggestions and keys are not mirrored and the keyboard's menus stay in the phone's " +
        "language. Switched in No-Google settings → Keyboard.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(extensionPatch)

    execute {
        // KeyboardContextProvider.createKeyboardContext(LanguageTag): a context in the input language
        // (its strings and direction) when the keyboard's boolean field says so, otherwise the app's
        // context with just the language's direction, from a static (Context, Z)Context helper.
        // KeyboardDirection.follow(Z)Z vetoes both booleans.
        val create = single("keyboard context") { _, m ->
            m.params() == listOf("Ljava/lang/Object;") && m.returnType == "Ljava/lang/Object;" &&
                "createKeyboardContext" in m.strings()
        }
        val ins = create.implementation!!.instructions
        val languageAt = ins.indexOfFirst {
            it.opcode == Opcode.IGET_BOOLEAN &&
                ((it as ReferenceInstruction).reference as FieldReference).definingClass == create.definingClass
        }
        val directionAt = ins.indexOfFirst {
            it.opcode == Opcode.INVOKE_STATIC && ((it as ReferenceInstruction).reference as MethodReference).let { r ->
                r.returnType == "Landroid/content/Context;" &&
                    r.parameterTypes.map { t -> t.toString() } == listOf("Landroid/content/Context;", "Z")
            }
        }
        if (languageAt < 0 || directionAt < languageAt) throw PatchException("keyboard context: switches not found")
        val language = (ins[languageAt] as TwoRegisterInstruction).registerA
        val rtl = (ins[directionAt] as FiveRegisterInstruction).registerD
        // The later one first, so that the earlier index stays valid.
        create.addInstructions(directionAt, """
            invoke-static/range {v$rtl .. v$rtl}, $KEYBOARD_DIRECTION->follow(Z)Z
            move-result v$rtl
        """)
        create.addInstructions(languageAt + 1, """
            invoke-static/range {v$language .. v$language}, $KEYBOARD_DIRECTION->follow(Z)Z
            move-result v$language
        """)

        // Layout directions read elsewhere go through KeyboardDirection.layout(I)I; typing itself
        // (cursor moves, space swipes, handwriting) keeps reading the language's direction.
        // 1. Keyboard's direction getter, an interface call (pan.h in 18.2.4) that the candidate strips
        //    and the symbols / clipboard / extension keyboards read: every call site.
        val keyboard = classDefBy("Lcom/google/android/libraries/inputmethod/keyboard/impl/Keyboard;")
        val viewDirection = keyboard.methods.mapNotNull { m ->
            if (m.params().isNotEmpty() || m.returnType != "I") return@mapNotNull null
            val calls = m.implementation?.instructions?.filter { it.opcode == Opcode.INVOKE_INTERFACE }
            ((calls?.singleOrNull() as? ReferenceInstruction)?.reference as? MethodReference)
                ?.takeIf { it.returnType == "I" && it.parameterTypes.isEmpty() }
        }.singleOrNull() ?: throw PatchException("keyboard direction getter not found")
        // 2. The language's own direction (LanguageTag.a in 18.2.4, the getter its isRtl compares with
        //    1), where LatinIMEBase lays out the keyboard's holder views (toolbar) and
        //    PopupViewContainer its popups.
        val languageTag = classWithString("LanguageTag.java")
        val languageDirection = languageTag.methods.mapNotNull { m ->
            val ins = m.implementation?.instructions?.toList()
            if (m.params().isNotEmpty() || m.returnType != "Z" || ins == null || ins.size > 8) return@mapNotNull null
            val call = ins.singleOrNull { it is ReferenceInstruction && it.reference is MethodReference }
                ?.let { (it as ReferenceInstruction).reference as MethodReference }
            val one = ins.any { it.opcode == Opcode.CONST_4 && (it as NarrowLiteralInstruction).narrowLiteral == 1 }
            call?.takeIf { one && it.definingClass == languageTag.type && it.returnType == "I" && it.parameterTypes.isEmpty() }
        }.singleOrNull() ?: throw PatchException("language direction getter not found")

        fun MethodReference.matches(o: MethodReference) = definingClass == o.definingClass && name == o.name &&
            returnType == o.returnType && parameterTypes.map { it.toString() } == o.parameterTypes.map { it.toString() }
        fun wrapCalls(of: MethodReference, where: (ClassDef) -> Boolean): Int {
            var wrapped = 0
            val targets = findMethods { cd, m ->
                where(cd) && m.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? MethodReference)?.matches(of) == true
                } == true
            }
            for (target in targets) {
                val m = mutable(target)
                val ins = m.implementation!!.instructions
                val sites = ins.indices.filter { i ->
                    ((ins[i] as? ReferenceInstruction)?.reference as? MethodReference)?.matches(of) == true &&
                        ins.getOrNull(i + 1)?.opcode == Opcode.MOVE_RESULT
                }
                for (at in sites.reversed()) {
                    val reg = (ins[at + 1] as OneRegisterInstruction).registerA
                    m.addInstructions(at + 2, """
                        invoke-static/range {v$reg .. v$reg}, $KEYBOARD_DIRECTION->layout(I)I
                        move-result v$reg
                    """)
                    wrapped++
                }
            }
            return wrapped
        }
        if (wrapCalls(viewDirection) { true } == 0) throw PatchException("keyboard direction: no readers")
        val holders = classWithString("LatinIMEBase.java").type
        val popups = classWithString("PopupViewContainer.java").type
        if (wrapCalls(languageDirection) { it.type == holders || it.type == popups } != 2) {
            throw PatchException("language direction: expected the holder views and the popups")
        }

        // 3. Every View.setLayoutDirection(I) call in Gboard's code goes through
        //    KeyboardDirection.setLayoutDirection(View, I), which turns right-to-left into left-to-right.
        val setters = findMethods { _, m ->
            m.implementation?.instructions?.any { it.isLayoutDirectionSetter() } == true
        }
        var redirected = 0
        for (target in setters) {
            val m = mutable(target)
            val ins = m.implementation!!.instructions
            for (at in ins.indices.filter { ins[it].isLayoutDirectionSetter() }.reversed()) {
                val op = if (ins[at] is RegisterRangeInstruction) "invoke-static/range" else "invoke-static"
                m.replaceInstruction(at, "$op ${ins[at].registerList()}, $KEYBOARD_DIRECTION->setLayoutDirection(Landroid/view/View;I)V")
                redirected++
            }
        }
        if (redirected == 0) throw PatchException("no setLayoutDirection calls found")

        // 4. Keyboard views (SoftKeyboardView: the toolbar row and the keys) come out of their
        //    definitions right-to-left for such languages: left-to-right once inflated and attached.
        val keyboardView = mutableClassDefBy("Lcom/google/android/libraries/inputmethod/widgets/SoftKeyboardView;")
        for (name in listOf("onFinishInflate", "onAttachedToWindow")) {
            keyboardView.methods.single { it.name == name && it.params().isEmpty() && it.returnType == "V" }
                .addInstructions(0, "invoke-static/range {p0 .. p0}, $KEYBOARD_DIRECTION->keyboardView(Landroid/view/View;)V")
        }
    }
}

/** invoke-virtual(/range) of a View's setLayoutDirection(I)V (not super calls inside overrides). */
private fun Instruction.isLayoutDirectionSetter(): Boolean =
    (opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
        ((this as ReferenceInstruction).reference as MethodReference).let {
            it.name == "setLayoutDirection" && it.returnType == "V" && it.parameterTypes.map { p -> p.toString() } == listOf("I")
        }

private fun BytecodePatchContext.classWithString(string: String): ClassDef {
    val found = ArrayList<ClassDef>()
    classDefForEach { cd ->
        if (!cd.type.startsWith("$EXT/") && cd.methods.any { string in it.strings() }) found += cd
    }
    return found.singleOrNull() ?: throw PatchException("class with \"$string\": ${found.size} matches")
}

/**
 * The GIF helper app: lets the keyboard see it (Android package visibility) and ships it inside the
 * keyboard, which installs it itself (HelperApk) when the GIF tab or the settings ask.
 */
private val gifHelperAppPatch = resourcePatch {
    execute {
        val apk = object {}.javaClass.getResourceAsStream("/nogoogle-helper/gif-helper.apk")
            ?.readBytes() ?: throw PatchException("gif-helper.apk missing from the patch bundle")
        val asset = get("assets/nogoogle/gif-helper.apk", false)
        asset.parentFile.mkdirs()
        asset.writeBytes(apk)
        document("AndroidManifest.xml").use { doc ->
            val root = doc.documentElement
            val queries = (0 until root.childNodes.length).map { root.childNodes.item(it) }
                .filterIsInstance<Element>().firstOrNull { it.tagName == "queries" }
                ?: doc.createElement("queries").also { root.appendChild(it) }
            val pkg = doc.createElement("package")
            pkg.setAttributeNS(ANDROID_NS, "android:name", GIF_HELPER_PACKAGE)
            queries.appendChild(pkg)
            // Installing needs this; Android still asks the user to allow it and to confirm.
            val install = doc.createElement("uses-permission")
            install.setAttributeNS(ANDROID_NS, "android:name", "android.permission.REQUEST_INSTALL_PACKAGES")
            root.appendChild(install)
        }
    }
}

@Suppress("unused")
val gifProvidersPatch = bytecodePatch(
    name = "GIF providers",
    description = "Brings the GIF tab back without giving Gboard network access: Gboard's Tenor " +
        "(Google) requests and GIF downloads are answered from the GIF sources chosen in No-Google " +
        "settings (KLIPY, GIPHY, nekos.best, Wikimedia Commons, Openverse) through the separate " +
        "network helper app (included: the GIF tab offers to install it), which can only reach " +
        "those sites. Off until a GIF source is chosen.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(extensionPatch, gifHelperAppPatch, flagHookPatch)

    execute {
        // Gboard's network layer: HttpRequest / HttpResponse (AutoValue classes).
        val request = classWithString("com/google/android/libraries/inputmethod/net/common/HttpRequest")
        val response = classWithString("code;success;exception;body;headers;totalTimeInMillis;isFromCache")
        val factory = response.methods.single { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.params().isEmpty() && m.returnType != response.type &&
                classDefByOrNull(m.returnType)?.methods?.any { it.params().isEmpty() && it.returnType == response.type } == true
        }
        val builderType = factory.returnType
        val builder = classDefBy(builderType)
        val build = builder.methods.single { it.params().isEmpty() && it.returnType == response.type }
        val setBody = builder.methods.single { it.returnType == "V" && it.params().size == 1 && "Null body" in it.strings() }
        val bodyType = setBody.params().single()
        val setHeaders = builder.methods.single { it.returnType == "V" && it.params() == listOf("Ljava/util/Map;") }
        // AutoValue marks each primitive property set with one bit, in declaration order:
        // code (1), success (2), totalTimeInMillis (4), isFromCache (8).
        fun bitSetter(type: String, bit: Int) = builder.methods.single { m ->
            m.returnType == "V" && m.params() == listOf(type) &&
                m.implementation?.instructions?.any {
                    it.opcode == Opcode.OR_INT_LIT8 && (it as NarrowLiteralInstruction).narrowLiteral == bit
                } == true
        }
        val setCode = bitSetter("I", 1)
        val setSuccess = bitSetter("Z", 2)
        val setTime = bitSetter("I", 4)
        val setCached = bitSetter("Z", 8)
        // ByteString.copyFrom(byte[]): the ([B) factory that copies through the ([BII) one.
        val bytes = classDefBy(bodyType).methods.single { m ->
            AccessFlags.STATIC.isSet(m.accessFlags) && m.params() == listOf("[B") && m.returnType == bodyType &&
                m.implementation?.instructions?.any { ins ->
                    ((ins as? ReferenceInstruction)?.reference as? MethodReference)?.let {
                        it.definingClass == bodyType && it.parameterTypes.map { t -> t.toString() } == listOf("[B", "I", "I")
                    } == true
                } == true
        }

        // private static Object GifBridge.gboardResponse(int code, boolean success, byte[] body)
        val respond = ImmutableMethod(
            GIF_BRIDGE, "gboardResponse",
            listOf(
                ImmutableMethodParameter("I", null, null),
                ImmutableMethodParameter("Z", null, null),
                ImmutableMethodParameter("[B", null, null),
            ),
            "Ljava/lang/Object;", AccessFlags.PRIVATE.value or AccessFlags.STATIC.value, null, null,
            MutableMethodImplementation(5),
        ).toMutable()
        respond.addInstructions(0, """
            invoke-static {}, ${response.type}->${factory.name}()$builderType
            move-result-object v0
            invoke-virtual {v0, p0}, $builderType->${setCode.name}(I)V
            invoke-virtual {v0, p1}, $builderType->${setSuccess.name}(Z)V
            const/4 v1, 0x0
            invoke-virtual {v0, v1}, $builderType->${setTime.name}(I)V
            invoke-virtual {v0, v1}, $builderType->${setCached.name}(Z)V
            invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;
            move-result-object v1
            invoke-virtual {v0, v1}, $builderType->${setHeaders.name}(Ljava/util/Map;)V
            invoke-static {p2}, $bodyType->${bytes.name}([B)$bodyType
            move-result-object v1
            invoke-virtual {v0, v1}, $builderType->${setBody.name}($bodyType)V
            invoke-virtual {v0}, $builderType->${build.name}()${response.type}
            move-result-object v0
            return-object v0
        """)
        mutableClassDefBy(GIF_BRIDGE).methods.add(respond)

        // The executor interface: execute(HttpRequest) returning a Future subtype (ListenableFuture).
        val candidates = ArrayList<Pair<ClassDef, Method>>()
        classDefForEach { cd ->
            if (AccessFlags.INTERFACE.isSet(cd.accessFlags) && !cd.type.startsWith("$EXT/")) {
                cd.methods.filter { it.params() == listOf(request.type) }.forEach { candidates += cd to it }
            }
        }
        val (executor, execute) = candidates.singleOrNull { (_, m) ->
            classDefByOrNull(m.returnType)?.let { f ->
                AccessFlags.INTERFACE.isSet(f.accessFlags) && "Ljava/util/concurrent/Future;" in f.interfaces
            } == true
        } ?: throw PatchException("HTTP executor interface not found")
        val future = execute.returnType
        val impls = ArrayList<ClassDef>()
        classDefForEach { cd ->
            if (executor.type in cd.interfaces && !cd.type.startsWith("$EXT/")) impls += cd
        }
        if (impls.isEmpty()) throw PatchException("no HTTP executors found")
        // Every executor (Cronet, OkHttp and the wrappers around them) asks GifBridge first.
        for (cd in impls) {
            val m = mutableClassDefBy(cd).methods.single {
                it.name == execute.name && it.params() == listOf(request.type) && it.returnType == future
            }
            val impl = m.implementation ?: throw PatchException("${cd.type}: abstract executor")
            if (impl.registerCount - 2 < 1) throw PatchException("${cd.type}: no free register")
            m.addInstructionsWithLabels(
                0,
                """
                    invoke-static/range {p0 .. p1}, $GIF_BRIDGE->execute(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
                    move-result-object v0
                    if-eqz v0, :stock
                    check-cast v0, $future
                    return-object v0
                """,
                ExternalLabel("stock", m.getInstruction(0)),
            )
        }

        // GIF tab: the enabled sources replace the suggestion chips (GifBridge answers the chips'
        // Tenor autocomplete request), so Gboard's built-in default words go; the search hint names
        // the active source instead of Tenor.
        val gifExtension = ArrayList<ClassDef>()
        classDefForEach { cd ->
            if (GIF_EXTENSION_INTERFACE in cd.interfaces) gifExtension += cd
        }
        val extension = gifExtension.singleOrNull() ?: throw PatchException("GIF extension: ${gifExtension.size} matches")
        val defaults = mutableClassDefBy(extension).methods.single { m ->
            m.params().isEmpty() && m.returnType.startsWith("L") && m.implementation?.instructions?.any {
                ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "getStringArray"
            } == true
        }
        val defaultIns = defaults.implementation!!.instructions
        val arrayAt = defaultIns.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "getStringArray"
        }
        val listFactory = defaultIns.drop(arrayAt + 1).first { it.opcode == Opcode.INVOKE_STATIC }
            .let { (it as ReferenceInstruction).reference as MethodReference }
        if (listFactory.parameterTypes.map { it.toString() } != listOf("[Ljava/lang/Object;")) {
            throw PatchException("GIF default chips: unexpected list factory $listFactory")
        }
        defaults.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $GIF_BRIDGE->enabled()Z
                move-result v0
                if-eqz v0, :stock
                const/4 v0, 0x0
                new-array v0, v0, [Ljava/lang/String;
                invoke-static {v0}, ${listFactory.definingClass}->${listFactory.name}([Ljava/lang/Object;)${listFactory.returnType}
                move-result-object v0
                return-object v0
            """,
            ExternalLabel("stock", defaults.getInstruction(0)),
        )

        // The "Search Tenor" string id, from GifSearchKeyboard's hint getter.
        fun Method.stringIds() = implementation?.instructions?.withIndex()?.filter { (i, ins) ->
            ins.opcode == Opcode.CONST && implementation!!.instructions.drop(i + 1).firstOrNull {
                it.opcode == Opcode.INVOKE_VIRTUAL
            }.let { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.name == "getString" }
        }?.map { (_, ins) -> (ins as NarrowLiteralInstruction).narrowLiteral } ?: emptyList()
        val keyboard = classDefBy(GIF_SEARCH_KEYBOARD)
        val hintId = keyboard.methods.single { m ->
            m.params().isEmpty() && m.returnType == "Ljava/lang/String;" && m.stringIds().size == 1
        }.stringIds().single()
        var hints = 0
        for (cd in listOf(keyboard, extension)) {
            val mc = mutableClassDefBy(cd)
            for (m in mc.methods.filter {
                it.params().isEmpty() && (it.returnType == "Ljava/lang/String;" || it.returnType == "Ljava/lang/CharSequence;") &&
                    it.stringIds() == listOf(hintId)
            }) {
                if (m.implementation!!.registerCount - m.parameters.size - 1 < 1) throw PatchException("${cd.type}: no free register")
                m.addInstructionsWithLabels(
                    0,
                    """
                        invoke-static {}, $GIF_BRIDGE->searchHint()Ljava/lang/String;
                        move-result-object v0
                        if-eqz v0, :stock
                        return-object v0
                    """,
                    ExternalLabel("stock", m.getInstruction(0)),
                )
                hints++
            }
        }
        if (hints == 0) throw PatchException("GIF search hint not found")

        // The GIF keyboards' error card (GifKeyboardM2 / GifKeyboardTablet GifCallback.onErrorInternal):
        // once Gboard has drawn it into the error view, GifBridge.onErrorCard may change its message
        // and button (no network helper app, no GIF source).
        val errorHandlers = findMethods { _, m ->
            "onErrorInternal" in m.strings() && m.params().getOrNull(1) == "Landroid/view/ViewGroup;"
        }
        if (errorHandlers.isEmpty()) throw PatchException("GIF error card not found")
        for (target in errorHandlers) {
            val m = mutable(target)
            // ErrorCard.draw(Context, ViewGroup, ...)V: the only such call in the handler.
            val draws = m.implementation!!.instructions.withIndex().filter { (_, ins) ->
                (ins.opcode == Opcode.INVOKE_VIRTUAL || ins.opcode == Opcode.INVOKE_VIRTUAL_RANGE) &&
                    ((ins as ReferenceInstruction).reference as MethodReference).let { r ->
                        r.returnType == "V" && r.parameterTypes.map { it.toString() }.let {
                            it.size == 3 && it[0] == "Landroid/content/Context;" && it[1] == "Landroid/view/ViewGroup;"
                        }
                    }
            }
            val (at, draw) = draws.singleOrNull()
                ?: throw PatchException("${target.first.type}: error card draws: ${draws.size}")
            val card = when (draw) {
                is FiveRegisterInstruction -> draw.registerE // {card, context, view, ...}
                is RegisterRangeInstruction -> draw.startRegister + 2
                else -> throw PatchException("${target.first.type}: unexpected draw call")
            }
            m.addInstructions(at + 1, "invoke-static/range {v$card .. v$card}, $GIF_BRIDGE->onErrorCard(Landroid/view/ViewGroup;)V")
        }

        // Gboard's built-in GIF words, shown when the trending request fails (the category builder, the
        // only class naming "enable_tenor_trending_categories"): the enabled sources instead.
        val categoryBuilder = classWithString("enable_tenor_trending_categories")
        var words = 0
        for (target in findMethods { cd, m -> cd.type == categoryBuilder.type && m.implementation?.instructions?.any { it.isStringArrayRead() } == true }) {
            val m = mutable(target)
            val ins = m.implementation!!.instructions
            for (at in ins.indices.filter { ins[it].isStringArrayRead() && ins.getOrNull(it + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT }.reversed()) {
                val reg = (ins[at + 1] as OneRegisterInstruction).registerA
                m.addInstructions(at + 2, """
                    invoke-static/range {v$reg .. v$reg}, $GIF_BRIDGE->fallbackTerms([Ljava/lang/String;)[Ljava/lang/String;
                    move-result-object v$reg
                """)
                words++
            }
        }
        if (words == 0) throw PatchException("GIF fallback words not found")

        // Gboard's Tenor answer cache (the class that keeps them in "tenor_cache/"): its "expired?" check,
        // a(Duration)Z on the cache entry, reports expired while GIF sources are set.
        val tenorCache = classWithString("tenor_cache/")
        var checks = 0
        for (target in findMethods { cd, m -> cd.type == tenorCache.type && m.implementation?.instructions?.any { it.isExpiryCheck() } == true }) {
            val m = mutable(target)
            val ins = m.implementation!!.instructions
            for (at in ins.indices.filter { ins[it].isExpiryCheck() && ins.getOrNull(it + 1)?.opcode == Opcode.MOVE_RESULT }.reversed()) {
                val reg = (ins[at + 1] as OneRegisterInstruction).registerA
                m.addInstructions(at + 2, """
                    invoke-static/range {v$reg .. v$reg}, $GIF_BRIDGE->tenorCacheExpired(Z)Z
                    move-result v$reg
                """)
                checks++
            }
        }
        if (checks == 0) throw PatchException("Tenor cache expiry check not found")
    }
}

private fun Instruction.isExpiryCheck(): Boolean =
    opcode == Opcode.INVOKE_VIRTUAL && ((this as ReferenceInstruction).reference as MethodReference).let {
        it.returnType == "Z" && it.parameterTypes.map { p -> p.toString() } == listOf("Lj\$/time/Duration;")
    }

private fun Instruction.isStringArrayRead(): Boolean =
    opcode == Opcode.INVOKE_VIRTUAL && ((this as ReferenceInstruction).reference as MethodReference).let {
        it.definingClass == "Landroid/content/res/Resources;" && it.name == "getStringArray"
    }

/**
 * AccessPointsBar keeps the toolbar capacity it read when it was built; every read asks
 * PortedFeatures.toolbarCapacity instead, so a new count applies at once. Its "bar is full" tests
 * become count >= capacity, so a capacity lowered below the items shown never lets the bar grow.
 */
internal val toolbarCapacityPatch = bytecodePatch {
    dependsOn(extensionPatch)

    execute {
        val bar = "Lcom/google/android/libraries/inputmethod/accesspoint/widget/AccessPointsBar;"
        // The capacity field: adding an item compares the item count with it (iget, iget, if-ne).
        val capacity = classDefBy(bar).methods.flatMap { m ->
            val ins = m.implementation?.instructions?.toList() ?: emptyList()
            if (m.params().size != 1 || m.returnType != "V") return@flatMap emptyList()
            (0 until maxOf(0, ins.size - 2)).mapNotNull { i ->
                val (a, b, c) = Triple(ins[i], ins[i + 1], ins[i + 2])
                if (a.opcode != Opcode.IGET || b.opcode != Opcode.IGET || c.opcode != Opcode.IF_NE) return@mapNotNull null
                val count = (a as ReferenceInstruction).reference as FieldReference
                val cap = (b as ReferenceInstruction).reference as FieldReference
                cap.takeIf { count.definingClass == bar && it.definingClass == bar && count.type == "I" && it.type == "I" }
            }
        }.distinctBy { it.name }.singleOrNull() ?: throw PatchException("toolbar capacity field not found")
        var wrapped = 0
        for (m in mutableClassDefBy(bar).methods) {
            if (m.name == "<init>") continue
            val ins = m.implementation?.instructions ?: continue
            val reads = ins.indices.filter { i ->
                ins[i].opcode == Opcode.IGET && ((ins[i] as ReferenceInstruction).reference as FieldReference).let {
                    it.definingClass == bar && it.name == capacity.name && it.type == "I"
                }
            }
            for (at in reads.reversed()) {
                val reg = (ins[at] as TwoRegisterInstruction).registerA
                // iget capacity; if-ne count, capacity, :not_full  ->  if-lt count, capacity, :not_full
                (ins.getOrNull(at + 1) as? BuilderInstruction22t)?.takeIf { it.opcode == Opcode.IF_NE && it.registerB == reg }?.let {
                    m.implementation!!.replaceInstruction(at + 1, BuilderInstruction22t(Opcode.IF_LT, it.registerA, it.registerB, it.target))
                }
                m.addInstructions(at + 1, """
                    invoke-static/range {v$reg .. v$reg}, $PORTED->toolbarCapacity(I)I
                    move-result v$reg
                """)
                wrapped++
            }
        }
        if (wrapped == 0) throw PatchException("toolbar capacity: no reads")
    }
}
