.class public Ll/fwj0;
.super Ll/ouj0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ouj0<",
        "Ll/gwj0;",
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
    new-instance p1, Ll/gwj0;

    .line 7
    .line 8
    invoke-direct {p1, p2}, Ll/gwj0;-><init>(Lv/VFrame;)V

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

.method public static synthetic O3(Ll/fwj0;Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/fwj0;->R3(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V

    return-void
.end method


# virtual methods
.method public P3(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "stopSpeak"

    .line 12
    .line 13
    invoke-static {v0, p1, v1}, Ll/nuj0;->n(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Ll/dwj0;

    .line 22
    .line 23
    invoke-direct {v0, p0}, Ll/dwj0;-><init>(Ll/fwj0;)V

    .line 24
    .line 25
    .line 26
    new-instance p0, Ll/ewj0;

    .line 27
    .line 28
    invoke-direct {p0}, Ll/ewj0;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic R3(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ouj0;->J3()Ll/jvj0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Ll/jvj0;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
