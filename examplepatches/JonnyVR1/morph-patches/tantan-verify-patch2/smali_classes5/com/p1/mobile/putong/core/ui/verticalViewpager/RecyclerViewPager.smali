.class public Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;
.super Landroidx/recyclerview/widget/RecyclerView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$c;
    }
.end annotation


# instance fields
.field public a:Ll/wrc0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/wrc0<",
            "*>;"
        }
    .end annotation
.end field

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$c;",
            ">;"
        }
    .end annotation
.end field

.field public g:I

.field public h:I

.field public i:Z

.field public j:Z

.field public k:F

.field public l:Landroid/graphics/PointF;

.field public m:Z

.field public n:I

.field public o:I

.field public p:Landroid/view/View;

.field public q:I

.field public r:I

.field public s:I

.field public t:I

.field public u:I

.field public v:Z

.field public w:Z

.field public x:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 62
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 61
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 3

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3e800000    # 0.25f

    .line 5
    .line 6
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->b:F

    .line 7
    .line 8
    const v0, 0x3e19999a    # 0.15f

    .line 9
    .line 10
    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->c:F

    .line 12
    .line 13
    const/high16 v0, 0x41c80000    # 25.0f

    .line 14
    .line 15
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->d:F

    .line 16
    .line 17
    const/4 v0, -0x1

    .line 18
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->g:I

    .line 19
    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->h:I

    .line 21
    .line 22
    const/high16 v1, -0x80000000

    .line 23
    .line 24
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->q:I

    .line 25
    .line 26
    const v2, 0x7fffffff

    .line 27
    .line 28
    .line 29
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->r:I

    .line 30
    .line 31
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->s:I

    .line 32
    .line 33
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->t:I

    .line 34
    .line 35
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->u:I

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->v:Z

    .line 39
    .line 40
    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->w:Z

    .line 42
    .line 43
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->O(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 47
    .line 48
    .line 49
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    int-to-float p1, p1

    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->k:F

    .line 59
    .line 60
    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->d:F

    return p0
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->f:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->h:I

    return p0
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->g:I

    return p0
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->v:Z

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)I
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->getItemCount()I

    move-result p0

    return p0
.end method

.method private getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->a:Ll/wrc0;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/wrc0;->getItemCount()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method


