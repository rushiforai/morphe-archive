.class public Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/tantan/library/svga/SVGAnimationView;


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


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nj90;->a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    new-instance p1, Lcom/tantan/library/svga/compose/SVGADynamicEntity;

    .line 2
    .line 3
    invoke-direct {p1}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture;->profileBig()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_0

    .line 31
    .line 32
    const-string v1, "head01"

    .line 33
    .line 34
    invoke-virtual {p1, v0, v1}, Lcom/tantan/library/svga/compose/SVGADynamicEntity;->setDynamicImage(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    if-eqz p2, :cond_1

    .line 42
    .line 43
    const-string p2, "https://auto.tancdn.com/v1/raw/a512b19c-5a9b-4d0f-8b6b-16ab2638077d14.pdf"

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    const-string p2, "https://auto.tancdn.com/v1/raw/111f5946-befb-45c1-875d-c4127848ca3f14.pdf"

    .line 47
    .line 48
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    const/4 v0, 0x0

    .line 61
    invoke-virtual {p2, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 62
    .line 63
    .line 64
    move-result-object p2

    .line 65
    const/4 v0, 0x1

    .line 66
    invoke-virtual {p2, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    invoke-virtual {p2, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->dynamic(Lcom/tantan/library/svga/compose/SVGADynamicEntity;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    new-instance p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView$a;

    .line 75
    .line 76
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView$a;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 84
    .line 85
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public c(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    const/high16 p1, 0x430c0000    # 140.0f

    .line 2
    .line 3
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->e(I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    const-string p2, "https://fe-static.tancdn.com/v1/raw/84570b50-d8bb-472f-b054-29051c568dec14.svga"

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 p2, 0x0

    .line 25
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/4 p2, 0x1

    .line 30
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    new-instance p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView$c;

    .line 35
    .line 36
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView$c;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 44
    .line 45
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public d(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    const/high16 p1, 0x430c0000    # 140.0f

    .line 2
    .line 3
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->e(I)V

    .line 8
    .line 9
    .line 10
    invoke-static {}, Ll/c17;->u0()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    const-string p1, "https://fe-static.tancdn.com/v1/raw/8aebaed7-dff9-4bc9-9693-f2eb3509473214.svga"

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string p1, "https://fe-static.tancdn.com/v1/raw/fc24b12c-e55f-404c-8da2-a7916aacc4a814.svga"

    .line 20
    .line 21
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-static {p2}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 26
    .line 27
    .line 28
    move-result-object p2

    .line 29
    invoke-virtual {p2, p1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/4 p2, 0x0

    .line 34
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const/4 p2, 0x1

    .line 39
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    new-instance p2, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView$b;

    .line 44
    .line 45
    invoke-direct {p2, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView$b;-><init>(Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1, p2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public final e(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 8
    .line 9
    if-eq v1, p1, :cond_0

    .line 10
    .line 11
    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->a:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeSVGAContainerView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
