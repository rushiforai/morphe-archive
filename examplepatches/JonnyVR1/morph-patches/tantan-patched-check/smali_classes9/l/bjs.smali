.class public abstract Ll/bjs;
.super Ll/y8s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/oo2;",
        ">",
        "Ll/y8s<",
        "TT;",
        "Ll/nhs;",
        ">;"
    }
.end annotation


# instance fields
.field public j:J

.field public k:Ll/gd60;

.field public l:Ljava/lang/String;

.field public final m:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/xxj;",
            ">;"
        }
    .end annotation
.end field

.field public n:Ll/cqj;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field public o:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/qul;",
            ">;"
        }
    .end annotation
.end field

.field public p:Ljava/lang/String;

.field public q:Z

.field public r:Z

.field public s:Ll/vuj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vuj<",
            "*>;"
        }
    .end annotation
.end field

.field public t:Ll/orj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/orj<",
            "*>;"
        }
    .end annotation
.end field

.field public u:Z

.field public v:Ll/lx50;

.field public w:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveResourceInfo;",
            "Ll/xxj;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/y8s;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/bjs;->K4()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/bjs;->l:Ljava/lang/String;

    .line 9
    .line 10
    new-instance p1, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/bjs;->m:Ljava/util/Map;

    .line 16
    .line 17
    const/4 p1, 0x1

    .line 18
    iput-boolean p1, p0, Ll/bjs;->r:Z

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Ll/bjs;->u:Z

    .line 22
    .line 23
    new-instance p1, Ll/nhs;

    .line 24
    .line 25
    invoke-direct {p1}, Ll/nhs;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public static synthetic A4(Ll/bjs;Ll/eyj;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->g5(Ll/eyj;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic B4(Ll/bjs;Ll/eqj;)Ll/e060;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->m5(Ll/eqj;)Ll/e060;

    move-result-object p0

    return-object p0
.end method

.method private J5()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/bjs;->o:Ljava/util/Map;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/blu;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/blu;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private Q4()Ll/xxj;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/bjs;->m:Ljava/util/Map;

    .line 2
    .line 3
    iget-object p0, p0, Ll/bjs;->l:Ljava/lang/String;

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/xxj;

    .line 10
    .line 11
    return-object p0
.end method

.method public static synthetic S3(Ll/bjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/bjs;->E5(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method

.method private S4()Lcom/p1/mobile/android/app/Act;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-object p0

    .line 15
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 16
    return-object p0
.end method

.method public static synthetic T3(Ll/bjs;Ll/oqj;)Landroid/util/Pair;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->l5(Ll/oqj;)Landroid/util/Pair;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic U3(Ll/bjs;Ll/lx50;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bjs;->d5(Ll/lx50;)V

    return-void
.end method

.method private U4(Ljava/lang/Throwable;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
    .locals 2

    .line 1
    invoke-virtual {p3}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPacketGift()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 8
    .line 9
    const/4 p3, 0x0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    move-object v0, p1

    .line 13
    check-cast v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 14
    .line 15
    iget v0, v0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 16
    .line 17
    const v1, 0xa0f1

    .line 18
    .line 19
    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p1(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    if-eqz p0, :cond_1

    .line 27
    .line 28
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 29
    .line 30
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 31
    .line 32
    const p1, 0xa0f2

    .line 33
    .line 34
    .line 35
    if-ne p0, p1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p2, p3}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->p1(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    return-void
.end method

.method public static synthetic V3(Ll/bjs;Ll/y7s;)Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->q5(Ll/y7s;)Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic W3(Ll/bjs;Lcom/p1/mobile/putong/live/base/data/BLiveType;Landroid/util/Pair;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bjs;->I5(Lcom/p1/mobile/putong/live/base/data/BLiveType;Landroid/util/Pair;)V

    return-void
.end method

.method private W4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/y20;IZ)V
    .locals 2
    .param p5    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            "Ll/jjs;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            ">;IZ)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2, p4}, Ll/jjs;->w(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 2
    .line 3
    .line 4
    if-eqz p3, :cond_3

    .line 5
    .line 6
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Ll/nhs;

    .line 9
    .line 10
    invoke-virtual {v0, p2, p4}, Ll/nhs;->j0(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p3, p2, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->l1(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 14
    .line 15
    .line 16
    if-eqz p5, :cond_0

    .line 17
    .line 18
    invoke-interface {p5, p4}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    move-object p4, p2

    .line 22
    new-instance p2, Ll/ib0;

    .line 23
    .line 24
    iget-object p5, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 25
    .line 26
    check-cast p5, Ll/nhs;

    .line 27
    .line 28
    invoke-virtual {p5}, Ll/nhs;->B()Ll/e060;

    .line 29
    .line 30
    .line 31
    move-result-object p5

    .line 32
    move v1, p7

    .line 33
    move-object p7, p5

    .line 34
    move p5, p6

    .line 35
    move p6, v1

    .line 36
    invoke-direct/range {p2 .. p7}, Ll/ib0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;IZLl/e060;)V

    .line 37
    .line 38
    .line 39
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 40
    .line 41
    .line 42
    move-result-object p5

    .line 43
    invoke-virtual {p5}, Ll/p6s;->I0()Z

    .line 44
    .line 45
    .line 46
    move-result p5

    .line 47
    if-eqz p5, :cond_1

    .line 48
    .line 49
    invoke-virtual {p4}, Ll/jjs;->s()Z

    .line 50
    .line 51
    .line 52
    move-result p4

    .line 53
    if-nez p4, :cond_1

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 56
    .line 57
    .line 58
    move-result-object p4

    .line 59
    iget-object p4, p4, Lcom/tantan/live/eventbus/LiveEventBus;->IntlGiftComboEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;

    .line 60
    .line 61
    invoke-virtual {p4}, Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;->comboEvent()Ll/v3f$d;

    .line 62
    .line 63
    .line 64
    move-result-object p4

    .line 65
    invoke-virtual {p4, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 66
    .line 67
    .line 68
    :cond_1
    invoke-virtual {p0}, Ll/bjs;->isShowing()Z

    .line 69
    .line 70
    .line 71
    move-result p4

    .line 72
    if-eqz p4, :cond_2

    .line 73
    .line 74
    iget-object p0, p0, Ll/bjs;->s:Ll/vuj;

    .line 75
    .line 76
    invoke-virtual {p0, p2}, Ll/vuj;->T3(Ll/ib0;)V

    .line 77
    .line 78
    .line 79
    :cond_2
    iget-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->mobileVibration:Z

    .line 80
    .line 81
    if-eqz p0, :cond_3

    .line 82
    .line 83
    invoke-virtual {p3}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {p0}, Ll/n0k;->g(Landroid/content/Context;)V

    .line 88
    .line 89
    .line 90
    :cond_3
    return-void
.end method

.method public static synthetic X3(Ll/bjs;Ll/xxj;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->z5(Ll/xxj;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Y3(Ll/bjs;Ll/vf3$d;)Ll/g4$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->i5(Ll/vf3$d;)Ll/g4$a;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic Z3(Ll/bjs;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->u5(Ljava/lang/Integer;)V

    return-void
.end method

.method private Z4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->P0()Lrx/c;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Ll/gis;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/gis;-><init>(Ll/bjs;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/his;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/his;-><init>(Ll/bjs;)V

    .line 25
    .line 26
    .line 27
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ll/oo2;->t1()Lrx/c;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    new-instance v1, Ll/iis;

    .line 47
    .line 48
    invoke-direct {v1, p0}, Ll/iis;-><init>(Ll/bjs;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Ll/oo2;->Q0()Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/jis;

    .line 71
    .line 72
    invoke-direct {v1, p0}, Ll/jis;-><init>(Ll/bjs;)V

    .line 73
    .line 74
    .line 75
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public static synthetic a4(Ll/bjs;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->Q5(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic b4(Ll/bjs;Ll/jne0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->V4(Ll/jne0;)V

    return-void
.end method

.method private b5(Ll/xxj;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bjs;->m:Ljava/util/Map;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xxj;->g()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    check-cast p0, Ll/xxj;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xxj;->d()Ll/zxj;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p0}, Ll/zxj;->f()Ljava/util/List;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method private b6(ZZ)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p1, v0, p2}, Ll/xxj;->b(ZZZ)Ll/xxj;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p0, p1}, Ll/nhs;->Y(Ll/xxj;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic c4(Ll/bjs;Ll/xxj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->G5(Ll/xxj;)V

    return-void
.end method

.method private c5()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nhs;->M()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static synthetic d4(Ll/bjs;ZLjava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/bjs;->D5(ZLjava/util/List;)V

    return-void
.end method

.method private synthetic d5(Ll/lx50;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/muj;->F(Ll/lx50;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/bjs;->N5()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, p1, v0}, Ll/bjs;->g6(Ll/lx50;Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private d6(Ll/y20;Ll/y20;J)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;",
            "Ll/y20<",
            "Ljava/lang/Boolean;",
            ">;J)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Ll/nhs;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->H2()Lcom/p1/mobile/android/app/Frag;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Frag;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    move-object v3, p1

    .line 15
    move-object v4, p2

    .line 16
    move-wide v5, p3

    .line 17
    invoke-virtual/range {v1 .. v6}, Ll/nhs;->g0(Lcom/p1/mobile/android/app/Act;Ll/y20;Ll/y20;J)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic e4(Ll/bjs;Ll/ywj;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->f5(Ll/ywj;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f4(Ll/bjs;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->v5(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic g4(Ll/bjs;Ll/pqj;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->n5(Ll/pqj;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h4(Ll/bjs;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->s5(Ljava/lang/Integer;)V

    return-void
.end method

.method private h6(Ljava/util/List;Z)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/bjs;->Q4()Ll/xxj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Ll/xxj;->n(Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ll/xxj$a;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {p1, v1, v2, p2}, Ll/xxj$a;-><init>(ZZZ)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ll/xxj;->k(Ll/xxj$a;)V

    .line 18
    .line 19
    .line 20
    new-instance p1, Ll/eis;

    .line 21
    .line 22
    invoke-direct {p1, p0, v0}, Ll/eis;-><init>(Ll/bjs;Ll/xxj;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic i4(Ll/bjs;Ll/r7f0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bjs;->r5(Ll/r7f0;)V

    return-void
.end method

.method private i6(Z)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/bjs;->Q4()Ll/xxj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance v1, Ll/xxj$a;

    .line 8
    .line 9
    const/4 v2, 0x1

    .line 10
    invoke-direct {v1, v2, p1, v2}, Ll/xxj$a;-><init>(ZZZ)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/xxj;->k(Ll/xxj$a;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ll/tis;

    .line 17
    .line 18
    invoke-direct {p1, p0, v0}, Ll/tis;-><init>(Ll/bjs;Ll/xxj;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public static synthetic j4(Ll/bjs;Ll/nqj;)Ll/nqj$a;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->j5(Ll/nqj;)Ll/nqj$a;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k4(Ll/bjs;Ll/jjs;IILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/bjs;->y5(Ll/jjs;IILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method

.method public static synthetic l4(Ll/bjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/bjs;->F5(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic m4(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n4(Ll/bjs;Ll/xpj;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->h5(Ll/xpj;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o4(Ll/bjs;Ll/wrj;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->o5(Ll/wrj;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic p4(Ll/bjs;Ll/xxj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->H5(Ll/xxj;)V

    return-void
.end method

.method private synthetic p5(Ljava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, -0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    invoke-virtual {p0, p1, v2, v0, v1}, Ll/bjs;->S5(Ljava/lang/String;Ll/x20;ZI)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic q4(Ll/bjs;Ll/pxj;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->x5(Ll/pxj;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic r4(Ll/bjs;Ll/csj;)Ll/wpj;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->k5(Ll/csj;)Ll/wpj;

    move-result-object p0

    return-object p0
.end method

.method private synthetic r5(Ll/r7f0;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/r7f0;->b()Ll/y20;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/r7f0;->a()Ll/y20;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Ll/r7f0;->c()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    invoke-direct {p0, v0, v1, v2, v3}, Ll/bjs;->d6(Ll/y20;Ll/y20;J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic s4(Ll/bjs;Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->m6(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V

    return-void
.end method

.method public static synthetic t4(Ll/bjs;Ll/xxj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->A5(Ll/xxj;)V

    return-void
.end method

.method public static synthetic u4(Ll/bjs;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/bjs;->p5(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic v4(Ll/bjs;Ljava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->B5(Ljava/lang/Long;)V

    return-void
.end method

.method public static synthetic w4(Ll/bjs;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->t5(Ll/pf60;)V

    return-void
.end method

.method public static synthetic x4(Ll/bjs;Ll/f1k0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->w5(Ll/f1k0;)V

    return-void
.end method

.method public static synthetic y4(Ll/bjs;Ll/kpj;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->C5(Ll/kpj;)V

    return-void
.end method

.method public static synthetic z4(Ll/bjs;Ll/lx50;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/bjs;->e5(Ll/lx50;)V

    return-void
.end method


# virtual methods
.method public final synthetic A5(Ll/xxj;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bjs;->m:Ljava/util/Map;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/xxj;->g()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/bjs;->isShowing()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p1, Ll/nhs;

    .line 19
    .line 20
    invoke-virtual {p1}, Ll/nhs;->H()Z

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    invoke-direct {p0, p1}, Ll/bjs;->i6(Z)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final synthetic B5(Ljava/lang/Long;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Ll/bjs;->j:J

    .line 6
    .line 7
    return-void
.end method

.method public final C4(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/hzj;

    .line 16
    .line 17
    iget-object v0, v0, Ll/hzj;->a:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/jjs;

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 40
    .line 41
    const/4 v2, 0x1

    .line 42
    if-ne v1, v2, :cond_1

    .line 43
    .line 44
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast p0, Ll/nhs;

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/nhs;->h0()V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_2
    const-string p0, "\u7cdf\u7cd5\uff0c\u80cc\u5305\u793c\u7269\u5df2\u7ecf\u8fc7\u671f\u4e86\uff0c\u9001\u70b9\u522b\u7684\u5427"

    .line 53
    .line 54
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final synthetic C5(Ll/kpj;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bjs;->t:Ll/orj;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ll/orj;->V3(Ll/kpj;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/bjs;->t:Ll/orj;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/orj;->S3()V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 14
    .line 15
    check-cast v0, Ll/nhs;

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/nhs;->i0()V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v0, Ll/nhs;

    .line 23
    .line 24
    invoke-virtual {v0, p1}, Ll/nhs;->X(Ll/kpj;)V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast p1, Ll/nhs;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/nhs;->isShowing()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_1

    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->giftDialogHeightChange()Ll/v3f$c;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 48
    .line 49
    .line 50
    :cond_1
    return-void
.end method

.method public final D4(Ll/lx50;)Ll/dyj;
    .locals 7

    .line 1
    invoke-virtual {p0}, Ll/bjs;->j3()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, v0}, Ll/znc0;->c(Ll/bjs;Ll/lx50;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-virtual {p1}, Ll/lx50;->a()Ll/cqj;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v3

    .line 33
    if-eqz v3, :cond_1

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/lx50;->a()Ll/cqj;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Ll/cqj;->d()Ll/p54;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object v3, p1, Ll/p54;->g:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-nez v3, :cond_0

    .line 50
    .line 51
    iget-object v0, p1, Ll/p54;->g:Ljava/lang/String;

    .line 52
    .line 53
    :cond_0
    iget-object v3, p1, Ll/p54;->f:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-nez v3, :cond_1

    .line 60
    .line 61
    iget-object v1, p1, Ll/p54;->f:Ljava/lang/String;

    .line 62
    .line 63
    :cond_1
    move-object v3, v0

    .line 64
    move-object v4, v1

    .line 65
    new-instance v1, Ll/dyj;

    .line 66
    .line 67
    iget-object p0, p0, Ll/bjs;->l:Ljava/lang/String;

    .line 68
    .line 69
    invoke-static {p0}, Ll/cpj;->u(Ljava/lang/String;)Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    invoke-static {}, Ll/eb20;->b()Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_2

    .line 78
    .line 79
    invoke-static {}, Ll/eb20;->a()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    :goto_0
    move-object v6, p0

    .line 84
    goto :goto_1

    .line 85
    :cond_2
    const-string p0, ""

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :goto_1
    invoke-direct/range {v1 .. v6}, Ll/dyj;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return-object v1
.end method

.method public final synthetic D5(ZLjava/util/List;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p0, p2}, Ll/bjs;->C4(Ljava/util/List;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public E4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bjs;->O3()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Ll/nhs;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/nhs;->v()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic E5(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 1

    .line 1
    move v0, p5

    .line 2
    move-object p5, p4

    .line 3
    move-object p4, p7

    .line 4
    move p7, p6

    .line 5
    move p6, v0

    .line 6
    invoke-direct/range {p0 .. p7}, Ll/bjs;->W4(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/y20;IZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public abstract F4()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/coj;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end method

.method public final synthetic F5(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p3, p1, p2}, Ll/bjs;->U4(Ljava/lang/Throwable;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public G4(Ljava/lang/String;)Landroid/util/Pair;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Ll/cqj;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/nhs;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    new-instance p1, Landroid/util/Pair;

    .line 12
    .line 13
    iget-object v0, p0, Ll/bjs;->l:Ljava/lang/String;

    .line 14
    .line 15
    iget-object p0, p0, Ll/bjs;->n:Ll/cqj;

    .line 16
    .line 17
    invoke-direct {p1, v0, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    return-object p1

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public final synthetic G5(Ll/xxj;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/nhs;->Y(Ll/xxj;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public H4()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bjs;->l:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic H5(Ll/xxj;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/nhs;->Y(Ll/xxj;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public I4()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nhs;->y()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic I5(Lcom/p1/mobile/putong/live/base/data/BLiveType;Landroid/util/Pair;)V
    .locals 1

    .line 1
    iput-object p2, p0, Ll/bjs;->w:Landroid/util/Pair;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const-string v0, "live"

    .line 8
    .line 9
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/bjs;->w:Landroid/util/Pair;

    .line 16
    .line 17
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p0, Ll/xxj;

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/xxj;->l(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, p2}, Ll/ere;->s(Landroid/util/Pair;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, p2}, Ll/ere;->v(Landroid/util/Pair;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public J4()Ll/cqj;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public abstract K4()Ljava/lang/String;
.end method

.method public K5()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/nhs;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->giftDialogHeightChange()Ll/v3f$c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public L4()Ll/e060;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nhs;->B()Ll/e060;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public L5(Ll/jjs;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bjs;->t:Ll/orj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/orj;->T3(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public M4()Ll/cqj;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/bjs;->n:Ll/cqj;

    .line 2
    .line 3
    return-object p0
.end method

.method public M5(ILl/hzj;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bjs;->t:Ll/orj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p1, p2, Ll/hzj;->b:I

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/orj;->U3(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final N4()Ll/nqj$a;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast v0, Ll/nhs;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/nhs;->J()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/high16 v0, 0x42380000    # 46.0f

    .line 14
    .line 15
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    :goto_0
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    check-cast v1, Ll/nhs;

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/nhs;->G()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    iget-object v1, p0, Ll/bjs;->t:Ll/orj;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-virtual {v1}, Ll/orj;->N3()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    add-int/2addr v0, v1

    .line 42
    :cond_1
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 43
    .line 44
    if-eqz v1, :cond_2

    .line 45
    .line 46
    check-cast v1, Ll/nhs;

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/nhs;->K()Z

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    if-eqz v1, :cond_2

    .line 53
    .line 54
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 55
    .line 56
    check-cast v1, Ll/nhs;

    .line 57
    .line 58
    invoke-virtual {v1}, Ll/nhs;->F()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    add-int/2addr v0, v1

    .line 63
    :cond_2
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 64
    .line 65
    if-eqz v1, :cond_3

    .line 66
    .line 67
    check-cast v1, Ll/nhs;

    .line 68
    .line 69
    invoke-virtual {v1}, Ll/nhs;->I()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_3

    .line 74
    .line 75
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 76
    .line 77
    check-cast p0, Ll/nhs;

    .line 78
    .line 79
    invoke-virtual {p0}, Ll/nhs;->E()I

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    add-int/2addr v0, p0

    .line 84
    :cond_3
    const/high16 p0, 0x41200000    # 10.0f

    .line 85
    .line 86
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    add-int/2addr v0, p0

    .line 91
    const/high16 p0, 0x439f0000    # 318.0f

    .line 92
    .line 93
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    add-int/2addr p0, v0

    .line 98
    new-instance v1, Ll/nqj$a;

    .line 99
    .line 100
    invoke-direct {v1, p0, v0}, Ll/nqj$a;-><init>(II)V

    .line 101
    .line 102
    .line 103
    return-object v1
.end method

.method public N5()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/bjs;->w:Landroid/util/Pair;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/bjs;->w:Landroid/util/Pair;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ll/oo2;->A0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, v1, p0}, Ll/ere;->a(Landroid/util/Pair;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public O3()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Ll/bjs;->R4(Z)Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-static {v1}, Ll/cpj;->O(Ljava/util/List;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    iget-object v1, v1, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 19
    .line 20
    invoke-virtual {v1}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->giftDialogStatus()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    const-string v1, ""

    .line 30
    .line 31
    iput-object v1, p0, Ll/bjs;->p:Ljava/lang/String;

    .line 32
    .line 33
    iput-boolean v0, p0, Ll/bjs;->r:Z

    .line 34
    .line 35
    invoke-static {}, Ll/l0k;->h()V

    .line 36
    .line 37
    .line 38
    invoke-static {}, Ll/r230;->s()V

    .line 39
    .line 40
    .line 41
    invoke-static {}, Ljava/lang/System;->gc()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public O4(Ljava/lang/String;)Ll/qul;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/bjs;->o:Ljava/util/Map;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/bjs;->o:Ljava/util/Map;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/bjs;->o:Ljava/util/Map;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Ll/qul;

    .line 19
    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    :try_start_0
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;->valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;

    .line 24
    .line 25
    .line 26
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    goto :goto_0

    .line 28
    :catch_0
    move-object v1, v0

    .line 29
    :goto_0
    if-nez v1, :cond_1

    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_1
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/anim/GiftItemAnimType;->getController()Ll/qul;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object p0, p0, Ll/bjs;->o:Ljava/util/Map;

    .line 37
    .line 38
    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    :cond_2
    return-object v0
.end method

.method public final O5(Ll/lx50;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/bjs;->v:Ll/lx50;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bjs;->D4(Ll/lx50;)Ll/dyj;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p1}, Ll/aiv;->n1(Ll/dyj;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/oo2;->A0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Ll/aiv;->o1(Ljava/lang/String;)Lrx/c;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/nis;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/nis;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {p1, v0, v1}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    new-instance v0, Ll/ois;

    .line 37
    .line 38
    invoke-direct {v0, p0}, Ll/ois;-><init>(Ll/bjs;)V

    .line 39
    .line 40
    .line 41
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public P4()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bjs;->n:Ll/cqj;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/cqj;->e()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p0, p0, Ll/bjs;->n:Ll/cqj;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/cqj;->e()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    :goto_0
    invoke-virtual {p0}, Ll/bjs;->j3()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public P5(Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;)V
    .locals 4

    .line 1
    new-instance v0, Ll/djs;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->k:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/djs;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftUserInfoView;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 11
    .line 12
    .line 13
    new-instance v0, Ll/vpj;

    .line 14
    .line 15
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 16
    .line 17
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->q:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;

    .line 18
    .line 19
    invoke-direct {v0, v1, v2}, Ll/vpj;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogBottomBar;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 23
    .line 24
    .line 25
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Ll/p6s;->I0()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    new-instance v0, Ll/tln;

    .line 36
    .line 37
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 38
    .line 39
    invoke-direct {v0, v1, p0}, Ll/tln;-><init>(Ll/dum;Ll/bjs;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 43
    .line 44
    .line 45
    :cond_0
    new-instance v0, Ll/vuj;

    .line 46
    .line 47
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 48
    .line 49
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->s:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;

    .line 50
    .line 51
    iget-object v3, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->r:Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;

    .line 52
    .line 53
    invoke-direct {v0, v1, v2, v3}, Ll/vuj;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftOperationView;Lcom/p1/mobile/putong/live/livingroom/increment/gift/operation/GiftDialogShadeLayer;)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Ll/vuj;

    .line 61
    .line 62
    iput-object v0, p0, Ll/bjs;->s:Ll/vuj;

    .line 63
    .line 64
    new-instance v0, Ll/orj;

    .line 65
    .line 66
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 67
    .line 68
    iget-object v2, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->e:Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;

    .line 69
    .line 70
    iget-object v3, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->f:Lv/VDraweeView;

    .line 71
    .line 72
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->g:Lv/VDraweeView;

    .line 73
    .line 74
    invoke-direct {v0, v1, v2, v3, p1}, Ll/orj;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogSkinView;Lv/VDraweeView;Lv/VDraweeView;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Ll/orj;

    .line 82
    .line 83
    iput-object p1, p0, Ll/bjs;->t:Ll/orj;

    .line 84
    .line 85
    return-void
.end method

.method public final Q5(Ljava/lang/Long;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/nhs;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 12
    .line 13
    check-cast v0, Ll/nhs;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/nhs;->N()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/bjs;->k6(Ljava/lang/Long;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 26
    .line 27
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/civ;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/civ;->l()Ljava/lang/Long;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 42
    .line 43
    .line 44
    move-result-wide v3

    .line 45
    cmp-long p1, v1, v3

    .line 46
    .line 47
    if-gtz p1, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->refreshGiftRedDot()Ll/v3f$d;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 65
    .line 66
    check-cast p0, Ll/nhs;

    .line 67
    .line 68
    const/4 p1, 0x0

    .line 69
    invoke-virtual {p0, p1}, Ll/nhs;->f0(Z)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->BottomEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$BottomEvent;->refreshGiftRedDot()Ll/v3f$d;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 84
    .line 85
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 89
    .line 90
    check-cast p0, Ll/nhs;

    .line 91
    .line 92
    const/4 p1, 0x1

    .line 93
    invoke-virtual {p0, p1}, Ll/nhs;->f0(Z)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public final R4(Z)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Ljava/util/List<",
            "Ll/hzj;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/bjs;->Q4()Ll/xxj;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xxj;->e()Ll/zxj;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/zxj;->f()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/xxj;->d()Ll/zxj;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/zxj;->f()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    :goto_0
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return-object p0
.end method

.method public R5()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/bjs;->u:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/bjs;->v:Ll/lx50;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput-boolean v1, p0, Ll/bjs;->u:Z

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/bjs;->O5(Ll/lx50;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public final S5(Ljava/lang/String;Ll/x20;ZI)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/bjs;->V5()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/bjs;->j3()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {p0}, Ll/bf10;->N(Ll/i6t;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    iget-object v2, p0, Ll/bjs;->n:Ll/cqj;

    .line 23
    .line 24
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    iget-object v2, p0, Ll/bjs;->n:Ll/cqj;

    .line 31
    .line 32
    invoke-virtual {v2}, Ll/cqj;->e()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-nez v2, :cond_0

    .line 41
    .line 42
    iget-object v1, p0, Ll/bjs;->n:Ll/cqj;

    .line 43
    .line 44
    invoke-virtual {v1}, Ll/cqj;->e()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    invoke-static {p0, v1}, Ll/bf10;->E(Ll/i6t;Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_0

    .line 57
    .line 58
    iget-object v0, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->roomId:Ljava/lang/String;

    .line 59
    .line 60
    :cond_0
    const/16 v2, 0x5df

    .line 61
    .line 62
    if-ne p4, v2, :cond_1

    .line 63
    .line 64
    iget-object p4, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 65
    .line 66
    check-cast p4, Ll/nhs;

    .line 67
    .line 68
    invoke-virtual {p4}, Ll/nhs;->z()Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 69
    .line 70
    .line 71
    move-result-object p4

    .line 72
    const/4 v2, 0x0

    .line 73
    invoke-virtual {p4, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->q0(Z)V

    .line 74
    .line 75
    .line 76
    iget-object p4, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 77
    .line 78
    check-cast p4, Ll/nhs;

    .line 79
    .line 80
    invoke-virtual {p4}, Ll/nhs;->z()Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;

    .line 81
    .line 82
    .line 83
    move-result-object p4

    .line 84
    const/4 v2, 0x1

    .line 85
    invoke-virtual {p4, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/view/GiftDialogContentView;->y0(Z)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 89
    .line 90
    .line 91
    move-result-object p4

    .line 92
    iget-object p4, p4, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 93
    .line 94
    invoke-virtual {p4}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->onGiftDialogPanelSwitchChange()Ll/v3f$d;

    .line 95
    .line 96
    .line 97
    move-result-object p4

    .line 98
    new-instance v3, Ll/cwj;

    .line 99
    .line 100
    invoke-direct {v3, v2}, Ll/cwj;-><init>(Z)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p4, v3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 107
    .line 108
    .line 109
    move-result-object p4

    .line 110
    invoke-static {p4, v1}, Ll/mc50;->R2(Ll/oo2;Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p4

    .line 114
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    new-instance v2, Ll/uxj$a;

    .line 119
    .line 120
    iget-object v3, p0, Ll/bjs;->l:Ljava/lang/String;

    .line 121
    .line 122
    invoke-direct {v2, v0, p4, v3}, Ll/uxj$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v2, p1}, Ll/uxj$a;->h(Ljava/lang/String;)Ll/uxj$a;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    invoke-virtual {p1, p2}, Ll/uxj$a;->g(Ll/x20;)Ll/uxj$a;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-virtual {p1}, Ll/uxj$a;->f()Ll/uxj;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    new-instance p2, Ll/fis;

    .line 138
    .line 139
    invoke-direct {p2, p0, p3}, Ll/fis;-><init>(Ll/bjs;Z)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v1, p1, p2}, Ll/oo2;->A1(Ll/uxj;Ll/y20;)V

    .line 143
    .line 144
    .line 145
    return-void
.end method

.method public T()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->T()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Ll/nhs;

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ll/nhs;->L(Lcom/p1/mobile/android/app/Act;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->openGiftDialogEvent()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Ll/phs;

    .line 26
    .line 27
    invoke-direct {v1, p0}, Ll/phs;-><init>(Ll/bjs;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->switchGiftDialogSourceEvent()Ll/v3f$d;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/rhs;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Ll/rhs;-><init>(Ll/bjs;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v0, v1}, Ll/i6t;->h3(Ll/v3f$b;Ll/y20;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 56
    .line 57
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->reloadGiftByPositionGiftId()Ll/v3f$d;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Lrx/c;

    .line 66
    .line 67
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    new-instance v1, Ll/uhs;

    .line 72
    .line 73
    invoke-direct {v1, p0}, Ll/uhs;-><init>(Ll/bjs;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->showSendFirstGiftDlg()Ll/v3f$d;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lrx/c;

    .line 98
    .line 99
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    new-instance v1, Ll/vhs;

    .line 104
    .line 105
    invoke-direct {v1, p0}, Ll/vhs;-><init>(Ll/bjs;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 120
    .line 121
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->reloadGift()Ll/v3f$d;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    check-cast v0, Lrx/c;

    .line 130
    .line 131
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    new-instance v1, Ll/whs;

    .line 136
    .line 137
    invoke-direct {v1, p0}, Ll/whs;-><init>(Ll/bjs;)V

    .line 138
    .line 139
    .line 140
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 145
    .line 146
    .line 147
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 152
    .line 153
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->reloadGiftWithAction()Ll/v3f$d;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    check-cast v0, Lrx/c;

    .line 162
    .line 163
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    new-instance v1, Ll/xhs;

    .line 168
    .line 169
    invoke-direct {v1, p0}, Ll/xhs;-><init>(Ll/bjs;)V

    .line 170
    .line 171
    .line 172
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 180
    .line 181
    .line 182
    move-result-object v0

    .line 183
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 184
    .line 185
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->dismissGiftDialog()Ll/v3f$d;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    check-cast v0, Lrx/c;

    .line 194
    .line 195
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    new-instance v1, Ll/yhs;

    .line 200
    .line 201
    invoke-direct {v1, p0}, Ll/yhs;-><init>(Ll/bjs;)V

    .line 202
    .line 203
    .line 204
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 216
    .line 217
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->switchPacketPanel()Ll/v3f$d;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    check-cast v0, Lrx/c;

    .line 226
    .line 227
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    new-instance v1, Ll/zhs;

    .line 232
    .line 233
    invoke-direct {v1, p0}, Ll/zhs;-><init>(Ll/bjs;)V

    .line 234
    .line 235
    .line 236
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 237
    .line 238
    .line 239
    move-result-object v1

    .line 240
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 241
    .line 242
    .line 243
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 248
    .line 249
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->onSengGiftFromMultipleGift()Ll/v3f$d;

    .line 250
    .line 251
    .line 252
    move-result-object v0

    .line 253
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    check-cast v0, Lrx/c;

    .line 258
    .line 259
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    new-instance v1, Ll/bis;

    .line 264
    .line 265
    invoke-direct {v1, p0}, Ll/bis;-><init>(Ll/bjs;)V

    .line 266
    .line 267
    .line 268
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 273
    .line 274
    .line 275
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 280
    .line 281
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->updateItemModelAfterSendGift()Ll/v3f$d;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 286
    .line 287
    .line 288
    move-result-object v0

    .line 289
    check-cast v0, Lrx/c;

    .line 290
    .line 291
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    new-instance v1, Ll/cis;

    .line 296
    .line 297
    invoke-direct {v1, p0}, Ll/cis;-><init>(Ll/bjs;)V

    .line 298
    .line 299
    .line 300
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 301
    .line 302
    .line 303
    move-result-object v1

    .line 304
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 305
    .line 306
    .line 307
    new-instance v0, Ll/ais;

    .line 308
    .line 309
    invoke-direct {v0, p0}, Ll/ais;-><init>(Ll/bjs;)V

    .line 310
    .line 311
    .line 312
    const-class v1, Ll/pxj;

    .line 313
    .line 314
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 315
    .line 316
    .line 317
    new-instance v0, Ll/lis;

    .line 318
    .line 319
    invoke-direct {v0, p0}, Ll/lis;-><init>(Ll/bjs;)V

    .line 320
    .line 321
    .line 322
    const-class v1, Ll/ywj;

    .line 323
    .line 324
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 325
    .line 326
    .line 327
    new-instance v0, Ll/uis;

    .line 328
    .line 329
    invoke-direct {v0, p0}, Ll/uis;-><init>(Ll/bjs;)V

    .line 330
    .line 331
    .line 332
    const-class v1, Ll/eyj;

    .line 333
    .line 334
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 335
    .line 336
    .line 337
    new-instance v0, Ll/vis;

    .line 338
    .line 339
    invoke-direct {v0, p0}, Ll/vis;-><init>(Ll/bjs;)V

    .line 340
    .line 341
    .line 342
    const-class v1, Ll/xpj;

    .line 343
    .line 344
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 345
    .line 346
    .line 347
    new-instance v0, Ll/wis;

    .line 348
    .line 349
    invoke-direct {v0, p0}, Ll/wis;-><init>(Ll/bjs;)V

    .line 350
    .line 351
    .line 352
    const-class v1, Ll/vf3$d;

    .line 353
    .line 354
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 355
    .line 356
    .line 357
    new-instance v0, Ll/xis;

    .line 358
    .line 359
    invoke-direct {v0, p0}, Ll/xis;-><init>(Ll/bjs;)V

    .line 360
    .line 361
    .line 362
    const-class v1, Ll/nqj;

    .line 363
    .line 364
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 365
    .line 366
    .line 367
    new-instance v0, Ll/yis;

    .line 368
    .line 369
    invoke-direct {v0, p0}, Ll/yis;-><init>(Ll/bjs;)V

    .line 370
    .line 371
    .line 372
    const-class v1, Ll/csj;

    .line 373
    .line 374
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 375
    .line 376
    .line 377
    new-instance v0, Ll/zis;

    .line 378
    .line 379
    invoke-direct {v0, p0}, Ll/zis;-><init>(Ll/bjs;)V

    .line 380
    .line 381
    .line 382
    const-class v1, Ll/oqj;

    .line 383
    .line 384
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 385
    .line 386
    .line 387
    new-instance v0, Ll/ajs;

    .line 388
    .line 389
    invoke-direct {v0, p0}, Ll/ajs;-><init>(Ll/bjs;)V

    .line 390
    .line 391
    .line 392
    const-class v1, Ll/eqj;

    .line 393
    .line 394
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 395
    .line 396
    .line 397
    new-instance v0, Ll/qhs;

    .line 398
    .line 399
    invoke-direct {v0, p0}, Ll/qhs;-><init>(Ll/bjs;)V

    .line 400
    .line 401
    .line 402
    const-class v1, Ll/pqj;

    .line 403
    .line 404
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 405
    .line 406
    .line 407
    new-instance v0, Ll/shs;

    .line 408
    .line 409
    invoke-direct {v0, p0}, Ll/shs;-><init>(Ll/bjs;)V

    .line 410
    .line 411
    .line 412
    const-class v1, Ll/wrj;

    .line 413
    .line 414
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 415
    .line 416
    .line 417
    new-instance v0, Ll/ths;

    .line 418
    .line 419
    invoke-direct {v0, p0}, Ll/ths;-><init>(Ll/bjs;)V

    .line 420
    .line 421
    .line 422
    const-class v1, Ll/y7s;

    .line 423
    .line 424
    invoke-virtual {p0, v1, v0}, Ll/i6t;->d3(Ljava/lang/Class;Ll/qcj;)V

    .line 425
    .line 426
    .line 427
    invoke-static {}, Ll/l0k;->d()V

    .line 428
    .line 429
    .line 430
    invoke-virtual {p0}, Ll/bjs;->V5()V

    .line 431
    .line 432
    .line 433
    return-void
.end method

.method public final T4()V
    .locals 2

    .line 1
    new-instance v0, Ll/hv70;

    .line 2
    .line 3
    const/16 v1, 0x2bc

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/hv70;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-boolean v0, p0, Ll/bjs;->q:Z

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Ll/bjs;->q:Z

    .line 26
    .line 27
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ll/vwt;->T4()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const/4 v1, 0x0

    .line 36
    invoke-static {p0, v1, v0}, Ll/o1j0;->B(Ljava/lang/String;ZZ)V

    .line 37
    .line 38
    .line 39
    :cond_0
    return-void
.end method

.method public T5(Z)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/bjs;->U5(ZI)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public U5(ZI)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    const/16 p1, 0x5dd

    .line 4
    .line 5
    if-eq p1, p2, :cond_0

    .line 6
    .line 7
    const/16 p1, 0x5de

    .line 8
    .line 9
    if-ne p1, p2, :cond_1

    .line 10
    .line 11
    :cond_0
    const/4 p1, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/4 p1, 0x0

    .line 14
    :goto_0
    invoke-virtual {p0}, Ll/bjs;->isShowing()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Ll/bjs;->p:Ljava/lang/String;

    .line 21
    .line 22
    goto :goto_1

    .line 23
    :cond_2
    const-string v0, ""

    .line 24
    .line 25
    :goto_1
    const/4 v1, 0x0

    .line 26
    invoke-virtual {p0, v0, v1, p1, p2}, Ll/bjs;->S5(Ljava/lang/String;Ll/x20;ZI)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final V4(Ll/jne0;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Ll/jne0;->d()Ll/jjs;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {p1}, Ll/jne0;->a()Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {p1}, Ll/jne0;->c()I

    .line 10
    .line 11
    .line 12
    move-result v5

    .line 13
    invoke-virtual {p1}, Ll/jne0;->b()I

    .line 14
    .line 15
    .line 16
    move-result v4

    .line 17
    invoke-virtual {v1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isPaidGift()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {p1, v4}, Ll/f3e;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;I)D

    .line 32
    .line 33
    .line 34
    move-result-wide v6

    .line 35
    invoke-virtual {p0, v6, v7}, Ll/bjs;->a5(D)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-static {p1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    goto :goto_0

    .line 44
    :cond_0
    const-string p1, "NA"

    .line 45
    .line 46
    :goto_0
    new-instance v3, Ll/mis;

    .line 47
    .line 48
    invoke-direct {v3, p0, v1, v5, v4}, Ll/mis;-><init>(Ll/bjs;Ll/jjs;II)V

    .line 49
    .line 50
    .line 51
    const/4 v6, 0x0

    .line 52
    const/4 v7, 0x0

    .line 53
    move-object v0, p0

    .line 54
    invoke-virtual/range {v0 .. v7}, Ll/bjs;->W5(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IIZLl/stj;)V

    .line 55
    .line 56
    .line 57
    move v2, v5

    .line 58
    invoke-virtual {v0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-virtual {v0}, Ll/bjs;->P4()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v7

    .line 66
    const/4 v8, 0x0

    .line 67
    const-string v6, "batch"

    .line 68
    .line 69
    move-object v3, p1

    .line 70
    move v5, v4

    .line 71
    move-object v4, p0

    .line 72
    invoke-static/range {v0 .. v8}, Ll/qzj;->j(Ll/bjs;Ll/jjs;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final V5()V
    .locals 2

    .line 1
    invoke-static {}, Ll/aiv;->p1()Lrx/c;

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
    new-instance v1, Ll/kis;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/kis;-><init>(Ll/bjs;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public W5(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IIZLl/stj;)V
    .locals 19
    .param p3    # Ll/y20;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p7    # Ll/stj;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jjs;",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            ">;IIZ",
            "Ll/stj;",
            ")V"
        }
    .end annotation

    .line 1
    move-object/from16 v8, p7

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 4
    .line 5
    .line 6
    move-result-object v10

    .line 7
    iget v0, v10, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 8
    .line 9
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v9

    .line 13
    new-instance v11, Ll/pis;

    .line 14
    .line 15
    move-object/from16 v1, p0

    .line 16
    .line 17
    move-object/from16 v3, p1

    .line 18
    .line 19
    move-object/from16 v4, p2

    .line 20
    .line 21
    move-object/from16 v5, p3

    .line 22
    .line 23
    move/from16 v6, p5

    .line 24
    .line 25
    move/from16 v7, p6

    .line 26
    .line 27
    move-object v2, v10

    .line 28
    move-object v0, v11

    .line 29
    invoke-direct/range {v0 .. v7}, Ll/pis;-><init>(Ll/bjs;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IZ)V

    .line 30
    .line 31
    .line 32
    new-instance v12, Ll/qis;

    .line 33
    .line 34
    invoke-direct {v12, v1, v4, v10}, Ll/qis;-><init>(Ll/bjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 35
    .line 36
    .line 37
    new-instance v13, Ll/ris;

    .line 38
    .line 39
    invoke-direct {v13}, Ll/ris;-><init>()V

    .line 40
    .line 41
    .line 42
    iget-object v0, v1, Ll/bjs;->l:Ljava/lang/String;

    .line 43
    .line 44
    iget-object v2, v1, Ll/bjs;->n:Ll/cqj;

    .line 45
    .line 46
    invoke-static {v10, v3, v6}, Ll/cpj;->H(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;I)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 47
    .line 48
    .line 49
    move-result-object v18

    .line 50
    const/4 v14, 0x0

    .line 51
    move/from16 v15, p4

    .line 52
    .line 53
    move-object/from16 v16, v0

    .line 54
    .line 55
    move-object/from16 v17, v2

    .line 56
    .line 57
    invoke-static/range {v9 .. v18}, Ll/uoe0;->d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILjava/lang/String;Ll/cqj;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/uoe0;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz v8, :cond_0

    .line 62
    .line 63
    invoke-static {v0, v8}, Ll/toe0;->a(Ll/uoe0;Ll/stj;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    new-instance v2, Ll/sis;

    .line 67
    .line 68
    invoke-direct {v2, v1}, Ll/sis;-><init>(Ll/bjs;)V

    .line 69
    .line 70
    .line 71
    invoke-static {v1, v0, v2}, Ll/xoe0;->a(Ll/bjs;Ll/uoe0;Ll/y20;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public X4()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bjs;->t:Ll/orj;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/orj;->O3()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public X5(Ll/uoe0;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

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
    invoke-virtual {v0, p1}, Ll/hne0$a;->y(Ll/uoe0;)Ll/hne0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public Y4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->hideGiftOperationLayer()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public Y5(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/bjs;->p:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public Z5(Ll/lx50;Z)V
    .locals 2

    .line 1
    invoke-static {}, Ll/aiv;->k1()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 13
    .line 14
    check-cast v0, Ll/nhs;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/nhs;->e0()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/y8s;->P3()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Ll/lx50;->e()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {p0, v0, p2}, Ll/bjs;->h6(Ljava/util/List;Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/bjs;->T4()V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 37
    .line 38
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->giftDialogStatus()Ll/v3f$d;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-virtual {p2, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    iget-boolean p2, p0, Ll/bjs;->r:Z

    .line 48
    .line 49
    if-eqz p2, :cond_0

    .line 50
    .line 51
    const/4 p2, 0x1

    .line 52
    invoke-virtual {p1}, Ll/lx50;->b()I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {p0, p2, v0}, Ll/bjs;->U5(ZI)V

    .line 57
    .line 58
    .line 59
    const/4 p2, 0x0

    .line 60
    iput-boolean p2, p0, Ll/bjs;->r:Z

    .line 61
    .line 62
    :cond_0
    invoke-virtual {p0, p1}, Ll/bjs;->O5(Ll/lx50;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Ll/bjs;->Y4()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public a5(D)Z
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/bjs;->j:J

    .line 2
    .line 3
    long-to-double v0, v0

    .line 4
    cmpl-double p0, v0, p1

    .line 5
    .line 6
    if-ltz p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public a6(Ll/jjs;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Ll/bjs;->R4(Z)Ljava/util/List;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    invoke-static {p1, v0}, Ll/cpj;->E(Ll/jjs;Ljava/util/List;)Ll/xbe;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 11
    .line 12
    check-cast v0, Ll/nhs;

    .line 13
    .line 14
    iget-object p0, p0, Ll/bjs;->l:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v0, p1, p0}, Ll/nhs;->d0(Ll/xbe;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public c6(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bjs;->S4()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/bjs;->k:Ll/gd60;

    .line 9
    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Ll/gd60;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Ll/gd60;-><init>(Ll/bjs;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/bjs;->k:Ll/gd60;

    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Ll/bjs;->k:Ll/gd60;

    .line 20
    .line 21
    iget-object p0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 22
    .line 23
    invoke-virtual {v0, p0, p1, p2, p3}, Ll/gd60;->e(Lcom/p1/mobile/android/app/Act;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final synthetic e5(Ll/lx50;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Ll/bjs;->g6(Ll/lx50;Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p0}, Ll/bjs;->j6()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e6(Ll/jjs;Ll/qxj;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->UpgradeGiftEvent:Lcom/tantan/live/eventbus/LiveEventBus$UpgradeGiftEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$UpgradeGiftEvent;->showUpgradeDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/x1k0$a;

    .line 12
    .line 13
    const/16 v1, 0x2bc

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/x1k0$a;-><init>(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ll/x1k0$a;->d(Ll/jjs;)Ll/x1k0$a;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p1, p2}, Ll/x1k0$a;->e(Ll/qxj;)Ll/x1k0$a;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ll/x1k0$a;->c()Ll/x1k0;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic f5(Ll/ywj;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bjs;->P4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public f6()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nhs;->h0()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic g5(Ll/eyj;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bjs;->H4()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public g6(Ll/lx50;Z)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ll/lx50;->c()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Ll/lx50;->a()Ll/cqj;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const-string v2, "default"

    .line 10
    .line 11
    invoke-static {v0, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/bjs;->K4()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0}, Ll/bjs;->J4()Ll/cqj;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :cond_0
    invoke-virtual {p1}, Ll/lx50;->b()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/16 v3, 0x3e8

    .line 30
    .line 31
    if-ne v2, v3, :cond_1

    .line 32
    .line 33
    if-eqz v1, :cond_1

    .line 34
    .line 35
    invoke-virtual {v1}, Ll/cqj;->g()Ll/coj;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    iget-object v2, v2, Ll/coj;->e:Ll/h64;

    .line 40
    .line 41
    const-string v3, ""

    .line 42
    .line 43
    iput-object v3, v2, Ll/h64;->a:Ljava/lang/String;

    .line 44
    .line 45
    :cond_1
    iget-object v2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 46
    .line 47
    check-cast v2, Ll/nhs;

    .line 48
    .line 49
    invoke-virtual {p1}, Ll/lx50;->b()I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    invoke-virtual {v2, v1, v3}, Ll/nhs;->c0(Ll/cqj;I)V

    .line 54
    .line 55
    .line 56
    iget-object v2, p0, Ll/bjs;->l:Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    if-nez v2, :cond_2

    .line 63
    .line 64
    const/4 v2, 0x0

    .line 65
    invoke-direct {p0, v2, p2}, Ll/bjs;->b6(ZZ)V

    .line 66
    .line 67
    .line 68
    :cond_2
    iput-object v0, p0, Ll/bjs;->l:Ljava/lang/String;

    .line 69
    .line 70
    iput-object v1, p0, Ll/bjs;->n:Ll/cqj;

    .line 71
    .line 72
    invoke-virtual {p0, p1, p2}, Ll/bjs;->Z5(Ll/lx50;Z)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public final synthetic h5(Ll/xpj;)Ljava/lang/Boolean;
    .locals 2

    .line 1
    iget-wide v0, p1, Ll/xpj;->c:D

    .line 2
    .line 3
    invoke-virtual {p0, v0, v1}, Ll/bjs;->a5(D)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic i5(Ll/vf3$d;)Ll/g4$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nhs;->x()Ll/g4$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public isShowing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nhs;->isShowing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public abstract j3()Ljava/lang/String;
.end method

.method public final synthetic j5(Ll/nqj;)Ll/nqj$a;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bjs;->N4()Ll/nqj$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public j6()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bjs;->Q4()Ll/xxj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {p0}, Ll/bf10;->N(Ll/i6t;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Ll/bjs;->T5(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final synthetic k5(Ll/csj;)Ll/wpj;
    .locals 1

    .line 1
    new-instance p1, Ll/wpj;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bjs;->K4()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Ll/bjs;->J4()Ll/cqj;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {p1, v0, p0}, Ll/wpj;-><init>(Ljava/lang/String;Ll/cqj;)V

    .line 12
    .line 13
    .line 14
    return-object p1
.end method

.method public final k6(Ljava/lang/Long;)V
    .locals 0

    .line 1
    sget-object p0, Ll/htd0;->f:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/civ;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/civ;->s(Ljava/lang/Long;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic l5(Ll/oqj;)Landroid/util/Pair;
    .locals 0

    .line 1
    iget-object p1, p1, Ll/oqj;->c:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bjs;->G4(Ljava/lang/String;)Landroid/util/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public l6()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ll/vp20;->o()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, v1, p0}, Ll/oo2;->M1(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final synthetic m5(Ll/eqj;)Ll/e060;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nhs;->B()Ll/e060;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final m6(Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;)V
    .locals 2

    .line 1
    sget-object p0, Ll/htd0;->b:Ll/htd0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/jfv;

    .line 8
    .line 9
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0, v0}, Ll/jfv;->i(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserLevel;->grade:J

    .line 28
    .line 29
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveUserLevel;->grade:J

    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/bjs;->J5()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/bjs;->q:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Ll/bjs;->u:Z

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/bjs;->v:Ll/lx50;

    .line 14
    .line 15
    invoke-static {}, Ll/l0k;->b()V

    .line 16
    .line 17
    .line 18
    invoke-static {}, Ll/osj;->c()Ll/osj;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p0}, Ll/osj;->a()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final synthetic n5(Ll/pqj;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bjs;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic o5(Ll/wrj;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nhs;->A()Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic q5(Ll/y7s;)Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/nhs;->C()Lcom/p1/mobile/putong/live/base/data/BLiveWealthButton;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic s5(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1}, Ll/bjs;->T5(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public t()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, v0}, Ll/bjs;->T5(Z)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/oo2;->J1()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {}, Ll/dhw;->c()Ll/t9t;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 21
    .line 22
    .line 23
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 24
    .line 25
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ll/hiv;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/hiv;->B()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Ll/oo2;->A0()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    const-string v2, "live"

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    invoke-static {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveType;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const-string v1, "voiceLive"

    .line 56
    .line 57
    invoke-static {v1}, Lcom/p1/mobile/putong/live/base/data/BLiveType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveType;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    :goto_0
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    invoke-virtual {v3}, Ll/vp20;->o()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    invoke-virtual {p0}, Ll/bjs;->j3()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-virtual {v2, v3, v4, v1}, Ll/ere;->z(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveType;)V

    .line 78
    .line 79
    .line 80
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Ll/hiv;

    .line 85
    .line 86
    invoke-virtual {v2}, Ll/hiv;->q()Lrx/c;

    .line 87
    .line 88
    .line 89
    move-result-object v2

    .line 90
    const/4 v3, 0x0

    .line 91
    invoke-virtual {v2, v3}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    check-cast v0, Ll/hiv;

    .line 100
    .line 101
    invoke-virtual {v0}, Ll/hiv;->s()Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0, v3}, Lrx/c;->onErrorReturn(Ll/qcj;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    new-instance v3, Ll/dlu;

    .line 110
    .line 111
    invoke-direct {v3}, Ll/dlu;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-static {v2, v0, v3}, Lrx/c;->zip(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-static {}, Lrx/schedulers/Schedulers;->io()Ll/f2e0;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {v0, v2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    invoke-virtual {v0, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    new-instance v2, Ll/dis;

    .line 143
    .line 144
    invoke-direct {v2, p0, v1}, Ll/dis;-><init>(Ll/bjs;Lcom/p1/mobile/putong/live/base/data/BLiveType;)V

    .line 145
    .line 146
    .line 147
    invoke-static {v2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 152
    .line 153
    .line 154
    invoke-direct {p0}, Ll/bjs;->Z4()V

    .line 155
    .line 156
    .line 157
    return-void
.end method

.method public final synthetic t5(Ll/pf60;)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/bjs;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/bjs;->p:Ljava/lang/String;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string v0, ""

    .line 11
    .line 12
    :goto_0
    iget-object p1, p1, Ll/pf60;->b:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p1, Ll/x20;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    const/4 v2, -0x1

    .line 18
    invoke-virtual {p0, v0, p1, v1, v2}, Ll/bjs;->S5(Ljava/lang/String;Ll/x20;ZI)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic u5(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bjs;->E4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic v5(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/bjs;->f6()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic w5(Ll/f1k0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/nhs;

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/f1k0;->b()Ll/jjs;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1}, Ll/f1k0;->a()Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, v0, p1}, Ll/nhs;->j0(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic x5(Ll/pxj;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bjs;->c5()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic y5(Ll/jjs;IILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v4

    .line 5
    invoke-virtual {p0}, Ll/bjs;->P4()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v7

    .line 9
    const/4 v8, 0x0

    .line 10
    const-string v6, "batch"

    .line 11
    .line 12
    move-object v0, p0

    .line 13
    move-object v1, p1

    .line 14
    move v2, p2

    .line 15
    move v5, p3

    .line 16
    move-object v3, p4

    .line 17
    invoke-static/range {v0 .. v8}, Ll/qzj;->r(Ll/bjs;Ll/jjs;ILcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final synthetic z5(Ll/xxj;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/bjs;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1}, Ll/bjs;->b5(Ll/xxj;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-direct {p0, v0, v0}, Ll/bjs;->b6(ZZ)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Ll/xxj;->j()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method
