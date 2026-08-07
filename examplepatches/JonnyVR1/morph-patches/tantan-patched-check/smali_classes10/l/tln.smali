.class public Ll/tln;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/qct<",
        "TD;>;"
    }
.end annotation


# instance fields
.field public i:Ll/bjs;


# direct methods
.method public constructor <init>(Ll/dum;Ll/bjs;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/tln;->i:Ll/bjs;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/tln;Ll/ib0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tln;->S3(Ll/ib0;)V

    return-void
.end method

.method public static synthetic K3(Ll/tln;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p7}, Ll/tln;->P3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    return-void
.end method

.method public static synthetic L3(Ll/tln;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/tln;->R3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic M3(Ljava/lang/Integer;)V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public final N3(Ljava/lang/Throwable;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V
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

.method public final O3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/y20;IZ)V
    .locals 0
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
    if-eqz p3, :cond_1

    .line 5
    .line 6
    invoke-virtual {p3, p2, p4}, Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;->l1(Ll/jjs;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V

    .line 7
    .line 8
    .line 9
    if-eqz p5, :cond_0

    .line 10
    .line 11
    invoke-interface {p5, p4}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    new-instance p1, Ll/ib0;

    .line 15
    .line 16
    iget-object p4, p0, Ll/tln;->i:Ll/bjs;

    .line 17
    .line 18
    invoke-virtual {p4}, Ll/bjs;->L4()Ll/e060;

    .line 19
    .line 20
    .line 21
    move-result-object p4

    .line 22
    move-object p5, p3

    .line 23
    move-object p3, p2

    .line 24
    move-object p2, p5

    .line 25
    move p5, p6

    .line 26
    move-object p6, p4

    .line 27
    move p4, p5

    .line 28
    move p5, p7

    .line 29
    invoke-direct/range {p1 .. p6}, Ll/ib0;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/jjs;IZLl/e060;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ll/vxr;->d()Ll/p6s;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    invoke-virtual {p2}, Ll/p6s;->I0()Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-eqz p2, :cond_1

    .line 41
    .line 42
    invoke-virtual {p3}, Ll/jjs;->s()Z

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    if-nez p2, :cond_1

    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->IntlGiftComboEvent:Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$IntlGiftComboEvent;->comboEvent()Ll/v3f$d;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void
.end method

.method public final synthetic P3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IZLcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)V
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
    invoke-virtual/range {p0 .. p7}, Ll/tln;->O3(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/y20;IZ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic R3(Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p3, p1, p2}, Ll/tln;->N3(Ljava/lang/Throwable;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic S3(Ll/ib0;)V
    .locals 7

    .line 1
    invoke-virtual {p1}, Ll/ib0;->c()Ll/jjs;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    invoke-virtual {p1}, Ll/ib0;->d()Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-virtual {p1}, Ll/ib0;->b()I

    .line 10
    .line 11
    .line 12
    move-result v5

    .line 13
    const/4 v6, 0x0

    .line 14
    const/4 v3, 0x0

    .line 15
    const/4 v4, 0x1

    .line 16
    move-object v0, p0

    .line 17
    invoke-virtual/range {v0 .. v6}, Ll/tln;->T3(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IIZ)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public T3(Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IIZ)V
    .locals 10
    .param p3    # Ll/y20;
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
            ">;IIZ)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    iget v0, v1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 6
    .line 7
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v8

    .line 11
    new-instance v0, Ll/pln;

    .line 12
    .line 13
    move-object v3, p1

    .line 14
    move-object v4, p2

    .line 15
    move-object v5, p3

    .line 16
    move v6, p5

    .line 17
    move/from16 v7, p6

    .line 18
    .line 19
    move-object v2, v1

    .line 20
    move-object v1, p0

    .line 21
    invoke-direct/range {v0 .. v7}, Ll/pln;-><init>(Ll/tln;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Ll/y20;IZ)V

    .line 22
    .line 23
    .line 24
    move-object v1, v2

    .line 25
    new-instance v2, Ll/qln;

    .line 26
    .line 27
    invoke-direct {v2, p0, p2, v1}, Ll/qln;-><init>(Ll/tln;Lcom/p1/mobile/putong/live/livingroom/increment/gift/LiveGiftItemView;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)V

    .line 28
    .line 29
    .line 30
    new-instance v4, Ll/rln;

    .line 31
    .line 32
    invoke-direct {v4}, Ll/rln;-><init>()V

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Ll/tln;->i:Ll/bjs;

    .line 36
    .line 37
    invoke-virtual {p2}, Ll/bjs;->H4()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    iget-object p2, p0, Ll/tln;->i:Ll/bjs;

    .line 42
    .line 43
    invoke-virtual {p2}, Ll/bjs;->M4()Ll/cqj;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-static {v1, p1, p5}, Ll/cpj;->H(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/jjs;I)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 48
    .line 49
    .line 50
    move-result-object v9

    .line 51
    const/4 v5, 0x0

    .line 52
    move v6, p4

    .line 53
    move-object v3, v2

    .line 54
    move-object v2, v0

    .line 55
    move-object v0, v8

    .line 56
    move-object v8, p2

    .line 57
    invoke-static/range {v0 .. v9}, Ll/uoe0;->d(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/y20;Ll/y20;Ll/y20;ZILjava/lang/String;Ll/cqj;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/uoe0;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget-object p2, p0, Ll/tln;->i:Ll/bjs;

    .line 62
    .line 63
    new-instance p4, Ll/sln;

    .line 64
    .line 65
    invoke-direct {p4, p0}, Ll/sln;-><init>(Ll/tln;)V

    .line 66
    .line 67
    .line 68
    invoke-static {p2, p1, p4}, Ll/xoe0;->a(Ll/bjs;Ll/uoe0;Ll/y20;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public U3(Ll/uoe0;)V
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

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->GiftDialogEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$GiftDialogEventGroup;->intlNewComboClick()Ll/v3f$d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lrx/c;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ll/oln;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/oln;-><init>(Ll/tln;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    return-void
.end method
