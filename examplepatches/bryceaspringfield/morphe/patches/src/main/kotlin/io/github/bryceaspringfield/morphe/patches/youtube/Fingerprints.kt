package io.github.bryceaspringfield.morphe.patches.youtube

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/**
 * The binding of a sort filter menu (a Spinner of server-sent options, such as live chat's Top chat and Live chat),
 * which selects the option the server marks selected and then sets the listener sending the user's choice.
 */
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

/** The constructor of live chat's request (live_chat/get_live_chat), whose class builds the request body. */
internal object LiveChatRequestFingerprint : Fingerprint(
    filters = listOf(
        string("live_chat/get_live_chat")
    )
)

/** The setter of YouTube's animated counts (the like button's count among them), which checks the model's fields. */
internal object RollingNumberSetterFingerprint : Fingerprint(
    filters = listOf(
        string("RollingNumberType required properties missing! Need updatedCount, color, fontAttributes or fontName + fontSize. Properties missing: ")
    )
)
