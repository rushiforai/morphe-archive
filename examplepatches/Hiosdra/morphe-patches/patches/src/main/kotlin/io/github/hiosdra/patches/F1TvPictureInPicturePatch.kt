package io.github.hiosdra.patches

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import org.w3c.dom.Element

private const val PIP_TILED_PLAYER_FACTORY =
    "Lcom/avs/f1/ui/tiledmediaplayer/TiledPlayerFactoryMobile;"
private const val PIP_TILED_PLAYER = "Lcom/avs/f1/ui/tiledmediaplayer/TiledPlayer;"

private val f1TvPictureInPictureTiledPlayerConstructorFingerprint = Fingerprint(
    definingClass = PIP_TILED_PLAYER_FACTORY,
    name = "createPlayer",
    returnType = PIP_TILED_PLAYER,
    parameters = listOf(
        "Landroidx/appcompat/app/AppCompatActivity;",
        "Lcom/avs/f1/ui/tiledmediaplayer/TiledPlayer\$ViewsHolder;",
    ),
    filters = listOf(methodCall(definingClass = PIP_TILED_PLAYER, name = "<init>")),
)

private const val MORPHE_PIP_AUTO_ENTER_METHOD = "morpheUpdatePipAutoEnter"
private const val MORPHE_PIP_DISABLE_AUTO_ENTER_METHOD = "morpheDisablePipAutoEnter"

private val f1TvPictureInPictureResourcePatch = resourcePatch(
    name = "F1 TV - Picture-in-Picture manifest",
    description = "Allows the F1 TV player activity to enter Android Picture-in-Picture mode.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_F1_TV)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val activities = manifest.getElementsByTagName("activity")
            val activity = (0 until activities.length)
                .asSequence()
                .map { activities.item(it) as? Element }
                .firstOrNull { it?.getAttribute("android:name") == "com.avs.f1.ui.player.BasePlayerActivity" }
                ?: error("F1 TV BasePlayerActivity was not found in AndroidManifest.xml")

            activity.setAttribute("android:supportsPictureInPicture", "true")
            activity.setAttribute("android:resizeableActivity", "true")

            // Entering/leaving PiP changes the window's screen layout and
            // smallest-screen-size qualifiers. Without handling those
            // changes Android recreates BasePlayerActivity, and its new
            // PlayerSwitcher is bound with the original (usually zero)
            // PlayHead instead of the current Bitmovin position.
            val configChanges = activity.getAttribute("android:configChanges")
                .split('|')
                .filter(String::isNotBlank)
                .toMutableSet()
            configChanges += listOf("screenLayout", "smallestScreenSize")
            activity.setAttribute("android:configChanges", configChanges.joinToString("|"))
        }
    }
}

