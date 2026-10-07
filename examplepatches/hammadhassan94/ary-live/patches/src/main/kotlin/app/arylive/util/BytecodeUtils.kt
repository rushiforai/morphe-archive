package app.arylive.util

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags

private const val NOTIFY_UI =
    "invoke-static {}, Lapp/arylive/extension/AdSkipNotifier;->notifySkipped()V"
private const val NOTIFY_VIDEO =
    "invoke-static {}, Lapp/arylive/extension/AdSkipNotifier;->notifyVideoSkipped()V"

fun MutableMethod.returnEarly(notify: Boolean = false) {
    check(returnType.first() == 'V') { "Method return type is not void" }
    addInstructions(
        0,
        if (notify) {
            """
                $NOTIFY_UI
                return-void
            """.trimIndent()
        } else {
            "return-void"
        },
    )
}

fun MutableMethod.returnEarlyNull(notify: Boolean = false, video: Boolean = false) {
    val kind = returnType.first()
    check(kind == 'L' || kind == '[') { "Method return type is not an object/array" }
    val notifyInsn = when {
        !notify -> ""
        video -> "$NOTIFY_VIDEO\n"
        else -> "$NOTIFY_UI\n"
    }
    addInstructions(
        0,
        """
            ${notifyInsn}const/4 v0, 0x0
            return-object v0
        """.trimIndent(),
    )
}

fun MutableMethod.returnFirstParameter() {
    val kind = returnType.first()
    check(kind == 'L' || kind == '[') { "Method return type is not an object/array" }
    val param = if (AccessFlags.STATIC.isSet(accessFlags)) "p0" else "p1"
    addInstructions(0, "return-object $param")
}
