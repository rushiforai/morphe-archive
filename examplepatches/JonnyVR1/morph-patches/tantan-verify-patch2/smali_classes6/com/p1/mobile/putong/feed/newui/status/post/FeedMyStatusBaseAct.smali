.class public abstract Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;
.super Lcom/p1/mobile/putong/app/PutongAct;
.source "SourceFile"


# instance fields
.field public c:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

.field public d:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/android/material/bottomsheet/BottomSheetBehavior<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public e:Z

.field public f:Lv/VRelative;

.field public final g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/app/PutongAct;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct$a;-><init>(Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic X1(Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->k2()V

    return-void
.end method

.method public static synthetic Y1(Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->i2()V

    return-void
.end method

.method public static synthetic Z1(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static bridge synthetic a2(Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->e:Z

    return-void
.end method

.method private e2()Landroid/graphics/drawable/GradientDrawable;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->h2()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    array-length v1, v0

    .line 13
    const/4 v3, 0x2

    .line 14
    if-lt v1, v3, :cond_0

    .line 15
    .line 16
    new-instance v1, Landroid/graphics/drawable/GradientDrawable;

    .line 17
    .line 18
    sget-object v2, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 19
    .line 20
    invoke-direct {v1, v2, v0}, Landroid/graphics/drawable/GradientDrawable;-><init>(Landroid/graphics/drawable/GradientDrawable$Orientation;[I)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->g2()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    int-to-float p0, p0

    .line 28
    const/16 v0, 0x8

    .line 29
    .line 30
    new-array v0, v0, [F

    .line 31
    .line 32
    const/4 v2, 0x0

    .line 33
    aput p0, v0, v2

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    aput p0, v0, v2

    .line 37
    .line 38
    aput p0, v0, v3

    .line 39
    .line 40
    const/4 v2, 0x3

    .line 41
    aput p0, v0, v2

    .line 42
    .line 43
    const/4 p0, 0x4

    .line 44
    const/4 v2, 0x0

    .line 45
    aput v2, v0, p0

    .line 46
    .line 47
    const/4 p0, 0x5

    .line 48
    aput v2, v0, p0

    .line 49
    .line 50
    const/4 p0, 0x6

    .line 51
    aput v2, v0, p0

    .line 52
    .line 53
    const/4 p0, 0x7

    .line 54
    aput v2, v0, p0

    .line 55
    .line 56
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadii([F)V

    .line 57
    .line 58
    .line 59
    sget-object p0, Landroid/graphics/drawable/GradientDrawable$Orientation;->TL_BR:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 60
    .line 61
    invoke-virtual {v1, p0}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 62
    .line 63
    .line 64
    return-object v1

    .line 65
    :cond_0
    const-string p0, "color length must >= 2"

    .line 66
    .line 67
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    return-object v2
.end method

.method private synthetic k2()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->d:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->d:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->onDetachedFromLayoutParams()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->d:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 15
    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 17
    .line 18
    invoke-virtual {v0, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->removeBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method


# virtual methods
.method public final b2(Landroid/view/View;)V
    .locals 6

    .line 1
    const/high16 v3, 0x3f800000    # 1.0f

    .line 2
    .line 3
    const-wide/16 v4, 0xc8

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    move-object v0, p0

    .line 7
    move-object v1, p1

    .line 8
    invoke-virtual/range {v0 .. v5}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->c2(Landroid/view/View;FFJ)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    invoke-virtual {v1, p0}, Landroid/view/View;->setEnabled(Z)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final c2(Landroid/view/View;FFJ)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 10
    .line 11
    .line 12
    new-instance p0, Landroid/view/animation/AlphaAnimation;

    .line 13
    .line 14
    invoke-direct {p0, p2, p3}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p4, p5}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public d2()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return p0
.end method

.method public final finish()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-super {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, v0, v0}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->d:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 14
    .line 15
    const/4 v0, 0x4

    .line 16
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public g2()I
    .locals 0

    .line 1
    const/high16 p0, 0x41c00000    # 24.0f

    .line 2
    .line 3
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public h2()[I
    .locals 0

    .line 1
    const/4 p0, 0x0

    return-object p0
.end method

.method public final synthetic i2()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->f:Lv/VRelative;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->c:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-static {}, Ll/bnl0;->F0()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    sub-int/2addr v1, v2

    .line 18
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->f:Lv/VRelative;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public final inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    sget v0, Ll/tec0;->u:I

    .line 2
    .line 3
    invoke-virtual {p1, v0, p2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/hdc0;->h:I

    .line 8
    .line 9
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->c:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->d2()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->c:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 26
    .line 27
    .line 28
    :cond_0
    sget v0, Ll/hdc0;->I1:I

    .line 29
    .line 30
    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lv/VRelative;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->f:Lv/VRelative;

    .line 37
    .line 38
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->e2()Landroid/graphics/drawable/GradientDrawable;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-eqz v1, :cond_1

    .line 47
    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->f:Lv/VRelative;

    .line 49
    .line 50
    invoke-virtual {v1, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->f:Lv/VRelative;

    .line 54
    .line 55
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->m2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->f:Lv/VRelative;

    .line 66
    .line 67
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 68
    .line 69
    .line 70
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->c:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 71
    .line 72
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->b2(Landroid/view/View;)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->f:Lv/VRelative;

    .line 76
    .line 77
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->p2(Landroid/view/View;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->f:Lv/VRelative;

    .line 81
    .line 82
    invoke-static {p1}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->from(Landroid/view/View;)Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->d:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 87
    .line 88
    const/4 v0, 0x0

    .line 89
    invoke-virtual {p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setPeekHeight(I)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->d:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 93
    .line 94
    const/4 v0, 0x3

    .line 95
    invoke-virtual {p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 96
    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->d:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 99
    .line 100
    const/4 v0, 0x1

    .line 101
    invoke-virtual {p1, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setSkipCollapsed(Z)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->n2()Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eqz p1, :cond_3

    .line 113
    .line 114
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->f:Lv/VRelative;

    .line 115
    .line 116
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->n2()Ljava/lang/Integer;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->c:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 132
    .line 133
    new-instance v0, Ll/qjh;

    .line 134
    .line 135
    invoke-direct {v0, p0}, Ll/qjh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 139
    .line 140
    .line 141
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->d:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 142
    .line 143
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->g:Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;

    .line 144
    .line 145
    invoke-virtual {p1, p0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->addBottomSheetCallback(Lcom/google/android/material/bottomsheet/BottomSheetBehavior$BottomSheetCallback;)V

    .line 146
    .line 147
    .line 148
    return-object p2
.end method

.method public initSubscription()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/p1/mobile/putong/app/PutongAct;->initSubscription()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/rjh;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/rjh;-><init>()V

    .line 7
    .line 8
    .line 9
    new-instance v1, Ll/sjh;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/sjh;-><init>(Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/android/app/Act;->creates(Ll/y20;Ll/x20;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public l2()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->e:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->finish()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public abstract m2(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
.end method

.method public n2()Ljava/lang/Integer;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public o2(Landroid/graphics/drawable/GradientDrawable;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->f:Lv/VRelative;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final onBackPressed()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/post/FeedMyStatusBaseAct;->d:Lcom/google/android/material/bottomsheet/BottomSheetBehavior;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-virtual {p0, v0}, Lcom/google/android/material/bottomsheet/BottomSheetBehavior;->setState(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p2(Landroid/view/View;)V
    .locals 9

    .line 1
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    .line 2
    .line 3
    const/4 v7, 0x1

    .line 4
    const/4 v8, 0x0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    const/4 v3, 0x1

    .line 8
    const/4 v4, 0x0

    .line 9
    const/4 v5, 0x1

    .line 10
    const/high16 v6, 0x3f800000    # 1.0f

    .line 11
    .line 12
    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 13
    .line 14
    .line 15
    const-wide/16 v1, 0xc8

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    invoke-virtual {p1, p0}, Landroid/view/View;->setVisibility(I)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public preCreateView(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/p1/mobile/putong/app/PutongAct;->preCreateView(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public shouldSwitchToTransparentStatus()Z
    .locals 0

    const/4 p0, 0x1

    return p0
.end method
