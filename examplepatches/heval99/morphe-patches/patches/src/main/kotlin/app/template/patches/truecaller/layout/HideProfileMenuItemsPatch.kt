package app.template.patches.truecaller.layout

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.literal
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resource.resourceId
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.COMPATIBILITY_TRUECALLER
import app.template.patches.shared.addInstructionsAtControlFlowLabelChecked
import app.template.patches.shared.addInstructionsWithLabelsChecked
import app.template.patches.shared.hevalcontrols.HEVAL_SETTINGS_CLASS
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.truecaller.controls.TruecallerControlsCategory
import app.template.patches.truecaller.controls.truecallerControls
import app.template.patches.truecaller.shared.toStringFields
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

private const val LIST = "Ljava/util/List;"

/** The Premium banner's titles: "Premium member" for subscribers, "Upgrade to Premium" otherwise. */
private val PREMIUM_BANNER_TITLES = listOf(
    "usershome_premium_section_premium_member",
    "usershome_premium_section_upgrade_to_premium",
)

private val PREMIUM_BANNER_FEATURE = HevalFeature(
    id = "truecaller.hide_profile_premium_banner",
    name = "Hide Premium banner",
    description = "Hides the Premium banner at the top of the profile menu.",
    category = TruecallerControlsCategory.PROFILE_MENU,
    default = false,
)

/**
 * One switch per profile menu row, keyed by its MenuItem constant (a kept enum). Who viewed my
 * profile, Contact requests, Settings, Backup and Change app theme are not offered.
 */
internal val PROFILE_MENU_ROW_FEATURES: List<Pair<String, HevalFeature>> = listOf(
    Triple("ANDROID_WATCH", "watch", "Android watch"),
    Triple("INVITE_FRIENDS", "invite", "Invite friends"),
    Triple("CONNECT_WITH_US", "connect", "Connect with us"),
    Triple("HELP", "help", "Help"),
).map { (constant, key, title) ->
    constant to HevalFeature(
        id = "truecaller.hide_profile_$key",
        name = "Hide $title",
        description = "Hides $title in the profile menu.",
        category = TruecallerControlsCategory.PROFILE_MENU,
        default = false,
    )
}

// Several Patch settings features in one patch, so featurePatch (one feature) is not used: the
// features are registered once every site is patched. All start off, so the menu is stock until the
// user hides a row. The menu (UsersHomeActivity) builds its state each time it opens, and the
// banner check runs when the row is drawn, so no restart is needed.
@Suppress("unused")
val hideProfileMenuItemsPatch = bytecodePatch(
    name = "Hide profile menu items",
    description = "Adds switches to hide items in the profile menu.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_TRUECALLER)

    dependsOn(truecallerControls.patch)

    execute {
        // Validate every site before the first edit.
        val menuItem = classDefBy(PROFILE_MENU_ITEM)
        for ((constant, _) in PROFILE_MENU_ROW_FEATURES) {
            if (menuItem.staticFields.none { it.name == constant && it.type == PROFILE_MENU_ITEM }) {
                throw PatchException("$PROFILE_MENU_ITEM has no $constant")
            }
        }
        val rows = rowVisibilityStores()
        val groups = groupStores()
        val banner = premiumBannerSites()

        // 1. Rows: every MenuItemUiState constructor passes isVisible through a helper that answers
        // false for a row whose switch is on. The view model keeps only visible rows.
        val rowHelper = addRowVisibilityHelper(rows.classDef)
        for (store in rows.stores) {
            store.method.addInstructionsAtControlFlowLabelChecked(
                store.index,
                """
                    invoke-static { v${store.item}, v${store.value} }, $rowHelper
                    move-result v${store.value}
                """,
            )
        }

        // 2. Groups: with a row switch on, a group whose rows are all hidden is dropped, so the menu
        // does not draw a section divider for it (Invite friends, Connect with us and Help are one
        // group).
        val groupsHelper = addDropEmptyGroupsHelper(groups.classDef)
        for (store in groups.stores) {
            store.method.addInstructionsAtControlFlowLabelChecked(
                store.index,
                """
                    invoke-static/range { v${store.value} .. v${store.value} }, $groupsHelper
                    move-result-object v${store.value}
                """,
            )
        }

        // 3. Premium banner: each renderer of the optional rows swaps an Enabled state with a
        // Premium banner title for the Disabled object while the switch is on, so it draws nothing.
        val bannerHelper = addPremiumBannerHelper(banner)
        for (renderer in banner.renderers) {
            // The first parameter register of a static method (J and D parameters take two).
            val first = renderer.implementation!!.registerCount -
                renderer.parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 }
            renderer.addInstructionsAtControlFlowLabelChecked(
                0,
                """
                    invoke-static/range { v$first .. v$first }, $bannerHelper
                    move-result-object v$first
                """,
            )
        }

        truecallerControls.register(PREMIUM_BANNER_FEATURE)
        PROFILE_MENU_ROW_FEATURES.forEach { (_, feature) -> truecallerControls.register(feature) }
    }
}

