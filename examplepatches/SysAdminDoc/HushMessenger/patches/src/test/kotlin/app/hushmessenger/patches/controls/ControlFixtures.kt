package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue

internal fun fixtureMethod(
    id: String,
    body: String,
    registers: Int = 8,
    flags: Int = AccessFlags.PUBLIC.value,
): MutableMethod {
    val owner = id.substringBefore("->")
    val name = id.substringAfter("->").substringBefore('(')
    val parameters = Regex("\\[*(?:L[^;]+;|[ZBSCIJFD])").findAll(id.substringAfter('(').substringBefore(')'))
        .map { ImmutableMethodParameter(it.value, null, null) }.toList()
    return MutableMethod(ImmutableMethod(owner, name, parameters, id.substringAfter(')'), flags,
        null, null, ImmutableMethodImplementation(registers, emptyList(), null, null)))
        .apply { addInstructionsWithLabels(0, body) }
}

internal fun fixtureClass(
    type: String,
    methods: List<Method> = emptyList(),
    originalName: String? = null,
    interfaces: List<String> = emptyList(),
): MutableClass {
    val fields = originalName?.let {
        listOf(ImmutableField(type, "__redex_internal_original_name", "Ljava/lang/String;",
            AccessFlags.STATIC.value, ImmutableStringEncodedValue(it), null, null))
    }.orEmpty()
    return MutableClass(ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;",
        interfaces, null, emptySet(), fields, methods))
}

internal const val PEOPLE_JEWEL_HOOK = "LX/HAR;->A01(LX/HAR;)Z"

/** Instructions 0-20 match both supported APKs; one instruction stands in for the list reset. */
internal fun peopleJewelMethod(
    key: String = "LX/JTx;->A01:LX/1BL;",
    resultRegister: String = "v0",
    serverFlag: String = "72344235860374863L",
    serverTarget: String = ":shown",
    flags: Int = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
) = fixtureMethod(PEOPLE_JEWEL_HOOK, """
    iget-object v0, p0, LX/HAR;->A07:LX/17Z;
    invoke-static {v0}, LX/17Z;->A0F(LX/17Z;)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, LX/JTx;
    iget-object v2, p0, LX/HAR;->A01:Lcom/facebook/auth/usersession/FbUserSession;
    iget-object v0, v0, LX/JTx;->A00:LX/17Z;
    invoke-static {v0}, LX/17Z;->A0C(LX/17Z;)Lcom/facebook/prefs/shared/FbSharedPreferences;
    move-result-object v1
    sget-object v0, $key
    const/4 v4, 0x0
    invoke-interface {v1, v0, v4}, $PREFERENCE_GETTER
    move-result $resultRegister
    if-eqz v0, :shown
    iget-object v0, p0, LX/HAR;->A06:LX/17Z;
    invoke-static {v0}, LX/17Z;->A0I(LX/17Z;)V
    invoke-static {v2, v4}, LX/1Aa;->A07(Ljava/lang/Object;I)LX/4nI;
    move-result-object v2
    const-wide v0, $serverFlag
    invoke-static {v2, v0, v1}, LX/16z;->A1Z(Ljava/lang/Object;J)Z
    move-result v0
    if-nez v0, $serverTarget
    iget-object v3, p0, LX/HAR;->A0F:LX/WZw;
    :hidden
    const/4 v0, 0x1
    return v0
    :shown
    return v4
""".trimIndent(), registers = 6, flags = flags)

internal fun peopleJewelKeyHolder() = fixtureClass("LX/JTx;", listOf(fixtureMethod("LX/JTx;-><clinit>()V", """
    const-string v0, "pymk_jewel_section_hidden"
    sput-object v0, LX/JTx;->A01:LX/1BL;
    return-void
""".trimIndent(), flags = AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value)))

