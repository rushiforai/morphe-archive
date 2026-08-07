.class public final Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/behavior/ViewPagerScrollBehavior;
.super Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/coordinatorlayout/widget/CoordinatorLayout$c<",
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0015\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\t\u0018\u00002\u0008\u0012\u0004\u0012\u00020\u00020\u0001B\u001d\u0008\u0007\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0006\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J?\u0010\u0013\u001a\u00020\u00122\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u00022\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u000e\u001a\u00020\u000c2\u0006\u0010\u0010\u001a\u00020\u000f2\u0006\u0010\u0011\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u0013\u0010\u0014JG\u0010\u001a\u001a\u00020\u00192\u0006\u0010\n\u001a\u00020\t2\u0006\u0010\u000b\u001a\u00020\u00022\u0006\u0010\u000e\u001a\u00020\u000c2\u0006\u0010\u0015\u001a\u00020\u000f2\u0006\u0010\u0016\u001a\u00020\u000f2\u0006\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u0011\u001a\u00020\u000fH\u0016\u00a2\u0006\u0004\u0008\u001a\u0010\u001bR\"\u0010!\u001a\u00020\u00178\u0006@\u0006X\u0086\u000e\u00a2\u0006\u0012\n\u0004\u0008\u001a\u0010\u001c\u001a\u0004\u0008\u001d\u0010\u001e\"\u0004\u0008\u001f\u0010 \u00a8\u0006\""
    }
    d2 = {
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/behavior/ViewPagerScrollBehavior;",
        "Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;",
        "Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Landroidx/coordinatorlayout/widget/CoordinatorLayout;",
        "coordinatorLayout",
        "child",
        "Landroid/view/View;",
        "directTargetChild",
        "target",
        "",
        "axes",
        "type",
        "",
        "b",
        "(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;Landroid/view/View;Landroid/view/View;II)Z",
        "dx",
        "dy",
        "",
        "consumed",
        "",
        "a",
        "(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;Landroid/view/View;II[II)V",
        "[I",
        "getLocation",
        "()[I",
        "setLocation",
        "([I)V",
        "location",
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

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public a:[I
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lkotlin/jvm/JvmOverloads;
    .end annotation

    .line 13
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x2

    invoke-direct {p0, p1, v0, v1, v0}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/behavior/ViewPagerScrollBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V

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
    invoke-direct {p0, p1, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    new-array p1, p1, [I

    .line 9
    .line 10
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/behavior/ViewPagerScrollBehavior;->a:[I

    .line 11
    .line 12
    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 14
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/behavior/ViewPagerScrollBehavior;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;Landroid/view/View;II[II)V
    .locals 3
    .param p1    # Landroidx/coordinatorlayout/widget/CoordinatorLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p6    # [I
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    invoke-super/range {p0 .. p7}, Landroidx/coordinatorlayout/widget/CoordinatorLayout$c;->onNestedPreScroll(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II[II)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    instance-of p4, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 25
    .line 26
    const/4 p7, 0x0

    .line 27
    if-nez p4, :cond_0

    .line 28
    .line 29
    move-object p1, p7

    .line 30
    :cond_0
    check-cast p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 31
    .line 32
    const/4 p4, 0x0

    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    iget p1, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    move p1, p4

    .line 39
    :goto_0
    add-int/2addr p0, p1

    .line 40
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    instance-of v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 45
    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    move-object p7, p1

    .line 50
    :goto_1
    check-cast p7, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 51
    .line 52
    if-eqz p7, :cond_3

    .line 53
    .line 54
    iget p1, p7, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 55
    .line 56
    goto :goto_2

    .line 57
    :cond_3
    move p1, p4

    .line 58
    :goto_2
    add-int/2addr p0, p1

    .line 59
    check-cast p3, Landroidx/recyclerview/widget/RecyclerView;

    .line 60
    .line 61
    invoke-virtual {p3}, Landroid/view/View;->getTranslationY()F

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    const/4 p7, 0x0

    .line 66
    cmpg-float p1, p1, p7

    .line 67
    .line 68
    if-nez p1, :cond_a

    .line 69
    .line 70
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    if-nez p1, :cond_4

    .line 75
    .line 76
    goto/16 :goto_4

    .line 77
    .line 78
    :cond_4
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    .line 84
    .line 85
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 86
    .line 87
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstCompletelyVisibleItemPosition()I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 96
    .line 97
    .line 98
    check-cast v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 99
    .line 100
    invoke-virtual {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastCompletelyVisibleItemPosition()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    if-eqz v1, :cond_5

    .line 109
    .line 110
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->getItemCount()I

    .line 111
    .line 112
    .line 113
    move-result p4

    .line 114
    :cond_5
    const/4 v1, 0x1

    .line 115
    sub-int/2addr p4, v1

    .line 116
    if-ne v0, p4, :cond_6

    .line 117
    .line 118
    if-nez p1, :cond_6

    .line 119
    .line 120
    invoke-virtual {p3}, Landroid/view/View;->getHeight()I

    .line 121
    .line 122
    .line 123
    move-result p4

    .line 124
    sub-int/2addr p4, p0

    .line 125
    int-to-float p4, p4

    .line 126
    invoke-virtual {p2}, Landroid/view/View;->getTranslationY()F

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    add-float/2addr p4, v2

    .line 131
    invoke-virtual {p3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object p3

    .line 135
    invoke-virtual {p3}, Landroid/view/View;->getBottom()I

    .line 136
    .line 137
    .line 138
    move-result p3

    .line 139
    int-to-float p3, p3

    .line 140
    cmpl-float p3, p4, p3

    .line 141
    .line 142
    if-lez p3, :cond_6

    .line 143
    .line 144
    goto :goto_4

    .line 145
    :cond_6
    int-to-float p3, p5

    .line 146
    cmpg-float p4, p3, p7

    .line 147
    .line 148
    if-gez p4, :cond_8

    .line 149
    .line 150
    invoke-virtual {p2}, Landroid/view/View;->getTranslationY()F

    .line 151
    .line 152
    .line 153
    move-result p4

    .line 154
    neg-int v0, p0

    .line 155
    int-to-float v0, v0

    .line 156
    cmpl-float p4, p4, v0

    .line 157
    .line 158
    if-ltz p4, :cond_8

    .line 159
    .line 160
    if-nez p1, :cond_8

    .line 161
    .line 162
    invoke-virtual {p2}, Landroid/view/View;->getTranslationY()F

    .line 163
    .line 164
    .line 165
    move-result p0

    .line 166
    sub-float/2addr p0, p3

    .line 167
    cmpl-float p1, p0, p7

    .line 168
    .line 169
    if-ltz p1, :cond_7

    .line 170
    .line 171
    goto :goto_3

    .line 172
    :cond_7
    move p7, p0

    .line 173
    :goto_3
    invoke-virtual {p2, p7}, Landroid/view/View;->setTranslationY(F)V

    .line 174
    .line 175
    .line 176
    aput p5, p6, v1

    .line 177
    .line 178
    return-void

    .line 179
    :cond_8
    cmpl-float p1, p3, p7

    .line 180
    .line 181
    if-lez p1, :cond_a

    .line 182
    .line 183
    int-to-float p1, p0

    .line 184
    invoke-virtual {p2}, Landroid/view/View;->getTranslationY()F

    .line 185
    .line 186
    .line 187
    move-result p4

    .line 188
    neg-float p4, p4

    .line 189
    cmpl-float p4, p1, p4

    .line 190
    .line 191
    if-lez p4, :cond_a

    .line 192
    .line 193
    invoke-virtual {p2}, Landroid/view/View;->getTranslationY()F

    .line 194
    .line 195
    .line 196
    move-result p4

    .line 197
    sub-float/2addr p4, p3

    .line 198
    neg-int p0, p0

    .line 199
    int-to-float p0, p0

    .line 200
    cmpg-float p0, p4, p0

    .line 201
    .line 202
    if-gez p0, :cond_9

    .line 203
    .line 204
    neg-float p4, p1

    .line 205
    :cond_9
    invoke-virtual {p2, p4}, Landroid/view/View;->setTranslationY(F)V

    .line 206
    .line 207
    .line 208
    aput p5, p6, v1

    .line 209
    .line 210
    :cond_a
    :goto_4
    return-void
.end method

.method public b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;Landroid/view/View;Landroid/view/View;II)Z
    .locals 0
    .param p1    # Landroidx/coordinatorlayout/widget/CoordinatorLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Landroid/view/View;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    and-int/lit8 p0, p5, 0x2

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic onNestedPreScroll(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;II[II)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p7}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/behavior/ViewPagerScrollBehavior;->a(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;Landroid/view/View;II[II)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onStartNestedScroll(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;II)Z
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/behavior/ViewPagerScrollBehavior;->b(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/p1/mobile/putong/core/ui/vip/privilege/vipfrag/view/TopCardLayout;Landroid/view/View;Landroid/view/View;II)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
