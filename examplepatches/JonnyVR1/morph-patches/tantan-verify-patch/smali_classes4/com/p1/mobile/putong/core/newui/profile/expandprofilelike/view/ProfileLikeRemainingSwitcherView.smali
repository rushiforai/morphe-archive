.class public Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;
.super Landroid/widget/TextSwitcher;
.source "SourceFile"

# interfaces
.implements Landroid/widget/ViewSwitcher$ViewFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;,
        Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$b;
    }
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;

.field public c:I

.field public d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$b;

.field public f:F

.field public g:I

.field public h:Z

.field public i:Z

.field public j:I

.field public k:F

.field public l:F

.field public m:Z

.field public n:I

.field public o:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 38
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/TextSwitcher;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->c:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->h:Z

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->i:Z

    .line 12
    .line 13
    const/16 v2, 0x11

    .line 14
    .line 15
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->j:I

    .line 16
    .line 17
    const v2, 0x3e99999a    # 0.3f

    .line 18
    .line 19
    .line 20
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->k:F

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->l:F

    .line 24
    .line 25
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->m:Z

    .line 26
    .line 27
    const v1, 0x7fffffff

    .line 28
    .line 29
    .line 30
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->n:I

    .line 31
    .line 32
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->o:I

    .line 33
    .line 34
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->f(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->c:I

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->d:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->c:I

    return-void
.end method

.method private getAnimationInFromY()F
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->i:Z

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->k:F

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    neg-float p0, p0

    .line 8
    :cond_0
    return p0
.end method

.method private getAnimationOutToY()F
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->i:Z

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->k:F

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    neg-float p0, p0

    .line 9
    return p0
.end method


# virtual methods
.method public final e(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->a:Landroid/content/Context;

    .line 2
    .line 3
    new-instance v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->d:Ljava/util/List;

    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;

    .line 11
    .line 12
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;-><init>(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;Landroid/os/Looper;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->b:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;

    .line 20
    .line 21
    sget-object v0, Ll/khc0;->j1:[I

    .line 22
    .line 23
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget p2, Ll/khc0;->m1:I

    .line 28
    .line 29
    const/16 v0, 0xd

    .line 30
    .line 31
    invoke-static {v0}, Ll/qa00;->f(I)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    int-to-float p2, p2

    .line 40
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->f:F

    .line 41
    .line 42
    sget p2, Ll/khc0;->l1:I

    .line 43
    .line 44
    const/4 v0, -0x1

    .line 45
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->g:I

    .line 50
    .line 51
    sget p2, Ll/khc0;->k1:I

    .line 52
    .line 53
    const/4 v0, 0x1

    .line 54
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 55
    .line 56
    .line 57
    move-result p2

    .line 58
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->m:Z

    .line 59
    .line 60
    sget p2, Ll/khc0;->o1:I

    .line 61
    .line 62
    const v0, 0x7fffffff

    .line 63
    .line 64
    .line 65
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->n:I

    .line 70
    .line 71
    sget p2, Ll/khc0;->n1:I

    .line 72
    .line 73
    const/16 v0, 0x9c4

    .line 74
    .line 75
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->b:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;

    .line 80
    .line 81
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;->a(I)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0, p0}, Landroid/widget/ViewSwitcher;->setFactory(Landroid/widget/ViewSwitcher$ViewFactory;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->e:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$b;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->d:Ljava/util/List;

    .line 6
    .line 7
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-lez p1, :cond_0

    .line 12
    .line 13
    iget p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->c:I

    .line 14
    .line 15
    const/4 v0, -0x1

    .line 16
    if-eq p1, v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->e:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$b;

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->d:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    rem-int/2addr p1, p0

    .line 27
    invoke-interface {v0, p1}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$b;->a(I)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public g(JZJ)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    move-wide/from16 v3, p4

    .line 6
    .line 7
    iget-boolean v5, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->h:Z

    .line 8
    .line 9
    if-eqz v5, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->d:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    if-nez v5, :cond_4

    .line 19
    .line 20
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->d:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v5

    .line 26
    const/4 v6, 0x1

    .line 27
    if-ne v5, v6, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    new-instance v5, Landroid/view/animation/AnimationSet;

    .line 31
    .line 32
    invoke-direct {v5, v6}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 33
    .line 34
    .line 35
    new-instance v7, Landroid/view/animation/TranslateAnimation;

    .line 36
    .line 37
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->getAnimationInFromY()F

    .line 38
    .line 39
    .line 40
    move-result v13

    .line 41
    const/4 v14, 0x1

    .line 42
    const/4 v15, 0x0

    .line 43
    const/4 v8, 0x1

    .line 44
    const/4 v9, 0x0

    .line 45
    const/4 v10, 0x1

    .line 46
    const/4 v11, 0x0

    .line 47
    const/4 v12, 0x1

    .line 48
    invoke-direct/range {v7 .. v15}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 49
    .line 50
    .line 51
    new-instance v8, Landroid/view/animation/AlphaAnimation;

    .line 52
    .line 53
    iget v9, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->l:F

    .line 54
    .line 55
    const/high16 v10, 0x3f800000    # 1.0f

    .line 56
    .line 57
    invoke-direct {v8, v9, v10}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v5, v7}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v5, v8}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v5, v1, v2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 67
    .line 68
    .line 69
    const-wide/16 v7, 0x0

    .line 70
    .line 71
    if-eqz p3, :cond_2

    .line 72
    .line 73
    cmp-long v9, v3, v7

    .line 74
    .line 75
    if-lez v9, :cond_2

    .line 76
    .line 77
    invoke-virtual {v5, v3, v4}, Landroid/view/animation/AnimationSet;->setStartOffset(J)V

    .line 78
    .line 79
    .line 80
    :cond_2
    new-instance v9, Landroid/view/animation/AnimationSet;

    .line 81
    .line 82
    invoke-direct {v9, v6}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 83
    .line 84
    .line 85
    new-instance v11, Landroid/view/animation/TranslateAnimation;

    .line 86
    .line 87
    const/16 v18, 0x1

    .line 88
    .line 89
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->getAnimationOutToY()F

    .line 90
    .line 91
    .line 92
    move-result v19

    .line 93
    const/4 v12, 0x1

    .line 94
    const/4 v13, 0x0

    .line 95
    const/4 v14, 0x1

    .line 96
    const/4 v15, 0x0

    .line 97
    const/16 v16, 0x1

    .line 98
    .line 99
    const/16 v17, 0x0

    .line 100
    .line 101
    invoke-direct/range {v11 .. v19}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 102
    .line 103
    .line 104
    new-instance v6, Landroid/view/animation/AlphaAnimation;

    .line 105
    .line 106
    iget v12, v0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->l:F

    .line 107
    .line 108
    invoke-direct {v6, v10, v12}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v9, v11}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v9, v6}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v9, v1, v2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 118
    .line 119
    .line 120
    if-eqz p3, :cond_3

    .line 121
    .line 122
    cmp-long v1, v3, v7

    .line 123
    .line 124
    if-lez v1, :cond_3

    .line 125
    .line 126
    invoke-virtual {v9, v3, v4}, Landroid/view/animation/AnimationSet;->setStartOffset(J)V

    .line 127
    .line 128
    .line 129
    :cond_3
    invoke-virtual {v0, v5}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v0, v9}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_4
    :goto_0
    const/4 v1, 0x0

    .line 137
    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public h()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->n:I

    .line 7
    .line 8
    const v1, 0x7fffffff

    .line 9
    .line 10
    .line 11
    if-ge v0, v1, :cond_1

    .line 12
    .line 13
    const/4 v0, -0x1

    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->o:I

    .line 15
    .line 16
    :cond_1
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->h:Z

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->b:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public i()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->h:Z

    .line 3
    .line 4
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->n:I

    .line 5
    .line 6
    const v2, 0x7fffffff

    .line 7
    .line 8
    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    const/4 v1, -0x1

    .line 12
    iput v1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->o:I

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->b:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public makeView()Landroid/view/View;
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->a:Landroid/content/Context;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 9
    .line 10
    sget v2, Ll/bnl0;->e:I

    .line 11
    .line 12
    invoke-direct {v1, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 13
    .line 14
    .line 15
    const/16 v2, 0x11

    .line 16
    .line 17
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 20
    .line 21
    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->j:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 25
    .line 26
    .line 27
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->g:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->f:F

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 36
    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 43
    .line 44
    .line 45
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->m:Z

    .line 46
    .line 47
    if-eqz v2, :cond_0

    .line 48
    .line 49
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 52
    .line 53
    .line 54
    :cond_0
    sget-object v2, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 60
    .line 61
    .line 62
    new-instance v1, Ll/k1a0;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/k1a0;-><init>(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    return-object v0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->b:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$a;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setAnimateDirection(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public setInOutAnimation(J)V
    .locals 6

    .line 1
    const/4 v3, 0x0

    .line 2
    const-wide/16 v4, 0x0

    .line 3
    .line 4
    move-object v0, p0

    .line 5
    move-wide v1, p1

    .line 6
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->g(JZJ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setOnItemClickListener(Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->e:Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView$b;

    .line 2
    .line 3
    return-void
.end method

.method public setOutAlpha(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->l:F

    .line 2
    .line 3
    return-void
.end method

.method public setOutTranslateY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->k:F

    .line 2
    .line 3
    return-void
.end method

.method public setTextGravity(I)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->j:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Landroid/widget/TextView;

    .line 15
    .line 16
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 17
    .line 18
    .line 19
    add-int/lit8 v1, v1, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method

.method public setTextList(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    const/4 p1, -0x1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/profile/expandprofilelike/view/ProfileLikeRemainingSwitcherView;->c:I

    .line 18
    .line 19
    return-void
.end method
