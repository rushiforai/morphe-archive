.class public Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;
.super Lcom/tantan/library/svga/SVGAnimationView;
.source "SourceFile"


# instance fields
.field public a:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;)V

    const/4 p1, -0x1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->a:I

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

    .line 8
    invoke-direct {p0, p1, p2}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->a:I

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

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/tantan/library/svga/SVGAnimationView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->a:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public e(Ljava/lang/String;IILjava/lang/Runnable;)V
    .locals 1
    .param p2    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->a:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$b;

    .line 25
    .line 26
    invoke-direct {v0, p0, p2}, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$b;-><init>(Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p1, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->loadCallback(Lcom/tantan/library/svga/data/request/RequestCallback;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    new-instance p2, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$a;

    .line 34
    .line 35
    invoke-direct {p2, p0, p3, p4}, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView$a;-><init>(Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;ILjava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantan/library/svga/SVGAnimationView;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->a:I

    .line 5
    .line 6
    const/4 v1, -0x1

    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->setImageResource(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .param p1    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setImageResource(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->a:I

    .line 5
    .line 6
    return-void
.end method

.method public setLocalRes(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->a:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/view/CoreSvgaOptView;->setImageResource(I)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
