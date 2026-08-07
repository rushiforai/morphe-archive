.class public Ll/tgo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/pio;

.field public final b:Lcom/p1/mobile/android/app/Act;

.field public final c:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

.field public final d:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

.field public final e:Lv/VText_NoTopPadding;

.field public final f:Landroid/widget/FrameLayout;

.field public final g:Lcom/sunshine/engine/particle/SceneView;

.field public final h:Landroid/view/ViewGroup;

.field public final i:Landroid/view/ViewGroup;

.field public final j:Landroid/view/View;

.field public k:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ll/pio;Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;Lv/VText_NoTopPadding;Landroid/widget/FrameLayout;Lcom/sunshine/engine/particle/SceneView;Landroid/view/ViewGroup;Landroid/view/ViewGroup;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/tgo;->a:Ll/pio;

    .line 5
    .line 6
    iput-object p2, p0, Ll/tgo;->b:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iput-object p3, p0, Ll/tgo;->c:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 9
    .line 10
    iput-object p4, p0, Ll/tgo;->d:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 11
    .line 12
    iput-object p5, p0, Ll/tgo;->e:Lv/VText_NoTopPadding;

    .line 13
    .line 14
    iput-object p6, p0, Ll/tgo;->f:Landroid/widget/FrameLayout;

    .line 15
    .line 16
    iput-object p7, p0, Ll/tgo;->g:Lcom/sunshine/engine/particle/SceneView;

    .line 17
    .line 18
    iput-object p8, p0, Ll/tgo;->h:Landroid/view/ViewGroup;

    .line 19
    .line 20
    iput-object p9, p0, Ll/tgo;->i:Landroid/view/ViewGroup;

    .line 21
    .line 22
    iput-object p10, p0, Ll/tgo;->j:Landroid/view/View;

    .line 23
    .line 24
    return-void
.end method

