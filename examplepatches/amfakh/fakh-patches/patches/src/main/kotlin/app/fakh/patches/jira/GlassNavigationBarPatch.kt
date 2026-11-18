package app.fakh.patches.jira

import app.fakh.patches.jira.shared.Constants.COMPATIBILITY_JIRA
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.document
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

/** The bar's constructor that takes a style attribute; the shorter ones chain into it. */
private val bottomNavFingerprint = Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type.endsWith("/foldable/FoldableBottomNav;") && method.name == "<init>" &&
            method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;", "Landroid/util/AttributeSet;", "I")
    },
)

/**
 * `MainActivity` tells every page how much room the bottom bar takes (its height), and the pages pad and clip their
 * content to leave it free. Under the glass bar the pages get no such room, so their content runs on behind it.
 */
private val homeInsetsFingerprint = Fingerprint(
    custom = { method, classDef ->
        classDef.type.endsWith("MainActivity\$onCreate\$homeInsets\$1;") && method.parameterTypes.isEmpty() &&
            method.returnType.endsWith("/Insets;")
    },
)

/**
 * The Rovo button a page puts in its own scaffold (Home, ...): it hands the button's body a fresh modifier, which is
 * where the button is lifted above the capsule. R8 renames it, so it is found by the class and the parameter count.
 */
private val pageRovoFabFingerprint = Fingerprint(
    returnType = "V",
    custom = { method, classDef ->
        classDef.type.endsWith("/rovochat/RovoChatFloatingActionButtonKt;") && method.parameterTypes.size == 8
    },
)

/** A taller bar: the space above and below the icon and label grows, which centers them in the capsule. */
private val taller = patch {
    execute {
        document("res/values/dimens.xml").use { dimens ->
            val nodes = dimens.getElementsByTagName("dimen")
            var found = false
            for (i in 0 until nodes.length) {
                val node = nodes.item(i)
                if (node.attributes.getNamedItem("name").nodeValue == "m3_comp_nav_bar_item_vertical_container_between_space") {
                    node.textContent = "14.0dp"
                    found = true
                }
            }
            if (!found) throw PatchException("m3_comp_nav_bar_item_vertical_container_between_space not found")
        }
    }
}

private const val EXTENSION = "Lapp/fakh/extension/jira/MaterialYou;"

@Suppress("unused")
val glassNavigationBarPatch = patch(
    name = "Glass navigation bar",
    description = "Draws the navigation bar as a floating, translucent capsule with a sliding selection pill. Slide a finger along it to switch tabs. Liquid Glass blurs what's behind it.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_JIRA)
    category("Theme")
    extendWith("extensions/extension.mpe")
    dependsOn(taller, settingsRowsPatch)

    execute {
        // The extension's switch for the bar only shows where this patch is in.
        mutableClassDefBy(EXTENSION).methods.first { it.name == "isGlassNavigationBarIncluded" }.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        val insets = homeInsetsFingerprint.method
        if (insets.implementation!!.registerCount < 3) throw PatchException("No free registers in the insets getter")
        // With the bar's switch off the pages keep the app's room for its own bar.
        insets.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION->glassNavigationBar()Z
                move-result v0
                if-eqz v0, :keep
                new-instance v0, ${insets.returnType}
                const/4 v1, 0x0
                invoke-direct { v0, v1, v1, v1, v1 }, ${insets.returnType}-><init>(IIII)V
                return-object v0
            """,
            ExternalLabel("keep", insets.getInstruction(0)),
        )

        val constructor = bottomNavFingerprint.method
        val returns = constructor.implementation!!.instructions.withIndex()
            .filter { it.value.opcode == Opcode.RETURN_VOID }
            .map { it.index }
        if (returns.isEmpty()) throw PatchException("The bottom bar's constructor has no return")
        // From the last return up, so the earlier indexes stay valid. p0 is only read.
        returns.reversed().forEach {
            constructor.addInstructions(it, "invoke-static { p0 }, Lapp/fakh/extension/jira/GlassNavigationBar;->install(Landroid/view/View;)V")
        }

        // With no room for the bar, a page's scaffold puts the Rovo button 16dp above the window's bottom, behind the
        // capsule. Its body takes the modifier of its outer box (the button's click target is a child), so padding
        // that modifier vertically by the capsule's height lifts the button without widening what it catches.
        val fab = pageRovoFabFingerprint.method
        val body = fab.implementation!!.instructions
        val callAt = body.indexOfFirst {
            it.opcode == Opcode.INVOKE_STATIC_RANGE &&
                ((it as ReferenceInstruction).reference as MethodReference).let { callee ->
                    callee.definingClass == fab.definingClass && callee.parameterTypes.size == 9
                }
        }
        if (callAt < 0) throw PatchException("The Rovo button's body call not found")
        val modifierType = ((body[callAt] as ReferenceInstruction).reference as MethodReference).parameterTypes[5].toString()
        val modifier = (body[callAt] as RegisterRangeInstruction).startRegister + 5
        val padding = mutableClassDefBy(fab.definingClass).methods.asSequence()
            .flatMap { it.implementation?.instructions.orEmpty() }
            .filter { it.opcode == Opcode.INVOKE_STATIC || it.opcode == Opcode.INVOKE_STATIC_RANGE }
            .map { (it as ReferenceInstruction).reference as MethodReference }
            .firstOrNull {
                it.returnType == modifierType &&
                    it.parameterTypes.map(CharSequence::toString) == listOf(modifierType, "F", "F", "F", "F", "I")
            } ?: throw PatchException("Compose's padding(start, top, end, bottom) not found")

        mutableClassDefBy(fab.definingClass).methods.add(
            ImmutableMethod(
                fab.definingClass,
                "fakhLiftAboveGlass",
                listOf(ImmutableMethodParameter(modifierType, null, null)),
                modifierType,
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
                null,
                null,
                MutableMethodImplementation(7),
            ).toMutable().apply {
                addInstructionsWithLabels(
                    0,
                    """
                        invoke-static { }, Lapp/fakh/extension/jira/GlassNavigationBar;->rovoLift()F
                        move-result v4
                        const/4 v1, 0x0
                        cmpl-float v2, v4, v1
                        if-eqz v2, :keep
                        move-object v0, p0
                        const/4 v2, 0x0
                        const/4 v3, 0x0
                        const/4 v5, 0x7
                        invoke-static/range { v0 .. v5 }, $padding
                        move-result-object p0
                        :keep
                        return-object p0
                    """,
                )
            },
        )
        fab.addInstructions(
            callAt,
            """
                invoke-static/range { v$modifier .. v$modifier }, ${fab.definingClass}->fakhLiftAboveGlass($modifierType)$modifierType
                move-result-object v$modifier
            """,
        )
    }
}
