package app.template.patches.shared.web

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.constValue
import app.template.patches.shared.logUniversal
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val WEB_SETTINGS = "Landroid/webkit/WebSettings;"
private const val COOKIE_MANAGER = "Landroid/webkit/CookieManager;"
private const val MIXED_CONTENT_NEVER_ALLOW = 1

private val FILE_ACCESS_METHODS = setOf(
    "setAllowFileAccess",
    "setAllowFileAccessFromFileURLs",
    "setAllowUniversalAccessFromFileURLs",
    "setAllowContentAccess",
)

private val INVOKE_OPCODES = setOf(
    Opcode.INVOKE_VIRTUAL,
    Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE,
    Opcode.INVOKE_INTERFACE_RANGE,
)

@Suppress("unused")
val webViewHardeningPatch = bytecodePatch(
    name = "WebView hardening",
    description = """
        Hardens every WebView in the app with selectable protections: block mixed
        content, disable local file access, remove JavaScript bridges, block media
        autoplay, disable geolocation, block third-party cookies and stop JavaScript
        popups.

        Applies to any app. Web logins or legacy web content may break when bridges,
        popups or third-party cookies are disabled. Turn off individual switches if
        a web flow stops working.
    """.trimIndent(),
    default = false,
) {
    val blockMixedContent by booleanOption(
        key = "blockMixedContent",
        default = true,
        title = "Block mixed content",
        description = "Force WebSettings.setMixedContentMode to NEVER_ALLOW so HTTPS pages cannot load HTTP subresources.",
    )
    val disableFileAccess by booleanOption(
        key = "disableFileAccess",
        default = true,
        title = "Disable local file access",
        description = "Turn off file://, content:// and universal file-URL access in WebViews.",
    )
    val removeJsInterfaces by booleanOption(
        key = "removeJsInterfaces",
        default = true,
        title = "Remove JavaScript bridges",
        description = "Remove addJavascriptInterface bridges so web content cannot call injected Java objects.",
    )
    val blockAutoplay by booleanOption(
        key = "blockAutoplay",
        default = true,
        title = "Block media autoplay",
        description = "Require a user gesture before WebView media starts playing.",
    )
    val disableGeolocation by booleanOption(
        key = "disableGeolocation",
        default = true,
        title = "Disable WebView geolocation",
        description = "Turn off WebSettings geolocation so web content cannot request location.",
    )
    val blockThirdPartyCookies by booleanOption(
        key = "blockThirdPartyCookies",
        default = true,
        title = "Block third-party cookies",
        description = "Stop WebViews from accepting third-party cookies.",
    )
    val blockJsPopups by booleanOption(
        key = "blockJsPopups",
        default = true,
        title = "Block JavaScript popups",
        description = "Stop web content from opening windows without a user gesture.",
    )

    execute {
        val mixedEnabled = blockMixedContent ?: true
        val fileAccessEnabled = disableFileAccess ?: true
        val jsInterfacesEnabled = removeJsInterfaces ?: true
        val autoplayEnabled = blockAutoplay ?: true
        val geolocationEnabled = disableGeolocation ?: true
        val cookiesEnabled = blockThirdPartyCookies ?: true
        val popupsEnabled = blockJsPopups ?: true

        var mixed = 0
        var fileAccess = 0
        var jsInterfaces = 0
        var autoplay = 0
        var geolocation = 0
        var cookies = 0
        var popups = 0

        classDefForEach { classDef ->
            val mutableClass = mutableClassDefBy(classDef)

            mutableClass.methods.forEach methodLoop@ { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@methodLoop
                val replacements = sortedMapOf<Int, String>()

                instructions.forEachIndexed { index, instruction ->
                    if (instruction.opcode !in INVOKE_OPCODES) return@forEachIndexed

                    val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                        ?: return@forEachIndexed

                    when {
                        mixedEnabled &&
                            reference.definingClass == WEB_SETTINGS &&
                            reference.name == "setMixedContentMode" &&
                            reference.returnType == "V" -> {
                            if (replaceLiteralArgument(
                                    instructions,
                                    index,
                                    1,
                                    MIXED_CONTENT_NEVER_ALLOW,
                                    replacements,
                                )
                            ) mixed++
                        }

                        fileAccessEnabled &&
                            reference.definingClass == WEB_SETTINGS &&
                            reference.name in FILE_ACCESS_METHODS &&
                            reference.returnType == "V" -> {
                            if (replaceLiteralArgument(instructions, index, 1, 0, replacements)) fileAccess++
                        }

                        jsInterfacesEnabled &&
                            reference.definingClass == WEB_SETTINGS &&
                            reference.name == "addJavascriptInterface" &&
                            reference.returnType == "V" -> {
                            replacements[index] = "nop"
                            jsInterfaces++
                        }

                        autoplayEnabled &&
                            reference.definingClass == WEB_SETTINGS &&
                            reference.name == "setMediaPlaybackRequiresUserGesture" &&
                            reference.returnType == "V" -> {
                            if (replaceLiteralArgument(instructions, index, 1, 1, replacements)) autoplay++
                        }

                        geolocationEnabled &&
                            reference.definingClass == WEB_SETTINGS &&
                            reference.name == "setGeolocationEnabled" &&
                            reference.returnType == "V" -> {
                            if (replaceLiteralArgument(instructions, index, 1, 0, replacements)) geolocation++
                        }

                        cookiesEnabled &&
                            reference.definingClass == COOKIE_MANAGER &&
                            reference.name == "setAcceptThirdPartyCookies" &&
                            reference.returnType == "V" -> {
                            if (replaceLiteralArgument(instructions, index, 2, 0, replacements)) cookies++
                        }

                        popupsEnabled &&
                            reference.definingClass == WEB_SETTINGS &&
                            reference.name == "setJavaScriptCanOpenWindowsAutomatically" &&
                            reference.returnType == "V" -> {
                            if (replaceLiteralArgument(instructions, index, 1, 0, replacements)) popups++
                        }
                    }
                }

                if (replacements.isNotEmpty()) {
                    replacements.entries
                        .sortedByDescending { it.key }
                        .forEach { (index, smali) -> method.replaceInstruction(index, smali) }
                }
            }
        }

        logUniversal(
            "WebView hardening: mixed=$mixed file=$fileAccess js=$jsInterfaces " +
                "autoplay=$autoplay geo=$geolocation cookies=$cookies popups=$popups.",
        )
    }
}

