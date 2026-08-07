.class public Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/live/eventbus/LiveEventBus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "VoiceKtvEvent"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantan/live/eventbus/LiveEventBus;


# direct methods
.method public constructor <init>(Lcom/tantan/live/eventbus/LiveEventBus;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public adjustMusicVolume()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Float;",
            "Lrx/c<",
            "Ljava/lang/Float;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_7"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public adjustRecordVolume()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Float;",
            "Lrx/c<",
            "Ljava/lang/Float;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_8"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public changeCurrentKtvPlayInfo()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_10"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public pauseMusic()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_0"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public playMusic()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_2"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public registerPlayListener()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/dn50;",
            "Lrx/c<",
            "Ll/dn50;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_5"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public removeMusic()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/String;",
            "Lrx/c<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_4"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public removePlayListener()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/dn50;",
            "Lrx/c<",
            "Ll/dn50;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_6"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public resumeMusic()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_1"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public setAudioEffectPreset()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Integer;",
            "Lrx/c<",
            "Ljava/lang/Integer;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_13"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public setEarSwitcher()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_11"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public setOriginalSwitcher()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ljava/lang/Boolean;",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_12"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public showTuningDialog()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_9"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->h(Ljava/lang/String;)Ll/v3f$d;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public switchNext()Ll/v3f$c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$c<",
            "Lrx/c<",
            "Ll/vxj0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "4_3"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ll/v3f;->i(Ljava/lang/String;)Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
