package patches.reolink

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Attr
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val REOLINK_MORPHE_PACKAGE = "app.morphe.mcu.reolink"

/** The FileProvider authority Reolink's code names as a literal instead of from getPackageName(). */
private const val CODE_AUTHORITY_SUFFIX = ".fileProvider"
private const val CODE_AUTHORITY_USES = 24

private fun Document.elements(tag: String): List<Element> =
    getElementsByTagName(tag).let { list -> (0 until list.length).map { list.item(it) as Element } }

/** One manifest value that names Reolink's own identity: package + [suffix], found [count] times. */
private class Identity(val element: String, val attribute: String, val suffix: String = "", val count: Int = 1)

/**
 * Every manifest value in Reolink 4.64.3 that carries its package name as the app's own identity:
 * the package, its dynamic-receiver permission and the use of it, and twelve provider authorities
 * (two providers declare the same FileProvider authority). The intent action
 * com.mcu.reolink.launcher is a name, not an identity, and stays.
 */
private val identities = listOf(
    Identity("manifest", "package"),
    Identity("permission", "android:name", ".DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"),
    Identity("uses-permission", "android:name", ".DYNAMIC_RECEIVER_NOT_EXPORTED_PERMISSION"),
    Identity("provider", "android:authorities", CODE_AUTHORITY_SUFFIX, count = 2),
    Identity("provider", "android:authorities", ".fileprovider"),
    Identity("provider", "android:authorities", ".ImagePickerFileProvider"),
    Identity("provider", "android:authorities", ".cropper.fileprovider"),
    Identity("provider", "android:authorities", ".provider"),
    Identity("provider", "android:authorities", ".FileSystemFileProvider"),
    Identity("provider", "android:authorities", ".SharingFileProvider"),
    Identity("provider", "android:authorities", ".androidx-startup"),
    Identity("provider", "android:authorities", ".mlkitinitprovider"),
    Identity("provider", "android:authorities", ".firebaseinitprovider"),
)
private val ignoredValues = setOf("$REOLINK_PACKAGE.launcher")

/** Set by Change package name when it executes; read by the dependencies' finalize blocks. */
private var renamedPackage: String? = null

private fun Instruction.isString(value: String) =
    (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) &&
        ((this as ReferenceInstruction).reference as? StringReference)?.string == value

/** Points the code's literal FileProvider authority at the renamed provider. */
private val codeAuthorityPatch = bytecodePatch {
    dependsOn(originalInput)

    finalize {
        val new = renamedPackage ?: return@finalize
        val old = REOLINK_PACKAGE + CODE_AUTHORITY_SUFFIX
        val replacement = new + CODE_AUTHORITY_SUFFIX
        val owners = mutableListOf<ClassDef>()
        classDefForEach { cls ->
            if (cls.methods.any { method -> method.implementation?.instructions?.any { it.isString(old) } == true }) owners += cls
        }
        var replaced = 0
        for (owner in owners) {
            for (method in mutableClassDefBy(owner).methods) {
                val instructions = method.implementation?.instructions?.toList() ?: continue
                instructions.forEachIndexed { index, instruction ->
                    if (!instruction.isString(old)) return@forEachIndexed
                    val register = (instruction as OneRegisterInstruction).registerA
                    val opcode = if (instruction.opcode == Opcode.CONST_STRING_JUMBO) "const-string/jumbo" else "const-string"
                    method.replaceInstruction(index, "$opcode v$register, \"$replacement\"")
                    replaced++
                }
            }
        }
        if (replaced != CODE_AUTHORITY_USES) {
            throw PatchException("Expected $CODE_AUTHORITY_USES uses of the authority $old in Reolink's code, found $replaced")
        }
    }
}

/**
 * Installs Reolink under its own package name, beside the Reolink from the Play Store, which keeps
 * its sign-in, devices and notifications. A patched copy under the stock name could only replace it.
 *
 * Runs last, so values other patches add are moved too. Deliberately left alone: class names,
 * intent actions, and Reolink's BuildConfig, which names the original package.
 */
@Suppress("unused")
val reolinkChangePackageNamePatch = resourcePatch(
    name = "Change package name",
    description = "Installs Reolink under its own package name, alongside the Reolink from the Play Store. " +
        "On by default, because a patched copy cannot update the Play Store Reolink.",
    default = true,
) {
    compatibleWith(reolink)
    dependsOn(originalInput, codeAuthorityPatch)

    val packageName by stringOption(
        key = "packageName",
        default = REOLINK_MORPHE_PACKAGE,
        title = "Package name",
        description = "The package name to install under. Must be a valid Android package name that differs from $REOLINK_PACKAGE.",
        required = true,
    ) {
        it != null && it != REOLINK_PACKAGE && !it.contains(REOLINK_PACKAGE) && it.length <= 150 &&
            it.matches(Regex("^[a-zA-Z][a-zA-Z0-9_]*(\\.[a-zA-Z][a-zA-Z0-9_]*)+$"))
    }

    execute { renamedPackage = packageName!! }

    finalize {
        val old = REOLINK_PACKAGE
        val new = packageName!!
        document("AndroidManifest.xml").use { manifest ->
            if (manifest.documentElement.getAttribute("package") != old) {
                throw PatchException("Reolink package was already changed")
            }
            val all = manifest.elements("*").flatMap { element ->
                (0 until element.attributes.length).map { element.attributes.item(it) as Attr }
            }
            val owned = identities.flatMap { identity ->
                val value = old + identity.suffix
                val matches = manifest.elements(identity.element).mapNotNull { element ->
                    element.getAttributeNode(identity.attribute)?.takeIf { it.value == value }
                }
                if (matches.size != identity.count) throw PatchException(
                    "Expected ${identity.count} ${identity.element} ${identity.attribute}=\"$value\", found ${matches.size}",
                )
                matches.map { it to identity }
            }
            val ownedAttrs = owned.map { it.first }
            val unexpected = all.firstOrNull { attr ->
                old in attr.value && attr.value !in ignoredValues && ownedAttrs.none { it === attr }
            }
            if (unexpected != null) {
                throw PatchException("Unexpected package value ${unexpected.name}=\"${unexpected.value}\" in Reolink's manifest")
            }
            owned.forEach { (attr, identity) -> attr.value = new + identity.suffix }
        }
    }
}
