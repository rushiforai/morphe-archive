.class public final Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;
.super Landroidx/viewpager/widget/ViewPager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000B\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u000e\u0018\u0000 &2\u00020\u0001:\u0001\'B\u001d\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0017\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\r\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000cJ\u0017\u0010\u0011\u001a\u00020\u00102\u0006\u0010\u000f\u001a\u00020\u000eH\u0002\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u000f\u0010\u0013\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u0013\u0010\u0014J\u000f\u0010\u0015\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0014R\u0016\u0010\u0019\u001a\u00020\u00168\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u0018R\u0014\u0010\u001d\u001a\u00020\u001a8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u001b\u0010\u001cR\u0016\u0010 \u001a\u00020\n8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u001fR\u0016\u0010#\u001a\u00020\u000e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008!\u0010\"R\u0016\u0010%\u001a\u00020\n8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008$\u0010\u001f\u00a8\u0006("
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;",
        "Landroidx/viewpager/widget/ViewPager;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Landroid/view/MotionEvent;",
        "ev",
        "",
        "onInterceptTouchEvent",
        "(Landroid/view/MotionEvent;)Z",
        "onTouchEvent",
        "",
        "offset",
        "",
        "d0",
        "(F)V",
        "b0",
        "()V",
        "c0",
        "",
        "M0",
        "I",
        "currentPosition",
        "Landroid/graphics/Rect;",
        "N0",
        "Landroid/graphics/Rect;",
        "mRect",
        "O0",
        "Z",
        "handleDefault",
        "P0",
        "F",
        "preX",
        "Q0",
        "inTouch",
        "Companion",
        "a",
        "b_core_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager$a;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final R0:F


# instance fields
.field public M0:I

.field public final N0:Landroid/graphics/Rect;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public O0:Z

.field public P0:F

.field public Q0:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->Companion:Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager$a;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 18
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0, p1, p2}, Landroidx/viewpager/widget/ViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    new-instance p1, Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->O0:Z

    .line 16
    .line 17
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 19
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final b0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->c0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final c0()V
    .locals 4

    .line 1
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    int-to-float v1, v1

    .line 8
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 9
    .line 10
    iget v2, v2, Landroid/graphics/Rect;->left:I

    .line 11
    .line 12
    int-to-float v2, v2

    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-direct {v0, v1, v2, v3, v3}, Landroid/view/animation/TranslateAnimation;-><init>(FFFF)V

    .line 15
    .line 16
    .line 17
    const-wide/16 v1, 0x12c

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 26
    .line 27
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 28
    .line 29
    iget v2, v0, Landroid/graphics/Rect;->top:I

    .line 30
    .line 31
    iget v3, v0, Landroid/graphics/Rect;->right:I

    .line 32
    .line 33
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 34
    .line 35
    invoke-virtual {p0, v1, v2, v3, v0}, Landroid/view/View;->layout(IIII)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->O0:Z

    .line 45
    .line 46
    return-void
.end method