/** A store of a state field in a constructor: the value register and, for rows, the MenuItem register. */
private class FieldStore(val method: MutableMethod, val index: Int, val value: Int, val item: Int = -1)

private class StateStores(val classDef: ClassDef, val stores: List<FieldStore>)

private class BannerSites(
    val enabledType: String,
    val stateType: String,
    val titleRes: FieldReference,
    val disabled: FieldReference,
    val titleIds: List<Int>,
    val renderers: List<MutableMethod>,
)

private fun Instruction.field() = (this as? ReferenceInstruction)?.reference as? FieldReference

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || (opcode.setsWideRegister() && written + 1 == register)
}

private fun FieldReference.sameAs(other: FieldReference) =
    definingClass == other.definingClass && name == other.name && type == other.type

/** The instance field toString() prints after "<label>=", with the expected [type]. */
private fun BytecodePatchContext.stateField(toString: Method, owner: String, label: String, type: String): FieldReference {
    val fields = toStringFields(toString, owner).filter { (name, field) -> name == label && field.type == type }
        .map { it.second }.distinctBy { it.name }
    return fields.singleOrNull() ?: throw PatchException("$owner.toString prints $label ($type) from fields $fields")
}

/**
 * The isVisible stores of MenuItemUiState's constructors, each with the register of the MenuItem the
 * same constructor stores. Both registers must be parameters the constructor never overwrites, so
 * they still hold the arguments at the store.
 */
private fun BytecodePatchContext.rowVisibilityStores(): StateStores {
    val classDef = MenuItemUiStateToStringFingerprint.classDef
    val toString = MenuItemUiStateToStringFingerprint.method
    val item = stateField(toString, classDef.type, "item", PROFILE_MENU_ITEM)
    val visible = stateField(toString, classDef.type, "isVisible", "Z")

    val mutable = mutableClassDefBy(classDef)
    val stores = mutable.methods.filter { it.name == "<init>" && it.implementation != null }.flatMap { constructor ->
        val instructions = constructor.instructions.toList()
        val visibleStores = instructions.indices.filter {
            instructions[it].opcode == Opcode.IPUT_BOOLEAN && instructions[it].field()?.sameAs(visible) == true
        }
        if (visibleStores.isEmpty()) return@flatMap emptyList()
        val itemStores = instructions.filter { it.opcode == Opcode.IPUT_OBJECT && it.field()?.sameAs(item) == true }
        val itemRegister = itemStores.map { (it as TwoRegisterInstruction).registerA }.distinct().singleOrNull()
            ?: throw PatchException("${classDef.type}.<init> stores ${item.name} ${itemStores.size} times")
        visibleStores.map { index ->
            val value = (instructions[index] as TwoRegisterInstruction).registerA
            if (instructions.any { it.writes(value) || it.writes(itemRegister) }) {
                throw PatchException("${classDef.type}.<init> overwrites the ${item.name} or ${visible.name} argument")
            }
            FieldStore(constructor, index, value, itemRegister)
        }
    }
    if (stores.isEmpty()) throw PatchException("${classDef.type} never stores ${visible.name}")
    return StateStores(classDef, stores)
}

