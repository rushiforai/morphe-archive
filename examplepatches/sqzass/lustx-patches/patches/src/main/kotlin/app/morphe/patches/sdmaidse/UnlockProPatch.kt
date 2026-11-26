/*
 * Copyright 2026 sqzass.
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 */

package app.morphe.patches.sdmaidse

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.mutableClassDefBy

private const val UPGRADE_EXTENSIONS =
    "Leu/darken/sdmse/common/upgrade/UpgradeRepoExtensionsKt;"

private const val UPGRADE_INFO =
    "Leu/darken/sdmse/common/upgrade/core/UpgradeRepoFoss\$Info;"

private val INFO_CONSTRUCTOR_PARAMS = listOf(
    "Z",
    "Ljava/time/Instant;",
    "Leu/darken/sdmse/common/upgrade/core/FossUpgrade\$Type;",
    "Ljava/lang/Throwable;",
)

@Suppress("unused")
val unlockProPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Forces SD Maid SE FOSS upgrade state to Pro.",
) {
    compatibleWith(
        Compatibility(
            name = "SD Maid 2/SE",
            packageName = "eu.darken.sdmse",
            targets = listOf(
                AppTarget(
                    version = "2.2.3-rc0",
                    versionCode = 20203000,
                    description = "GitHub build, not APKMirror.",
                ),
            ),
        ),
    )

    execute {
        val info = mutableClassDefBy(UPGRADE_INFO)

        val infoConstructor = info.methods.singleOrNull { method ->
            method.name == "<init>" &&
                method.returnType == "V" &&
                method.parameterTypes == INFO_CONSTRUCTOR_PARAMS
        } ?: throw PatchException(
            "SD Maid SE: UpgradeRepoFoss\$Info.<init>(Z, Instant, Type, Throwable) not found (version drift?)",
        )

        infoConstructor.addInstructions(
            0,
            "const/4 p1, 0x1",
        )

        val extensions = mutableClassDefBy(UPGRADE_EXTENSIONS)

        val isProMethods = extensions.methods.filter { method ->
            method.name == "isPro" &&
                method.returnType == "Ljava/lang/Object;" &&
                method.parameterTypes.size == 2
        }

        if (isProMethods.isEmpty()) {
            throw PatchException("SD Maid SE: UpgradeRepoExtensionsKt.isPro(...)Object not found")
        }

        isProMethods.forEach { method ->
            method.addInstructions(
                0,
                """
                sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object p0
                """.trimIndent(),
            )
        }
    }
}