# virtual methods
.method public K(I)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->w:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    mul-int/lit8 p1, p1, -0x1

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->P()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    mul-int/lit8 p1, p1, -0x1

    .line 14
    .line 15
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_9

    .line 20
    .line 21
    invoke-static {p0}, Ll/w9l0;->b(Landroidx/recyclerview/widget/RecyclerView;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    sub-int/2addr v1, v2

    .line 34
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    sub-int/2addr v1, v2

    .line 39
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->N(II)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    add-int v1, v0, p1

    .line 44
    .line 45
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->i:Z

    .line 46
    .line 47
    const/4 v3, 0x1

    .line 48
    if-eqz v2, :cond_3

    .line 49
    .line 50
    invoke-static {v3, p1}, Ljava/lang/Math;->min(II)I

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    const/4 v1, -0x1

    .line 55
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_2

    .line 60
    .line 61
    move v1, v0

    .line 62
    goto :goto_0

    .line 63
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->u:I

    .line 64
    .line 65
    add-int/2addr v1, p1

    .line 66
    :cond_3
    :goto_0
    const/4 p1, 0x0

    .line 67
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->getItemCount()I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    sub-int/2addr v1, v3

    .line 76
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-ne p1, v0, :cond_8

    .line 81
    .line 82
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->i:Z

    .line 83
    .line 84
    if-eqz v1, :cond_4

    .line 85
    .line 86
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->u:I

    .line 87
    .line 88
    if-ne v1, v0, :cond_8

    .line 89
    .line 90
    :cond_4
    invoke-static {p0}, Ll/w9l0;->a(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-eqz v1, :cond_8

    .line 99
    .line 100
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->e:F

    .line 101
    .line 102
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    int-to-float v2, v2

    .line 107
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->b:F

    .line 108
    .line 109
    mul-float/2addr v2, v4

    .line 110
    mul-float/2addr v2, v4

    .line 111
    cmpl-float v1, v1, v2

    .line 112
    .line 113
    if-lez v1, :cond_7

    .line 114
    .line 115
    if-eqz p1, :cond_7

    .line 116
    .line 117
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->w:Z

    .line 118
    .line 119
    if-nez v0, :cond_6

    .line 120
    .line 121
    :cond_5
    add-int/lit8 p1, p1, -0x1

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_6
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_7
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->e:F

    .line 128
    .line 129
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    int-to-float v0, v0

    .line 134
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->b:F

    .line 135
    .line 136
    neg-float v2, v2

    .line 137
    mul-float/2addr v0, v2

    .line 138
    cmpg-float v0, v1, v0

    .line 139
    .line 140
    if-gez v0, :cond_8

    .line 141
    .line 142
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->getItemCount()I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    sub-int/2addr v0, v3

    .line 147
    if-eq p1, v0, :cond_8

    .line 148
    .line 149
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->w:Z

    .line 150
    .line 151
    if-nez v0, :cond_5

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_8
    :goto_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->getItemCount()I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->Q(II)I

    .line 159
    .line 160
    .line 161
    move-result p1

    .line 162
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->smoothScrollToPosition(I)V

    .line 163
    .line 164
    .line 165
    :cond_9
    return-void
.end method

.method public L(I)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->w:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    mul-int/lit8 p1, p1, -0x1

    .line 6
    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-lez v0, :cond_8

    .line 12
    .line 13
    invoke-static {p0}, Ll/w9l0;->d(Landroidx/recyclerview/widget/RecyclerView;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    sub-int/2addr v1, v2

    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    sub-int/2addr v1, v2

    .line 31
    invoke-virtual {p0, p1, v1}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->N(II)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    add-int v1, v0, p1

    .line 36
    .line 37
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->i:Z

    .line 38
    .line 39
    const/4 v3, 0x1

    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    invoke-static {v3, p1}, Ljava/lang/Math;->min(II)I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    const/4 v1, -0x1

    .line 47
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_1

    .line 52
    .line 53
    move v1, v0

    .line 54
    goto :goto_0

    .line 55
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->u:I

    .line 56
    .line 57
    add-int/2addr v1, p1

    .line 58
    :cond_2
    :goto_0
    const/4 p1, 0x0

    .line 59
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 60
    .line 61
    .line 62
    move-result p1

    .line 63
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->getItemCount()I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    sub-int/2addr v1, v3

    .line 68
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-ne p1, v0, :cond_7

    .line 73
    .line 74
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->i:Z

    .line 75
    .line 76
    if-eqz v1, :cond_3

    .line 77
    .line 78
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->u:I

    .line 79
    .line 80
    if-ne v1, v0, :cond_7

    .line 81
    .line 82
    :cond_3
    invoke-static {p0}, Ll/w9l0;->c(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_7

    .line 91
    .line 92
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->e:F

    .line 93
    .line 94
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    int-to-float v2, v2

    .line 99
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->b:F

    .line 100
    .line 101
    mul-float/2addr v2, v4

    .line 102
    cmpl-float v1, v1, v2

    .line 103
    .line 104
    if-lez v1, :cond_6

    .line 105
    .line 106
    if-eqz p1, :cond_6

    .line 107
    .line 108
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->w:Z

    .line 109
    .line 110
    if-nez v0, :cond_5

    .line 111
    .line 112
    :cond_4
    add-int/lit8 p1, p1, -0x1

    .line 113
    .line 114
    goto :goto_2

    .line 115
    :cond_5
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_6
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->e:F

    .line 119
    .line 120
    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    int-to-float v0, v0

    .line 125
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->b:F

    .line 126
    .line 127
    neg-float v2, v2

    .line 128
    mul-float/2addr v0, v2

    .line 129
    cmpg-float v0, v1, v0

    .line 130
    .line 131
    if-gez v0, :cond_7

    .line 132
    .line 133
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->getItemCount()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    sub-int/2addr v0, v3

    .line 138
    if-eq p1, v0, :cond_7

    .line 139
    .line 140
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->w:Z

    .line 141
    .line 142
    if-nez v0, :cond_4

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_7
    :goto_2
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->getItemCount()I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->Q(II)I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->smoothScrollToPosition(I)V

    .line 154
    .line 155
    .line 156
    :cond_8
    return-void
.end method

.method public M(Landroidx/recyclerview/widget/RecyclerView$Adapter;)Ll/wrc0;
    .locals 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    instance-of v0, p1, Ll/wrc0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/wrc0;

    .line 6
    .line 7
    return-object p1

    .line 8
    :cond_0
    new-instance v0, Ll/wrc0;

    .line 9
    .line 10
    invoke-direct {v0, p0, p1}, Ll/wrc0;-><init>(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public final N(II)I
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return p0

    .line 5
    :cond_0
    if-lez p1, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_1
    const/4 v0, -0x1

    .line 10
    :goto_0
    int-to-double v1, v0

    .line 11
    mul-int/2addr p1, v0

    .line 12
    int-to-float p1, p1

    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->c:F

    .line 14
    .line 15
    mul-float/2addr p1, v0

    .line 16
    int-to-float p2, p2

    .line 17
    div-float/2addr p1, p2

    .line 18
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->b:F

    .line 19
    .line 20
    sub-float/2addr p1, p0

    .line 21
    float-to-double p0, p1

    .line 22
    invoke-static {p0, p1}, Ljava/lang/Math;->ceil(D)D

    .line 23
    .line 24
    .line 25
    move-result-wide p0

    .line 26
    mul-double/2addr v1, p0

    .line 27
    double-to-int p0, v1

    .line 28
    return p0
.end method

.method public final O(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    sget-object v0, Ll/khc0;->z1:[I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget p2, Ll/khc0;->A1:I

    .line 9
    .line 10
    const p3, 0x3e19999a    # 0.15f

    .line 11
    .line 12
    .line 13
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->c:F

    .line 18
    .line 19
    sget p2, Ll/khc0;->E1:I

    .line 20
    .line 21
    const/high16 p3, 0x3e800000    # 0.25f

    .line 22
    .line 23
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->b:F

    .line 28
    .line 29
    sget p2, Ll/khc0;->D1:I

    .line 30
    .line 31
    iget-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->i:Z

    .line 32
    .line 33
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->i:Z

    .line 38
    .line 39
    sget p2, Ll/khc0;->B1:I

    .line 40
    .line 41
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->j:Z

    .line 46
    .line 47
    sget p2, Ll/khc0;->C1:I

    .line 48
    .line 49
    const/high16 p3, 0x41c80000    # 25.0f

    .line 50
    .line 51
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->d:F

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public final P()Z
    .locals 0

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p0}, Ll/lsi0;->a(Ljava/util/Locale;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final Q(II)I
    .locals 0

    .line 1
    if-gez p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    if-lt p1, p2, :cond_1

    add-int/lit8 p2, p2, -0x1

    return p2

    :cond_1
    return p1
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollHorizontally()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-static {p0}, Ll/w9l0;->b(Landroidx/recyclerview/widget/RecyclerView;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    invoke-static {p0}, Ll/w9l0;->d(Landroidx/recyclerview/widget/RecyclerView;)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    :goto_0
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->u:I

    .line 37
    .line 38
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->x:F

    .line 43
    .line 44
    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0
.end method

.method public fling(II)Z
    .locals 3

    .line 1
    int-to-float v0, p1

    .line 2
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->c:F

    .line 3
    .line 4
    mul-float/2addr v0, v1

    .line 5
    float-to-int v0, v0

    .line 6
    int-to-float v2, p2

    .line 7
    mul-float/2addr v2, v1

    .line 8
    float-to-int v1, v2

    .line 9
    invoke-super {p0, v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->fling(II)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollHorizontally()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->K(I)V

    .line 26
    .line 27
    .line 28
    return v0

    .line 29
    :cond_0
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->L(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return v0
.end method

.method public getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->a:Ll/wrc0;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->a:Ll/wrc0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/wrc0;->b:Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public getCurrentPosition()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollHorizontally()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ll/w9l0;->b(Landroidx/recyclerview/widget/RecyclerView;)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-static {p0}, Ll/w9l0;->d(Landroidx/recyclerview/widget/RecyclerView;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    :goto_0
    if-gez v0, :cond_1

    .line 21
    .line 22
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->g:I

    .line 23
    .line 24
    return p0

    .line 25
    :cond_1
    return v0
.end method

.method public getFlingFactor()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->c:F

    .line 2
    .line 3
    return p0
.end method

.method public getTriggerOffset()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->b:F

    .line 2
    .line 3
    return p0
.end method

.method public getWrapperAdapter()Ll/wrc0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->a:Ll/wrc0;

    .line 2
    .line 3
    return-object p0
.end method

.method public getlLastY()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->x:F

    .line 2
    .line 3
    return p0
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->l:Landroid/graphics/PointF;

    .line 14
    .line 15
    if-nez v2, :cond_0

    .line 16
    .line 17
    new-instance v2, Landroid/graphics/PointF;

    .line 18
    .line 19
    invoke-direct {v2}, Landroid/graphics/PointF;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->l:Landroid/graphics/PointF;

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    and-int/lit16 v2, v2, 0xff

    .line 29
    .line 30
    if-eqz v2, :cond_5

    .line 31
    .line 32
    const/4 v3, 0x2

    .line 33
    if-eq v2, v3, :cond_1

    .line 34
    .line 35
    goto/16 :goto_0

    .line 36
    .line 37
    :cond_1
    mul-float v2, v0, v0

    .line 38
    .line 39
    mul-float v3, v1, v1

    .line 40
    .line 41
    add-float/2addr v2, v3

    .line 42
    float-to-double v2, v2

    .line 43
    invoke-static {v2, v3}, Ljava/lang/Math;->sqrt(D)D

    .line 44
    .line 45
    .line 46
    move-result-wide v2

    .line 47
    double-to-float v2, v2

    .line 48
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->l:Landroid/graphics/PointF;

    .line 49
    .line 50
    iget v4, v3, Landroid/graphics/PointF;->x:F

    .line 51
    .line 52
    mul-float/2addr v4, v4

    .line 53
    iget v3, v3, Landroid/graphics/PointF;->y:F

    .line 54
    .line 55
    mul-float/2addr v3, v3

    .line 56
    add-float/2addr v4, v3

    .line 57
    float-to-double v3, v4

    .line 58
    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    .line 59
    .line 60
    .line 61
    move-result-wide v3

    .line 62
    double-to-float v3, v3

    .line 63
    sub-float/2addr v3, v2

    .line 64
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->k:F

    .line 69
    .line 70
    cmpl-float v2, v2, v3

    .line 71
    .line 72
    if-lez v2, :cond_6

    .line 73
    .line 74
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->l:Landroid/graphics/PointF;

    .line 75
    .line 76
    iget v2, p1, Landroid/graphics/PointF;->y:F

    .line 77
    .line 78
    sub-float/2addr v2, v1

    .line 79
    iget p1, p1, Landroid/graphics/PointF;->x:F

    .line 80
    .line 81
    sub-float/2addr p1, v0

    .line 82
    div-float/2addr v2, p1

    .line 83
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->l:Landroid/graphics/PointF;

    .line 88
    .line 89
    iget v2, v2, Landroid/graphics/PointF;->y:F

    .line 90
    .line 91
    sub-float/2addr v2, v1

    .line 92
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    const/high16 v2, 0x3f800000    # 1.0f

    .line 97
    .line 98
    cmpg-float v1, v1, v2

    .line 99
    .line 100
    if-gez v1, :cond_2

    .line 101
    .line 102
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollHorizontally()Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    return p0

    .line 111
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->l:Landroid/graphics/PointF;

    .line 112
    .line 113
    iget v1, v1, Landroid/graphics/PointF;->x:F

    .line 114
    .line 115
    sub-float/2addr v1, v0

    .line 116
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    cmpg-float v0, v0, v2

    .line 121
    .line 122
    const/4 v1, 0x1

    .line 123
    if-gez v0, :cond_3

    .line 124
    .line 125
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollHorizontally()Z

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    xor-int/2addr p0, v1

    .line 134
    return p0

    .line 135
    :cond_3
    float-to-double p0, p1

    .line 136
    const-wide/high16 v2, 0x403e000000000000L    # 30.0

    .line 137
    .line 138
    invoke-static {v2, v3}, Ljava/lang/Math;->toRadians(D)D

    .line 139
    .line 140
    .line 141
    move-result-wide v2

    .line 142
    invoke-static {v2, v3}, Ljava/lang/Math;->tan(D)D

    .line 143
    .line 144
    .line 145
    move-result-wide v2

    .line 146
    cmpg-double p0, p0, v2

    .line 147
    .line 148
    if-gez p0, :cond_4

    .line 149
    .line 150
    return v1

    .line 151
    :cond_4
    const/4 p0, 0x0

    .line 152
    return p0

    .line 153
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->l:Landroid/graphics/PointF;

    .line 154
    .line 155
    invoke-virtual {v2, v0, v1}, Landroid/graphics/PointF;->set(FF)V

    .line 156
    .line 157
    .line 158
    :cond_6
    :goto_0
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    return p0
.end method

.method public onRestoreInstanceState(Landroid/os/Parcelable;)V
    .locals 5

    .line 1
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "mLayoutState"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    const-string v3, "mAnchorOffset"

    .line 24
    .line 25
    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const-string v4, "mAnchorPosition"

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v3, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v2, v1}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    if-lez v4, :cond_0

    .line 50
    .line 51
    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    .line 52
    .line 53
    .line 54
    move-result v4

    .line 55
    sub-int/2addr v4, v1

    .line 56
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    invoke-virtual {v3, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :catchall_0
    move-exception v0

    .line 65
    goto :goto_1

    .line 66
    :cond_0
    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    .line 67
    .line 68
    .line 69
    move-result v4

    .line 70
    if-gez v4, :cond_1

    .line 71
    .line 72
    invoke-virtual {v3, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    add-int/2addr v4, v1

    .line 77
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v3, v0, v1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 82
    .line 83
    .line 84
    :cond_1
    :goto_0
    const/4 v1, 0x0

    .line 85
    invoke-virtual {v2, v0, v1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 86
    .line 87
    .line 88
    goto :goto_2

    .line 89
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    :goto_2
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onRestoreInstanceState(Landroid/os/Parcelable;)V

    .line 93
    .line 94
    .line 95
    return-void
.end method

.method public onScrollStateChanged(I)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onScrollStateChanged(I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne p1, v2, :cond_3

    .line 8
    .line 9
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->m:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollHorizontally()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    invoke-static {p0}, Ll/w9l0;->a(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-static {p0}, Ll/w9l0;->c(Landroidx/recyclerview/widget/RecyclerView;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 31
    .line 32
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_2

    .line 37
    .line 38
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->v:Z

    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->getChildLayoutPosition(Landroid/view/View;)I

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->h:I

    .line 49
    .line 50
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->v:Z

    .line 51
    .line 52
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->n:I

    .line 59
    .line 60
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->o:I

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_2
    const/4 p1, -0x1

    .line 70
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->h:I

    .line 71
    .line 72
    :goto_1
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->e:F

    .line 73
    .line 74
    return-void

    .line 75
    :cond_3
    const/4 v2, 0x2

    .line 76
    const/4 v3, 0x0

    .line 77
    if-ne p1, v2, :cond_6

    .line 78
    .line 79
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->m:Z

    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 82
    .line 83
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_5

    .line 88
    .line 89
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollHorizontally()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 98
    .line 99
    if-eqz p1, :cond_4

    .line 100
    .line 101
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->n:I

    .line 106
    .line 107
    sub-int/2addr p1, v0

    .line 108
    int-to-float p1, p1

    .line 109
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->e:F

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_4
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->o:I

    .line 117
    .line 118
    sub-int/2addr p1, v0

    .line 119
    int-to-float p1, p1

    .line 120
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->e:F

    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->e:F

    .line 124
    .line 125
    :goto_2
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 126
    .line 127
    return-void

    .line 128
    :cond_6
    if-nez p1, :cond_13

    .line 129
    .line 130
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->m:Z

    .line 131
    .line 132
    if-eqz p1, :cond_11

    .line 133
    .line 134
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollHorizontally()Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-eqz p1, :cond_7

    .line 143
    .line 144
    invoke-static {p0}, Ll/w9l0;->b(Landroidx/recyclerview/widget/RecyclerView;)I

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    goto :goto_3

    .line 149
    :cond_7
    invoke-static {p0}, Ll/w9l0;->d(Landroidx/recyclerview/widget/RecyclerView;)I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    :goto_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 154
    .line 155
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-eqz v0, :cond_10

    .line 160
    .line 161
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 162
    .line 163
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->getChildAdapterPosition(Landroid/view/View;)I

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->canScrollHorizontally()Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-eqz v0, :cond_c

    .line 176
    .line 177
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->P()Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 182
    .line 183
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 184
    .line 185
    .line 186
    move-result v1

    .line 187
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->n:I

    .line 188
    .line 189
    sub-int/2addr v1, v2

    .line 190
    int-to-float v1, v1

    .line 191
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 192
    .line 193
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 194
    .line 195
    .line 196
    move-result v2

    .line 197
    int-to-float v2, v2

    .line 198
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->b:F

    .line 199
    .line 200
    mul-float/2addr v2, v4

    .line 201
    cmpl-float v2, v1, v2

    .line 202
    .line 203
    if-lez v2, :cond_a

    .line 204
    .line 205
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 206
    .line 207
    invoke-virtual {v2}, Landroid/view/View;->getLeft()I

    .line 208
    .line 209
    .line 210
    move-result v2

    .line 211
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->q:I

    .line 212
    .line 213
    if-lt v2, v4, :cond_a

    .line 214
    .line 215
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->w:Z

    .line 216
    .line 217
    if-nez v1, :cond_9

    .line 218
    .line 219
    if-eqz v0, :cond_e

    .line 220
    .line 221
    :cond_8
    :goto_4
    add-int/lit8 p1, p1, -0x1

    .line 222
    .line 223
    goto/16 :goto_6

    .line 224
    .line 225
    :cond_9
    if-eqz v0, :cond_8

    .line 226
    .line 227
    goto :goto_5

    .line 228
    :cond_a
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 229
    .line 230
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 231
    .line 232
    .line 233
    move-result v2

    .line 234
    int-to-float v2, v2

    .line 235
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->b:F

    .line 236
    .line 237
    neg-float v4, v4

    .line 238
    mul-float/2addr v2, v4

    .line 239
    cmpg-float v1, v1, v2

    .line 240
    .line 241
    if-gez v1, :cond_10

    .line 242
    .line 243
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 244
    .line 245
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->r:I

    .line 250
    .line 251
    if-gt v1, v2, :cond_10

    .line 252
    .line 253
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->w:Z

    .line 254
    .line 255
    if-nez v1, :cond_b

    .line 256
    .line 257
    if-eqz v0, :cond_8

    .line 258
    .line 259
    goto :goto_5

    .line 260
    :cond_b
    if-eqz v0, :cond_e

    .line 261
    .line 262
    goto :goto_4

    .line 263
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 264
    .line 265
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 266
    .line 267
    .line 268
    move-result v0

    .line 269
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->o:I

    .line 270
    .line 271
    sub-int/2addr v0, v1

    .line 272
    int-to-float v0, v0

    .line 273
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 274
    .line 275
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    int-to-float v1, v1

    .line 280
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->b:F

    .line 281
    .line 282
    mul-float/2addr v1, v2

    .line 283
    cmpl-float v1, v0, v1

    .line 284
    .line 285
    if-lez v1, :cond_f

    .line 286
    .line 287
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 288
    .line 289
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->s:I

    .line 294
    .line 295
    if-lt v1, v2, :cond_f

    .line 296
    .line 297
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->w:Z

    .line 298
    .line 299
    if-nez v0, :cond_e

    .line 300
    .line 301
    :cond_d
    add-int/lit8 p1, p1, -0x1

    .line 302
    .line 303
    goto :goto_6

    .line 304
    :cond_e
    :goto_5
    add-int/lit8 p1, p1, 0x1

    .line 305
    .line 306
    goto :goto_6

    .line 307
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 308
    .line 309
    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    .line 310
    .line 311
    .line 312
    move-result v1

    .line 313
    int-to-float v1, v1

    .line 314
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->b:F

    .line 315
    .line 316
    neg-float v2, v2

    .line 317
    mul-float/2addr v1, v2

    .line 318
    cmpg-float v0, v0, v1

    .line 319
    .line 320
    if-gez v0, :cond_10

    .line 321
    .line 322
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 323
    .line 324
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 325
    .line 326
    .line 327
    move-result v0

    .line 328
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->t:I

    .line 329
    .line 330
    if-gt v0, v1, :cond_10

    .line 331
    .line 332
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->w:Z

    .line 333
    .line 334
    if-nez v0, :cond_d

    .line 335
    .line 336
    goto :goto_5

    .line 337
    :cond_10
    :goto_6
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->getItemCount()I

    .line 338
    .line 339
    .line 340
    move-result v0

    .line 341
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->Q(II)I

    .line 342
    .line 343
    .line 344
    move-result p1

    .line 345
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->smoothScrollToPosition(I)V

    .line 346
    .line 347
    .line 348
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 349
    .line 350
    goto :goto_7

    .line 351
    :cond_11
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->g:I

    .line 352
    .line 353
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->h:I

    .line 354
    .line 355
    if-eq p1, v0, :cond_12

    .line 356
    .line 357
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->h:I

    .line 358
    .line 359
    :cond_12
    :goto_7
    const/high16 p1, -0x80000000

    .line 360
    .line 361
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->q:I

    .line 362
    .line 363
    const v0, 0x7fffffff

    .line 364
    .line 365
    .line 366
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->r:I

    .line 367
    .line 368
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->s:I

    .line 369
    .line 370
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->t:I

    .line 371
    .line 372
    :cond_13
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 9
    .line 10
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->q:I

    .line 23
    .line 24
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->q:I

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->s:I

    .line 37
    .line 38
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->s:I

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 45
    .line 46
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->r:I

    .line 51
    .line 52
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->r:I

    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->p:Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/view/View;->getTop()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->t:I

    .line 65
    .line 66
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->t:I

    .line 71
    .line 72
    :cond_0
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    return p0
.end method

.method public scrollToPosition(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->getCurrentPosition()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->h:I

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->g:I

    .line 8
    .line 9
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    new-instance v0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$b;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$b;-><init>(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->M(Landroidx/recyclerview/widget/RecyclerView$Adapter;)Ll/wrc0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->a:Ll/wrc0;

    .line 6
    .line 7
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setFlingFactor(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->c:F

    .line 2
    .line 3
    return-void
.end method

.method public setInertia(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$o;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 9
    .line 10
    invoke-virtual {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;->getReverseLayout()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->w:Z

    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setSinglePageFling(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->i:Z

    .line 2
    .line 3
    return-void
.end method

.method public setTriggerOffset(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->b:F

    .line 2
    .line 3
    return-void
.end method

.method public smoothScrollToPosition(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->h:I

    .line 2
    .line 3
    if-gez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->getCurrentPosition()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->h:I

    .line 10
    .line 11
    :cond_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->g:I

    .line 12
    .line 13
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    instance-of v0, v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    .line 28
    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    new-instance v0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$a;

    .line 32
    .line 33
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager$a;-><init>(Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;Landroid/content/Context;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$z;->setTargetPosition(I)V

    .line 41
    .line 42
    .line 43
    const/4 v1, -0x1

    .line 44
    if-ne p1, v1, :cond_1

    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$o;->startSmoothScroll(Landroidx/recyclerview/widget/RecyclerView$z;)V

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_2
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public swapAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->M(Landroidx/recyclerview/widget/RecyclerView$Adapter;)Ll/wrc0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/verticalViewpager/RecyclerViewPager;->a:Ll/wrc0;

    .line 6
    .line 7
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->swapAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
