.class public Ll/lwj0;
.super Ll/ouj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ouj0<",
        "Ll/mwj0;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Lv/VFrame;Ll/jvj0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lv/VFrame;",
            "Ll/jvj0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/ouj0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Ll/ouj0;->i:Ll/jvj0;

    .line 5
    .line 6
    new-instance p1, Ll/mwj0;

    .line 7
    .line 8
    invoke-direct {p1, p2}, Ll/mwj0;-><init>(Lv/VFrame;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic N3(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->c3:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public static synthetic O3(Ll/lwj0;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/lwj0;->P3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V

    return-void
.end method


# virtual methods
.method public final synthetic P3(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Lc:I

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-static {p1}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/ouj0;->J3()Ll/jvj0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, p2}, Ll/jvj0;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public R3(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Ll/nuj0;->k(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance p2, Ll/jwj0;

    .line 10
    .line 11
    invoke-direct {p2, p0, p3}, Ll/jwj0;-><init>(Ll/lwj0;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/kwj0;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/kwj0;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {p2, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method
