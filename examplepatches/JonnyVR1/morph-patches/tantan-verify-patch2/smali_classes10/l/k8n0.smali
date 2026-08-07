.class public Ll/k8n0;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/oo2;",
        "Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;",
        ">;"
    }
.end annotation


# instance fields
.field public i:J

.field public j:Ljava/lang/String;

.field public k:Ljava/lang/String;

.field public l:Ljava/lang/String;

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic J3(Ll/k8n0;Ll/rz4;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k8n0;->a4(Ll/rz4;)V

    return-void
.end method

.method public static synthetic K3(Ll/k8n0;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k8n0;->V3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;)V

    return-void
.end method

.method public static synthetic L3(Ll/k8n0;Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/k8n0;->W3(Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V

    return-void
.end method

.method public static synthetic M3(Ll/k8n0;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k8n0;->j4(Z)V

    return-void
.end method

.method public static synthetic N3(Ll/k8n0;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/k8n0;->Z3(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic O3(Ll/k8n0;Ll/gw40;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k8n0;->Y3(Ll/gw40;)V

    return-void
.end method

.method public static synthetic P3(Ll/k8n0;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/k8n0;->k4(Z)V

    return-void
.end method

.method public static synthetic R3(Ll/k8n0;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/k8n0;->X3(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method private S3(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Ll/k8n0;->i:J

    .line 6
    .line 7
    sub-long/2addr v0, v2

    .line 8
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2}, Ll/vwt;->N4()J

    .line 13
    .line 14
    .line 15
    move-result-wide v2

    .line 16
    cmp-long v0, v0, v2

    .line 17
    .line 18
    if-gez v0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_0
    invoke-direct {p0, p1, p2}, Ll/k8n0;->T3(Ljava/lang/String;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method private T3(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 6

    .line 1
    invoke-static {}, Ll/pzi0;->o()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    invoke-virtual {p2}, Ll/vwt;->o4()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    const-wide/16 v4, 0x3e8

    .line 14
    .line 15
    mul-long/2addr v2, v4

    .line 16
    iget-wide v4, p0, Ll/k8n0;->i:J

    .line 17
    .line 18
    sub-long/2addr v0, v4

    .line 19
    cmp-long p2, v0, v2

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    if-gez p2, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Ll/k8n0;->j:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    xor-int/2addr p0, v0

    .line 31
    return p0

    .line 32
    :cond_0
    return v0
.end method

.method private synthetic Z3(Ll/vxj0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->z()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private g4()V
    .locals 1

    .line 1
    const-string v0, "0"

    .line 2
    .line 3
    iput-object v0, p0, Ll/k8n0;->n:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, ""

    .line 6
    .line 7
    iput-object v0, p0, Ll/k8n0;->m:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v0, p0, Ll/k8n0;->l:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private j4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->O(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public U3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->v()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic V3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomAsset;->tips:Ljava/util/List;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->J(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic W3(Ljava/lang/String;Ljava/lang/String;Ll/uxj0;)V
    .locals 1

    .line 1
    iget-object p3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p3, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 4
    .line 5
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->x()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p3

    .line 9
    const-string v0, ""

    .line 10
    .line 11
    invoke-virtual {p0, p3, p1, v0, v0}, Ll/k8n0;->l4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendMessageResult()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    sget-object p3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-virtual {p1, p3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    iput-object p1, p0, Ll/k8n0;->k:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, p2}, Ll/k8n0;->e4(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-direct {p0}, Ll/k8n0;->g4()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic X3(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    instance-of v0, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object v0, p2

    .line 9
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 10
    .line 11
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 12
    .line 13
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 16
    .line 17
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->x()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {p0, v3, p1, v1, v4}, Ll/k8n0;->l4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 30
    .line 31
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->x()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0, p1, v1, v1}, Ll/k8n0;->l4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    move v0, v2

    .line 41
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendMessageResult()Ll/v3f$d;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {p1, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    const/4 p1, 0x0

    .line 57
    iput-object p1, p0, Ll/k8n0;->k:Ljava/lang/String;

    .line 58
    .line 59
    const p1, 0xa418

    .line 60
    .line 61
    .line 62
    if-ne v0, p1, :cond_1

    .line 63
    .line 64
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    check-cast p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 71
    .line 72
    iget-object p1, p2, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {p0, v2}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 83
    .line 84
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 85
    .line 86
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    :cond_1
    invoke-static {p2}, Ll/snt;->a(Ljava/lang/Throwable;)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public final synthetic Y3(Ll/gw40;)V
    .locals 1

    .line 1
    iget-object p1, p1, Ll/gw40;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "user"

    .line 4
    .line 5
    invoke-virtual {p0, p1, v0}, Ll/k8n0;->i4(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic a4(Ll/rz4;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Ll/rz4;->a()Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessageContentInfo;->getMessageOnly()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    const-string v0, "user"

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Ll/k8n0;->i4(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public b4(Ll/vv4;)V
    .locals 2

    .line 1
    iget-object v0, p1, Ll/vv4;->c:Ljava/lang/String;

    .line 2
    .line 3
    iput-object v0, p0, Ll/k8n0;->n:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "3"

    .line 6
    .line 7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p1, Ll/vv4;->f:Ljava/lang/String;

    .line 14
    .line 15
    iput-object v0, p0, Ll/k8n0;->l:Ljava/lang/String;

    .line 16
    .line 17
    iget-object v0, p1, Ll/vv4;->b:Ljava/lang/String;

    .line 18
    .line 19
    iput-object v0, p0, Ll/k8n0;->m:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 24
    .line 25
    iget-boolean v0, p1, Ll/vv4;->a:Z

    .line 26
    .line 27
    iget-object p1, p1, Ll/vv4;->b:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->I(ZLjava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public c4()V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/k8n0;->h4()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public d4(I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;->show()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;->Hide:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;

    .line 14
    .line 15
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;->SoftKeyBoard:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;

    .line 16
    .line 17
    invoke-direct {v0, v1, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public e4(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->u(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public f4(I)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KeyboardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$KeyboardEvent;->show()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;->Show:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;

    .line 14
    .line 15
    sget-object v2, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;->SoftKeyBoard:Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;

    .line 16
    .line 17
    invoke-direct {v0, v1, v2, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData;-><init>(Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Action;Lcom/p1/mobile/putong/live/livingroom/archi/message/event/KeyboardEventData$Type;I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final h4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Ll/jqm0;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ll/jqm0;

    .line 14
    .line 15
    iget-boolean v0, v0, Ll/rwn0;->X:Z

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/jqm0;

    .line 24
    .line 25
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0}, Ll/jqm0;->b4()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getFocusUser()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v0, v1, v2}, Ll/rwn0;->c3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    new-instance v1, Ll/j8n0;

    .line 46
    .line 47
    invoke-direct {v1, p0}, Ll/j8n0;-><init>(Ll/k8n0;)V

    .line 48
    .line 49
    .line 50
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 55
    .line 56
    .line 57
    :cond_0
    return-void
.end method

.method public i4(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-direct {p0, p1, p2}, Ll/k8n0;->S3(Ljava/lang/String;Ljava/lang/String;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Ll/vwt;->Y3()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    new-instance v0, Ll/rz4$a;

    .line 27
    .line 28
    const-string v1, ""

    .line 29
    .line 30
    invoke-direct {v0, v1}, Ll/rz4$a;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Ll/k8n0;->m:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_2

    .line 40
    .line 41
    iget-object v2, p0, Ll/k8n0;->m:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    iput-object v2, p0, Ll/k8n0;->m:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    const-string v2, "3"

    .line 50
    .line 51
    iget-object v3, p0, Ll/k8n0;->n:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_3

    .line 58
    .line 59
    iget-object v2, p0, Ll/k8n0;->l:Ljava/lang/String;

    .line 60
    .line 61
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    if-nez v2, :cond_3

    .line 66
    .line 67
    iget-object v2, p0, Ll/k8n0;->m:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 70
    .line 71
    .line 72
    move-result v2

    .line 73
    if-nez v2, :cond_3

    .line 74
    .line 75
    iget-object v2, p0, Ll/k8n0;->m:Ljava/lang/String;

    .line 76
    .line 77
    const-string v3, "@"

    .line 78
    .line 79
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 80
    .line 81
    .line 82
    move-result v2

    .line 83
    if-eqz v2, :cond_3

    .line 84
    .line 85
    iget-object v2, p0, Ll/k8n0;->m:Ljava/lang/String;

    .line 86
    .line 87
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_3

    .line 92
    .line 93
    iget-object v2, p0, Ll/k8n0;->m:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    iget-object v4, p0, Ll/k8n0;->l:Ljava/lang/String;

    .line 100
    .line 101
    iput-object v4, v0, Ll/rz4$a;->b:Ljava/lang/String;

    .line 102
    .line 103
    iget-object v4, p0, Ll/k8n0;->m:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v4, v3, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    iput-object v1, v0, Ll/rz4$a;->c:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    invoke-direct {p0}, Ll/k8n0;->g4()V

    .line 113
    .line 114
    .line 115
    move-object v2, p1

    .line 116
    :goto_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 117
    .line 118
    .line 119
    move-result-wide v3

    .line 120
    iput-wide v3, p0, Ll/k8n0;->i:J

    .line 121
    .line 122
    iput-object v2, p0, Ll/k8n0;->j:Ljava/lang/String;

    .line 123
    .line 124
    iput-object p2, p0, Ll/k8n0;->k:Ljava/lang/String;

    .line 125
    .line 126
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v1, v2, v0}, Ll/oo2;->V1(Ljava/lang/String;Ll/rz4$a;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    new-instance v1, Ll/h8n0;

    .line 139
    .line 140
    invoke-direct {v1, p0, p2, p1}, Ll/h8n0;-><init>(Ll/k8n0;Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    new-instance p1, Ll/i8n0;

    .line 144
    .line 145
    invoke-direct {p1, p0, p2}, Ll/i8n0;-><init>(Ll/k8n0;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 153
    .line 154
    .line 155
    return-void
.end method

.method public final k4(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->P(Z)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/k8n0;->U3()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final l4(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/voice/chat/view/VoiceChatInputView;->r()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->chatInputClick()Ll/v3f$d;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lrx/c;

    .line 26
    .line 27
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/b8n0;

    .line 32
    .line 33
    invoke-direct {v1, p0}, Ll/b8n0;-><init>(Ll/k8n0;)V

    .line 34
    .line 35
    .line 36
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceChatEvent;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceChatEvent;->chatInputVisibleEvent()Ll/v3f$d;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lrx/c;

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Ll/c8n0;

    .line 64
    .line 65
    invoke-direct {v1, p0}, Ll/c8n0;-><init>(Ll/k8n0;)V

    .line 66
    .line 67
    .line 68
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 73
    .line 74
    .line 75
    const/4 v0, 0x3

    .line 76
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_0

    .line 81
    .line 82
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceChatEvent;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceChatEvent;->chatEmojiVisibleEvent()Ll/v3f$d;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Lrx/c;

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    new-instance v1, Ll/d8n0;

    .line 103
    .line 104
    invoke-direct {v1, p0}, Ll/d8n0;-><init>(Ll/k8n0;)V

    .line 105
    .line 106
    .line 107
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 119
    .line 120
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendNormalMessage()Ll/v3f$d;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Lrx/c;

    .line 129
    .line 130
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    new-instance v1, Ll/e8n0;

    .line 135
    .line 136
    invoke-direct {v1, p0}, Ll/e8n0;-><init>(Ll/k8n0;)V

    .line 137
    .line 138
    .line 139
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 144
    .line 145
    .line 146
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 151
    .line 152
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->dismissChatTips()Ll/v3f$c;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    new-instance v1, Ll/f8n0;

    .line 157
    .line 158
    invoke-direct {v1, p0}, Ll/f8n0;-><init>(Ll/k8n0;)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 162
    .line 163
    .line 164
    return-void

    .line 165
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->LiveBridgeImplEvent:Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;

    .line 170
    .line 171
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$LiveBridgeImplEvent;->sendChatMessage()Ll/v3f$d;

    .line 172
    .line 173
    .line 174
    move-result-object v0

    .line 175
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    check-cast v0, Lrx/c;

    .line 180
    .line 181
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 182
    .line 183
    .line 184
    move-result-object v0

    .line 185
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    new-instance v1, Ll/g8n0;

    .line 194
    .line 195
    invoke-direct {v1, p0}, Ll/g8n0;-><init>(Ll/k8n0;)V

    .line 196
    .line 197
    .line 198
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 203
    .line 204
    .line 205
    return-void
.end method
