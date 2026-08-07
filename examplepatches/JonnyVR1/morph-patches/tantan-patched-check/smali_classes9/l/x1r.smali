.class public Ll/x1r;
.super Ll/o2e0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/o2e0<",
        "Ll/zit;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/o2e0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/hyr;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zit;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/x1r;->b(Ll/zit;Ll/gae0;Ll/bae0$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b(Ll/zit;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KnightGuardEvent:Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$KnightGuardEvent;->openDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p2, Ll/y1r;

    .line 12
    .line 13
    const/16 p3, 0xc8

    .line 14
    .line 15
    invoke-direct {p2, p3}, Ll/y1r;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iget-object p3, p1, Ll/hyr;->a:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p3}, Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;

    .line 21
    .line 22
    .line 23
    move-result-object p3

    .line 24
    invoke-virtual {p2, p3}, Ll/y1r;->i(Lcom/p1/mobile/putong/live/base/data/BLiveGuardType;)Ll/y1r;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    const-string p3, "source"

    .line 29
    .line 30
    invoke-virtual {p1, p3}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p2, p1}, Ll/y1r;->h(Ljava/lang/String;)Ll/y1r;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
