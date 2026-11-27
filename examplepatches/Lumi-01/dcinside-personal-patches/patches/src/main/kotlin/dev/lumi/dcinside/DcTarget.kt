package dev.lumi.dcinside

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue

internal fun BytecodePatchContext.dcTarget(): DcTarget {
    fun hasConfig(type: String) = classDefByOrNull(type)?.methods?.any {
        it.name == "C0" && it.parameterTypes.isEmpty() && it.returnType == "Z"
    } == true
    return when {
        hasConfig("Lcom/dcinside/app/util/cs;") -> DcTarget(true, true)
        hasConfig("Lcom/dcinside/app/util/Ur;") -> DcTarget(true, false)
        hasConfig("Lcom/dcinside/app/util/Rr;") -> DcTarget(false, false)
        else -> error("DC 광고 설정 코드 구조를 찾지 못했습니다. 앱 코드에 맞는 패치 갱신이 필요합니다.")
    }
}

/** Resolve response fields by their serialized meaning, including renamed getter methods. */
internal fun ClassDef.stringGetters(jsonName: String): Set<String> {
    val getters = stringGetterCandidates(jsonName)
    check(getters.isNotEmpty()) { "작성자 정보 필드 구조가 변경됐습니다: $type / $jsonName" }
    return getters
}

internal fun ClassDef.stringGettersOrNull(jsonName: String): Set<String>? =
    stringGetterCandidates(jsonName).ifEmpty { null }

private fun ClassDef.stringGetterCandidates(jsonName: String): Set<String> {
    val matchingFields = fields.filter { field -> field.type == "Ljava/lang/String;" && field.annotations.any { annotation ->
        // The app's 5.3.27 R8 build renames Gson's SerializedName annotation
        // class to a package-private name. Its serialized `value` stays intact.
        annotation.elements.any {
            it.name == "value" && (it.value as? StringEncodedValue)?.value == jsonName
        }
    } }.map { "$type->${it.name}:${it.type}" }.toSet()
    val getters = methods.filter { method ->
        method.parameterTypes.isEmpty() && method.returnType == "Ljava/lang/String;" &&
            method.implementation?.instructions?.toList()?.let { instructions ->
                instructions.size == 2 && instructions[0].opcode == com.android.tools.smali.dexlib2.Opcode.IGET_OBJECT &&
                    instructions[1].opcode == com.android.tools.smali.dexlib2.Opcode.RETURN_OBJECT &&
                    (instructions[0] as? ReferenceInstruction)?.reference.toString() in matchingFields
            } == true
    }.map { it.name }.toSet()
    return getters
}

/** Verified names for the supplied official APKs, not a guess for future releases. */
internal class DcTarget(val modern: Boolean, val latest: Boolean) {
    // Unknown versions may attempt the reviewed current profile. Bytecode is
    // checked against its instruction hashes before a matching method is edited.

    companion object {
        private val reviewed by lazy {
            java.util.Properties().apply {
                DcTarget::class.java.getResourceAsStream("/dcinside/reviewed-methods.properties")
                    ?.use { load(it) } ?: error("Reviewed instruction hashes missing")
            }
        }
        private val reviewedLatest by lazy {
            java.util.Properties().apply {
                DcTarget::class.java.getResourceAsStream("/dcinside/reviewed-methods-521.properties")
                    ?.use { load(it) } ?: error("Current reviewed instruction hashes missing")
            }
        }
    }
    private val classes = mapOf(
        "Lcom/dcinside/app/util/Rr;" to "Lcom/dcinside/app/util/Ur;",
        "Lcom/dcinside/app/util/ms;" to "Lcom/dcinside/app/util/ps;",
        "Lcom/dcinside/app/wv/a;" to "Lcom/dcinside/app/wv/c;",
        "Lcom/dcinside/app/wv/l;" to "Lcom/dcinside/app/wv/n;",
        "Lcom/dcinside/app/wv/r;" to "Lcom/dcinside/app/wv/t;",
        "Lcom/dcinside/app/ad/support/J;" to "Lcom/dcinside/app/ad/support/E;",
        "Lcom/dcinside/app/main/A0;" to "Lcom/dcinside/app/main/D0;",
        "Lcom/dcinside/app/main/E1;" to "Lcom/dcinside/app/main/H1;",
        "LW3/o;" to "LN3/o;", "LF/a\$a;" to "LB/a\$a;", "LF/d;" to "LB/d;",
        "LO/N7;" to "LK/L7;",
    )
    private val methods = mapOf(
        "com/dcinside/app/main/adapter/f:Z" to "G0",
        "com/dcinside/app/post/X2:onBindViewHolder" to "Y",
        "com/dcinside/app/post/X2:a0" to "H0",
        "com/dcinside/app/post/X2:s0" to "Z0",
        "com/dcinside/app/post/fragments/u0:h0" to "O0",
        "com/dcinside/app/post/fragments/u0:i0" to "P0",
        "com/dcinside/app/post/fragments/E2:k" to "c0",
        "com/dcinside/app/post/fragments/z3:A2" to "y2",
        "com/dcinside/app/post/fragments/z3:x0" to "q0",
        "com/dcinside/app/post/fragments/w2:f5" to "d5",
        "com/dcinside/app/view/f0:x0" to "q0",
        "com/dcinside/app/view/f0:t1" to "l1",
        "com/dcinside/app/view/f0:v1" to "o1",
        "com/dcinside/app/ad/naver/c:k" to "c0",
        "com/dcinside/app/ad/naver/e:i" to "a0",
        "com/dcinside/app/ad/support/a:b" to "c",
        "com/dcinside/app/main/A0:F2" to "K2",
        "com/dcinside/app/response/PostItem:z" to "y",
    )
    private val fields = mapOf(
        "Lcom/dcinside/app/view/f0;->I:LO/N7;" to "Lcom/dcinside/app/view/f0;->D9:LK/L7;",
        "Lcom/dcinside/app/post/fragments/E2;->g:Landroid/widget/FrameLayout;" to
            "Lcom/dcinside/app/post/fragments/E2;->F9:Landroid/widget/FrameLayout;",
        "Lcom/dcinside/app/post/fragments/E2;->h:Landroid/view/View;" to
            "Lcom/dcinside/app/post/fragments/E2;->G9:Landroid/view/View;",
        "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;->itemView:Landroid/view/View;" to
            "Landroidx/recyclerview/widget/RecyclerView\$ViewHolder;->a:Landroid/view/View;",
    )

