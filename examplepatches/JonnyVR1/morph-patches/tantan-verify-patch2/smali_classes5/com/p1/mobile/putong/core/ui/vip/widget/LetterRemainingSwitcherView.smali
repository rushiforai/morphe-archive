.class public Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;
.super Landroid/widget/TextSwitcher;
.source "SourceFile"

# interfaces
.implements Landroid/widget/ViewSwitcher$ViewFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$a;,
        Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$b;
    }
.end annotation


# instance fields
.field public a:Landroid/content/Context;

.field public b:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$a;

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

.field public e:F

.field public f:I

.field public g:Z

.field public h:Z

.field public i:I

.field public j:F

.field public k:F

.field public l:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 31
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/TextSwitcher;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->c:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->g:Z

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->h:Z

    .line 12
    .line 13
    const/16 v1, 0x11

    .line 14
    .line 15
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->i:I

    .line 16
    .line 17
    const v1, 0x3e99999a    # 0.3f

    .line 18
    .line 19
    .line 20
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->j:F

    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->k:F

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->l:Z

    .line 26
    .line 27
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->e(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->f(Landroid/view/View;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->c:I

    return p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->d:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->c:I

    return-void
.end method

.method private getAnimationInFromY()F
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->h:Z

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->j:F

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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->h:Z

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->j:F

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->a:Landroid/content/Context;

    .line 2
    .line 3
    new-instance v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->d:Ljava/util/List;

    .line 9
    .line 10
    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$a;

    .line 11
    .line 12
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$a;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;Landroid/os/Looper;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->b:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$a;

    .line 20
    .line 21
    sget-object v0, Ll/xhc0;->p:[I

    .line 22
    .line 23
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    sget p2, Ll/xhc0;->s:I

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
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->e:F

    .line 41
    .line 42
    sget p2, Ll/xhc0;->r:I

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
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->f:I

    .line 50
    .line 51
    sget p2, Ll/xhc0;->q:I

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
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->l:Z

    .line 59
    .line 60
    sget p2, Ll/xhc0;->t:I

    .line 61
    .line 62
    const/16 v0, 0x9c4

    .line 63
    .line 64
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->b:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$a;

    .line 69
    .line 70
    invoke-virtual {v0, p2}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$a;->a(I)V

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0, p0}, Landroid/widget/ViewSwitcher;->setFactory(Landroid/widget/ViewSwitcher$ViewFactory;)V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
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
    iget-boolean v5, v0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->g:Z

    .line 8
    .line 9
    if-eqz v5, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->d:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v5}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    if-nez v5, :cond_3

    .line 19
    .line 20
    iget-object v5, v0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->d:Ljava/util/List;

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
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->getAnimationInFromY()F

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
    iget v9, v0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->k:F

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
    if-eqz p3, :cond_2

    .line 70
    .line 71
    const-wide/16 v7, 0x0

    .line 72
    .line 73
    cmp-long v7, v3, v7

    .line 74
    .line 75
    if-lez v7, :cond_2

    .line 76
    .line 77
    invoke-virtual {v5, v3, v4}, Landroid/view/animation/AnimationSet;->setStartOffset(J)V

    .line 78
    .line 79
    .line 80
    :cond_2
    new-instance v3, Landroid/view/animation/AnimationSet;

    .line 81
    .line 82
    invoke-direct {v3, v6}, Landroid/view/animation/AnimationSet;-><init>(Z)V

    .line 83
    .line 84
    .line 85
    new-instance v11, Landroid/view/animation/TranslateAnimation;

    .line 86
    .line 87
    const/16 v18, 0x1

    .line 88
    .line 89
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->getAnimationOutToY()F

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
    new-instance v4, Landroid/view/animation/AlphaAnimation;

    .line 105
    .line 106
    iget v6, v0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->k:F

    .line 107
    .line 108
    invoke-direct {v4, v10, v6}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v3, v11}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v3, v4}, Landroid/view/animation/AnimationSet;->addAnimation(Landroid/view/animation/Animation;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {v3, v1, v2}, Landroid/view/animation/AnimationSet;->setDuration(J)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v5}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v3}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :cond_3
    :goto_0
    const/4 v1, 0x0

    .line 128
    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v0, v1}, Landroid/widget/ViewAnimator;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 132
    .line 133
    .line 134
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->g:Z

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->b:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$a;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    invoke-virtual {p0, v0}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->g:Z

    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->b:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$a;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public makeView()Landroid/view/View;
    .locals 3

    .line 1
    new-instance v0, Landroid/widget/TextView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->a:Landroid/content/Context;

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
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->i:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 25
    .line 26
    .line 27
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->f:I

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 30
    .line 31
    .line 32
    const/4 v1, 0x0

    .line 33
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->e:F

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
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->l:Z

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
    new-instance v1, Ll/edr;

    .line 63
    .line 64
    invoke-direct {v1, p0}, Ll/edr;-><init>(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;)V

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->b:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$a;

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
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->h:Z

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
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->g(JZJ)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public setIntervalMills(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->b:Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$a;->a(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setOnItemClickListener(Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView$b;)V
    .locals 0

    return-void
.end method

.method public setOutAlpha(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->k:F

    .line 2
    .line 3
    return-void
.end method

.method public setOutTranslateY(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->j:F

    .line 2
    .line 3
    return-void
.end method

.method public setTextBold(Z)V
    .locals 3

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->l:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    if-ge v0, p1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    instance-of v1, v1, Landroid/widget/TextView;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Landroid/widget/TextView;

    .line 23
    .line 24
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 25
    .line 26
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    return-void
.end method

.method public setTextColor(I)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->f:I

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
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    instance-of v2, v2, Landroid/widget/TextView;

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return-void
.end method

.method public setTextGravity(I)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->i:I

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
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    instance-of v2, v2, Landroid/widget/TextView;

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Landroid/widget/TextView;

    .line 23
    .line 24
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 25
    .line 26
    .line 27
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->d:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->d:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    const/4 p1, -0x1

    .line 17
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/LetterRemainingSwitcherView;->c:I

    .line 18
    .line 19
    return-void
.end method
