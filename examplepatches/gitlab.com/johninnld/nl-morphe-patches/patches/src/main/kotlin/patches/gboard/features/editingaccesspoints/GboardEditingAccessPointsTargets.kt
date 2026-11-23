package patches.gboard.features.editingaccesspoints

import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.AccessFlags
import patches.gboard.shared.GboardFieldTarget
import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.mutableClass

/** Reviewed target shape. No editor policy belongs in this version adapter. */
internal object GboardEditingAccessPointsTargets {
    private const val OWNER = "Lafae;"
    val startView = lifecycle("onStartInputView", "Landroid/view/inputmethod/EditorInfo;", "Z")
    val resetMethods = listOf(
        startView,
        lifecycle("onStartInput", "Landroid/view/inputmethod/EditorInfo;", "Z"),
        lifecycle("onFinishInputView", "Z"),
        lifecycle("onFinishInput"),
        lifecycle("onWindowHidden"),
        lifecycle("onDestroy"),
    )
    private fun lifecycle(name: String, vararg parameters: String) =
        GboardMethodTarget(OWNER, name, parameters.toList(), "V")

    private val descriptorMethods = listOf(
        // 18.8.0: AccessPoint.m() is the static factory and returns the abstract builder;
        // the concrete AutoValue builder (Laaej) keeps q(String)/l(I)/field d:a(), while the
        // click action setter moved to the base class as v(Runnable).
        GboardMethodTarget("Laadr;", "m", emptyList(), "Laadm;") to true,
        GboardMethodTarget("Laaej;", "q", listOf("Ljava/lang/String;"), "V") to false,
        GboardMethodTarget("Laaej;", "l", listOf("I"), "V") to false,
        GboardMethodTarget("Laadm;", "v", listOf("Ljava/lang/Runnable;"), "V") to false,
        GboardMethodTarget("Laaej;", "a", emptyList(), "Laadr;") to false,
        GboardMethodTarget("Laajh;", "g", listOf("Laadr;", "Z"), "V") to false,
        GboardMethodTarget("Lauco;", "n", listOf("Ljava/util/Collection;"), "Lauco;") to true,
    )

    fun validate(context: BytecodePatchContext) {
        var owner: String? = OWNER
        val seen = mutableSetOf<String>()
        while (owner != null && owner != "Landroid/inputmethodservice/InputMethodService;" &&
            seen.add(owner)) {
            owner = context.mutableClass(owner).superclass
        }
        check(owner == "Landroid/inputmethodservice/InputMethodService;") {
            "Editing buttons lifecycle owner must extend InputMethodService"
        }
        (descriptorMethods + resetMethods.map { it to false }).forEach { (target, isStatic) ->
            val method = target.resolve(context)
            check(AccessFlags.STATIC.isSet(method.accessFlags) == isStatic) {
                "Unexpected static shape: ${target.reference}"
            }
            check(method.implementation != null) { "Missing body: ${target.reference}" }
        }
        listOf("d").forEach { name ->
            val field = GboardFieldTarget("Laaej;", name, "Ljava/lang/String;").resolve(context)
            check(!AccessFlags.STATIC.isSet(field.accessFlags)) { "Unexpected builder field: $name" }
        }
    }
}
