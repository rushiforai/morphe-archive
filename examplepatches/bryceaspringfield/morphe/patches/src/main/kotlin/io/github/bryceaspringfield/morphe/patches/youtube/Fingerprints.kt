package io.github.bryceaspringfield.morphe.patches.youtube

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

internal object SortFilterBindFingerprint : Fingerprint(
    returnType = "V",
    filters = listOf(
        methodCall(
            opcodes = listOf(Opcode.INVOKE_VIRTUAL),
            definingClass = "Landroid/widget/Spinner;",
            name = "setOnItemSelectedListener"
        ),
        string("MainSortFilterSubMenuContextDecoratorPreventDisableWhenOfflineKey")
    )
)

internal object LiveChatRequestFingerprint : Fingerprint(
    filters = listOf(
        string("live_chat/get_live_chat")
    )
)

internal object RollingNumberSetterFingerprint : Fingerprint(
    filters = listOf(
        string("RollingNumberType required properties missing! Need updatedCount, color, fontAttributes or fontName + fontSize. Properties missing: ")
    )
)

internal object DisableAudioOnlyModeFingerprint : Fingerprint(
    filters = listOf(
        string("disableAudioOnlyMode")
    )
)
