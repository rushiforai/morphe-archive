.class public Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndAct;
.super Lcom/p1/mobile/putong/live/livingroom/archi/act/LivingBaseAct;
.source "SourceFile"


# instance fields
.field public c:Ll/aas;

.field public d:Ll/das;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/act/LivingBaseAct;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static X1(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/data/BLive;Lcom/p1/mobile/putong/data/User;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-class v1, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndAct;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "live_extra"

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    const-string p0, "live_force_stop_content"

    .line 14
    .line 15
    invoke-virtual {v0, p0, p3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 16
    .line 17
    .line 18
    const-string p0, "live_anchor"

    .line 19
    .line 20
    invoke-virtual {v0, p0, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 21
    .line 22
    .line 23
    const-string p0, "live_anchor_source"

    .line 24
    .line 25
    invoke-virtual {v0, p0, p4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 26
    .line 27
    .line 28
    const-string p0, "live_trace_id"

    .line 29
    .line 30
    invoke-virtual {v0, p0, p5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method private Y1(Lcom/p1/mobile/putong/live/base/data/BLive;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6

    .line 1
    const/4 v1, 0x1

    .line 2
    const/4 v5, 0x0

    .line 3
    const-string v0, "anchor_live_summary"

    .line 4
    .line 5
    move-object v4, p1

    .line 6
    move-object v3, p2

    .line 7
    move-object v2, p3

    .line 8
    invoke-static/range {v0 .. v5}, Ll/fgt;->a(Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;Ll/y20;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndAct;->d:Ll/das;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/das;->inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public initDataOnCreate()V
    .locals 6

    .line 1
    new-instance v0, Ll/aas;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/aas;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndAct;->c:Ll/aas;

    .line 7
    .line 8
    new-instance v0, Ll/das;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/das;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndAct;->d:Ll/das;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndAct;->c:Ll/aas;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ll/ar2;->C(Ll/iam;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndAct;->c:Ll/aas;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const-string v2, "live_anchor"

    .line 27
    .line 28
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    check-cast v1, Lcom/p1/mobile/putong/data/User;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    const-string v3, "live_extra"

    .line 39
    .line 40
    invoke-virtual {v2, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    const-string v5, "live_force_stop_content"

    .line 51
    .line 52
    invoke-virtual {v4, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-virtual {v0, v1, v2, v4}, Ll/aas;->n0(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/live/base/data/BLive;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initDataOnCreate()V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0, v3}, Landroid/content/Intent;->getSerializableExtra(Ljava/lang/String;)Ljava/io/Serializable;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLive;

    .line 71
    .line 72
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const-string v2, "live_anchor_source"

    .line 77
    .line 78
    invoke-virtual {v1, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    const-string v3, "live_trace_id"

    .line 87
    .line 88
    invoke-virtual {v2, v3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-direct {p0, v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndAct;->Y1(Lcom/p1/mobile/putong/live/base/data/BLive;Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public initPageHelper()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndAct;->c:Ll/aas;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/aas;->j0()Ll/l4g0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/app/PutongAct;->pageHelper:Ll/l4g0;

    .line 8
    .line 9
    return-void
.end method

.method public initSubscription()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/liveend/LiveEndAct;->c:Ll/aas;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/aas;->a0()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
