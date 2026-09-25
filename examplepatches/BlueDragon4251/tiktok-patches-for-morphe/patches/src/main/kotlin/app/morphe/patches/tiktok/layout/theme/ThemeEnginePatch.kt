package app.morphe.patches.tiktok.layout.theme

import app.morphe.patches.tiktok.shared.discovery.TikTokFingerprint as Fingerprint
import app.morphe.patcher.patch.PatchException
import app.morphe.util.findMutableMethodOf
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import app.morphe.patches.tiktok.shared.discovery.calls
import app.morphe.patches.tiktok.shared.discovery.readsField
import com.android.tools.smali.dexlib2.iface.ClassDef
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.MainActivityOnCreateFingerprint
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

private const val THEME_ENGINE_BOOTSTRAP_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/tiktok/theme/ThemeEngineBootstrap;"
private const val THEME_COLOR_RESOLVER_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/tiktok/theme/ThemeColorResolver;"
private const val THEME_COMPOSE_COLOR_RESOLVER_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/tiktok/theme/ThemeComposeColorResolver;"
private const val THEME_VIEW_HOOKS_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/tiktok/theme/ThemeViewHooks;"
private const val THEME_DYNAMIC_LIST_GUARD_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/tiktok/theme/ThemeDynamicListGuardV3;"
private const val INBOX_SESSION_HOLDER =
    "Lcom/ss/android/ugc/aweme/im/chatlist/impl/ui/viewholder/v2/SessionListBaseVH;"
private const val MAIN_PAGE_ASSEM =
    "Lcom/bytedance/tiktok/homepage/mainpagefragment/assem/MainPageBusinessAssem;"
private const val SETTINGS_COMPOSE_FRAGMENT =
    "Lcom/ss/android/ugc/aweme/setting/ui/rvmpcompose/SettingsComposeRvmpFragment;"
private const val PROFILE_SIDEBAR_FRAGMENT =
    "Lcom/ss/android/ugc/aweme/sidebar/profile/ProfileSidebarPageFragment;"
private const val SETTINGS_COMPOSE_RENDERER = "LX/0VGt;"
private var composePaletteType = ""

private class NativeRootFingerprint(owner: String) : Fingerprint(
    definingClass = owner, name = "onCreateView", returnType = "Landroid/view/View;",
    parameters = listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;"),
)

private val nativeRoots = mapOf(
    "Lcom/ss/android/ugc/profile/business/profile/ui/v2/I18nMyProfileFragment;" to "profilePage",
    PROFILE_SIDEBAR_FRAGMENT to "sidebar",
    "Lcom/ss/android/ugc/aweme/sidebar/SidebarPageFragment;" to "sidebar",
    "Lcom/ss/android/ugc/profile/business/profile/menu/ProfilePageMenuFragment;" to "sidebar",
    "Lcom/ss/android/ugc/aweme/search/middle/AbstractSearchIntermediateFragmentNew;" to "search",
    "Lcom/ss/android/ugc/aweme/im/sdk/chat/ui/powerpage/BaseChatRoomFragment;" to "chat",
).map { (owner, hook) -> NativeRootFingerprint(owner) to hook }

private object HomePagerViewCreatedFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/main/assems/ui/HomepageViewPagerAssem;",
    name = "onViewCreated", parameters = listOf("Landroid/view/View;"), returnType = "V",
)

private var nativePagerDrawOwner = ""
private object NativePagerDrawFingerprint : Fingerprint(
    name = "dispatchDraw", parameters = listOf("Landroid/graphics/Canvas;"), returnType = "V",
    custom = { method, owner ->
        owner.type == nativePagerDrawOwner && owner.superclass == "Landroid/view/ViewGroup;" &&
            method.calls("Landroid/view/ViewGroup;", "dispatchDraw") && owner.methods.any {
                it.name == "computeScroll" && it.parameterTypes.isEmpty() && it.returnType == "V" &&
                    it.calls("Landroid/widget/Scroller;", "computeScrollOffset") &&
                    it.calls("Landroid/view/View;", "scrollTo")
            }
    },
)

