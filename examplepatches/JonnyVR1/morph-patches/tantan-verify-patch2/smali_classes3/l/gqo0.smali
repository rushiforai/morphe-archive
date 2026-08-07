.class public final Ll/gqo0;
.super Ll/k6o0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/k6o0<",
        "Ll/jqm0;",
        "Ll/q2o0;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u000e\u0012\u0004\u0012\u00020\u0002\u0012\u0004\u0012\u00020\u00030\u0001B\u0015\u0012\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ\r\u0010\u000b\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\nJ\r\u0010\u000c\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000c\u0010\nJ\r\u0010\u000e\u001a\u00020\r\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\nR\"\u0010\u0018\u001a\u00020\u00118\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u0012\u0010\u0013\u001a\u0004\u0008\u0014\u0010\u0015\"\u0004\u0008\u0016\u0010\u0017R\u0014\u0010\u001c\u001a\u00020\u00198\u0002X\u0082D\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u001bR\u0014\u0010 \u001a\u00020\u001d8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u001f\u00a8\u0006!"
    }
    d2 = {
        "Ll/gqo0;",
        "Ll/k6o0;",
        "Ll/jqm0;",
        "Ll/q2o0;",
        "Ll/dum;",
        "info",
        "<init>",
        "(Ll/dum;)V",
        "",
        "t",
        "()V",
        "k4",
        "m4",
        "",
        "l4",
        "()Z",
        "n",
        "",
        "j",
        "Ljava/lang/String;",
        "getInviteId",
        "()Ljava/lang/String;",
        "setInviteId",
        "(Ljava/lang/String;)V",
        "inviteId",
        "",
        "k",
        "J",
        "delay_time",
        "Ljava/lang/Runnable;",
        "l",
        "Ljava/lang/Runnable;",
        "dismissRunable",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public j:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final k:J

.field public final l:Ljava/lang/Runnable;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2
    .param p1    # Ll/dum;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/jqm0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1}, Ll/k6o0;-><init>(Ll/dum;)V

    .line 5
    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    iput-object p1, p0, Ll/gqo0;->j:Ljava/lang/String;

    .line 10
    .line 11
    const-wide/32 v0, 0xea60

    .line 12
    .line 13
    .line 14
    iput-wide v0, p0, Ll/gqo0;->k:J

    .line 15
    .line 16
    new-instance p1, Ll/wpo0;

    .line 17
    .line 18
    invoke-direct {p1, p0}, Ll/wpo0;-><init>(Ll/gqo0;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Ll/gqo0;->l:Ljava/lang/Runnable;

    .line 22
    .line 23
    new-instance p1, Ll/q2o0;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/q2o0;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static a4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/r35;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b4(Ll/gqo0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceLiveManager$VoiceManagerInvite;->getInviteId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/gqo0;->j:Ljava/lang/String;

    .line 9
    .line 10
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast p1, Ll/q2o0;

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/q2o0;->e()V

    .line 15
    .line 16
    .line 17
    iget-wide v0, p0, Ll/gqo0;->k:J

    .line 18
    .line 19
    iget-object p1, p0, Ll/gqo0;->l:Ljava/lang/Runnable;

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1, p1}, Ll/i6t;->z3(JLjava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static c4(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static d4(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static e4(Ll/gqo0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/q2o0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/q2o0;->d()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static f4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/r35;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static g4(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static h4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/r35;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static i4(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/r35;->c(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static j4(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final k4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/gqo0;->l4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->INSTANCE:Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ll/jqm0;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Ll/gqo0;->j:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->approveManagerInvite(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v0, Ll/ypo0;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/ypo0;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v1, Ll/zpo0;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/zpo0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ll/jqm0;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Ll/gqo0;->j:Ljava/lang/String;

    .line 61
    .line 62
    const-string v2, "approve"

    .line 63
    .line 64
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->operationManagerInvite(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    new-instance v0, Ll/aqo0;

    .line 73
    .line 74
    invoke-direct {v0}, Ll/aqo0;-><init>()V

    .line 75
    .line 76
    .line 77
    new-instance v1, Ll/bqo0;

    .line 78
    .line 79
    invoke-direct {v1}, Ll/bqo0;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public final l4()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Ll/y6s;->b(Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final m4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/gqo0;->l4()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->INSTANCE:Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ll/jqm0;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iget-object v2, p0, Ll/gqo0;->j:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/virtual/api/VirtualVoiceRoomApiProvider;->rejectManagerInvite(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v0, Ll/cqo0;

    .line 33
    .line 34
    invoke-direct {v0}, Ll/cqo0;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v1, Ll/dqo0;

    .line 38
    .line 39
    invoke-direct {v1}, Ll/dqo0;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Ll/jqm0;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v1, p0, Ll/gqo0;->j:Ljava/lang/String;

    .line 61
    .line 62
    const-string v2, "reject"

    .line 63
    .line 64
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->operationManagerInvite(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    new-instance v0, Ll/eqo0;

    .line 73
    .line 74
    invoke-direct {v0}, Ll/eqo0;-><init>()V

    .line 75
    .line 76
    .line 77
    new-instance v1, Ll/fqo0;

    .line 78
    .line 79
    invoke-direct {v1}, Ll/fqo0;-><init>()V

    .line 80
    .line 81
    .line 82
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/gqo0;->l:Ljava/lang/Runnable;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/i6t;->E3(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/k6o0;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/jqm0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget-object v0, v0, Ll/aj1;->b0:Lrx/subjects/b;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/xpo0;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/xpo0;-><init>(Ll/gqo0;)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method
