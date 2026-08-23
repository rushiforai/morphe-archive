package dev.jason.gboardpatches.patches.gboard.shared.runtimeabi

import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.objectweb.asm.ClassWriter
import org.objectweb.asm.Opcodes.ACC_FINAL
import org.objectweb.asm.Opcodes.ACC_PRIVATE
import org.objectweb.asm.Opcodes.ACC_PUBLIC
import org.objectweb.asm.Opcodes.ACC_STATIC
import org.objectweb.asm.Opcodes.ALOAD
import org.objectweb.asm.Opcodes.ARETURN
import org.objectweb.asm.Opcodes.DUP
import org.objectweb.asm.Opcodes.GETSTATIC
import org.objectweb.asm.Opcodes.INVOKESPECIAL
import org.objectweb.asm.Opcodes.INVOKESTATIC
import org.objectweb.asm.Opcodes.INVOKEVIRTUAL
import org.objectweb.asm.Opcodes.POP
import org.objectweb.asm.Opcodes.PUTSTATIC
import org.objectweb.asm.Opcodes.RETURN
import org.objectweb.asm.Opcodes.V17

class CompiledPatchRuntimeCallInventoryTest {
    @get:Rule
    val temporaryFolder = TemporaryFolder()

    @Test
    fun `compiled patch callers have no unregistered ABI literals or orphan call ids`() {
        val classes = File(requireNotNull(System.getProperty("gboard.compiledPatchClasses")))
        val inventory = CompiledPatchRuntimeCallInventory.read(classes)

        assertEquals(emptySet<String>(), inventory.unregisteredRuntimeReferences)
        assertEquals(RuntimeCallId.entries.toSet(), inventory.usedCallIds)
    }

    @Test
    fun `orphan call id reference does not count as emitted runtime call`() {
        val call = RuntimeCallId.entries.first()
        val classes = fixtureClass("fixture/OrphanCallId") { writer ->
            writer.method("call", "()V") {
                visitFieldInsn(GETSTATIC, RUNTIME_CALL_ID_OWNER, call.name, RUNTIME_CALL_ID_DESCRIPTOR)
                visitInsn(POP)
                visitInsn(RETURN)
            }
        }

        val inventory = CompiledPatchRuntimeCallInventory.read(classes)

        assertFalse(call in inventory.usedCallIds)
    }

    @Test
    fun `orphan call id beside helper emitting another id does not count`() {
        val orphan = RuntimeCallId.entries[0]
        val emitted = RuntimeCallId.entries[1]
        val owner = "fixture/OrphanBesideHelper"
        val classes = fixtureClass(owner) { writer ->
            writer.method("call", "()V") {
                visitFieldInsn(GETSTATIC, RUNTIME_CALL_ID_OWNER, orphan.name, RUNTIME_CALL_ID_DESCRIPTOR)
                visitInsn(POP)
                visitMethodInsn(INVOKESTATIC, owner, "emit", "()Ljava/lang/String;", false)
                visitInsn(POP)
                visitInsn(RETURN)
            }
            writer.method("emit", "()Ljava/lang/String;") {
                visitFieldInsn(GETSTATIC, RUNTIME_CALL_ID_OWNER, emitted.name, RUNTIME_CALL_ID_DESCRIPTOR)
                visitLdcInsn("")
                visitMethodInsn(
                    INVOKESTATIC,
                    RUNTIME_CALL_EMITTER_OWNER,
                    "invoke",
                    "($RUNTIME_CALL_ID_DESCRIPTOR" + "Ljava/lang/String;)Ljava/lang/String;",
                    false,
                )
                visitInsn(ARETURN)
            }
        }

        val inventory = CompiledPatchRuntimeCallInventory.read(classes)

        assertEquals(setOf(emitted), inventory.usedCallIds)
    }