@Suppress("unused")
val f1TvPictureInPicturePatch = bytecodePatch(
    name = "F1 TV - Picture-in-Picture",
    description = "Keeps F1 TV playback alive while entering Android Picture-in-Picture mode.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_F1_TV)
    dependsOn(f1TvPictureInPictureResourcePatch)
    dependsOn(f1TvBackgroundPlaybackPatch)

    execute {
        val playerClass = mutableClassDefBy(BASE_PLAYER_ACTIVITY)

        // Android 12+ expects the PiP auto-enter flag to be configured while
        // playback is active, before the Home gesture begins. The time-change
        // callback enables it as playback starts. Play/pause and cast callbacks
        // disable it at entry so their reused `this` register is still valid.
        check(playerClass.methods.none {
            it.name == MORPHE_PIP_AUTO_ENTER_METHOD || it.name == MORPHE_PIP_DISABLE_AUTO_ENTER_METHOD
        }) {
            "F1 TV PiP auto-enter helper already exists"
        }
        playerClass.methods.add(
            ImmutableMethod(
                BASE_PLAYER_ACTIVITY,
                MORPHE_PIP_AUTO_ENTER_METHOD,
                listOf<ImmutableMethodParameter>(),
                "V",
                AccessFlags.PRIVATE.value,
                emptySet(),
                emptySet(),
                ImmutableMethodImplementation(
                    3,
                    """
                        sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
                        const/16 v1, 0x1f
                        if-ge v0, v1, :supported
                        return-void
                        :supported
                        invoke-virtual {v2}, $BASE_PLAYER_ACTIVITY->isPlaying()Z
                        move-result v0
                        if-eqz v0, :disable
                        invoke-virtual {v2}, $BASE_PLAYER_ACTIVITY->isCasting()Z
                        move-result v0
                        if-nez v0, :disable
                        const/4 v0, 0x1
                        goto :update
                        :disable
                        const/4 v0, 0x0
                        :update
                        new-instance v1, Landroid/app/PictureInPictureParams${'$'}Builder;
                        invoke-direct {v1}, Landroid/app/PictureInPictureParams${'$'}Builder;-><init>()V
                        invoke-virtual {v1, v0}, Landroid/app/PictureInPictureParams${'$'}Builder;->setAutoEnterEnabled(Z)Landroid/app/PictureInPictureParams${'$'}Builder;
                        move-result-object v1
                        invoke-virtual {v1}, Landroid/app/PictureInPictureParams${'$'}Builder;->build()Landroid/app/PictureInPictureParams;
                        move-result-object v1
                        invoke-virtual {v2, v1}, Landroid/app/Activity;->setPictureInPictureParams(Landroid/app/PictureInPictureParams;)V
                        return-void
                    """.toInstructions(),
                    emptyList(),
                    emptyList(),
                ),
            ).toMutable(),
        )
        playerClass.methods.add(
            ImmutableMethod(
                BASE_PLAYER_ACTIVITY,
                MORPHE_PIP_DISABLE_AUTO_ENTER_METHOD,
                listOf<ImmutableMethodParameter>(),
                "V",
                AccessFlags.PRIVATE.value,
                emptySet(),
                emptySet(),
                ImmutableMethodImplementation(
                    3,
                    """
                        sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
                        const/16 v1, 0x1f
                        if-ge v0, v1, :supported
                        return-void
                        :supported
                        new-instance v1, Landroid/app/PictureInPictureParams${'$'}Builder;
                        invoke-direct {v1}, Landroid/app/PictureInPictureParams${'$'}Builder;-><init>()V
                        const/4 v0, 0x0
                        invoke-virtual {v1, v0}, Landroid/app/PictureInPictureParams${'$'}Builder;->setAutoEnterEnabled(Z)Landroid/app/PictureInPictureParams${'$'}Builder;
                        move-result-object v1
                        invoke-virtual {v1}, Landroid/app/PictureInPictureParams${'$'}Builder;->build()Landroid/app/PictureInPictureParams;
                        move-result-object v1
                        invoke-virtual {v2, v1}, Landroid/app/Activity;->setPictureInPictureParams(Landroid/app/PictureInPictureParams;)V
                        return-void
                    """.toInstructions(),
                    emptyList(),
                    emptyList(),
                ),
            ).toMutable(),
        )

        val timeChanged = playerClass.methods.firstOrNull {
            it.name == "onPlayerCurrentTimeChanged" &&
                it.parameterTypes.map { parameter -> parameter.toString() } == listOf("D", "D")
        } ?: error("F1 TV BasePlayerActivity.onPlayerCurrentTimeChanged() was not found")
        timeChanged.addInstructions(
            0,
            "invoke-direct {p0}, $BASE_PLAYER_ACTIVITY->$MORPHE_PIP_AUTO_ENTER_METHOD()V",
        )

        val playPressed = playerClass.methods.firstOrNull {
            it.name == "onPlayPressed" && it.parameterTypes.isEmpty()
        } ?: error("F1 TV BasePlayerActivity.onPlayPressed() was not found")
        playPressed.addInstructions(
            0,
            "invoke-direct {p0}, $BASE_PLAYER_ACTIVITY->$MORPHE_PIP_DISABLE_AUTO_ENTER_METHOD()V",
        )

        listOf("onCastStart", "onCastStarted", "onCastEnded").forEach { methodName ->
            val castCallback = playerClass.methods.firstOrNull {
                it.name == methodName && it.parameterTypes.isEmpty()
            } ?: error("F1 TV BasePlayerActivity.$methodName() was not found")
            castCallback.addInstructions(
                0,
                "invoke-direct {p0}, $BASE_PLAYER_ACTIVITY->$MORPHE_PIP_DISABLE_AUTO_ENTER_METHOD()V",
            )
        }

        if (playerClass.methods.none { it.name == "onUserLeaveHint" && it.parameterTypes.isEmpty() }) {
            playerClass.methods.add(
                ImmutableMethod(
                    BASE_PLAYER_ACTIVITY,
                    "onUserLeaveHint",
                    listOf<ImmutableMethodParameter>(),
                    "V",
                    AccessFlags.PUBLIC.value,
                    emptySet(),
                    emptySet(),
                    ImmutableMethodImplementation(
                        3,
                        """
                            invoke-super {v2}, Lcom/avs/f1/ui/BaseActivity;->onUserLeaveHint()V
                            sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
                            const/16 v1, 0x1f
                            if-lt v0, v1, :legacy_pip
                            return-void
                            :legacy_pip
                            invoke-virtual {v2}, $BASE_PLAYER_ACTIVITY->getPlayerSwitcher()$PLAYER_SWITCHER
                            move-result-object v0
                            invoke-interface {v0}, $PLAYER_SWITCHER->isPlaying()Z
                            move-result v1
                            if-eqz v1, :return
                            invoke-interface {v0}, $PLAYER_SWITCHER->isCasting()Z
                            move-result v1
                            if-nez v1, :return
                            invoke-virtual {v2}, Landroid/app/Activity;->enterPictureInPictureMode()V
                            :return
                            return-void
                        """.toInstructions(),
                        emptyList(),
                        emptyList(),
                    ),
                ).toMutable(),
            )
        }

        // Multiview uses Tiledmedia's own PiP controller. F1 TV gates that
        // controller with its in-app PiP setting, so enable the constructor
        // flag that the SDK reads when attaching its PictureInPictureManager.
        val tiledPlayer = f1TvPictureInPictureTiledPlayerConstructorFingerprint.matchOrNull()
            ?: error("F1 TV TiledPlayerFactoryMobile.createPlayer() was not found")
        check(tiledPlayer.instructionMatches.size == 1) {
            "Expected one TiledPlayer constructor call, found ${tiledPlayer.instructionMatches.size}"
        }
        val constructorIndex = tiledPlayer.instructionMatches.single().index
        val constructorCall = tiledPlayer.method.implementation!!.instructions
            .elementAt(constructorIndex) as? RegisterRangeInstruction
            ?: error("F1 TV TiledPlayer constructor call was not an invoke-range instruction")
        check(constructorCall.registerCount == 14) {
            "Expected 14 TiledPlayer constructor registers, found ${constructorCall.registerCount}"
        }
        val pipEnabledRegister = constructorCall.startRegister + 12
        check(pipEnabledRegister <= 15) {
            "TiledPlayer PiP register v$pipEnabledRegister cannot use const/4"
        }
        tiledPlayer.method.addInstructions(
            constructorIndex,
            "const/4 v$pipEnabledRegister, 0x1",
        )
    }
}