/** The groups stores of MenuItemsViewState's constructors. */
private fun BytecodePatchContext.groupStores(): StateStores {
    val classDef = MenuItemsViewStateToStringFingerprint.classDef
    val groups = stateField(MenuItemsViewStateToStringFingerprint.method, classDef.type, "groups", LIST)
    val mutable = mutableClassDefBy(classDef)
    val stores = mutable.methods.filter { it.name == "<init>" && it.implementation != null }.flatMap { constructor ->
        val instructions = constructor.instructions.toList()
        instructions.indices.filter {
            instructions[it].opcode == Opcode.IPUT_OBJECT && instructions[it].field()?.sameAs(groups) == true
        }.map { FieldStore(constructor, it, (instructions[it] as TwoRegisterInstruction).registerA) }
    }
    if (stores.isEmpty()) throw PatchException("${classDef.type} never stores ${groups.name}")
    return StateStores(classDef, stores)
}

/**
 * The Premium banner: the Enabled row state (its titleRes field and the interface it shares with the
 * Disabled object), the Disabled object, the banner's title ids, and every static renderer whose
 * first parameter is that interface and which tests for Enabled. The view model must still build an
 * Enabled state with one of the titles, else the switch would silently do nothing.
 */
private fun BytecodePatchContext.premiumBannerSites(): BannerSites {
    val enabled = MenuRowEnabledToStringFingerprint.classDef
    val titleRes = stateField(MenuRowEnabledToStringFingerprint.method, enabled.type, "titleRes", "I")
    val stateType = enabled.interfaces.singleOrNull()
        ?: throw PatchException("${enabled.type} implements ${enabled.interfaces}, expected one row state interface")

    val titleIds = PREMIUM_BANNER_TITLES.map { resourceId(ResourceType.STRING, it).toInt() }
    for ((name, id) in PREMIUM_BANNER_TITLES.zip(titleIds)) {
        val builders = Fingerprint(filters = listOf(literal(id))).matchAllOrNull().orEmpty().filter { match ->
            match.method.instructions.any {
                it.opcode == Opcode.NEW_INSTANCE && ((it as ReferenceInstruction).reference as TypeReference).type == enabled.type
            }
        }
        if (builders.isEmpty()) throw PatchException("No method builds a ${enabled.type} with the title $name")
    }

    val renderers = Fingerprint(
        returnType = "V",
        custom = { method, _ ->
            AccessFlags.STATIC.isSet(method.accessFlags) && method.parameterTypes.firstOrNull()?.toString() == stateType &&
                method.implementation?.instructions?.any {
                    it.opcode == Opcode.INSTANCE_OF && ((it as ReferenceInstruction).reference as TypeReference).type == enabled.type
                } == true
        },
    ).matchAllOrNull().orEmpty().map { it.method }
    if (renderers.isEmpty()) throw PatchException("No static renderer takes a $stateType and tests for ${enabled.type}")

    // The Disabled object, as the renderers read it: a static instance of its own class, which
    // implements the same interface.
    val disabled = renderers.flatMap { it.instructions }.mapNotNull { instruction ->
        instruction.field()?.takeIf { field ->
            instruction.opcode == Opcode.SGET_OBJECT && field.type == field.definingClass && field.type != enabled.type &&
                classDefByOrNull(field.type)?.interfaces?.contains(stateType) == true
        }
    }.distinctBy { "${it.definingClass}->${it.name}" }
    val disabledField = disabled.singleOrNull()
        ?: throw PatchException("The $stateType renderers read ${disabled.size} Disabled objects, expected one")

    return BannerSites(enabled.type, stateType, titleRes, disabledField, titleIds, renderers)
}

/** Adds a new static method with [smali] as its body to the class and returns its reference. */
private fun BytecodePatchContext.addStaticHelper(
    classDef: ClassDef,
    name: String,
    parameters: List<String>,
    returnType: String,
    registers: Int,
    smali: String,
): ImmutableMethodReference {
    val mutable = mutableClassDefBy(classDef)
    if (mutable.methods.any { it.name == name }) throw PatchException("${classDef.type} already has $name")
    val helper = ImmutableMethod(
        classDef.type, name, parameters.map { ImmutableMethodParameter(it, null, null) }, returnType,
        // Public: the banner helper lives on the Enabled state class but is called from the
        // renderers in other classes, and ART rejects a private callee across classes.
        AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.SYNTHETIC.value,
        null, null, MutableMethodImplementation(registers),
    ).toMutable()
    helper.addInstructionsWithLabelsChecked(0, smali)
    mutable.methods.add(helper)
    return ImmutableMethodReference(classDef.type, name, parameters, returnType)
}

private fun isEnabledCall(register: String) =
    "invoke-static { $register }, $HEVAL_SETTINGS_CLASS->isEnabled(Ljava/lang/String;)Z"

