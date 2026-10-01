package app.morphe.patches.all.misc.flutter

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.resource.CpuArchitecture

@Suppress("unused")
val disableFlutterTLSVerification = rawResourcePatch(
    name = "Disable Flutter TLS verification",
    description = "Disables Flutter TLS verification, allowing to inspect traffic via a proxy.",
    default = false
) {
    val architectures = listOf(
        CpuArchitecture.ARMEABI_V7A,
        CpuArchitecture.ARM64_V8A,
        CpuArchitecture.X86,
        CpuArchitecture.X86_64
    )

    val options = architectures.map {
        booleanOption(
            key = it.arch,
            default = true,
            title = it.arch,
        )
    }

    dependsOn(
        disableFlutterTLSVerificationPatch {
            architectures.filterIndexed { index, _ -> options[index].value!! }
        }
    )
}