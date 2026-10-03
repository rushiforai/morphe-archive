package app.hushmessenger.patches.controls

import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Field
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

internal data class DrawerFixtureMapping(
    val provider: String, val getter: String, val row: String, val section: String,
    val dispatcher: String, val iconBase: String, val icon: String, val glyph: String, val enums: String,
)

private fun drawerMapping(refreshOwner: String) = when (refreshOwner) {
    "LX/9rv;" -> DrawerFixtureMapping("LX/CTJ;", "Ax4", "LX/HRf;", "LX/HRe;", "LX/Cfq;", "LX/Imx;", "LX/HNS;", "LX/1hJ;", "LX/0R2;")
    "LX/9rb;" -> DrawerFixtureMapping("LX/CTF;", "Ax5", "LX/HR8;", "LX/HR7;", "LX/Cfj;", "LX/ImP;", "LX/HMw;", "LX/1hJ;", "LX/0R2;")
    "LX/9qQ;" -> DrawerFixtureMapping("LX/CPF;", "Ax6", "LX/HMx;", "LX/HNC;", "LX/HMg;", "LX/Ii7;", "LX/HKF;", "LX/1hI;", "LX/0R2;")
    "LX/9se;" -> DrawerFixtureMapping("LX/CQz;", "Ax3", "LX/HWZ;", "LX/HXQ;", "LX/HUQ;", "LX/IfE;", "LX/HU5;", "LX/1hI;", "LX/0R2;")
    "LX/9uD;" -> DrawerFixtureMapping("LX/CTI;", "AxF", "LX/HLj;", "LX/HLn;", "LX/HKb;", "LX/IgS;", "LX/HJn;", "LX/1iE;", "LX/0R7;")
    else -> error("Unrecorded drawer mapping: $refreshOwner")
}

internal data class LegacyDrawerFixture(val classes: List<MutableClass>, val mapping: DrawerFixtureMapping) {
    val methods get() = classes.flatMap { it.methods }
    fun method(id: String): MutableMethod = methods.single { it.hookId() == id }
    fun resolve(type: String) = classes.singleOrNull { it.type == type }
}

private val PUBLIC_STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
private val PUBLIC_CONSTRUCTOR = AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value
private const val FIXTURE_CONTEXT = "Landroid/content/Context;"
private const val FIXTURE_LIST = "Ljava/util/List;"
private const val FIXTURE_STRING = "Ljava/lang/String;"
private const val FIXTURE_INTEGER = "Ljava/lang/Integer;"
private const val FIXTURE_COLOR = "Lfixture/DrawerColor;"
private const val FIXTURE_COLOR_TYPE = "Lfixture/Color;"

private fun drawerField(owner: String, name: String, type: String, static: Boolean = false): Field =
    ImmutableField(owner, name, type, AccessFlags.PUBLIC.value or if (static) AccessFlags.STATIC.value else 0, null, null, null)

/** Native constructor field order and null checks; fixtures carry no account objects or message snippets. */
private fun drawerConstructor(owner: String, params: List<String>, names: List<String>, checked: Set<Int>, broken: String = "") =
    fixtureMethod("$owner-><init>(${params.joinToString("")})V", buildString {
        checked.forEach { slot ->
            appendLine("const/4 v0, 0x0")
            appendLine("invoke-static {p${slot + 1}, v0}, Lfixture/Checks;->required(Ljava/lang/Object;I)V")
        }
        appendLine("invoke-direct {p0}, Ljava/lang/Object;-><init>()V")
        names.forEachIndexed { slot, name ->
            val parameter = if (broken == name) "p0" else "p${slot + 1}"
            appendLine("${if (params[slot] == "Z") "iput-boolean" else "iput-object"} $parameter, p0, $owner->$name:${params[slot]}")
        }
        append("return-void")
    }, registers = params.size + 2, flags = PUBLIC_CONSTRUCTOR)