.method public final d0(F)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;->set(IIII)V

    .line 28
    .line 29
    .line 30
    :cond_0
    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->O0:Z

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/high16 v1, 0x3f000000    # 0.5f

    .line 38
    .line 39
    mul-float/2addr p1, v1

    .line 40
    float-to-int p1, p1

    .line 41
    add-int/2addr v0, p1

    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    add-int/2addr v2, p1

    .line 51
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/view/View;->layout(IIII)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->P0:F

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->M0:I

    .line 21
    .line 22
    :cond_0
    invoke-super {p0, p1}, Landroidx/viewpager/widget/ViewPager;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5
    .param p1    # Landroid/view/MotionEvent;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Ll/cf60;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-super {p0, p1}, Landroidx/viewpager/widget/ViewPager;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0

    .line 15
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_e

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    if-eq v1, v2, :cond_d

    .line 23
    .line 24
    const/4 v3, 0x2

    .line 25
    if-eq v1, v3, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x3

    .line 28
    if-eq v1, v0, :cond_d

    .line 29
    .line 30
    goto/16 :goto_2

    .line 31
    .line 32
    :cond_1
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    const/high16 v3, 0x3f000000    # 0.5f

    .line 37
    .line 38
    if-ne v1, v2, :cond_4

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->P0:F

    .line 45
    .line 46
    sub-float v1, v0, v1

    .line 47
    .line 48
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->P0:F

    .line 49
    .line 50
    sget v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->R0:F

    .line 51
    .line 52
    cmpl-float v4, v1, v0

    .line 53
    .line 54
    if-lez v4, :cond_2

    .line 55
    .line 56
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->d0(F)V

    .line 57
    .line 58
    .line 59
    goto/16 :goto_1

    .line 60
    .line 61
    :cond_2
    neg-float v0, v0

    .line 62
    cmpg-float v0, v1, v0

    .line 63
    .line 64
    if-gez v0, :cond_3

    .line 65
    .line 66
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->d0(F)V

    .line 67
    .line 68
    .line 69
    goto/16 :goto_1

    .line 70
    .line 71
    :cond_3
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->O0:Z

    .line 72
    .line 73
    if-nez v0, :cond_c

    .line 74
    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    mul-float/2addr v1, v3

    .line 80
    float-to-int v1, v1

    .line 81
    add-int/2addr v0, v1

    .line 82
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 83
    .line 84
    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 85
    .line 86
    if-eq v0, v3, :cond_c

    .line 87
    .line 88
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    add-int/2addr v0, v1

    .line 93
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 94
    .line 95
    .line 96
    move-result v3

    .line 97
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    add-int/2addr v4, v1

    .line 102
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    invoke-virtual {p0, v0, v3, v4, v1}, Landroid/view/View;->layout(IIII)V

    .line 107
    .line 108
    .line 109
    goto/16 :goto_1

    .line 110
    .line 111
    :cond_4
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->M0:I

    .line 112
    .line 113
    if-eqz v1, :cond_6

    .line 114
    .line 115
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    sub-int/2addr v0, v2

    .line 120
    if-ne v1, v0, :cond_5

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_5
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->O0:Z

    .line 124
    .line 125
    goto/16 :goto_1

    .line 126
    .line 127
    :cond_6
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->P0:F

    .line 132
    .line 133
    sub-float v1, v0, v1

    .line 134
    .line 135
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->P0:F

    .line 136
    .line 137
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->M0:I

    .line 138
    .line 139
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->Q0:Z

    .line 140
    .line 141
    if-nez v0, :cond_9

    .line 142
    .line 143
    if-nez v4, :cond_7

    .line 144
    .line 145
    sget v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->R0:F

    .line 146
    .line 147
    cmpl-float v0, v1, v0

    .line 148
    .line 149
    if-lez v0, :cond_7

    .line 150
    .line 151
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->d0(F)V

    .line 152
    .line 153
    .line 154
    goto :goto_1

    .line 155
    :cond_7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->O0:Z

    .line 156
    .line 157
    if-nez v0, :cond_8

    .line 158
    .line 159
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    mul-float/2addr v1, v3

    .line 164
    float-to-int v1, v1

    .line 165
    add-int/2addr v0, v1

    .line 166
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 167
    .line 168
    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 169
    .line 170
    if-lt v0, v3, :cond_c

    .line 171
    .line 172
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    add-int/2addr v0, v1

    .line 177
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 178
    .line 179
    .line 180
    move-result v3

    .line 181
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 182
    .line 183
    .line 184
    move-result v4

    .line 185
    add-int/2addr v4, v1

    .line 186
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    invoke-virtual {p0, v0, v3, v4, v1}, Landroid/view/View;->layout(IIII)V

    .line 191
    .line 192
    .line 193
    goto :goto_1

    .line 194
    :cond_8
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->Q0:Z

    .line 195
    .line 196
    goto :goto_1

    .line 197
    :cond_9
    if-nez v4, :cond_a

    .line 198
    .line 199
    sget v0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->R0:F

    .line 200
    .line 201
    neg-float v0, v0

    .line 202
    cmpg-float v0, v1, v0

    .line 203
    .line 204
    if-gez v0, :cond_a

    .line 205
    .line 206
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->d0(F)V

    .line 207
    .line 208
    .line 209
    goto :goto_1

    .line 210
    :cond_a
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->O0:Z

    .line 211
    .line 212
    if-nez v0, :cond_b

    .line 213
    .line 214
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    mul-float/2addr v1, v3

    .line 219
    float-to-int v1, v1

    .line 220
    add-int/2addr v0, v1

    .line 221
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 222
    .line 223
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 224
    .line 225
    if-gt v0, v3, :cond_c

    .line 226
    .line 227
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    add-int/2addr v0, v1

    .line 232
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 233
    .line 234
    .line 235
    move-result v3

    .line 236
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 237
    .line 238
    .line 239
    move-result v4

    .line 240
    add-int/2addr v4, v1

    .line 241
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 242
    .line 243
    .line 244
    move-result v1

    .line 245
    invoke-virtual {p0, v0, v3, v4, v1}, Landroid/view/View;->layout(IIII)V

    .line 246
    .line 247
    .line 248
    goto :goto_1

    .line 249
    :cond_b
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->Q0:Z

    .line 250
    .line 251
    :cond_c
    :goto_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->O0:Z

    .line 252
    .line 253
    if-nez v0, :cond_f

    .line 254
    .line 255
    return v2

    .line 256
    :cond_d
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->b0()V

    .line 257
    .line 258
    .line 259
    goto :goto_2

    .line 260
    :cond_e
    const/4 v0, 0x0

    .line 261
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/BounceBackViewPager;->Q0:Z

    .line 262
    .line 263
    :cond_f
    :goto_2
    invoke-super {p0, p1}, Landroidx/viewpager/widget/ViewPager;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 264
    .line 265
    .line 266
    move-result p0

    .line 267
    return p0
.end method
