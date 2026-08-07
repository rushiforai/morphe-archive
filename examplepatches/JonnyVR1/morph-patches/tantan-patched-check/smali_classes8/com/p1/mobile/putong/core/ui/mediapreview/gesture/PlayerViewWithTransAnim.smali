.class public Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/PlayerViewWithTransAnim;
.super Lcom/p1/mobile/putong/core/ui/PlayerView;
.source "SourceFile"

# interfaces
.implements Lv/a$b;


# instance fields
.field public B:Ljava/lang/String;

.field public C:Lv/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/ui/PlayerView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/PlayerViewWithTransAnim;->B()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/PlayerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/PlayerViewWithTransAnim;->B()V

    return-void
.end method

.method private B()V
    .locals 1

    .line 1
    new-instance v0, Lv/a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lv/a;-><init>(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/PlayerViewWithTransAnim;->C:Lv/a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getOriginalHeight()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/PlayerViewWithTransAnim;->C:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/a;->i()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getOriginalWidth()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/PlayerViewWithTransAnim;->C:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/a;->j()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/PlayerViewWithTransAnim;->B:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/PlayerViewWithTransAnim;->C:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/a;->G(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/PlayerViewWithTransAnim;->C:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/a;->H(Landroid/view/ViewGroup;)Landroid/animation/ValueAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public setOriginalHeight(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/PlayerViewWithTransAnim;->C:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/a;->y(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOriginalWidth(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/PlayerViewWithTransAnim;->C:Lv/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lv/a;->z(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTranslationX(F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setTranslationX(F)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setZoomAnimationKey(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/mediapreview/gesture/PlayerViewWithTransAnim;->B:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
