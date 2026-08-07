.class public Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->init()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 8
    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->init()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation

        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 11
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->init()V

    return-void
.end method

.method public static synthetic E(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic F(Ll/y20;Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private init()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->a:I

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setClipToPadding(Z)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public G(Ll/d5n;Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;Lrx/c;Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/d5n;",
            "Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/IntlVipNewUiFrag;",
            "Lrx/c<",
            "TV;>;",
            "Ll/y20<",
            "TV;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2, p3}, Ll/lb2;->n(Ll/ner;Lrx/c;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    new-instance p1, Ll/l0p;

    .line 6
    .line 7
    invoke-direct {p1, p4}, Ll/l0p;-><init>(Ll/y20;)V

    .line 8
    .line 9
    .line 10
    new-instance p2, Ll/n0p;

    .line 11
    .line 12
    invoke-direct {p2}, Ll/n0p;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p1, p2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    invoke-static {p1}, Ll/u610;->c(Landroid/view/MotionEvent;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Ll/u610;->b(Landroid/view/MotionEvent;)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    const/high16 v3, 0x3f000000    # 0.5f

    .line 11
    .line 12
    if-eqz v0, :cond_9

    .line 13
    .line 14
    const/4 v4, 0x2

    .line 15
    if-eq v0, v4, :cond_1

    .line 16
    .line 17
    const/4 v2, 0x5

    .line 18
    if-eq v0, v2, :cond_0

    .line 19
    .line 20
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_0
    invoke-static {p1, v1}, Ll/u610;->d(Landroid/view/MotionEvent;I)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->b:I

    .line 30
    .line 31
    invoke-static {p1, v1}, Ll/u610;->e(Landroid/view/MotionEvent;I)F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-float/2addr v0, v3

    .line 36
    float-to-int v0, v0

    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->c:I

    .line 38
    .line 39
    invoke-static {p1, v1}, Ll/u610;->f(Landroid/view/MotionEvent;I)F

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-float/2addr v0, v3

    .line 44
    float-to-int v0, v0

    .line 45
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->d:I

    .line 46
    .line 47
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    return p0

    .line 52
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->b:I

    .line 53
    .line 54
    invoke-static {p1, v0}, Ll/u610;->a(Landroid/view/MotionEvent;I)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-gez v0, :cond_2

    .line 59
    .line 60
    return v2

    .line 61
    :cond_2
    invoke-static {p1, v0}, Ll/u610;->e(Landroid/view/MotionEvent;I)F

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    add-float/2addr v1, v3

    .line 66
    float-to-int v1, v1

    .line 67
    invoke-static {p1, v0}, Ll/u610;->f(Landroid/view/MotionEvent;I)F

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-float/2addr v0, v3

    .line 72
    float-to-int v0, v0

    .line 73
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getScrollState()I

    .line 74
    .line 75
    .line 76
    move-result v3

    .line 77
    const/4 v4, 0x1

    .line 78
    if-eq v3, v4, :cond_8

    .line 79
    .line 80
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->c:I

    .line 81
    .line 82
    sub-int/2addr v1, v3

    .line 83
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->d:I

    .line 84
    .line 85
    sub-int/2addr v0, v3

    .line 86
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollHorizontally()Z

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    invoke-virtual {v5}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollVertically()Z

    .line 99
    .line 100
    .line 101
    move-result v5

    .line 102
    if-eqz v3, :cond_4

    .line 103
    .line 104
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 105
    .line 106
    .line 107
    move-result v6

    .line 108
    iget v7, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->a:I

    .line 109
    .line 110
    if-le v6, v7, :cond_4

    .line 111
    .line 112
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 113
    .line 114
    .line 115
    move-result v6

    .line 116
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 117
    .line 118
    .line 119
    move-result v7

    .line 120
    if-ge v6, v7, :cond_3

    .line 121
    .line 122
    if-eqz v5, :cond_4

    .line 123
    .line 124
    :cond_3
    move v6, v4

    .line 125
    goto :goto_0

    .line 126
    :cond_4
    move v6, v2

    .line 127
    :goto_0
    if-eqz v5, :cond_6

    .line 128
    .line 129
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 130
    .line 131
    .line 132
    move-result v5

    .line 133
    iget v7, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->a:I

    .line 134
    .line 135
    if-le v5, v7, :cond_6

    .line 136
    .line 137
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 142
    .line 143
    .line 144
    move-result v1

    .line 145
    if-ge v0, v1, :cond_5

    .line 146
    .line 147
    if-eqz v3, :cond_6

    .line 148
    .line 149
    :cond_5
    move v6, v4

    .line 150
    :cond_6
    if-eqz v6, :cond_7

    .line 151
    .line 152
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    if-eqz p0, :cond_7

    .line 157
    .line 158
    return v4

    .line 159
    :cond_7
    return v2

    .line 160
    :cond_8
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    return p0

    .line 165
    :cond_9
    invoke-static {p1, v2}, Ll/u610;->d(Landroid/view/MotionEvent;I)I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->b:I

    .line 170
    .line 171
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    add-float/2addr v0, v3

    .line 176
    float-to-int v0, v0

    .line 177
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->c:I

    .line 178
    .line 179
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    add-float/2addr v0, v3

    .line 184
    float-to-int v0, v0

    .line 185
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->d:I

    .line 186
    .line 187
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 188
    .line 189
    .line 190
    move-result p0

    .line 191
    return p0
.end method

.method public setScrollingTouchSlop(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setScrollingTouchSlop(I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-eqz p1, :cond_1

    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    if-eq p1, v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-static {v0}, Ll/nkl0;->j(Landroid/view/ViewConfiguration;)I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->a:I

    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/intlPrivilege/content/IntlPrivilegeRecycleView;->a:I

    .line 30
    .line 31
    return-void
.end method