/** Native master switch for the left-aligned header, merged avatar/info and avatar-at-right variants. */
private object ProfileLeftAlignFingerprint : Fingerprint(
    name = "<clinit>", returnType = "V", parameters = emptyList(),
    strings = listOf("profile_left_align"),
    custom = { method, owner ->
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "profile_left_align"
        } == true && owner.fields.count { it.type == "Z" } == 1 &&
            method.implementation?.instructions?.count { instruction ->
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                instruction.opcode == Opcode.SPUT_BOOLEAN && field?.definingClass == owner.type
            } == 1 && method.calls(parameters = listOf("I", "I", "Ljava/lang/String;", "Z"), returns = "I")
    },
)

/** Common full/partial inbox bind dispatcher; runs after each holder's native w6 implementation. */
private object InboxSessionBindFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith(INBOX_SESSION_HOLDER) &&
            method.parameterTypes.size == 2 && method.parameterTypes[0].startsWith("L") &&
            method.parameterTypes[1] == "I" &&
            method.implementation?.instructions?.any { instruction ->
                val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                call?.definingClass == INBOX_SESSION_HOLDER && call.returnType == "V" &&
                    call.parameterTypes.size == 2 && call.parameterTypes[0].startsWith("L") &&
                    call.parameterTypes[1] == "I"
            } == true &&
            method.returnType == "V"
    },
)

/** Resolve the family by framework behavior, not an obfuscated owner/name. */
private fun isTuxFamily(owner: ClassDef): Boolean = owner.methods.any {
    it.parameterTypes == listOf("I", "Landroid/content/Context;", "[I") &&
        it.returnType == "Ljava/lang/Integer;" && it.calls("Landroid/content/res/TypedArray;", "getColor")
} && owner.methods.any {
    it.parameterTypes == listOf("Landroid/content/res/Resources$" + "Theme;", "I",
        "Landroid/util/TypedValue;", "Lkotlin/jvm/functions/Function1;") &&
        it.calls("Landroid/content/res/Resources$" + "Theme;", "resolveAttribute")
}

private object TuxDirectColorResolverFingerprint : Fingerprint(
    parameters = listOf("I", "Landroid/content/Context;"), returnType = "Ljava/lang/Integer;",
    custom = { method, owner -> isTuxFamily(owner) &&
        method.readsField("Landroid/util/TypedValue;", "data") &&
        method.calls("Landroid/content/res/Resources$" + "Theme;", "resolveAttribute") },
)
private object TuxGenericAttributeResolverFingerprint : Fingerprint(
    parameters = listOf("I", "Landroid/content/Context;", "Lkotlin/jvm/functions/Function1;"),
    returnType = "Ljava/lang/Object;",
    custom = { method, owner -> isTuxFamily(owner) && method.calls("Landroid/content/Context;", "getTheme") },
)
private object TuxSemanticColorResolverFingerprint : Fingerprint(
    parameters = listOf("I", "Landroid/content/Context;"), returnType = "Ljava/lang/Integer;",
    custom = { method, owner -> isTuxFamily(owner) && method.calls(owner = owner.type,
        parameters = listOf("I", "Landroid/content/Context;", "Lkotlin/jvm/functions/Function1;"),
        returns = "Ljava/lang/Object;") },
)
private object TuxStyledColorResolverFingerprint : Fingerprint(
    parameters = listOf("I", "Landroid/content/Context;", "[I"), returnType = "Ljava/lang/Integer;",
    custom = { method, owner -> isTuxFamily(owner) && method.calls("Landroid/content/res/TypedArray;", "getColor") },
)

/** Native half-dp separator writer; the bar itself comes from showBottomTab(). */
private object MainBottomNavigationDividerFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith(MAIN_PAGE_ASSEM) &&
            method.calls("Landroid/view/View;", "setBackgroundColor") &&
            method.parameterTypes.isEmpty() &&
            method.returnType == "V"
    },
)

/** Exact normal TikTok Settings & privacy Compose root. */
private object SettingsComposeCreateViewFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith(SETTINGS_COMPOSE_FRAGMENT) &&
            method.name == "onCreateView" &&
            method.parameterTypes == listOf(
                "Landroid/view/LayoutInflater;",
                "Landroid/view/ViewGroup;",
                "Landroid/os/Bundle;",
            ) &&
            method.returnType == "Landroid/view/View;"
    },
)

