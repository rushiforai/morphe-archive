.class public abstract Ll/qrm0;
.super Ll/qct;
.source "SourceFile"

# interfaces
.implements Ll/jc3;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Ll/qct<",
        "Ll/rwn0;",
        ">;",
        "Ll/jc3<",
        "TV;>;"
    }
.end annotation


# instance fields
.field public i:I

.field public j:I

.field public k:I

.field public l:Ll/dum;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;"
        }
    .end annotation
.end field

.field public m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

.field public n:Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TV;"
        }
    .end annotation
.end field

.field public o:Ll/ic3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ic3<",
            "*>;"
        }
    .end annotation
.end field

.field public p:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

.field public q:Ll/jxd0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;",
            "Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x42180000    # 38.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Ll/qrm0;->i:I

    .line 11
    .line 12
    const/high16 v0, 0x42300000    # 44.0f

    .line 13
    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Ll/qrm0;->j:I

    .line 19
    .line 20
    iput-object p1, p0, Ll/qrm0;->l:Ll/dum;

    .line 21
    .line 22
    iput-object p2, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 23
    .line 24
    iput-object p3, p0, Ll/qrm0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 25
    .line 26
    new-instance p3, Ll/zit;

    .line 27
    .line 28
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 29
    .line 30
    invoke-direct {p3, p2}, Ll/zit;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p3, Ll/hyr;->a:Ljava/lang/String;

    .line 34
    .line 35
    const-string v0, "showH5"

    .line 36
    .line 37
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    const-string v0, "h5Url"

    .line 44
    .line 45
    invoke-virtual {p3, v0}, Ll/zit;->g(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p3

    .line 49
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-nez v0, :cond_0

    .line 54
    .line 55
    invoke-static {p3}, Ll/niw;->e(Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    :cond_0
    new-instance p3, Ll/jxd0;

    .line 60
    .line 61
    new-instance v0, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    const-string v1, "live_button_red_dot"

    .line 64
    .line 65
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 69
    .line 70
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 85
    .line 86
    const/4 v1, 0x1

    .line 87
    invoke-direct {p3, p2, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;Z)V

    .line 88
    .line 89
    .line 90
    iput-object p3, p0, Ll/qrm0;->q:Ll/jxd0;

    .line 91
    .line 92
    iget-object p1, p1, Ll/dum;->h:Ll/oo2;

    .line 93
    .line 94
    check-cast p1, Ll/rwn0;

    .line 95
    .line 96
    invoke-virtual {p1}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ll/qrm0;->N3(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public static synthetic J3(Ll/qrm0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qrm0;->h4(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic K3(Ll/qrm0;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qrm0;->i4(Landroid/view/View;)Z

    move-result p0

    return p0
.end method

.method public static synthetic L3(Ll/qrm0;Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/qrm0;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic M3(Ll/qrm0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/qrm0;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method


# virtual methods
.method public E()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->redDotCount:I

    .line 4
    .line 5
    return p0
.end method

.method public final N3(Ljava/lang/String;)V
    .locals 0

    .line 1
    const/high16 p1, 0x42180000    # 38.0f

    .line 2
    .line 3
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Ll/qrm0;->i:I

    .line 8
    .line 9
    const/high16 p1, 0x42300000    # 44.0f

    .line 10
    .line 11
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Ll/qrm0;->j:I

    .line 16
    .line 17
    return-void
.end method

.method public O3(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qrm0;->n:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/qrm0;->T3(IZ)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/qrm0;->n:Landroid/view/View;

    .line 10
    .line 11
    new-instance p2, Ll/mrm0;

    .line 12
    .line 13
    invoke-direct {p2, p0}, Ll/mrm0;-><init>(Ll/qrm0;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Ll/qrm0;->n:Landroid/view/View;

    .line 20
    .line 21
    new-instance p2, Ll/nrm0;

    .line 22
    .line 23
    invoke-direct {p2, p0}, Ll/nrm0;-><init>(Ll/qrm0;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public P3()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/qrm0;->l1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/qrm0;->q:Ll/jxd0;

    .line 8
    .line 9
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->refreshButton()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Ll/qrm0;->p:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final R3(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/qrm0;->m4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/qrm0;->P3()V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/qrm0;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final S3(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->callback:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/rwn0;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/api/BottomButtonApi;->patchBottomButtonClick(ILjava/lang/String;)Lrx/c;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    new-instance v0, Ll/orm0;

    .line 40
    .line 41
    invoke-direct {v0, p0}, Ll/orm0;-><init>(Ll/qrm0;)V

    .line 42
    .line 43
    .line 44
    invoke-static {v0}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public abstract T3(IZ)Landroid/view/View;
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IZ)TV;"
        }
    .end annotation
.end method

.method public U3(ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Ll/ic3;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;",
            ")",
            "Ll/ic3<",
            "*>;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2}, Ll/qrm0;->V3(ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Ll/ic3;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {p0, p1, p2}, Ll/qrm0;->W3(ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Ll/ic3;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :goto_0
    invoke-virtual {p1, p0}, Ll/ic3;->L(Ll/qct;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ll/ic3;->K(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;)V

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/prm0;

    .line 26
    .line 27
    invoke-direct {v0, p0, p2}, Ll/prm0;-><init>(Ll/qrm0;Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v0}, Ll/ic3;->A(Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    return-object p1
.end method

.method public final V3(ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Ll/ic3;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;",
            ")",
            "Ll/ic3<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;->SETTING:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/qrm0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v4, Ll/din0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/qrm0;->c4()I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 22
    .line 23
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 24
    .line 25
    iget v8, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->sort:I

    .line 26
    .line 27
    iget-object v9, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->name:Ljava/lang/String;

    .line 28
    .line 29
    move-object v10, p0

    .line 30
    move v7, p1

    .line 31
    invoke-direct/range {v4 .. v10}, Ll/din0;-><init>(ILjava/lang/CharSequence;IILjava/lang/String;Ll/jc3;)V

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_0
    move-object v8, p0

    .line 36
    move v5, p1

    .line 37
    iget-object p0, v8, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->isGiftSwitch()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    new-instance v4, Ll/vin0;

    .line 46
    .line 47
    iget-object p0, v8, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 50
    .line 51
    invoke-direct {v4, v3, p0, v5, p2}, Ll/vin0;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)V

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget p0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->viewType:I

    .line 56
    .line 57
    const/4 p1, 0x1

    .line 58
    if-ne p0, p1, :cond_2

    .line 59
    .line 60
    new-instance v2, Ll/din0;

    .line 61
    .line 62
    iget-object p0, v8, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 63
    .line 64
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 65
    .line 66
    iget v6, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->sort:I

    .line 67
    .line 68
    iget-object v7, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->name:Ljava/lang/String;

    .line 69
    .line 70
    invoke-direct/range {v2 .. v8}, Ll/din0;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;IILjava/lang/String;Ll/jc3;)V

    .line 71
    .line 72
    .line 73
    :goto_0
    move-object v4, v2

    .line 74
    goto :goto_1

    .line 75
    :cond_2
    new-instance v2, Ll/dho0;

    .line 76
    .line 77
    iget-object p0, v8, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 78
    .line 79
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 80
    .line 81
    iget v6, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->sort:I

    .line 82
    .line 83
    iget-object v7, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->name:Ljava/lang/String;

    .line 84
    .line 85
    invoke-direct/range {v2 .. v8}, Ll/dho0;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;IILjava/lang/String;Ll/jc3;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :goto_1
    const/high16 p0, 0x42080000    # 34.0f

    .line 90
    .line 91
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    invoke-virtual {v4, p0}, Ll/ic3;->N(I)V

    .line 96
    .line 97
    .line 98
    return-object v4
.end method

.method public final W3(ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Ll/ic3;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;",
            ")",
            "Ll/ic3<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;->SETTING:Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/qrm0;->e4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    new-instance v4, Ll/din0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/qrm0;->c4()I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 22
    .line 23
    iget-object v6, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 24
    .line 25
    iget v8, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->sort:I

    .line 26
    .line 27
    iget-object v9, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->name:Ljava/lang/String;

    .line 28
    .line 29
    move-object v10, p0

    .line 30
    move v7, p1

    .line 31
    invoke-direct/range {v4 .. v10}, Ll/din0;-><init>(ILjava/lang/CharSequence;IILjava/lang/String;Ll/jc3;)V

    .line 32
    .line 33
    .line 34
    return-object v4

    .line 35
    :cond_0
    move-object v8, p0

    .line 36
    move v5, p1

    .line 37
    iget-object p0, v8, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->isGame()Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    new-instance v2, Ll/dho0;

    .line 46
    .line 47
    iget-object p0, v8, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 48
    .line 49
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 50
    .line 51
    iget v6, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->sort:I

    .line 52
    .line 53
    iget-object v7, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->name:Ljava/lang/String;

    .line 54
    .line 55
    invoke-direct/range {v2 .. v8}, Ll/dho0;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;IILjava/lang/String;Ll/jc3;)V

    .line 56
    .line 57
    .line 58
    return-object v2

    .line 59
    :cond_1
    iget-object p0, v8, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 60
    .line 61
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->isGiftSwitch()Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_2

    .line 66
    .line 67
    new-instance p0, Ll/vin0;

    .line 68
    .line 69
    iget-object p1, v8, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 72
    .line 73
    invoke-direct {p0, v3, p1, v5, p2}, Ll/vin0;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)V

    .line 74
    .line 75
    .line 76
    return-object p0

    .line 77
    :cond_2
    new-instance v2, Ll/din0;

    .line 78
    .line 79
    iget-object p0, v8, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 80
    .line 81
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->name:Ljava/lang/String;

    .line 82
    .line 83
    iget v6, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->sort:I

    .line 84
    .line 85
    iget-object v7, p2, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->name:Ljava/lang/String;

    .line 86
    .line 87
    invoke-direct/range {v2 .. v8}, Ll/din0;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;IILjava/lang/String;Ll/jc3;)V

    .line 88
    .line 89
    .line 90
    return-object v2
.end method

.method public X3()Landroid/view/View;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/qrm0;->b4()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p0, v0, v1}, Ll/qrm0;->O3(IZ)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/qrm0;->n:Landroid/view/View;

    .line 10
    .line 11
    return-object p0
.end method

.method public Y3()I
    .locals 0

    .line 1
    const/high16 p0, 0x40000000    # 2.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public Z3()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->id:I

    .line 4
    .line 5
    return p0
.end method

.method public a4()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->type:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public abstract b4()I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end method

.method public abstract c4()I
    .annotation build Landroidx/annotation/DrawableRes;
    .end annotation
.end method

.method public d4()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qrm0;->n:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public e4(Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;Lcom/p1/mobile/putong/live/livingroom/voice/bottom/Area;)Ljava/lang/String;
    .locals 2

    .line 1
    sget-object p0, Ll/qrm0$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    aget p0, p0, p2

    .line 8
    .line 9
    const-string p2, ""

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    if-eq p0, v0, :cond_0

    .line 13
    .line 14
    const/4 v0, 0x2

    .line 15
    if-eq p0, v0, :cond_0

    .line 16
    .line 17
    return-object p2

    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 19
    .line 20
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_1

    .line 25
    .line 26
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 27
    .line 28
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    add-int/lit8 v1, v0, 0x1

    .line 33
    .line 34
    if-lt p0, v1, :cond_1

    .line 35
    .line 36
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->icon:Ljava/util/List;

    .line 37
    .line 38
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ljava/lang/String;

    .line 43
    .line 44
    return-object p0

    .line 45
    :cond_1
    return-object p2
.end method

.method public f4()Ll/qct;
    .locals 0

    .line 1
    return-object p0
.end method

.method public g4(ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Ll/ic3;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;",
            ")",
            "Ll/ic3<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/qrm0;->o:Ll/ic3;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/qrm0;->U3(ILcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;)Ll/ic3;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/qrm0;->o:Ll/ic3;

    .line 10
    .line 11
    :cond_0
    iget-object p0, p0, Ll/qrm0;->o:Ll/ic3;

    .line 12
    .line 13
    return-object p0
.end method

.method public final synthetic h4(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->localType:Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v1, v0}, Ll/qrm0;->R3(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Ll/rwn0;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/rwn0;->i3()Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 21
    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget p1, p0, Ll/qrm0;->k:I

    .line 25
    .line 26
    invoke-static {p0, v0, p1}, Ll/jkp0;->v(Ll/qct;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;I)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget p1, p0, Ll/qrm0;->k:I

    .line 31
    .line 32
    invoke-static {p0, v0, p1}, Ll/ptm0;->b(Ll/qct;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;I)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic i4(Landroid/view/View;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->localType:Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p1, v1, v0}, Ll/qrm0;->l4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final synthetic j4(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->refreshAllButton()Ll/v3f$c;

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

.method public final synthetic k4(Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->localType:Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0, p2, v1, v0}, Ll/qrm0;->R3(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->BottomZoneEvent:Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;

    .line 15
    .line 16
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$BottomZoneEvent;->hideSettingDialog()Ll/v3f$c;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {p2}, Ll/v3f$c;->p()V

    .line 21
    .line 22
    .line 23
    const/4 p2, 0x3

    .line 24
    invoke-static {p2}, Ll/wft;->b(I)Z

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    if-nez p2, :cond_0

    .line 29
    .line 30
    iget-object p2, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 31
    .line 32
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->labels:Ljava/util/List;

    .line 33
    .line 34
    const-string v0, "latest"

    .line 35
    .line 36
    invoke-interface {p2, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-eqz p2, :cond_0

    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceRecentHistoryEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceRecentHistoryEvent;

    .line 47
    .line 48
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceRecentHistoryEvent;->addRecentHistory()Ll/v3f$d;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->url:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p2, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :cond_0
    iget-object p2, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 60
    .line 61
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSettingButtonCategory;->id:I

    .line 62
    .line 63
    invoke-static {p0, p2, p1}, Ll/ptm0;->c(Ll/qct;Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;I)V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public l1()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/qrm0;->m:Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveBottomButton;->enableRedDot:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/qrm0;->q:Ll/jxd0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-nez p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public final l4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/qrm0;->n4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Ll/qrm0;->P3()V

    .line 6
    .line 7
    .line 8
    return p1
.end method

.method public abstract m4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)V
.end method

.method public n4(Landroid/view/View;Lcom/p1/mobile/putong/live/base/data/BLiveButtonType;Ljava/lang/String;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method
