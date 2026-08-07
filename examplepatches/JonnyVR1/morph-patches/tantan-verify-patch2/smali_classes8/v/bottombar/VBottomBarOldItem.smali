.class public Lv/bottombar/VBottomBarOldItem;
.super Lv/bottombar/VBottomBarDefaultItem;
.source "SourceFile"


# instance fields
.field public h:Lv/VDraweeView;

.field public i:Lv/bottombar/VBottomBarRippleView;

.field public j:Landroid/widget/RelativeLayout;

.field public k:Landroid/widget/RelativeLayout;

.field public l:Landroid/widget/FrameLayout;

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/bottombar/VBottomBarDefaultItem;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lv/bottombar/VBottomBarOldItem;->c()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Lv/bottombar/VBottomBarDefaultItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-virtual {p0}, Lv/bottombar/VBottomBarOldItem;->c()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Lv/bottombar/VBottomBarDefaultItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-virtual {p0}, Lv/bottombar/VBottomBarOldItem;->c()V

    return-void
.end method

.method public static synthetic e(Lv/bottombar/VBottomBarOldItem;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lv/bottombar/VBottomBarOldItem;->h(FF)V

    return-void
.end method


# virtual methods
.method public b()V
    .locals 5

    .line 1
    invoke-super {p0}, Lv/bottombar/VBottomBarDefaultItem;->b()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lv/bottombar/VBottomBarDefaultItem;->a:Lv/bottombar/a;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_1

    .line 9
    :cond_0
    iget-object v1, v0, Lv/bottombar/a;->i:Lv/bottombar/a$a;

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    iget v2, v1, Lv/bottombar/a$a;->c:I

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    iget v1, v1, Lv/bottombar/a$a;->d:I

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    iget-object v3, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 22
    .line 23
    invoke-virtual {v3, v2, v1}, Lv/bottombar/VBottomBarRippleView;->g(II)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    iget-object v1, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 28
    .line 29
    iget v2, v0, Lv/bottombar/a;->c:I

    .line 30
    .line 31
    iget v3, v0, Lv/bottombar/a;->e:I

    .line 32
    .line 33
    invoke-virtual {v1, v2, v3}, Lv/bottombar/VBottomBarRippleView;->g(II)V

    .line 34
    .line 35
    .line 36
    :goto_0
    iget-object v1, v0, Lv/bottombar/a;->h:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v1}, Ll/r8g0;->b(Ljava/lang/String;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    iget-object v1, p0, Lv/bottombar/VBottomBarOldItem;->h:Lv/VDraweeView;

    .line 45
    .line 46
    const/4 v2, 0x1

    .line 47
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lv/bottombar/VBottomBarOldItem;->h:Lv/VDraweeView;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Ll/wlj;

    .line 57
    .line 58
    new-instance v2, Landroid/graphics/drawable/ColorDrawable;

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    sget v4, Ll/z8c0;->s:I

    .line 69
    .line 70
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    invoke-direct {v2, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1, v2}, Ll/wlj;->E(Landroid/graphics/drawable/Drawable;)V

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Lv/bottombar/VBottomBarOldItem;->h:Lv/VDraweeView;

    .line 81
    .line 82
    iget-object v0, v0, Lv/bottombar/a;->h:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v1, v0}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 88
    .line 89
    new-instance v1, Ll/jok0;

    .line 90
    .line 91
    invoke-direct {v1, p0}, Ll/jok0;-><init>(Lv/bottombar/VBottomBarOldItem;)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Lv/bottombar/VBottomBarRippleView;->setRippleListener(Lv/bottombar/VBottomBarRippleView$b;)V

    .line 95
    .line 96
    .line 97
    :cond_2
    :goto_1
    return-void
.end method

