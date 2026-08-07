.class public Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantan/live/eventbus/LiveEventBus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "VoiceCallEvent"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantan/live/eventbus/LiveEventBus;


# direct methods
.method public constructor <init>(Lcom/tantan/live/eventbus/LiveEventBus;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public agreeVoiceCallEvent()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/bzm0;",
            "Lrx/c<",
            "Ll/bzm0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_0"

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

.method public callAgreedEvent()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_5"

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

.method public callApplyEvent()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/bzm0;",
            "Lrx/c<",
            "Ll/bzm0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_8"

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

.method public callMuteEvent()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/bzm0;",
            "Lrx/c<",
            "Ll/bzm0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_9"

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

.method public changeVoiceLiveMotionType()Ll/v3f$d;
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
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_11"

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

.method public enterRtcCallback()Ll/v3f$c;
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
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_13"

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

.method public leaveVoiceEvent()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Ll/bzm0;",
            "Lrx/c<",
            "Ll/bzm0;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_10"

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

.method public nineMicApplyCallChooseEvent()Ll/v3f$c;
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
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_12"

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

.method public openCallSummaryEvent()Ll/v3f$d;
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
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_2"

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

.method public openVoiceCallDlgEvent()Ll/v3f$d;
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
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_1"

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

.method public removeWaitCallEvent()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_4"

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

.method public updateApplyCountEvent()Ll/v3f$d;
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
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_3"

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

.method public updateDeputyEvent()Ll/v3f$c;
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
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_7"

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

.method public updateSelfCallEvent()Ll/v3f$d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/v3f$d<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->this$0:Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantan/live/eventbus/LiveEventBus;->a(Lcom/tantan/live/eventbus/LiveEventBus;)Ll/v3f;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "25_6"

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