.method public static synthetic a(Ll/tgo;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/tgo;->o()V

    return-void
.end method

.method public static synthetic b(Ll/tgo;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p6}, Ll/tgo;->l(Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/yho;->h()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/tgo;Landroid/view/View;Lv/VText_NoTopPadding;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/tgo;->m(Landroid/view/View;Lv/VText_NoTopPadding;[I)V

    return-void
.end method

.method public static synthetic e(Ll/tgo;Lv/VText_NoTopPadding;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/tgo;->n(Lv/VText_NoTopPadding;)V

    return-void
.end method


# virtual methods
.method public final f(Landroid/view/View;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;IIIZ)Landroid/view/View;
    .locals 8

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/ui/bubble/d;->l()Lcom/p1/mobile/android/ui/bubble/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "boost_see_page_guide"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/ui/bubble/d;->k(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Ll/tgo;->e:Lv/VText_NoTopPadding;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/tgo;->e:Lv/VText_NoTopPadding;

    .line 19
    .line 20
    const/16 v1, 0x8

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0}, Ll/tgo;->q()V

    .line 26
    .line 27
    .line 28
    move-object v2, p0

    .line 29
    move-object v3, p2

    .line 30
    move-object v4, p3

    .line 31
    move v5, p4

    .line 32
    move v6, p5

    .line 33
    move v7, p7

    .line 34
    invoke-virtual/range {v2 .. v7}, Ll/tgo;->i(Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;IIZ)Lv/VText_NoTopPadding;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 39
    .line 40
    const/4 p3, -0x2

    .line 41
    invoke-direct {p2, p3, p3}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 42
    .line 43
    .line 44
    iget-object p3, v2, Ll/tgo;->h:Landroid/view/ViewGroup;

    .line 45
    .line 46
    invoke-virtual {p3, p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2, p1, p0}, Ll/tgo;->p(Landroid/view/View;Lv/VText_NoTopPadding;)V

    .line 50
    .line 51
    .line 52
    const/4 p1, -0x1

    .line 53
    if-eq p6, p1, :cond_1

    .line 54
    .line 55
    invoke-virtual {v2, p0, p6}, Ll/tgo;->r(Lv/VText_NoTopPadding;I)V

    .line 56
    .line 57
    .line 58
    :cond_1
    return-object p0
.end method

.method public g(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tgo;->e:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Ll/tgo;->b:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    iget-object p0, p0, Ll/tgo;->c:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 12
    .line 13
    invoke-interface {v0, v1, p0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->Qe(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final i(Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;IIZ)Lv/VText_NoTopPadding;
    .locals 1

    .line 1
    new-instance v0, Lv/VText_NoTopPadding;

    .line 2
    .line 3
    iget-object p0, p0, Ll/tgo;->b:Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Lv/VText_NoTopPadding;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "likeBoostBubble"

    .line 9
    .line 10
    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 14
    .line 15
    .line 16
    int-to-float p0, p4

    .line 17
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setTextSize(F)V

    .line 18
    .line 19
    .line 20
    const/16 p0, 0x11

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setGravity(I)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 29
    .line 30
    .line 31
    if-nez p5, :cond_0

    .line 32
    .line 33
    const/high16 p0, 0x41900000    # 18.0f

    .line 34
    .line 35
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    const/high16 p2, 0x41880000    # 17.0f

    .line 40
    .line 41
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    const/high16 p3, 0x41a80000    # 21.0f

    .line 50
    .line 51
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    invoke-virtual {v0, p1, p2, p0, p3}, Landroid/view/View;->setPadding(IIII)V

    .line 56
    .line 57
    .line 58
    :cond_0
    return-object v0
.end method

.method public j()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tgo;->g:Lcom/sunshine/engine/particle/SceneView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public k()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/tgo;->c:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 2
    .line 3
    iget-object v1, p0, Ll/tgo;->h:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    new-instance v2, Ll/pgo;

    .line 9
    .line 10
    invoke-direct {v2, v1}, Ll/pgo;-><init>(Landroid/view/ViewGroup;)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ll/qgo;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/qgo;-><init>(Ll/tgo;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->b(Ll/y20;Ll/vcj;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Ll/tgo;->c:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 22
    .line 23
    iget-object v1, p0, Ll/tgo;->g:Lcom/sunshine/engine/particle/SceneView;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;->setSceneView(Lcom/sunshine/engine/particle/SceneView;)V

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ll/tgo;->c:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    invoke-static {p0, v0}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final synthetic l(Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Boolean;)Landroid/view/View;
    .locals 8

    .line 1
    iget-object v1, p0, Ll/tgo;->c:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 2
    .line 3
    invoke-virtual {p3}, Ljava/lang/Integer;->intValue()I

    .line 4
    .line 5
    .line 6
    move-result v4

    .line 7
    invoke-virtual {p4}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v5

    .line 11
    invoke-virtual {p5}, Ljava/lang/Integer;->intValue()I

    .line 12
    .line 13
    .line 14
    move-result v6

    .line 15
    invoke-virtual {p6}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v7

    .line 19
    move-object v0, p0

    .line 20
    move-object v2, p1

    .line 21
    move-object v3, p2

    .line 22
    invoke-virtual/range {v0 .. v7}, Ll/tgo;->f(Landroid/view/View;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;IIIZ)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final synthetic m(Landroid/view/View;Lv/VText_NoTopPadding;[I)V
    .locals 2

    .line 1
    iget-object p3, p0, Ll/tgo;->i:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-static {p1, p3}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/tgo;->i:Landroid/view/ViewGroup;

    .line 8
    .line 9
    invoke-static {p2, p0}, Ll/bnl0;->j0(Landroid/view/View;Landroid/view/View;)Ll/bnl0$g;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget p3, p1, Ll/bnl0$g;->a:I

    .line 14
    .line 15
    iget v0, p0, Ll/bnl0$g;->a:I

    .line 16
    .line 17
    sub-int/2addr p3, v0

    .line 18
    int-to-float p3, p3

    .line 19
    iget v0, p1, Ll/bnl0$g;->c:I

    .line 20
    .line 21
    iget v1, p0, Ll/bnl0$g;->c:I

    .line 22
    .line 23
    sub-int/2addr v0, v1

    .line 24
    int-to-float v0, v0

    .line 25
    const/high16 v1, 0x40000000    # 2.0f

    .line 26
    .line 27
    div-float/2addr v0, v1

    .line 28
    add-float/2addr p3, v0

    .line 29
    iget p1, p1, Ll/bnl0$g;->b:I

    .line 30
    .line 31
    iget v0, p0, Ll/bnl0$g;->b:I

    .line 32
    .line 33
    sub-int/2addr p1, v0

    .line 34
    iget p0, p0, Ll/bnl0$g;->d:I

    .line 35
    .line 36
    sub-int/2addr p1, p0

    .line 37
    int-to-float p0, p1

    .line 38
    invoke-virtual {p2, p3}, Landroid/view/View;->setTranslationX(F)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p2, p0}, Landroid/view/View;->setTranslationY(F)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic n(Lv/VText_NoTopPadding;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tgo;->i:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Landroid/view/ViewGroup;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public final synthetic o()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/tgo;->e:Lv/VText_NoTopPadding;

    .line 2
    .line 3
    const/16 v0, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final p(Landroid/view/View;Lv/VText_NoTopPadding;)V
    .locals 1

    .line 1
    new-instance v0, Ll/sgo;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/sgo;-><init>(Ll/tgo;Landroid/view/View;Lv/VText_NoTopPadding;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p2, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final q()V
    .locals 1

    .line 1
    const-string v0, "likeBoostBubble"

    .line 2
    .line 3
    iget-object p0, p0, Ll/tgo;->i:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewWithTag(Ljava/lang/Object;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Landroid/view/ViewGroup;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public final r(Lv/VText_NoTopPadding;I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tgo;->b:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    new-instance v1, Ll/rgo;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/rgo;-><init>(Ll/tgo;Lv/VText_NoTopPadding;)V

    .line 6
    .line 7
    .line 8
    int-to-long p0, p2

    .line 9
    invoke-static {v0, v1, p0, p1}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public s(I)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Ll/yho;->h()V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/tgo;->k:Ljava/lang/Runnable;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-static {v0}, Ll/l51;->J(Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Ll/tgo;->e:Lv/VText_NoTopPadding;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/tgo;->e:Lv/VText_NoTopPadding;

    .line 33
    .line 34
    new-instance v1, Ll/ngo;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/ngo;-><init>()V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 40
    .line 41
    .line 42
    new-instance v0, Ll/ogo;

    .line 43
    .line 44
    invoke-direct {v0, p0}, Ll/ogo;-><init>(Ll/tgo;)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/tgo;->k:Ljava/lang/Runnable;

    .line 48
    .line 49
    iget-object p0, p0, Ll/tgo;->b:Lcom/p1/mobile/android/app/Act;

    .line 50
    .line 51
    int-to-long v1, p1

    .line 52
    invoke-static {p0, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 53
    .line 54
    .line 55
    invoke-static {}, Lcom/p1/mobile/putong/core/member/module/CoreMemberModule;->F()Ll/ss9;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/ss9;->b()Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/member/module/CoreMemberBusinessService;->O6()V

    .line 64
    .line 65
    .line 66
    return-void
.end method

.method public t(ZLjava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tgo;->j:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v1, p0, Ll/tgo;->d:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    invoke-static {v0}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-static {p2}, Ll/yho;->j(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p2, p0, Ll/tgo;->d:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 22
    .line 23
    invoke-static {p2, p1}, Ll/bnl0;->y(Landroid/view/View;Z)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/tgo;->j:Landroid/view/View;

    .line 27
    .line 28
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    :cond_2
    :goto_0
    return-void
.end method

.method public u(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tgo;->c:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public v(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/tgo;->d:Lcom/p1/mobile/putong/core/newui/view/BoostViewContainer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/tgo;->j:Landroid/view/View;

    .line 6
    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/vnb;->M(Landroid/view/View;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
