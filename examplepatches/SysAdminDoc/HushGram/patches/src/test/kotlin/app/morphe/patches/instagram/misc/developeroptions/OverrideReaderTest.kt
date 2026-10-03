/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.misc.developeroptions

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.instagram.misc.extension.originalName
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.*
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import org.junit.Assert.*
import org.junit.Test

class OverrideReaderTest {
    private val public = AccessFlags.PUBLIC.value
    private val static = public or AccessFlags.STATIC.value
    private val user = "Lcom/instagram/common/session/UserSession;"
    private val getter = "Lcom/instagram/base/activity/IgFragmentActivity;->session()Lfixture/BaseSession;"
    private fun editor() = OverrideEditor(getter, "unused", "unused", "unused")
    private fun type(name: String, prefix: String) = "Lfixture/$prefix$name;"

    @Test fun renamedNativeClassesMethodsAndFieldsStillResolveReadOnlyObjects() {
        for (prefix in listOf("", "Renamed")) {
            val patch = PatchContexts.of(classes(prefix))
            val reader = patch.findOverrideReader(editor())
            patch.fillOverrideReader(reader, editor())
            assertReader(patch, reader)
        }
    }

    @Test fun aThrowingSiblingAndAnObjectAliasPreserveTheSuccessfulSessionPath() {
        val patch = PatchContexts.of(classes("", branch = "throw"))
        val reader = patch.findOverrideReader(editor())
        patch.fillOverrideReader(reader, editor())
        assertReader(patch, reader)
    }

    @Test fun missingAmbiguousInaccessibleAndWrongObjectBoundariesRefuseBeforeAnyStubChanges() {
        val valid = classes("")
        val cases = mapOf(
            "missing diagnostic" to valid.filter { it.type != type("Diagnostics", "") },
            "duplicate diagnostic" to valid + classes("Other").filter { it.type == type("Diagnostics", "Other") },
            "missing callback" to valid.filter { it.type != type("Callback", "") },
            "missing schema" to valid.filter { it.type != type("Schema", "") },
            "duplicate schema getter" to classes("", duplicateSchema = true),
            "private store field" to classes("", privateField = true),
            "wrong session receiver" to classes("", wrongReceiver = true),
            "overwritten manager" to classes("", overwritten = true),
            "manager overwritten at branch join" to classes("", branch = "join"),
            "manager cast to another object" to classes("", wrongCast = true),
            "two session field paths" to classes("", ambiguousPath = true),
            "wrong constructor role" to classes("", wrongRole = true),
            "missing schema bridge" to valid.map { clazz -> if (clazz.type != OVERRIDE_BRIDGE) clazz else
                clazz(OVERRIDE_BRIDGE, methods = clazz.methods.filter { it.name != "getOverrideSchemaNative" }.map(ImmutableMethod::of)) },
        )
        for ((case, classes) in cases) {
            val patch = PatchContexts.of(classes)
            val before = patch.classDefBy(OVERRIDE_BRIDGE).methods.map { it.toString() to it.implementation!!.instructions.map(Any::toString) }
            val failure = runCatching { patch.fillOverrideReader(patch.findOverrideReader(editor()), editor()) }.exceptionOrNull()
            assertTrue("$case: $failure", failure?.message?.startsWith("Open developer options: ") == true)
            assertEquals(case, before, patch.classDefBy(OVERRIDE_BRIDGE).methods.map { it.toString() to it.implementation!!.instructions.map(Any::toString) })
        }
    }