.method public c()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget v1, Ll/gec0;->d:I

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    .line 23
    .line 24
    const/4 v2, -0x2

    .line 25
    const/4 v3, -0x1

    .line 26
    invoke-direct {v1, v2, v3}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    const/4 v1, 0x0

    .line 33
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 37
    .line 38
    .line 39
    sget v1, Ll/vcc0;->l0:I

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lv/VDraweeView;

    .line 46
    .line 47
    iput-object v1, p0, Lv/bottombar/VBottomBarOldItem;->h:Lv/VDraweeView;

    .line 48
    .line 49
    sget v1, Ll/vcc0;->H0:I

    .line 50
    .line 51
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    check-cast v0, Lv/bottombar/VBottomBarRippleView;

    .line 56
    .line 57
    iput-object v0, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 58
    .line 59
    sget v0, Ll/vcc0;->K:I

    .line 60
    .line 61
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    check-cast v0, Landroid/widget/FrameLayout;

    .line 66
    .line 67
    iput-object v0, p0, Lv/bottombar/VBottomBarOldItem;->l:Landroid/widget/FrameLayout;

    .line 68
    .line 69
    sget v0, Ll/vcc0;->m0:I

    .line 70
    .line 71
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 76
    .line 77
    iput-object v0, p0, Lv/bottombar/VBottomBarOldItem;->k:Landroid/widget/RelativeLayout;

    .line 78
    .line 79
    sget v0, Ll/vcc0;->I0:I

    .line 80
    .line 81
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 86
    .line 87
    iput-object v0, p0, Lv/bottombar/VBottomBarOldItem;->j:Landroid/widget/RelativeLayout;

    .line 88
    .line 89
    invoke-super {p0}, Lv/bottombar/VBottomBarDefaultItem;->c()V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public d(ZZ)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget-object p1, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Lv/bottombar/VBottomBarRippleView;->i()V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1}, Lv/bottombar/VBottomBarRippleView;->d()V

    .line 13
    .line 14
    .line 15
    :goto_0
    iget-object p1, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    sget v1, Ll/z8c0;->t:I

    .line 22
    .line 23
    invoke-virtual {p2, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 31
    .line 32
    const/4 p2, 0x1

    .line 33
    invoke-virtual {p1, v0, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 34
    .line 35
    .line 36
    goto :goto_2

    .line 37
    :cond_1
    iget-object p1, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 38
    .line 39
    invoke-virtual {p1}, Lv/bottombar/VBottomBarRippleView;->f()V

    .line 40
    .line 41
    .line 42
    iget-boolean p1, p0, Lv/bottombar/VBottomBarDefaultItem;->g:Z

    .line 43
    .line 44
    iget-object p2, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 45
    .line 46
    if-eqz p1, :cond_2

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    sget v1, Ll/z8c0;->v:I

    .line 53
    .line 54
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 59
    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    sget v1, Ll/z8c0;->o:I

    .line 67
    .line 68
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 73
    .line 74
    .line 75
    :goto_1
    iget-object p1, p0, Lv/bottombar/VBottomBarDefaultItem;->b:Lv/VText;

    .line 76
    .line 77
    const/4 p2, 0x0

    .line 78
    invoke-virtual {p1, v0, p2}, Landroidx/appcompat/widget/AppCompatTextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 79
    .line 80
    .line 81
    :goto_2
    iget-object p1, p0, Lv/bottombar/VBottomBarOldItem;->h:Lv/VDraweeView;

    .line 82
    .line 83
    if-eqz p1, :cond_4

    .line 84
    .line 85
    iget-boolean p2, p0, Lv/bottombar/VBottomBarOldItem;->m:Z

    .line 86
    .line 87
    if-eqz p2, :cond_4

    .line 88
    .line 89
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-eqz p0, :cond_3

    .line 94
    .line 95
    const/high16 p0, 0x3f800000    # 1.0f

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_3
    const/high16 p0, 0x3f000000    # 0.5f

    .line 99
    .line 100
    :goto_3
    invoke-virtual {p1, p0}, Landroid/view/View;->setAlpha(F)V

    .line 101
    .line 102
    .line 103
    :cond_4
    return-void
.end method

.method public f(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/LayoutRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lv/bottombar/VBottomBarOldItem;->k:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lv/bottombar/VBottomBarOldItem;->k:Landroid/widget/RelativeLayout;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Lv/bottombar/VBottomBarOldItem;->k:Landroid/widget/RelativeLayout;

    .line 19
    .line 20
    invoke-static {v0, p1, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lv/bottombar/VBottomBarOldItem;->k:Landroid/widget/RelativeLayout;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public g(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V
    .locals 0

    .line 1
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->y(Landroid/net/Uri;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    new-instance p2, Ll/bkq;

    .line 10
    .line 11
    invoke-direct {p2, p3, p4}, Ll/bkq;-><init>(II)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->K(Ll/fm80;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {}, Ll/f9j;->g()Ll/lq70;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    invoke-virtual {p1}, Lcom/facebook/drawee/view/DraweeView;->getController()Ll/lde;

    .line 27
    .line 28
    .line 29
    move-result-object p3

    .line 30
    invoke-virtual {p2, p3}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->E(Ll/lde;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    check-cast p2, Ll/lq70;

    .line 35
    .line 36
    invoke-virtual {p2, p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->C(Ljava/lang/Object;)Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    check-cast p0, Ll/lq70;

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/facebook/drawee/controller/AbstractDraweeControllerBuilder;->c()Ll/c7;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, p0}, Lcom/facebook/drawee/view/DraweeView;->setController(Ll/lde;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public getIconView()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPicture()Lv/VDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/bottombar/VBottomBarOldItem;->h:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final synthetic h(FF)V
    .locals 0

    .line 1
    iget-object p1, p0, Lv/bottombar/VBottomBarOldItem;->h:Lv/VDraweeView;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/view/View;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lv/bottombar/VBottomBarOldItem;->h:Lv/VDraweeView;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Landroid/view/View;->setScaleY(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/r8g0;->b(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lv/bottombar/VBottomBarOldItem;->h:Lv/VDraweeView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lv/bottombar/VBottomBarOldItem;->h:Lv/VDraweeView;

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    const/4 p2, 0x2

    .line 18
    const/16 v1, 0x1e

    .line 19
    .line 20
    invoke-virtual {p0, v0, p1, p2, v1}, Lv/bottombar/VBottomBarOldItem;->g(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {v0, p1}, Lcom/facebook/drawee/view/SimpleDraweeView;->setImageURI(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public j()V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/bottombar/VBottomBarOldItem;->j:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    const/high16 v1, 0x41500000    # 13.0f

    .line 4
    .line 5
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-static {v0, v1}, Ll/bnl0;->U(Landroid/view/View;I)V

    .line 10
    .line 11
    .line 12
    sget v0, Ll/abc0;->f:I

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lv/bottombar/VBottomBarOldItem;->l:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    const/high16 v1, 0x41880000    # 17.0f

    .line 20
    .line 21
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-static {v0, v1}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Lv/bottombar/VBottomBarOldItem;->m:Z

    .line 30
    .line 31
    return-void
.end method

.method public setDarkMode(Z)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lv/bottombar/VBottomBarDefaultItem;->setDarkMode(Z)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lv/bottombar/VBottomBarOldItem;->i:Lv/bottombar/VBottomBarRippleView;

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lv/bottombar/VBottomBarRippleView;->setDarkMode(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->isSelected()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, p1, v0}, Lv/bottombar/VBottomBarOldItem;->d(ZZ)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
