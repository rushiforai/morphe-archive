/*
 * This patch follows Morphe's optional "Change package name" resource-patch
 * design and specializes it for ChMate's manifest and package literals.
 */

package app.morphe.patches.chmate

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.asSequence
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.w3c.dom.Element
import java.io.File
import java.nio.file.Files

private const val ORIGINAL_PACKAGE_NAME = "jp.co.airfront.android.a2chMate"
private const val DEFAULT_PACKAGE_NAME = "$ORIGINAL_PACKAGE_NAME.haiagaru"
private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"
private const val MAIN_EXTENSION = "Lapp/morphe/extension/chmate/Haiagaru;"

@Suppress("unused")
val changeChMatePackageNamePatch = resourcePatch(
    name = "Change ChMate package name",
    description = "Change ChMate's package name, app name, icon, and version code.",
    default = true,
) {
    compatibleWith(chMateCompatibility)

    val packageNameOption = stringOption(
        key = "packageName",
        default = DEFAULT_PACKAGE_NAME,
        title = "Package name",
        description = "Package name for the separate Haiagaru installation.",
        required = true,
    ) { value ->
        value != null && value.matches(Regex("^[a-z]\\w*(\\.[a-z]\\w*)+$"))
    }

    val appNameOption = stringOption(
        key = "appName",
        default = "Haiagaru",
        title = "App name",
        description = "Launcher name for the separately installed app. Leave empty to keep the original name.",
    )

    val appIconOption = stringOption(
        key = "appIcon",
        title = "App icon",
        description = "Path to a PNG or WebP launcher icon. Leave empty to keep the original icon.",
    )

    val versionCodeOption = intOption(
        key = "versionCode",
        title = "Version code",
        description = "Positive integer from 1 to 2100000000. Leave unset to keep the original version code.",
    ) { value ->
        value == null || value in 1..2_100_000_000
    }

    dependsOn(bytecodePatch {
        extendWith("extensions/chmate-shizuku.mpe")

        execute {
            val newPackageName = packageNameOption.value!!
            patchPackageNameLengthInputs()
            patchSelfNavigationIntents()
            classDefForEach { classDef ->
                if (classDef.type.startsWith("Lapp/morphe/extension/")) {
                    return@classDefForEach
                }
                val methodsWithPackageLiteral = classDef.methods.filter { method ->
                    method.implementation?.instructions?.any { instruction ->
                        instruction.packageNameLiteralOrNull() == ORIGINAL_PACKAGE_NAME
                    } == true
                }
                if (methodsWithPackageLiteral.isEmpty()) return@classDefForEach

                val mutableClass = mutableClassDefBy(classDef)
                methodsWithPackageLiteral.forEach { method ->
                    mutableClass.findMutableMethodOf(method)
                        .replacePackageNameLiterals(newPackageName)
                }
            }
        }
    })

    execute {
        val newPackageName = packageNameOption.value!!
        val appName = appNameOption.value?.trim()?.takeIf(String::isNotEmpty)
        val versionCode = versionCodeOption.value?.toString()
        val iconSource = appIconOption.value?.trim()?.takeIf(String::isNotEmpty)?.let(::File)
        val iconResource = iconSource?.let { source ->
            if (!source.isFile) {
                throw PatchException("The app icon file cannot be found: ${source.absolutePath}")
            }
            val extension = source.extension.lowercase()
            if (extension !in setOf("png", "webp")) {
                throw PatchException("The app icon must be a PNG or WebP file: ${source.absolutePath}")
            }
            val targetDirectory = get("res").resolve("drawable-nodpi")
            Files.createDirectories(targetDirectory.toPath())
            source.copyTo(
                target = targetDirectory.resolve("haiagaru_custom_icon.$extension"),
                overwrite = true,
            )
            "@drawable/haiagaru_custom_icon"
        }

        // Android launches static app shortcuts directly from their resource XML, so the
        // bytecode Intent hook never sees them. Resource names are obfuscated differently in
        // every ChMate release; scan decoded XML by attribute shape instead of filename.
        get("res").walkTopDown()
            .filter { it.isFile && it.extension.equals("xml", ignoreCase = true) }
            .forEach { resource ->
                val original = resource.readText()
                val rewritten = original.replace(
                    "android:targetPackage=\"$ORIGINAL_PACKAGE_NAME\"",
                    "android:targetPackage=\"$newPackageName\"",
                )
                if (rewritten != original) resource.writeText(rewritten)
            }

        if (appName != null || iconResource != null || versionCode != null) {
            document("AndroidManifest.xml").use { document ->
                versionCode?.let {
                    document.documentElement.setAttribute("android:versionCode", it)
                }
                val application = document.getElementsByTagName("application").item(0) as Element
                appName?.let { application.setAttribute("android:label", it) }
                iconResource?.let {
                    application.setAttribute("android:icon", it)
                    if (application.hasAttribute("android:roundIcon")) {
                        application.setAttribute("android:roundIcon", it)
                    }
                }

                listOf("activity", "activity-alias")
                    .flatMap { tag ->
                        document.getElementsByTagName(tag)
                            .asSequence()
                            .map { it as Element }
                            .toList()
                    }
                    .filter(Element::isLauncherElement)
                    .forEach { launcher ->
                        appName?.let { launcher.setAttribute("android:label", it) }
                        iconResource?.let { launcher.setAttribute("android:icon", it) }
                    }
            }
        }
    }

    finalize {
        val newPackageName = packageNameOption.value!!
        document("AndroidManifest.xml").use { document ->
            document.getElementsByTagName("*")
                .asSequence()
                .map { it as Element }
                .forEach { element ->
                    val attributes = element.attributes
                    for (index in 0 until attributes.length) {
                        val attribute = attributes.item(index)
                        if (attribute.nodeValue.contains(ORIGINAL_PACKAGE_NAME)) {
                            attribute.nodeValue = attribute.nodeValue.replace(
                                ORIGINAL_PACKAGE_NAME,
                                newPackageName,
                            )
                        }
                    }
                }
            document.documentElement.setAttribute("package", newPackageName)

            (document.getElementsByTagName("uses-sdk").item(0) as? Element)
                ?.setAttribute("android:minSdkVersion", "24")

            document.documentElement.appendChild(
                document.createElement("uses-permission").apply {
                    setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:name",
                        "moe.shizuku.manager.permission.API_V23",
                    )
                },
            )

            val application = document.getElementsByTagName("application").item(0) as Element
            application.appendChild(
                document.createElement("meta-data").apply {
                    setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:name",
                        "moe.shizuku.client.V3_SUPPORT",
                    )
                    setAttributeNS(ANDROID_NAMESPACE, "android:value", "true")
                },
            )
            application.appendChild(
                document.createElement("provider").apply {
                    setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:name",
                        "rikka.shizuku.ShizukuProvider",
                    )
                    setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:authorities",
                        "$newPackageName.shizuku",
                    )
                    setAttributeNS(ANDROID_NAMESPACE, "android:multiprocess", "false")
                    setAttributeNS(ANDROID_NAMESPACE, "android:enabled", "true")
                    setAttributeNS(ANDROID_NAMESPACE, "android:exported", "true")
                    setAttributeNS(
                        ANDROID_NAMESPACE,
                        "android:permission",
                        "android.permission.INTERACT_ACROSS_USERS_FULL",
                    )
                },
            )
        }
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchSelfNavigationIntents() {
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }
        classDef.methods.forEach { method ->
            val matches = method.implementation?.instructions
                ?.mapIndexedNotNull { index, instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                        as? MethodReference ?: return@mapIndexedNotNull null
                    if (reference.name !in setOf("startActivity", "startActivityForResult")
                        || reference.parameterTypes.firstOrNull() != "Landroid/content/Intent;"
                    ) return@mapIndexedNotNull null

                    val intentRegister = when (instruction) {
                        is FiveRegisterInstruction -> instruction.registerD
                        is RegisterRangeInstruction -> instruction.startRegister + 1
                        else -> return@mapIndexedNotNull null
                    }
                    index to intentRegister
                }
                ?.toList()
                .orEmpty()
            if (matches.isEmpty()) return@forEach

            val mutableMethod = mutableClass.findMutableMethodOf(method)
            matches.asReversed().forEach { (index, intentRegister) ->
                mutableMethod.addInstruction(
                    index,
                    "invoke-static/range { v$intentRegister .. v$intentRegister }, " +
                        "$MAIN_EXTENSION->retargetSelfIntent(Landroid/content/Intent;)" +
                        "Landroid/content/Intent;",
                )
                mutableMethod.addInstruction(index + 1, "move-result-object v$intentRegister")
            }
        }
    }
}

