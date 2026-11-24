package app.aidan.patches.pay365.dev

import app.aidan.patches.pay365.shared.COMPATIBILITY_365_PAY
import app.aidan.patches.shared.HermesBundleEditor
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch

private const val BUNDLE_PATH = "assets/index.android.bundle"

private const val LEGACY_INIT_STATE_FUNCTION_NAME = "_0x3844af"
private const val LEGACY_NULL_INVARIANT_OFFSET = 0x6d
private const val LEGACY_IS_DEBUG_OFFSET = 0x183
private const val LEGACY_DEMO_MODE_OFFSET = 0x1c0

private val LEGACY_LOAD_CONST_NULL_R9_BYTES = byteArrayOf(0x77, 0x09)
private val LEGACY_EXPECTED_IS_DEBUG_BYTES = byteArrayOf(0x0b, 0x0a, 0x0a)
private val LEGACY_REPLACEMENT_IS_DEBUG_BYTES = byteArrayOf(0x0b, 0x0a, 0x09)
private val LEGACY_EXPECTED_DEMO_MODE_BYTES = byteArrayOf(0x49, 0x0a, 0x0b, 0x0a)
private val LEGACY_REPLACEMENT_DEMO_MODE_BYTES = byteArrayOf(0x0e, 0x0a, 0x09, 0x09)

private const val OP_NEW_ARRAY = 0x07
private const val OP_NOT = 0x0b
private const val OP_EQ = 0x0e
private const val OP_GET_BY_ID = 0x37
private const val OP_PUT_NEW_OWN_BY_ID = 0x40
private const val OP_GET_BY_VAL = 0x49
private const val OP_LOAD_CONST_UINT8 = 0x6e
private const val OP_LOAD_CONST_TRUE = 0x78
private const val OP_JMP = 0x8e
private const val OP_J_GREATER_EQUAL = 0xb0

private const val SINGLE_TAP_THRESHOLD = 1
private const val DEFAULT_TAP_THRESHOLD = 5
private const val DEBUG_INIT_JUMP_OFFSET = 5
private const val TAP_CONTEXT_WINDOW = 0x100
private const val INIT_STATE_CONTEXT_WINDOW = 0x300

@Suppress("unused")
val unlockDeveloperToolsPatch = rawResourcePatch(
    name = "Unlock Developer Tools",
    description = "Exposes the internal developer and diagnostics screen (Environment Settings) with a single Welcome Screen logo tap, and allows booting directly with Debug Messages or Demo Mode enabled.",
    default = false
) {
    category("Developer")
    compatibleWith(COMPATIBILITY_365_PAY)

    val startWithDebugMessages = booleanOption(
        key = "startWithDebugMessages",
        default = false,
        title = "Start with Debug Messages",
        description = "Initializes application state with Debug Messages enabled upon startup."
    )

    val startInDemoMode = booleanOption(
        key = "startInDemoMode",
        default = false,
        title = "Start in Demo Mode",
        description = "Initializes application state with Demo Mode enabled upon startup."
    )

    execute {
        val bundleFile = get(BUNDLE_PATH)
        if (!bundleFile.exists()) {
            throw PatchException("$BUNDLE_PATH not found")
        }

        val editor = HermesBundleEditor(bundleFile.readBytes())
        if (editor.version != 96) {
            throw PatchException("Unsupported Hermes bytecode version: ${editor.version}, expected 96")
        }

        val data = editor.toByteArray()
        unlockSingleTapDeveloperSettings(editor, data)

        val legacyInitStateOffsets = editor.findFunctionOffsetsByName(LEGACY_INIT_STATE_FUNCTION_NAME)
        when {
            legacyInitStateOffsets.size == 1 -> patchLegacyInitialState(
                editor,
                legacyInitStateOffsets.single(),
                startWithDebugMessages.value != false,
                startInDemoMode.value != false
            )

            legacyInitStateOffsets.isEmpty() -> patchCurrentInitialState(
                editor,
                data,
                startWithDebugMessages.value != false,
                startInDemoMode.value != false
            )

            else -> throw PatchException(
                "Expected at most one function named $LEGACY_INIT_STATE_FUNCTION_NAME, found ${legacyInitStateOffsets.size}"
            )
        }

        editor.updateFooterHash()
        bundleFile.writeBytes(data)
    }
}

