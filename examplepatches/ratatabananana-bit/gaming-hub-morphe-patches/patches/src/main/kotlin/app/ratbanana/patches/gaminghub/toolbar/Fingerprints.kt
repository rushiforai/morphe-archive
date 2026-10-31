package app.ratbanana.patches.gaminghub.toolbar

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode

/**
 * `MainToolbar.initEventMenu(binding, listener)`
 *
 * Wires the gift icon of the home toolbar: its click opens the Events page,
 * and flows toggle its visibility and its "new event" dot badge.
 */
internal object InitEventMenuFingerprint : Fingerprint(
    definingClass = "Lcom/samsung/android/game/gamehome/app/main/toolbar/MainToolbar;",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf("L", "L"),
    filters = listOf(
        // binding.toolbarEvent
        fieldAccess(
            opcode = Opcode.IGET_OBJECT,
            type = "Landroid/widget/ImageView;",
        ),
        // Kotlin null check of the view binding property.
        string("toolbarEvent", location = MatchAfterImmediately()),
    ),
)
