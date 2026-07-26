package dev.jason.gboardpatches.patches.gboard.features.longpressquickactions

import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardMethodBinding

internal object GboardLongPressQuickActions1777Bindings {
    const val targetVersion = "17.7.7"
    const val softKeyStockFingerprint =
        "ccda83c5c0b32d4e7bc54e7374348b8b64bee7ae3b301eb1ac1729e0c8fd7097"
    const val softKeyPatchedFingerprint =
        "648383b4f6c4ce2cddc1570d2af5127eb930b3e7c60806140697be6d5ef67b3e"
    const val pointerOwnerStockFingerprint =
        "16afa6dfb8fec13be6d660b80e7cce85563ee3bbe1563f4b5599872392549b1f"
    const val pointerOwnerEnglishQwertyFingerprint =
        "3ab05b373faf939cdd4cf3a408452b077873a0e447e3aee2c27d6712df78eb5e"
    const val pointerOwnerPatchedFingerprint =
        "636274d41a08a315d17847f0c2e2f8d3605a00fba1812d4b4f80e4de552e10b7"
    const val pointerOwnerEnglishQwertyPatchedFingerprint =
        "b90938e516cf205667e23507dbde0f37dac210c6dd6d4cb73704a9593e8838f8"

    val softKeyBind = GboardMethodBinding(
        classType = "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;",
        name = "q",
        parameterTypes = listOf("Lowd;", "J"),
        returnType = "Z",
    )

    val inputEvent = GboardMethodBinding(
        classType = "Loau;",
        name = "at",
        parameterTypes = listOf("Lnbj;"),
        returnType = "Z",
    )

    val pointerOwner = GboardMethodBinding(
        classType = "Lpbl;",
        name = "B",
        parameterTypes = listOf(
            "Lcom/google/android/libraries/inputmethod/widgets/SoftKeyView;",
            "F",
            "F",
            "J",
            "I",
        ),
        returnType = "V",
    )
}

internal fun GboardMethodBinding.descriptor(): String =
    classType + "->" + name + "(" + parameterTypes.joinToString("") + ")" + returnType
