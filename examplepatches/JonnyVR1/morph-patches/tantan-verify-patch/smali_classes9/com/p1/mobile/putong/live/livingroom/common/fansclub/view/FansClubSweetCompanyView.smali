.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;

.field public e:Lv/VImage;

.field public f:Landroid/view/View;

.field public g:Lv/VDraweeView;

.field public h:Landroid/view/View;

.field public i:Lv/VDraweeView;

.field public j:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public k:Lv/VImage;

.field public l:Landroid/widget/TextView;

.field public m:Landroid/widget/TextView;

.field public n:Landroid/widget/TextView;

.field public o:Lv/VImage;

.field public p:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic h0(Ll/ldg;Ll/aeg;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p2, p1}, Ll/tk2;->e4(ZLl/aeg;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic i0(Ll/ldg;Ll/aeg;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p2, p1}, Ll/tk2;->e4(ZLl/aeg;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public static synthetic j0(Ll/ldg;Ll/aeg;Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p2, 0x0

    .line 2
    invoke-virtual {p0, p2, p1}, Ll/tk2;->e4(ZLl/aeg;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final k0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/pdg;->a(Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public l0()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public m0(Ll/aeg;Ll/ldg;)V
    .locals 5

    .line 1
    iget-object v0, p1, Ll/aeg;->f:Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->l:Landroid/widget/TextView;

    .line 11
    .line 12
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->title:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 15
    .line 16
    .line 17
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->m:Landroid/widget/TextView;

    .line 18
    .line 19
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->desc:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 22
    .line 23
    .line 24
    const-string v2, "done"

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAccommpanyTaskSummary;->status:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v2, 0x1

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->p:Landroid/widget/TextView;

    .line 36
    .line 37
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->o:Lv/VImage;

    .line 41
    .line 42
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->n:Landroid/widget/TextView;

    .line 46
    .line 47
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->o:Lv/VImage;

    .line 52
    .line 53
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->p:Landroid/widget/TextView;

    .line 57
    .line 58
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->n:Landroid/widget/TextView;

    .line 62
    .line 63
    invoke-static {v0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->n:Landroid/widget/TextView;

    .line 67
    .line 68
    const/high16 v3, 0x41400000    # 12.0f

    .line 69
    .line 70
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    int-to-float v3, v3

    .line 75
    const/4 v4, -0x1

    .line 76
    invoke-static {v4, v3, v1}, Ll/fc2;->a(IFZ)Landroid/graphics/drawable/Drawable;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 81
    .line 82
    .line 83
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->n:Landroid/widget/TextView;

    .line 84
    .line 85
    new-instance v1, Ll/mdg;

    .line 86
    .line 87
    invoke-direct {v1, p2, p1}, Ll/mdg;-><init>(Ll/ldg;Ll/aeg;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->p:Landroid/widget/TextView;

    .line 94
    .line 95
    new-instance v1, Ll/ndg;

    .line 96
    .line 97
    invoke-direct {v1, p2, p1}, Ll/ndg;-><init>(Ll/ldg;Ll/aeg;)V

    .line 98
    .line 99
    .line 100
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 101
    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->o:Lv/VImage;

    .line 104
    .line 105
    new-instance v1, Ll/odg;

    .line 106
    .line 107
    invoke-direct {v1, p2, p1}, Ll/odg;-><init>(Ll/ldg;Ll/aeg;)V

    .line 108
    .line 109
    .line 110
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 111
    .line 112
    .line 113
    invoke-static {p0, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->k0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;->d:Lcom/p1/mobile/putong/live/livingroom/common/fansclub/view/FansClubSweetCompanyView;

    .line 8
    .line 9
    const/16 v0, -0x596f

    .line 10
    .line 11
    const/16 v1, -0x692f

    .line 12
    .line 13
    filled-new-array {v0, v1}, [I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 18
    .line 19
    const/high16 v2, 0x41800000    # 16.0f

    .line 20
    .line 21
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    int-to-float v2, v2

    .line 26
    const/4 v3, 0x0

    .line 27
    invoke-static {v0, v1, v2, v3}, Ll/fc2;->e([ILandroid/graphics/drawable/GradientDrawable$Orientation;FZ)Landroid/graphics/drawable/Drawable;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method
