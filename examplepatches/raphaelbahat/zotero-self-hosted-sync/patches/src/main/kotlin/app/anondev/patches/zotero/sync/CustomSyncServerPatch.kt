/*
 * Copyright 2026 anondev.
 *
 * GPLv3. See the LICENSE file for details.
 */

package app.anondev.patches.zotero.sync

import app.anondev.patches.zotero.shared.Constants.COMPATIBILITY_ZOTERO
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableEncodedValue.Companion.toMutable
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue

/**
 * Rewrites Zotero's compiled sync endpoints to a self-hosted server.
 *
 * The target app compiles its service hosts in. R8 constant-propagated
 * `BuildConfig.BASE_API_URL` into `const-string` literals, so the release bytecode has no
 * single point of truth: the API base exists as 17 inlined literals (two spellings) plus the
 * surviving field initializer, and the live-update socket is a separate single literal. All of
 * them are swept here. Only string constants change — no class is renamed, removed or
 * repackaged, so the patched app keeps its identity (`org.zotero.android`, versionCode 247).
 *
 * The rewrite is on-demand (the origin only exists at patch time), so the ready-made
 * `replaceStringPatch` helper — which is not option-aware — cannot be used; the patcher-native
 * `replaceInstruction` + `BuilderInstruction21c` path is used instead.
 */
@Suppress("unused")
val customSyncServerPatch = bytecodePatch(
    name = "Custom sync server",
    description = "Redirects Zotero's sync API and live-update stream to your own server.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_ZOTERO)
    category("Sync")

    // Shared with the cleartext resource patch; both register the same Option instances.
    val server by serverOption()
    val streaming by streamingOption()

    execute {
        val origin = normaliseOrigin(server)
        val streamingUrl = resolveStreamingUrl(origin, streaming)

        // R1: every inlined API base literal. The two spellings are distinct const-string
        // literals, so swapping by exact value keeps the path that follows a "/"-suffixed site
        // valid (`<origin>/…`).
        val bareRewrites = rewriteConstString(API_LITERAL_BARE, origin)
        val slashRewrites = rewriteConstString(API_LITERAL_WITH_SLASH, "$origin/")

        // R3: the single live-update literal.
        val streamingRewrites = rewriteConstString(STREAM_LITERAL, streamingUrl)

        // R4: the app appends "&app=1" to the login URL the server returns. Against a server
        // whose login URL has no query string that makes the path "/login&app=1", which the
        // server answers 404 (measured; see ADR-0004). Replacing the literal with an empty
        // string opens the URL exactly as returned. Absence is tolerated: a future target may
        // stop appending, and the goal is the verbatim URL rather than the rewrite itself.
        rewriteConstString(LOGIN_APP_PARAM_LITERAL, "")

        // R5: the deletion precondition header, corrected everywhere it appears — the deletion
        // write and the two read paths that carried the same typo (see D10).
        if (rewriteConstString(DELETE_PRECONDITION_HEADER_MISSPELLED, DELETE_PRECONDITION_HEADER) == 0) {
            throw PatchException(
                "Custom sync server: found no '$DELETE_PRECONDITION_HEADER_MISSPELLED' string in " +
                    "the APK. The patch targets Zotero 1.0.0-247.",
            )
        }

        // R2: the BuildConfig field initializer. The field is present but unreferenced in this
        // artifact (no `sget-object` reads), so it cannot affect routing at runtime. The
        // patcher DOES expose field-value mutation — `MutableField.setInitialValue` plus
        // `EncodedValue.toMutable()` — so the cleanest handling is simply to rewrite it and
        // keep the field consistent with the inlined copies. It is treated as best-effort
        // (design D5: "when present") because a future target may drop the unreferenced field.
        rewriteBuildConfigBaseApiUrl(origin)

        val apiRewrites = bareRewrites + slashRewrites
        if (apiRewrites == 0) {
            throw PatchException(
                "Custom sync server: found no '$API_LITERAL_BARE' strings in the APK. " +
                    "The patch targets Zotero 1.0.0-247; a different build may use another " +
                    "constant form.",
            )
        }
        if (streamingRewrites == 0) {
            throw PatchException(
                "Custom sync server: found no '$STREAM_LITERAL' string in the APK. " +
                    "The patch targets Zotero 1.0.0-247.",
            )
        }
    }
}

/**
 * Replaces every `const-string` whose literal equals [from] with [to] across the whole APK.
 *
 * Classes are located by exact string pool entry ([BytecodePatchContext.getAllClassesWithString])
 * rather than by scanning all ~61k classes; each located instruction is then re-checked against
 * the current literal before being replaced, so a class containing both spellings is handled
 * correctly regardless of pass order. Replacing is index-stable (no instruction count change),
 * so forward iteration is safe.
 *
 * @return the number of instructions replaced.
 */
private fun BytecodePatchContext.rewriteConstString(from: String, to: String): Int {
    var replacements = 0

    getAllClassesWithString(from).forEach { classDef ->
        mutableClassDefBy(classDef).methods.forEach { method ->
            val instructions = method.implementation?.instructions ?: return@forEach
            instructions.forEachIndexed { index, instruction ->
                if (instruction.opcode != Opcode.CONST_STRING) return@forEachIndexed
                if (instruction !is ReferenceInstruction) return@forEachIndexed

                val reference = instruction.reference
                if (reference !is StringReference || reference.string != from) return@forEachIndexed

                val register = (instruction as OneRegisterInstruction).registerA
                method.replaceInstruction(
                    index,
                    BuilderInstruction21c(
                        Opcode.CONST_STRING,
                        register,
                        ImmutableStringReference(to),
                    ),
                )
                replacements++
            }
        }
    }

    return replacements
}

/**
 * Rewrites `BuildConfig.BASE_API_URL`'s initial value to [origin] when the field exists.
 *
 * @return true when the field was rewritten, false when the class or field is absent.
 */

private fun BytecodePatchContext.rewriteBuildConfigBaseApiUrl(origin: String): Boolean {
    val buildConfigClass = mutableClassDefByOrNull(BUILD_CONFIG_CLASS) ?: return false
    val field = buildConfigClass.staticFields
        .firstOrNull { it.name == BUILD_CONFIG_BASE_API_URL_FIELD } ?: return false

    field.setInitialValue(ImmutableStringEncodedValue(origin).toMutable())
    return true
}
