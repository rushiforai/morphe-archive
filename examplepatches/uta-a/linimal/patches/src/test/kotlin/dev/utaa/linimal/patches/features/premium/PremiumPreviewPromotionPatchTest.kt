package dev.utaa.linimal.patches.features.premium

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import dev.utaa.linimal.patches.status.FeatureId
import dev.utaa.linimal.patches.status.PatchId
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFalse
import kotlin.test.assertNull
import kotlin.test.assertTrue

class PremiumPreviewPromotionPatchTest {
    @Test
    fun `the preview promotion keeps its own feature id`() {
        assertEquals(FeatureId.PREMIUM_PREVIEW_PROMOTION, PatchId.PREMIUM_PREVIEW_PROMOTION.featureId)
        assertEquals("linimal.premium-preview-promotion", PatchId.PREMIUM_PREVIEW_PROMOTION.featureId.value)
        assertEquals("linimal.patch.premium-preview-promotion", PatchId.PREMIUM_PREVIEW_PROMOTION.value)
    }

    @Test
    fun `the screen takes one banner, one menu item and the preview activity callback`() {
        assertTrue(isPreviewScreenSignature(SCREEN_PARAMETERS, BANNER, MENU_ITEM))
        // 子 composable は float の配置引数を挟みますが、型の組み合わせは同じです。
        assertTrue(isPreviewScreenSignature(CHILD_PARAMETERS, BANNER, MENU_ITEM))
        assertFalse(isPreviewScreenSignature(SCREEN_PARAMETERS - MENU_ITEM, BANNER, MENU_ITEM))
        assertFalse(isPreviewScreenSignature(SCREEN_PARAMETERS + BANNER, BANNER, MENU_ITEM))
        // プレビュー画面以外で同じ model を受け取るものは対象外です。
        assertFalse(
            isPreviewScreenSignature(SCREEN_PARAMETERS - PREVIEW_CALLBACK, BANNER, MENU_ITEM),
        )
    }

    @Test
    fun `only the composable that no other candidate calls is the screen root`() {
        val portrait = composable("b", CHILD_PARAMETERS)
        val landscape = composable("d", CHILD_PARAMETERS)
        val screen = composable("e", SCREEN_PARAMETERS, calls = listOf(portrait, landscape))

        assertEquals(listOf(screen), previewScreenRoots(listOf(portrait, landscape, screen)))
    }

    @Test
    fun `recursive restart calls do not hide the root`() {
        val screen = composable("e", SCREEN_PARAMETERS, callsSelf = true)

        assertEquals(listOf(screen), previewScreenRoots(listOf(screen)))
    }

    @Test
    fun `unrelated composables leave more than one root`() {
        val first = composable("e", SCREEN_PARAMETERS)
        val second = composable("f", SCREEN_PARAMETERS)

        assertEquals(2, previewScreenRoots(listOf(first, second)).size)
    }

    @Test
    fun `the destination field is the enum with the premium destinations`() {
        val destination = destinationEnum(DESTINATION, listOf("NONE", "LYP_BENEFIT_HOME", "LYP_BENEFIT_STATUS"))
        val position = destinationEnum(POSITION, listOf("ABOVE_PREVIEW", "BELOW_PREVIEW"))
        val classes = listOf(destination, position).associateBy { it.type }

        val field = chipDestinationField(bannerClass(), classes::get)

        assertEquals("f", field?.name)
        assertEquals(DESTINATION, field?.type)
    }

    @Test
    fun `an enum without the no destination value is not the destination field`() {
        assertFalse(isChipDestinationEnum(destinationEnum(DESTINATION, listOf("LYP_BENEFIT_HOME", "LYP_BENEFIT_STATUS"))))
        assertFalse(isChipDestinationEnum(destinationEnum(DESTINATION, listOf("NONE", "LYP_BENEFIT_HOME"))))
        assertFalse(isChipDestinationEnum(null))
    }

    @Test
    fun `two candidate destination fields leave the field unresolved`() {
        val destination = destinationEnum(DESTINATION, listOf("NONE", "LYP_BENEFIT_HOME", "LYP_BENEFIT_STATUS"))

        assertNull(chipDestinationField(bannerClass(duplicateDestination = true)) { destination })
    }

    @Test
    fun `parameter registers follow the locals of the static method`() {
        // 26.16.0: registers 42、ins 13。p2 は v31、p3 は v32 です。
        val injection = premiumPreviewPromotionInjection(SCREEN_PARAMETERS, 42, BANNER, MENU_ITEM)

        assertEquals(PremiumPreviewPromotionInjection(31, 32), injection)
    }

