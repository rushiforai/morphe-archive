package app.xitter.patches.packagename

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.xitter.patches.shared.Constants.COMPATIBILITY_X
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.w3c.dom.Element

private const val ORIGINAL_PACKAGE = "com.twitter.android"

@Suppress("unused")
val changePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Changes the app's package name, account type and name, so the patched app installs " +
        "next to the original X app instead of replacing it. Do not also select Morphe's own " +
        "\"Change package name\" patch.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_X)

    val packageName by stringOption(
        key = "packageName",
        default = "com.twitter.android.xitter",
        title = "Package name",
        description = "The patched app's package name. It must differ from the original app's to install both.",
        required = true,
    ) { it != null && it.matches(Regex("^[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+$")) }

    val appName by stringOption(
        key = "appName",
        default = "Xitter",
        title = "App name",
        description = "The name under the launcher icon. Leave empty to keep \"X\".",
    )

    var bytecode: BytecodePatchContext? = null
    dependsOn(bytecodePatch { execute { bytecode = this } })

    execute {
        val newPackage = packageName!!
        if (newPackage == ORIGINAL_PACKAGE) return@execute
        fun renamed(name: String) =
            if (name == ORIGINAL_PACKAGE || name.startsWith("$ORIGINAL_PACKAGE.")) newPackage + name.removePrefix(ORIGINAL_PACKAGE) else name

        // old string to new string, for the code below
        val replacements = linkedMapOf(ORIGINAL_PACKAGE to newPackage)

        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            manifest.setAttribute("package", newPackage)

            // the app's own permissions (signature-level, so they would clash with X's)
            for (tag in listOf("permission", "uses-permission")) {
                val elements = manifest.getElementsByTagName(tag)
                for (i in 0 until elements.length) {
                    val e = elements.item(i) as Element
                    val name = e.getAttribute("android:name")
                    if (name.startsWith("$ORIGINAL_PACKAGE.")) {
                        e.setAttribute("android:name", renamed(name))
                        replacements[name] = renamed(name)
                    }
                }
            }

            // the app's content providers (not the launchers' providers listed under <queries>)
            val providers = manifest.getElementsByTagName("provider")
            for (i in 0 until providers.length) {
                val p = providers.item(i) as Element
                if ((p.parentNode as? Element)?.tagName != "application") continue
                val authorities = p.getAttribute("android:authorities").split(';').map { it.trim() }
                val renamedAuthorities = authorities.map { a ->
                    val to = if (a.startsWith("$ORIGINAL_PACKAGE.")) renamed(a) else "$newPackage.$a"
                    replacements[a] = to
                    to
                }
                p.setAttribute("android:authorities", renamedAuthorities.joinToString(";"))
                // a provider's permission names the app's renamed permissions
                for (attr in listOf("android:permission", "android:readPermission", "android:writePermission")) {
                    val v = p.getAttribute(attr)
                    if (v.startsWith("$ORIGINAL_PACKAGE.")) p.setAttribute(attr, renamed(v))
                }
            }

            // components protected by the app's own permissions
            for (tag in listOf("activity", "activity-alias", "service", "receiver")) {
                val elements = manifest.getElementsByTagName(tag)
                for (i in 0 until elements.length) {
                    val e = elements.item(i) as Element
                    val v = e.getAttribute("android:permission")
                    if (v.startsWith("$ORIGINAL_PACKAGE.")) e.setAttribute("android:permission", renamed(v))
                }
            }
        }

        // The account type: an authenticator type belongs to one installed app, so with X
        // installed the clone could never add its accounts.
        val accountType = "$ORIGINAL_PACKAGE.auth.login"
        replacements[accountType] = renamed(accountType)
        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")
            for (i in 0 until strings.length) {
                val s = strings.item(i) as Element
                when (s.getAttribute("name")) {
                    "account_type" -> s.textContent = renamed(accountType)
                    "app_name" -> if (!appName.isNullOrBlank()) s.textContent = appName!!.trim()
                }
            }
        }

        // launcher shortcuts and search, which name the package and a provider
        for (file in listOf("res/xml/shortcuts.xml", "res/xml/searchable.xml")) {
            val f = get(file)
            if (!f.exists()) continue
            var text = f.readText()
            text = text.replace("android:targetPackage=\"$ORIGINAL_PACKAGE\"", "android:targetPackage=\"$newPackage\"")
            for ((from, to) in replacements) {
                if (from != ORIGINAL_PACKAGE) text = text.replace("\"$from\"", "\"$to\"")
            }
            f.writeText(text)
        }

        // The same names as the code uses them: the app's id, its account type, provider
        // authorities (also inside content:// addresses) and permissions.
        val exact = replacements.toMap()
        val contentPrefixes = replacements.filterKeys { it != ORIGINAL_PACKAGE }.mapKeys { "content://${it.key}" }
        bytecode!!.transformStrings { s ->
            exact[s] ?: contentPrefixes.entries.firstOrNull { s == it.key || s.startsWith(it.key + "/") }?.let { (from, to) ->
                "content://$to" + s.removePrefix(from)
            }
        }
        bytecode = null
    }
}

private fun BytecodePatchContext.transformStrings(transform: (String) -> String?) {
    val targets = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        val has = classDef.methods.any { m ->
            m.implementation?.instructions?.any { i ->
                (i.opcode == Opcode.CONST_STRING || i.opcode == Opcode.CONST_STRING_JUMBO) &&
                    transform(((i as ReferenceInstruction).reference as StringReference).string) != null
            } == true
        }
        if (has) targets += classDef
    }
    for (classDef in targets) {
        for (method in mutableClassDefBy(classDef).methods) {
            val instructions = method.implementation?.instructions ?: continue
            for (index in instructions.indices) {
                val i = instructions[index]
                if (i.opcode != Opcode.CONST_STRING && i.opcode != Opcode.CONST_STRING_JUMBO) continue
                val to = transform(((i as ReferenceInstruction).reference as StringReference).string) ?: continue
                val register = (i as OneRegisterInstruction).registerA
                val ref = ImmutableStringReference(to)
                method.replaceInstruction(
                    index,
                    if (i.opcode == Opcode.CONST_STRING) BuilderInstruction21c(Opcode.CONST_STRING, register, ref)
                    else BuilderInstruction31c(Opcode.CONST_STRING_JUMBO, register, ref),
                )
            }
        }
    }
}
