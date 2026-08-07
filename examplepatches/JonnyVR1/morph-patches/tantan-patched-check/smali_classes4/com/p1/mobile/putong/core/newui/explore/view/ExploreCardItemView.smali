.class public Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;
.super Lv/VRelative;
.source "SourceFile"

# interfaces
.implements Ll/pn4;


# instance fields
.field public A:I

.field public d:Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;

.field public e:Landroid/widget/RelativeLayout;

.field public f:Lv/VDraweeView;

.field public g:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

.field public h:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

.field public i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

.field public j:Lv/VLinear;

.field public k:Landroid/view/View;

.field public l:Landroid/view/View;

.field public m:Landroid/view/View;

.field public n:Landroid/view/View;

.field public o:Landroid/widget/RelativeLayout;

.field public p:Landroid/widget/TextView;

.field public q:Landroid/widget/TextView;

.field public r:Landroid/widget/TextView;

.field public s:Landroid/widget/TextView;

.field public t:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

.field public u:Lv/VLinear;

.field public v:Lv/VDraweeView;

.field public w:Lv/VText;

.field public x:Landroid/widget/TextView;

.field public y:Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;

.field public z:Ll/epf;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method private I(ZF)V
    .locals 4

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    cmpl-float v0, p2, p1

    .line 5
    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    const/4 v2, 0x1

    .line 9
    const/4 v3, 0x0

    .line 10
    if-lez v0, :cond_0

    .line 11
    .line 12
    const/high16 p1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    mul-float/2addr p2, v1

    .line 15
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->h:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 20
    .line 21
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;->z(F)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->h:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 25
    .line 26
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->g:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 30
    .line 31
    invoke-static {p1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->h:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 35
    .line 36
    invoke-virtual {p1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->g:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 40
    .line 41
    invoke-virtual {p0, v3}, Landroid/view/View;->setPressed(Z)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_0
    cmpg-float p1, p2, p1

    .line 46
    .line 47
    if-gez p1, :cond_1

    .line 48
    .line 49
    const/high16 p1, -0x40800000    # -1.0f

    .line 50
    .line 51
    mul-float/2addr p2, v1

    .line 52
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->g:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 57
    .line 58
    neg-float p1, p1

    .line 59
    invoke-virtual {p2, p1}, Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;->z(F)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->h:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 63
    .line 64
    invoke-static {p1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->g:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 68
    .line 69
    invoke-static {p1, v2}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->h:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 73
    .line 74
    invoke-virtual {p1, v3}, Landroid/view/View;->setPressed(Z)V

    .line 75
    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->g:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 78
    .line 79
    invoke-virtual {p0, v2}, Landroid/view/View;->setPressed(Z)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->h:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 84
    .line 85
    invoke-static {p1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->g:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 89
    .line 90
    invoke-static {p1, v3}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 91
    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->h:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 94
    .line 95
    invoke-virtual {p1, v3}, Landroid/view/View;->setPressed(Z)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->g:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 99
    .line 100
    invoke-virtual {p0, v3}, Landroid/view/View;->setPressed(Z)V

    .line 101
    .line 102
    .line 103
    :cond_2
    return-void
.end method

.method private synthetic S(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "p_tantanx_card"

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    invoke-static {p2, p1, v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/ProfileAct;->o2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Z)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private act()Lcom/p1/mobile/android/app/Act;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/android/app/Act;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->R(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic q(Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->Q(Landroid/view/View;)V

    return-void
.end method

.method private setOwnViewOutlineCorner(Ljava/lang/String;)V
    .locals 2

    .line 1
    :try_start_0
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 4
    .line 5
    .line 6
    const/high16 v1, 0x41a00000    # 20.0f

    .line 7
    .line 8
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 14
    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 18
    .line 19
    .line 20
    const/high16 v1, 0x40400000    # 3.0f

    .line 21
    .line 22
    invoke-static {v1}, Ll/bnl0;->w(F)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    invoke-virtual {v0, v1, p1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->e:Landroid/widget/RelativeLayout;

    .line 34
    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 36
    .line 37
    .line 38
    :catch_0
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->S(Lcom/p1/mobile/putong/data/User;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ipf;->a(Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H(Ll/epf;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->y:Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;->C:Ljava/lang/String;

    .line 4
    .line 5
    const-string v0, "tantanx_scene_name"

    .line 6
    .line 7
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p1, p1, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p1, 0x0

    .line 19
    :goto_0
    const-string v0, "tantanx_receive_uid"

    .line 20
    .line 21
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "e_tantanx_card"

    .line 30
    .line 31
    const-string v0, "p_tantanx_card"

    .line 32
    .line 33
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public final L(Ll/epf;Ljava/lang/String;)Landroid/view/View;
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/app/PutongAct;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/kec0;->d3:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/adc0;->b4:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lv/VDraweeView;

    .line 25
    .line 26
    sget v2, Ll/adc0;->a4:I

    .line 27
    .line 28
    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    check-cast v2, Lv/VText;

    .line 33
    .line 34
    iget-object v3, p1, Ll/epf;->d:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-nez v3, :cond_0

    .line 41
    .line 42
    sget-object v3, Ll/uqb0;->G:Ll/fsb0;

    .line 43
    .line 44
    iget-object v4, p1, Ll/epf;->d:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v3, v1, v4}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 50
    .line 51
    .line 52
    iget-object p2, p1, Ll/epf;->f:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    if-nez p2, :cond_1

    .line 59
    .line 60
    iget-object p1, p1, Ll/epf;->f:Ljava/lang/String;

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_1
    const-string p1, "32ffffff"

    .line 64
    .line 65
    :goto_0
    const/4 p2, 0x6

    .line 66
    invoke-virtual {p0, v0, p1, p2}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->Z(Landroid/view/View;Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    return-object v0
.end method

.method public M(Ll/epf;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/epf;",
            ")",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object v1, p1, Ll/epf;->c:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_2

    .line 25
    .line 26
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ljava/lang/String;

    .line 31
    .line 32
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    if-nez v3, :cond_1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {p0, p1, v2}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->L(Ll/epf;Ljava/lang/String;)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-object v0
.end method

.method public final O(Ll/epf;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->t:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->setMaxLines(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->t:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 8
    .line 9
    const/high16 v2, 0x40a00000    # 5.0f

    .line 10
    .line 11
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->setWidthSpace(I)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->t:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    iput-boolean v2, v0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->f:Z

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->M(Ll/epf;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->t:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->setTags(Ljava/util/List;)V

    .line 30
    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->t:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;

    .line 33
    .line 34
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    xor-int/2addr p1, v1

    .line 39
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final P()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->h:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 2
    .line 3
    const-string v1, "https://auto.tancdn.com/v1/raw/a982f15f-30aa-47be-9b7e-50ec88482f5311.so"

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;->u(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->g:Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;

    .line 9
    .line 10
    const-string v1, "https://auto.tancdn.com/v1/raw/da3d1a53-b937-41f8-883c-c16c842ca35e11.so"

    .line 11
    .line 12
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/newui/home/views/SwipeLikeButton;->u(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->k:Landroid/view/View;

    .line 16
    .line 17
    new-instance v1, Ll/fpf;

    .line 18
    .line 19
    invoke-direct {v1, p0}, Ll/fpf;-><init>(Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->l:Landroid/view/View;

    .line 26
    .line 27
    new-instance v1, Ll/gpf;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Ll/gpf;-><init>(Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public final synthetic Q(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->c0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic R(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->b0()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final T(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-object v1

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->V(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-nez p1, :cond_1

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0

    .line 23
    :cond_1
    return-object v1
.end method

.method public final V(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 1

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 18
    .line 19
    invoke-static {p0}, Ll/q8g0;->W(Lcom/p1/mobile/putong/data/Location;)Ljava/lang/CharSequence;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    :goto_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method public final W(Lcom/p1/mobile/putong/data/Media;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    instance-of p0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    move-object p0, p1

    .line 12
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    instance-of p0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 35
    .line 36
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 39
    .line 40
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-nez p0, :cond_1

    .line 45
    .line 46
    sget-object p0, Ll/uqb0;->G:Ll/fsb0;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 49
    .line 50
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {p0, p1}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public X(Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;Ll/epf;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, p2, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_4

    .line 20
    .line 21
    :cond_0
    if-eqz p2, :cond_7

    .line 22
    .line 23
    iget-object v0, p2, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 24
    .line 25
    if-eqz v0, :cond_7

    .line 26
    .line 27
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->y:Lcom/p1/mobile/putong/core/newui/explore/HomeExploreFrag;

    .line 28
    .line 29
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->f:Lv/VDraweeView;

    .line 38
    .line 39
    iget-object v2, p2, Ll/epf;->e:Ljava/lang/String;

    .line 40
    .line 41
    const/16 v3, 0x12

    .line 42
    .line 43
    invoke-virtual {p0, p1, v2, v3}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->Z(Landroid/view/View;Ljava/lang/String;I)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p2, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 49
    .line 50
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    const/4 v2, 0x1

    .line 55
    if-nez p1, :cond_2

    .line 56
    .line 57
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 58
    .line 59
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 60
    .line 61
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v3

    .line 65
    invoke-virtual {p1, v3}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setIndicatorCount(I)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 69
    .line 70
    iget-object v3, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    if-le v3, v2, :cond_1

    .line 77
    .line 78
    move v3, v2

    .line 79
    goto :goto_0

    .line 80
    :cond_1
    move v3, v1

    .line 81
    :goto_0
    invoke-static {p1, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->a0(IZ)V

    .line 85
    .line 86
    .line 87
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result p1

    .line 93
    if-le p1, v2, :cond_2

    .line 94
    .line 95
    iget-object p1, p2, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 96
    .line 97
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 98
    .line 99
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 104
    .line 105
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->W(Lcom/p1/mobile/putong/data/Media;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->m:Landroid/view/View;

    .line 109
    .line 110
    new-instance v1, Ll/hpf;

    .line 111
    .line 112
    invoke-direct {v1, p0, v0}, Ll/hpf;-><init>(Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;Lcom/p1/mobile/putong/data/User;)V

    .line 113
    .line 114
    .line 115
    invoke-static {p1, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 116
    .line 117
    .line 118
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->r:Landroid/widget/TextView;

    .line 119
    .line 120
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 121
    .line 122
    const-string v3, "female"

    .line 123
    .line 124
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-eqz v1, :cond_3

    .line 129
    .line 130
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    sget v4, Ll/dbc0;->B7:I

    .line 135
    .line 136
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    goto :goto_1

    .line 141
    :cond_3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->act()Lcom/p1/mobile/android/app/Act;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    sget v4, Ll/dbc0;->D7:I

    .line 146
    .line 147
    invoke-virtual {v1, v4}, Lcom/p1/mobile/android/app/Act;->drawable(I)Landroid/graphics/drawable/Drawable;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    :goto_1
    invoke-static {p1, v1}, Ll/bnl0;->k(Landroid/widget/TextView;Landroid/graphics/drawable/Drawable;)V

    .line 152
    .line 153
    .line 154
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->r:Landroid/widget/TextView;

    .line 155
    .line 156
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 157
    .line 158
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 159
    .line 160
    .line 161
    move-result v1

    .line 162
    if-eqz v1, :cond_4

    .line 163
    .line 164
    sget v1, Ll/dbc0;->F7:I

    .line 165
    .line 166
    goto :goto_2

    .line 167
    :cond_4
    sget v1, Ll/dbc0;->G7:I

    .line 168
    .line 169
    :goto_2
    invoke-virtual {p1, v1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 170
    .line 171
    .line 172
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->r:Landroid/widget/TextView;

    .line 173
    .line 174
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 175
    .line 176
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 177
    .line 178
    invoke-virtual {v1, v0}, Ll/ina;->z3(Lcom/p1/mobile/putong/data/User;)Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    const-string v3, ""

    .line 183
    .line 184
    if-eqz v1, :cond_5

    .line 185
    .line 186
    goto :goto_3

    .line 187
    :cond_5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 188
    .line 189
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 190
    .line 191
    .line 192
    iget-object v4, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 193
    .line 194
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    :goto_3
    invoke-static {p1, v3}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 205
    .line 206
    .line 207
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->p:Landroid/widget/TextView;

    .line 208
    .line 209
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 210
    .line 211
    invoke-static {p1, v1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 212
    .line 213
    .line 214
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->q:Landroid/widget/TextView;

    .line 215
    .line 216
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 217
    .line 218
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 219
    .line 220
    invoke-virtual {v1, v0}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 221
    .line 222
    .line 223
    move-result v1

    .line 224
    xor-int/2addr v1, v2

    .line 225
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 226
    .line 227
    .line 228
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->q:Landroid/widget/TextView;

    .line 229
    .line 230
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->T(Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    invoke-static {p1, v1}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 235
    .line 236
    .line 237
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->s:Landroid/widget/TextView;

    .line 238
    .line 239
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 240
    .line 241
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 242
    .line 243
    invoke-static {v0}, Ll/q8g0;->j0(Lcom/p1/mobile/putong/data/ProfileZodiac;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    invoke-static {p1, v0}, Ll/bnl0;->H0(Landroid/widget/TextView;Ljava/lang/String;)Z

    .line 248
    .line 249
    .line 250
    iget-object p1, p2, Ll/epf;->e:Ljava/lang/String;

    .line 251
    .line 252
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 253
    .line 254
    .line 255
    move-result p1

    .line 256
    if-nez p1, :cond_6

    .line 257
    .line 258
    iget-object p1, p2, Ll/epf;->e:Ljava/lang/String;

    .line 259
    .line 260
    const-string v0, "#"

    .line 261
    .line 262
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 263
    .line 264
    .line 265
    move-result p1

    .line 266
    if-nez p1, :cond_6

    .line 267
    .line 268
    new-instance p1, Ljava/lang/StringBuilder;

    .line 269
    .line 270
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    iget-object v0, p2, Ll/epf;->e:Ljava/lang/String;

    .line 274
    .line 275
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->setOwnViewOutlineCorner(Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    :cond_6
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->O(Ll/epf;)V

    .line 286
    .line 287
    .line 288
    :cond_7
    :goto_4
    return-void
.end method

.method public final Y(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 2
    .line 3
    iget-object v0, v0, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 14
    .line 15
    iget-object v0, v0, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-le v0, p1, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 26
    .line 27
    iget-object v0, v0, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lcom/p1/mobile/putong/data/Media;

    .line 36
    .line 37
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Picture;

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    check-cast p1, Lcom/p1/mobile/putong/data/Picture;

    .line 42
    .line 43
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 44
    .line 45
    const-string v1, "raw"

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 62
    .line 63
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->f:Lv/VDraweeView;

    .line 64
    .line 65
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_0
    instance-of v0, p1, Lcom/p1/mobile/putong/data/Video;

    .line 72
    .line 73
    if-eqz v0, :cond_1

    .line 74
    .line 75
    check-cast p1, Lcom/p1/mobile/putong/data/Video;

    .line 76
    .line 77
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 78
    .line 79
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 80
    .line 81
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-nez v0, :cond_1

    .line 86
    .line 87
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 88
    .line 89
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->f:Lv/VDraweeView;

    .line 90
    .line 91
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 92
    .line 93
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {v0, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_1
    return-void
.end method

.method public final Z(Landroid/view/View;Ljava/lang/String;I)V
    .locals 1

    .line 1
    const-string p0, "#"

    .line 2
    .line 3
    :try_start_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    :cond_0
    new-instance p0, Landroid/graphics/drawable/GradientDrawable;

    .line 20
    .line 21
    invoke-direct {p0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 22
    .line 23
    .line 24
    int-to-float p3, p3

    .line 25
    invoke-static {p3}, Ll/bnl0;->w(F)I

    .line 26
    .line 27
    .line 28
    move-result p3

    .line 29
    int-to-float p3, p3

    .line 30
    invoke-virtual {p0, p3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 31
    .line 32
    .line 33
    const/4 p3, 0x0

    .line 34
    invoke-virtual {p0, p3}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 35
    .line 36
    .line 37
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    invoke-virtual {p0, p2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, p0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    .line 46
    .line 47
    :catch_0
    return-void
.end method

.method public a0(IZ)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 2
    .line 3
    iget-object v0, v0, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 6
    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    if-ltz p1, :cond_2

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 18
    .line 19
    iget-object v0, v0, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/lit8 v0, v0, -0x1

    .line 28
    .line 29
    if-le p1, v0, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->A:I

    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 35
    .line 36
    if-eqz p2, :cond_1

    .line 37
    .line 38
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->b(I)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setSelectedIndex(I)V

    .line 43
    .line 44
    .line 45
    :goto_0
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->A:I

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->Y(I)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    :goto_1
    const/4 p1, 0x0

    .line 52
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->A:I

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->i:Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;

    .line 55
    .line 56
    if-eqz p2, :cond_3

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->b(I)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/NewPictureContainerIndicator;->setSelectedIndex(I)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public b0()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->A:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    add-int/2addr v0, v1

    .line 5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 6
    .line 7
    iget-object v2, v2, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    sub-int/2addr v2, v1

    .line 16
    if-le v0, v2, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 19
    .line 20
    iget-object v0, v0, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    sub-int/2addr v0, v1

    .line 29
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 30
    .line 31
    iget-object v2, v2, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 32
    .line 33
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_1
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->A:I

    .line 43
    .line 44
    if-ne v2, v0, :cond_2

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->Y(I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->a0(IZ)V

    .line 51
    .line 52
    .line 53
    add-int/2addr v0, v1

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 55
    .line 56
    iget-object v1, v1, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 57
    .line 58
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-ge v0, v1, :cond_3

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 67
    .line 68
    iget-object v1, v1, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 77
    .line 78
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->W(Lcom/p1/mobile/putong/data/Media;)V

    .line 79
    .line 80
    .line 81
    :cond_3
    :goto_0
    return-void
.end method

.method public c0()V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->A:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    sub-int/2addr v0, v1

    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 9
    .line 10
    iget-object v2, v2, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->A:I

    .line 22
    .line 23
    if-eq v2, v0, :cond_3

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 26
    .line 27
    iget-object v2, v2, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 28
    .line 29
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    sub-int/2addr v2, v1

    .line 36
    if-le v0, v2, :cond_2

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->Y(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->a0(IZ)V

    .line 43
    .line 44
    .line 45
    sub-int/2addr v0, v1

    .line 46
    if-ltz v0, :cond_3

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->z:Ll/epf;

    .line 49
    .line 50
    iget-object v1, v1, Ll/epf;->b:Lcom/p1/mobile/putong/data/User;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 59
    .line 60
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->W(Lcom/p1/mobile/putong/data/Media;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    :goto_0
    return-void
.end method

.method public d0(FFFLcom/p1/mobile/putong/core/newui/home/opt/CardProgressAction;)V
    .locals 1

    .line 1
    const/4 p4, 0x0

    .line 2
    cmpl-float v0, p1, p4

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :cond_0
    neg-float p2, p1

    .line 8
    :goto_0
    const/high16 p1, -0x40800000    # -1.0f

    .line 9
    .line 10
    invoke-static {p1, p2}, Ljava/lang/Math;->max(FF)F

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/high16 p2, 0x3f800000    # 1.0f

    .line 15
    .line 16
    invoke-static {p2, p1}, Ljava/lang/Math;->min(FF)F

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    cmpl-float p2, p3, p4

    .line 21
    .line 22
    if-nez p2, :cond_1

    .line 23
    .line 24
    const/4 p4, 0x1

    .line 25
    goto :goto_1

    .line 26
    :cond_1
    const/4 p4, 0x0

    .line 27
    :goto_1
    if-nez p2, :cond_2

    .line 28
    .line 29
    move p3, p1

    .line 30
    :cond_2
    invoke-direct {p0, p4, p3}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->I(ZF)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->B(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/explore/view/ExploreCardItemView;->P()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
