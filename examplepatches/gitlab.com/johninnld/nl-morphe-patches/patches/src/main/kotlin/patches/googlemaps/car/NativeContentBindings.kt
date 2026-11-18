package org.ungoogled.patches.maps.car

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.ClassDef

private const val CONTENT = "Lpatches/maps/gearslip/NativeCarContent;"

/**
 * Guard the native recents and search-result models that the host keyboard's rows read,
 * and their genuine row callbacks, independently of visible row count.
 */
internal fun validateMapsNativeContent(classBy: (String) -> ClassDef) {
    fun field(owner: String, name: String, type: String) {
        check(classBy(owner).fields.count { it.name == name && it.type == type } == 1) { "Maps native content field changed: $owner->$name" }
    }
    fun method(owner: String, name: String, parameters: List<String>, result: String) {
        check(classBy(owner).methods.count { it.name == name && it.parameterTypes.map(CharSequence::toString) == parameters && it.returnType == result } == 1) { "Maps native content method changed: $owner->$name" }
    }
    // Owner resolution: the car window that produced the recents (qdf) and search (qbn) models.
    field("Lqdf;", "b", "Lbhfu;")
    field("Lqdf;", "c", "Landroid/content/Context;")
    field("Lqbn;", "b", "Lbhfu;")
    field("Lqbn;", "p", "Landroid/content/Context;")
    method("Lqcq;", "d", emptyList(), "Lcom/google/common/collect/ImmutableList;")
    method("Lqbh;", "c", emptyList(), "Lcom/google/common/collect/ImmutableList;")
    method("Lqbh;", "b", emptyList(), "Lbhhr;")
    for (name in listOf("g", "h", "i")) method("Lqcr;", name, emptyList(), "Ljava/lang/String;")
    method("Lqcr;", "j", emptyList(), "V")
    field("Lqbj;", "a", "Lqaq;")
    for (name in listOf("d", "e")) method("Lqaq;", name, emptyList(), "Ljava/lang/CharSequence;")
    field("Lqbo;", "a", "Ljava/lang/CharSequence;")
    method("Lpoe;", "<init>", listOf("I"), "V")
    method("Lpoe;", "accept", listOf("Ljava/lang/Object;"), "V")
    for (owner in listOf("Lqca;", "Lqbc;", "Lsnk;")) method(owner, "a", listOf("Lbhhr;"), "Ljava/lang/Object;")
}

internal fun bindMapsNativeContent(
    classBy: (String) -> ClassDef,
    mutableMethod: (String, String, List<String>, String) -> MutableMethod,
) {
    validateMapsNativeContent(classBy)
    for (owner in listOf("Lqca;", "Lqbc;", "Lsnk;")) {
        mutableMethod(owner, "a", listOf("Lbhhr;"), "Ljava/lang/Object;")
            .addInstructions(0, "invoke-static/range {p1 .. p1}, $CONTENT->capture(Ljava/lang/Object;)V")
    }
}
