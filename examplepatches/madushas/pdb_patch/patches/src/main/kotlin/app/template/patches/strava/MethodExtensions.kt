package app.template.patches.strava

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.template.patches.shared.cloneMutable
import com.android.tools.smali.dexlib2.builder.BuilderTryBlock
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.Method
import java.lang.reflect.Field
import java.lang.reflect.ParameterizedType

/**
 * Grow registerCount via reflection so addInstructions sees the new value.
 * (Same pattern as the accuweather/blockerhero patches — MutableMethodImplementation
 *  exposes registerCount as a final int with no public setter.)
 */
fun MutableMethod.ensureRegisters(needed: Int) {
    val impl = implementation ?: return
    if (impl.registerCount >= needed) return
    val field = registerCountField
        ?: throw PatchException("MutableMethodImplementation: no int field for registerCount")
    field.setInt(impl, needed)
}

/** Wipe body + try-blocks in place before replacing with new instructions. */
fun MutableMethod.clearBody() {
    val impl = implementation ?: return
    val field = tryBlocksField
        ?: throw PatchException("MutableMethodImplementation: no List<BuilderTryBlock> field")
    @Suppress("UNCHECKED_CAST")
    (field.get(impl) as MutableList<BuilderTryBlock>).clear()
    val n = impl.instructions.toList().size
    repeat(n) { impl.removeInstruction(0) }
}

/**
 * Clone a RaceBanner delegate with enough scratch registers for the preference
 * gate while preserving the original body's receiver/map aliases.
 *
 * The clone prologue copies the shifted p0/p1 parameters back into v0/v1.
 * The gate is inserted before that prologue; its show branch targets the
 * prologue, so the untouched delegate continues to use its original aliases.
 */
internal fun Method.cloneRaceBannerWithGate(
    markerClassType: String,
    markerFieldName: String,
    markerFieldType: String,
): MutableMethod {
    val clone = cloneMutable(additionalRegisters = 5)
    val gate = """
        invoke-static {}, Landroid/app/ActivityThread;->currentApplication()Landroid/app/Application;
        move-result-object v0
        if-eqz v0, :morphe_show
        const-string v1, "com.strava_preferences"
        const/4 v2, 0x0
        invoke-virtual {v0, v1, v2}, Landroid/app/Application;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;
        move-result-object v0
        const-string v1, "morphe.hide.performance-predictions-banner"
        const/4 v2, 0x1
        invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z
        move-result v0
        if-eqz v0, :morphe_show
        sget-object v0, ${markerClassType}->${markerFieldName}:${markerFieldType}
        return-object v0
    """.trimIndent()

    clone.addInstructionsWithLabels(
        0,
        gate,
        ExternalLabel("morphe_show", clone.getInstruction(0)),
    )
    return clone
}

private val registerCountField: Field? =
    MutableMethodImplementation::class.java.declaredFields
        .firstOrNull { it.type == Int::class.javaPrimitiveType }
        ?.apply { isAccessible = true }

private val tryBlocksField: Field? =
    MutableMethodImplementation::class.java.declaredFields
        .firstOrNull { f ->
            if (!List::class.java.isAssignableFrom(f.type)) return@firstOrNull false
            val generic = f.genericType as? ParameterizedType ?: return@firstOrNull false
            val arg = generic.actualTypeArguments.firstOrNull() ?: return@firstOrNull false
            arg.typeName == BuilderTryBlock::class.java.name ||
                arg.typeName.startsWith("${BuilderTryBlock::class.java.name}<")
        }
        ?.apply { isAccessible = true }
