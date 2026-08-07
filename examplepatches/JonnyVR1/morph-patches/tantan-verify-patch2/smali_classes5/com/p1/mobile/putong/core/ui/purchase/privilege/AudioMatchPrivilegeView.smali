.class public Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;
.super Landroidx/constraintlayout/widget/ConstraintLayout;
.source "SourceFile"


# instance fields
.field public d:Lcom/tantan/library/svga/SVGAnimationView;

.field public e:Landroidx/constraintlayout/widget/Guideline;

.field public f:Landroidx/constraintlayout/widget/Guideline;

.field public g:Landroid/widget/FrameLayout;

.field public h:Lv/AutoVDraweeView;

.field public i:Landroid/widget/FrameLayout;

.field public j:Lv/AutoVDraweeView;

.field public k:Lv/VLinear;

.field public l:Lv/VImage;

.field public m:Lcom/tantan/library/svga/SVGAnimationView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private init()V
    .locals 4

    .line 1
    invoke-static {}, Ll/bnl0;->w0()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x3c0

    .line 6
    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->l0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_4

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->h:Lv/AutoVDraweeView;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v1, v2}, Lv/AutoVDraweeView;->setImageUrl(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 38
    .line 39
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    const-string v2, "female"

    .line 44
    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 48
    .line 49
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->j0()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 64
    .line 65
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_2

    .line 70
    .line 71
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->getLookingFor()Lcom/p1/mobile/putong/data/LookingFor;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    const-string v3, "male"

    .line 78
    .line 79
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_2

    .line 84
    .line 85
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->k0()V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 90
    .line 91
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_3

    .line 96
    .line 97
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->k0()V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->j0()V

    .line 102
    .line 103
    .line 104
    :cond_4
    return-void
.end method

.method private j0()V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->j:Lv/AutoVDraweeView;

    .line 4
    .line 5
    sget v1, Ll/jbc0;->Pa:I

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private k0()V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->j:Lv/AutoVDraweeView;

    .line 4
    .line 5
    sget v1, Ll/jbc0;->Qa:I

    .line 6
    .line 7
    invoke-virtual {v0, p0, v1}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final h0(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/nb1;->a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i0(Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 4

    .line 1
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "https://auto.tancdn.com/v1/raw/ba15ae47-96dd-434b-900f-91692d51b57e14.pdf"

    .line 8
    .line 9
    const-string v1, "https://auto.tancdn.com/v1/raw/24286ac3-5f6f-4be2-8ec5-3ba231a5725614.pdf"

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const-string v0, "https://auto.tancdn.com/v1/raw/43a454d2-a42a-41e8-8f40-1dfbd4d0c89d12.pdf"

    .line 13
    .line 14
    const-string v1, "https://auto.tancdn.com/v1/raw/52af8cbe-8c18-488a-b453-3431b647b6dd12.pdf"

    .line 15
    .line 16
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-static {v2}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2, v0}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->m:Lcom/tantan/library/svga/SVGAnimationView;

    .line 34
    .line 35
    invoke-virtual {v0, v3}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Lcom/tantan/library/svga/SVGALoader;->with(Landroid/content/Context;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->from(Ljava/lang/String;)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0, v2}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->autoPlay(Z)Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Lcom/tantan/library/svga/SVGALoader$SVGARequestBuilder;->into(Lcom/tantan/library/svga/SVGAnimationView;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->k:Lv/VLinear;

    .line 60
    .line 61
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_1

    .line 66
    .line 67
    sget v1, Ll/jbc0;->k4:I

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_1
    sget v1, Ll/jbc0;->z9:I

    .line 71
    .line 72
    :goto_1
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->l:Lv/VImage;

    .line 76
    .line 77
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_2

    .line 82
    .line 83
    sget v1, Ll/jbc0;->h4:I

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_2
    sget v1, Ll/jbc0;->w9:I

    .line 87
    .line 88
    :goto_2
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->g:Landroid/widget/FrameLayout;

    .line 92
    .line 93
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_3

    .line 98
    .line 99
    sget v1, Ll/jbc0;->i4:I

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_3
    sget v1, Ll/jbc0;->x9:I

    .line 103
    .line 104
    :goto_3
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->i:Landroid/widget/FrameLayout;

    .line 108
    .line 109
    invoke-static {p1}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 110
    .line 111
    .line 112
    move-result p1

    .line 113
    if-eqz p1, :cond_4

    .line 114
    .line 115
    sget p1, Ll/jbc0;->j4:I

    .line 116
    .line 117
    goto :goto_4

    .line 118
    :cond_4
    sget p1, Ll/jbc0;->y9:I

    .line 119
    .line 120
    :goto_4
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 121
    .line 122
    .line 123
    return-void
.end method

.method public final l0()V
    .locals 4

    .line 1
    const/high16 v0, 0x428c0000    # 70.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, 0x42a80000    # 84.0f

    .line 8
    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->g:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 20
    .line 21
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 22
    .line 23
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 24
    .line 25
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->g:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->h:Lv/AutoVDraweeView;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    .line 37
    .line 38
    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 39
    .line 40
    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 41
    .line 42
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->h:Lv/AutoVDraweeView;

    .line 43
    .line 44
    invoke-virtual {v3, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->i:Landroid/widget/FrameLayout;

    .line 48
    .line 49
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 54
    .line 55
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->width:I

    .line 56
    .line 57
    iput v1, v2, Landroid/view/ViewGroup$MarginLayoutParams;->height:I

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->i:Landroid/widget/FrameLayout;

    .line 60
    .line 61
    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->j:Lv/AutoVDraweeView;

    .line 65
    .line 66
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 71
    .line 72
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 73
    .line 74
    iput v0, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 75
    .line 76
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->j:Lv/AutoVDraweeView;

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->e:Landroidx/constraintlayout/widget/Guideline;

    .line 82
    .line 83
    const v1, 0x3eeb851f    # 0.46f

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/widget/Guideline;->setGuidelinePercent(F)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->f:Landroidx/constraintlayout/widget/Guideline;

    .line 90
    .line 91
    const v1, 0x3f0a3d71    # 0.54f

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v1}, Landroidx/constraintlayout/widget/Guideline;->setGuidelinePercent(F)V

    .line 95
    .line 96
    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 98
    .line 99
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    const/high16 v1, 0x42fa0000    # 125.0f

    .line 104
    .line 105
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    iput v2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 110
    .line 111
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 118
    .line 119
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 120
    .line 121
    .line 122
    return-void
.end method

.method public m0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->d:Lcom/tantan/library/svga/SVGAnimationView;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->m:Lcom/tantan/library/svga/SVGAnimationView;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/tantan/library/svga/SVGAnimationView;->startAnimation()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->h0(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/AudioMatchPrivilegeView;->init()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
