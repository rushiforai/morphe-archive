.class public interface abstract Lcom/momo/xeengine/IXEngine;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# virtual methods
.method public abstract addLibraryPath(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract getLogger()Lcom/momo/xeengine/XELogger;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end method

.method public abstract getScriptBridge()Lcom/momo/xeengine/script/ScriptBridge;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end method

.method public abstract getScriptEngine()Lcom/momo/xeengine/script/XEScriptEngine;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end method

.method public abstract getTag()Ljava/lang/String;
.end method

.method public abstract removeLibraryPath(Ljava/lang/String;)V
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract sendEvent(Lcom/momo/xeengine/event/XEvent;)V
    .param p1    # Lcom/momo/xeengine/event/XEvent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract setTag(Ljava/lang/String;)V
.end method

.method public abstract setUserAudioPlayer(Lcom/momo/xeengine/audio/IXAudioPlayer;)V
    .param p1    # Lcom/momo/xeengine/audio/IXAudioPlayer;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method public abstract showDebugInfo(Z)V
.end method