/** Reapply after SettingsComposeRvmpFragment has completed its own view initialization. */
private object SettingsComposeViewCreatedFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith(SETTINGS_COMPOSE_FRAGMENT) &&
            method.name == "onViewCreated" &&
            method.parameterTypes == listOf("Landroid/view/View;", "Landroid/os/Bundle;") &&
            method.returnType == "V"
    },
)

/** Resolve the provider from its returned color-table type and composition-local access. */
private object ComposePaletteProviderFingerprint : Fingerprint(
    custom = { method, owner ->
        method.returnType == composePaletteType && method.parameterTypes.size == 1 &&
            method.parameterTypes[0].startsWith("L") &&
            method.implementation?.instructions?.count() == 5 &&
            method.implementation?.instructions?.any { it.opcode == Opcode.INVOKE_INTERFACE } == true &&
            owner.methods.count { it.parameterTypes == method.parameterTypes } >= 4
    },
)

/** Inner group/list renderer used by SettingsComposeRvmpFragment. */
private object SettingsComposeGroupRendererFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith(SETTINGS_COMPOSE_RENDERER) &&
            method.name == "LIZ" &&
            method.parameterTypes == listOf(
                "LX/0VSj;",
                "Ljava/util/List;",
                "LX/008m;",
                "I",
            ) &&
            method.returnType == "V"
    },
)

/** Outer Settings & privacy Compose renderer. */
private object SettingsComposeScreenRendererFingerprint : Fingerprint(
    custom = { method, classDef ->
        classDef.endsWith(SETTINGS_COMPOSE_RENDERER) &&
            method.name == "LIZIZ" &&
            method.parameterTypes == listOf(
                "LX/0VSj;",
                "Ljava/util/List;",
                "LX/008m;",
                "I",
            ) &&
            method.returnType == "V"
    },
)