    @Test
    fun `call id passed through local helper counts as emitted runtime call`() {
        val call = RuntimeCallId.entries.first()
        val owner = "fixture/HelperCall"
        val classes = fixtureClass(owner) { writer ->
            writer.method("call", "()V") {
                visitFieldInsn(GETSTATIC, RUNTIME_CALL_ID_OWNER, call.name, RUNTIME_CALL_ID_DESCRIPTOR)
                visitMethodInsn(
                    INVOKESTATIC,
                    owner,
                    "emit",
                    "($RUNTIME_CALL_ID_DESCRIPTOR)Ljava/lang/String;",
                    false,
                )
                visitInsn(POP)
                visitInsn(RETURN)
            }
            writer.method("emit", "($RUNTIME_CALL_ID_DESCRIPTOR)Ljava/lang/String;") {
                visitVarInsn(ALOAD, 0)
                visitLdcInsn("")
                visitMethodInsn(
                    INVOKESTATIC,
                    RUNTIME_CALL_EMITTER_OWNER,
                    "invoke",
                    "($RUNTIME_CALL_ID_DESCRIPTOR" + "Ljava/lang/String;)Ljava/lang/String;",
                    false,
                )
                visitInsn(ARETURN)
            }
        }

        val inventory = CompiledPatchRuntimeCallInventory.read(classes)

        assertTrue(call in inventory.usedCallIds)
    }

    @Test
    fun `call id field alias passed to emitter counts as emitted runtime call`() {
        val call = RuntimeCallId.entries.first()
        val owner = "fixture/AliasCall"
        val classes = fixtureClass(owner) { writer ->
            writer.visitField(ACC_PRIVATE or ACC_STATIC or ACC_FINAL, "CALL", RUNTIME_CALL_ID_DESCRIPTOR, null, null)
                .visitEnd()
            writer.method("<clinit>", "()V") {
                visitFieldInsn(GETSTATIC, RUNTIME_CALL_ID_OWNER, call.name, RUNTIME_CALL_ID_DESCRIPTOR)
                visitFieldInsn(PUTSTATIC, owner, "CALL", RUNTIME_CALL_ID_DESCRIPTOR)
                visitInsn(RETURN)
            }
            writer.method("call", "()V") {
                visitFieldInsn(GETSTATIC, owner, "CALL", RUNTIME_CALL_ID_DESCRIPTOR)
                visitLdcInsn("")
                visitMethodInsn(
                    INVOKESTATIC,
                    RUNTIME_CALL_EMITTER_OWNER,
                    "invoke",
                    "($RUNTIME_CALL_ID_DESCRIPTOR" + "Ljava/lang/String;)Ljava/lang/String;",
                    false,
                )
                visitInsn(POP)
                visitInsn(RETURN)
            }
        }

        val inventory = CompiledPatchRuntimeCallInventory.read(classes)

        assertTrue(call in inventory.usedCallIds)
    }

    @Test
    fun `split raw ABI literal built with StringBuilder is reported`() {
        val owner = "fixture/SplitRawReference"
        val expected = "Ldev/jason/gboardpatches/extension/example/Runtime;->call()V"
        val classes = fixtureClass(owner) { writer ->
            writer.method("rawReference", "()Ljava/lang/String;") {
                visitTypeInsn(org.objectweb.asm.Opcodes.NEW, "java/lang/StringBuilder")
                visitInsn(DUP)
                visitMethodInsn(INVOKESPECIAL, "java/lang/StringBuilder", "<init>", "()V", false)
                visitLdcInsn("Ldev/jason/gboardpatches/")
                visitMethodInsn(
                    INVOKEVIRTUAL,
                    "java/lang/StringBuilder",
                    "append",
                    "(Ljava/lang/String;)Ljava/lang/StringBuilder;",
                    false,
                )
                visitLdcInsn("extension/example/Runtime;->call()V")
                visitMethodInsn(
                    INVOKEVIRTUAL,
                    "java/lang/StringBuilder",
                    "append",
                    "(Ljava/lang/String;)Ljava/lang/StringBuilder;",
                    false,
                )
                visitMethodInsn(
                    INVOKEVIRTUAL,
                    "java/lang/StringBuilder",
                    "toString",
                    "()Ljava/lang/String;",
                    false,
                )
                visitInsn(ARETURN)
            }
        }

        val inventory = CompiledPatchRuntimeCallInventory.read(classes)

        assertEquals(setOf(expected), inventory.unregisteredRuntimeReferences)
    }

