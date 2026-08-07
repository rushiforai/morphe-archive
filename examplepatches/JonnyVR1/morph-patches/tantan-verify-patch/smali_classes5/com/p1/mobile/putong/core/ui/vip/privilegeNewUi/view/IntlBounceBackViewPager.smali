.class public final Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;
.super Landroidx/viewpager/widget/ViewPager;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager$a;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0007\n\u0002\u0008\u0008\u0018\u0000 #2\u00020\u0001:\u0001$B\u001d\u0008\u0007\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\t\u0010\nJ\u000f\u0010\u000b\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\nJ\u0017\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\r\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0017\u0010\u0011\u001a\u00020\u000e2\u0006\u0010\r\u001a\u00020\u000cH\u0016\u00a2\u0006\u0004\u0008\u0011\u0010\u0010R\u0016\u0010\u0015\u001a\u00020\u00128\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u0013\u0010\u0014R\u0014\u0010\u0019\u001a\u00020\u00168\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008\u0017\u0010\u0018R\u0016\u0010\u001c\u001a\u00020\u000e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001a\u0010\u001bR\u0016\u0010 \u001a\u00020\u001d8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008\u001e\u0010\u001fR\u0016\u0010\"\u001a\u00020\u000e8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008!\u0010\u001b\u00a8\u0006%"
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;",
        "Landroidx/viewpager/widget/ViewPager;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "",
        "b0",
        "()V",
        "c0",
        "Landroid/view/MotionEvent;",
        "ev",
        "",
        "onInterceptTouchEvent",
        "(Landroid/view/MotionEvent;)Z",
        "onTouchEvent",
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
        "",
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
.field public static final Companion:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager$a;
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

    new-instance v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager$a;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager$a;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->Companion:Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager$a;

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

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

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
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->O0:Z

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
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method private final b0()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->N0:Landroid/graphics/Rect;

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
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->c0()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private final c0()V
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
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->N0:Landroid/graphics/Rect;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->N0:Landroid/graphics/Rect;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 39
    .line 40
    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 41
    .line 42
    .line 43
    const/4 v0, 0x1

    .line 44
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->O0:Z

    .line 45
    .line 46
    return-void
.end method


