.class public Ll/drq;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vvl;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ll/y20;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/drq;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/drq;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/drq;->c:Ll/y20;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ll/i6t;Ljava/lang/String;Ll/aiv$a$a;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    new-instance v0, Ll/hne0$a;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/hne0$a;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v2, Ll/drq$a;

    .line 17
    .line 18
    invoke-direct {v2, p0, p3}, Ll/drq$a;-><init>(Ll/drq;Ll/aiv$a$a;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "fans"

    .line 22
    .line 23
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    const/4 v3, 0x1

    .line 32
    const-string v4, "fans_club"

    .line 33
    .line 34
    const-string v5, "join_club"

    .line 35
    .line 36
    move-object v1, p2

    .line 37
    invoke-virtual/range {v0 .. v6}, Ll/hne0$a;->u(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0$a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p2, "js"

    .line 42
    .line 43
    invoke-virtual {p0, p2}, Ll/hne0$a;->B(Ljava/lang/String;)Ll/hne0$a;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ll/hne0$a;->t()Ll/hne0;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p1, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public b()Ll/ppq;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/drq;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "joinFanBase"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/ppq;

    .line 12
    .line 13
    iget-object v1, p0, Ll/drq;->b:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Ll/drq;->c:Ll/y20;

    .line 16
    .line 17
    invoke-direct {v0, v1, p0}, Ll/ppq;-><init>(Ljava/lang/String;Ll/y20;)V

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method
