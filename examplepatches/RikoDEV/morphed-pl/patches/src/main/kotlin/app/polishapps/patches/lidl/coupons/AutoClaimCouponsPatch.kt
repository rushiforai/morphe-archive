package app.polishapps.patches.lidl.coupons

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.polishapps.patches.inpost.shared.mutableMethod
import app.polishapps.patches.inpost.shared.parameterTypeNames
import app.polishapps.patches.inpost.shared.strings
import app.polishapps.patches.lidl.shared.LIDL_EXTENSION
import app.polishapps.patches.shared.Constants.COMPATIBILITY_LIDL_PLUS
import app.polishapps.patches.shared.replaceBody
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction22c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val EXTENSION = "Lapp/polishapps/extension/lidl/AutoClaimCoupons;"

/** Logged by the coupon list loader when it builds its screen, right before it stores the loaded coupons. */
private const val LIST_LOADER_STRING = "lidlplusapp_coupons_listing_display_1"

/**
 * Member names of the coupon domain model in 17.13.6, checked against the APK before patching.
 * `my6` is the coupon shown in the list and `l87` its level lock. R8 renames them every release.
 */
private const val COUPON = "Lmy6;"
private const val COUPON_ID = "a"
private const val COUPON_LOCATION = "g"
private const val COUPON_ACTIVATED = "j"
private const val COUPON_PROCESSING = "k"
private const val COUPON_GROUPS = "u"
private const val COUPON_LEVELS = "x"
private const val LEVELS_LOCKED = "b"

private const val STRING = "Ljava/lang/String;"
private const val LIST = "Ljava/util/List;"
private const val ARRAY_LIST = "Ljava/util/ArrayList;"

private fun ClassDef.requireField(name: String, type: String) {
    if (fields.none { it.name == name && it.type == type }) {
        throw PatchException("${this.type}: expected field $name:$type, the pinned coupon model changed")
    }
}

private fun BytecodePatchContext.checkCouponModel(): String {
    val coupon = classDefByOrNull(COUPON) ?: throw PatchException("$COUPON not found")
    coupon.requireField(COUPON_ID, STRING)
    coupon.requireField(COUPON_LOCATION, STRING)
    coupon.requireField(COUPON_ACTIVATED, "Z")
    coupon.requireField(COUPON_PROCESSING, "Z")
    coupon.requireField(COUPON_GROUPS, LIST)

    val levelsField = coupon.fields.singleOrNull { it.name == COUPON_LEVELS }
        ?: throw PatchException("$COUPON: field $COUPON_LEVELS not found")
    val levels = classDefByOrNull(levelsField.type) ?: throw PatchException("${levelsField.type} not found")
    levels.requireField(LEVELS_LOCKED, "Z")
    return levelsField.type
}

/** The loader's `x.addAll(coupons)` call, the register holding the list and the one holding the presenter. */
private class LoaderSite(
    val method: MutableMethod,
    val addAllIndex: Int,
    val listRegister: Int,
    val presenterRegister: Int,
    val presenterType: String,
)

private fun BytecodePatchContext.findLoaderSite(): LoaderSite {
    val sites = mutableListOf<LoaderSite>()

    classDefByStrings(LIST_LOADER_STRING).forEach { classDef ->
        classDef.methods.filter { LIST_LOADER_STRING in it.strings() }.forEach { candidate ->
            val method = mutableMethod(classDef, candidate)
            val instructions = method.instructions

            val stringIndex = instructions.indexOfFirst { instruction ->
                instruction is BuilderInstruction21c &&
                    instruction.opcode == Opcode.CONST_STRING &&
                    (instruction.reference as? StringReference)?.string == LIST_LOADER_STRING
            }
            if (stringIndex < 0) return@forEach

            val addAllIndex = (stringIndex until instructions.size).firstOrNull { index ->
                val instruction = instructions[index]
                instruction is BuilderInstruction35c &&
                    instruction.opcode == Opcode.INVOKE_VIRTUAL &&
                    (instruction.reference as? MethodReference)?.let {
                        it.definingClass == ARRAY_LIST && it.name == "addAll"
                    } == true
            } ?: return@forEach

            // The presenter is the object the loader reads straight after storing the coupons.
            val next = instructions.getOrNull(addAllIndex + 1)
            if (next !is BuilderInstruction22c || next.opcode != Opcode.IGET_OBJECT) return@forEach
            val field = next.reference as? FieldReference ?: return@forEach

            val addAll = instructions[addAllIndex] as BuilderInstruction35c
            sites += LoaderSite(method, addAllIndex, addAll.registerC, next.registerB, field.definingClass)
        }
    }

    return sites.singleOrNull()
        ?: throw PatchException("Expected one coupon list loader, found ${sites.size}")
}

