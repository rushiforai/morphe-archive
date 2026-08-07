.class public Ll/f8g;
.super Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder<",
        "Ll/acg;",
        ">;"
    }
.end annotation


# instance fields
.field public A:Z

.field public k:Landroid/view/View;

.field public l:Lv/VImage;

.field public m:Landroid/widget/LinearLayout;

.field public n:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;

.field public o:Landroidx/core/widget/NestedScrollView;

.field public p:Landroid/widget/LinearLayout;

.field public q:Landroid/widget/TextView;

.field public r:Lv/VText;

.field public s:Lv/VImage;

.field public t:Lv/VImage;

.field public u:Lv/VText;

.field public v:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;

.field public w:Landroidx/recyclerview/widget/RecyclerView;

.field public x:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;

.field public y:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;

.field public z:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;Ll/acg;)V
    .locals 2

    .line 1
    sget v0, Ll/yec0;->l3:I

    .line 2
    .line 3
    const/high16 v1, 0x3f000000    # 0.5f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qag0;->c(F)Ll/rq2;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;-><init>(ILcom/p1/mobile/android/app/Act;Ll/y8s;Ll/rq2;)V

    .line 10
    .line 11
    .line 12
    const/4 p1, 0x1

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->B(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static synthetic F(Ll/f8g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f8g;->O(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic G(Ll/f8g;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f8g;->N(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic H(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic I(Ll/f8g;Ll/ruf0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f8g;->P(Ll/ruf0;)V

    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    check-cast p0, Ll/acg;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final J(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/g8g;->a(Ll/f8g;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public K(Ll/acg;)V
    .locals 0

    .line 1
    return-void
.end method

.method public L()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f8g;->z:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/f8g;->y:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->c()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public M(Z)V
    .locals 2

    .line 1
    iput-boolean p1, p0, Ll/f8g;->A:Z

    .line 2
    .line 3
    iget-object v0, p0, Ll/f8g;->u:Lv/VText;

    .line 4
    .line 5
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/f8g;->w:Landroidx/recyclerview/widget/RecyclerView;

    .line 9
    .line 10
    xor-int/lit8 v1, p1, 0x1

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/f8g;->t:Lv/VImage;

    .line 16
    .line 17
    invoke-static {v0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/f8g;->v:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;

    .line 21
    .line 22
    xor-int/lit8 p1, p1, 0x1

    .line 23
    .line 24
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final synthetic N(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/acg;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/acg;->E4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic O(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 2
    .line 3
    check-cast p0, Ll/acg;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/acg;->F4()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic P(Ll/ruf0;)V
    .locals 4

    .line 1
    instance-of v0, p1, Ll/oag;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Ll/oag;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/oag;->b()Landroid/graphics/Bitmap;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-lez v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v0}, Ll/oag;->b()Landroid/graphics/Bitmap;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    int-to-float v1, v1

    .line 27
    const/high16 v2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    mul-float/2addr v1, v2

    .line 30
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    int-to-float v0, v0

    .line 35
    div-float/2addr v1, v0

    .line 36
    iget-object v0, p0, Ll/f8g;->s:Lv/VImage;

    .line 37
    .line 38
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    int-to-float v0, v0

    .line 43
    mul-float/2addr v1, v0

    .line 44
    float-to-int v0, v1

    .line 45
    iget-object v1, p0, Ll/f8g;->s:Lv/VImage;

    .line 46
    .line 47
    const/4 v2, 0x1

    .line 48
    new-array v2, v2, [Landroid/view/View;

    .line 49
    .line 50
    const/4 v3, 0x0

    .line 51
    aput-object v1, v2, v3

    .line 52
    .line 53
    invoke-static {v0, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 54
    .line 55
    .line 56
    :cond_0
    iget-object p0, p0, Ll/f8g;->s:Lv/VImage;

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public Q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f8g;->s:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Ll/f8g;->A:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/f8g;->v:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->i(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public R(Ll/v9g;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/f8g;->s:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-boolean v0, p0, Ll/f8g;->A:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ll/f8g;->v:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->i(Z)V

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p1}, Ll/v9g;->b()Ll/a8g;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-eqz v0, :cond_5

    .line 22
    .line 23
    iget-boolean v1, p0, Ll/f8g;->A:Z

    .line 24
    .line 25
    if-nez v1, :cond_2

    .line 26
    .line 27
    iget-object v1, v0, Ll/a8g;->b:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;

    .line 28
    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    iget-object v2, p0, Ll/f8g;->v:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;

    .line 32
    .line 33
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 34
    .line 35
    invoke-virtual {v2, v3, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->g(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseHierarchy;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    iget-object v1, v0, Ll/a8g;->c:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;

    .line 40
    .line 41
    if-eqz v1, :cond_2

    .line 42
    .line 43
    iget-object v2, p0, Ll/f8g;->v:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;

    .line 44
    .line 45
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 46
    .line 47
    invoke-virtual {v2, v3, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubLevelView;->h(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    :goto_0
    iget-object v1, v0, Ll/a8g;->c:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;

    .line 51
    .line 52
    if-eqz v1, :cond_3

    .line 53
    .line 54
    iget v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseMedal;->grade:I

    .line 55
    .line 56
    invoke-virtual {p1}, Ll/v9g;->a()Ll/cm0;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-static {v1, p1}, Ll/vag;->j(ILl/cm0;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    if-eqz p1, :cond_3

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 67
    .line 68
    check-cast v1, Ll/acg;

    .line 69
    .line 70
    invoke-virtual {v1, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    new-instance v1, Ll/d8g;

    .line 75
    .line 76
    invoke-direct {v1, p0}, Ll/d8g;-><init>(Ll/f8g;)V

    .line 77
    .line 78
    .line 79
    new-instance v2, Ll/e8g;

    .line 80
    .line 81
    invoke-direct {v2}, Ll/e8g;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v1, v2}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {p1, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    :cond_3
    iget-object p1, v0, Ll/a8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 92
    .line 93
    if-eqz p1, :cond_5

    .line 94
    .line 95
    iget-object p1, p0, Ll/f8g;->r:Lv/VText;

    .line 96
    .line 97
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->D3:I

    .line 102
    .line 103
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    iget-object v2, v0, Ll/a8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 108
    .line 109
    iget v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->memberCount:I

    .line 110
    .line 111
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    iget-object p1, v0, Ll/a8g;->a:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;

    .line 127
    .line 128
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetail;->summary:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetailSummary;

    .line 129
    .line 130
    if-eqz p1, :cond_5

    .line 131
    .line 132
    iget-boolean v0, p0, Ll/f8g;->A:Z

    .line 133
    .line 134
    iget-object v1, p0, Ll/f8g;->u:Lv/VText;

    .line 135
    .line 136
    const v2, -0x181e3

    .line 137
    .line 138
    .line 139
    if-eqz v0, :cond_4

    .line 140
    .line 141
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetailSummary;->onlineInfo:Ljava/lang/String;

    .line 142
    .line 143
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Ll/f8g;->u:Lv/VText;

    .line 147
    .line 148
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 149
    .line 150
    .line 151
    return-void

    .line 152
    :cond_4
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseDetailSummary;->rankInfo:Ljava/lang/String;

    .line 153
    .line 154
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 155
    .line 156
    .line 157
    iget-object p0, p0, Ll/f8g;->u:Lv/VText;

    .line 158
    .line 159
    invoke-virtual {p0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 160
    .line 161
    .line 162
    :cond_5
    return-void
.end method

.method public S(Ll/yhg;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f8g;->o:Landroidx/core/widget/NestedScrollView;

    .line 2
    .line 3
    const/16 v1, 0x82

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/core/widget/NestedScrollView;->q(I)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/f8g;->y:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;

    .line 9
    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 11
    .line 12
    check-cast v1, Ll/acg;

    .line 13
    .line 14
    iget-object p0, p0, Ll/f8g;->z:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;

    .line 15
    .line 16
    invoke-virtual {v0, v1, p1, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->e(Ll/acg;Ll/yhg;Lcom/p1/mobile/putong/live/livingroom/common/fansclub/submodule/recall/FansBottomSelectView;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public T(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f8g;->n:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, p1, v1}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveFansClubAnchorProfileView;->j0(Lcom/p1/mobile/putong/data/User;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Ll/f8g;->q:Landroid/widget/TextView;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/f8g;->l:Lv/VImage;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Ll/f8g;->t:Lv/VImage;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object v0, p0, Ll/f8g;->y:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;

    .line 20
    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    .line 25
    .line 26
    :cond_2
    iget-object p0, p0, Ll/f8g;->x:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;

    .line 27
    .line 28
    if-eqz p0, :cond_3

    .line 29
    .line 30
    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 31
    .line 32
    .line 33
    :cond_3
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/acg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f8g;->K(Ll/acg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public m(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->m(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/f8g;->J(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 8
    .line 9
    check-cast p1, Ll/acg;

    .line 10
    .line 11
    invoke-virtual {p1}, Ll/acg;->C4()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/f8g;->l:Lv/VImage;

    .line 15
    .line 16
    sget v0, Ll/obc0;->P1:I

    .line 17
    .line 18
    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 19
    .line 20
    .line 21
    iget-object p1, p0, Ll/f8g;->l:Lv/VImage;

    .line 22
    .line 23
    new-instance v0, Ll/b8g;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/b8g;-><init>(Ll/f8g;)V

    .line 26
    .line 27
    .line 28
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Ll/f8g;->t:Lv/VImage;

    .line 32
    .line 33
    new-instance v0, Ll/c8g;

    .line 34
    .line 35
    invoke-direct {v0, p0}, Ll/c8g;-><init>(Ll/f8g;)V

    .line 36
    .line 37
    .line 38
    invoke-static {p1, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Ll/f8g;->y:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 44
    .line 45
    check-cast v0, Ll/acg;

    .line 46
    .line 47
    invoke-virtual {v0}, Ll/xzs;->L2()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 55
    .line 56
    check-cast p1, Ll/acg;

    .line 57
    .line 58
    invoke-virtual {p1}, Ll/xzs;->L2()Z

    .line 59
    .line 60
    .line 61
    move-result p1

    .line 62
    if-eqz p1, :cond_0

    .line 63
    .line 64
    iget-object p1, p0, Ll/f8g;->y:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;

    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 67
    .line 68
    check-cast v0, Ll/acg;

    .line 69
    .line 70
    invoke-virtual {v0}, Ll/tk2;->b4()Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/module/LiveMenuDialogHolder;->b:Ll/y8s;

    .line 75
    .line 76
    invoke-virtual {p1, v0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubEventView;->d(Ljava/util/List;Ll/y8s;)V

    .line 77
    .line 78
    .line 79
    :cond_0
    return-void
.end method

.method public bridge synthetic n(Ll/y8s;)V
    .locals 0

    .line 1
    check-cast p1, Ll/acg;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/f8g;->K(Ll/acg;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/f8g;->o:Landroidx/core/widget/NestedScrollView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-virtual {p0, v0, v0}, Landroidx/core/widget/NestedScrollView;->scrollTo(II)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method
