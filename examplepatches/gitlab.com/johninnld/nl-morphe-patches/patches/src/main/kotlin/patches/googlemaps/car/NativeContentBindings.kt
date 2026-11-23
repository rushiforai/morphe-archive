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
    // 26.47: the windows are qfp/qdu, the row interfaces qfa/qdo, the row item qfb, the footer qdv,
    // and the three row binders implement Lbhuq; with a(Lbhui;)Object.
    if (classBy("Lqeh;").interfaces.contains("Lbhuq;")) {
        for (owner in listOf("Lqeh;", "Lpyg;", "Lqeu;")) {
            check(classBy(owner).methods.count {
                it.name == "a" && it.parameterTypes.map(CharSequence::toString) == listOf("Lbhui;") &&
                    it.returnType == "Ljava/lang/Object;"
            } == 1) { "Maps native content binder changed: $owner" }
        }
        field("Lqfp;", "b", "Lbhsn;")
        field("Lqfp;", "d", "Landroid/content/Context;")
        field("Lqdu;", "b", "Lbhsn;")
        field("Lqdu;", "p", "Landroid/content/Context;")
        method("Lqdo;", "c", emptyList(), "Lcom/google/common/collect/ImmutableList;")
        method("Lqfb;", "h", emptyList(), "Ljava/lang/String;")
        return
    }
    // Owner resolution: the car window that produced the recents (qdf) and search (qbn) models.
    field(if (classBy("Lqeh;").interfaces.contains("Lbhuq;")) "Lqfp;" else "Lqdf;", "b", if (classBy("Lqeh;").interfaces.contains("Lbhuq;")) "Lbhsn;" else "Lbhfu;")
    field(if (classBy("Lqeh;").interfaces.contains("Lbhuq;")) "Lqfp;" else "Lqdf;", "c", "Landroid/content/Context;")
    field(if (classBy("Lqeh;").interfaces.contains("Lbhuq;")) "Lqdu;" else "Lqbn;", "b", if (classBy("Lqeh;").interfaces.contains("Lbhuq;")) "Lbhsn;" else "Lbhfu;")
    field("Lqdu;", "p", "Landroid/content/Context;")
    method("Lqcq;", "d", emptyList(), "Lcom/google/common/collect/ImmutableList;")
    method("Lqbh;", "c", emptyList(), "Lcom/google/common/collect/ImmutableList;")
    method("Lqbh;", "b", emptyList(), "Lbhui;")
    for (name in listOf("g", "h", "i")) method("Lqcr;", name, emptyList(), "Ljava/lang/String;")
    method("Lqcr;", "j", emptyList(), "V")
    field("Lqdr;", "a", "Lqcx;")
    for (name in listOf("d", "e")) method("Lqcx;", name, emptyList(), "Ljava/lang/CharSequence;")
    field("Lqdv;", "a", "Ljava/lang/CharSequence;")
    method("Lpqg;", "<init>", listOf("I"), "V")
    method("Lpqg;", "accept", listOf("Ljava/lang/Object;"), "V")
    for (owner in listOf("Lqca;", "Lpyg;", "Lokg;")) method(owner, "a", listOf("Lbhui;"), "Ljava/lang/Object;")
}

internal fun bindMapsNativeContent(
    classBy: (String) -> ClassDef,
    mutableMethod: (String, String, List<String>, String) -> MutableMethod,
) {
    validateMapsNativeContent(classBy)
    val binders = if (classBy("Lqeh;").interfaces.contains("Lbhuq;")) listOf("Lqeh;", "Lpyg;", "Lqeu;")
        else listOf("Lqca;", "Lpyg;", "Lokg;")
    val rowType = if (classBy("Lqeh;").interfaces.contains("Lbhuq;")) "Lbhui;" else "Lbhhr;"
    for (owner in binders) {
        mutableMethod(owner, "a", listOf(rowType), "Ljava/lang/Object;")
            .addInstructions(0, "invoke-static/range {p1 .. p1}, $CONTENT->capture(Ljava/lang/Object;)V")
    }
}