private fun replaceLiteralArgument(
    instructions: List<Instruction>,
    invokeIndex: Int,
    argumentIndex: Int,
    desired: Int,
    replacements: MutableMap<Int, String>,
): Boolean {
    val register = argumentRegister(instructions[invokeIndex], argumentIndex) ?: return false
    val (literalIndex, literal) = literalForRegister(instructions, invokeIndex, register) ?: return false
    if (literal == desired) return false
    replacements[literalIndex] = constValue(register, desired)
    return true
}

private fun argumentRegister(instruction: Instruction, argumentIndex: Int): Int? = when (instruction) {
    is FiveRegisterInstruction -> when (argumentIndex) {
        0 -> instruction.registerC
        1 -> instruction.registerD
        2 -> instruction.registerE
        3 -> instruction.registerF
        4 -> instruction.registerG
        else -> null
    }

    is RegisterRangeInstruction ->
        (instruction.startRegister + argumentIndex)
            .takeIf { argumentIndex < instruction.registerCount }

    else -> null
}

private fun literalForRegister(
    instructions: List<Instruction>,
    before: Int,
    register: Int,
): Pair<Int, Int>? {
    var inspected = 0

    for (index in before - 1 downTo 0) {
        val instruction = instructions[index]

        if (instruction is OneRegisterInstruction && instruction.registerA == register) {
            val literal = (instruction as? NarrowLiteralInstruction)?.narrowLiteral ?: return null
            return index to literal
        }

        if (instruction.opcode == Opcode.MOVE_RESULT ||
            instruction.opcode == Opcode.MOVE_RESULT_OBJECT ||
            instruction.opcode == Opcode.MOVE_RESULT_WIDE
        ) return null

        if (++inspected >= 8) return null
    }

    return null
}
