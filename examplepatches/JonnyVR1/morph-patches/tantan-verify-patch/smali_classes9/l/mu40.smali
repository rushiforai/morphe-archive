.class public Ll/mu40;
.super Ll/dw40;
.source "SourceFile"


# instance fields
.field public H:Ljava/lang/String;

.field public I:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/ew40;Ll/ajt;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/dw40;-><init>(Ll/ew40;Ll/ajt;)V

    .line 2
    .line 3
    .line 4
    const-string p1, "normal"

    .line 5
    .line 6
    iput-object p1, p0, Ll/mu40;->H:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic G2(Ll/mu40;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lcom/p1/mobile/putong/live/base/data/BLiveRoom;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mu40;->P2(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H2(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->EMPTY:Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRoom;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->title:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {}, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->new_()Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;->media:Lcom/p1/mobile/putong/data/Picture;

    .line 20
    .line 21
    iput-object p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;->cover:Lcom/p1/mobile/putong/live/base/data/BLiveRoomCover;

    .line 22
    .line 23
    invoke-static {p2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->i4(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    invoke-static {p2}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public static synthetic I2(Ll/mu40;Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lcom/p1/mobile/putong/live/base/data/BLiveRoom;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mu40;->Q2(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public F0()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public J2()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mu40;->I:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public K2()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mu40;->H:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public L2(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;)Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/data/Picture;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRoom;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/dw40;->B2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dw40;->A2()Ll/ew40;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/ew40;->e()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->T5(ZLjava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/ku40;

    .line 27
    .line 28
    invoke-direct {v1, p1, p2}, Ll/ku40;-><init>(Ljava/lang/String;Lcom/p1/mobile/putong/data/Picture;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance p2, Ll/lu40;

    .line 36
    .line 37
    invoke-direct {p2, p0}, Ll/lu40;-><init>(Ll/mu40;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public M2()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/mu40;->N2()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public N2()Z
    .locals 1

    .line 1
    const-string v0, "moment-nearby-match"

    .line 2
    .line 3
    iget-object p0, p0, Ll/mu40;->I:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public O2()Z
    .locals 1

    .line 1
    const-string v0, "obs"

    .line 2
    .line 3
    iget-object p0, p0, Ll/mu40;->H:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic P2(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lcom/p1/mobile/putong/live/base/data/BLiveRoom;
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/oo2;->i(Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Ll/lej0;->INSTANCE:Ll/lej0;

    .line 5
    .line 6
    const-string v0, "create_live_room"

    .line 7
    .line 8
    const-string v1, "getRoomInfoWithCreating"

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Ll/lej0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-object p1
.end method

.method public final synthetic Q2(Lcom/p1/mobile/putong/live/base/data/BLiveRoom;)Lcom/p1/mobile/putong/live/base/data/BLiveRoom;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/oo2;->i(Lcom/p1/mobile/putong/live/base/data/BLiveAbsRoom;)V

    .line 2
    .line 3
    .line 4
    return-object p1
.end method

.method public R2()Lrx/c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveRoom;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/dw40;->B2()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/dw40;->A2()Ll/ew40;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/ew40;->e()Lcom/p1/mobile/putong/live/base/data/BLiveRoom;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 v0, 0x1

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->T5(ZLjava/lang/String;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ll/ju40;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/ju40;-><init>(Ll/mu40;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    return-object p0
.end method

.method public S2(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p1, ""

    .line 8
    .line 9
    :cond_0
    iput-object p1, p0, Ll/mu40;->I:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public T2(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/mu40;->H:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public h(Ll/jsv;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vp20;->b:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ll/jsv;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/jsv;->a()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x4

    .line 16
    if-eq v0, v1, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Ll/vp20;->b:Lrx/subjects/a;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public o0()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mu40;->I:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method
