.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

.field public b:Ll/zq90;

.field public c:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->g()V

    return-void
.end method

.method public static synthetic b()V
    .locals 2

    .line 1
    const-string v0, "button"

    .line 2
    .line 3
    invoke-static {v0}, Ll/pza0;->h(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->o()Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "top back"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/helper/ExpandedCardStyleHelper;->w(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->f()V

    return-void
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/wnf;->a(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final e()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bnl0;->E(Landroid/view/View;)Landroid/app/Activity;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public final synthetic f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->c:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->O()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic g()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->c:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;->N()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/data/User;)V
    .locals 8

    .line 1
    new-instance v0, Ll/qu90;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qu90;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Ll/qu90;->a:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "home_card"

    .line 11
    .line 12
    iput-object v1, v0, Ll/qu90;->e:Ljava/lang/String;

    .line 13
    .line 14
    new-instance v1, Ll/ym4;

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-direct {v1, v2, v0}, Ll/ym4;-><init>(Landroid/content/Context;Ll/qu90;)V

    .line 21
    .line 22
    .line 23
    iput-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->b:Ll/zq90;

    .line 24
    .line 25
    new-instance v0, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 26
    .line 27
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;-><init>(Ll/zq90;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->c:Lcom/p1/mobile/putong/core/ui/profile/profilelist/imp/ProfileShareHelper;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 33
    .line 34
    const/4 v6, 0x0

    .line 35
    const/4 v7, 0x1

    .line 36
    const-string v4, ""

    .line 37
    .line 38
    const/4 v5, 0x0

    .line 39
    move-object v3, p1

    .line 40
    invoke-virtual/range {v2 .. v7}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->l(Lcom/p1/mobile/putong/data/User;Ljava/lang/String;ZZZ)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public onFinishInflate()V
    .locals 3

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-static {}, Ll/gra;->z()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->l:Lv/VImage;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->e()Lcom/p1/mobile/android/app/Act;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    sget v2, Ll/dbc0;->V6:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Lv/VImage;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->d:Landroid/widget/ImageView;

    .line 33
    .line 34
    sget v1, Ll/dbc0;->D:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 40
    .line 41
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->a:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 42
    .line 43
    const/high16 v1, 0x42300000    # 44.0f

    .line 44
    .line 45
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    invoke-virtual {v0, v2}, Landroidx/constraintlayout/widget/ConstraintLayout;->setMinHeight(I)V

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 55
    .line 56
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/widget/ConstraintLayout;->setMinHeight(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->c:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 66
    .line 67
    const/4 v1, 0x0

    .line 68
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 72
    .line 73
    new-instance v2, Ll/tnf;

    .line 74
    .line 75
    invoke-direct {v2}, Ll/tnf;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->setBackCallBack(Ll/x20;)V

    .line 79
    .line 80
    .line 81
    invoke-static {}, Ll/lik0;->a()Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 86
    .line 87
    if-nez v0, :cond_1

    .line 88
    .line 89
    new-instance v0, Ll/unf;

    .line 90
    .line 91
    invoke-direct {v0, p0}, Ll/unf;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->setMoreCallBack(Ll/x20;)V

    .line 95
    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_1
    new-instance v0, Ll/vnf;

    .line 99
    .line 100
    invoke-direct {v0, p0}, Ll/vnf;-><init>(Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->setMoreCallBack(Ll/x20;)V

    .line 104
    .line 105
    .line 106
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedFakeProfileTitle;->a:Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;

    .line 107
    .line 108
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/ProfileCustomBar;->n:Landroid/view/View;

    .line 109
    .line 110
    invoke-static {p0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 111
    .line 112
    .line 113
    return-void
.end method
