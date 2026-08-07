.class public Ll/fjg;
.super Ll/fc;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/fc<",
        "Ll/cjg;",
        ">;"
    }
.end annotation


# instance fields
.field public k:I


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/fc;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/cjg;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/cjg;-><init>(Lcom/p1/mobile/android/app/Act;Ll/fjg;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic V3(Ll/fjg;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fjg;->Y3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;)V

    return-void
.end method

.method public static synthetic W3(Ll/fjg;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fjg;->Z3(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public P3()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/fjg;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public S3()Ll/ely;
    .locals 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    new-instance v0, Ll/ely;

    .line 2
    .line 3
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast p0, Ll/cjg;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/cjg;->j()Lcom/p1/mobile/putong/live/livingroom/virtual/board/accompany/FansWeekLeaderBoardContentView;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v1, 0x1

    .line 12
    const-string v2, "\u7c89\u4e1d\u699c"

    .line 13
    .line 14
    invoke-direct {v0, v2, p0, v1}, Ll/ely;-><init>(Ljava/lang/String;Landroid/view/View;I)V

    .line 15
    .line 16
    .line 17
    return-object v0
.end method

.method public T3()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public U3(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fc;->j:Ljava/lang/String;

    .line 2
    .line 3
    iget p1, p0, Ll/fjg;->k:I

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/fjg;->c4(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public X3()J
    .locals 5

    .line 1
    iget p0, p0, Ll/fjg;->k:I

    .line 2
    .line 3
    sget v0, Ll/cjg;->f:I

    .line 4
    .line 5
    const-wide/16 v1, 0x3e8

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/pzi0;->o()J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    div-long/2addr v3, v1

    .line 14
    const-wide/32 v0, 0x93a80

    .line 15
    .line 16
    .line 17
    sub-long/2addr v3, v0

    .line 18
    return-wide v3

    .line 19
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 20
    .line 21
    .line 22
    move-result-wide v3

    .line 23
    div-long/2addr v3, v1

    .line 24
    return-wide v3
.end method

.method public final synthetic Y3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/cjg;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/cjg;->q(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoard;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Z3(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/cjg;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/cjg;->i()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public a4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SchemeHandleEvent:Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SchemeHandleEvent;->handleScheme()Ll/v3f$d;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Ll/bae0$a;

    .line 20
    .line 21
    const/16 v1, 0x2be

    .line 22
    .line 23
    invoke-direct {v0, v1}, Ll/bae0$a;-><init>(I)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItem;->user:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;

    .line 27
    .line 28
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceHourLeaderBoardItemUser;->schema:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ll/bae0$a;->e(Ljava/lang/String;)Ll/bae0$a;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p1}, Ll/bae0$a;->c()Ll/bae0;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public b4()V
    .locals 1

    .line 1
    iget v0, p0, Ll/fjg;->k:I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/fjg;->c4(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c4(I)V
    .locals 8

    .line 1
    iput p1, p0, Ll/fjg;->k:I

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fjg;->X3()J

    .line 4
    .line 5
    .line 6
    move-result-wide v2

    .line 7
    iget-object v6, p0, Ll/fc;->j:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v7

    .line 13
    const-string v0, "contributor"

    .line 14
    .line 15
    const-string v1, "platform"

    .line 16
    .line 17
    const-string v4, "week"

    .line 18
    .line 19
    const-string v5, ""

    .line 20
    .line 21
    invoke-static/range {v0 .. v7}, Ll/dcr;->d(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/oo2;)Lrx/c;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance v0, Ll/djg;

    .line 30
    .line 31
    invoke-direct {v0, p0}, Ll/djg;-><init>(Ll/fjg;)V

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/ejg;

    .line 35
    .line 36
    invoke-direct {v1, p0}, Ll/ejg;-><init>(Ll/fjg;)V

    .line 37
    .line 38
    .line 39
    invoke-static {v0, v1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public init()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/cjg;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/cjg;->init()V

    .line 6
    .line 7
    .line 8
    sget v0, Ll/cjg;->e:I

    .line 9
    .line 10
    iput v0, p0, Ll/fjg;->k:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/fjg;->c4(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
