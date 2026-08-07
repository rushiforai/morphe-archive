.class public Ll/whn0;
.super Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/a;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic P(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;->a()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic Q(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;->onSuccess(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/deg0;->e:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/deg0;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper;->a:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p1}, Ll/kzl0;->f(Ljava/lang/String;)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance p1, Ll/uhn0;

    .line 12
    .line 13
    invoke-direct {p1, p3}, Ll/uhn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;)V

    .line 14
    .line 15
    .line 16
    new-instance p2, Ll/vhn0;

    .line 17
    .line 18
    invoke-direct {p2, p3}, Ll/vhn0;-><init>(Lcom/p1/mobile/putong/live/livingroom/intl/game/sudGame/helper/BaseGameHelper$e;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, p2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 26
    .line 27
    .line 28
    return-void
.end method
