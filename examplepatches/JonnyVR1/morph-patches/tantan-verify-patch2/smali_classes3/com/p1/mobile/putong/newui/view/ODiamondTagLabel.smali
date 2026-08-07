.class public Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/FrameLayout;

.field public e:Lv/VImage;

.field public f:Lcom/tantan/library/svga/SVGAnimationView;

.field public g:J

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 12
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    .line 11
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->h:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->r()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic h0(Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->h:Z

    return p0
.end method

.method public static bridge synthetic i0(Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->g:J

    return-void
.end method

.method private r()V
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
    sget v1, Ll/jec0;->k:I

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->j0(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->e:Lv/VImage;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 24
    .line 25
    sget-object v1, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 28
    .line 29
    .line 30
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 31
    .line 32
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 39
    .line 40
    iget-object v2, v2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 41
    .line 42
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->F0()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-interface {v0, v1, p0, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->bs(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method


# virtual methods
.method public final j0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/g650;->a(Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public k0()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->h:Z

    .line 3
    .line 4
    const-wide/16 v1, 0x0

    .line 5
    .line 6
    iput-wide v1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->g:J

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-static {v1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/tantan/library/svga/SVGAnimationView;->stopAnimation(Z)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public l0()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->e:Lv/VImage;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 14
    .line 15
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    sget-object v2, Lcom/p1/mobile/android/ui/label/LabelStyle;->MIDDLE:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 18
    .line 19
    invoke-interface {v0, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->e9(Lcom/p1/mobile/android/ui/label/LabelStyle;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget v0, Ll/cbc0;->Z:I

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 30
    .line 31
    .line 32
    :goto_0
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 33
    .line 34
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 41
    .line 42
    iget-object v2, v2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 43
    .line 44
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->F2()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v0, v1, p0, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->bs(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public m0()V
    .locals 3

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->e:Lv/VImage;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 14
    .line 15
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 16
    .line 17
    sget-object v2, Lcom/p1/mobile/android/ui/label/LabelStyle;->SMALL:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 18
    .line 19
    invoke-interface {v0, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->e9(Lcom/p1/mobile/android/ui/label/LabelStyle;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget v0, Ll/cbc0;->a0:I

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 30
    .line 31
    .line 32
    :goto_0
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 33
    .line 34
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 41
    .line 42
    iget-object v2, v2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 43
    .line 44
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->F2()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-interface {v0, v1, p0, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->bs(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public n0()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->e:Lv/VImage;

    .line 2
    .line 3
    sget v1, Ll/cbc0;->c0:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 6
    .line 7
    .line 8
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 9
    .line 10
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    sget-object v2, Ll/uqb0;->b0:Ll/sre0;

    .line 17
    .line 18
    iget-object v2, v2, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 19
    .line 20
    invoke-interface {v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->O1()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-interface {v0, v1, p0, v2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->bs(Landroid/content/Context;Landroid/view/View;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public o0()V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Wp()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->e:Lv/VImage;

    .line 12
    .line 13
    sget v0, Ll/cbc0;->V:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 20
    .line 21
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 22
    .line 23
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->e:Lv/VImage;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 32
    .line 33
    iget-object p0, p0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/android/ui/label/LabelStyle;->MIDDLE:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 36
    .line 37
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->db(Lcom/p1/mobile/android/ui/label/LabelStyle;)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    sget v0, Ll/cbc0;->e0:I

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->r0()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->k0()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p0()V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Wp()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->e:Lv/VImage;

    .line 12
    .line 13
    sget v0, Ll/cbc0;->W:I

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 20
    .line 21
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 22
    .line 23
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->e:Lv/VImage;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 32
    .line 33
    iget-object p0, p0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 34
    .line 35
    sget-object v0, Lcom/p1/mobile/android/ui/label/LabelStyle;->SMALL:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 36
    .line 37
    invoke-interface {p0, v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->db(Lcom/p1/mobile/android/ui/label/LabelStyle;)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {v1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    sget v0, Ll/cbc0;->f0:I

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->r0()V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public q0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iget-wide v2, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->g:J

    .line 15
    .line 16
    sub-long v2, v0, v2

    .line 17
    .line 18
    const-wide/16 v4, 0x3e8

    .line 19
    .line 20
    cmp-long v2, v2, v4

    .line 21
    .line 22
    if-gez v2, :cond_1

    .line 23
    .line 24
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->g:J

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->h:Z

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "https://auto.tancdn.com/v1/raw/be74791e-f7e3-4190-ba06-4a030b44d5d514.pdf"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$a;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$a;-><init>(Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->d:Landroid/widget/FrameLayout;

    .line 63
    .line 64
    new-instance v2, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$b;

    .line 65
    .line 66
    invoke-direct {v2, p0, v0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$b;-><init>(Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, v2}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public r0()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->isAnimating()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {}, Ll/pzi0;->o()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iget-wide v2, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->g:J

    .line 15
    .line 16
    sub-long v2, v0, v2

    .line 17
    .line 18
    const-wide/16 v4, 0x3e8

    .line 19
    .line 20
    cmp-long v2, v2, v4

    .line 21
    .line 22
    if-gez v2, :cond_1

    .line 23
    .line 24
    iput-wide v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->g:J

    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const/4 v0, 0x0

    .line 28
    iput-boolean v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->h:Z

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "https://auto.tancdn.com/v1/raw/a2418e95-0e28-4e6c-8be1-fd8fb05a08b911.pdf"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/4 v1, 0x1

    .line 45
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->repeatCount(I)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    new-instance v1, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$c;

    .line 54
    .line 55
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$c;-><init>(Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->animListener(Lcom/tantan/library/svga/AnimListener;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->d:Landroid/widget/FrameLayout;

    .line 63
    .line 64
    new-instance v2, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$d;

    .line 65
    .line 66
    invoke-direct {v2, p0, v0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel$d;-><init>(Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v1, v2}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public setLargeMode(Z)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Wp()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->e:Lv/VImage;

    .line 12
    .line 13
    sget v1, Ll/cbc0;->U:I

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->f:Lcom/tantan/library/svga/SVGAnimationView;

    .line 19
    .line 20
    sget v1, Ll/qa00;->g:I

    .line 21
    .line 22
    invoke-static {v0, v1}, Ll/qnp0;->d1(Landroid/view/View;I)V

    .line 23
    .line 24
    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->q0()V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    sget-object p1, Ll/uqb0;->b0:Ll/sre0;

    .line 32
    .line 33
    iget-object p1, p1, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 34
    .line 35
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->I4()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->e:Lv/VImage;

    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    sget-object p0, Ll/uqb0;->b0:Ll/sre0;

    .line 44
    .line 45
    iget-object p0, p0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 46
    .line 47
    sget-object p1, Lcom/p1/mobile/android/ui/label/LabelStyle;->MAX:Lcom/p1/mobile/android/ui/label/LabelStyle;

    .line 48
    .line 49
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->db(Lcom/p1/mobile/android/ui/label/LabelStyle;)I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_2
    sget p1, Ll/cbc0;->d0:I

    .line 58
    .line 59
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/newui/view/ODiamondTagLabel;->r0()V

    .line 63
    .line 64
    .line 65
    return-void
.end method
