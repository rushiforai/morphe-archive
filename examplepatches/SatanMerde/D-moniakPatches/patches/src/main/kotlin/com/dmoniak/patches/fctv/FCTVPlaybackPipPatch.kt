package com.dmoniak.patches.fctv

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FCTV
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_FCTV_TV
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_RBLIVE
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_RBLIVE_TV
import com.dmoniak.patches.shared.replaceMethod
import java.util.logging.Logger

@Suppress("unused")
val fctvPlaybackPipPatch = bytecodePatch(
    name = "Enhanced Playback & Picture-in-Picture - FCTV33 & RBTV+",
    description = "Enables Picture-in-Picture (PiP) mode across all streams, activates portrait PiP controls, adds background PiP support, and stabilizes fullscreen orientation switching on FCTV33 & RBTV+.",
) {
    compatibleWith(COMPATIBILITY_FCTV, COMPATIBILITY_FCTV_TV, COMPATIBILITY_RBLIVE, COMPATIBILITY_RBLIVE_TV)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeFCTVPlaybackPipLogic(logger)
    }
}

fun BytecodePatchContext.executeFCTVPlaybackPipLogic(logger: Logger) {
    logger.info("Executing Enhanced Playback & Picture-in-Picture patch for FCTV33...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        if (type.startsWith("Landroidx/") || type.startsWith("Landroid/")) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // 1. Force PiP capability in P2pUtils
        if (type == "Lcom/rblive/common/utils/P2pUtils;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "getPipDataEnabled" && method.returnType == "Landroidx/lifecycle/a0;") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                new-instance v0, Landroidx/lifecycle/b0;
                                sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                invoke-direct {v0, v1}, Landroidx/lifecycle/a0;-><init>(Ljava/lang/Object;)V
                                return-object v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV Playback] Forced P2pUtils->getPipDataEnabled to TRUE")
                    } catch (e: Exception) {
                        logger.warning("[FCTV Playback] Failed to hook P2pUtils->getPipDataEnabled: ${e.message}")
                    }
                }
            }
        }

        // 2. Force PiP capability in PPManager
        if (type == "Lcom/rblive/common/manager/PPManager;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "getPipDataEnabled" && method.returnType == "Landroidx/lifecycle/a0;") {
                    try {
                        mutableClass.replaceMethod(
                            method,
                            registerCount = 2,
                            smaliCode = """
                                new-instance v0, Landroidx/lifecycle/b0;
                                sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                                invoke-direct {v0, v1}, Landroidx/lifecycle/a0;-><init>(Ljava/lang/Object;)V
                                return-object v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[FCTV Playback] Forced PPManager->getPipDataEnabled to TRUE")
                    } catch (e: Exception) {
                        logger.warning("[FCTV Playback] Failed to hook PPManager->getPipDataEnabled: ${e.message}")
                    }
                }
            }
        }

        // 3. Mobile PlayerActivity: UI controls, PiP wiring, fullscreen stabilization, and background PiP
        if (type == "Lcom/rblive/app/ui/player/PlayerActivity;") {
            for (method in classDef.methods.toList()) {
                when (method.name) {
                    "m" -> if (method.returnType == "V" && method.parameterTypes.contains("Z")) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 5,
                                smaliCode = """
                                    invoke-virtual {p0}, Lcom/rblive/common/base/BaseBindingActivity;->getBinding()Lx1/a;
                                    move-result-object v0
                                    check-cast v0, Lpa/b;
                                    if-nez v0, :cond_end
                                    
                                    # 1. cly_pip View f
                                    iget-object v1, v0, Lpa/b;->f:Landroidx/constraintlayout/widget/ConstraintLayout;
                                    if-eqz v1, :cond_coord
                                    new-instance v2, Lta/g;
                                    const/4 v3, 0
                                    invoke-direct {v2, p0, v3}, Lta/g;-><init>(Lcom/rblive/app/ui/player/PlayerActivity;I)V
                                    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View${'$'}OnClickListener;)V
                                    if-eqz p1, :cond_pip_gone
                                    const/4 v2, 0
                                    goto :cond_pip_vis
                                    :cond_pip_gone
                                    const/16 v2, 8
                                    :cond_pip_vis
                                    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V
                                    
                                    :cond_coord
                                    # 2. coordinator_layout View i
                                    iget-object v1, v0, Lpa/b;->i:Landroidx/coordinatorlayout/widget/CoordinatorLayout;
                                    if-eqz v1, :cond_back
                                    if-eqz p1, :cond_coord_gone
                                    const/4 v2, 0
                                    goto :cond_coord_vis
                                    :cond_coord_gone
                                    const/16 v2, 8
                                    :cond_coord_vis
                                    invoke-virtual {v1, v2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->setVisibility(I)V
                                    
                                    :cond_back
                                    # 3. iv_player_back View u
                                    iget-object v0, v0, Lpa/b;->u:Landroid/widget/ImageView;
                                    if-eqz v0, :cond_end
                                    if-eqz p1, :cond_back_gone
                                    iget-boolean v1, p0, Lcom/rblive/app/ui/player/PlayerActivity;->i:Z
                                    if-eqz v1, :cond_back_gone
                                    const/4 v1, 0
                                    goto :cond_back_vis
                                    :cond_back_gone
                                    const/16 v1, 8
                                    :cond_back_vis
                                    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                                    
                                    :cond_end
                                    return-void
                                """.trimIndent()
                            )
                            hookedPoints++
                            logger.info("[FCTV Playback] Wired PiP click listener and unlocked cly_pip in PlayerActivity->m")
                        } catch (e: Exception) {
                            logger.warning("[FCTV Playback] Failed to hook PlayerActivity->m: ${e.message}")
                        }
                    }
                    "onConfigurationChanged" -> if (method.parameterTypes.contains("Landroid/content/res/Configuration;")) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 5,
                                smaliCode = """
                                    invoke-super {p0, p1}, Landroidx/appcompat/app/AppCompatActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V
                                    iget-boolean v0, p0, Lcom/rblive/app/ui/player/PlayerActivity;->e:Z
                                    if-eqz v0, :cond_ret
                                    iget v0, p1, Landroid/content/res/Configuration;->orientation:I
                                    iput v0, p0, Lcom/rblive/app/ui/player/PlayerActivity;->h:I
                                    invoke-virtual {p0}, Lcom/rblive/common/base/BaseBindingActivity;->getBinding()Lx1/a;
                                    move-result-object v0
                                    check-cast v0, Lpa/b;
                                    if-eqz v0, :cond_ret
                                    iget-object v0, v0, Lpa/b;->P:Lcom/rblive/common/widget/HLSVideoPlayer;
                                    if-eqz v0, :cond_ret
                                    iget v1, p0, Lcom/rblive/app/ui/player/PlayerActivity;->h:I
                                    const/4 v2, 2
                                    const/4 v3, 0
                                    if-ne v1, v2, :cond_portrait
                                    invoke-virtual {v0}, Lcom/shuyu/gsyvideoplayer/video/base/GSYVideoView;->isIfCurrentIsFullscreen()Z
                                    move-result v1
                                    if-nez v1, :cond_ret
                                    invoke-virtual {v0, v3}, Lcom/shuyu/gsyvideoplayer/video/base/GSYBaseVideoPlayer;->setShowFullAnimation(Z)V
                                    const/4 v1, 0x1
                                    invoke-virtual {v0, p0, v3, v1}, Lcom/rblive/common/widget/HLSVideoPlayer;->startWindowFullscreen(Landroid/content/Context;ZZ)Lcom/shuyu/gsyvideoplayer/video/base/GSYBaseVideoPlayer;
                                    invoke-virtual {v0, v1}, Lcom/shuyu/gsyvideoplayer/video/base/GSYBaseVideoPlayer;->setShowFullAnimation(Z)V
                                    goto :cond_ret
                                    :cond_portrait
                                    invoke-virtual {v0}, Lcom/shuyu/gsyvideoplayer/video/base/GSYVideoView;->isIfCurrentIsFullscreen()Z
                                    move-result v1
                                    if-eqz v1, :cond_ret
                                    invoke-virtual {v0}, Lcom/rblive/common/widget/HLSVideoPlayer;->onBackFullscreen()V
                                    :cond_ret
                                    return-void
                                """.trimIndent()
                            )
                            hookedPoints++
                            logger.info("[FCTV Playback] Stabilized fullscreen rotation in PlayerActivity->onConfigurationChanged")
                        } catch (e: Exception) {
                            logger.warning("[FCTV Playback] Failed to hook PlayerActivity->onConfigurationChanged: ${e.message}")
                        }
                    }
                    "o" -> if (method.returnType == "V" && method.parameterTypes.isEmpty()) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 2,
                                smaliCode = """
                                    invoke-static {p0}, Ljb/e;->b(Landroid/content/Context;)Z
                                    move-result v0
                                    if-eqz v0, :cond_not_full
                                    return-void
                                    :cond_not_full
                                    invoke-virtual {p0}, Lcom/rblive/common/base/BaseBindingActivity;->getBinding()Lx1/a;
                                    move-result-object v0
                                    check-cast v0, Lpa/b;
                                    if-eqz v0, :cond_fin
                                    iget-object v0, v0, Lpa/b;->g:Landroidx/constraintlayout/widget/ConstraintLayout;
                                    if-eqz v0, :cond_fin
                                    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I
                                    move-result v0
                                    if-nez v0, :cond_fin
                                    invoke-virtual {p0}, Lcom/rblive/app/ui/player/PlayerActivity;->p()V
                                    return-void
                                    :cond_fin
                                    invoke-virtual {p0}, Lcom/rblive/app/ui/player/PlayerActivity;->finish()V
                                    return-void
                                """.trimIndent()
                            )
                            hookedPoints++
                            logger.info("[FCTV Playback] Decoupled PlayerActivity->o from shade overlay")
                        } catch (e: Exception) {
                            logger.warning("[FCTV Playback] Failed to hook PlayerActivity->o: ${e.message}")
                        }
                    }
                    "onPause" -> if (method.returnType == "V" && method.parameterTypes.isEmpty()) {
                        try {
                            mutableClass.replaceMethod(
                                method,
                                registerCount = 5,
                                smaliCode = """
                                    sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT
                                    const/16 v1, 26
                                    if-lt v0, v1, :cond_pause_super
                                    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z
                                    move-result v0
                                    if-nez v0, :cond_pause_super
                                    invoke-static {p0}, Lq4/b2;->n(Lcom/rblive/app/ui/player/PlayerActivity;)Z
                                    move-result v0
                                    if-nez v0, :cond_pause_super
                                    invoke-virtual {p0}, Lcom/rblive/common/base/BaseBindingActivity;->getBinding()Lx1/a;
                                    move-result-object v0
                                    check-cast v0, Lpa/b;
                                    if-eqz v0, :cond_pause_super
                                    iget-object v0, v0, Lpa/b;->P:Lcom/rblive/common/widget/HLSVideoPlayer;
                                    if-eqz v0, :cond_pause_super
                                    invoke-virtual {v0}, Lcom/shuyu/gsyvideoplayer/video/base/GSYVideoView;->getCurrentState()I
                                    move-result v0
                                    const/4 v1, 5
                                    if-eq v0, v1, :cond_pause_super
                                    const/4 v1, 6
                                    if-eq v0, v1, :cond_pause_super
                                    const/4 v1, 7
                                    if-eq v0, v1, :cond_pause_super
                                    :try_start_pip
                                    invoke-static {}, Lre/o;->c()Landroid/app/PictureInPictureParams${'$'}Builder;
                                    move-result-object v0
                                    new-instance v1, Landroid/util/Rational;
                                    const/16 v2, 16
                                    const/16 v3, 9
                                    invoke-direct {v1, v2, v3}, Landroid/util/Rational;-><init>(II)V
                                    invoke-static {v0, v1}, Lre/o;->d(Landroid/app/PictureInPictureParams${'$'}Builder;Landroid/util/Rational;)Landroid/app/PictureInPictureParams${'$'}Builder;
                                    move-result-object v0
                                    invoke-static {v0}, Lre/o;->e(Landroid/app/PictureInPictureParams${'$'}Builder;)Landroid/app/PictureInPictureParams;
                                    move-result-object v0
                                    invoke-static {p0, v0}, Lre/o;->p(Lcom/rblive/app/ui/player/PlayerActivity;Landroid/app/PictureInPictureParams;)V
                                    const/4 v0, 0x1
                                    iput-boolean v0, p0, Lcom/rblive/app/ui/player/PlayerActivity;->e:Z
                                    :try_end_pip
                                    .catch Ljava/lang/Exception; {:try_start_pip .. :try_end_pip} :cond_pause_super
                                    
                                    :cond_pause_super
                                    invoke-super {p0}, Lcom/rblive/common/base/BaseActivity;->onPause()V
                                    sget v0, Landroid/os/Build${'$'}VERSION;->SDK_INT
                                    const/16 v1, 26
                                    if-lt v0, v1, :cond_pause_player
                                    invoke-static {p0}, Lq4/b2;->n(Lcom/rblive/app/ui/player/PlayerActivity;)Z
                                    move-result v0
                                    if-eqz v0, :cond_pause_player
                                    return-void
                                    
                                    :cond_pause_player
                                    invoke-virtual {p0}, Lcom/rblive/common/base/BaseBindingActivity;->getBinding()Lx1/a;
                                    move-result-object v0
                                    check-cast v0, Lpa/b;
                                    if-eqz v0, :cond_pause_done
                                    iget-object v0, v0, Lpa/b;->P:Lcom/rblive/common/widget/HLSVideoPlayer;
                                    if-eqz v0, :cond_pause_done
                                    const/4 v1, 0x1
                                    iput-boolean v1, p0, Lcom/rblive/app/ui/player/PlayerActivity;->r:Z
                                    invoke-virtual {v0}, Lcom/shuyu/gsyvideoplayer/video/base/GSYBaseVideoPlayer;->getCurrentPlayer()Lcom/shuyu/gsyvideoplayer/video/base/GSYBaseVideoPlayer;
                                    move-result-object v0
                                    invoke-virtual {v0}, Lcom/shuyu/gsyvideoplayer/video/base/GSYVideoView;->onVideoPause()V
                                    :cond_pause_done
                                    return-void
                                """.trimIndent()
                            )
                            hookedPoints++
                            logger.info("[FCTV Playback] Added background PiP auto-transition to PlayerActivity->onPause")
                        } catch (e: Exception) {
                            logger.warning("[FCTV Playback] Failed to hook PlayerActivity->onPause: ${e.message}")
                        }
                    }
                }
            }
        }
    }

    logger.info("[FCTV Playback & PiP] Total hooks applied: $hookedPoints")
}
