package ee.morphe.patches.shared.misc.signature

import com.android.tools.smali.dexlib2.analysis.reflection.util.ReflectionUtils

object Constants {
    const val SPOOF_CLASS_JAVA_NAME = "ee.morphe.extension.signature.SignatureSpoofApplication"
    val SPOOF_CLASS_SMALI_NAME: String = ReflectionUtils.javaToDexName(SPOOF_CLASS_JAVA_NAME)
}
