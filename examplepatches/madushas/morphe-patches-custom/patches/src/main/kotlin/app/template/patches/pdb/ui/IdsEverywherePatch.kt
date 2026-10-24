package app.template.patches.pdb.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.template.patches.shared.Constants.PDB_COMPATIBILITY
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation

private const val EXT_PREFIX = "Lapp/template/extension/pdb/"
private const val WRAPPER_SUFFIX = "\$morphe"

/**
 * "Show profile IDs on names" — implements the `morphe_ids_everywhere` switch.
 *
 * Pdb renders profile names through one interface (obfuscated `jef` in 2.134.6 —
 * the app's `Profile` contract with `name()` / `getId()`): Soul feed cards, chat
 * headers, list rows and the own drawer all read it, and no surface shows the
 * numeric profile id next to the name (the own drawer is the only exception).
 *
 * The interface has several implementors (the full profile model, a lightweight
 * `pdb/app/repo/user/BasicUser` used by the Soul feed, chat-list models, the
 * mock-pro class, …), so patching a single class is not enough — the Soul card
 * renders a different implementor than the chat list.
 *
 * For every implementor with a concrete `name()` **and** a concrete `getId()`:
 *
 * 1. the original body is renamed to `name$morphe` (its logic is kept — some
 *    implementors add null-fallbacks or emoji), and
 * 2. a fresh `name()` is added that calls the original and routes the result
 *    through the extension:
 *
 * ```
 * name() {
 *   invoke-virtual {p0}, cls;->name$morphe()
 *   move-result-object v0
 *   invoke-virtual {p0}, cls;->getId()
 *   move-result-object v1
 *   invoke-static {v0, v1}, PdbUi;->decorateName(String, String)
 *   move-result-object v0
 *   return-object v0
 * }
 * ```
 *
 * `PdbUi.decorateName` appends `" #id"` only while the switch is on (it reads the
 * volatile `PdbUi.IDS_EVERYWHERE` flag that `PdbStartup` writes at app start), so
 * the bytecode can ship always-on and stay inert until the toggle is enabled.
 */
@Suppress("unused")
val pdbIdsEverywherePatch = bytecodePatch(
    name = "Show profile IDs on names",
    description = "Appends the numeric profile id (#1234567) after every profile " +
        "name — Soul cards, chat headers, lists. Toggle: Pdb Extras → " +
        "'Show profile IDs on names'. The bytecode ships always-on and is inert " +
        "until the switch is enabled, so the toggle works without rebuilding.",
    default = true,
) {
    compatibleWith(PDB_COMPATIBILITY)

    execute {
        fun isInterface(def: ClassDef) = AccessFlags.INTERFACE.isSet(def.accessFlags)

        fun hasNameGetId(def: ClassDef) = def.methods.any {
            AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
                it.name == "name" && it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty()
        } && def.methods.any {
            AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
                it.name == "getId" && it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty()
        }

        // 1. Find the profile contract: interfaces declaring abstract no-arg
        //    `String name()` and `String getId()`.
        val interfaceTypes = mutableSetOf<String>()
        classDefForEach { def ->
            if (isInterface(def) && hasNameGetId(def)) interfaceTypes.add(def.type)
        }
        if (interfaceTypes.isEmpty()) {
            throw IllegalStateException("Pdb profile interface (abstract name/getId) not found")
        }

        // 2. Every concrete implementor of any of those interfaces.
        val implementors = mutableListOf<ClassDef>()
        classDefForEach { def ->
            if (!isInterface(def) && def.interfaces.any { it in interfaceTypes }) implementors.add(def)
        }
        if (implementors.isEmpty()) {
            throw IllegalStateException("No implementors of the Pdb profile interface found")
        }

        var patched = 0
        for (def in implementors) {
            val mutable = mutableClassDefBy(def.type)

            val nameMethod = mutable.methods.firstOrNull {
                it.name == "name" && !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
                    it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty()
            } ?: continue
            val idMethod = mutable.methods.firstOrNull {
                it.name == "getId" && !AccessFlags.ABSTRACT.isSet(it.accessFlags) &&
                    it.returnType == "Ljava/lang/String;" && it.parameterTypes.isEmpty()
            } ?: continue
            if (mutable.methods.any { it.name == "name$WRAPPER_SUFFIX" }) continue

            // 3. Rename the original, then re-add a `name()` of the same frame that
            //    decorates the original's result.
            val originalName = "name$WRAPPER_SUFFIX"
            nameMethod.name = originalName

            val wrapper = ImmutableMethod(
                mutable.type,
                "name",
                emptyList(),
                "Ljava/lang/String;",
                AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                emptySet(),
                emptySet(),
                ImmutableMethodImplementation(3, emptyList(), emptyList(), emptyList()),
            ).toMutable()

            wrapper.addInstructions(
                0,
                """
                invoke-virtual {p0}, ${mutable.type}->name$WRAPPER_SUFFIX()Ljava/lang/String;
                move-result-object v0
                invoke-virtual {p0}, ${mutable.type}->getId()Ljava/lang/String;
                move-result-object v1
                invoke-static {v0, v1}, ${EXT_PREFIX}PdbUi;->decorateName(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
                move-result-object v0
                return-object v0
                """.trimIndent(),
            )
            mutable.methods.add(wrapper)
            patched++
        }
        if (patched == 0) throw IllegalStateException("No profile-interface implementor was patched")
    }
}
