package slick.android

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// ported from the Slack "Feature flags" patch of HagiaHaya/morphe-patches (GPLv3).
private const val STORE = "Lslack/services/featureflag/store/FeatureFlagStoreImpl;"

val featureFlags =
    bytecodePatch {
        execute {
            // Remember the workspace's store once Object.<init> has run, so the flags screen can list it.
            method(STORE, "<init>").run {
                val (i) = indexed { it.opcode == Opcode.INVOKE_DIRECT && (it.ref as? MethodReference)?.name == "<init>" }.first()
                addInstructions(i + 1, call("p0", "FeatureFlags;->store(Ljava/lang/Object;)V"))
            }
            findMethod("resolve") {
                it.parameterTypes ==
                    listOf("Lslack/services/featureflag/store/FeatureFlagLayer;", "Lslack/featureflag/FeatureFlagEnum;", "Z", "Z") &&
                    it.returnType == "Z" && it.accessFlags and 0x8 != 0
            }.run {
                check(returnType == "Z" && registers == 7)
                addInstructions(
                    0,
                    """
                    invoke-static {p1}, Lslick/android/FeatureFlags;->override(Ljava/lang/Object;)I
                    move-result v0
                    if-ltz v0, :stock
                    return v0
                    :stock
                    nop
                    """,
                )
            }
        }
    }