/** All five menu targets plus only the native contracts the new factory needs. */
internal fun legacyDrawerFixture(profile: ControlProfile, broken: String = "none"): LegacyDrawerFixture {
    val ids = profile.hooks.getValue("menu_settings")
    val refresh = ids.single { it.endsWith("->A1i()V") }
    val owner = refresh.substringBefore("->")
    val model = drawerMapping(owner)
    val binder = ids.single { it.contains(";I)V") }.substringBefore("->")
    val rowParams = listOf(FIXTURE_CONTEXT, model.dispatcher, model.iconBase, DRAWER_KEY, DRAWER_METADATA,
        FIXTURE_INTEGER, FIXTURE_STRING, FIXTURE_LIST)
    val sectionParams = listOf("Landroid/view/View\$OnClickListener;", FIXTURE_INTEGER, FIXTURE_INTEGER,
        FIXTURE_STRING, FIXTURE_STRING, FIXTURE_STRING, FIXTURE_LIST, "Z")
    val rowNames = (0..7).map { "A0$it" }
    val sectionNames = listOf("A00", "A02", "A01", "A05", "A03", "A04", "A06", "A07")
    val iconFactory = "${model.icon}->A00(${model.glyph})${model.icon}"
    val menuMethods = ids.map { id ->
        val kind = when {
            id == refresh -> "refresh"
            id.endsWith("Ljava/util/ArrayList;") -> "add"
            id.contains(FIXTURE_LIST) -> "drawer"
            id.contains("onClick") -> "click"
            else -> "bind"
        }
        val body = when (kind) {
            "add" -> """
                const-string v0, "settingsfolder.folderitem.SettingsFolderItem"
                ${if (broken == "add") "throw v0" else "nop"}
                const/4 v1, 0x0
                const/4 v2, 0x0
                sget-object v3, ${model.glyph}->${if (broken == "glyph") "A67" else "A68"}:${model.glyph}
                invoke-static {v3}, $iconFactory
                move-result-object ${if (broken == "icon-origin") "v2" else "v3"}
                sget-object v4, $SETTINGS_KEY->A00:$SETTINGS_KEY
                const/4 v5, 0x0
                const/4 v6, 0x0
                const-string v7, "Settings"
                const/4 v8, 0x0
                new-instance v0, ${model.row}
                invoke-direct/range {v0 .. v8}, ${model.row}-><init>(${rowParams.joinToString("")})V
                const/4 v0, 0x0
                return-object v0
            """.trimIndent()
            "bind" -> "const-string v0, \"Unknown ViewHolder\"\n" + if (broken == "bind") "throw v0" else "return-void"
            "drawer" -> "new-instance v0, $binder\nreturn-void"
            "click" -> """
                ${if (broken == "click-late-branch") "check-cast v1, ${model.row}\n" + "nop\n".repeat(12) + "if-nez p1, :native" else ""}
                check-cast v1, ${if (broken == "click") "LX/WrongRow;" else model.row}
                ${if (broken == "click-branch") "if-eqz v1, :selected\n:selected" else "nop"}
                const-string v0, "$DRAWER_FOLDER_SELECTED"
                :native
                ${if (broken == "click-late-branch") "iget-object v0, v1, ${model.row}->A03:$DRAWER_KEY" else ""}
                return-void
            """.trimIndent()
            else -> """
                const-string v1, "$DRAWER_REFRESH"
                ${if (broken == "refresh-incoming") "if-eqz v1, :store" else "nop"}
                invoke-interface {v0}, ${model.provider}->${model.getter}()Ljava/util/ArrayList;
                move-result-object ${if (broken == "refresh-result") "v1" else "v0"}
                :store
                iput-object v0, ${if (broken == "refresh-owner") "v6" else "p0"}, $owner->A0G:Ljava/util/List;
                ${if (broken == "refresh-duplicate") "iput-object v0, p0, $owner->A0G:Ljava/util/List;" else "nop"}
                return-void
            """.trimIndent()
        }
        val registers = when {
            kind == "add" -> 11
            broken == "bind-registers" && kind == "bind" -> 2
            broken == "drawer-registers" && kind == "drawer" -> 1
            broken == "drawer" && kind == "drawer" -> 300
            broken == "refresh-registers" && kind == "refresh" -> 17
            else -> 8
        }
        val source = if (broken == "add" && kind == "add") "const-string v0, \"settingsfolder.folderitem.SettingsFolderItem\"\nthrow v0" else body
        val method = fixtureMethod(id, source, registers = maxOf(registers, 8))
        if (registers >= 8) method else MutableMethod(ImmutableMethod(method.definingClass, method.name,
            method.parameters, method.returnType, method.accessFlags, null, null,
            ImmutableMethodImplementation(registers, method.implementation!!.instructions, null, null)))
    }
    val providerMethod = ImmutableMethod(model.provider, model.getter, emptyList(), "Ljava/util/ArrayList;",
        AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value, null, null, null)
    val rowFields = rowNames.mapIndexed { slot, name ->
        drawerField(model.row, name, if (broken == "row-field" && name == "A06") "Ljava/lang/Object;" else rowParams[slot])
    }
    val sectionSource = fixtureMethod("$SETTINGS_SECTION->A00()${model.section}", """
        sget-object v2, ${model.enums}->${if (broken == "section-kind") "A1Q" else "A1P"}:Ljava/lang/Integer;
        sget-object v3, ${model.enums}->A01:Ljava/lang/Integer;
        const/4 v1, 0x0
        const/4 v4, 0x0
        const/4 v5, 0x0
        const/4 v6, 0x0
        invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
        move-result-object v7
        const/4 v8, 0x0
        ${if (broken == "section-branch") "if-eqz v7, :construct" else "nop"}
        new-instance v0, ${model.section}
        :construct
        invoke-direct/range {v0 .. v8}, ${model.section}-><init>(${sectionParams.joinToString("")})V
        return-object v0
    """.trimIndent(), 10)
    val iconFactoryMethod = fixtureMethod(iconFactory, """
        sget-object v1, $FIXTURE_COLOR->A0A:$FIXTURE_COLOR
        ${if (broken == "icon-shared") "sget-object v0, ${model.icon}->shared:${model.icon}" else "new-instance v0, ${model.icon}"}
        invoke-direct {v0, p0, v1}, ${model.icon}-><init>(${model.glyph}$FIXTURE_COLOR_TYPE)V
        return-object ${if (broken == "icon-return") "v1" else "v0"}
    """.trimIndent(), 3, PUBLIC_STATIC)
    val keyCtor = fixtureMethod("$SETTINGS_KEY-><init>()V", """
        const-string v0, "Settings"
        invoke-direct {p0, v0}, $DRAWER_KEY-><init>(Ljava/lang/String;)V
        return-void
    """.trimIndent(), 2, if (broken == "key-constructor") AccessFlags.PRIVATE.value or AccessFlags.CONSTRUCTOR.value else PUBLIC_CONSTRUCTOR)
    val extension = fixtureClass(SETTINGS, listOf(
        fixtureMethod(LEGACY_SECTION, if (broken == "factory") "const/4 v0, 0x1\nreturn-object v0" else "const/4 v0, 0x0\nreturn-object v0", 1, PUBLIC_STATIC),
        fixtureMethod(LEGACY_KEY_CACHE, "return-object p0", if (broken == "cache-helper") 2 else 1,
            if (broken == "cache-helper") AccessFlags.PUBLIC.value else PUBLIC_STATIC),
        fixtureMethod(LEGACY_DRAWER_ADD, "return-object p1", 2, if (broken == "append-helper") AccessFlags.PRIVATE.value or AccessFlags.STATIC.value else PUBLIC_STATIC),
    ))
    fun allocatedFlags(kind: String) = AccessFlags.PUBLIC.value or
        if (broken == "$kind-abstract") AccessFlags.ABSTRACT.value else
            if (broken == "$kind-interface") AccessFlags.INTERFACE.value or AccessFlags.ABSTRACT.value else 0
    val classes = menuMethods.groupBy { it.definingClass }.map { (type, methods) ->
        fixtureClass(type, methods, superclass = if (type == owner) "Landroidx/fragment/app/Fragment;" else "Ljava/lang/Object;",
            extraFields = if (type == owner) listOf(drawerField(owner, "A0G", FIXTURE_LIST)) else emptyList())
    } + screenHostClasses() + listOf(
        extension,
        fixtureClass("Lfixture/Checks;", if (broken == "check-missing") emptyList() else listOf(fixtureMethod(
            "Lfixture/Checks;->required(Ljava/lang/Object;I)V", if (broken == "check-side-effect") """
                check-cast p0, Ljava/util/List;
                invoke-interface {p0}, Ljava/util/List;->clear()V
                return-void
            """.trimIndent() else """
                if-nez ${if (broken == "check-parameter") "p1" else "p0"}, :present
                new-instance p0, Ljava/lang/NullPointerException;
                invoke-direct {p0}, Ljava/lang/NullPointerException;-><init>()V
                throw p0
                :present
                ${if (broken == "check-target") "invoke-interface {p0}, Ljava/util/List;->clear()V" else ""}
                return-void
            """.trimIndent(), 2, if (broken == "check-access") AccessFlags.PRIVATE.value or AccessFlags.STATIC.value else PUBLIC_STATIC))),
        fixtureClass("Landroidx/fragment/app/Fragment;", listOf(fixtureMethod(
            "Landroidx/fragment/app/Fragment;->getContext()$FIXTURE_CONTEXT", "const/4 v0, 0x0\nreturn-object v0", 1,
            if (broken == "fragment") AccessFlags.PRIVATE.value else AccessFlags.PUBLIC.value))),
        fixtureClass(model.provider, listOf(providerMethod), flags = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value or
            if (broken == "provider") 0 else AccessFlags.INTERFACE.value),
        fixtureClass(model.row, listOf(drawerConstructor(model.row, rowParams, rowNames, setOf(3, 6),
            if (broken == "row-store") "A03" else "")), extraFields = rowFields, flags = allocatedFlags("row")),
        fixtureClass(model.section, listOf(drawerConstructor(model.section, sectionParams, sectionNames, setOf(6),
            if (broken == "section-store") "A02" else "")), extraFields = sectionNames.mapIndexed { slot, name -> drawerField(model.section, name, sectionParams[slot]) },
            flags = allocatedFlags("section")),
        fixtureClass(SETTINGS_SECTION, listOf(sectionSource)),
        fixtureClass(model.dispatcher), fixtureClass(model.iconBase), fixtureClass(model.glyph,
            extraFields = listOf(drawerField(model.glyph, "A68", model.glyph, true))),
        fixtureClass(model.enums, extraFields = listOf(drawerField(model.enums, "A1P", FIXTURE_INTEGER, true), drawerField(model.enums, "A01", FIXTURE_INTEGER, true))),
        fixtureClass(FIXTURE_COLOR_TYPE), fixtureClass(FIXTURE_COLOR, interfaces = listOf(FIXTURE_COLOR_TYPE),
            extraFields = listOf(drawerField(FIXTURE_COLOR, "A0A", FIXTURE_COLOR, true))),
        fixtureClass(model.icon, listOf(iconFactoryMethod, drawerConstructor(model.icon, listOf(model.glyph, FIXTURE_COLOR_TYPE),
            listOf("A00", "A01"), setOf(1))), superclass = model.iconBase,
            extraFields = listOf(drawerField(model.icon, "A00", model.glyph), drawerField(model.icon, "A01", FIXTURE_COLOR_TYPE)),
            flags = allocatedFlags("icon")),
        fixtureClass(DRAWER_KEY, listOf(drawerConstructor(DRAWER_KEY, listOf(FIXTURE_STRING), listOf("A00"), emptySet())) +
            if (broken == "key-equality") listOf(fixtureMethod("$DRAWER_KEY->hashCode()I", "const/4 v0, 0x0\nreturn v0", 1)) else emptyList(),
            interfaces = listOf("Landroid/os/Parcelable;"), extraFields = listOf(drawerField(DRAWER_KEY, "A00", FIXTURE_STRING)),
            flags = AccessFlags.PUBLIC.value or AccessFlags.ABSTRACT.value),
        fixtureClass(SETTINGS_KEY, listOf(keyCtor), superclass = DRAWER_KEY, interfaces = listOf("Landroid/os/Parcelable;"),
            extraFields = listOf(drawerField(SETTINGS_KEY, "A00", SETTINGS_KEY, true)), flags = allocatedFlags("key")),
        fixtureClass(DRAWER_METADATA, listOf(drawerConstructor(DRAWER_METADATA, listOf("Ljava/util/Map;"), listOf("A00"), emptySet(),
            if (broken == "map-store") "A00" else "")), extraFields = listOf(drawerField(DRAWER_METADATA, "A00", "Ljava/util/Map;")),
            flags = allocatedFlags("map")),
    )
    return LegacyDrawerFixture(classes, model)
}
