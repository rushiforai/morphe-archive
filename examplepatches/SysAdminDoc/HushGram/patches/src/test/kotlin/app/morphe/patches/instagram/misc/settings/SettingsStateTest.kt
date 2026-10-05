/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.settings

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.*
import org.junit.Test

class SettingsStateTest {
    @Test fun theHookIsPublicStaticInTheExtension() {
        assertTrue(ExtensionDex.classDef(ENTRY).methods.any {
            AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) &&
                "$ENTRY->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == REMOVE_FRAMEWORK_STATE
        })
    }

    @Test fun bothRemovalsUseTheProvedBundleAndKey() {
        val context = PatchContexts.of(SettingsPatchHosts.all())
        context.preserveSettingsState()
        val code = context.mutableClassDefBy(SettingsPatchHosts.STATE_HOST).methods.single().implementation!!.instructions
        assertEquals(2, code.count { (it as? ReferenceInstruction)?.reference.toString() == REMOVE_FRAMEWORK_STATE })
        assertTrue(code.filter { (it as? ReferenceInstruction)?.reference.toString() == REMOVE_FRAMEWORK_STATE }
            .all { it.opcode == Opcode.INVOKE_STATIC })
    }

    @Test fun overwrittenOriginsAndMissingCallsRefuseBeforeMutation() {
        for (replacement in listOf("const-string v0, \"unrelated\"", "move-object v1, p0", "nop")) {
            val context = PatchContexts.of(SettingsPatchHosts.all())
            val method = context.mutableClassDefBy(SettingsPatchHosts.STATE_HOST).methods.single()
            if (replacement == "nop") method.replaceInstruction(5, replacement)
            else method.addInstruction(5, replacement)
            assertThrows(replacement, PatchException::class.java) { context.preserveSettingsState() }
            assertFalse(method.implementation!!.instructions.any {
                (it as? ReferenceInstruction)?.reference.toString() == REMOVE_FRAMEWORK_STATE
            })
        }
    }

    @Test fun aBranchBypassingTheSavedBundleOriginRefuses() {
        val context = PatchContexts.of(SettingsPatchHosts.all())
        val method = context.mutableClassDefBy(SettingsPatchHosts.STATE_HOST).methods.single()
        // 2 code units for this branch, then three strings (2 each) and one move (1).
        method.addInstruction(0, com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21t(
            Opcode.IF_EQZ, 3, method.implementation!!.newLabelForIndex(4),
        ))
        assertThrows(PatchException::class.java) { context.preserveSettingsState() }
    }

    @Test fun eachDeclaredBuildReplacesBothNativePathsWithoutChangingRegisters() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
            val parents = mutableMapOf<String, String?>()
            val candidates = mutableListOf<ClassDef>()
            FixtureDex.forEach(bundle) { dex ->
                for (type in dex.classes) {
                    parents[type.type] = type.superclass
                    if (type.methods.any { method -> method.implementation?.instructions?.any {
                        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "IgFragmentActivity.internalOnCreate"
                    } == true }) candidates += ImmutableClassDef.of(type)
                }
            }
            var parent: String? = MAIN_ACTIVITY
            while (parent != null && parents.containsKey(parent)) {
                val type = parent
                if (candidates.none { it.type == type }) candidates += ImmutableClassDef(
                    type, AccessFlags.PUBLIC.value, parents[type], null, null, null, null, emptyList(),
                )
                parent = parents[type]
            }
            val original = candidates.flatMap { it.methods }.single { method ->
                method.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == "IgFragmentActivity.internalOnCreate"
                } == true
            }
            val before = original.implementation!!.instructions.toList()
            val context = PatchContexts.of(candidates)
            context.preserveSettingsState()
            val after = context.mutableClassDefBy(original.definingClass).methods.single { it.name == original.name }
                .implementation!!.instructions
            assertEquals(before.size, after.size)
            var changes = 0
            before.indices.forEach { at ->
                if ((after[at] as? ReferenceInstruction)?.reference.toString() == REMOVE_FRAMEWORK_STATE) {
                    changes++
                    assertEquals("Landroid/os/BaseBundle;->remove(Ljava/lang/String;)V",
                        (before[at] as ReferenceInstruction).reference.toString())
                    val old = before[at] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
                    val new = after[at] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
                    assertEquals(listOf(old.registerC, old.registerD), listOf(new.registerC, new.registerD))
                } else assertEquals(before[at].opcode, after[at].opcode)
            }
            assertEquals(2, changes)
            checked += version
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
