.class public Ll/erp;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Ll/hrp;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/dum;Ll/hrp;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Ll/hrp;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic J3(Ll/erp;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/erp;->O3(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic K3(Ll/erp;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/erp;->P3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic L3(Ll/erp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/erp;->N3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V

    return-void
.end method


# virtual methods
.method public M3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V
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
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Ll/qbo;->i(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    new-instance v1, Ll/crp;

    .line 22
    .line 23
    invoke-direct {v1, p0, p1}, Ll/crp;-><init>(Ll/erp;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    .line 24
    .line 25
    .line 26
    new-instance p1, Ll/drp;

    .line 27
    .line 28
    invoke-direct {p1, p0}, Ll/drp;-><init>(Ll/erp;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoom;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hrp;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/hrp;->i(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBackGroundPics;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic O3(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 7
    .line 8
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 9
    .line 10
    const v1, 0xa884

    .line 11
    .line 12
    .line 13
    if-ne v0, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/erp;->R3()V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-static {p1}, Ll/r35;->c(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic P3(Ljava/util/List;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/hrp;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/hrp;->f(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public R3()V
    .locals 2

    .line 1
    invoke-static {}, Ll/qbo;->g()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ll/brp;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/brp;-><init>(Ll/erp;)V

    .line 12
    .line 13
    .line 14
    new-instance p0, Ll/r5k;

    .line 15
    .line 16
    invoke-direct {p0}, Ll/r5k;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 24
    .line 25
    .line 26
    return-void
.end method