    @Test
    fun `wide parameters occupy two registers`() {
        val parameters = listOf("J", BANNER, "D", MENU_ITEM)

        assertEquals(
            PremiumPreviewPromotionInjection(6, 9),
            premiumPreviewPromotionInjection(parameters, 10, BANNER, MENU_ITEM),
        )
    }

    @Test
    fun `too few scratch registers or high parameter registers are rejected`() {
        // 引数以外の register が 3 つしかないため、v0〜v3 を作業 register に使えません。
        assertNull(premiumPreviewPromotionInjection(SCREEN_PARAMETERS, 16, BANNER, MENU_ITEM))
        // move-object/from16 の書き込み先は 8bit に収まらなければなりません。
        assertNull(premiumPreviewPromotionInjection(SCREEN_PARAMETERS, 300, BANNER, MENU_ITEM))
        assertNull(premiumPreviewPromotionInjection(SCREEN_PARAMETERS - MENU_ITEM, 42, BANNER, MENU_ITEM))
    }

    private fun composable(
        name: String,
        parameters: List<String>,
        calls: List<Method> = emptyList(),
        callsSelf: Boolean = false,
    ): Method {
        val targets = calls.map { it.name to it.parameterTypes.map(CharSequence::toString) } +
            if (callsSelf) listOf(name to parameters) else emptyList()
        val instructions = targets.map { (targetName, targetParameters) ->
            ImmutableInstruction3rc(
                Opcode.INVOKE_STATIC_RANGE,
                0,
                targetParameters.size,
                ImmutableMethodReference(SCREEN_OWNER, targetName, targetParameters, "V"),
            )
        } + ImmutableInstruction10x(Opcode.RETURN_VOID)
        return ImmutableMethod(
            SCREEN_OWNER,
            name,
            parameters.map { ImmutableMethodParameter(it, null, null) },
            "V",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value,
            null,
            null,
            ImmutableMethodImplementation(42, instructions, null, null),
        )
    }

    private fun bannerClass(duplicateDestination: Boolean = false): ClassDef = ImmutableClassDef(
        BANNER,
        0,
        "Ljava/lang/Object;",
        null,
        null,
        null,
        null,
        buildList {
            add(ImmutableField(BANNER, "a", "I", 0, null, null, null))
            add(ImmutableField(BANNER, "d", POSITION, 0, null, null, null))
            add(ImmutableField(BANNER, "f", DESTINATION, 0, null, null, null))
            if (duplicateDestination) {
                add(ImmutableField(BANNER, "g", DESTINATION, 0, null, null, null))
            }
        },
        null,
        null,
    )

    private fun destinationEnum(type: String, constants: List<String>): ClassDef = ImmutableClassDef(
        type,
        AccessFlags.ENUM.value,
        "Ljava/lang/Enum;",
        null,
        null,
        null,
        constants.map { name ->
            ImmutableField(
                type,
                name,
                type,
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value or
                    AccessFlags.ENUM.value,
                null,
                null,
                null,
            )
        } + ImmutableField(type, "\$VALUES", "[$type", AccessFlags.STATIC.value, null, null, null),
        null,
        null,
        null,
    )

    private companion object {
        const val SCREEN_OWNER = "Lexample/preview/Screen;"
        const val BANNER = "Lexample/preview/Banner;"
        const val MENU_ITEM = "Lexample/preview/MenuItem;"
        const val DESTINATION = "Lexample/preview/Destination;"
        const val POSITION = "Lexample/preview/Position;"
        const val PREVIEW_CALLBACK = "Lcom/linecorp/line/chat/ui/impl/preview/ChatHistoryPreviewActivity\$c;"
        const val FUNCTION0 = "Lexample/Function0;"

        val SCREEN_PARAMETERS = listOf(
            "Lexample/preview/State;",
            "Lexample/preview/Chat;",
            BANNER,
            MENU_ITEM,
            PREVIEW_CALLBACK,
            FUNCTION0,
            FUNCTION0,
            FUNCTION0,
            FUNCTION0,
            FUNCTION0,
            FUNCTION0,
            "Lexample/Composer;",
            "I",
        )

        val CHILD_PARAMETERS = listOf(
            "Lexample/preview/State;",
            "Lexample/preview/Chat;",
            BANNER,
            MENU_ITEM,
            "F",
            PREVIEW_CALLBACK,
            FUNCTION0,
            FUNCTION0,
            FUNCTION0,
            "Lexample/Composer;",
            "I",
        )
    }
}
