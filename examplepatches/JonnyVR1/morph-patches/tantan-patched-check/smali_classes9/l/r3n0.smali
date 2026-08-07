.class public final Ll/r3n0;
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

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J)\u0010\u000b\u001a\u00020\n2\u0006\u0010\u0005\u001a\u00020\u00022\u0006\u0010\u0007\u001a\u00020\u00062\u0008\u0010\t\u001a\u0004\u0018\u00010\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000c\u00a8\u0006\r"
    }
    d2 = {
        "Ll/r3n0;",
        "Ll/o2e0;",
        "Ll/zit;",
        "<init>",
        "()V",
        "liveRoomScheme",
        "Ll/gae0;",
        "plug",
        "Ll/bae0$b;",
        "extraInfo",
        "",
        "e",
        "(Ll/zit;Ll/gae0;Ll/bae0$b;)V",
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

.method public static synthetic b(Ll/gae0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/r3n0;->g(Ll/gae0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic c(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/r3n0;->h(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic d(Ll/gae0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/r3n0;->f(Ll/gae0;Landroid/view/View;)V

    return-void
.end method

.method public static final f(Ll/gae0;Landroid/view/View;)V
    .locals 1

    .line 1
    sget-object p1, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0}, Ll/jkp0;->l(Ll/i6t;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v0, p1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->W6(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/p3n0;

    .line 27
    .line 28
    invoke-direct {v0, p0}, Ll/p3n0;-><init>(Ll/gae0;)V

    .line 29
    .line 30
    .line 31
    new-instance p0, Ll/q3n0;

    .line 32
    .line 33
    invoke-direct {p0}, Ll/q3n0;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static final g(Ll/gae0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    const-string p1, "\u5df2\u53d6\u6d88\u5165\u9a7b"

    .line 2
    .line 3
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->refreshAllButton()Ll/v3f$c;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static final h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Ll/bf10;->j(Ljava/lang/Throwable;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ll/hyr;Ll/gae0;Ll/bae0$b;)V
    .locals 0

    .line 1
    check-cast p1, Ll/zit;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/r3n0;->e(Ll/zit;Ll/gae0;Ll/bae0$b;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(Ll/zit;Ll/gae0;Ll/bae0$b;)V
    .locals 0
    .param p1    # Ll/zit;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/gae0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/bae0$b;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p2}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    new-instance p1, Ll/th0$a;

    .line 14
    .line 15
    invoke-direct {p1, p0}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    const-string p0, "\u786e\u8ba4\u53d6\u6d88\u5165\u9a7b\uff1f"

    .line 19
    .line 20
    invoke-virtual {p1, p0}, Ll/th0$a;->s(Ljava/lang/String;)Ll/th0$a;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const-string p1, "\u53d6\u6d88\u5165\u9a7b\u540e\uff0c\u672c\u7fa4\u5c06\u4e0d\u4f1a\u51fa\u73b0\u5728\u4f60\u7684\u6d88\u606f\u5217\u8868\u4e2d\uff0c\u4f60\u4e5f\u4e0d\u4f1a\u518d\u6536\u5230\u672c\u7fa4\u7684\u4efb\u4f55\u6d88\u606f\u63d0\u9192\u3002"

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    sget p1, Ll/n9c0;->p0:I

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Ll/th0$a;->p(I)Ll/th0$a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    const-string p1, "\u786e\u8ba4"

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance p1, Ll/o3n0;

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ll/o3n0;-><init>(Ll/gae0;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    sget p1, Ll/n9c0;->X0:I

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/th0$a;->d(I)Ll/th0$a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "\u53d6\u6d88"

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 68
    .line 69
    .line 70
    :cond_0
    return-void
.end method
