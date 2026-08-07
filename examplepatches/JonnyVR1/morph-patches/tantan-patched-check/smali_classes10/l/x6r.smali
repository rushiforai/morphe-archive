.class public Ll/x6r;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Ll/dn50;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/i6t<",
        "Ll/rwn0;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;",
        ">;",
        "Ll/dn50;"
    }
.end annotation


# instance fields
.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+",
            "Ll/rwn0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-direct {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;-><init>(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic J3(Ll/x6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x6r;->f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V

    return-void
.end method

.method public static synthetic K3(Ll/x6r;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x6r;->S3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V

    return-void
.end method

.method public static synthetic L3(Ll/x6r;Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x6r;->V3(Ljava/lang/Boolean;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/x6r;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/x6r;->W3(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    :goto_1
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static synthetic O3(Ll/x6r;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/x6r;->U3(Landroid/view/View;)V

    return-void
.end method

.method private S3(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    move-object v1, v0

    .line 6
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 7
    .line 8
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 9
    .line 10
    if-eqz v1, :cond_2

    .line 11
    .line 12
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvGameInfo;->playInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Ll/x6r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;->songCode:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-nez p1, :cond_2

    .line 40
    .line 41
    :cond_1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 42
    .line 43
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 48
    .line 49
    .line 50
    :cond_2
    :goto_0
    return-void
.end method

.method private synthetic W3(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 4
    .line 5
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    xor-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->setEarClickable(Ljava/lang/Boolean;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public A()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->k(Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public B(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 4
    .line 5
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->k(Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public M1()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->k(Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public P3()I
    .locals 2

    .line 1
    new-instance v0, Ll/o120;

    .line 2
    .line 3
    const/16 v1, 0x1b61

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/o120;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Float;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/high16 v0, 0x42c80000    # 100.0f

    .line 19
    .line 20
    mul-float/2addr p0, v0

    .line 21
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public R3()I
    .locals 2

    .line 1
    new-instance v0, Ll/dob0;

    .line 2
    .line 3
    const/16 v1, 0x1b61

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/dob0;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Float;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/high16 v0, 0x42c80000    # 100.0f

    .line 19
    .line 20
    mul-float/2addr p0, v0

    .line 21
    const/high16 v0, 0x40800000    # 4.0f

    .line 22
    .line 23
    div-float/2addr p0, v0

    .line 24
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method public T3()Z
    .locals 2

    .line 1
    new-instance v0, Ll/ud80;

    .line 2
    .line 3
    const/16 v1, 0x1b61

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/ud80;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Integer;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/4 v0, 0x3

    .line 19
    if-ne p0, v0, :cond_0

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

.method public final synthetic U3(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->switchNext()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 15
    .line 16
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final synthetic V3(Ljava/lang/Boolean;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public X3()V
    .locals 2

    .line 1
    new-instance v0, Ll/th0$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-direct {v0, v1}, Ll/th0$a;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const-string v1, "\u5207\u6b4c\u4f1a\u7ed3\u675f\u5f53\u524d\u6b4c\u66f2\uff0c\u662f\u5426\u5207\u6b4c\uff1f"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Ll/th0$a;->j(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "\u5207\u6b4c"

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/th0$a;->r(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/w6r;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/w6r;-><init>(Ll/x6r;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ll/th0$a;->o(Landroid/view/View$OnClickListener;)Ll/th0$a;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string v0, "\u53d6\u6d88"

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ll/th0$a;->f(Ljava/lang/CharSequence;)Ll/th0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/th0$a;->a()Ll/th0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0}, Ll/th0;->g()V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public Y3(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->setAudioEffectPreset()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public Z3(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->setEarSwitcher()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public a4(I)V
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x42c80000    # 100.0f

    .line 3
    .line 4
    div-float/2addr p1, v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->adjustMusicVolume()Ll/v3f$d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public b4(Z)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->setOriginalSwitcher()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public c4(I)V
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x42c80000    # 100.0f

    .line 3
    .line 4
    div-float/2addr p1, v0

    .line 5
    const/high16 v0, 0x40800000    # 4.0f

    .line 6
    .line 7
    mul-float/2addr p1, v0

    .line 8
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->adjustRecordVolume()Ll/v3f$d;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final d4()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 4
    .line 5
    new-instance v1, Ll/cke;

    .line 6
    .line 7
    const/16 v2, 0x1b61

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ll/cke;-><init>(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->setEarSwitcher(Ljava/lang/Boolean;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 22
    .line 23
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 24
    .line 25
    new-instance v1, Ll/s660;

    .line 26
    .line 27
    invoke-direct {v1, v2}, Ll/s660;-><init>(I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->setOriginalSwitcher(Ljava/lang/Boolean;)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 40
    .line 41
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 42
    .line 43
    new-instance v1, Ll/na1;

    .line 44
    .line 45
    invoke-direct {v1, v2}, Ll/na1;-><init>(I)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    check-cast p0, Ljava/lang/Integer;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->setAudioEffectPreset(I)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public e4()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->KtvDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$KtvDialogEvent;->showKtvDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final f4(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/x6r;->i:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;

    .line 2
    .line 3
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 4
    .line 5
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->m(Ll/xzs;Lcom/p1/mobile/putong/live/base/data/BLiveVoiceKtvPlayInfo;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/x6r;->d4()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public g4(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->resumeMusic()Ll/v3f$c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->pauseMusic()Ll/v3f$c;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public n()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    move-object v1, v0

    .line 7
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 8
    .line 9
    iget-object v1, v1, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 24
    .line 25
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->w:Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/dialogcenter/a;->dismiss()V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public s0()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;

    .line 4
    .line 5
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/ktv/view/KtvTuningViewModel;->k(Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceKtvEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceKtvEvent;->showTuningDialog()Ll/v3f$d;

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
    new-instance v1, Ll/r6r;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/r6r;-><init>(Ll/x6r;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-static {p0, p0}, Ll/tqn0;->b(Ll/i6t;Ll/dn50;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ll/rwn0;

    .line 44
    .line 45
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/aj1;->B0()Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/s6r;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/s6r;-><init>(Ll/x6r;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Ll/rwn0;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/rwn0;->Z2()Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    new-instance v1, Ll/t6r;

    .line 84
    .line 85
    invoke-direct {v1}, Ll/t6r;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/u6r;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/u6r;-><init>(Ll/x6r;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    new-instance v1, Ll/v6r;

    .line 106
    .line 107
    invoke-direct {v1, p0}, Ll/v6r;-><init>(Ll/x6r;)V

    .line 108
    .line 109
    .line 110
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 115
    .line 116
    .line 117
    return-void
.end method
