.class public interface abstract Ltech/sud/gip/core/ISudCfg;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final ASR_LOAD_LIST:Ljava/lang/String; = "asr_load_list"

.field public static final BLOCK_COMMON_GAME_RELOAD:Ljava/lang/String; = "block_common_game_reload"

.field public static final DISABLE_AUDIO_FOCUS:Ljava/lang/String; = "disable_audio_focus"

.field public static final KEYBOARD_BOTTOM_OFFSET:Ljava/lang/String; = "keyboard_bottom_offset"

.field public static final PRIORITY_EMBEDDED_GAME_PKG:Ljava/lang/String; = "priority_embedded_game_pkg"

.field public static final RUNTIME_3D_MULTIPROCESS:Ljava/lang/String; = "runtime_3d_multiprocess"


# virtual methods
.method public abstract addEmbeddedMGPkg(JLjava/lang/String;)V
.end method

.method public abstract getAdvancedConfigMap()Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end method

.method public abstract getEmbeddedMGPkgPath(J)Ljava/lang/String;
.end method

.method public abstract getShowCustomLoading()Z
.end method

.method public abstract getShowLoadingGameBg()Z
.end method

.method public abstract removeEmbeddedMGPkg(J)V
.end method

.method public abstract setShowCustomLoading(Z)V
.end method

.method public abstract setShowLoadingGameBg(Z)V
.end method
