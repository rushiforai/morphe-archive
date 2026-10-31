package xyz.urro.gboard

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.*
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val ANDROID = "http://schemas.android.com/apk/res/android"
internal val gboardCompatibility = Compatibility(
    name = "Gboard", packageName = "com.google.android.inputmethod.latin",
    // Do not require republishing for every version number; native contracts are
    // checked against the actual input before any APK can be produced.
    description = "Structurally checked native API. Tested on ARM64 18.0.3 and 18.5.4.",
    targets = listOf(AppTarget(version = null)),
)

internal fun Element.android(name: String, value: String) = setAttributeNS(ANDROID, "android:$name", value)

/** Add a section without replacing the native settings screen or other patch entries. */
internal fun addSection(document: Document, title: String, key: String): Element {
    val entries = document.getElementsByTagName("*")
    for (i in entries.length - 1 downTo 0) {
        val element = entries.item(i) as Element
        if (element.getAttributeNS(ANDROID, "key") == key) element.parentNode.removeChild(element)
    }
    return document.createElement("androidx.preference.PreferenceCategory").also {
        it.android("key", key); it.android("title", title); document.documentElement.appendChild(it)
    }
}

internal fun Element.preference(title: String, key: String, summary: String = "", toggle: Boolean? = null) {
    val entry = ownerDocument.createElement(if (toggle == null) "androidx.preference.Preference" else "androidx.preference.SwitchPreferenceCompat")
    entry.android("key", key); entry.android("title", title); entry.android("persistent", "false")
    if (summary.isNotEmpty()) entry.android("summary", summary)
    if (toggle != null) entry.android("defaultValue", toggle.toString())
    appendChild(entry)
}

internal fun removeOldSettings(document: Document) {
    val entries = document.getElementsByTagName("*")
    for (i in entries.length - 1 downTo 0) {
        val element = entries.item(i) as Element
        if (element.getAttributeNS(ANDROID, "key") in setOf("urro_clipcascade", "urro_translation_shortcuts")) element.parentNode.removeChild(element)
    }
}

internal val gboardSettingsHook = bytecodePatch {
    compatibleWith(gboardCompatibility)
    extendWith("extensions/gboard.mpe")
    execute {
        val api = GboardNative(this)
        val preference = api.type("Landroidx/preference/Preference;")
        fun resolved(role: String, predicate: (com.android.tools.smali.dexlib2.iface.Method) -> Boolean) =
            mutableClassDefBy(preference.type).methods.single { it.toString() == preference.method(role, predicate).toString() }
        val method = resolved("preference click") { it.signature("V") && it.calls().any { c -> c.name == "startActivity" && c.definingClass == "Landroid/content/Context;" } }
        check(method.implementation!!.registerCount >= 2) { "No local register in Gboard preference handler" }
        method.addInstructions(0, """
            invoke-static/range {p0 .. p0}, Lxyz/urro/gboard/SettingsRoutes;->open(Ljava/lang/Object;)Z
            move-result v0
            if-eqz v0, :urro_existing_preference
            return-void
            :urro_existing_preference
            nop
        """)
        val read = resolved("boolean preference read") { it.signature("Z", "Z") && it.calls().any { c -> c.name == "getBoolean" && c.definingClass == "Landroid/content/SharedPreferences;" } }
        val key = read.fields().filter { it.definingClass == preference.type && it.type == "Ljava/lang/String;" }.distinctBy { it.name }.unique("preference storage key")
        val context = preference.fields.filter { it.type == "Landroid/content/Context;" }.unique("preference context")
        val summary = preference.fields.filter { it.type == "Ljava/lang/CharSequence;" && it.accessFlags and 2 != 0 }.unique("preference summary")
        val summarySetter = preference.method("preference summary setter") { it.signature("V", "Ljava/lang/CharSequence;") && it.fields().any { f -> f.name == summary.name && f.definingClass == preference.type } }
        nativeString("preferenceKey", key.name)
        nativeString("preferenceContext", context.name)
        nativeString("preferenceSummary", summary.name)
        nativeString("preferenceSummarySetter", summarySetter.name)
        read.addInstructions(0, "invoke-static/range {p0 .. p1}, Lxyz/urro/gboard/SettingsRoutes;->read(Ljava/lang/Object;Z)Z\nmove-result p1")
        val write = resolved("boolean preference write") { it.signature("Z", "Z") && it.calls().any { c -> c.name == "putBoolean" && c.definingClass == "Landroid/content/SharedPreferences\$Editor;" } }
        write.addInstructions(0, "invoke-static/range {p0 .. p1}, Lxyz/urro/gboard/SettingsRoutes;->write(Ljava/lang/Object;Z)V")
        val bind = resolved("preference view binding") { it.returnType == "V" && it.parameterTypes.size == 1 && it.calls().any { c -> c.name == "setText" && c.definingClass == "Landroid/widget/TextView;" } }
        bind.addInstructions(0, "invoke-static/range {p0 .. p0}, Lxyz/urro/gboard/SettingsRoutes;->bind(Ljava/lang/Object;)V")
    }
}

