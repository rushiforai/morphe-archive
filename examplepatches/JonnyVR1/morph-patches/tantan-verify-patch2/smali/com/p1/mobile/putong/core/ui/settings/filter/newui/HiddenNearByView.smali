.class public Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$g;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

.field public b:Landroid/widget/FrameLayout;

.field public c:Landroid/widget/TextView;

.field public d:Lv/VSlider;

.field public e:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$g;

.field public f:Lcom/p1/mobile/putong/data/Settings;

.field public g:Lcom/p1/mobile/android/app/Act;

.field public h:Landroid/animation/ValueAnimator;

.field public i:Landroid/animation/ValueAnimator;

.field public j:Z

.field public final k:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->j:Z

    .line 6
    .line 7
    new-instance v0, Ll/h2l;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/h2l;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->k:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->k(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 18
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p2, 0x0

    .line 19
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->j:Z

    .line 20
    new-instance p2, Ll/h2l;

    invoke-direct {p2, p0}, Ll/h2l;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->k:Ljava/lang/Runnable;

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->k(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 22
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 23
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->j:Z

    .line 24
    new-instance p2, Ll/h2l;

    invoke-direct {p2, p0}, Ll/h2l;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;)V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->k:Ljava/lang/Runnable;

    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->k(Landroid/content/Context;)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->m(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->o(Ljava/lang/Boolean;)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->n()V

    return-void
.end method


# virtual methods
.method public e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/l2l;->b(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final f(Lv/VListCell;)V
    .locals 0

    .line 1
    sget p0, Ll/gdc0;->u:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/widget/ImageView;

    .line 8
    .line 9
    sget-object p1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    sget p1, Ll/qa00;->q:I

    .line 19
    .line 20
    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 21
    .line 22
    iput p1, p0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 23
    .line 24
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->h:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->h:Landroid/animation/ValueAnimator;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->h:Landroid/animation/ValueAnimator;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->i:Landroid/animation/ValueAnimator;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->i:Landroid/animation/ValueAnimator;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->i:Landroid/animation/ValueAnimator;

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public getHideAimHeight()I
    .locals 0

    .line 1
    const/high16 p0, 0x42920000    # 73.0f

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

.method public getShowAnimHeight()I
    .locals 0

    .line 1
    const/high16 p0, 0x429a0000    # 77.0f

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

.method public h(F)V
    .locals 2

    .line 1
    const/high16 v0, 0x43480000    # 200.0f

    .line 2
    .line 3
    mul-float/2addr p1, v0

    .line 4
    float-to-int p1, p1

    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 12
    .line 13
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->invisibleRadius:Ljava/lang/Integer;

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->k:Ljava/lang/Runnable;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchRadius()Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-ge v0, p1, :cond_1

    .line 35
    .line 36
    rem-int/lit16 v0, p1, 0x3e8

    .line 37
    .line 38
    if-nez v0, :cond_0

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    div-int/lit16 p1, p1, 0x3e8

    .line 42
    .line 43
    mul-int/lit16 p1, p1, 0x3e8

    .line 44
    .line 45
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->e:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$g;

    .line 46
    .line 47
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_1

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->e:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$g;

    .line 54
    .line 55
    div-int/lit16 p1, p1, 0x3e8

    .line 56
    .line 57
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$g;->a(I)V

    .line 58
    .line 59
    .line 60
    :cond_1
    return-void
.end method

.method public i(I)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$f;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$f;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;I)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->b:Landroid/widget/FrameLayout;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->b:Landroid/widget/FrameLayout;

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1}, Landroid/view/View;->setClipToOutline(Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public j()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->g()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    fill-array-data v0, :array_0

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->i:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->getHideAimHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->i:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    const-wide/16 v2, 0x190

    .line 23
    .line 24
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->i:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    new-instance v2, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$d;

    .line 30
    .line 31
    invoke-direct {v2, p0, v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$d;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->b:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    iput v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->b:Landroid/widget/FrameLayout;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->i:Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    new-instance v1, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$e;

    .line 56
    .line 57
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$e;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->i:Landroid/animation/ValueAnimator;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public k(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public l()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Sk()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 16
    .line 17
    const-string v1, "\u4e0d\u8ba9\u8ddd\u79bb\u592a\u8fd1\u7684\u4eba\u770b\u5230\u6211"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lv/VListCell;->setTitle(Ljava/lang/CharSequence;)V

    .line 20
    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->f(Lv/VListCell;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 28
    .line 29
    new-instance v1, Ll/i2l;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/i2l;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->b:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    const/4 v1, 0x0

    .line 40
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public final synthetic m(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Ll/j49;->g()Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/biz/service/CorePayInnerService;->xj()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    invoke-static {}, Ll/joa;->M3()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 22
    .line 23
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->Q1:Lcom/p1/mobile/putong/core/api/t;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/t;->f3()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->s()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 36
    .line 37
    invoke-static {p0}, Ll/bsj0;->T(Landroid/view/ViewGroup;)Z

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic n()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSearchInvisibleRadius()Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->g:Lcom/p1/mobile/android/app/Act;

    .line 12
    .line 13
    sget v2, Lcom/p1/mobile/putong/core/profile/R$string;->b2:I

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->g:Lcom/p1/mobile/android/app/Act;

    .line 20
    .line 21
    sget v3, Lcom/p1/mobile/putong/core/profile/R$string;->e2:I

    .line 22
    .line 23
    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    const-string v0, ""

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const-string v3, "<"

    .line 33
    .line 34
    const/16 v4, 0x3e8

    .line 35
    .line 36
    if-ge v0, v4, :cond_1

    .line 37
    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    goto :goto_0

    .line 54
    :cond_1
    rem-int/lit16 v2, v0, 0x3e8

    .line 55
    .line 56
    if-nez v2, :cond_2

    .line 57
    .line 58
    new-instance v2, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    div-int/2addr v0, v4

    .line 64
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    int-to-double v3, v0

    .line 81
    const-wide v5, 0x408f400000000000L    # 1000.0

    .line 82
    .line 83
    .line 84
    .line 85
    .line 86
    div-double/2addr v3, v5

    .line 87
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const-string v3, "%.1f"

    .line 96
    .line 97
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->c:Landroid/widget/TextView;

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 114
    .line 115
    .line 116
    return-void
.end method

.method public final synthetic o(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->j:Z

    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->l()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public p(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/data/Settings;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->g:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->f:Lcom/p1/mobile/putong/data/Settings;

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->k:Ljava/lang/Runnable;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/Settings;->getSearchInvisibleRadius()Ljava/lang/Integer;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    const/4 p2, 0x1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    move p1, p2

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const/4 p1, 0x0

    .line 24
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->b:Landroid/widget/FrameLayout;

    .line 25
    .line 26
    xor-int/lit8 v1, p1, 0x1

    .line 27
    .line 28
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;->getSwitchButton()Lv/VSwitchButton;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    xor-int/2addr p1, p2

    .line 38
    invoke-virtual {v0, p1}, Lv/VSwitchButton;->setChecked(Z)V

    .line 39
    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 42
    .line 43
    new-instance p2, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$a;

    .line 44
    .line 45
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$a;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;->d(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public q()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->a:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/FilterSwitchCell;

    .line 2
    .line 3
    const-string v0, "\u5f00\u542f\u540e\uff0c\u6307\u5b9a\u8ddd\u79bb\u4ee5\u5185\u7684\u719f\u4eba\u548c\u964c\u751f\u4eba\u90fd\u6ed1\u4e0d\u5230\u4f60"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lv/VListCell;->setSubTitle(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public r()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->g()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    fill-array-data v0, :array_0

    .line 8
    .line 9
    .line 10
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->h:Landroid/animation/ValueAnimator;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->getShowAnimHeight()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->h:Landroid/animation/ValueAnimator;

    .line 21
    .line 22
    const-wide/16 v2, 0x190

    .line 23
    .line 24
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->h:Landroid/animation/ValueAnimator;

    .line 28
    .line 29
    new-instance v2, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$b;

    .line 30
    .line 31
    invoke-direct {v2, p0, v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$b;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;I)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->b:Landroid/widget/FrameLayout;

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 44
    .line 45
    neg-int v0, v0

    .line 46
    iput v0, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->b:Landroid/widget/FrameLayout;

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->b:Landroid/widget/FrameLayout;

    .line 54
    .line 55
    const/4 v1, 0x1

    .line 56
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->h:Landroid/animation/ValueAnimator;

    .line 60
    .line 61
    new-instance v1, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$c;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$c;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->h:Landroid/animation/ValueAnimator;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :array_0
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final s()V
    .locals 7

    return-void

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->g:Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    sget-object v4, Lcom/p1/mobile/putong/core/data/Privilege;->hide_me_from_nearby:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 12
    .line 13
    new-instance v5, Ll/j2l;

    .line 14
    .line 15
    invoke-direct {v5}, Ll/j2l;-><init>()V

    .line 16
    .line 17
    .line 18
    new-instance v6, Ll/k2l;

    .line 19
    .line 20
    invoke-direct {v6, p0}, Ll/k2l;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;)V

    .line 21
    .line 22
    .line 23
    const-string v3, "p_home_filter,hidden_nearby"

    .line 24
    .line 25
    invoke-interface/range {v1 .. v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->Lf(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ll/y20;Ll/y20;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public setHiddenNearByViewListener(Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->e:Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView$g;

    .line 2
    .line 3
    return-void
.end method

.method public setSearchValue(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/newui/HiddenNearByView;->d:Lv/VSlider;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/VSlider;->setValue(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