private fun unlockSingleTapDeveloperSettings(editor: HermesBundleEditor, data: ByteArray) {
    val touchesId = editor.findStringId("touches")
        ?: throw PatchException("Missing 'touches' string in $BUNDLE_PATH")
    val goToEnvironmentSettingsId = editor.findStringId("goToEnvironmentSettings")
        ?: throw PatchException("Missing 'goToEnvironmentSettings' string in $BUNDLE_PATH")

    val tapOffset = data.findSingleOffset("Welcome Screen logo tap threshold") { offset ->
        data.matchesTapThreshold(offset, touchesId, goToEnvironmentSettingsId)
    }

    when (val threshold = data.u8(tapOffset + 2)) {
        SINGLE_TAP_THRESHOLD -> return
        DEFAULT_TAP_THRESHOLD -> editor.patchBytes(
            tapOffset + 2,
            byteArrayOf(SINGLE_TAP_THRESHOLD.toByte())
        )

        else -> throw PatchException(
            "Unexpected Welcome Screen logo tap threshold $threshold at offset 0x${Integer.toHexString(tapOffset)}"
        )
    }
}

private fun patchLegacyInitialState(
    editor: HermesBundleEditor,
    initStateOffset: Int,
    startWithDebug: Boolean,
    startInDemo: Boolean
) {
    if (!startWithDebug && !startInDemo) {
        return
    }

    val nullInvariantOffset = initStateOffset + LEGACY_NULL_INVARIANT_OFFSET
    if (!editor.matchesBytes(nullInvariantOffset, LEGACY_LOAD_CONST_NULL_R9_BYTES)) {
        throw PatchException(
            "Null register invariant check failed at offset 0x${Integer.toHexString(nullInvariantOffset)}"
        )
    }

    if (startWithDebug) {
        val isDebugOffset = initStateOffset + LEGACY_IS_DEBUG_OFFSET
        if (editor.matchesBytes(isDebugOffset, LEGACY_EXPECTED_IS_DEBUG_BYTES)) {
            editor.patchBytes(isDebugOffset, LEGACY_REPLACEMENT_IS_DEBUG_BYTES)
        } else if (!editor.matchesBytes(isDebugOffset, LEGACY_REPLACEMENT_IS_DEBUG_BYTES)) {
            throw PatchException(
                "Unexpected isDebug initialization bytecode at offset 0x${Integer.toHexString(isDebugOffset)}"
            )
        }
    }

    if (startInDemo) {
        val demoModeOffset = initStateOffset + LEGACY_DEMO_MODE_OFFSET
        if (editor.matchesBytes(demoModeOffset, LEGACY_EXPECTED_DEMO_MODE_BYTES)) {
            editor.patchBytes(demoModeOffset, LEGACY_REPLACEMENT_DEMO_MODE_BYTES)
        } else if (!editor.matchesBytes(demoModeOffset, LEGACY_REPLACEMENT_DEMO_MODE_BYTES)) {
            throw PatchException(
                "Unexpected demo mode initialization bytecode at offset 0x${Integer.toHexString(demoModeOffset)}"
            )
        }
    }
}

private fun patchCurrentInitialState(
    editor: HermesBundleEditor,
    data: ByteArray,
    startWithDebug: Boolean,
    startInDemo: Boolean
) {
    if (!startWithDebug && !startInDemo) {
        return
    }

    val isDebugId = editor.findStringId("isDebug")
        ?: throw PatchException("Missing 'isDebug' string in $BUNDLE_PATH")
    val initStateOffset = data.findSingleOffset("initial application state isDebug assignment") { offset ->
        data.matchesInitialState(offset, isDebugId)
    }

    if (startWithDebug) {
        when {
            data.matchesOriginalDebugInitialization(initStateOffset, isDebugId) -> {
                val register = data.u8(initStateOffset + 1)
                editor.patchBytes(
                    initStateOffset,
                    byteArrayOf(
                        OP_LOAD_CONST_TRUE.toByte(),
                        register.toByte(),
                        OP_JMP.toByte(),
                        DEBUG_INIT_JUMP_OFFSET.toByte()
                    )
                )
            }

            !data.matchesPatchedDebugInitialization(initStateOffset, isDebugId) -> throw PatchException(
                "Unexpected isDebug initialization bytecode at offset 0x${Integer.toHexString(initStateOffset)}"
            )
        }
    }

    if (startInDemo) {
        val demoId = editor.findStringId("demo")
            ?: throw PatchException("Missing 'demo' string in $BUNDLE_PATH")
        val originalOffsets = data.findDemoInitializationOffsets(initStateOffset, demoId, OP_GET_BY_VAL)
        val patchedOffsets = data.findDemoInitializationOffsets(initStateOffset, demoId, OP_EQ)

        if (originalOffsets.size + patchedOffsets.size != 1) {
            throw PatchException(
                "Expected exactly one demo mode initialization near 0x${Integer.toHexString(initStateOffset)}, " +
                    "found ${originalOffsets.size + patchedOffsets.size}"
            )
        }

        originalOffsets.singleOrNull()?.let { offset ->
            val register = data.u8(offset + 1)
            editor.patchBytes(
                offset,
                byteArrayOf(
                    OP_EQ.toByte(),
                    register.toByte(),
                    register.toByte(),
                    register.toByte()
                )
            )
        }
    }
}

