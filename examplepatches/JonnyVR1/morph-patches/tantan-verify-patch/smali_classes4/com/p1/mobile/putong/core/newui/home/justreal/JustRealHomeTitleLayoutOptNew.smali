.class public Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;
.super Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;
.source "SourceFile"


# instance fields
.field public k:Landroid/view/View;

.field public l:Lcom/tantan/library/svga/SVGAnimationView;

.field public m:Lv/VImage;

.field public n:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

.field public o:Ll/pf60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public p:Landroid/animation/ValueAnimator;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;-><init>(Landroid/content/Context;)V

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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic g(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;ZLl/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->l(ZLl/pf60;)V

    return-void
.end method

.method public static synthetic h(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->k(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final i(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/vuq;->a(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j(Z)V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->p:Landroid/animation/ValueAnimator;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->isRunning()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->p:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 21
    .line 22
    .line 23
    :cond_1
    const/4 v0, 0x2

    .line 24
    if-eqz p1, :cond_2

    .line 25
    .line 26
    new-array v0, v0, [F

    .line 27
    .line 28
    fill-array-data v0, :array_0

    .line 29
    .line 30
    .line 31
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->p:Landroid/animation/ValueAnimator;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    new-array v0, v0, [F

    .line 39
    .line 40
    fill-array-data v0, :array_1

    .line 41
    .line 42
    .line 43
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->p:Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->p:Landroid/animation/ValueAnimator;

    .line 50
    .line 51
    const-wide/16 v1, 0x190

    .line 52
    .line 53
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->p:Landroid/animation/ValueAnimator;

    .line 57
    .line 58
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$a;

    .line 59
    .line 60
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->p:Landroid/animation/ValueAnimator;

    .line 67
    .line 68
    new-instance v1, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$b;

    .line 69
    .line 70
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$b;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;Z)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0, v1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->p:Landroid/animation/ValueAnimator;

    .line 77
    .line 78
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 79
    .line 80
    .line 81
    return-void

    .line 82
    nop

    .line 83
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    :array_1
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method

.method public final synthetic k(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/bnl0;->D(Landroid/content/Context;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 10
    .line 11
    const/4 p1, 0x1

    .line 12
    invoke-static {p0, p1}, Ll/quq;->P(Lcom/p1/mobile/android/app/Act;Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic l(ZLl/pf60;)V
    .locals 3

    .line 1
    iget-object v0, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, v0

    .line 4
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 5
    .line 6
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->o:Ll/pf60;

    .line 9
    .line 10
    iget-object v2, v2, Ll/pf60;->a:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 13
    .line 14
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 15
    .line 16
    if-eq v1, v2, :cond_6

    .line 17
    .line 18
    move-object v1, v0

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 20
    .line 21
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 22
    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    const-string v1, "https://auto.tancdn.com/v1/raw/c2e4b787-b734-4437-b903-e6e4c3a9cfca14.svga"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const-string v1, "https://auto.tancdn.com/v1/raw/971473e6-caf8-4972-8380-2f58273555e414.svga"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    if-eqz p1, :cond_2

    .line 34
    .line 35
    const-string v1, "https://auto.tancdn.com/v1/raw/76e2e6fd-d661-4ab5-9bd2-cb498e90e47314.svga"

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    const-string v1, "https://auto.tancdn.com/v1/raw/a0d1dac8-559c-4258-a092-6129b31427eb14.svga"

    .line 39
    .line 40
    :goto_0
    check-cast v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 41
    .line 42
    iget-boolean v0, v0, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    if-eqz p1, :cond_3

    .line 47
    .line 48
    sget p1, Ll/dbc0;->hd:I

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_3
    sget p1, Ll/dbc0;->gd:I

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_4
    if-eqz p1, :cond_5

    .line 55
    .line 56
    sget p1, Ll/dbc0;->fd:I

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_5
    sget p1, Ll/dbc0;->ed:I

    .line 60
    .line 61
    :goto_1
    const/4 v0, 0x1

    .line 62
    invoke-virtual {p0, v1, p1, v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->n(Ljava/lang/String;IZ)V

    .line 63
    .line 64
    .line 65
    iget-object p1, p2, Ll/pf60;->a:Ljava/lang/Object;

    .line 66
    .line 67
    check-cast p1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 68
    .line 69
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 70
    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->j(Z)V

    .line 72
    .line 73
    .line 74
    :cond_6
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->p(Ll/pf60;)V

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final m()V
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->z()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/high16 v0, 0x42080000    # 34.0f

    .line 8
    .line 9
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {p0, v0}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->k:Landroid/view/View;

    .line 17
    .line 18
    const/4 v1, 0x0

    .line 19
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 24
    .line 25
    .line 26
    sget v0, Ll/dbc0;->f7:I

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->f(I)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->n:Lcom/p1/mobile/putong/core/ui/VText_Default_Bold;

    .line 32
    .line 33
    const/high16 v1, -0x1000000

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 36
    .line 37
    .line 38
    const/high16 v0, 0x41200000    # 10.0f

    .line 39
    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    const/4 v1, 0x1

    .line 45
    const v2, -0x7e1d01

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, v1, v2, v0}, Lcom/p1/mobile/android/ui/label/CommonTextureFrameLayout;->e(ZII)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method

.method public final n(Ljava/lang/String;IZ)V
    .locals 1

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->m:Lv/VImage;

    .line 4
    .line 5
    invoke-virtual {p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->m:Lv/VImage;

    .line 9
    .line 10
    const/high16 p2, 0x3f800000    # 1.0f

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->l:Lcom/tantan/library/svga/SVGAnimationView;

    .line 16
    .line 17
    const/4 p1, 0x0

    .line 18
    invoke-virtual {p0, p1}, Landroid/view/View;->setAlpha(F)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->l:Lcom/tantan/library/svga/SVGAnimationView;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-virtual {p3, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-static {p3}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-virtual {p3, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    new-instance p3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$d;

    .line 41
    .line 42
    invoke-direct {p3, p0, p2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$d;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    new-instance p3, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$c;

    .line 50
    .line 51
    invoke-direct {p3, p0, p2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew$c;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const/4 p2, 0x1

    .line 59
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    sget-object p3, Lcom/tantan/library/svga/SVGAnimationView$FrameMode;->BEFORE:Lcom/tantan/library/svga/SVGAnimationView$FrameMode;

    .line 64
    .line 65
    invoke-virtual {p1, p3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->frameMode(Lcom/tantan/library/svga/SVGAnimationView$FrameMode;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->l:Lcom/tantan/library/svga/SVGAnimationView;

    .line 74
    .line 75
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public o(Lcom/p1/mobile/android/app/Act;)V
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->k3()Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Ll/gra;->z()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 14
    .line 15
    move-object v3, v2

    .line 16
    check-cast v3, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 17
    .line 18
    iget-boolean v3, v3, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 19
    .line 20
    if-eqz v3, :cond_1

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    const-string v3, "https://auto.tancdn.com/v1/raw/ea168f2f-c024-41dc-81e8-a30eb58b06f314.svga"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const-string v3, "https://auto.tancdn.com/v1/raw/e1682a2a-bb89-4167-8d38-b0a02f577b9114.svga"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    if-eqz v1, :cond_2

    .line 31
    .line 32
    const-string v3, "https://auto.tancdn.com/v1/raw/82debc02-4e7b-4741-8a15-1d024241dfca14.svga"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    const-string v3, "https://auto.tancdn.com/v1/raw/07117dd5-5a08-410c-af53-77044233802414.svga"

    .line 36
    .line 37
    :goto_0
    check-cast v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 38
    .line 39
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 40
    .line 41
    if-eqz v2, :cond_4

    .line 42
    .line 43
    if-eqz v1, :cond_3

    .line 44
    .line 45
    sget v2, Ll/dbc0;->hd:I

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_3
    sget v2, Ll/dbc0;->gd:I

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_4
    if-eqz v1, :cond_5

    .line 52
    .line 53
    sget v2, Ll/dbc0;->fd:I

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_5
    sget v2, Ll/dbc0;->ed:I

    .line 57
    .line 58
    :goto_1
    const/4 v4, 0x0

    .line 59
    invoke-virtual {p0, v3, v2, v4}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->n(Ljava/lang/String;IZ)V

    .line 60
    .line 61
    .line 62
    iget-object v2, v0, Ll/pf60;->a:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;

    .line 65
    .line 66
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;->started:Z

    .line 67
    .line 68
    invoke-virtual {p0, v2}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->j(Z)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->p(Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 75
    .line 76
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->m3()Lrx/c;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    const/4 v2, 0x1

    .line 87
    invoke-virtual {v0, v2}, Lrx/c;->skip(I)Lrx/c;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {p1, v0}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    new-instance v0, Ll/uuq;

    .line 96
    .line 97
    invoke-direct {v0, p0, v1}, Ll/uuq;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;Z)V

    .line 98
    .line 99
    .line 100
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 105
    .line 106
    .line 107
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->i(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/tuq;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ll/tuq;-><init>(Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;)V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->m()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->k:Landroid/view/View;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eq p1, p2, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->k:Landroid/view/View;

    .line 21
    .line 22
    filled-new-array {p0}, [Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p1, p0}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public final p(Ll/pf60;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi$JustRealStatus;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/justreal/JustRealHomeTitleLayoutOptNew;->o:Ll/pf60;

    .line 2
    .line 3
    return-void
.end method
