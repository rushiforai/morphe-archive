.class public Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/LinearLayout;

.field public e:Lcom/tantan/library/svga/SVGAnimationView;

.field public f:Landroid/widget/TextView;

.field public g:Lcom/tantan/library/svga/SVGAnimationView;

.field public h:Lcom/tantan/library/svga/SVGAnimationView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, -0x1

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/z33;->a(Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const/high16 p1, 0x41e00000    # 28.0f

    .line 16
    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 22
    .line 23
    const/high16 v2, 0x41a00000    # 20.0f

    .line 24
    .line 25
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 30
    .line 31
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 32
    .line 33
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 34
    .line 35
    .line 36
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 41
    .line 42
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 49
    .line 50
    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->f:Landroid/widget/TextView;

    .line 54
    .line 55
    const/high16 p1, 0x41400000    # 12.0f

    .line 56
    .line 57
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_0
    const/high16 p1, 0x41b80000    # 23.0f

    .line 62
    .line 63
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 68
    .line 69
    const/high16 v2, 0x41800000    # 16.0f

    .line 70
    .line 71
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    iput v3, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 76
    .line 77
    iget-object v3, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 78
    .line 79
    invoke-virtual {v3, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    .line 81
    .line 82
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result p1

    .line 86
    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 87
    .line 88
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput p1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 95
    .line 96
    invoke-virtual {p1, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->f:Landroid/widget/TextView;

    .line 100
    .line 101
    const/high16 p1, 0x41100000    # 9.0f

    .line 102
    .line 103
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public j0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/tantan/library/svga/SVGAnimationView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->l0([Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public k0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v2, "https://auto.tancdn.com/v1/raw/cc4e37f9-cd92-4916-8280-def38db2ce9a11.so"

    .line 21
    .line 22
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v2, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView$a;

    .line 31
    .line 32
    invoke-direct {v2, p0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView$a;-><init>(Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 40
    .line 41
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 42
    .line 43
    .line 44
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 45
    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-nez v0, :cond_1

    .line 53
    .line 54
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    const-string v2, "https://auto.tancdn.com/v1/raw/8563c300-b598-4140-8fd5-bc638d5981df10.so"

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    new-instance v1, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView$b;

    .line 73
    .line 74
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView$b;-><init>(Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 84
    .line 85
    .line 86
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 87
    .line 88
    if-eqz v0, :cond_2

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_2

    .line 95
    .line 96
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const-string v1, "https://auto.tancdn.com/v1/raw/ea2e7057-cacb-4ccd-97a0-f0de165a03d611.so"

    .line 105
    .line 106
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->e:Lcom/tantan/library/svga/SVGAnimationView;

    .line 111
    .line 112
    invoke-virtual {v0, p0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 113
    .line 114
    .line 115
    :cond_2
    return-void
.end method

.method public final varargs l0([Lcom/tantan/library/svga/SVGAnimationView;)V
    .locals 4

    .line 1
    array-length p0, p1

    .line 2
    const/4 v0, 0x0

    .line 3
    move v1, v0

    .line 4
    :goto_0
    if-ge v1, p0, :cond_1

    .line 5
    .line 6
    aget-object v2, p1, v1

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    invoke-virtual {v2}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    invoke-virtual {v2, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    return-void
.end method

.method public onAttachedToWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->j0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onFinishInflate()V
    .locals 6

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/diamond/BlackDiamondTagView;->h:Lcom/tantan/library/svga/SVGAnimationView;

    .line 8
    .line 9
    const/high16 p0, 0x40c00000    # 6.0f

    .line 10
    .line 11
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    const/4 v1, 0x0

    .line 16
    const/4 v2, 0x0

    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-static/range {v0 .. v5}, Ll/qnp0;->c1(Landroid/view/View;IIIII)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