private fun ByteArray.matchesTapThreshold(
    offset: Int,
    touchesId: Int,
    goToEnvironmentSettingsId: Int
): Boolean {
    if (u8(offset) != OP_LOAD_CONST_UINT8 || u8(offset + 3) != OP_J_GREATER_EQUAL) {
        return false
    }

    val threshold = u8(offset + 2)
    if (threshold != DEFAULT_TAP_THRESHOLD && threshold != SINGLE_TAP_THRESHOLD) {
        return false
    }

    val register = u8(offset + 1)
    if (u8(offset + 6) != register) {
        return false
    }

    return hasPutNewOwnById(offset, offset + TAP_CONTEXT_WINDOW, touchesId) &&
        hasGetById(offset, offset + TAP_CONTEXT_WINDOW, goToEnvironmentSettingsId)
}

private fun ByteArray.matchesInitialState(offset: Int, isDebugId: Int): Boolean = matchesOriginalDebugInitialization(offset, isDebugId) ||
    matchesPatchedDebugInitialization(offset, isDebugId)

private fun ByteArray.matchesOriginalDebugInitialization(offset: Int, isDebugId: Int): Boolean {
    val register = u8(offset + 1)
    return u8(offset) == OP_NEW_ARRAY &&
        u8(offset + 2) == 0 &&
        u8(offset + 3) == 0 &&
        u8(offset + 4) == OP_NOT &&
        u8(offset + 5) == register &&
        u8(offset + 6) == register &&
        matchesIsDebugAssignment(offset + 7, register, isDebugId)
}

private fun ByteArray.matchesPatchedDebugInitialization(offset: Int, isDebugId: Int): Boolean {
    val register = u8(offset + 1)
    return u8(offset) == OP_LOAD_CONST_TRUE &&
        u8(offset + 2) == OP_JMP &&
        u8(offset + 3) == DEBUG_INIT_JUMP_OFFSET &&
        u8(offset + 4) == OP_NOT &&
        u8(offset + 5) == register &&
        u8(offset + 6) == register &&
        matchesIsDebugAssignment(offset + 7, register, isDebugId)
}

private fun ByteArray.matchesIsDebugAssignment(offset: Int, register: Int, isDebugId: Int): Boolean = u8(offset) == OP_PUT_NEW_OWN_BY_ID &&
    u8(offset + 2) == register &&
    u8(offset + 3) == (isDebugId and 0xFF) &&
    u8(offset + 4) == ((isDebugId ushr 8) and 0xFF)

private fun ByteArray.findDemoInitializationOffsets(
    initStateOffset: Int,
    demoId: Int,
    opcode: Int
): List<Int> {
    val end = minOf(initStateOffset + INIT_STATE_CONTEXT_WINDOW, size - 9)
    val offsets = mutableListOf<Int>()
    for (offset in initStateOffset..end) {
        if (u8(offset) != opcode || u8(offset + 4) != OP_PUT_NEW_OWN_BY_ID) {
            continue
        }

        val register = u8(offset + 1)
        val registerMatches = if (opcode == OP_GET_BY_VAL) {
            u8(offset + 3) == register
        } else {
            u8(offset + 2) == register && u8(offset + 3) == register
        }

        if (registerMatches &&
            u8(offset + 6) == register &&
            u8(offset + 7) == (demoId and 0xFF) &&
            u8(offset + 8) == ((demoId ushr 8) and 0xFF)
        ) {
            offsets.add(offset)
        }
    }
    return offsets
}

private fun ByteArray.hasPutNewOwnById(start: Int, end: Int, stringId: Int): Boolean {
    val limit = minOf(end, size - 5)
    for (offset in start..limit) {
        if (u8(offset) == OP_PUT_NEW_OWN_BY_ID &&
            u8(offset + 3) == (stringId and 0xFF) &&
            u8(offset + 4) == ((stringId ushr 8) and 0xFF)
        ) {
            return true
        }
    }
    return false
}

private fun ByteArray.hasGetById(start: Int, end: Int, stringId: Int): Boolean {
    val limit = minOf(end, size - 6)
    for (offset in start..limit) {
        if (u8(offset) == OP_GET_BY_ID &&
            u8(offset + 4) == (stringId and 0xFF) &&
            u8(offset + 5) == ((stringId ushr 8) and 0xFF)
        ) {
            return true
        }
    }
    return false
}

private fun ByteArray.findSingleOffset(description: String, predicate: (Int) -> Boolean): Int {
    val matches = mutableListOf<Int>()
    for (offset in 0..size - 12) {
        if (predicate(offset)) {
            matches.add(offset)
        }
    }
    if (matches.size != 1) {
        throw PatchException("Expected exactly one $description, found ${matches.size}")
    }
    return matches.single()
}

private fun ByteArray.u8(offset: Int): Int = this[offset].toInt() and 0xFF
