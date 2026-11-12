package app.morphe.patches.pixiv.shared

import app.morphe.patcher.fingerprint
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The drawer listener Pixiv hands to `NavigationView.setNavigationItemSelectedListener`, which is
 * what runs when a drawer row is tapped: `(NavigationMenuItemView, MenuItem)Z`.
 *
 * Both its name and the type of its first parameter are obfuscated, so it is recognised by what it
 * does instead - it reaches into a `NavigationView` and it starts activities with the transition
 * disabled, which together nothing else in the app does.
 */
internal val drawerItemClickFingerprint = fingerprint {
    returns("Z")
    custom { method, _ ->
        if (method.parameterTypes.size != 2) return@custom false
        if (method.parameterTypes[1].toString() != "Landroid/view/MenuItem;") return@custom false
        val instructions = method.implementation?.instructions ?: return@custom false
        var reachesNavigationView = false
        var disablesTransition = false
        for (instruction in instructions) {
            val reference = (instruction as? ReferenceInstruction)?.reference ?: continue
            if (reference is FieldReference &&
                reference.type == "Lcom/google/android/material/navigation/NavigationView;"
            ) {
                reachesNavigationView = true
            }
            if (reference is MethodReference && reference.name == "overridePendingTransition") {
                disablesTransition = true
            }
            if (reachesNavigationView && disablesTransition) return@custom true
        }
        false
    }
}
