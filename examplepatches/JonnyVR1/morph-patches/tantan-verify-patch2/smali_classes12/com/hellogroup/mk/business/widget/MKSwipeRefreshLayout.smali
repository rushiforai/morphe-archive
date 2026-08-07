.class public Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"

# interfaces
.implements Ll/ei20;
.implements Ll/ai20;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$i;,
        Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$j;
    }
.end annotation


# static fields
.field private static final P:Ljava/lang/String; = "MKSwipeRefreshLayout"

.field private static final Q:[I


# instance fields
.field A:I

.field B:I

.field C:Ll/c55;

.field private D:Landroid/view/animation/Animation;

.field private E:Landroid/view/animation/Animation;

.field private F:Landroid/view/animation/Animation;

.field private G:Landroid/view/animation/Animation;

.field private H:Landroid/view/animation/Animation;

.field I:Z

.field private J:I

.field K:Z

.field private L:Ljava/lang/Boolean;

.field private M:Landroid/view/animation/Animation$AnimationListener;

.field private final N:Landroid/view/animation/Animation;

.field private final O:Landroid/view/animation/Animation;

.field private a:Landroid/view/View;

.field b:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$j;

.field c:Z

.field private d:I

.field private e:F

.field private f:F

.field private final g:Ll/fi20;

.field private final h:Ll/bi20;

.field private final i:[I

.field private final j:[I

.field private k:Z

.field private l:I

.field m:I

.field private n:F

.field private o:F

.field private p:F

.field private q:Z

.field private r:I

.field s:Z

.field private t:Z

.field private final u:Landroid/view/animation/DecelerateInterpolator;

.field v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

.field private w:I

.field protected x:I

.field y:F

.field protected z:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const v0, 0x101000e

    .line 2
    .line 3
    .line 4
    filled-new-array {v0}, [I

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    sput-object v0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->Q:[I

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 165
    invoke-direct {p0, p1, v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c:Z

    .line 6
    .line 7
    const/high16 v1, -0x40800000    # -1.0f

    .line 8
    .line 9
    iput v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->e:F

    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    new-array v2, v1, [I

    .line 13
    .line 14
    iput-object v2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->i:[I

    .line 15
    .line 16
    new-array v1, v1, [I

    .line 17
    .line 18
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->j:[I

    .line 19
    .line 20
    const/4 v1, -0x1

    .line 21
    iput v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->r:I

    .line 22
    .line 23
    iput v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->w:I

    .line 24
    .line 25
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 26
    .line 27
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->L:Ljava/lang/Boolean;

    .line 28
    .line 29
    new-instance v1, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$a;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$a;-><init>(Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;)V

    .line 32
    .line 33
    .line 34
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->M:Landroid/view/animation/Animation$AnimationListener;

    .line 35
    .line 36
    new-instance v1, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$f;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$f;-><init>(Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;)V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->N:Landroid/view/animation/Animation;

    .line 42
    .line 43
    new-instance v1, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$g;

    .line 44
    .line 45
    invoke-direct {v1, p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$g;-><init>(Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;)V

    .line 46
    .line 47
    .line 48
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->O:Landroid/view/animation/Animation;

    .line 49
    .line 50
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {v1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iput v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->d:I

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    const v2, 0x10e0001

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iput v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->l:I

    .line 72
    .line 73
    invoke-virtual {p0, v0}, Landroid/view/View;->setWillNotDraw(Z)V

    .line 74
    .line 75
    .line 76
    new-instance v1, Landroid/view/animation/DecelerateInterpolator;

    .line 77
    .line 78
    const/high16 v2, 0x40000000    # 2.0f

    .line 79
    .line 80
    invoke-direct {v1, v2}, Landroid/view/animation/DecelerateInterpolator;-><init>(F)V

    .line 81
    .line 82
    .line 83
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->u:Landroid/view/animation/DecelerateInterpolator;

    .line 84
    .line 85
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    const/high16 v2, 0x42200000    # 40.0f

    .line 94
    .line 95
    iget v3, v1, Landroid/util/DisplayMetrics;->density:F

    .line 96
    .line 97
    mul-float/2addr v3, v2

    .line 98
    float-to-int v2, v3

    .line 99
    iput v2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->J:I

    .line 100
    .line 101
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->e()V

    .line 102
    .line 103
    .line 104
    const/4 v2, 0x1

    .line 105
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->setChildrenDrawingOrderEnabled(Z)V

    .line 106
    .line 107
    .line 108
    const/high16 v3, 0x42800000    # 64.0f

    .line 109
    .line 110
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 111
    .line 112
    mul-float/2addr v1, v3

    .line 113
    float-to-int v1, v1

    .line 114
    iput v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->A:I

    .line 115
    .line 116
    int-to-float v1, v1

    .line 117
    iput v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->e:F

    .line 118
    .line 119
    new-instance v1, Ll/fi20;

    .line 120
    .line 121
    invoke-direct {v1, p0}, Ll/fi20;-><init>(Landroid/view/ViewGroup;)V

    .line 122
    .line 123
    .line 124
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->g:Ll/fi20;

    .line 125
    .line 126
    new-instance v1, Ll/bi20;

    .line 127
    .line 128
    invoke-direct {v1, p0}, Ll/bi20;-><init>(Landroid/view/View;)V

    .line 129
    .line 130
    .line 131
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->h:Ll/bi20;

    .line 132
    .line 133
    invoke-virtual {p0, v2}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setNestedScrollingEnabled(Z)V

    .line 134
    .line 135
    .line 136
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->J:I

    .line 137
    .line 138
    neg-int v1, v1

    .line 139
    iput v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->m:I

    .line 140
    .line 141
    iput v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->z:I

    .line 142
    .line 143
    const/high16 v1, 0x3f800000    # 1.0f

    .line 144
    .line 145
    invoke-virtual {p0, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->k(F)V

    .line 146
    .line 147
    .line 148
    sget-object v1, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->Q:[I

    .line 149
    .line 150
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-virtual {p1, v0, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    invoke-virtual {p0, p2}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setEnabled(Z)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method private a(ILandroid/view/animation/Animation$AnimationListener;)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->x:I

    .line 2
    .line 3
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->N:Landroid/view/animation/Animation;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/animation/Animation;->reset()V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->N:Landroid/view/animation/Animation;

    .line 9
    .line 10
    const-wide/16 v0, 0xc8

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->N:Landroid/view/animation/Animation;

    .line 16
    .line 17
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->u:Landroid/view/animation/DecelerateInterpolator;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 20
    .line 21
    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 25
    .line 26
    invoke-virtual {p1, p2}, Lcom/hellogroup/mk/business/widget/MKCircleImageView;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->N:Landroid/view/animation/Animation;

    .line 37
    .line 38
    invoke-virtual {p1, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method private b(ILandroid/view/animation/Animation$AnimationListener;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->s:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->u(ILandroid/view/animation/Animation$AnimationListener;)V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->x:I

    .line 10
    .line 11
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->O:Landroid/view/animation/Animation;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/animation/Animation;->reset()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->O:Landroid/view/animation/Animation;

    .line 17
    .line 18
    const-wide/16 v0, 0xc8

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->O:Landroid/view/animation/Animation;

    .line 24
    .line 25
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->u:Landroid/view/animation/DecelerateInterpolator;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    .line 28
    .line 29
    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 33
    .line 34
    invoke-virtual {p1, p2}, Lcom/hellogroup/mk/business/widget/MKCircleImageView;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 40
    .line 41
    .line 42
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->O:Landroid/view/animation/Animation;

    .line 45
    .line 46
    invoke-virtual {p1, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private e()V
    .locals 3

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const v2, -0x50506

    .line 8
    .line 9
    .line 10
    invoke-direct {v0, v1, v2}, Lcom/hellogroup/mk/business/widget/MKCircleImageView;-><init>(Landroid/content/Context;I)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 14
    .line 15
    new-instance v0, Ll/c55;

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-direct {v0, v1}, Ll/c55;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    invoke-virtual {v0, v1}, Ll/c55;->l(I)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 38
    .line 39
    const/16 v1, 0x8

    .line 40
    .line 41
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 45
    .line 46
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->addView(Landroid/view/View;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private f()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->a:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-ge v0, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    iput-object v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->a:Landroid/view/View;

    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return-void
.end method

.method private g(F)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->e:F

    .line 2
    .line 3
    cmpl-float p1, p1, v0

    .line 4
    .line 5
    if-lez p1, :cond_0

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    invoke-direct {p0, p1, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->o(ZZ)V

    .line 9
    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c:Z

    .line 14
    .line 15
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {v0, v1, v1}, Ll/c55;->j(FF)V

    .line 19
    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->s:Z

    .line 22
    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    new-instance v0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$e;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$e;-><init>(Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 v0, 0x0

    .line 32
    :goto_0
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->m:I

    .line 33
    .line 34
    invoke-direct {p0, v1, v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->b(ILandroid/view/animation/Animation$AnimationListener;)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ll/c55;->d(Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private h(Landroid/view/animation/Animation;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/view/animation/Animation;->hasStarted()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/animation/Animation;->hasEnded()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method private j(F)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Ll/c55;->d(Z)V

    .line 5
    .line 6
    .line 7
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->e:F

    .line 8
    .line 9
    div-float v0, p1, v0

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/high16 v1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    float-to-double v2, v0

    .line 22
    const-wide v4, 0x3fd999999999999aL    # 0.4

    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    sub-double/2addr v2, v4

    .line 28
    const-wide/16 v4, 0x0

    .line 29
    .line 30
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(DD)D

    .line 31
    .line 32
    .line 33
    move-result-wide v2

    .line 34
    double-to-float v2, v2

    .line 35
    const/high16 v3, 0x40a00000    # 5.0f

    .line 36
    .line 37
    mul-float/2addr v2, v3

    .line 38
    const/high16 v3, 0x40400000    # 3.0f

    .line 39
    .line 40
    div-float/2addr v2, v3

    .line 41
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    iget v4, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->e:F

    .line 46
    .line 47
    sub-float/2addr v3, v4

    .line 48
    iget v4, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->B:I

    .line 49
    .line 50
    if-lez v4, :cond_0

    .line 51
    .line 52
    int-to-float v4, v4

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    iget-boolean v4, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->K:Z

    .line 55
    .line 56
    iget v5, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->A:I

    .line 57
    .line 58
    if-eqz v4, :cond_1

    .line 59
    .line 60
    iget v4, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->z:I

    .line 61
    .line 62
    sub-int/2addr v5, v4

    .line 63
    :cond_1
    int-to-float v4, v5

    .line 64
    :goto_0
    const/high16 v5, 0x40000000    # 2.0f

    .line 65
    .line 66
    mul-float v6, v4, v5

    .line 67
    .line 68
    invoke-static {v3, v6}, Ljava/lang/Math;->min(FF)F

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    div-float/2addr v3, v4

    .line 73
    const/4 v6, 0x0

    .line 74
    invoke-static {v6, v3}, Ljava/lang/Math;->max(FF)F

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    const/high16 v7, 0x40800000    # 4.0f

    .line 79
    .line 80
    div-float/2addr v3, v7

    .line 81
    float-to-double v7, v3

    .line 82
    const-wide/high16 v9, 0x4000000000000000L    # 2.0

    .line 83
    .line 84
    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->pow(DD)D

    .line 85
    .line 86
    .line 87
    move-result-wide v9

    .line 88
    sub-double/2addr v7, v9

    .line 89
    double-to-float v3, v7

    .line 90
    mul-float/2addr v3, v5

    .line 91
    mul-float v7, v4, v3

    .line 92
    .line 93
    mul-float/2addr v7, v5

    .line 94
    iget v8, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->z:I

    .line 95
    .line 96
    mul-float/2addr v4, v0

    .line 97
    add-float/2addr v4, v7

    .line 98
    float-to-int v0, v4

    .line 99
    add-int/2addr v8, v0

    .line 100
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 101
    .line 102
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-eqz v0, :cond_2

    .line 107
    .line 108
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 109
    .line 110
    const/4 v4, 0x0

    .line 111
    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 112
    .line 113
    .line 114
    :cond_2
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->s:Z

    .line 115
    .line 116
    if-nez v0, :cond_3

    .line 117
    .line 118
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleX(F)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 124
    .line 125
    invoke-virtual {v0, v1}, Landroid/view/View;->setScaleY(F)V

    .line 126
    .line 127
    .line 128
    :cond_3
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->s:Z

    .line 129
    .line 130
    if-eqz v0, :cond_4

    .line 131
    .line 132
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->e:F

    .line 133
    .line 134
    div-float v0, p1, v0

    .line 135
    .line 136
    invoke-static {v1, v0}, Ljava/lang/Math;->min(FF)F

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setAnimationProgress(F)V

    .line 141
    .line 142
    .line 143
    :cond_4
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->e:F

    .line 144
    .line 145
    cmpg-float p1, p1, v0

    .line 146
    .line 147
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 148
    .line 149
    if-gez p1, :cond_5

    .line 150
    .line 151
    invoke-virtual {v0}, Ll/c55;->getAlpha()I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    const/16 v0, 0x4c

    .line 156
    .line 157
    if-le p1, v0, :cond_6

    .line 158
    .line 159
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->F:Landroid/view/animation/Animation;

    .line 160
    .line 161
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->h(Landroid/view/animation/Animation;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-nez p1, :cond_6

    .line 166
    .line 167
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->s()V

    .line 168
    .line 169
    .line 170
    goto :goto_1

    .line 171
    :cond_5
    invoke-virtual {v0}, Ll/c55;->getAlpha()I

    .line 172
    .line 173
    .line 174
    move-result p1

    .line 175
    const/16 v0, 0xff

    .line 176
    .line 177
    if-ge p1, v0, :cond_6

    .line 178
    .line 179
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->G:Landroid/view/animation/Animation;

    .line 180
    .line 181
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->h(Landroid/view/animation/Animation;)Z

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    if-nez p1, :cond_6

    .line 186
    .line 187
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->r()V

    .line 188
    .line 189
    .line 190
    :cond_6
    :goto_1
    const p1, 0x3f4ccccd    # 0.8f

    .line 191
    .line 192
    .line 193
    mul-float v0, v2, p1

    .line 194
    .line 195
    iget-object v4, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 196
    .line 197
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    invoke-virtual {v4, v6, p1}, Ll/c55;->j(FF)V

    .line 202
    .line 203
    .line 204
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 205
    .line 206
    invoke-static {v1, v2}, Ljava/lang/Math;->min(FF)F

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    invoke-virtual {p1, v0}, Ll/c55;->e(F)V

    .line 211
    .line 212
    .line 213
    const p1, 0x3ecccccd    # 0.4f

    .line 214
    .line 215
    .line 216
    mul-float/2addr v2, p1

    .line 217
    const/high16 p1, -0x41800000    # -0.25f

    .line 218
    .line 219
    add-float/2addr v2, p1

    .line 220
    mul-float/2addr v3, v5

    .line 221
    add-float/2addr v2, v3

    .line 222
    const/high16 p1, 0x3f000000    # 0.5f

    .line 223
    .line 224
    mul-float/2addr v2, p1

    .line 225
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 226
    .line 227
    invoke-virtual {p1, v2}, Ll/c55;->g(F)V

    .line 228
    .line 229
    .line 230
    iget p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->m:I

    .line 231
    .line 232
    sub-int/2addr v8, p1

    .line 233
    invoke-virtual {p0, v8}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setTargetOffsetTopAndBottom(I)V

    .line 234
    .line 235
    .line 236
    return-void
.end method

.method private l(Landroid/view/MotionEvent;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget v2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->r:I

    .line 10
    .line 11
    if-ne v1, v2, :cond_1

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->r:I

    .line 23
    .line 24
    :cond_1
    return-void
.end method

.method private o(ZZ)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_1

    .line 4
    .line 5
    iput-boolean p2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->I:Z

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f()V

    .line 8
    .line 9
    .line 10
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c:Z

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->m:I

    .line 15
    .line 16
    iget-object p2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->M:Landroid/view/animation/Animation$AnimationListener;

    .line 17
    .line 18
    invoke-direct {p0, p1, p2}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->a(ILandroid/view/animation/Animation$AnimationListener;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->M:Landroid/view/animation/Animation$AnimationListener;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->t(Landroid/view/animation/Animation$AnimationListener;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method private p(II)Landroid/view/animation/Animation;
    .locals 1

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$d;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$d;-><init>(Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;II)V

    .line 4
    .line 5
    .line 6
    const-wide/16 p1, 0x12c

    .line 7
    .line 8
    invoke-virtual {v0, p1, p2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 12
    .line 13
    const/4 p2, 0x0

    .line 14
    invoke-virtual {p1, p2}, Lcom/hellogroup/mk/business/widget/MKCircleImageView;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 25
    .line 26
    .line 27
    return-object v0
.end method

.method private q(F)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->o:F

    .line 2
    .line 3
    sub-float/2addr p1, v0

    .line 4
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->d:I

    .line 5
    .line 6
    int-to-float v2, v1

    .line 7
    cmpl-float p1, p1, v2

    .line 8
    .line 9
    if-lez p1, :cond_0

    .line 10
    .line 11
    iget-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->q:Z

    .line 12
    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    int-to-float p1, v1

    .line 16
    add-float/2addr v0, p1

    .line 17
    iput v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->n:F

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->q:Z

    .line 21
    .line 22
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 23
    .line 24
    const/16 p1, 0x4c

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/c55;->setAlpha(I)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private r()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/c55;->getAlpha()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0xff

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->p(II)Landroid/view/animation/Animation;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->G:Landroid/view/animation/Animation;

    .line 14
    .line 15
    return-void
.end method

.method private s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/c55;->getAlpha()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x4c

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->p(II)Landroid/view/animation/Animation;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->F:Landroid/view/animation/Animation;

    .line 14
    .line 15
    return-void
.end method

.method private setColorViewAlpha(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/c55;->setAlpha(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private u(ILandroid/view/animation/Animation$AnimationListener;)V
    .locals 2

    .line 1
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->x:I

    .line 2
    .line 3
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->y:F

    .line 10
    .line 11
    new-instance p1, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$h;

    .line 12
    .line 13
    invoke-direct {p1, p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$h;-><init>(Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;)V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->H:Landroid/view/animation/Animation;

    .line 17
    .line 18
    const-wide/16 v0, 0x96

    .line 19
    .line 20
    invoke-virtual {p1, v0, v1}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 21
    .line 22
    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 26
    .line 27
    invoke-virtual {p1, p2}, Lcom/hellogroup/mk/business/widget/MKCircleImageView;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->H:Landroid/view/animation/Animation;

    .line 38
    .line 39
    invoke-virtual {p1, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method private v(Landroid/view/animation/Animation$AnimationListener;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 8
    .line 9
    const/16 v1, 0xff

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ll/c55;->setAlpha(I)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$b;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$b;-><init>(Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->D:Landroid/view/animation/Animation;

    .line 20
    .line 21
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->l:I

    .line 22
    .line 23
    int-to-long v1, v1

    .line 24
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 25
    .line 26
    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Lcom/hellogroup/mk/business/widget/MKCircleImageView;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 40
    .line 41
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->D:Landroid/view/animation/Animation;

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public addView(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->d()V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public c()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->a:Landroid/view/View;

    .line 2
    .line 3
    instance-of v0, p0, Landroid/widget/ListView;

    .line 4
    .line 5
    const/4 v1, -0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p0, Landroid/widget/ListView;

    .line 9
    .line 10
    invoke-static {p0, v1}, Ll/gpr;->a(Landroid/widget/ListView;I)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p0, v1}, Landroid/view/View;->canScrollVertically(I)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->a:Landroid/view/View;

    .line 3
    .line 4
    return-void
.end method

.method public dispatchNestedFling(FFZ)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->h:Ll/bi20;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/bi20;->a(FFZ)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public dispatchNestedPreFling(FF)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->h:Ll/bi20;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/bi20;->b(FF)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public dispatchNestedPreScroll(II[I[I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->h:Ll/bi20;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/bi20;->c(II[I[I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public dispatchNestedScroll(IIII[I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->h:Ll/bi20;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/bi20;->f(IIII[I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getChildDrawingOrder(II)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->w:I

    .line 2
    .line 3
    if-gez p0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    add-int/lit8 p1, p1, -0x1

    .line 7
    .line 8
    if-ne p2, p1, :cond_1

    .line 9
    .line 10
    return p0

    .line 11
    :cond_1
    if-lt p2, p0, :cond_2

    .line 12
    .line 13
    add-int/lit8 p2, p2, 0x1

    .line 14
    .line 15
    :cond_2
    :goto_0
    return p2
.end method

.method public getNestedScrollAxes()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->g:Ll/fi20;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/fi20;->a()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getProgressCircleDiameter()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->J:I

    .line 2
    .line 3
    return p0
.end method

.method public getProgressViewEndOffset()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->A:I

    .line 2
    .line 3
    return p0
.end method

.method public getProgressViewStartOffset()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->z:I

    .line 2
    .line 3
    return p0
.end method

.method public hasNestedScrollingParent()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->h:Ll/bi20;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bi20;->k()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public isNestedScrollingEnabled()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->h:Ll/bi20;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bi20;->m()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public k(F)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->x:I

    .line 2
    .line 3
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->z:I

    .line 4
    .line 5
    sub-int/2addr v1, v0

    .line 6
    int-to-float v1, v1

    .line 7
    mul-float/2addr v1, p1

    .line 8
    float-to-int p1, v1

    .line 9
    add-int/2addr v0, p1

    .line 10
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    sub-int/2addr v0, p1

    .line 17
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setTargetOffsetTopAndBottom(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/c55;->stop()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 12
    .line 13
    const/16 v1, 0x8

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    const/16 v0, 0xff

    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setColorViewAlpha(I)V

    .line 21
    .line 22
    .line 23
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->s:Z

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setAnimationProgress(F)V

    .line 29
    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->z:I

    .line 33
    .line 34
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->m:I

    .line 35
    .line 36
    sub-int/2addr v0, v1

    .line 37
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setTargetOffsetTopAndBottom(I)V

    .line 38
    .line 39
    .line 40
    :goto_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->m:I

    .line 47
    .line 48
    return-void
.end method

.method public n(ZI)V
    .locals 0

    .line 1
    iput p2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->A:I

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->s:Z

    .line 4
    .line 5
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->m()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->t:Z

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->t:Z

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_c

    .line 22
    .line 23
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->t:Z

    .line 24
    .line 25
    if-nez v1, :cond_c

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-nez v1, :cond_c

    .line 32
    .line 33
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c:Z

    .line 34
    .line 35
    if-nez v1, :cond_c

    .line 36
    .line 37
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->k:Z

    .line 38
    .line 39
    if-eqz v1, :cond_1

    .line 40
    .line 41
    goto/16 :goto_1

    .line 42
    .line 43
    :cond_1
    if-eqz v0, :cond_a

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    const/4 v3, -0x1

    .line 47
    if-eq v0, v1, :cond_8

    .line 48
    .line 49
    const/4 v1, 0x2

    .line 50
    if-eq v0, v1, :cond_3

    .line 51
    .line 52
    const/4 v1, 0x3

    .line 53
    if-eq v0, v1, :cond_9

    .line 54
    .line 55
    const/4 v1, 0x6

    .line 56
    if-eq v0, v1, :cond_2

    .line 57
    .line 58
    goto/16 :goto_0

    .line 59
    .line 60
    :cond_2
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->l(Landroid/view/MotionEvent;)V

    .line 61
    .line 62
    .line 63
    goto/16 :goto_0

    .line 64
    .line 65
    :cond_3
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->r:I

    .line 66
    .line 67
    if-ne v0, v3, :cond_4

    .line 68
    .line 69
    sget-object p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->P:Ljava/lang/String;

    .line 70
    .line 71
    const-string p1, "Got ACTION_MOVE event but don\'t have an active pointer id."

    .line 72
    .line 73
    invoke-static {p0, p1}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    return v2

    .line 77
    :cond_4
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-gez v0, :cond_5

    .line 82
    .line 83
    return v2

    .line 84
    :cond_5
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->L:Ljava/lang/Boolean;

    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_6

    .line 91
    .line 92
    return v2

    .line 93
    :cond_6
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->p:F

    .line 102
    .line 103
    sub-float/2addr p1, v0

    .line 104
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->o:F

    .line 109
    .line 110
    sub-float v0, v1, v0

    .line 111
    .line 112
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    iget v3, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->d:I

    .line 117
    .line 118
    int-to-float v3, v3

    .line 119
    cmpl-float v3, p1, v3

    .line 120
    .line 121
    if-lez v3, :cond_7

    .line 122
    .line 123
    cmpl-float p1, p1, v0

    .line 124
    .line 125
    if-lez p1, :cond_7

    .line 126
    .line 127
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 128
    .line 129
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->L:Ljava/lang/Boolean;

    .line 130
    .line 131
    return v2

    .line 132
    :cond_7
    invoke-direct {p0, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->q(F)V

    .line 133
    .line 134
    .line 135
    goto :goto_0

    .line 136
    :cond_8
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 137
    .line 138
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->L:Ljava/lang/Boolean;

    .line 139
    .line 140
    :cond_9
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->q:Z

    .line 141
    .line 142
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 143
    .line 144
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->L:Ljava/lang/Boolean;

    .line 145
    .line 146
    iput v3, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->r:I

    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_a
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->z:I

    .line 150
    .line 151
    iget-object v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 152
    .line 153
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 154
    .line 155
    .line 156
    move-result v1

    .line 157
    sub-int/2addr v0, v1

    .line 158
    invoke-virtual {p0, v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setTargetOffsetTopAndBottom(I)V

    .line 159
    .line 160
    .line 161
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    iput v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->r:I

    .line 166
    .line 167
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->q:Z

    .line 168
    .line 169
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    if-gez v0, :cond_b

    .line 174
    .line 175
    return v2

    .line 176
    :cond_b
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    iput v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->o:F

    .line 181
    .line 182
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getX(I)F

    .line 183
    .line 184
    .line 185
    move-result p1

    .line 186
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->p:F

    .line 187
    .line 188
    :goto_0
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->q:Z

    .line 189
    .line 190
    return p0

    .line 191
    :cond_c
    :goto_1
    return v2
.end method

.method public onLayout(ZIIII)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object p3, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->a:Landroid/view/View;

    .line 17
    .line 18
    if-nez p3, :cond_1

    .line 19
    .line 20
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f()V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p3, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->a:Landroid/view/View;

    .line 24
    .line 25
    if-nez p3, :cond_2

    .line 26
    .line 27
    :goto_0
    return-void

    .line 28
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 29
    .line 30
    .line 31
    move-result p4

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 33
    .line 34
    .line 35
    move-result p5

    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    sub-int v0, p1, v0

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    sub-int/2addr v0, v1

    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    sub-int/2addr p2, v1

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    sub-int/2addr p2, v1

    .line 57
    add-int/2addr v0, p4

    .line 58
    add-int/2addr p2, p5

    .line 59
    invoke-virtual {p3, p4, p5, v0, p2}, Landroid/view/View;->layout(IIII)V

    .line 60
    .line 61
    .line 62
    iget-object p2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 63
    .line 64
    invoke-virtual {p2}, Landroid/view/View;->getMeasuredWidth()I

    .line 65
    .line 66
    .line 67
    move-result p2

    .line 68
    iget-object p3, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 69
    .line 70
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    .line 71
    .line 72
    .line 73
    move-result p3

    .line 74
    iget-object p4, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 75
    .line 76
    div-int/lit8 p1, p1, 0x2

    .line 77
    .line 78
    div-int/lit8 p2, p2, 0x2

    .line 79
    .line 80
    sub-int p5, p1, p2

    .line 81
    .line 82
    iget p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->m:I

    .line 83
    .line 84
    add-int/2addr p1, p2

    .line 85
    add-int/2addr p3, p0

    .line 86
    invoke-virtual {p4, p5, p0, p1, p3}, Landroid/view/View;->layout(IIII)V

    .line 87
    .line 88
    .line 89
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->a:Landroid/view/View;

    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->a:Landroid/view/View;

    .line 12
    .line 13
    if-nez p1, :cond_1

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    sub-int/2addr p2, v0

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    sub-int/2addr p2, v0

    .line 30
    const/high16 v0, 0x40000000    # 2.0f

    .line 31
    .line 32
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    sub-int/2addr v1, v2

    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    sub-int/2addr v1, v2

    .line 50
    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    invoke-virtual {p1, p2, v1}, Landroid/view/View;->measure(II)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 58
    .line 59
    iget p2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->J:I

    .line 60
    .line 61
    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->J:I

    .line 66
    .line 67
    invoke-static {v1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-virtual {p1, p2, v0}, Landroid/view/View;->measure(II)V

    .line 72
    .line 73
    .line 74
    const/4 p1, -0x1

    .line 75
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->w:I

    .line 76
    .line 77
    const/4 p1, 0x0

    .line 78
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 79
    .line 80
    .line 81
    move-result p2

    .line 82
    if-ge p1, p2, :cond_3

    .line 83
    .line 84
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 89
    .line 90
    if-ne p2, v0, :cond_2

    .line 91
    .line 92
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->w:I

    .line 93
    .line 94
    return-void

    .line 95
    :cond_2
    add-int/lit8 p1, p1, 0x1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_3
    :goto_1
    return-void
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p3, p4}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->dispatchNestedFling(FFZ)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onNestedPreFling(Landroid/view/View;FF)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p2, p3}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->dispatchNestedPreFling(FF)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public onNestedPreScroll(Landroid/view/View;II[I)V
    .locals 4

    .line 1
    const/4 p1, 0x0

    .line 2
    const/4 v0, 0x1

    .line 3
    if-lez p3, :cond_1

    .line 4
    .line 5
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f:F

    .line 6
    .line 7
    cmpl-float v2, v1, p1

    .line 8
    .line 9
    if-lez v2, :cond_1

    .line 10
    .line 11
    int-to-float v2, p3

    .line 12
    cmpl-float v3, v2, v1

    .line 13
    .line 14
    if-lez v3, :cond_0

    .line 15
    .line 16
    float-to-int v1, v1

    .line 17
    sub-int v1, p3, v1

    .line 18
    .line 19
    aput v1, p4, v0

    .line 20
    .line 21
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f:F

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    sub-float/2addr v1, v2

    .line 25
    iput v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f:F

    .line 26
    .line 27
    aput p3, p4, v0

    .line 28
    .line 29
    :goto_0
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f:F

    .line 30
    .line 31
    invoke-direct {p0, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->j(F)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->K:Z

    .line 35
    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    if-lez p3, :cond_2

    .line 39
    .line 40
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f:F

    .line 41
    .line 42
    cmpl-float p1, v1, p1

    .line 43
    .line 44
    if-nez p1, :cond_2

    .line 45
    .line 46
    aget p1, p4, v0

    .line 47
    .line 48
    sub-int p1, p3, p1

    .line 49
    .line 50
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-lez p1, :cond_2

    .line 55
    .line 56
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 57
    .line 58
    const/16 v1, 0x8

    .line 59
    .line 60
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 61
    .line 62
    .line 63
    :cond_2
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->i:[I

    .line 64
    .line 65
    const/4 v1, 0x0

    .line 66
    aget v2, p4, v1

    .line 67
    .line 68
    sub-int/2addr p2, v2

    .line 69
    aget v2, p4, v0

    .line 70
    .line 71
    sub-int/2addr p3, v2

    .line 72
    const/4 v2, 0x0

    .line 73
    invoke-virtual {p0, p2, p3, p1, v2}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->dispatchNestedPreScroll(II[I[I)Z

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    if-eqz p0, :cond_3

    .line 78
    .line 79
    aget p0, p4, v1

    .line 80
    .line 81
    aget p2, p1, v1

    .line 82
    .line 83
    add-int/2addr p0, p2

    .line 84
    aput p0, p4, v1

    .line 85
    .line 86
    aget p0, p4, v0

    .line 87
    .line 88
    aget p1, p1, v0

    .line 89
    .line 90
    add-int/2addr p0, p1

    .line 91
    aput p0, p4, v0

    .line 92
    .line 93
    :cond_3
    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIII)V
    .locals 0

    .line 1
    move p1, p2

    .line 2
    move p2, p3

    .line 3
    move p3, p4

    .line 4
    move p4, p5

    .line 5
    iget-object p5, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->j:[I

    .line 6
    .line 7
    invoke-virtual/range {p0 .. p5}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->dispatchNestedScroll(IIII[I)Z

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->j:[I

    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    aget p1, p1, p2

    .line 14
    .line 15
    add-int p5, p4, p1

    .line 16
    .line 17
    if-gez p5, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c()Z

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    iget p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f:F

    .line 26
    .line 27
    invoke-static {p5}, Ljava/lang/Math;->abs(I)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    int-to-float p2, p2

    .line 32
    add-float/2addr p1, p2

    .line 33
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f:F

    .line 34
    .line 35
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->j(F)V

    .line 36
    .line 37
    .line 38
    :cond_0
    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->g:Ll/fi20;

    .line 2
    .line 3
    invoke-virtual {v0, p1, p2, p3}, Ll/fi20;->b(Landroid/view/View;Landroid/view/View;I)V

    .line 4
    .line 5
    .line 6
    and-int/lit8 p1, p3, 0x2

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->startNestedScroll(I)Z

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f:F

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->k:Z

    .line 16
    .line 17
    return-void
.end method

.method public onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->t:Z

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c:Z

    .line 12
    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    and-int/lit8 p0, p3, 0x2

    .line 16
    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->g:Ll/fi20;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/fi20;->d(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->k:Z

    .line 8
    .line 9
    iget p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f:F

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    cmpl-float v1, p1, v0

    .line 13
    .line 14
    if-lez v1, :cond_0

    .line 15
    .line 16
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->g(F)V

    .line 17
    .line 18
    .line 19
    iput v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f:F

    .line 20
    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->stopNestedScroll()V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionMasked()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->t:Z

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->t:Z

    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_e

    .line 19
    .line 20
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->t:Z

    .line 21
    .line 22
    if-nez v1, :cond_e

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_e

    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c:Z

    .line 31
    .line 32
    if-nez v1, :cond_e

    .line 33
    .line 34
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->k:Z

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    goto/16 :goto_1

    .line 39
    .line 40
    :cond_1
    const/4 v1, 0x1

    .line 41
    if-eqz v0, :cond_c

    .line 42
    .line 43
    const/high16 v3, 0x3f000000    # 0.5f

    .line 44
    .line 45
    if-eq v0, v1, :cond_9

    .line 46
    .line 47
    const/4 v4, 0x2

    .line 48
    if-eq v0, v4, :cond_6

    .line 49
    .line 50
    const/4 v3, 0x3

    .line 51
    if-eq v0, v3, :cond_5

    .line 52
    .line 53
    const/4 v3, 0x5

    .line 54
    if-eq v0, v3, :cond_3

    .line 55
    .line 56
    const/4 v2, 0x6

    .line 57
    if-eq v0, v2, :cond_2

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->l(Landroid/view/MotionEvent;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getActionIndex()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-gez v0, :cond_4

    .line 69
    .line 70
    sget-object p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->P:Ljava/lang/String;

    .line 71
    .line 72
    const-string p1, "Got ACTION_POINTER_DOWN event but have an invalid action index."

    .line 73
    .line 74
    invoke-static {p0, p1}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return v2

    .line 78
    :cond_4
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->r:I

    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_5
    return v2

    .line 86
    :cond_6
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->r:I

    .line 87
    .line 88
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-gez v0, :cond_7

    .line 93
    .line 94
    sget-object p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->P:Ljava/lang/String;

    .line 95
    .line 96
    const-string p1, "Got ACTION_MOVE event but have an invalid active pointer id."

    .line 97
    .line 98
    invoke-static {p0, p1}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    return v2

    .line 102
    :cond_7
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->q(F)V

    .line 107
    .line 108
    .line 109
    iget-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->q:Z

    .line 110
    .line 111
    if-eqz v0, :cond_d

    .line 112
    .line 113
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->n:F

    .line 114
    .line 115
    sub-float/2addr p1, v0

    .line 116
    mul-float/2addr p1, v3

    .line 117
    const/4 v0, 0x0

    .line 118
    cmpl-float v0, p1, v0

    .line 119
    .line 120
    if-lez v0, :cond_8

    .line 121
    .line 122
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->j(F)V

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_8
    return v2

    .line 127
    :cond_9
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->r:I

    .line 128
    .line 129
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-gez v0, :cond_a

    .line 134
    .line 135
    sget-object p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->P:Ljava/lang/String;

    .line 136
    .line 137
    const-string p1, "Got ACTION_UP event but don\'t have an active pointer id."

    .line 138
    .line 139
    invoke-static {p0, p1}, Ll/jzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    return v2

    .line 143
    :cond_a
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->q:Z

    .line 144
    .line 145
    if-eqz v1, :cond_b

    .line 146
    .line 147
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    .line 148
    .line 149
    .line 150
    move-result p1

    .line 151
    iget v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->n:F

    .line 152
    .line 153
    sub-float/2addr p1, v0

    .line 154
    mul-float/2addr p1, v3

    .line 155
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->q:Z

    .line 156
    .line 157
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->g(F)V

    .line 158
    .line 159
    .line 160
    :cond_b
    const/4 p1, -0x1

    .line 161
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->r:I

    .line 162
    .line 163
    return v2

    .line 164
    :cond_c
    invoke-virtual {p1, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 165
    .line 166
    .line 167
    move-result p1

    .line 168
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->r:I

    .line 169
    .line 170
    iput-boolean v2, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->q:Z

    .line 171
    .line 172
    :cond_d
    :goto_0
    return v1

    .line 173
    :cond_e
    :goto_1
    return v2
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->a:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/kkl0;->Q(Landroid/view/View;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setAnimationProgress(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/view/View;->setScaleX(F)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Landroid/view/View;->setScaleY(F)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public varargs setColorScheme([I)V
    .locals 0
    .param p1    # [I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setColorSchemeResources([I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public varargs setColorSchemeColors([I)V
    .locals 0
    .param p1    # [I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->f()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/c55;->f([I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public varargs setColorSchemeResources([I)V
    .locals 4
    .param p1    # [I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, p1

    .line 6
    new-array v1, v1, [I

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    :goto_0
    array-length v3, p1

    .line 10
    if-ge v2, v3, :cond_0

    .line 11
    .line 12
    aget v3, p1, v2

    .line 13
    .line 14
    invoke-static {v0, v3}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    aput v3, v1, v2

    .line 19
    .line 20
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setColorSchemeColors([I)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public setDistanceToTriggerSync(I)V
    .locals 0

    .line 1
    int-to-float p1, p1

    .line 2
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->e:F

    .line 3
    .line 4
    return-void
.end method

.method public setEnabled(Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 2
    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->m()V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public setNestedScrollingEnabled(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->h:Ll/bi20;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bi20;->n(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOnChildScrollUpCallback(Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$i;)V
    .locals 0
    .param p1    # Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$i;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    return-void
.end method

.method public setOnRefreshListener(Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$j;)V
    .locals 0
    .param p1    # Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$j;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->b:Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$j;

    .line 2
    .line 3
    return-void
.end method

.method public setProgressBackgroundColor(I)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setProgressBackgroundColorSchemeResource(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setProgressBackgroundColorSchemeColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKCircleImageView;->setBackgroundColor(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setProgressBackgroundColorSchemeResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0, p1}, Ll/j26;->c(Landroid/content/Context;I)I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setProgressBackgroundColorSchemeColor(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setRefreshing(Z)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    iget-boolean v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c:Z

    .line 5
    .line 6
    if-eq v1, p1, :cond_1

    .line 7
    .line 8
    iput-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->c:Z

    .line 9
    .line 10
    iget-boolean p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->K:Z

    .line 11
    .line 12
    iget v1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->A:I

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    iget p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->z:I

    .line 17
    .line 18
    add-int/2addr v1, p1

    .line 19
    :cond_0
    iget p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->m:I

    .line 20
    .line 21
    sub-int/2addr v1, p1

    .line 22
    invoke-virtual {p0, v1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->setTargetOffsetTopAndBottom(I)V

    .line 23
    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->I:Z

    .line 26
    .line 27
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->M:Landroid/view/animation/Animation$AnimationListener;

    .line 28
    .line 29
    invoke-direct {p0, p1}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v(Landroid/view/animation/Animation$AnimationListener;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-direct {p0, p1, v0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->o(ZZ)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public setSize(I)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p1, v0, :cond_0

    .line 5
    .line 6
    return-void

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    const/high16 v1, 0x42600000    # 56.0f

    .line 18
    .line 19
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 20
    .line 21
    mul-float/2addr v0, v1

    .line 22
    float-to-int v0, v0

    .line 23
    iput v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->J:I

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/high16 v1, 0x42200000    # 40.0f

    .line 27
    .line 28
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 29
    .line 30
    mul-float/2addr v0, v1

    .line 31
    float-to-int v0, v0

    .line 32
    iput v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->J:I

    .line 33
    .line 34
    :goto_0
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ll/c55;->l(I)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->C:Ll/c55;

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Landroidx/appcompat/widget/AppCompatImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public setSlingshotDistance(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/Px;
        .end annotation
    .end param

    .line 1
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->B:I

    .line 2
    .line 3
    return-void
.end method

.method public setTargetOffsetTopAndBottom(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->bringToFront()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 7
    .line 8
    invoke-static {v0, p1}, Ll/kkl0;->V(Landroid/view/View;I)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->m:I

    .line 18
    .line 19
    return-void
.end method

.method public startNestedScroll(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->h:Ll/bi20;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/bi20;->p(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public stopNestedScroll()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->h:Ll/bi20;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/bi20;->r()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(Landroid/view/animation/Animation$AnimationListener;)V
    .locals 3

    .line 1
    new-instance v0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout$c;-><init>(Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->E:Landroid/view/animation/Animation;

    .line 7
    .line 8
    const-wide/16 v1, 0x96

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 14
    .line 15
    invoke-virtual {v0, p1}, Lcom/hellogroup/mk/business/widget/MKCircleImageView;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 19
    .line 20
    invoke-virtual {p1}, Landroid/view/View;->clearAnimation()V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->v:Lcom/hellogroup/mk/business/widget/MKCircleImageView;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/hellogroup/mk/business/widget/MKSwipeRefreshLayout;->E:Landroid/view/animation/Animation;

    .line 26
    .line 27
    invoke-virtual {p1, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method
