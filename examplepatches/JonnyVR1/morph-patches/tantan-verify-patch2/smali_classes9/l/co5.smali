.class public Ll/co5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vvl;


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ll/y20;
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
    iput-object p1, p0, Ll/co5;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/co5;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Ll/co5;->c:Ll/y20;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic c(Ll/aiv$a$a;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/aiv$a$a;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/aiv$a$a;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/aiv$a$a;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/i6t;Ljava/lang/String;Ll/aiv$a$a;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/hne0$a;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/hne0$a;-><init>()V

    .line 14
    .line 15
    .line 16
    sget-object p1, Ll/htd0;->c:Ll/htd0;

    .line 17
    .line 18
    invoke-static {p1}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ll/hiv;

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Ll/hiv;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/zn5;

    .line 32
    .line 33
    invoke-direct {v2, p3}, Ll/zn5;-><init>(Ll/aiv$a$a;)V

    .line 34
    .line 35
    .line 36
    new-instance v3, Ll/ao5;

    .line 37
    .line 38
    invoke-direct {v3, p3}, Ll/ao5;-><init>(Ll/aiv$a$a;)V

    .line 39
    .line 40
    .line 41
    new-instance v4, Ll/bo5;

    .line 42
    .line 43
    invoke-direct {v4, p3}, Ll/bo5;-><init>(Ll/aiv$a$a;)V

    .line 44
    .line 45
    .line 46
    const-string p1, "fans"

    .line 47
    .line 48
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-static {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    const/4 v5, 0x1

    .line 57
    const/4 v6, 0x1

    .line 58
    invoke-virtual/range {v0 .. v7}, Ll/hne0$a;->w(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public b()Ll/ppq;
    .locals 2

    .line 1
    new-instance v0, Ll/ppq;

    .line 2
    .line 3
    iget-object v1, p0, Ll/co5;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/co5;->c:Ll/y20;

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Ll/ppq;-><init>(Ljava/lang/String;Ll/y20;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method
