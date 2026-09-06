package io.github.liongalahad.nuviotv.patches.shared.updates

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import com.android.tools.smali.dexlib2.AccessFlags

/** Full-build UpdateViewModel constructor, identified by its injected services and flow state. */
internal object UpdateViewModelConstructorFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.CONSTRUCTOR),
    returnType = "V",
    strings = listOf("context", "updateRepository", "updatePreferences", "apkDownloader"),
    custom = { method, classDef ->
        method.name == "<init>" &&
            method.parameterTypes.size == 4 &&
            method.parameterTypes.first().toString() == "Landroid/content/Context;" &&
            classDef.fields.count { it.type == "Lkotlinx/coroutines/flow/MutableStateFlow;" } == 1 &&
            classDef.fields.count { it.type == "Lkotlinx/coroutines/flow/StateFlow;" } == 1
    }
)

/** Automatic and manual release check entry point on the resolved UpdateViewModel. */
internal object CheckForUpdatesFingerprint : Fingerprint(
    classFingerprint = UpdateViewModelConstructorFingerprint,
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("Z", "Z")
)

/** 0.9.0 isolates the channel, banner and manual check in one native Composable. */
internal object AboutUpdateControlsFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "V",
    filters = listOf(
        literal(0x7f110029L), // Update channel
        literal(0x7f110028L),
        literal(0x7f110027L), // Automatic update banner
        literal(0x7f110026L),
        literal(0x7f11001bL), // Check for updates
        literal(0x7f11001cL)
    ),
    custom = { method, _ ->
        method.parameterTypes.size == 3 &&
            method.parameterTypes.take(2).all { it.toString().startsWith("L") } &&
            method.parameterTypes.last().toString() == "I"
    }
)