internal val translationResources = resourcePatch {
    compatibleWith(gboardCompatibility)
    finalize {
        for (file in listOf("res/xml/settings.xml", "res/xml/settings_legacy.xml")) document(file).use(::removeOldSettings)
        document("res/xml/setting_translate.xml").use { xml ->
            val section = addSection(xml, "Translation shortcuts", "urro_translation_section")
            section.preference("Simplify input field", "urro_simplify_translation_input", "Use a compact language-pair field. Reopen Translate after changing this.", false)
            section.preference("Language codes", "urro_translation_help", "Type es or en-es, then a space to confirm. ISO and regional codes work too.")
            (section.lastChild as Element).android("selectable", "false")
        }
    }
}

private const val KEYBOARD = "Lcom/google/android/apps/inputmethod/libs/translate/TranslateKeyboard;"
private const val HOOK = "Lxyz/urro/gboard/TranslationHooks;"

@Suppress("unused")
val translationShortcutsPatch = bytecodePatch(
    name = "Better translate UX",
    description = "Changes translation languages with ISO/BCP language codes followed by whitespace. Adds an optional compact language-pair editor in Gboard settings.",
    default = false,
) {
    compatibleWith(gboardCompatibility)
    dependsOn(translationResources, gboardSettingsHook)
    extendWith("extensions/gboard.mpe")
    execute {
        val api = GboardNative(this)
        val keyboard = api.type(KEYBOARD)
        val uiType = keyboard.fields.single { it.name == "b" &&
            api.type(it.type).fields.any { f -> f.type == "Lcom/google/android/apps/inputmethod/libs/translate/TranslateLanguageBar;" } }.type
        val ui = api.type(uiType)
        api.requireFields(keyboard, "a" to "Lcom/google/android/libraries/inputmethod/widgets/EditTextOnKeyboard;",
            "b" to uiType, "c" to "Ljava/util/function/Consumer;", "d" to "Landroid/view/View\$OnTouchListener;")
        api.requireFields(ui, "d" to "Landroid/view/View;", "e" to "Landroid/view/View;",
            "f" to "Lcom/google/android/apps/inputmethod/libs/translate/TranslateLanguageBar;",
            "k" to "Landroid/widget/EditText;", "l" to "Landroid/view/View;")
        val languages = api.logged("com/google/android/apps/inputmethod/libs/translate/TranslateLanguage")
        val controller = api.logged("com/google/android/apps/inputmethod/libs/translate/TranslateUiExtension")
        check(controller.fields.any { it.name == "q" && it.type == languages.type }) { "Unsupported translation language state" }
        api.requireFields(api.type(controller.superclass!!), "a" to "Ljava/lang/String;")
        for (field in languages.fields.filter { it.name in setOf("b", "c") }) {
            val base = api.type(api.type(field.type).superclass!!)
            check(base.methods.any { it.name == "d" && it.signature("Ljava/lang/String;") } &&
                base.methods.any { it.name == "f" && it.signature("Ljava/util/Map;") } &&
                base.methods.any { it.name == "h" && it.signature("Z", "Ljava/lang/String;") }) {
                "Unsupported native translation language selectors"
            }
        }
        for (name in listOf("ag", "ai")) check(controller.methods.any { it.name == name }) { "Unsupported translation controller: $name" }
        val embedded = api.type("Lcom/google/android/libraries/inputmethod/widgets/EditTextOnKeyboard;")
        api.requireFields(embedded, "h" to "Ljava/util/function/Consumer;")
        val focusMethod = embedded.method("editor focus styling") {
            it.signature("V", "Z") && it.calls().any { c -> c.name == "refreshDrawableState" }
        }
        nativeString("editorFocus", focusMethod.name)
        val editorMethod = keyboard.method("translation input connection") {
            it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/inputmethod/EditorInfo;") && it.returnType.startsWith("L")
        }
        val editor = Fingerprint(definingClass = KEYBOARD, name = editorMethod.name, returnType = editorMethod.returnType,
            parameters = listOf("Landroid/view/inputmethod/EditorInfo;"))
        // Stock methods reuse parameter registers. A wrapper preserves the receiver and
        // runs our callback only after Gboard has finished binding or updating its UI.
        fun afterNative(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod, callback: String) {
            val owner = mutableClassDefBy(method.definingClass)
            val nativeName = "urroNative_" + method.name
            check(owner.methods.none { it.name == nativeName }) { "Translation hook already installed" }
            val native = ImmutableMethod(
                method.definingClass, nativeName, method.parameters, method.returnType,
                method.accessFlags, method.annotations, method.hiddenApiRestrictions, method.implementation,
            ).toMutable()
            val wrapper = ImmutableMethod(
                method.definingClass, method.name, method.parameters, method.returnType,
                method.accessFlags, method.annotations, method.hiddenApiRestrictions,
                ImmutableMethodImplementation(1, emptyList(), emptyList(), emptyList()),
            ).toMutable()
            wrapper.addInstructions(0, """
                invoke-virtual {p0}, ${method.definingClass}->$nativeName()V
                invoke-static {p0}, $HOOK->$callback(Ljava/lang/Object;)V
                return-void
            """)
            check(owner.methods.remove(method))
            owner.methods.add(native)
            owner.methods.add(wrapper)
        }
        val attach = keyboard.method("translation query watcher") { "attachQueryWatcher" in it.strings() }
        afterNative(mutableClassDefBy(KEYBOARD).methods.single { it.toString() == attach.toString() }, "attach")
        val render = keyboard.method("translation UI refresh") {
            it.signature("V") && it.calls().size == 1 && it.calls().single().definingClass == ui.type &&
                it.fields().any { f -> f.type == ui.type } && (it.implementation?.instructions?.count() ?: 0) <= 4
        }
        afterNative(mutableClassDefBy(KEYBOARD).methods.single { it.toString() == render.toString() }, "render")
        val uiRender = ui.method("translation focus UI") { it.signature("V") && it.calls().any { c -> c.name == "setActivated" } }
        afterNative(mutableClassDefBy(ui.type).methods.single { it.toString() == uiRender.toString() }, "renderUi")
        // Embedded Gboard editors pretend to be focused whenever enabled. Restrict
        // that behavior to the selected editor only when our compact UI is attached.
        val embeddedEditor = "Lcom/google/android/libraries/inputmethod/widgets/EditTextOnKeyboard;"
        for (name in listOf("isFocused", "hasFocus", "hasWindowFocus")) {
            val original = Fingerprint(definingClass = embeddedEditor, name = name, returnType = "Z", parameters = emptyList()).method
            val nativeName = "urroNative_" + name
            val owner = mutableClassDefBy(embeddedEditor)
            val native = ImmutableMethod(original.definingClass, nativeName, original.parameters,
                original.returnType, original.accessFlags, original.annotations,
                original.hiddenApiRestrictions, original.implementation).toMutable()
            val wrapper = ImmutableMethod(original.definingClass, original.name, original.parameters,
                original.returnType, original.accessFlags, original.annotations,
                original.hiddenApiRestrictions, ImmutableMethodImplementation(2, emptyList(), emptyList(), emptyList())).toMutable()
            wrapper.addInstructions(0, """
                invoke-static {p0}, $HOOK->focusState(Ljava/lang/Object;)I
                move-result v0
                if-ltz v0, :native_focus
                return v0
                :native_focus
                invoke-virtual {p0}, $embeddedEditor->$nativeName()Z
                move-result v0
                return v0
            """)
            check(owner.methods.remove(original))
            owner.methods.add(native)
            owner.methods.add(wrapper)
        }
        val method = editor.method
        for ((index, instruction) in method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.asReversed()) {
            val register = (instruction as OneRegisterInstruction).registerA
            method.addInstructions(index, """
                invoke-static/range {v$register .. v$register}, $HOOK->editor(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v$register
                check-cast v$register, ${editorMethod.returnType}
            """)
        }
    }
}