private fun MutableMethod.requireInvokeRegisters(vararg registers: Int) {
    if (registers.any { it > 15 }) {
        throw PatchException("$definingClass->$name: registers $registers are out of reach of invoke-static")
    }
}

@Suppress("unused")
val autoClaimCouponsPatch = bytecodePatch(
    name = "Auto claim coupons",
    description = "Activates every coupon that needs no article choice as soon as the coupon list loads. " +
        "Each activation is the app's own \"Activate\" action, and refusals stay silent.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LIDL_PLUS)

    extendWith(LIDL_EXTENSION)

    execute {
        checkCouponModel()

        val site = findLoaderSite()
        val presenter = mutableClassDefBy(site.presenterType)

        // The presenter's own entry point for an activation tap: static a(presenter, id, location, selection, flags).
        val activate = presenter.methods.singleOrNull { method ->
            AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "V" &&
                method.parameterTypeNames() == listOf(site.presenterType, STRING, STRING, ARRAY_LIST, "I")
        } ?: throw PatchException("${site.presenterType}: activation entry point not found")

        val couponList = presenter.fields.singleOrNull { it.type == ARRAY_LIST }
            ?: throw PatchException("${site.presenterType}: expected exactly one ArrayList field")

        // Failed activations report through (Throwable, String, String, Continuation). Silence it while
        // the extension is claiming, otherwise every coupon the server refuses would open an error.
        val errorHandler = presenter.methods.singleOrNull { method ->
            !AccessFlags.STATIC.isSet(method.accessFlags) &&
                method.returnType == "Ljava/lang/Object;" &&
                method.parameterTypeNames().let { types ->
                    types.size == 4 && types[0] == "Ljava/lang/Throwable;" && types[1] == STRING && types[2] == STRING
                }
        } ?: throw PatchException("${site.presenterType}: activation error handler not found")

        val unit = classDefBy("Lkotlin/Unit;").staticFields.singleOrNull { it.type == "Lkotlin/Unit;" }
            ?: throw PatchException("kotlin.Unit instance field not found")

        errorHandler.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $EXTENSION->suppressErrors()Z
                move-result v0
                if-eqz v0, :polishapps_continue
                sget-object v0, Lkotlin/Unit;->${unit.name}:Lkotlin/Unit;
                return-object v0
                :polishapps_continue
                nop
            """,
        )

        site.method.requireInvokeRegisters(site.presenterRegister, site.listRegister)
        site.method.addInstructions(
            site.addAllIndex + 1,
            "invoke-static {v${site.presenterRegister}, v${site.listRegister}}, " +
                "$EXTENSION->onCouponsLoaded(Ljava/lang/Object;$LIST)V",
        )

        val extension = mutableClassDefBy(EXTENSION)
        val config = extension.methods.singleOrNull { it.name == "config" && it.parameters.isEmpty() }
            ?: throw PatchException("$EXTENSION->config not found")
        val values = listOf(
            activate.name, couponList.name, COUPON_ID, COUPON_LOCATION, COUPON_ACTIVATED,
            COUPON_PROCESSING, COUPON_GROUPS, COUPON_LEVELS, LEVELS_LOCKED,
        ).joinToString(",")
        config.replaceBody(
            """
                const-string v0, "$values"
                return-object v0
            """,
        )
    }
}