internal fun debugDumperFixture(
    textGetter: String = "BWn",
    idGetter: String = "B9c",
    unsentGetter: String = "Btc",
    itemType: String = "Lfixture/KKn;",
): MutableClass {
    val method = fixtureMethod("Lfixture/Dumper;->A02(Lfixture/MessageRow;)Ljava/lang/String;", """
        invoke-interface {p1}, $itemType->$unsentGetter()Z
        move-result v0
        const-string v0, "is_unsent="
        invoke-static {v0, v1, v2}, Lfixture/Helper;->A09(Ljava/lang/String;Ljava/util/AbstractCollection;Z)V
        invoke-interface {p1}, $itemType->$idGetter()Ljava/lang/String;
        move-result-object v0
        if-eqz v0, :skip_id
        const-string v0, "message_id="
        invoke-static {v0, v1, v2}, Lfixture/Helper;->A1V(Ljava/lang/String;Ljava/lang/String;Ljava/util/AbstractCollection;)V
        :skip_id
        invoke-interface {p1}, $itemType->$textGetter()Ljava/lang/String;
        move-result-object v0
        if-eqz v0, :skip_text
        const-string v0, "text="
        invoke-static {v0, v1, v2}, Lfixture/Helper;->A1V(Ljava/lang/String;Ljava/lang/String;Ljava/util/AbstractCollection;)V
        :skip_text
        return-object v1
    """.trimIndent(), registers = 4)
    return fixtureClass("Lfixture/Dumper;", listOf(method))
}

internal fun messageWrapperFixture(
    type: String = "Lfixture/MessageWrapper;",
    interfaceType: String = "Lfixture/MessageRow;",
    textGetter: String = "BWo",
    idGetter: String = "B9d",
    unsentGetter: String = "Btd",
): MutableClass {
    val bwoMethod = fixtureMethod("$type->$textGetter(I)Ljava/lang/String;", """
        invoke-static {p0, p1}, $type->A00(${type}I)Lfixture/KKn;
        move-result-object v0
        invoke-interface {v0}, Lfixture/KKn;->BWn()Ljava/lang/String;
        move-result-object v0
        return-object v0
    """.trimIndent(), registers = 3)
    val b9dMethod = fixtureMethod("$type->$idGetter(I)Ljava/lang/String;", """
        invoke-static {p0, p1}, $type->A00(${type}I)Lfixture/KKn;
        move-result-object v0
        invoke-interface {v0}, Lfixture/KKn;->B9c()Ljava/lang/String;
        move-result-object v0
        return-object v0
    """.trimIndent(), registers = 3)
    val btdMethod = fixtureMethod("$type->$unsentGetter(I)Z", """
        invoke-static {p0, p1}, $type->A00(${type}I)Lfixture/KKn;
        move-result-object v0
        invoke-interface {v0}, Lfixture/KKn;->Btc()Z
        move-result v0
        return v0
    """.trimIndent(), registers = 3)
    val getCountMethod = fixtureMethod("$type->getCount()I", """
        iget-object v0, p0, $type->A00:Ljava/util/List;
        invoke-interface {v0}, Ljava/util/List;->size()I
        move-result v0
        return v0
    """.trimIndent(), registers = 2)
    val fields = listOf(ImmutableField(type, "A00", "Ljava/util/List;", 0, null, null, null))
    return MutableClass(ImmutableClassDef(type,
        AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value,
        "Ljava/lang/Object;", listOf(interfaceType), null, emptySet(), fields,
        listOf(bwoMethod, b9dMethod, btdMethod, getCountMethod)))
}

internal fun pluginBody(anchor: String, branch: String = "if-eq") = """
    iget-object v0, p0, Lfixture/Gate;->cache:Ljava/lang/Object;
    const/4 v6, 0x1
    const/4 v5, 0x0
    const-string v2, "$anchor"
    iget-object v1, p0, Lfixture/Gate;->cache:Ljava/lang/Object;
    sget-object v0, LX/1dj;->A03:Ljava/lang/Object;
    $branch v1, v0, :disabled
    return v6
    :disabled
    return v5
""".trimIndent()
