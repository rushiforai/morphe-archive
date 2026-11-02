// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.e2e

import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patcher.string
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableStringEncodedValue
import app.morphe.util.getReference
import app.morphe.util.matchAllMethodIndicesForEach
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.value.StringEncodedValue
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import com.android.tools.smali.dexlib2.immutable.value.ImmutableStringEncodedValue
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val DEFAULT_BASE_URL = "http://127.0.0.1:5080"

private val REDDIT_ORIGINS = listOf(
    "https://www.reddit.com",
    "https://oauth.reddit.com",
    "https://api.reddit.com",
    "https://ssl.reddit.com",
    "https://reddit.com",
    "https://m.reddit.com",
    "http://www.reddit.com",
    "http://reddit.com",
)

private val MEDIA_HOSTS = listOf("i.redd.it", "preview.redd.it", "v.redd.it")

// Each full URL prefix and what it becomes; paths after it are kept.
private fun redditPrefixes(baseUrl: String): List<Pair<String, String>> =
    REDDIT_ORIGINS.map { it to baseUrl } +
        MEDIA_HOSTS.map { "https://$it/" to "$baseUrl/_media/$it/" } +
        ("https://cf-baconreader.onelouder.com/" to "$baseUrl/_onelouder/")

// Reddit detects automation, rate-limits logins and changes its content, so the e2e tests talk to
// a fake Reddit server in the test process instead, which the phone reaches through
// `adb reverse`. Only full URL prefixes move: BaconReader recognizes Reddit links in posts by bare
// domains (reddit.com, v.redd.it), and those stay.
@Suppress("unused")
val e2eFakeRedditPatch = bytecodePatch(
    name = "E2E fake Reddit",
    description = "Test only: points BaconReader at a fake Reddit server instead of Reddit.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    val baseUrlOption = stringOption(
        key = "baseUrl",
        default = DEFAULT_BASE_URL,
        title = "Base URL",
        description = "The fake Reddit server's URL, such as $DEFAULT_BASE_URL.",
        required = true,
    )

    // Patches execute in name order, so "Spoof client" (which moves ssl.reddit.com to
    // www.reddit.com) and the extensions merged by later patches come after this one. Finalize
    // blocks run once every patch has executed.
    finalize {
        val prefixes = redditPrefixes(baseUrlOption.value!!.trimEnd('/'))

        prefixes.forEach { (old, new) ->
            string(old, StringComparisonType.CONTAINS).matchAllMethodIndicesForEach(false) { index ->
                val register = getInstruction<OneRegisterInstruction>(index).registerA
                val value = getInstruction(index).getReference<StringReference>()!!.string
                val moved = ImmutableStringReference(value.replace(old, new))
                replaceInstruction(index, BuilderInstruction21c(Opcode.CONST_STRING, register, moved))
            }
        }

        // Constants.REDDIT_DOMAIN and REDDIT_GALLERY_DOMAIN are read at run time, not inlined.
        val classesWithUrlFields = mutableListOf<String>()
        classDefForEach { classDef ->
            val hasUrlField = classDef.staticFields.any { field ->
                val value = (field.initialValue as? StringEncodedValue)?.value
                value != null && prefixes.any { (old, _) -> old in value }
            }
            if (hasUrlField) classesWithUrlFields += classDef.type
        }
        classesWithUrlFields.forEach { type ->
            mutableClassDefBy(type).staticFields.forEach { field ->
                val value = (field.initialValue as? StringEncodedValue)?.value ?: return@forEach
                val moved = prefixes.fold(value) { url, (old, new) -> url.replace(old, new) }
                if (moved != value) {
                    field.setInitialValue(MutableStringEncodedValue(ImmutableStringEncodedValue(moved)))
                }
            }
        }
    }
}
