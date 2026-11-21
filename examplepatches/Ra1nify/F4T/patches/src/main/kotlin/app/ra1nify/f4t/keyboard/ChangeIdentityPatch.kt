@file:Suppress("DEPRECATION")

package app.ra1nify.f4t.keyboard

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.classDefForEach
import app.morphe.patcher.patch.listDecodableFiles
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.ra1nify.f4t.shared.OPLUS_KEYBOARD
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val STOCK_PACKAGE = "com.oplus.keyboard"
private const val TARGET_PACKAGE = "com.realme.keyboard"
private const val TARGET_APP_NAME_EN = "realmeow Keyboard"
private const val TARGET_APP_NAME_ZH_CN = "真奇喵输入法"
private const val TARGET_APP_NAME_ZH_HANT = "真奇喵輸入法"
private const val RECEIVER_PERMISSION = "$STOCK_PACKAGE.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"
private const val IME_SERVICE = "$STOCK_PACKAGE.service.ImeService"
private const val MANIFEST = "AndroidManifest.xml"
private const val CONTENT_URI_PREFIX = "content://$STOCK_PACKAGE."

/**
 * Moves the patched keyboard out of the stock identity so the privileged, stock-signed build stays
 * untouched.
 *
 * The stock keyboard ships as a system component: it cannot be replaced in place, and a re-signed
 * rebuild under the same package would either fail to install or lose the privileged checks. The
 * patched build therefore installs under its own package and its own label, which is what the rest
 * of the bundle relies on.
 *
 * Renaming the manifest alone is not enough, because the app keeps pointing at resources of the
 * stock package. The rename is therefore completed here as well:
 * - the provider authorities and the `content://` authorities hardcoded in the bytecode,
 * - the dynamic receiver permission declared and referenced by the manifest,
 * - the IME service, which has to be exported because the input method manager does not bind a
 *   service of a non-system package that is not exported,
 * - a `<queries>` entry for the stock package, so the cloud configuration sync can still read its
 *   version code.
 */
@Suppress("unused")
val changeIdentityPatch = resourcePatch(
    name = "Change Identity",
    description = "Gives the patched keyboard its own identity so it can coexist with the privileged, " +
        "stock-signed build: the package becomes \"$TARGET_PACKAGE\", the launcher and input method " +
        "picker label becomes \"$TARGET_APP_NAME_EN\" / \"$TARGET_APP_NAME_ZH_CN\" / " +
        "\"$TARGET_APP_NAME_ZH_HANT\" by locale, and everything the rename would otherwise break is " +
        "repaired (provider authorities, the dynamic receiver permission, the exported IME service " +
        "and the hardcoded content:// authorities).",
    default = false,
) {
    compatibleWith(OPLUS_KEYBOARD)

    // The anti-resale notice is not optional: every keyboard patch pulls it in.
    dependsOn(keyboardAntiResalePatch)

    execute {
        renameManifest()
        renameHardcodedAuthorities()
        renameAppName()

        println(
            "[keyboard] identity -> package \"$TARGET_PACKAGE\", label \"$TARGET_APP_NAME_EN\" / " +
                "\"$TARGET_APP_NAME_ZH_CN\" / \"$TARGET_APP_NAME_ZH_HANT\""
        )
    }
}

