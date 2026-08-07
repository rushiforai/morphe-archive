.class public Ll/idg;
.super Ll/tk2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/tk2<",
        "Ll/cdg;",
        ">;"
    }
.end annotation


# instance fields
.field public j:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/tk2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/cdg;

    .line 5
    .line 6
    iget-object p1, p1, Ll/dum;->a:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    invoke-direct {v0, p1, p0}, Ll/cdg;-><init>(Lcom/p1/mobile/android/app/Act;Ll/idg;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/l6t;->C(Ll/iam;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public static synthetic i4(Ll/idg;ZZLl/aeg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/idg;->n4(ZZLl/aeg;)V

    return-void
.end method

.method public static synthetic j4(Ll/idg;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/idg;->o4()V

    return-void
.end method

.method public static synthetic k4(Ll/idg;Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/idg;->q4(Ll/vxj0;)V

    return-void
.end method

.method public static synthetic l4(Ll/idg;Ll/o6g;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/idg;->p4(Ll/o6g;)V

    return-void
.end method

.method private synthetic q4(Ll/vxj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/idg;->m4()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public m4()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/cdg;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic n4(ZZLl/aeg;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p3, p2}, Ll/idg;->t4(ZLl/aeg;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic o4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/cdg;

    .line 4
    .line 5
    iget-object v0, v0, Ll/cdg;->m:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-static {p0, v0}, Ll/seg;->g(Ll/i6t;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final synthetic p4(Ll/o6g;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/o6g;->a()Ll/aeg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "fanbase_page"

    .line 8
    .line 9
    iput-object v0, p0, Ll/idg;->j:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/o6g;->b()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1}, Ll/o6g;->a()Ll/aeg;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {p0, v0, p1, v1}, Ll/idg;->t4(ZLl/aeg;Z)V

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const-string v0, "other"

    .line 25
    .line 26
    iput-object v0, p0, Ll/idg;->j:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {p1}, Ll/o6g;->b()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-virtual {p0, p1, v0}, Ll/idg;->r4(ZZ)V

    .line 34
    .line 35
    .line 36
    :goto_0
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object v0, p0, Ll/idg;->j:Ljava/lang/String;

    .line 41
    .line 42
    invoke-static {p0, p1, v0}, Ll/seg;->h(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public final r4(ZZ)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/oo2;->B:Ll/x7g;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/x7g;->T()Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/hdg;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1, p2}, Ll/hdg;-><init>(Ll/idg;ZZ)V

    .line 18
    .line 19
    .line 20
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public s4()V
    .locals 10

    .line 1
    new-instance v0, Ll/n6g;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 6
    .line 7
    move-object v4, v3

    .line 8
    check-cast v4, Ll/cdg;

    .line 9
    .line 10
    iget-object v4, v4, Ll/cdg;->q:Lv/VImage;

    .line 11
    .line 12
    move-object v5, v3

    .line 13
    check-cast v5, Ll/cdg;

    .line 14
    .line 15
    iget-object v5, v5, Ll/cdg;->B:Lv/VImage;

    .line 16
    .line 17
    check-cast v3, Ll/cdg;

    .line 18
    .line 19
    iget-object v3, v3, Ll/cdg;->C:Lv/VImage;

    .line 20
    .line 21
    move-object v2, v5

    .line 22
    move-object v5, v3

    .line 23
    move-object v3, v4

    .line 24
    move-object v4, v2

    .line 25
    move-object v2, p0

    .line 26
    invoke-direct/range {v0 .. v5}, Ll/n6g;-><init>(Ll/dum;Ll/tk2;Lv/VImage;Lv/VImage;Lv/VImage;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 30
    .line 31
    .line 32
    new-instance v0, Ll/v6g;

    .line 33
    .line 34
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 35
    .line 36
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 37
    .line 38
    move-object v4, v3

    .line 39
    check-cast v4, Ll/cdg;

    .line 40
    .line 41
    iget-object v4, v4, Ll/cdg;->J:Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;

    .line 42
    .line 43
    move-object v5, v3

    .line 44
    check-cast v5, Ll/cdg;

    .line 45
    .line 46
    iget-object v5, v5, Ll/cdg;->K:Landroid/widget/TextView;

    .line 47
    .line 48
    check-cast v3, Ll/cdg;

    .line 49
    .line 50
    iget-object v3, v3, Ll/cdg;->M:Landroid/widget/TextView;

    .line 51
    .line 52
    move-object v2, v5

    .line 53
    move-object v5, v3

    .line 54
    move-object v3, v4

    .line 55
    move-object v4, v2

    .line 56
    move-object v2, p0

    .line 57
    invoke-direct/range {v0 .. v5}, Ll/v6g;-><init>(Ll/dum;Ll/tk2;Lcom/p1/mobile/putong/live/base/view/ClipRoundImageView;Landroid/widget/TextView;Landroid/widget/TextView;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 61
    .line 62
    .line 63
    new-instance v3, Ll/q6g;

    .line 64
    .line 65
    iget-object v4, p0, Ll/xzs;->e:Ll/dum;

    .line 66
    .line 67
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 68
    .line 69
    move-object v1, v0

    .line 70
    check-cast v1, Ll/cdg;

    .line 71
    .line 72
    iget-object v5, v1, Ll/cdg;->w:Lv/VDraweeView;

    .line 73
    .line 74
    move-object v1, v0

    .line 75
    check-cast v1, Ll/cdg;

    .line 76
    .line 77
    iget-object v6, v1, Ll/cdg;->y:Lv/VDraweeView;

    .line 78
    .line 79
    move-object v1, v0

    .line 80
    check-cast v1, Ll/cdg;

    .line 81
    .line 82
    iget-object v7, v1, Ll/cdg;->z:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 83
    .line 84
    check-cast v0, Ll/cdg;

    .line 85
    .line 86
    iget-object v8, v0, Ll/cdg;->A:Lv/VImage;

    .line 87
    .line 88
    const/4 v9, 0x1

    .line 89
    invoke-direct/range {v3 .. v9}, Ll/q6g;-><init>(Ll/dum;Lv/VDraweeView;Lv/VDraweeView;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lv/VImage;Z)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {p0, v3}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 93
    .line 94
    .line 95
    new-instance v0, Ll/x6g;

    .line 96
    .line 97
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 98
    .line 99
    iget-object v3, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 100
    .line 101
    move-object v4, v3

    .line 102
    check-cast v4, Ll/cdg;

    .line 103
    .line 104
    iget-object v4, v4, Ll/cdg;->F:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyViewGroup;

    .line 105
    .line 106
    move-object v5, v3

    .line 107
    check-cast v5, Ll/cdg;

    .line 108
    .line 109
    iget-object v5, v5, Ll/cdg;->G:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 110
    .line 111
    move-object v6, v3

    .line 112
    check-cast v6, Ll/cdg;

    .line 113
    .line 114
    iget-object v6, v6, Ll/cdg;->H:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 115
    .line 116
    check-cast v3, Ll/cdg;

    .line 117
    .line 118
    iget-object v3, v3, Ll/cdg;->I:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;

    .line 119
    .line 120
    iget-object v7, p0, Ll/idg;->j:Ljava/lang/String;

    .line 121
    .line 122
    move-object v2, v6

    .line 123
    move-object v6, v3

    .line 124
    move-object v3, v4

    .line 125
    move-object v4, v5

    .line 126
    move-object v5, v2

    .line 127
    move-object v2, p0

    .line 128
    invoke-direct/range {v0 .. v7}, Ll/x6g;-><init>(Ll/dum;Ll/tk2;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyViewGroup;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubCompanyItemView;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 132
    .line 133
    .line 134
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
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->showFansClubCompanyDialog()Ll/v3f$d;

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
    new-instance v1, Ll/edg;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/edg;-><init>(Ll/idg;)V

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->FansClubEvent:Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$FansClubEvent;->hideFansClubCompanyDialog()Ll/v3f$c;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Lrx/c;

    .line 51
    .line 52
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Ll/fdg;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/fdg;-><init>(Ll/idg;)V

    .line 59
    .line 60
    .line 61
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public final t4(ZLl/aeg;Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/cdg;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->E()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast v0, Ll/cdg;

    .line 11
    .line 12
    invoke-virtual {v0, p1, p3}, Ll/cdg;->N(ZZ)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p2}, Ll/tk2;->f4(Ll/aeg;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public u4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast v0, Ll/cdg;

    .line 4
    .line 5
    iget-object v0, v0, Ll/cdg;->m:Landroid/view/View;

    .line 6
    .line 7
    new-instance v1, Ll/gdg;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/gdg;-><init>(Ll/idg;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method
