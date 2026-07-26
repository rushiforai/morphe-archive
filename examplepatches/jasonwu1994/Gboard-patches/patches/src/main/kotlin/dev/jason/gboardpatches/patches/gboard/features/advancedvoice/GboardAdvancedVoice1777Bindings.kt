package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardMethodBinding

internal object GboardAdvancedVoice1777Bindings {
    const val targetVersion = "17.7.7"
    const val nativeReadinessStockFingerprint =
        "d392fb48e8c339ab37c8dfb508b8184fd4db17871f2c20a7da3f23122c960894"
    const val nativeReadinessPatchedFingerprint =
        "98defef48342d3d3371a87661587b40ea0348c53de9bf0b7a593bbb4834c32f2"
    const val initialVoiceSettingsStockFingerprint =
        "6ebceb3a2c11c77ff2d77acb38f1c8c1459d7af17719166be92b12c83893f6c8"
    const val initialVoiceSettingsPatchedFingerprint =
        "49f33de455812820483fef533fb31042aed7353ec78dae51286b3da444876ddd"
    const val mddProviderStockFingerprint =
        "3f9f8b74ac0f3aa3966f9fe417e40368fe0b5bfb4c5db55f4c7edd7a50be3395"
    const val mddProviderPatchedFingerprint =
        "e0ce49c2d90f9d1559ae0b8037ff33176e7020d913dd6eb2269dcb308502485d"
    const val formatterStockFingerprint =
        "521cd2e05ec5fd4c69e603c9ec8ee8ddba1afbfb1edf5319cd92172894815fe1"
    const val formatterPatchedFingerprint =
        "88a677e6155b58359f6e7cacbfd63488ddb540bf24d4e23f68ce50c6413593c1"

    val flagValue = GboardMethodBinding(
        classType = "Lneg;",
        name = "g",
        parameterTypes = emptyList(),
        returnType = "Ljava/lang/Object;",
    )

    val nativeReadiness = GboardMethodBinding(
        classType = "Lric;",
        name = "a",
        parameterTypes = emptyList(),
        returnType = "Z",
    )

    val initialVoiceSettings = GboardMethodBinding(
        classType = "Leqb;",
        name = "d",
        parameterTypes = listOf("Landroid/content/Context;", "Lptc;"),
        returnType = "V",
    )

    val mddProviderConstructor = GboardMethodBinding(
        classType = "Lqzh;",
        name = "<init>",
        parameterTypes = listOf(
            "Landroid/content/Context;",
            "Lqzi;",
            "Lqzc;",
            "Laave;",
        ),
        returnType = "V",
    )

    val formatterConstructor = GboardMethodBinding(
        classType = "Lrcb;",
        name = "<init>",
        parameterTypes = listOf(
            "Ljava/util/Locale;",
            "Leed;",
            "Lros;",
            "Ledu;",
            "Z",
            "Lrce;",
            "Lrud;",
            "Lsln;",
            "Ljava/util/concurrent/Executor;",
        ),
        returnType = "V",
    )
}

internal fun GboardMethodBinding.descriptor(): String =
    classType + "->" + name + "(" + parameterTypes.joinToString("") + ")" + returnType
