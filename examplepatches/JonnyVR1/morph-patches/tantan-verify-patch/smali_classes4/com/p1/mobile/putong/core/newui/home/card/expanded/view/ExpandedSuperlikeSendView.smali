.class public Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;
.super Landroidx/cardview/widget/CardView;
.source "SourceFile"


# instance fields
.field public a:Lcom/tantan/library/svga/SVGAnimationView;

.field public b:Lcom/tantan/library/svga/SVGAnimationView;

.field public c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const p1, 0x44548000    # 850.0f

    .line 5
    .line 6
    .line 7
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;->c:I

    .line 12
    .line 13
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

    .line 14
    invoke-direct {p0, p1, p2}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const p1, 0x44548000    # 850.0f

    .line 15
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;->c:I

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

    .line 16
    invoke-direct {p0, p1, p2, p3}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const p1, 0x44548000    # 850.0f

    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    move-result p1

    iput p1, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;->c:I

    return-void
.end method


# virtual methods
.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public onFinishInflate()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    sget v0, Ll/adc0;->od:I

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 13
    .line 14
    sget v0, Ll/adc0;->nd:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;->b:Lcom/tantan/library/svga/SVGAnimationView;

    .line 23
    .line 24
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/home/card/expanded/view/ExpandedSuperlikeSendView;->c:I

    .line 6
    .line 7
    if-le p2, v0, :cond_0

    .line 8
    .line 9
    move p2, v0

    .line 10
    :cond_0
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-interface {v1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Lo()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    int-to-float v1, v1

    .line 23
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    sub-int/2addr p2, v1

    .line 28
    const/high16 v1, 0x40800000    # 4.0f

    .line 29
    .line 30
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    sub-int/2addr p2, v1

    .line 35
    const/high16 v1, 0x40000000    # 2.0f

    .line 36
    .line 37
    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-super {p0, p1, v1}, Landroidx/cardview/widget/CardView;->onMeasure(II)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
