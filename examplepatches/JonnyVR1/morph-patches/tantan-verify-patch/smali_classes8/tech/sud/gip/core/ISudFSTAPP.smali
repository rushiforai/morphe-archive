.class public interface abstract Ltech/sud/gip/core/ISudFSTAPP;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract destroyMG()Z
.end method

.method public abstract getAiAgent()Ltech/sud/gip/core/ISudAiAgent;
.end method

.method public abstract getGameState(Ljava/lang/String;)Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract getGameView()Landroid/view/View;
.end method

.method public abstract getPlayerState(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end method

.method public abstract notifyStateChange(Ljava/lang/String;Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V
.end method

.method public abstract pauseMG()V
.end method

.method public abstract playMG()V
.end method

.method public abstract pushAudio(Ljava/nio/ByteBuffer;I)V
.end method

.method public abstract reloadMG()V
.end method

.method public abstract startMG()V
.end method

.method public abstract stopMG()V
.end method

.method public abstract updateCode(Ljava/lang/String;Ltech/sud/gip/core/ISudListenerNotifyStateChange;)V
.end method