    @Test fun declared449FixtureResolvesTheSessionFileAndTypedSchemaWithoutNativeWrites() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
            val roots = mutableListOf<ClassDef>()
            val types = mutableSetOf("Lcom/instagram/mainactivity/InstagramMainActivity;", "Lcom/instagram/modal/ModalActivity;",
                "Lcom/instagram/base/activity/IgFragmentActivity;", user)
            FixtureDex.forEach(bundle) { dex ->
                for (clazz in dex.classes) {
                    if (clazz.originalName() in setOf("MobileConfigRolloutDiagFragment", "QuickExperimentEditFragment") ||
                        "Lcom/facebook/mobileconfig/MobileConfigUpdateOverridesTableCallback;" in clazz.interfaces ||
                        clazz.methods.any { method -> method.implementation?.instructions?.any {
                            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string in setOf(
                                OVERRIDE_TITLE, "mc_overrides.json", "MobileConfigIdNameMappingLoader")
                        } == true }) {
                        roots += ImmutableClassDef.of(clazz)
                        clazz.methods.flatMap { it.implementation?.instructions?.toList().orEmpty() }.forEach {
                            when (val reference = (it as? ReferenceInstruction)?.reference) {
                                is MethodReference -> { types += reference.definingClass; types += reference.returnType }
                                is FieldReference -> { types += reference.definingClass; types += reference.type }
                                is TypeReference -> types += reference.type
                            }
                        }
                    }
                }
            }
            val native = (FixtureDex.classes(bundle, types).values + roots).distinctBy { it.type }
            val patch = PatchContexts.of(native + bridge() + projection())
            val reader = patch.findOverrideReader(patch.findOverrideEditor())
            patch.fillOverrideReader(reader, patch.findOverrideEditor())
            assertReader(patch, reader)
            checked += version
        }
        assertEquals("declared build has no fixture", versions, checked)
    }

    private fun assertReader(patch: BytecodePatchContext, reader: OverrideReader) {
        val methods = patch.classDefBy(OVERRIDE_BRIDGE).methods.filter { it.name.startsWith("getOverride") }
        assertEquals(4, methods.size)
        val references = methods.flatMap { it.implementation!!.instructions }.mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
        assertTrue(references.containsAll(listOf(reader.sessionFactory, reader.fileResolver, reader.schemaGetter, reader.nativeId)))
        assertFalse(references.any { it.contains("updateOverride") || it.contains("importOverrides") || it.contains("reload") || it.contains("removeOverride") })
        val store = methods.single { it.name == "getOverrideStoreNative" }.implementation!!.instructions.toList()
        assertEquals(Opcode.INSTANCE_OF, store.first().opcode)
        assertTrue(store.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == user } <
            store.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == reader.sessionFactory })
    }

    private fun classes(prefix: String, duplicateSchema: Boolean = false, privateField: Boolean = false,
                        wrongReceiver: Boolean = false, overwritten: Boolean = false, wrongRole: Boolean = false,
                        branch: String? = null, wrongCast: Boolean = false, ambiguousPath: Boolean = false): List<ClassDef> {
        val factory = type("Factory", prefix); val manager = type("Manager", prefix); val wrapper = type("Wrapper", prefix)
        val model = type("Model", prefix); val schema = type("Schema", prefix); val entry = type("Entry", prefix)
        val diagnostic = type("Diagnostics", prefix); val callback = type("Callback", prefix)
        val ctorTypes = listOf("Ljava/lang/String;", "Ljava/lang/String;") + List(7) { "I" } + List(3) { "Z" }
        val ctorFields = listOf("configName", "name", "index", "encodedConfig", "encodedIndex", "bits", "kind", "packageId", "config", "one", "two", "three")
        val ctor = "invoke-direct { p0 }, Ljava/lang/Object;-><init>()V\n" + ctorFields.mapIndexed { i, field ->
            val op = when (ctorTypes[i]) { "I" -> "iput"; "Z" -> "iput-boolean"; else -> "iput-object" }
            "$op p${i + 1}, p0, $entry->$field:${ctorTypes[i]}"
        }.joinToString("\n") + "\nreturn-void"
        val getSchema = """
            const-string v0, "MobileConfigIdNameMappingLoader"
            const-string v0, "failed to parse and get namedParamsMapList, name is null"
            new-instance v0, $entry
            invoke-direct/range { v0 .. v12 }, $entry-><init>(Ljava/lang/String;Ljava/lang/String;IIIIIIIZZZ)V
            const/4 v0, 0x0
            return-object v0
        """.trimIndent()
        return listOf(
            clazz(diagnostic, original = "MobileConfigRolloutDiagFragment", methods = listOf(method(diagnostic, "onCreate", listOf("Landroid/os/Bundle;"), "V", 5, public, """
                sget-object v0, $factory->singleton:$factory
                const-string v3, "null cannot be cast to non-null type com.instagram.quickexperiment.impl.QuickExperimentManagerImpl"
                const/4 v1, 0x0
                invoke-virtual { ${if (wrongReceiver) "v3" else "v0"}, v1 }, $factory->forSession($user)$manager
                move-result-object v2
                ${if (overwritten) "const/4 v2, 0x0" else "nop"}
                ${when (branch) {
                    "throw" -> "if-nez v1, :alive\nconst/4 v2, 0x0\nthrow v2\n:alive\nmove-object v0, v2\nmove-object v2, v0"
                    "join" -> "if-nez v1, :alive\nconst/4 v2, 0x0\ngoto :alive\n:alive\nnop"
                    else -> "nop"
                }}
                ${if (wrongCast) "check-cast v2, $wrapper" else "check-cast v2, $manager"}
                ${if (ambiguousPath) "iget-object v0, v2, $manager->otherWrapper:$wrapper\niget-object v0, v0, $wrapper->model:$model" else "nop"}
                iget-object v2, v2, $manager->wrapper:$wrapper
                iget-object v2, v2, $wrapper->model:$model
                return-void
            """.trimIndent()))),
            clazz(factory, fields = listOf(field(factory, "singleton", factory, static)), methods = listOf(method(factory, "forSession", listOf(user), manager, 2, public, "const/4 v0, 0x0\nreturn-object v0"))),
            clazz(manager, fields = listOf(field(manager, "wrapper", wrapper, if (privateField) AccessFlags.PRIVATE.value else public)) +
                if (ambiguousPath) listOf(field(manager, "otherWrapper", wrapper, public)) else emptyList()),
            clazz(wrapper, fields = listOf(field(wrapper, "model", model, public))),
            clazz(model, methods = listOf(method(model, "file", listOf(model), "Ljava/io/File;", 2, static, """
                const-string v0, "mc_overrides.json"
                const-string v0, "mobileconfig"
                invoke-virtual { p0 }, $model->getDataDirPath()Ljava/lang/String;
                const/4 v0, 0x0
                return-object v0
            """.trimIndent()), method(model, "schema", emptyList(), schema, 14, public, getSchema)) +
                if (duplicateSchema) listOf(method(model, "otherSchema", emptyList(), schema, 14, public, getSchema)) else emptyList()),
            clazz(schema, fields = listOf(field(schema, "parameters", "Ljava/util/List;", public or AccessFlags.FINAL.value))),
            clazz(entry, fields = ctorFields.mapIndexed { i, name -> field(entry, name, ctorTypes[i], public) }, methods = listOf(
                method(entry, "<init>", ctorTypes, "V", 13, public or AccessFlags.CONSTRUCTOR.value, ctor),
                method(entry, "parameterId", emptyList(), "J", 4, public, "iget v0, p0, $entry->kind:I\nconst-wide v0, 0x0\nreturn-wide v0"),
                method(entry, "configLabel", emptyList(), "Ljava/lang/String;", 3, public, """
                    iget-object v0, p0, $entry->configName:Ljava/lang/String;
                    iget v1, p0, $entry->${if (wrongRole) "index" else "config"}:I
                    const-string v1, "_"
                    return-object v0
                """.trimIndent()),
                method(entry, "parameterLabel", emptyList(), "Ljava/lang/String;", 3, public, "iget-object v0, p0, $entry->name:Ljava/lang/String;\niget v1, p0, $entry->index:I\nconst-string v1, \"_\"\nreturn-object v0")
            )),
            clazz(callback, interfaces = listOf("Lcom/facebook/mobileconfig/MobileConfigUpdateOverridesTableCallback;"), methods = listOf(method(callback, "onOverridesFileUpdated", emptyList(), "V", 2, public, "const/4 v0, 0x0\ninvoke-static { v0 }, $model->file($model)Ljava/io/File;\nreturn-void"))),
            bridge(), projection()
        )
    }

    private fun bridge() = clazz(OVERRIDE_BRIDGE, methods = listOf(
        method(OVERRIDE_BRIDGE, "openOverridesNative", listOf("Ljava/lang/Object;"), "I", 2, static, "const/4 v0, 0x0\nreturn v0"),
        method(OVERRIDE_BRIDGE, "getOverrideStoreNative", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;", 2, static, "const/4 v0, 0x0\nreturn-object v0"),
        method(OVERRIDE_BRIDGE, "getOverrideFileNative", listOf("Ljava/lang/Object;"), "Ljava/io/File;", 2, static, "const/4 v0, 0x0\nreturn-object v0"),
        method(OVERRIDE_BRIDGE, "getOverrideSchemaNative", listOf("Ljava/lang/Object;"), "Ljava/util/List;", 2, static, "const/4 v0, 0x0\nreturn-object v0"),
        method(OVERRIDE_BRIDGE, "getOverrideParameterNative", listOf("Ljava/lang/Object;"), OVERRIDE_PARAMETER, 2, static, "const/4 v0, 0x0\nreturn-object v0")
    ))
    private fun projection() = clazz(OVERRIDE_PARAMETER, methods = listOf(method(OVERRIDE_PARAMETER, "<init>",
        listOf("I", "I", "Ljava/lang/String;", "Ljava/lang/String;", "I", "J"), "V", 8, public or AccessFlags.CONSTRUCTOR.value, "return-void")))
    private fun field(owner: String, name: String, type: String, flags: Int) = ImmutableField(owner, name, type, flags, null, null, null)
    private fun clazz(type: String, fields: List<ImmutableField> = emptyList(), methods: List<ImmutableMethod> = emptyList(),
                      original: String? = null, interfaces: List<String> = emptyList()): ClassDef = ImmutableClassDef(type, public, "Ljava/lang/Object;", interfaces,
        null, null, fields + if (original == null) emptyList() else listOf(ImmutableField(type, "__redex_internal_original_name", "Ljava/lang/String;", static,
            ImmutableStringEncodedValue(original), null, null)), methods)
    private fun method(owner: String, name: String, params: List<String>, returns: String, registers: Int, flags: Int, code: String): ImmutableMethod {
        val method = MutableMethod(ImmutableMethod(owner, name, params.map { ImmutableMethodParameter(it, null, null) }, returns, flags, null, null,
            ImmutableMethodImplementation(registers, emptyList(), null, null)))
        method.addInstructionsWithLabels(0, code)
        return ImmutableMethod.of(method)
    }
}
