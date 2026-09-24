package app.morphe.patches.shared

import app.morphe.patcher.patch.ApkArchitecture
import app.morphe.patcher.patch.AvailabilityResolver
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.util.p0Register
import com.android.tools.smali.dexlib2.iface.Method

fun requireArm64(default: Boolean = true) = AvailabilityResolver { _, arch ->
    when (arch) {
        ApkArchitecture.ARM64_V8A -> if (default) PatchAvailability.ENABLED else PatchAvailability.DISABLED
        else -> PatchAvailability.UNAVAILABLE
    }
}

fun Method.getRegisterName(register: Int): String {
    val firstParameterRegister = if (implementation != null) p0Register else 0

    return if (register >= firstParameterRegister) {
        "p${register - firstParameterRegister}"
    } else {
        "v$register"
    }
}