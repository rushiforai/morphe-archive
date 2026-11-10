package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.sheet

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val EDGE_TO_EDGE_CALLBACK =
    "Lcom/google/android/material/bottomsheet/BottomSheetDialog\$EdgeToEdgeCallback;"

/**
 * Material's listener for the insets a sheet's window is handed, which is where it builds the
 * callback that reads the sheet's behaviour.
 *
 * <p>Found by what it builds rather than by where it stands: the class is an anonymous one, so
 * it is named for its position among its neighbours and nothing about that position is
 * meaningful. There is exactly one place in the app that builds this callback.
 *
 * <p>It takes the sheet and the insets and hands the insets back, which is what lets the
 * listener be answered with its own second parameter where there is nothing to do.
 */
internal val edgeToEdgeInsetsFingerprint = Fingerprint(
    custom = { method, _ ->
        method.parameterTypes.size == 2 &&
                method.parameterTypes[0] == "Landroid/view/View;" &&
                method.returnType == method.parameterTypes[1] &&
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.NEW_INSTANCE &&
                            it.getReference<TypeReference>()?.type == EDGE_TO_EDGE_CALLBACK
                } == true
    },
)