    private val latestClasses = mapOf(
        "Lcom/dcinside/app/util/Ur;" to "Lcom/dcinside/app/util/cs;",
        "Lcom/dcinside/app/util/ps;" to "Lcom/dcinside/app/util/xs;",
        "Lcom/dcinside/app/settings/K1;" to "Lcom/dcinside/app/settings/U1;",
        "Lcom/dcinside/app/ad/support/E;" to "Lcom/dcinside/app/ad/support/F;",
        "LN3/o;" to "LF4/o;", "LK/L7;" to "LK/O7;",
    )
    private val latestNames = mapOf(
        "com/dcinside/app/main/adapter/f:G0" to "Y",
        "com/dcinside/app/post/X2:Y" to "onBindViewHolder",
        "com/dcinside/app/post/X2:H0" to "Z",
        "com/dcinside/app/post/X2:Z0" to "s0",
        "com/dcinside/app/post/fragments/u0:O0" to "g0",
        "com/dcinside/app/post/fragments/u0:P0" to "h0",
        "com/dcinside/app/post/fragments/E2:c0" to "l",
        "com/dcinside/app/post/fragments/z3:F2" to "P2",
        "com/dcinside/app/post/fragments/z3:y2" to "K2",
        "com/dcinside/app/post/fragments/z3:q0" to "I0",
        "com/dcinside/app/post/fragments/w2:d5" to "n5",
        "com/dcinside/app/view/f0:q0" to "I0",
        "com/dcinside/app/view/f0:l1" to "K0",
        "com/dcinside/app/view/f0:o1" to "N0",
        "com/dcinside/app/ad/naver/c:c0" to "k",
        "com/dcinside/app/ad/naver/e:a0" to "i",
        "com/dcinside/app/main/A0:K2" to "U2",
    )
    fun type(type: String): String {
        val mapped = if (modern) classes[type] ?: type else type
        return if (latest) latestClasses[mapped] ?: mapped else mapped
    }
    fun name(owner: String, name: String): String {
        val key = owner.removePrefix("L").removeSuffix(";")
        val mapped = if (modern) methods["$key:$name"] ?: name else name
        return if (latest) latestNames["$key:$mapped"] ?: mapped else mapped
    }
    fun smali(code: String): String {
        if (!modern) return code
        var updated = code
        fields.forEach { (old, new) -> updated = updated.replace(old, new) }
        classes.forEach { (old, new) -> updated = updated.replace(old, new) }
        if (latest) {
            updated = updated.replace("Lcom/dcinside/app/view/f0;->D9:LK/L7;", "Lcom/dcinside/app/view/f0;->W:LK/L7;")
                .replace("Lcom/dcinside/app/post/fragments/E2;->F9:", "Lcom/dcinside/app/post/fragments/E2;->a0:")
                .replace("Lcom/dcinside/app/post/fragments/E2;->G9:", "Lcom/dcinside/app/post/fragments/E2;->b0:")
            latestClasses.forEach { (old, new) -> updated = updated.replace(old, new) }
        }
        return updated
    }
    val pageLabelId get() = if (latest) 0x7f150942 else if (modern) 0x7f15082f else 0x7f150843

    fun fingerprint(definingClass: String, name: String, parameters: List<String>? = null,
                    returnType: String? = null): Fingerprint = Fingerprint(
        definingClass = type(definingClass), name = this.name(definingClass, name),
        parameters = parameters?.map(::type), returnType = returnType?.let(::type),
        custom = { method, _ ->
            !modern || (if (latest) reviewedLatest else reviewed).getProperty(MethodShape.key(method)) == MethodShape.digest(method)
        },
    )
}
