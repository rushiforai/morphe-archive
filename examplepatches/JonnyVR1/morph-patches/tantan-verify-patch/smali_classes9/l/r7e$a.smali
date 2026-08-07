.class public Ll/r7e$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/r7e;->S(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/r7e;


# direct methods
.method public constructor <init>(Ll/r7e;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/r7e$a;->b:Ll/r7e;

    .line 2
    .line 3
    iput-object p2, p0, Ll/r7e$a;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic c(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public call()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/r7e$a;->b:Ll/r7e;

    .line 2
    .line 3
    invoke-static {v0}, Ll/r7e;->J(Ll/r7e;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Ll/r7e$a;->b:Ll/r7e;

    .line 11
    .line 12
    invoke-static {v0}, Ll/r7e;->L(Ll/r7e;)Ll/y8s;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ll/x7e;

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Ll/hne0$a;

    .line 29
    .line 30
    invoke-direct {v1}, Ll/hne0$a;-><init>()V

    .line 31
    .line 32
    .line 33
    sget-object v2, Ll/htd0;->c:Ll/htd0;

    .line 34
    .line 35
    invoke-static {v2}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    check-cast v2, Ll/hiv;

    .line 40
    .line 41
    iget-object p0, p0, Ll/r7e$a;->a:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {v2, p0}, Ll/hiv;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    new-instance v3, Ll/o7e;

    .line 48
    .line 49
    invoke-direct {v3}, Ll/o7e;-><init>()V

    .line 50
    .line 51
    .line 52
    new-instance v4, Ll/p7e;

    .line 53
    .line 54
    invoke-direct {v4}, Ll/p7e;-><init>()V

    .line 55
    .line 56
    .line 57
    new-instance v5, Ll/q7e;

    .line 58
    .line 59
    invoke-direct {v5}, Ll/q7e;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string p0, "firstscreen"

    .line 63
    .line 64
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 69
    .line 70
    .line 71
    move-result-object v8

    .line 72
    const/4 v6, 0x1

    .line 73
    const/4 v7, 0x1

    .line 74
    invoke-virtual/range {v1 .. v8}, Ll/hne0$a;->w(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method
