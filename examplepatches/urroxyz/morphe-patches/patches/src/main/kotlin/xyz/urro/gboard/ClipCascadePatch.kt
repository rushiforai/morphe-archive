package xyz.urro.gboard

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.*
import app.morphe.patcher.patch.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import org.w3c.dom.Element
import java.net.URI

private object Assets
private fun jsonString(value: String): String = buildString {
    append('"')
    for (character in value) when (character) {
        '"' -> append("\\\"")
        '\\' -> append("\\\\")
        else -> if (character.code < 0x20 || character in '\uD800'..'\uDFFF') append("\\u%04x".format(character.code)) else append(character)
    }
    append('"')
}
private const val HOOK = "Lxyz/urro/gboard/ClipboardHooks;"

private val clipBytecode = bytecodePatch {
    compatibleWith(gboardCompatibility)
    dependsOn(gboardSettingsHook)
    extendWith("extensions/gboard.mpe")
    // Community clipboard patches verify the stock method shape during execute.
    // Add our adapter delegates after those transformations have completed.
    finalize {
        val api = GboardNative(this)
        val adapter = api.logged("com/google/android/apps/inputmethod/libs/clipboard/ClipboardAdapter")
        val adapterType = adapter.type
        val countMethod = adapter.method("clipboard item count") { it.signature("I") && it.calls().any { c -> c.name == "size" && c.definingClass == "Ljava/util/List;" } }
        val typeMethod = adapter.method("clipboard item type") { it.signature("I", "I") && it.calls().any { c -> c.name == "get" && c.definingClass == "Ljava/util/List;" } }
        val itemRef = typeMethod.calls().filter { it.returnType == "I" && it.parameterTypes.isEmpty() && it.definingClass != "Ljava/util/List;" }.unique("clipboard item type getter")
        val item = api.type(itemRef.definingClass)
        val builder = item.method("clipboard item constructor") { it.name == "<init>" && it.parameterTypes.size == 1 && it.parameterTypes.single().toString().startsWith("L") }.parameterTypes.single().toString()
        val keyboardType = "Lcom/google/android/apps/inputmethod/libs/clipboard/ClipboardKeyboard;"
        val keyboardField = adapter.fields.filter { it.type == keyboardType }.unique("clipboard keyboard field")
        val keyboard = api.type(keyboardType)
        val paste = keyboard.method("clipboard paste") { it.signature("V", item.type, "Z") }
        val parent = api.type(adapter.superclass!!)
        api.requireFields(adapter, "e" to "Landroid/content/Context;", "n" to "Ljava/util/List;",
            "j" to "Landroid/support/v7/widget/RecyclerView;", "o" to "I")
        api.requireFields(keyboard, "f" to "Landroid/widget/TextView;")
        api.requireFields(api.type(builder), "a" to "J", "b" to "Lj$/time/Instant;")
        for ((name, returns, params) in listOf(
            Triple("g", "I", emptyList()), Triple("i", "Ljava/lang/String;", emptyList()),
            Triple("j", "Ljava/lang/String;", emptyList()), Triple("k", "V", listOf("Z")),
        )) check(item.methods.any { it.name == name && it.returnType == returns && it.parameterTypes.map(CharSequence::toString) == params }) {
            "Unsupported clipboard item API: $name"
        }
        val refresh = parent.method("clipboard refresh") { it.name != "<init>" && it.signature("V") && it.calls().size == 1 }
        nativeString("itemClass", item.type.removePrefix("L").removeSuffix(";").replace('/', '.'))
        nativeString("builderClass", builder.removePrefix("L").removeSuffix(";").replace('/', '.'))
        nativeString("adapterKeyboard", keyboardField.name)
        nativeString("paste", paste.name)
        nativeString("refresh", refresh.name)
        val stickyUpdate = adapter.method("clipboard sticky header update") {
            it.signature("V") && it.calls().any { c -> c.definingClass == "Landroid/support/v7/widget/StaggeredGridLayoutManager;" && c.returnType == "[I" }
        }
        val positions = stickyUpdate.calls().filter { it.definingClass == "Landroid/support/v7/widget/StaggeredGridLayoutManager;" && it.returnType == "[I" }.unique("native visible positions call")
        check(positions.parameterTypes.isEmpty() || positions.parameterTypes.map(CharSequence::toString) == listOf("[I")) { "Unsupported visible-position API" }
        nativeString("visiblePositions", positions.name + if (positions.parameterTypes.isEmpty()) "" else "[]")
        val createMethod = adapter.method("clipboard holder creation") { "onCreateViewHolder" in it.strings() }
        val holderType = createMethod.returnType
        val parentBind = parent.method("adapter binding contract") { it.signature("V", holderType, "I") }
        val bindMethod = adapter.method("clipboard holder binding") { it.name == parentBind.name && it.signature("V", holderType, "I") }
        val headerMethod = adapter.method("clipboard header creation") {
            it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/ViewGroup;") && it.returnType.startsWith("L") &&
                api.type(it.returnType).methods.any { m -> m.signature("V", "I") }
        }
        val headerClass = api.type(headerMethod.returnType)
        api.requireFields(headerClass, "s" to "Landroid/widget/TextView;", "t" to "Landroid/view/View;")
        check(headerClass.methods.any { it.name == "F" && it.signature("V", "I") }) { "Unsupported clipboard header visibility API" }
        val cardMethod = adapter.method("clipboard card creation") {
            it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/ViewGroup;") &&
                it.returnType != headerMethod.returnType && it.returnType.startsWith("L") && api.type(it.returnType).superclass == holderType
        }
        api.requireFields(api.type(cardMethod.returnType), "a" to "Landroid/view/View;", "t" to "Landroid/widget/TextView;",
            "u" to "Landroid/view/View;", "A" to "Landroid/view/View;", "z" to "Landroid/view/View;", "x" to "Landroid/view/View;",
            "E" to "Landroid/widget/FrameLayout;", "B" to "Landroid/widget/FrameLayout;",
            "D" to "Landroid/widget/ImageView;", "v" to "Landroid/widget/ImageView;", "w" to "Landroid/widget/ImageView;")
        api.requireFields(adapter, "B" to headerClass.type, "C" to headerClass.type, "D" to headerClass.type)
        nativeString("header", headerMethod.name)
        fun method(owner: String, name: String, returns: String, params: List<String>) = Fingerprint(definingClass = owner, name = name, returnType = returns, parameters = params).match(classDefBy(owner)).method
        val count = method(adapterType, countMethod.name, "I", emptyList())
        // Keep the stock method's registers: expanding them moved `this` and broke the verifier.
        count.addInstructions(0, """
            invoke-static {p0}, $HOOK->countOf(Ljava/lang/Object;)I
            move-result v0
            return v0
        """)
        fun wrap(target: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod, name: String, registers: Int, body: String) {
            val owner = mutableClassDefBy(target.definingClass)
            check(owner.methods.none { it.name == name }) { "Clipboard hook already installed: $name" }
            val native = ImmutableMethod(target.definingClass, name, target.parameters, target.returnType,
                target.accessFlags, target.annotations, target.hiddenApiRestrictions, target.implementation).toMutable()
            val wrapper = ImmutableMethod(target.definingClass, target.name, target.parameters, target.returnType,
                target.accessFlags, target.annotations, target.hiddenApiRestrictions,
                ImmutableMethodImplementation(registers, emptyList(), emptyList(), emptyList())).toMutable()
            wrapper.addInstructions(0, body)
            check(owner.methods.remove(target)); owner.methods.add(native); owner.methods.add(wrapper)
        }
        val originalType = method(adapterType, typeMethod.name, "I", listOf("I"))
        val nativeType = "urroNative_clipboardType"
        wrap(originalType, nativeType, 3, """
            invoke-static {p0, p1}, $HOOK->type(Ljava/lang/Object;I)I
            move-result v0
            if-ltz v0, :native_type
            return v0
            :native_type
            invoke-static {p0, p1}, $HOOK->nativePosition(Ljava/lang/Object;I)I
            move-result v0
            invoke-virtual {p0, v0}, $adapterType->$nativeType(I)I
            move-result v0
            return v0
        """)
        val create = method(adapterType, createMethod.name, holderType, listOf("Landroid/view/ViewGroup;", "I"))
        check(create.implementation!!.registerCount >= 4)
        create.addInstructions(0, """
            invoke-static/range {p0 .. p2}, $HOOK->header(Ljava/lang/Object;Landroid/view/ViewGroup;I)Ljava/lang/Object;
            move-result-object v0
            if-eqz v0, :urro_native_header
            check-cast v0, $holderType
            return-object v0
            :urro_native_header
            nop
        """)
        val bind = method(adapterType, bindMethod.name, "V", listOf(holderType, "I"))
        val holderOwners = setOf(holderType, cardMethod.returnType, headerMethod.returnType)
        val positionGetter = adapter.methods.flatMap { it.calls() }.filter {
            it.returnType == "I" && it.parameterTypes.isEmpty() && it.definingClass in holderOwners
        }.distinctBy { it.name }.unique("clipboard holder position")
        fun holderPosition(ref: MethodReference) = ref.name == positionGetter.name && ref.returnType == "I" &&
            ref.parameterTypes.isEmpty() && ref.definingClass in holderOwners
        nativeString("holderPosition", positionGetter.name)
        val nativeBind = "urroNative_clipboardBind"
        wrap(bind, nativeBind, 4, """
            invoke-static {p0, p1, p2}, $HOOK->bind(Ljava/lang/Object;Ljava/lang/Object;I)Z
            move-result v0
            if-eqz v0, :native_bind
            return-void
            :native_bind
            invoke-static {p0, p2}, $HOOK->nativePosition(Ljava/lang/Object;I)I
            move-result v0
            invoke-virtual {p0, p1, v0}, $adapterType->$nativeBind(${holderType}I)V
            invoke-static {p0, p1, v0}, $HOOK->localBound(Ljava/lang/Object;Ljava/lang/Object;I)V
            return-void
        """)
        // Native selection callbacks expect indices into the unchanged native list.
        // Scope remapping to clipboard callers; RecyclerView must keep display positions.
        val positionSites = mutableListOf<Pair<String, String>>()
        classDefForEach { c -> if (!c.type.startsWith("Lxyz/urro/")) for (m in c.methods) {
            val refs = m.implementation?.instructions?.mapNotNull { (it as? ReferenceInstruction)?.reference }.orEmpty()
            val clipboardCaller = refs.any { ref -> when (ref) {
                is MethodReference -> ref.definingClass in setOf(adapterType, keyboardType)
                is FieldReference -> ref.definingClass in setOf(adapterType, keyboardType) || ref.type in setOf(adapterType, keyboardType)
                is TypeReference -> ref.type in setOf(adapterType, keyboardType)
                else -> false
            } }
            if (clipboardCaller && m.calls().any { holderPosition(it) }) positionSites += c.type to m.toString()
        } }
        for ((owner, signature) in positionSites) {
            val target = mutableClassDefBy(owner).methods.single { it.toString() == signature }
            for ((index, instruction) in target.implementation!!.instructions.withIndex().toList().asReversed()) {
                val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
                if (!holderPosition(ref)) continue
                val registers = when (instruction) {
                    is RegisterRangeInstruction -> "{v${instruction.startRegister} .. v${instruction.startRegister}}"
                    is FiveRegisterInstruction -> "{v${instruction.registerC}}"
                    else -> error("Unsupported holder-position invocation")
                }
                target.replaceInstruction(index, "invoke-static${if (instruction is RegisterRangeInstruction) "/range" else ""} $registers, $HOOK->nativeHolderPosition(Ljava/lang/Object;)I")
            }
        }
        // Inserting a section invalidates native incremental-notification coordinates.
        // Only this adapter switches to full refreshes; unrelated adapters pass through.
        for (notification in parent.methods.filter { it.returnType == "V" && it.parameterTypes.firstOrNull()?.toString() == "I" && it.calls().size == 1 }) {
            val target = method(parent.type, notification.name, "V", notification.parameterTypes.map(CharSequence::toString))
            val nativeName = "urroNative_notify_" + notification.name
            val args = (0..notification.parameterTypes.size).joinToString(", ", "{", "}") { "p$it" }
            val descriptor = notification.parameterTypes.joinToString("")
            wrap(target, nativeName, notification.parameterTypes.size + 2, """
                invoke-static {p0}, $HOOK->refreshNative(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :native_notification
                return-void
                :native_notification
                invoke-virtual $args, ${parent.type}->$nativeName($descriptor)V
                return-void
            """)
        }
        val stickyAttach = adapter.method("clipboard sticky header attachment") { it.signature("V", "Landroid/support/v7/widget/RecyclerView;") }
        for (target in listOf(stickyUpdate, stickyAttach)) {
            val sticky = method(adapterType, target.name, "V", target.parameterTypes.map(CharSequence::toString))
            val nativeName = "urroNative_sticky_" + target.name
            val args = (0..target.parameterTypes.size).joinToString(", ", "{", "}") { "p$it" }
            wrap(sticky, nativeName, target.parameterTypes.size + 1, """
                invoke-virtual $args, $adapterType->$nativeName(${target.parameterTypes.joinToString("")})V
                invoke-static {p0}, $HOOK->sticky(Ljava/lang/Object;)V
                return-void
            """)
        }
        val popupClass = run {
            val candidates = mutableListOf<com.android.tools.smali.dexlib2.iface.ClassDef>()
            classDefForEach { c -> if (c.fields.any { it.type == item.type } && c.fields.any { it.type == keyboardType } &&
                c.methods.any { it.signature("Landroid/view/View;", "Landroid/view/View;") }) candidates += c }
            candidates.unique("clipboard item menu")
        }
        val popupMethod = popupClass.method("clipboard menu inflation") { it.signature("Landroid/view/View;", "Landroid/view/View;") }
        val popup = method(popupClass.type, popupMethod.name, "Landroid/view/View;", listOf("Landroid/view/View;"))
        // Preserve the popup receiver even if a future compiler reuses p0.
        val owner = mutableClassDefBy(popup.definingClass)
        val nativeName = "urroNative_clipboardPopup"
        check(owner.methods.none { it.name == nativeName }) { "Clipboard popup hook already installed" }
        val native = ImmutableMethod(popup.definingClass, nativeName, popup.parameters, popup.returnType,
            popup.accessFlags, popup.annotations, popup.hiddenApiRestrictions, popup.implementation).toMutable()
        val wrapper = ImmutableMethod(popup.definingClass, popup.name, popup.parameters, popup.returnType,
            popup.accessFlags, popup.annotations, popup.hiddenApiRestrictions,
            ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList())).toMutable()
        wrapper.addInstructions(0, """
            invoke-virtual {p0, p1}, ${popup.definingClass}->$nativeName(Landroid/view/View;)Landroid/view/View;
            move-result-object v0
            invoke-static {p0, v0}, $HOOK->popup(Ljava/lang/Object;Landroid/view/View;)V
            return-object v0
        """)
        check(owner.methods.remove(popup)); owner.methods.add(native); owner.methods.add(wrapper)

    }
}

