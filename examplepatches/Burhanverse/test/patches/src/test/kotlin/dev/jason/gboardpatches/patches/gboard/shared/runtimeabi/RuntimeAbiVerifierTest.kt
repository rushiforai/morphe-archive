package dev.jason.gboardpatches.patches.gboard.shared.runtimeabi

import org.junit.Assert.assertEquals
import org.junit.Test

class RuntimeAbiVerifierTest {
    @Test
    fun `reports a missing runtime method through the ABI verification seam`() {
        val inventory = RuntimeArtifactInventory { _, _ -> emptyList() }

        val mismatches = RuntimeAbiVerifier.verify(
            calls = listOf(RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_ENTER_SETTINGS_CONTROLLER_SCOPE),
            inventory = inventory,
        )

        assertEquals(
            listOf(
                RuntimeAbiMismatch.MissingMethod(
                    RuntimeAbi(
                        owner = "Ldev/jason/gboardpatches/extension/writingtools/GboardAiWritingToolsRuntime;",
                        name = "enterSettingsControllerScope",
                        parameters = emptyList(),
                        returnType = "V",
                        isStatic = true,
                    )
                )
            ),
            mismatches,
        )
    }

    @Test
    fun `reports a runtime method with the wrong descriptor`() {
        val inventory = RuntimeArtifactInventory { owner, name ->
            listOf(
                RuntimeArtifactMethod(
                    owner = owner,
                    name = name,
                    descriptor = "()Z",
                    isStatic = true,
                )
            )
        }

        val mismatches = RuntimeAbiVerifier.verify(
            calls = listOf(RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_ENTER_SETTINGS_CONTROLLER_SCOPE),
            inventory = inventory,
        )

        assertEquals(
            listOf(
                RuntimeAbiMismatch.WrongDescriptor(
                    expected = RuntimeAbiCatalog.abi(
                        RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_ENTER_SETTINGS_CONTROLLER_SCOPE
                    ),
                    actualDescriptors = listOf("()Z"),
                )
            ),
            mismatches,
        )
    }

    @Test
    fun `reports a runtime method with the wrong static access`() {
        val expected = RuntimeAbiCatalog.abi(
            RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_ENTER_SETTINGS_CONTROLLER_SCOPE
        )
        val inventory = RuntimeArtifactInventory { owner, name ->
            listOf(
                RuntimeArtifactMethod(
                    owner = owner,
                    name = name,
                    descriptor = expected.descriptor,
                    isStatic = false,
                )
            )
        }

        val mismatches = RuntimeAbiVerifier.verify(
            calls = listOf(RuntimeCallId.AI_WRITING_TOOLS_RUNTIME_ENTER_SETTINGS_CONTROLLER_SCOPE),
            inventory = inventory,
        )

        assertEquals(
            listOf(
                RuntimeAbiMismatch.WrongStaticAccess(
                    expected = expected,
                    actualIsStatic = false,
                )
            ),
            mismatches,
        )
    }
}