private fun renameManifest() {
    var providers = 0
    var permissions = 0
    var imeServices = 0

    resourceXml(MANIFEST).use { manifest ->
        val root = manifest.root
        if (root.tag != "manifest") {
            throw PatchException("$MANIFEST has root element \"${root.tag}\", expected \"manifest\"")
        }

        val declaredPackage = root.attribute("package")
        if (declaredPackage != STOCK_PACKAGE) {
            throw PatchException(
                "$MANIFEST declares package \"$declaredPackage\", expected \"$STOCK_PACKAGE\". " +
                    "The APK is not the stock keyboard or it was renamed already."
            )
        }
        root.setAttribute("package", TARGET_PACKAGE)

        // The cloud configuration sync reads the version code of the stock package. Package visibility
        // hides an installed package from a renamed and re-signed APK, so without this entry the sync
        // throws NameNotFoundException and the HMAC keys are never fetched (all X-Sign requests fail).
        val queries = manifest.elements("queries").firstOrNull() ?: root.appendChild("queries")
        if (queries.elements("package").none { element -> element.attribute("android:name") == STOCK_PACKAGE }) {
            queries.appendChild("package") { setAttribute("android:name", STOCK_PACKAGE) }
            println("[keyboard] manifest: <queries> visibility for $STOCK_PACKAGE")
        }

        manifest.elements().forEach { element ->
            when (element.tag) {
                "provider" -> element.attribute("android:authorities")?.let { authorities ->
                    val renamed = authorities.split(';').joinToString(";") { authority ->
                        if (authority.startsWith("$STOCK_PACKAGE.")) {
                            TARGET_PACKAGE + authority.removePrefix(STOCK_PACKAGE)
                        } else {
                            authority
                        }
                    }
                    if (renamed != authorities) {
                        element.setAttribute("android:authorities", renamed)
                        providers += 1
                    }
                }

                "permission", "uses-permission" -> element.attribute("android:name")?.let { name ->
                    if (name == RECEIVER_PERMISSION) {
                        element.setAttribute("android:name", receiverPermission())
                        permissions += 1
                    }
                }

                "service" -> element.attribute("android:name")?.let { name ->
                    if (name == IME_SERVICE || (name.startsWith("$STOCK_PACKAGE.") && name.endsWith(".service.ImeService"))) {
                        element.setAttribute("android:exported", "true")
                        imeServices += 1
                    }
                }
            }

            element.attribute("android:permission")?.let { permission ->
                if (permission == RECEIVER_PERMISSION) {
                    element.setAttribute("android:permission", receiverPermission())
                    permissions += 1
                }
            }
        }
    }

    if (providers == 0) {
        throw PatchException(
            "$MANIFEST declares no provider with a \"$STOCK_PACKAGE.\" authority; " +
                "renaming the providers would have to be done by hand on this host version"
        )
    }
    if (permissions == 0) {
        throw PatchException("$MANIFEST does not reference \"$RECEIVER_PERMISSION\"")
    }
    if (imeServices == 0) {
        throw PatchException("$MANIFEST does not declare \"$IME_SERVICE\"")
    }

    println(
        "[keyboard] manifest: $providers provider authority prefix(es), $permissions receiver " +
            "permission reference(s), $imeServices IME service(s) exported"
    )
}

private fun renameHardcodedAuthorities() {
    val replacement = "content://$TARGET_PACKAGE."
    var patched = 0

    classDefForEach { classDef ->
        val usesStockAuthority = classDef.methods.any { method ->
            method.implementation?.instructions?.any { instruction ->
                instruction.stringConstant()?.startsWith(CONTENT_URI_PREFIX) == true
            } == true
        }
        if (!usesStockAuthority) return@classDefForEach

        mutableClassDefBy(classDef).methods.filterIsInstance<MutableMethod>().forEach { method ->
            method.instructions.forEachIndexed { index, instruction ->
                val value = instruction.stringConstant() ?: return@forEachIndexed
                if (!value.startsWith(CONTENT_URI_PREFIX)) return@forEachIndexed
                if (instruction.opcode != Opcode.CONST_STRING && instruction.opcode != Opcode.CONST_STRING_JUMBO) {
                    return@forEachIndexed
                }

                val register = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(index, "const-string v$register, \"${value.replace(CONTENT_URI_PREFIX, replacement)}\"")
                patched += 1
                println("[keyboard] content authority -> $replacement (${method.definingClass}->${method.name})")
            }
        }
    }

    if (patched == 0) {
        throw PatchException(
            "no hardcoded \"$CONTENT_URI_PREFIX\" reference was found in the bytecode. " +
                "Renaming the providers would leave the app querying the stock authorities."
        )
    }
}

private fun receiverPermission() = "$TARGET_PACKAGE.DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"

/**
 * The label is a resource of every locale, so it is changed where it is declared. Without it the
 * patched build and the stock keyboard are indistinguishable in the launcher and in the input method
 * picker.
 *
 * The locale is taken from the resource directory name, not from the resource itself: `values` is the
 * default (English here), `values-zh-rCN` and the other simplified Chinese configurations use the
 * simplified name, and `values-zh-rHK` / `values-zh-rTW` / `values-zh-rMO` use the traditional one.
 */
private fun renameAppName() {
    val valuesFiles = listDecodableFiles("res/values*/strings.xml")
    if (valuesFiles.isEmpty()) {
        throw PatchException("no res/values*/strings.xml file could be decoded")
    }

    var renamed = 0
    valuesFiles.forEach { path ->
        val name = appNameFor(path)

        resourceXml(path).use { strings ->
            val resource = strings.resourceOrNull("app_name") ?: return@use
            if (resource.text != name) {
                resource.text = name
                renamed += 1
                println("[keyboard] app_name in $path -> $name")
            }
        }
    }

    if (renamed == 0) {
        throw PatchException("no app_name resource could be renamed")
    }
}

private fun appNameFor(path: String): String {
    val configuration = path.removePrefix("res/values").removeSuffix("/strings.xml")
    return when {
        configuration.startsWith("-zh-rHK") ||
            configuration.startsWith("-zh-rTW") ||
            configuration.startsWith("-zh-rMO") -> TARGET_APP_NAME_ZH_HANT

        configuration.startsWith("-zh") -> TARGET_APP_NAME_ZH_CN

        else -> TARGET_APP_NAME_EN
    }
}

private fun Instruction.stringConstant(): String? =
    ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
