package app.mix.native.arm64

import app.mix.native.NativeLibraries
import app.mix.native.NativeOpcode
import app.mix.native.NativeLibPatchContext
import java.nio.file.Files
import kotlin.io.path.readBytes
import kotlin.io.path.writeBytes
import kotlin.test.Test
import kotlin.test.assertContains
import kotlin.test.assertContentEquals
import kotlin.test.assertFailsWith

class Arm64MutationTest {
    @Test
    fun semanticReturnIsEncodedAndWrittenByTheBackend() {
        val path = Files.createTempFile("native-mutation", ".so")
        try {
            val original = testElf()
            path.writeBytes(original)
            val context = NativeLibPatchContext.open(
                abi = Arm64Architecture.abi,
                files = mapOf("libtest.so" to path.toFile()),
            )
            val function = requireNotNull(context.library("libtest.so")).functions
                .single { it.entryAddress == 0x1000L }

            function.returnEarly()
            context.writeChanges()

            val expected = original.copyOf().also {
                Arm64Architecture.encode(NativeOpcode.RETURN, function.entryAddress)
                    .copyInto(it, destinationOffset = 0x100)
            }
            assertContentEquals(expected, path.readBytes())
        } finally {
            Files.deleteIfExists(path)
        }
    }

    @Test
    fun registryExposesTheArm64Backend() {
        assertContains(NativeLibraries.supportedAbis, Arm64Architecture.abi)
    }

    @Test
    fun backendRejectsAnotherElfMachine() {
        assertFailsWith<IllegalArgumentException> {
            Arm64Library.parse(testElf(machine = 40), "libtest.so")
        }
    }
}