@Suppress("unused")
val clipCascadePatch = resourcePatch(
    name = "ClipCascade sync",
    description = "Adds pooled remote clipboard history, images and Send to all devices. Supports ClipCascade P2S/P2P. Configure the required server/account patch options before patching.",
    default = false,
) {
    dependsOn(clipBytecode)
    compatibleWith(gboardCompatibility)
    val server by stringOption(key = "clipCascadeServer", default = "", title = "Server URL", description = "Required. ClipCascade server base URL, including https:// (or http:// on a trusted local network). No /login suffix.", required = true)
    val username by stringOption(key = "clipCascadeUsername", default = "", title = "Username", description = "Required. Your ClipCascade username.", required = true)
    val password by stringOption(key = "clipCascadePassword", default = "", title = "Password", description = "Required. Your original ClipCascade password. Credentials are stored in the patched APK; do not share it.", required = true)
    val maximumBytes by stringOption(key = "clipCascadeMaxBytes", default = "8388608", title = "Maximum clipboard size (bytes)", description = "Local limit for text/images, up to 16777216 bytes. The P2S server's limit also applies. Default: 8 MiB.")
    val encryption by booleanOption(key = "clipCascadeEncryption", default = true, title = "End-to-end encryption", description = "Must match the other clients.")
    val salt by stringOption(key = "clipCascadeSalt", default = "", title = "Encryption salt", description = "Must match the other clients; stock default is empty.")
    val iterations by stringOption(key = "clipCascadeIterations", default = "664937", title = "Key derivation iterations", description = "Must match the other clients. Stock default: 664937.")
    execute {
        val address = server?.trim().orEmpty().trimEnd('/')
        val uri = URI(address)
        check(uri.scheme in setOf("http", "https") && !uri.host.isNullOrEmpty() && uri.userInfo == null && uri.query == null && uri.fragment == null) { "Enter a valid ClipCascade base URL" }
        check(!username.isNullOrBlank() && !password.isNullOrEmpty()) { "ClipCascade username and password are required" }
        val localMaximum = maximumBytes?.toIntOrNull()
        check(localMaximum != null && localMaximum in 1..16777216) { "Clipboard size must be between 1 and 16777216 bytes" }
        val rounds = iterations?.toIntOrNull()
        check(rounds != null && rounds in 1..10000000) { "Encryption iterations must be between 1 and 10000000" }
        val asset = get("assets/urro_clipcascade.json")
        asset.parentFile.mkdirs()
        asset.writeText("{\"server\":${jsonString(address)},\"username\":${jsonString(username!!)}," +
            "\"password\":${jsonString(password!!)},\"encryption\":${encryption == true}," +
            "\"salt\":${jsonString(salt.orEmpty())},\"iterations\":$rounds,\"maxBytes\":$localMaximum}")
        Assets.javaClass.getResourceAsStream("/gboard/clipcascade.js")!!.use { get("assets/urro_clipcascade.js").writeBytes(it.readBytes()) }
        if (uri.scheme == "http") {
            document("AndroidManifest.xml").use { xml ->
                val app = xml.getElementsByTagName("application").item(0) as Element
                val existing = app.getAttributeNS(ANDROID, "networkSecurityConfig")
                if (existing.startsWith("@xml/")) {
                    document("res/xml/${existing.removePrefix("@xml/")}.xml").use { network ->
                        val rule = network.createElement("domain-config"); rule.setAttribute("cleartextTrafficPermitted", "true")
                        val domain = network.createElement("domain"); domain.textContent = uri.host
                        rule.appendChild(domain); network.documentElement.appendChild(rule)
                    }
                } else {
                    check(existing.isBlank()) { "Unsupported network-security config reference" }
                    get("res/xml/urro_clipcascade_network.xml").writeText("<network-security-config><base-config cleartextTrafficPermitted=\"false\"/><domain-config cleartextTrafficPermitted=\"true\"><domain>${uri.host}</domain></domain-config></network-security-config>")
                    app.android("networkSecurityConfig", "@xml/urro_clipcascade_network")
                }
            }
        }
    }
    finalize {
        // Resolve the menu label from the APK's default resources, then use its own
        // localized value at runtime. Resource IDs change between Gboard releases.
        document("res/values/strings.xml").use { xml ->
            val strings = xml.getElementsByTagName("string")
            val labels = (0 until strings.length).map { strings.item(it) as Element }
                .filter { it.textContent == "Delete" }.map { it.getAttribute("name") }
            check(labels.isNotEmpty()) { "Unsupported Gboard clipboard delete label" }
            get("assets/urro_gboard_delete_labels.txt").writeText(labels.joinToString("\n"))
        }
        for (file in listOf("res/xml/settings.xml", "res/xml/settings_legacy.xml")) document(file).use(::removeOldSettings)
        document("res/xml/setting_clipboard.xml").use { xml ->
            val section = addSection(xml, "ClipCascade", "urro_clipcascade_section")
            section.preference("Connect to ClipCascade", "urro_clipcascade_enabled", toggle = true)
            section.preference("Allow local network access", "urro_clipcascade_local_network", "Required for nearby P2P devices on Android 17 and newer.")
            section.preference("Show Other devices section", "urro_show_remote_clipboard", toggle = true)
            section.preference("Confirm before sending", "urro_confirm_clipboard_send", toggle = true)
            section.preference("This device section name", "urro_local_section_name")
            section.preference("Other devices section name", "urro_remote_section_name")
            section.preference("Clear received history", "urro_clear_remote_history", "Only removes clips received on this device.")
            section.preference("Connection", "urro_clipcascade_status")
            (section.lastChild as Element).android("selectable", "false")
        }
        document("AndroidManifest.xml").use { xml ->
            val app = xml.getElementsByTagName("application").item(0) as Element
            val activities = app.getElementsByTagName("activity")
            for (i in activities.length - 1 downTo 0) {
                val activity = activities.item(i) as Element
                if (activity.getAttributeNS(ANDROID, "name") in setOf("xyz.urro.gboard.ClipCascadeSettings", "xyz.urro.gboard.TranslationSettings")) app.removeChild(activity)
            }
            val permissionName = "android.permission.ACCESS_LOCAL_NETWORK"
            val permissions = xml.getElementsByTagName("uses-permission")
            if ((0 until permissions.length).none { (permissions.item(it) as Element).getAttributeNS(ANDROID, "name") == permissionName }) {
                val permission = xml.createElement("uses-permission")
                permission.android("name", permissionName)
                xml.documentElement.insertBefore(permission, app)
            }
            val permissionActivity = xml.createElement("activity")
            permissionActivity.android("name", "xyz.urro.gboard.ClipPermissionActivity")
            permissionActivity.android("exported", "false")
            app.appendChild(permissionActivity)
            val provider = xml.createElement("provider")
            provider.android("name", "xyz.urro.gboard.ClipImages"); provider.android("authorities", "xyz.urro.gboard.clipimages." + java.util.UUID.randomUUID().toString().replace("-", ""))
            provider.android("exported", "false"); provider.android("grantUriPermissions", "true"); app.appendChild(provider)
        }
    }
}
