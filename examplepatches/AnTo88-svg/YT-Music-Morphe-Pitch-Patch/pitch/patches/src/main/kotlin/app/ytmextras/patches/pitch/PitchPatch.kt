package app.ytmextras.patches.pitch

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val EXTENSION_CLASS = "Lapp/ytmextras/extension/pitch/PitchPatch;"
private const val PLAYER_INTERFACE = "Lapp/ytmextras/extension/pitch/PitchPlayer;"
private const val SETTINGS_ACTIVITY = "app.ytmextras.extension.pitch.PitchSettingsActivity"
private const val SETTINGS_ACTION = "app.ytmextras.action.PITCH_SETTINGS"
private const val SETTINGS_TITLE = "ytmextras_pitch_title"
private const val SETTINGS_ICON = "ytmextras_pitch_icon"
private const val MORPHE_SETTINGS_RESOURCE = "res/drawable/morphe_settings_screen_00_about.xml"

private val SETTINGS_ICON_XML = """
    <?xml version="1.0" encoding="utf-8"?>
    <vector xmlns:android="http://schemas.android.com/apk/res/android"
        android:width="24dp"
        android:height="24dp"
        android:viewportWidth="24"
        android:viewportHeight="24">
        <path
            android:fillColor="?android:attr/textColorPrimary"
            android:fillType="evenOdd"
            android:pathData="M13,4h6v4h-5v9a3.5,3.5 0 1,1 -1,-2.45zM10.5,14.5a2.5,2.5 0 1,0 0,5a2.5,2.5 0 1,0 0,-5z" />
    </vector>
""".trimIndent()

private const val PLAYER_CONTROLS_ROW = "app.ytmextras.extension.pitch.PlayerControlsRow"
private const val PLAYER_CONTROLS_LAYOUTS = "res/layout*/playback_controls.xml"

private val pitchResourcePatch = resourcePatch {
    execute {
        mapOf("values" to "Pitch", "values-it" to "Intonazione (pitch)").forEach { (values, title) ->
            get("res/$values/strings.xml").apply {
                writeText(
                    readText().replace(
                        "</resources>",
                        "<string name=\"$SETTINGS_TITLE\">$title</string></resources>"
                    )
                )
            }
        }

        get("res/drawable/$SETTINGS_ICON.xml", false).apply {
            parentFile.mkdirs()
            writeText(SETTINGS_ICON_XML)
        }

        val playerLayouts = decode(PLAYER_CONTROLS_LAYOUTS)
        if (playerLayouts.isEmpty()) {
            throw PatchException("Could not find the layout of the player controls")
        }

        playerLayouts.forEach { path ->
            document(path).use { document ->
                val row = document.createElement(PLAYER_CONTROLS_ROW).apply {
                    setAttribute("android:layout_width", "fill_parent")
                    setAttribute("android:layout_height", "48.0dip")
                    setAttribute("android:layout_below", "@id/controls_container")
                    // The shuffle and repeat icons are 32dp from the edges, the center of a 48dp button.
                    setAttribute("android:paddingStart", "8.0dip")
                    setAttribute("android:paddingEnd", "8.0dip")
                }
                document.documentElement.appendChild(row)
            }
        }

        document("AndroidManifest.xml").use { document ->
            // Exported with an action, because the package name can change while patching
            // and the intent of a preference cannot look it up at runtime.
            val activity = document.createElement("activity").apply {
                setAttribute("android:name", SETTINGS_ACTIVITY)
                setAttribute("android:exported", "true")
                setAttribute("android:excludeFromRecents", "true")
                setAttribute("android:theme", "@android:style/Theme.Material.NoActionBar")
                appendChild(
                    document.createElement("intent-filter").apply {
                        appendChild(
                            document.createElement("action").apply {
                                setAttribute("android:name", SETTINGS_ACTION)
                            }
                        )
                        appendChild(
                            document.createElement("category").apply {
                                setAttribute("android:name", "android.intent.category.DEFAULT")
                            }
                        )
                    }
                )
            }
            document.getElementsByTagName("application").item(0).appendChild(activity)
        }
    }

    // Without the Morphe settings the setting needs a place in the settings of the app.
    // The other patches can run after this one, so this has to wait for all of them.
    finalize {
        if (get(MORPHE_SETTINGS_RESOURCE).exists()) {
            return@finalize
        }

        document("res/xml/settings_headers.xml").use { document ->
            val preference = document.createElement("Preference").apply {
                setAttribute("android:key", "ytmextras_pitch")
                setAttribute("android:title", "@string/$SETTINGS_TITLE")
                appendChild(
                    document.createElement("intent").apply {
                        setAttribute("android:action", SETTINGS_ACTION)
                    }
                )
            }
            document.documentElement.appendChild(preference)
        }
    }
}