/**
 * (MenuItem, isVisible)Z: false for a visible row whose switch is on, else isVisible unchanged.
 * Registers: v0 local, p0 = MenuItem, p1 = isVisible.
 */
private fun BytecodePatchContext.addRowVisibilityHelper(classDef: ClassDef): ImmutableMethodReference {
    val checks = PROFILE_MENU_ROW_FEATURES.mapIndexed { index, (constant, feature) ->
        val next = if (index == PROFILE_MENU_ROW_FEATURES.lastIndex) ":keep" else ":row_${index + 1}"
        """
            :row_$index
            sget-object v0, $PROFILE_MENU_ITEM->$constant:$PROFILE_MENU_ITEM
            if-ne p0, v0, $next
            const-string v0, "${feature.id}"
            goto :check
        """
    }.joinToString("\n")
    return addStaticHelper(
        classDef, "morpheProfileRowVisible", listOf(PROFILE_MENU_ITEM, "Z"), "Z", 3,
        """
            if-eqz p1, :keep
            $checks
            :check
            ${isEnabledCall("v0")}
            move-result v0
            if-eqz v0, :keep
            const/4 v0, 0x0
            return v0
            :keep
            return p1
        """,
    )
}

/**
 * (groups)List: while any row switch is on, the groups without the empty ones; else groups
 * unchanged. Registers: v0-v3 locals, p0 = groups.
 */
private fun BytecodePatchContext.addDropEmptyGroupsHelper(classDef: ClassDef): ImmutableMethodReference {
    val anyOn = PROFILE_MENU_ROW_FEATURES.joinToString("\n") { (_, feature) ->
        """
            const-string v0, "${feature.id}"
            ${isEnabledCall("v0")}
            move-result v0
            if-nez v0, :drop
        """
    }
    return addStaticHelper(
        classDef, "morpheDropEmptyProfileGroups", listOf(LIST), LIST, 5,
        """
            $anyOn
            return-object p0
            :drop
            new-instance v0, Ljava/util/ArrayList;
            invoke-direct { v0 }, Ljava/util/ArrayList;-><init>()V
            invoke-interface { p0 }, $LIST->iterator()Ljava/util/Iterator;
            move-result-object v1
            :loop
            invoke-interface { v1 }, Ljava/util/Iterator;->hasNext()Z
            move-result v2
            if-eqz v2, :done
            invoke-interface { v1 }, Ljava/util/Iterator;->next()Ljava/lang/Object;
            move-result-object v2
            instance-of v3, v2, $LIST
            if-eqz v3, :keep_group
            move-object v3, v2
            check-cast v3, $LIST
            invoke-interface { v3 }, $LIST->isEmpty()Z
            move-result v3
            if-nez v3, :loop
            :keep_group
            invoke-virtual { v0, v2 }, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
            goto :loop
            :done
            return-object v0
        """,
    )
}

/**
 * (state)state: the Disabled object for an Enabled state whose title is a Premium banner title while
 * the banner switch is on, else the state unchanged. Registers: v0-v1 locals, p0 = state.
 */
private fun BytecodePatchContext.addPremiumBannerHelper(sites: BannerSites): ImmutableMethodReference {
    val titles = sites.titleIds.mapIndexed { index, id ->
        if (index == sites.titleIds.lastIndex) {
            "const v1, $id\nif-ne v0, v1, :keep"
        } else {
            "const v1, $id\nif-eq v0, v1, :check"
        }
    }.joinToString("\n")
    return addStaticHelper(
        classDefBy(sites.enabledType), "morpheHidePremiumBanner", listOf(sites.stateType), sites.stateType, 3,
        """
            instance-of v0, p0, ${sites.enabledType}
            if-eqz v0, :keep
            move-object v0, p0
            check-cast v0, ${sites.enabledType}
            iget v0, v0, ${sites.titleRes.definingClass}->${sites.titleRes.name}:I
            $titles
            :check
            const-string v0, "${PREMIUM_BANNER_FEATURE.id}"
            ${isEnabledCall("v0")}
            move-result v0
            if-eqz v0, :keep
            sget-object v0, ${sites.disabled.definingClass}->${sites.disabled.name}:${sites.disabled.type}
            return-object v0
            :keep
            return-object p0
        """,
    )
}