private fun app.morphe.patcher.patch.BytecodePatchContext.patchPackageNameLengthInputs() {
    classDefForEach { classDef ->
        if (classDef.type.startsWith("Lapp/morphe/extension/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }
        classDef.methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            val matches = instructions.indices.mapNotNull { index ->
                val packageCall = (instructions[index] as? ReferenceInstruction)?.reference
                    as? MethodReference ?: return@mapNotNull null
                if (packageCall.definingClass != "Landroid/content/Context;"
                    || packageCall.name != "getPackageName"
                    || packageCall.returnType != "Ljava/lang/String;"
                    || packageCall.parameterTypes.isNotEmpty()
                ) return@mapNotNull null

                val moveResult = instructions.getOrNull(index + 1)
                    ?.takeIf { it.opcode == Opcode.MOVE_RESULT_OBJECT }
                    as? OneRegisterInstruction ?: return@mapNotNull null
                val resultRegister = moveResult.registerA
                val feedsLength = instructions.subList(
                    index + 2,
                    minOf(index + 7, instructions.size),
                ).any { instruction ->
                    val reference = (instruction as? ReferenceInstruction)?.reference
                        as? MethodReference ?: return@any false
                    reference.definingClass == "Ljava/lang/String;"
                        && reference.name == "length"
                        && reference.returnType == "I"
                        && reference.parameterTypes.isEmpty()
                        && when (instruction) {
                            is FiveRegisterInstruction -> instruction.registerC == resultRegister
                            is RegisterRangeInstruction -> instruction.startRegister == resultRegister
                            else -> false
                        }
                }
                if (feedsLength) index + 1 to resultRegister else null
            }

            if (matches.isEmpty()) return@forEach
            val mutableMethod = mutableClass.findMutableMethodOf(method)
            matches.asReversed().forEach { (index, register) ->
                mutableMethod.replaceInstruction(
                    index,
                    "invoke-static { }, $MAIN_EXTENSION->originalPackageName()Ljava/lang/String;",
                )
                mutableMethod.addInstruction(index + 1, "move-result-object v$register")
            }
        }
    }
}

private fun Element.isLauncherElement(): Boolean =
    getElementsByTagName("intent-filter")
        .asSequence()
        .map { it as Element }
        .any { intentFilter ->
            intentFilter.hasChildElementWithName("action", "android.intent.action.MAIN")
                && intentFilter.hasChildElementWithName(
                    "category",
                    "android.intent.category.LAUNCHER",
                )
        }

private fun Element.hasChildElementWithName(tag: String, name: String): Boolean =
    getElementsByTagName(tag)
        .asSequence()
        .map { it as Element }
        .any { it.getAttribute("android:name") == name }

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction
    .packageNameLiteralOrNull(): String? {
    if (opcode !in setOf(Opcode.CONST_STRING, Opcode.CONST_STRING_JUMBO)) return null
    return ((this as? ReferenceInstruction)?.reference as? StringReference)?.string
}

private fun MutableMethod.replacePackageNameLiterals(newPackageName: String) {
    implementation?.instructions
        ?.mapIndexedNotNull { index, instruction ->
            if (instruction.packageNameLiteralOrNull() == ORIGINAL_PACKAGE_NAME) {
                index to (instruction as OneRegisterInstruction).registerA
            } else {
                null
            }
        }
        ?.asReversed()
        ?.forEach { (index, register) ->
            replaceInstruction(index, "const-string v$register, \"$newPackageName\"")
        }
}
