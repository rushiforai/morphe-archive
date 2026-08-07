.class public Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# static fields
.field public static final l:[I

.field public static final m:[I

.field public static final n:[I


# instance fields
.field public d:Landroid/view/View;

.field public e:Landroid/widget/TextView;

.field public f:Lv/VImage;

.field public g:Lcom/tantan/library/svga/SVGAnimationView;

.field public h:I

.field public i:J

.field public j:Ljava/lang/CharSequence;

.field public k:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "#f3b50c"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    filled-new-array {v1, v0}, [I

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->l:[I

    .line 16
    .line 17
    const-string v0, "#ff9719"

    .line 18
    .line 19
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const-string v1, "#ff6a0c"

    .line 24
    .line 25
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    filled-new-array {v0, v1}, [I

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    sput-object v0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->m:[I

    .line 34
    .line 35
    const-string v0, "#fe7e1d"

    .line 36
    .line 37
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    filled-new-array {v1, v0}, [I

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    sput-object v0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->n:[I

    .line 50
    .line 51
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 16
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    const/4 v0, 0x0

    .line 15
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    sget p1, Ll/qa00;->g:I

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->h:I

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->k:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->r()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private setBackground([I)V
    .locals 4

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->h:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    const/16 v1, 0x8

    .line 5
    .line 6
    new-array v1, v1, [F

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    aput v0, v1, v2

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    aput v0, v1, v3

    .line 13
    .line 14
    const/4 v3, 0x2

    .line 15
    aput v0, v1, v3

    .line 16
    .line 17
    const/4 v3, 0x3

    .line 18
    aput v0, v1, v3

    .line 19
    .line 20
    const/4 v3, 0x4

    .line 21
    aput v0, v1, v3

    .line 22
    .line 23
    const/4 v3, 0x5

    .line 24
    aput v0, v1, v3

    .line 25
    .line 26
    const/4 v3, 0x6

    .line 27
    aput v0, v1, v3

    .line 28
    .line 29
    const/4 v3, 0x7

    .line 30
    aput v0, v1, v3

    .line 31
    .line 32
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 33
    .line 34
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 41
    .line 42
    .line 43
    sget-object v1, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setColors([I)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->d:Landroid/view/View;

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public getImageView()Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->f:Lv/VImage;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->k:Z

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    iput-object v1, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->j:Ljava/lang/CharSequence;

    .line 6
    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    iput-wide v1, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->i:J

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->h0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public r()V
    .locals 3

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
    sget v1, Ll/jec0;->p:I

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    sget v0, Ll/ycc0;->j0:I

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->d:Landroid/view/View;

    .line 21
    .line 22
    sget v0, Ll/ycc0;->m0:I

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Landroid/widget/TextView;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->e:Landroid/widget/TextView;

    .line 31
    .line 32
    sget v0, Ll/ycc0;->l0:I

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Lv/VImage;

    .line 39
    .line 40
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->f:Lv/VImage;

    .line 41
    .line 42
    sget v0, Ll/ycc0;->k0:I

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    check-cast v0, Lcom/tantan/library/svga/SVGAnimationView;

    .line 49
    .line 50
    iput-object v0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->g:Lcom/tantan/library/svga/SVGAnimationView;

    .line 51
    .line 52
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 53
    .line 54
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 55
    .line 56
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 61
    .line 62
    iget-object v2, v2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 63
    .line 64
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Y3()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-interface {v0, v1, p0, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->bs(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public setBackgroundRoundRadius(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->h:I

    .line 2
    .line 3
    return-void
.end method

.method public setImageMarginTB(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->f:Lv/VImage;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/FrameLayout$LayoutParams;

    .line 8
    .line 9
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 10
    .line 11
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->bottomMargin:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->f:Lv/VImage;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setImageResource(I)V
    .locals 2
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->e:Landroid/widget/TextView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->f:Lv/VImage;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->f:Lv/VImage;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setLeftRightPadding(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->d:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0, p1, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setTagType(Ljava/lang/CharSequence;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->j:Ljava/lang/CharSequence;

    .line 2
    .line 3
    const-string v0, "advanced"

    .line 4
    .line 5
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object p1, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->m:[I

    .line 12
    .line 13
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->setBackground([I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string v0, "svip"

    .line 18
    .line 19
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_1

    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->n:[I

    .line 26
    .line 27
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->setBackground([I)V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->l:[I

    .line 32
    .line 33
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->setBackground([I)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public setText(Ljava/lang/CharSequence;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->f:Lv/VImage;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->e:Landroid/widget/TextView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->e:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setTextColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->e:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setTextSize(F)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/VIPShimmerTag;->e:Landroid/widget/TextView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