/** BlueIT TikTok Theme Engine. */
@Suppress("unused")
val themeEnginePatch = bytecodePatch(
    name = "Theme engine",
    description = "Experimental recovery opt-in: runtime-selectable BlueIT themes applied to TikTok TUX/Compose colors and classic surfaces.",
    default = false,
) {
    dependsOn(sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4673())

    val classicProfileLayout by booleanOption(
        key = "classicProfileLayout",
        default = true,
        title = "Classic centered profile",
        description = "Use TikTok's native centered profile header instead of the left-aligned experiment. Applies independently of the selected color preset.",
        required = true,
    )

    val initialPreset by stringOption(
        key = "initialThemePreset",
        default = "default",
        values = mapOf(
            "TikTok default" to "default",
            "Material You" to "material_you",
            "Material You AMOLED" to "material_you_amoled",
            "OLED black" to "oled_black",
            "Liquid Glass" to "liquid_glass",
            "Frosted Graphite" to "frosted_graphite",
            "Midnight Neon" to "midnight_neon",
            "Rose Noir" to "rose_noir",
            "Arctic Blue" to "arctic_blue",
            "Aurora Violet" to "aurora_violet",
            "Sunset Ember" to "sunset_ember",
            "Custom" to "custom",
        ),
        title = "Initial theme preset",
        description = "Optional starting theme for a fresh install. This is only a default; the theme remains freely selectable in BlueIT settings afterwards.",
        required = false,
    )

    execute {
        val patchDefaultPreset = initialPreset ?: "default"
        val palettes = mutableListOf<ClassDef>()
        classDefForEach { owner ->
            val fields = owner.fields.toList()
            val colors = fields.count { it.type == "J" }
            val state = fields.filter { it.type != "J" }
            if (colors >= 200 && state.size <= 4 && state.all { it.type.startsWith("L") }) palettes += owner
        }
        if (palettes.size != 1) throw PatchException("Compose color table: expected one color-table palette, got ${palettes.map { it.type }}")
        composePaletteType = palettes.single().type


        listOf(TuxDirectColorResolverFingerprint, TuxGenericAttributeResolverFingerprint,
            TuxSemanticColorResolverFingerprint, TuxStyledColorResolverFingerprint,
            InboxSessionBindFingerprint, MainBottomNavigationDividerFingerprint,
            ComposePaletteProviderFingerprint).forEach { fingerprint ->
            val matches = fingerprint.matchAll(1..1)
            println("[BlueIT Hook Contract] ${fingerprint.javaClass.simpleName}: ${matches.single().originalMethod}")
        }

        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableThemeEngine()V",
        )

        TuxDirectColorResolverFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    const-string v0, "$patchDefaultPreset"
                    invoke-static {p0, p1, v0}, $THEME_COLOR_RESOLVER_CLASS_DESCRIPTOR->resolve(ILandroid/content/Context;Ljava/lang/String;)Ljava/lang/Integer;
                    move-result-object v0
                    if-eqz v0, :blueit_tux_direct_original
                    return-object v0
                """.trimIndent(),
                ExternalLabel("blueit_tux_direct_original", getInstruction(0)),
            )
        }

        TuxGenericAttributeResolverFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    const-string v0, "$patchDefaultPreset"
                    invoke-static {p0, p1, p2, v0}, $THEME_COLOR_RESOLVER_CLASS_DESCRIPTOR->resolveGeneric(ILandroid/content/Context;Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
                    move-result-object v0
                    if-eqz v0, :blueit_tux_generic_original
                    return-object v0
                """.trimIndent(),
                ExternalLabel("blueit_tux_generic_original", getInstruction(0)),
            )
        }

        TuxSemanticColorResolverFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    const-string v0, "$patchDefaultPreset"
                    invoke-static {p0, p1, v0}, $THEME_COLOR_RESOLVER_CLASS_DESCRIPTOR->resolve(ILandroid/content/Context;Ljava/lang/String;)Ljava/lang/Integer;
                    move-result-object v0
                    if-eqz v0, :blueit_tux_semantic_original
                    return-object v0
                """.trimIndent(),
                ExternalLabel("blueit_tux_semantic_original", getInstruction(0)),
            )
        }

        TuxStyledColorResolverFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    const-string v0, "$patchDefaultPreset"
                    invoke-static {p0, p1, p2, v0}, $THEME_COLOR_RESOLVER_CLASS_DESCRIPTOR->resolveFromAttributeArray(ILandroid/content/Context;[ILjava/lang/String;)Ljava/lang/Integer;
                    move-result-object v0
                    if-eqz v0, :blueit_tux_styled_original
                    return-object v0
                """.trimIndent(),
                ExternalLabel("blueit_tux_styled_original", getInstruction(0)),
            )
        }

        InboxSessionBindFingerprint.method.apply {
            val returnIndices = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .toList()
            returnIndices.asReversed().forEach { returnIndex ->
                addInstructions(
                    returnIndex,
                    """
                        move-object/from16 v0, p0
                        iget-object v0, v0, Landroidx/recyclerview/widget/RecyclerView${'$'}ViewHolder;->itemView:Landroid/view/View;
                        invoke-static {v0}, $THEME_DYNAMIC_LIST_GUARD_CLASS_DESCRIPTOR->onInboxRowBound(Landroid/view/View;)V
                    """.trimIndent(),
                )
            }
        }

        // Resolve actual native roots by lifecycle contracts, and use each return's real register.
        nativeRoots.forEach { (fingerprint, hook) ->
            val method = fingerprint.matchAll(1..1).single().method
            method.hookNativeReturns(hook)
        }

        // Resolve the real home pager from the native View argument's cast, then its draw owner.
        // computeScroll can advance the pager after pre-draw, so correct before it draws children.
        val pagerInit = HomePagerViewCreatedFingerprint.matchAll(1..1).single().originalMethod
        val pagerInput = pagerInit.implementation!!.registerCount - 1
        val pagerType = pagerInit.implementation!!.instructions.mapNotNull { instruction ->
            if (instruction.opcode == Opcode.CHECK_CAST &&
                (instruction as OneRegisterInstruction).registerA == pagerInput) {
                ((instruction as ReferenceInstruction).reference as TypeReference).type
            } else null
        }.distinct().singleOrNull() ?: throw PatchException("Native home pager: expected one View argument cast")
        var pagerClass = classDefBy(pagerType)
        val pagerAncestors = mutableSetOf<String>()
        while (pagerClass.methods.none { it.name == "dispatchDraw" &&
                it.parameterTypes == listOf("Landroid/graphics/Canvas;") && it.returnType == "V" }) {
            val parent = pagerClass.superclass
            if (!pagerAncestors.add(pagerClass.type) || parent == null || parent.startsWith("Landroid/")) {
                throw PatchException("Native home pager: no app-owned dispatchDraw in $pagerType ancestry")
            }
            pagerClass = classDefBy(parent)
        }
        nativePagerDrawOwner = pagerClass.type
        val pagerDraw = NativePagerDrawFingerprint.matchAll(1..1).single().method
        pagerDraw.addInstruction(0,
            "invoke-static/range {p0 .. p0}, Lapp/morphe/extension/tiktok/theme/ThemeNativeTargets;->beforePagerDraw(Landroid/view/ViewGroup;)V")
        println("[BlueIT Pager Draw Contract] $pagerType -> ${pagerClass.type}->dispatchDraw")

        if (classicProfileLayout == true) {
            val method = ProfileLeftAlignFingerprint.matchAll(1..1).single().method
            val (index, instruction) = method.implementation!!.instructions.withIndex().single {
                it.value.opcode == Opcode.SPUT_BOOLEAN
            }
            val field = (instruction as ReferenceInstruction).reference as FieldReference
            val register = (instruction as OneRegisterInstruction).registerA
            // Rewrite the native decision before its cached dependents initialize. Keep labels
            // on the zero assignment so both branches select the same complete classic layout.
            method.replaceInstruction(index, "const/16 v$register, 0x0")
            method.addInstruction(index + 1, "sput-boolean v$register, ${field.definingClass}->${field.name}:Z")
            println("[BlueIT Profile Layout Contract] profile_left_align disabled at ${field.definingClass}->${field.name}")
        }

        // sh()/rc() write the 0.5dp separator; showBottomTab() resolves the actual tab bar.
        val navigationClass = classDefBy(MAIN_PAGE_ASSEM)
        val dividerMethod = MainBottomNavigationDividerFingerprint.originalMethod
        val dividerField = dividerMethod.implementation!!.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { field ->
                field.definingClass == MAIN_PAGE_ASSEM && field.type == "Landroid/view/View;"
            }
        }.distinctBy { it.name }.single()
        val visibilityMethod = navigationClass.methods.single {
            it.name == "showBottomTab" && it.parameterTypes == listOf("Z") && it.returnType == "V"
        }
        val getter = visibilityMethod.implementation!!.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.takeIf { ref ->
                ref.definingClass == MAIN_PAGE_ASSEM && ref.parameterTypes.isEmpty() && ref.returnType == "Landroid/view/View;"
            }
        }.distinctBy { it.name }.single()
        val getterMethod = navigationClass.methods.single { it.name == getter.name && it.parameterTypes.isEmpty() }
        val containerField = getterMethod.implementation!!.instructions.mapNotNull {
            ((it as? ReferenceInstruction)?.reference as? FieldReference)?.takeIf { ref ->
                ref.definingClass == MAIN_PAGE_ASSEM && ref.type == "Landroid/view/View;"
            }
        }.distinctBy { it.name }.single()
        var writers = 0
        navigationClass.methods.forEach { original ->
            val instructions = original.implementation?.instructions?.toList() ?: return@forEach
            val sites = instructions.mapIndexedNotNull { index, instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference
                when {
                    reference is MethodReference && reference.name == "setBackgroundColor" &&
                        reference.parameterTypes == listOf("I") && instruction is FiveRegisterInstruction ->
                        Triple(index, instruction.registerC, "navigationDivider")
                    instruction.opcode == Opcode.IPUT_OBJECT && reference is FieldReference &&
                        reference.name in setOf(dividerField.name, containerField.name) && reference.definingClass == MAIN_PAGE_ASSEM ->
                        Triple(index, (instruction as TwoRegisterInstruction).registerA,
                            if (reference.name == containerField.name) "navigation" else "navigationDivider")
                    else -> null
                }
            }
            if (sites.isNotEmpty()) {
                val method = mutableClassDefBy(navigationClass).findMutableMethodOf(original)
                sites.asReversed().forEach { (index, register, hook) ->
                    method.addInstruction(index + 1, "invoke-static/range {v$register .. v$register}, Lapp/morphe/extension/tiktok/theme/ThemeNativeTargets;->$hook(Landroid/view/View;)V")
                    writers++
                }
            }
        }
        if (writers < 3) throw PatchException("Native navigation: missing initialization/background writer contracts ($writers)")

        // Exact discovery: onCreateView has 10 registers / 4 ins and returns its ComposeView in v5
        // on both normal and caught paths. The root style is kept for window/backdrop treatment;
        // actual Compose colors are mapped separately below.
        SettingsComposeCreateViewFingerprint.method.apply {
            val returnIndices = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                addInstruction(
                    returnIndex,
                    "invoke-static/range {v${getInstruction<OneRegisterInstruction>(returnIndex).registerA} .. v${getInstruction<OneRegisterInstruction>(returnIndex).registerA}}, $THEME_VIEW_HOOKS_CLASS_DESCRIPTOR->styleSettingsCompose(Landroid/view/View;)V",
                )
            }
        }

        SettingsComposeViewCreatedFingerprint.method.apply {
            val returnIndices = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                addInstruction(
                    returnIndex,
                    "invoke-static/range {p1 .. p1}, $THEME_VIEW_HOOKS_CLASS_DESCRIPTOR->styleSettingsCompose(Landroid/view/View;)V",
                )
            }
        }

        // LX/0VTU.LIZIZ is the native Compose palette provider. The returned LX/05Pc object contains
        // the packed color longs used by Settings page/card/row composables. Remap the palette once
        // per object/preset; the extension snapshots native values and can restore TikTok default.
        ComposePaletteProviderFingerprint.method.apply {
            val returnIndices = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index }
                .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                val register = getInstruction<OneRegisterInstruction>(returnIndex).registerA
                addInstructions(
                    returnIndex,
                    """
                        invoke-static/range {v$register .. v$register}, $THEME_COMPOSE_COLOR_RESOLVER_CLASS_DESCRIPTOR->mapPalette(Ljava/lang/Object;)Ljava/lang/Object;
                        move-result-object v$register
                        check-cast v$register, $returnType
                    """.trimIndent(),
                )
            }
        }

        // Narrow renderer-level fallback for any palette value that bypasses the provider snapshot.
        listOf(
            SettingsComposeGroupRendererFingerprint.method,
            SettingsComposeScreenRendererFingerprint.method,
        ).forEach { method ->
            val paletteReads = method.implementation!!.instructions.withIndex().mapNotNull { (index, instruction) ->
                if (instruction.opcode != Opcode.IGET_WIDE) return@mapNotNull null
                val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                    ?: return@mapNotNull null
                if (field.definingClass != composePaletteType || field.type != "J") return@mapNotNull null
                val destination = (instruction as TwoRegisterInstruction).registerA
                index to destination
            }

            paletteReads.asReversed().forEach { (index, destination) ->
                method.addInstructions(
                    index + 1,
                    """
                        invoke-static/range {v$destination .. v${destination + 1}}, $THEME_COMPOSE_COLOR_RESOLVER_CLASS_DESCRIPTOR->mapColor(J)J
                        move-result-wide v$destination
                    """.trimIndent(),
                )
            }
        }

        MainActivityOnCreateFingerprint.method.apply {
            val returnIndices = implementation!!.instructions.withIndex()
                .filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }
                .toList()

            returnIndices.asReversed().forEach { returnIndex ->
                addInstructions(
                    returnIndex,
                    """
                        invoke-static/range {p0 .. p0}, Lapp/morphe/extension/shared/Utils;->setContext(Landroid/content/Context;)V
                        const-string v0, "$patchDefaultPreset"
                        invoke-static {v0}, $THEME_ENGINE_BOOTSTRAP_CLASS_DESCRIPTOR->setPatchDefaultPreset(Ljava/lang/String;)V
                        invoke-static/range {p0 .. p0}, $THEME_ENGINE_BOOTSTRAP_CLASS_DESCRIPTOR->start(Landroid/app/Activity;)V
                    """.trimIndent(),
                )
            }
        }
    }
}
