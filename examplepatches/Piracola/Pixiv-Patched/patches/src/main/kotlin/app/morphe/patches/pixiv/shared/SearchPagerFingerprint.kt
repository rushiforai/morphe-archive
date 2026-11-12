package app.morphe.patches.pixiv.shared

import app.morphe.patcher.fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

/**
 * The search pager adapter method that builds one result tab: `(I)Landroidx/fragment/app/Fragment;`.
 *
 * Its class name is obfuscated and changes with every Pixiv release, so the adapter is identified by
 * what it is rather than by where it lives: it builds a fragment, it takes the tab index, and it
 * passes the `SEARCH_PARAMETER` bundle key on to the fragment it creates.
 */
internal val searchPagerAdapterFingerprint = fingerprint {
    returns("Landroidx/fragment/app/Fragment;")
    parameters("I")
    custom { method, _ ->
        method.implementation?.instructions?.any { instruction ->
            instruction is ReferenceInstruction &&
                (instruction.reference as? StringReference)?.string == "SEARCH_PARAMETER"
        } == true
    }
}