    @Test
    fun `unrelated LDC beside StringBuilder chain is not concatenated`() {
        val owner = "fixture/UnrelatedBuilderLiteral"
        val classes = fixtureClass(owner) { writer ->
            writer.method("notRawReference", "()Ljava/lang/String;") {
                visitTypeInsn(org.objectweb.asm.Opcodes.NEW, "java/lang/StringBuilder")
                visitInsn(DUP)
                visitMethodInsn(INVOKESPECIAL, "java/lang/StringBuilder", "<init>", "()V", false)
                visitLdcInsn("extension/example/Runtime;->call()V")
                visitMethodInsn(
                    INVOKEVIRTUAL,
                    "java/lang/StringBuilder",
                    "append",
                    "(Ljava/lang/String;)Ljava/lang/StringBuilder;",
                    false,
                )
                visitLdcInsn("Ldev/jason/gboardpatches/")
                visitInsn(POP)
                visitMethodInsn(
                    INVOKEVIRTUAL,
                    "java/lang/StringBuilder",
                    "toString",
                    "()Ljava/lang/String;",
                    false,
                )
                visitInsn(ARETURN)
            }
        }

        val inventory = CompiledPatchRuntimeCallInventory.read(classes)

        assertEquals(emptySet<String>(), inventory.unregisteredRuntimeReferences)
    }

    @Test
    fun `unused constant pool ABI text is not reported`() {
        val classes = fixtureClass("fixture/UnusedConstant") { writer ->
            writer.visitField(
                ACC_PRIVATE or ACC_STATIC or ACC_FINAL,
                "UNUSED",
                "Ljava/lang/String;",
                null,
                "Ldev/jason/gboardpatches/extension/example/Runtime;->call()V",
            ).visitEnd()
        }

        val inventory = CompiledPatchRuntimeCallInventory.read(classes)

        assertEquals(emptySet<String>(), inventory.unregisteredRuntimeReferences)
    }

    private fun fixtureClass(
        internalName: String,
        body: (ClassWriter) -> Unit,
    ): File {
        val classes = temporaryFolder.newFolder()
        val writer = ClassWriter(ClassWriter.COMPUTE_FRAMES or ClassWriter.COMPUTE_MAXS)
        writer.visit(V17, ACC_PUBLIC or ACC_FINAL, internalName, null, "java/lang/Object", null)
        body(writer)
        writer.visitEnd()
        val output = classes.resolve("$internalName.class")
        output.parentFile.mkdirs()
        output.writeBytes(writer.toByteArray())
        return classes
    }

    private fun ClassWriter.method(
        name: String,
        descriptor: String,
        body: org.objectweb.asm.MethodVisitor.() -> Unit,
    ) {
        visitMethod(ACC_PUBLIC or ACC_STATIC, name, descriptor, null, null).apply {
            visitCode()
            body()
            visitMaxs(0, 0)
            visitEnd()
        }
    }

    private companion object {
        const val RUNTIME_CALL_ID_OWNER =
            "dev/jason/gboardpatches/patches/gboard/shared/runtimeabi/RuntimeCallId"
        const val RUNTIME_CALL_ID_DESCRIPTOR = "L$RUNTIME_CALL_ID_OWNER;"
        const val RUNTIME_CALL_EMITTER_OWNER =
            "dev/jason/gboardpatches/patches/gboard/shared/runtimeabi/RuntimeCallEmitter"
    }
}
