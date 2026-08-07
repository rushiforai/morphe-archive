.class public Ll/s0g0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/o0g0;",
        ">;"
    }
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/app/PutongAct;

.field public final b:Lcom/google/android/material/tabs/TabLayout;

.field public final c:Landroid/view/View;

.field public final d:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

.field public final e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public f:Ll/o0g0;

.field public final g:Lv/VPager;

.field public h:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;


# direct methods
.method public constructor <init>(Lcom/google/android/material/tabs/TabLayout;Landroid/view/View;Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;Lcom/p1/mobile/putong/live/external/view/widgets/NoSaveStateViewPager;Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;Lcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    check-cast p6, Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    iput-object p6, p0, Ll/s0g0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 7
    .line 8
    iput-object p1, p0, Ll/s0g0;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 9
    .line 10
    iput-object p2, p0, Ll/s0g0;->c:Landroid/view/View;

    .line 11
    .line 12
    iput-object p3, p0, Ll/s0g0;->d:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    .line 13
    .line 14
    iput-object p4, p0, Ll/s0g0;->g:Lv/VPager;

    .line 15
    .line 16
    iput-object p5, p0, Ll/s0g0;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic a(Ll/s0g0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s0g0;->i(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Ll/s0g0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s0g0;->f(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Ll/s0g0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/s0g0;->j(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/s0g0;)Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s0g0;->d:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    return-object p0
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/s0g0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/s0g0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/o0g0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/s0g0;->f:Ll/o0g0;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic f(Ljava/lang/String;)V
    .locals 7

    .line 1
    invoke-static {p1}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 v1, 0x2

    .line 10
    invoke-static {p1, v1}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v1, Landroid/graphics/drawable/LayerDrawable;

    .line 15
    .line 16
    const/4 v2, 0x1

    .line 17
    new-array v2, v2, [Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    aput-object p1, v2, v3

    .line 21
    .line 22
    invoke-direct {v1, v2}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 23
    .line 24
    .line 25
    const/high16 p1, 0x41d80000    # 27.0f

    .line 26
    .line 27
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    sget v4, Ll/qa00;->h:I

    .line 32
    .line 33
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    const/4 v2, 0x0

    .line 38
    move v6, v4

    .line 39
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Ll/s0g0;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicatorColor(I)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ll/s0g0;->b:Lcom/google/android/material/tabs/TabLayout;

    .line 48
    .line 49
    invoke-virtual {p0, v1}, Lcom/google/android/material/tabs/TabLayout;->setSelectedTabIndicator(Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public final synthetic i(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p1}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    invoke-static {p1, v0}, Ll/fc2;->i(II)Landroid/graphics/drawable/GradientDrawable;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iget-object p0, p0, Ll/s0g0;->d:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;->c:Lv/VDraweeView;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/o0g0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/s0g0;->e(Ll/o0g0;)V

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

.method public final synthetic j(Ljava/lang/String;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/s0g0;->d:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    .line 2
    .line 3
    iget-object v2, v0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;->c:Lv/VDraweeView;

    .line 4
    .line 5
    invoke-static {}, Ll/bnl0;->y0()I

    .line 6
    .line 7
    .line 8
    move-result v4

    .line 9
    sget v5, Ll/qa00;->E:I

    .line 10
    .line 11
    new-instance v9, Ll/s0g0$a;

    .line 12
    .line 13
    invoke-direct {v9, p0}, Ll/s0g0$a;-><init>(Ll/s0g0;)V

    .line 14
    .line 15
    .line 16
    const-string v1, "context_square"

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    const/4 v7, 0x0

    .line 20
    const/4 v8, 0x0

    .line 21
    move-object v3, p1

    .line 22
    invoke-static/range {v1 .. v9}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/s0g0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Z)V
    .locals 4

    .line 1
    invoke-static {}, Ll/mqr;->m()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    if-eqz p1, :cond_1

    .line 9
    .line 10
    iget-object p1, p0, Ll/s0g0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/app/PutongAct;->setTransparentStatusBar()V

    .line 13
    .line 14
    .line 15
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    .line 16
    .line 17
    sget v0, Ll/bnl0;->e:I

    .line 18
    .line 19
    const/high16 v1, 0x42b80000    # 92.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {}, Ll/bnl0;->F0()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    add-int/2addr v1, v2

    .line 30
    invoke-direct {p1, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/s0g0;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 36
    .line 37
    .line 38
    iget-object p1, p0, Ll/s0g0;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Ll/s0g0;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 45
    .line 46
    const/4 v1, -0x1

    .line 47
    const/4 v2, 0x0

    .line 48
    const-string v3, "https://auto.tancdn.com/v1/raw/bd5067f0-fa5a-4faf-bd72-06636f0c4d5610.pdf"

    .line 49
    .line 50
    invoke-virtual {p1, v3, v1, v2, v0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->g(Ljava/lang/String;ILl/wo0;Z)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/s0g0;->g:Lv/VPager;

    .line 54
    .line 55
    iget-object v0, p0, Ll/s0g0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 56
    .line 57
    sget v1, Ll/m9c0;->c:I

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 64
    .line 65
    .line 66
    iget-object p1, p0, Ll/s0g0;->d:Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;

    .line 67
    .line 68
    iget-object p0, p0, Ll/s0g0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 69
    .line 70
    sget v0, Ll/m9c0;->c:I

    .line 71
    .line 72
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->color(I)I

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/skin/ToolBarSkinView;->setBackgroundColor(I)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    :cond_1
    iget-object p1, p0, Ll/s0g0;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 81
    .line 82
    const/4 v0, 0x0

    .line 83
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Ll/s0g0;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/tantan/library/svga/SVGAnimationView;->pauseAnimation()V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Ll/s0g0;->h:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 92
    .line 93
    if-eqz p1, :cond_2

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Ll/s0g0;->n(Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V

    .line 96
    .line 97
    .line 98
    :cond_2
    :goto_0
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/live/base/data/BLiveColor;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p0, Ll/s0g0;->a:Lcom/p1/mobile/putong/app/PutongAct;

    .line 5
    .line 6
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveColor;->startColor:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setStatusBarColor(I)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveColor;->startColor:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveColor;->endColor:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v1}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x0

    .line 28
    sget-object v3, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 29
    .line 30
    invoke-static {v0, v1, v2, v3}, Ll/fc2;->k(IIILandroid/graphics/drawable/GradientDrawable$Orientation;)Landroid/graphics/drawable/GradientDrawable;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveColor;->alpha:D

    .line 35
    .line 36
    const-wide v3, 0x406fe00000000000L    # 255.0

    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    mul-double/2addr v1, v3

    .line 42
    double-to-int p1, v1

    .line 43
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/s0g0;->c:Landroid/view/View;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public n(Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/s0g0;->h:Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;

    .line 2
    .line 3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->topTabBarConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Ll/s0g0;->p(Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSkinConfig;->backgroundConfig:Lcom/p1/mobile/putong/live/base/data/BLiveColor;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/s0g0;->m(Lcom/p1/mobile/putong/live/base/data/BLiveColor;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final p(Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->personalCenterIcon:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Ll/s0g0;->f:Ll/o0g0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeMenuEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->skinConfig()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->personalCenterIcon:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->startLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTapBarStartLiveConfig;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, Ll/s0g0;->f:Ll/o0g0;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeStartLiveEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeStartLiveEvent;->startLiveSkinEvent()Ll/v3f$d;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->startLiveConfig:Lcom/p1/mobile/putong/live/base/data/BLiveTapBarStartLiveConfig;

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->multiCallPartyIcon:Ljava/lang/String;

    .line 51
    .line 52
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-nez v0, :cond_3

    .line 57
    .line 58
    iget-object v0, p0, Ll/s0g0;->f:Ll/o0g0;

    .line 59
    .line 60
    invoke-virtual {v0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeMenuEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->multiCallPartyIcon()Ll/v3f$d;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->multiCallPartyIcon:Ljava/lang/String;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->searchIcon:Ljava/lang/String;

    .line 76
    .line 77
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_4

    .line 82
    .line 83
    iget-object v0, p0, Ll/s0g0;->f:Ll/o0g0;

    .line 84
    .line 85
    invoke-virtual {v0}, Ll/mus;->F2()Lcom/tantan/live/home/eventbus/LiveHomeEventBus;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iget-object v0, v0, Lcom/tantan/live/home/eventbus/LiveHomeEventBus;->LiveHomeMenuEvent:Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/tantan/live/home/eventbus/LiveHomeEventBus$LiveHomeMenuEvent;->searchIcon()Ll/v3f$d;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->searchIcon:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 98
    .line 99
    .line 100
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->background:Lcom/p1/mobile/putong/live/base/data/BLiveTopBarBackground;

    .line 101
    .line 102
    invoke-virtual {p0, v0}, Ll/s0g0;->s(Lcom/p1/mobile/putong/live/base/data/BLiveTopBarBackground;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, p1}, Ll/s0g0;->q(Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarConfig;->slideBarColor:Ljava/lang/String;

    .line 5
    .line 6
    new-instance v0, Ll/p0g0;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/p0g0;-><init>(Ll/s0g0;)V

    .line 9
    .line 10
    .line 11
    invoke-static {p1, v0}, Ll/xau;->n(Ljava/lang/String;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final s(Lcom/p1/mobile/putong/live/base/data/BLiveTopBarBackground;)V
    .locals 2

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarBackground;->color:Ljava/lang/String;

    .line 5
    .line 6
    new-instance v1, Ll/q0g0;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Ll/q0g0;-><init>(Ll/s0g0;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/xau;->n(Ljava/lang/String;Ll/y20;)V

    .line 12
    .line 13
    .line 14
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveTopBarBackground;->pictureUrl:Lcom/p1/mobile/putong/live/base/data/BLivePictureUrl;

    .line 15
    .line 16
    if-eqz p1, :cond_1

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLivePictureUrl;->getOptionUrl()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance v0, Ll/r0g0;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/r0g0;-><init>(Ll/s0g0;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p1, v0}, Ll/xau;->n(Ljava/lang/String;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    :goto_0
    return-void
.end method