@Suppress("unused")
val pitchPatch = bytecodePatch(
    name = "Pitch Intonation",
    description = "Adds a pitch control from -2 to +2 semitones to the player that does not change " +
            "the playback speed, and a button to share the current track.",
    default = true
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    dependsOn(pitchResourcePatch)

    extendWith("extensions/pitch.mpe")

    execute {
        val parametersType = PlaybackParametersToStringFingerprint.classDef.type
        val parametersConstructor = "$parametersType-><init>(FF)V"

        val (speedField, pitchField) = PlaybackParametersToStringFingerprint.let { fingerprint ->
            fingerprint.instructionMatches.map { match ->
                fingerprint.method.getInstruction<ReferenceInstruction>(match.index)
                    .reference as FieldReference
            }
        }

        val setterFingerprint = setPlaybackParametersFingerprint(parametersType)
        val setter = setterFingerprint.method

        // Every value the app sets passes through here, including when a new track loads.
        // PlaybackParameters has final fields, so a new instance is needed.
        setter.addInstructions(
            0,
            """
                iget v0, p1, $speedField
                iget v1, p1, $pitchField
                invoke-static { p0, v0, v1 }, $EXTENSION_CLASS->overridePitch(${PLAYER_INTERFACE}FF)F
                move-result v1
                new-instance p1, $parametersType
                invoke-direct { p1, v0, v1 }, $parametersConstructor
            """
        )

        exoPlayerConstructorFingerprint(parametersType).matchAll().forEach { fingerprint ->
            val match = fingerprint.instructionMatches.first()
            val register = fingerprint.method
                .getInstruction<FiveRegisterInstruction>(match.index).registerC

            fingerprint.method.addInstruction(
                match.index + 1,
                "invoke-static { v$register }, $EXTENSION_CLASS->onPlayerCreated($PLAYER_INTERFACE)V"
            )
        }

        setterFingerprint.classDef.apply {
            interfaces.add(PLAYER_INTERFACE)

            methods.add(
                ImmutableMethod(
                    type,
                    "ytmextras_setPlaybackParameters",
                    listOf(
                        ImmutableMethodParameter("F", null, null),
                        ImmutableMethodParameter("F", null, null),
                    ),
                    "V",
                    AccessFlags.PUBLIC.value or AccessFlags.FINAL.value,
                    null,
                    null,
                    MutableMethodImplementation(4),
                ).toMutable().apply {
                    addInstructions(
                        0,
                        """
                            new-instance v0, $parametersType
                            invoke-direct { v0, p1, p2 }, $parametersConstructor
                            invoke-virtual { p0, v0 }, ${setter.definingClass}->${setter.name}($parametersType)V
                            return-void
                        """
                    )
                }
            )
        }

        VideoIdFingerprint.method.apply {
            val videoIdCallIndex = implementation!!.instructions.indexOfFirst { instruction ->
                val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                (instruction.opcode == Opcode.INVOKE_INTERFACE ||
                        instruction.opcode == Opcode.INVOKE_INTERFACE_RANGE) &&
                        reference?.returnType == "Ljava/lang/String;" &&
                        reference.parameterTypes.isEmpty()
            }
            if (videoIdCallIndex < 0) {
                throw PatchException("Could not find the call that reads the video id")
            }

            val register = getInstruction<OneRegisterInstruction>(videoIdCallIndex + 1).registerA

            addInstruction(
                videoIdCallIndex + 2,
                "invoke-static/range { v$register .. v$register }, " +
                        "$EXTENSION_CLASS->setVideoId(Ljava/lang/String;)V"
            )
        }

        MusicActivityOnCreateFingerprint.method.addInstruction(
            0,
            "invoke-static/range { p0 .. p0 }, $EXTENSION_CLASS->onActivityCreate(Landroid/app/Activity;)V"
        )
    }
}