# virtual methods
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
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->P0:F

    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->M0:I

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
    if-eqz v1, :cond_c

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    if-eq v1, v2, :cond_b

    .line 23
    .line 24
    const/4 v3, 0x2

    .line 25
    if-eq v1, v3, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x3

    .line 28
    if-eq v1, v0, :cond_b

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
    const/4 v3, 0x0

    .line 37
    if-ne v1, v2, :cond_2

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->P0:F

    .line 44
    .line 45
    sub-float v1, v0, v1

    .line 46
    .line 47
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->P0:F

    .line 48
    .line 49
    sget v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->R0:F

    .line 50
    .line 51
    cmpl-float v4, v1, v0

    .line 52
    .line 53
    if-gtz v4, :cond_a

    .line 54
    .line 55
    neg-float v0, v0

    .line 56
    cmpg-float v0, v1, v0

    .line 57
    .line 58
    if-ltz v0, :cond_a

    .line 59
    .line 60
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->O0:Z

    .line 61
    .line 62
    if-nez v0, :cond_a

    .line 63
    .line 64
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    mul-float/2addr v1, v3

    .line 69
    float-to-int v1, v1

    .line 70
    add-int/2addr v0, v1

    .line 71
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 72
    .line 73
    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 74
    .line 75
    if-eq v0, v3, :cond_a

    .line 76
    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr v0, v1

    .line 82
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 87
    .line 88
    .line 89
    move-result v4

    .line 90
    add-int/2addr v4, v1

    .line 91
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    invoke-virtual {p0, v0, v3, v4, v1}, Landroid/view/View;->layout(IIII)V

    .line 96
    .line 97
    .line 98
    goto/16 :goto_1

    .line 99
    .line 100
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->M0:I

    .line 101
    .line 102
    if-eqz v1, :cond_4

    .line 103
    .line 104
    invoke-virtual {v0}, Ll/cf60;->getCount()I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    sub-int/2addr v0, v2

    .line 109
    if-ne v1, v0, :cond_3

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->O0:Z

    .line 113
    .line 114
    goto/16 :goto_1

    .line 115
    .line 116
    :cond_4
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->P0:F

    .line 121
    .line 122
    sub-float v1, v0, v1

    .line 123
    .line 124
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->P0:F

    .line 125
    .line 126
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->M0:I

    .line 127
    .line 128
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->Q0:Z

    .line 129
    .line 130
    if-nez v0, :cond_7

    .line 131
    .line 132
    if-nez v4, :cond_5

    .line 133
    .line 134
    sget v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->R0:F

    .line 135
    .line 136
    cmpl-float v0, v1, v0

    .line 137
    .line 138
    if-gtz v0, :cond_a

    .line 139
    .line 140
    :cond_5
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->O0:Z

    .line 141
    .line 142
    if-nez v0, :cond_6

    .line 143
    .line 144
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    mul-float/2addr v1, v3

    .line 149
    float-to-int v1, v1

    .line 150
    add-int/2addr v0, v1

    .line 151
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 152
    .line 153
    iget v3, v3, Landroid/graphics/Rect;->left:I

    .line 154
    .line 155
    if-lt v0, v3, :cond_a

    .line 156
    .line 157
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    add-int/2addr v0, v1

    .line 162
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 167
    .line 168
    .line 169
    move-result v4

    .line 170
    add-int/2addr v4, v1

    .line 171
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    invoke-virtual {p0, v0, v3, v4, v1}, Landroid/view/View;->layout(IIII)V

    .line 176
    .line 177
    .line 178
    goto :goto_1

    .line 179
    :cond_6
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->Q0:Z

    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_7
    if-nez v4, :cond_8

    .line 183
    .line 184
    sget v0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->R0:F

    .line 185
    .line 186
    neg-float v0, v0

    .line 187
    cmpg-float v0, v1, v0

    .line 188
    .line 189
    if-ltz v0, :cond_a

    .line 190
    .line 191
    :cond_8
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->O0:Z

    .line 192
    .line 193
    if-nez v0, :cond_9

    .line 194
    .line 195
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    mul-float/2addr v1, v3

    .line 200
    float-to-int v1, v1

    .line 201
    add-int/2addr v0, v1

    .line 202
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->N0:Landroid/graphics/Rect;

    .line 203
    .line 204
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 205
    .line 206
    if-gt v0, v3, :cond_a

    .line 207
    .line 208
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    add-int/2addr v0, v1

    .line 213
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 214
    .line 215
    .line 216
    move-result v3

    .line 217
    invoke-virtual {p0}, Landroid/view/View;->getRight()I

    .line 218
    .line 219
    .line 220
    move-result v4

    .line 221
    add-int/2addr v4, v1

    .line 222
    invoke-virtual {p0}, Landroid/view/View;->getBottom()I

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    invoke-virtual {p0, v0, v3, v4, v1}, Landroid/view/View;->layout(IIII)V

    .line 227
    .line 228
    .line 229
    goto :goto_1

    .line 230
    :cond_9
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->Q0:Z

    .line 231
    .line 232
    :cond_a
    :goto_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->O0:Z

    .line 233
    .line 234
    if-nez v0, :cond_d

    .line 235
    .line 236
    return v2

    .line 237
    :cond_b
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->b0()V

    .line 238
    .line 239
    .line 240
    goto :goto_2

    .line 241
    :cond_c
    const/4 v0, 0x0

    .line 242
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/vip/privilegeNewUi/view/IntlBounceBackViewPager;->Q0:Z

    .line 243
    .line 244
    :cond_d
    :goto_2
    invoke-super {p0, p1}, Landroidx/viewpager/widget/ViewPager;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 245
    .line 246
    .line 247
    move-result p0

    .line 248
    return p0
.end method
