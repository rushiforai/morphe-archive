.class public Ll/puf0;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:I

.field public e:I


# direct methods
.method public constructor <init>(II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ll/puf0;->e:I

    .line 6
    .line 7
    iput p1, p0, Ll/puf0;->a:I

    .line 8
    .line 9
    iput p2, p0, Ll/puf0;->b:I

    .line 10
    .line 11
    div-int/2addr p1, p2

    .line 12
    iput p1, p0, Ll/puf0;->c:I

    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public getItemOffsets(Landroid/graphics/Rect;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$a0;)V
    .locals 7

    .line 1
    invoke-virtual {p2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    check-cast p2, Landroidx/recyclerview/widget/RecyclerView$p;

    .line 6
    .line 7
    invoke-virtual {p4}, Landroidx/recyclerview/widget/RecyclerView$a0;->c()I

    .line 8
    .line 9
    .line 10
    move-result p4

    .line 11
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$p;->b()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    instance-of v1, p2, Landroidx/recyclerview/widget/GridLayoutManager$b;

    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x1

    .line 19
    if-eqz v1, :cond_4

    .line 20
    .line 21
    check-cast p2, Landroidx/recyclerview/widget/GridLayoutManager$b;

    .line 22
    .line 23
    invoke-virtual {p2}, Landroidx/recyclerview/widget/GridLayoutManager$b;->h()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p2}, Landroidx/recyclerview/widget/GridLayoutManager$b;->g()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget v4, p0, Ll/puf0;->e:I

    .line 34
    .line 35
    if-eq v4, p4, :cond_3

    .line 36
    .line 37
    :cond_0
    iget v4, p0, Ll/puf0;->b:I

    .line 38
    .line 39
    if-le v4, v3, :cond_3

    .line 40
    .line 41
    sub-int v4, p4, v4

    .line 42
    .line 43
    :goto_0
    if-ge v4, p4, :cond_2

    .line 44
    .line 45
    invoke-virtual {p3}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$o;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    check-cast v5, Landroidx/recyclerview/widget/GridLayoutManager;

    .line 50
    .line 51
    invoke-virtual {v5}, Landroidx/recyclerview/widget/GridLayoutManager;->q()Landroidx/recyclerview/widget/GridLayoutManager$c;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    iget v6, p0, Ll/puf0;->b:I

    .line 56
    .line 57
    invoke-virtual {v5, v4, v6}, Landroidx/recyclerview/widget/GridLayoutManager$c;->e(II)I

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    if-nez v5, :cond_1

    .line 62
    .line 63
    move v2, v3

    .line 64
    goto :goto_1

    .line 65
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 66
    .line 67
    :goto_1
    add-int/lit8 v4, v4, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    iput v2, p0, Ll/puf0;->d:I

    .line 71
    .line 72
    iget v2, p0, Ll/puf0;->e:I

    .line 73
    .line 74
    if-eq v2, p4, :cond_3

    .line 75
    .line 76
    iput p4, p0, Ll/puf0;->e:I

    .line 77
    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    new-instance v2, Ll/puf0$a;

    .line 81
    .line 82
    invoke-direct {v2, p0, p3}, Ll/puf0$a;-><init>(Ll/puf0;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p3, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 86
    .line 87
    .line 88
    :cond_3
    move v2, p2

    .line 89
    goto :goto_3

    .line 90
    :cond_4
    instance-of p3, p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    .line 91
    .line 92
    if-eqz p3, :cond_6

    .line 93
    .line 94
    check-cast p2, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;

    .line 95
    .line 96
    invoke-virtual {p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->h()Z

    .line 97
    .line 98
    .line 99
    move-result p3

    .line 100
    if-eqz p3, :cond_5

    .line 101
    .line 102
    iget p3, p0, Ll/puf0;->b:I

    .line 103
    .line 104
    move v1, p3

    .line 105
    goto :goto_2

    .line 106
    :cond_5
    move v1, v3

    .line 107
    :goto_2
    invoke-virtual {p2}, Landroidx/recyclerview/widget/StaggeredGridLayoutManager$c;->g()I

    .line 108
    .line 109
    .line 110
    move-result v2

    .line 111
    goto :goto_3

    .line 112
    :cond_6
    move v1, v3

    .line 113
    :goto_3
    if-lt v1, v3, :cond_a

    .line 114
    .line 115
    if-ltz v2, :cond_a

    .line 116
    .line 117
    iget p2, p0, Ll/puf0;->b:I

    .line 118
    .line 119
    if-le v1, p2, :cond_7

    .line 120
    .line 121
    goto :goto_5

    .line 122
    :cond_7
    iget p3, p0, Ll/puf0;->a:I

    .line 123
    .line 124
    iget v4, p0, Ll/puf0;->c:I

    .line 125
    .line 126
    mul-int v5, v4, v2

    .line 127
    .line 128
    sub-int v5, p3, v5

    .line 129
    .line 130
    iput v5, p1, Landroid/graphics/Rect;->left:I

    .line 131
    .line 132
    add-int/2addr v2, v1

    .line 133
    sub-int/2addr v2, v3

    .line 134
    mul-int/2addr v2, v4

    .line 135
    add-int/2addr v4, v2

    .line 136
    iput v4, p1, Landroid/graphics/Rect;->right:I

    .line 137
    .line 138
    if-ne p2, v3, :cond_8

    .line 139
    .line 140
    add-int/lit8 p2, p4, -0x1

    .line 141
    .line 142
    if-ne v0, p2, :cond_8

    .line 143
    .line 144
    iput p3, p1, Landroid/graphics/Rect;->bottom:I

    .line 145
    .line 146
    goto :goto_4

    .line 147
    :cond_8
    iget p2, p0, Ll/puf0;->d:I

    .line 148
    .line 149
    sub-int p2, p4, p2

    .line 150
    .line 151
    if-lt v0, p2, :cond_9

    .line 152
    .line 153
    if-ge v0, p4, :cond_9

    .line 154
    .line 155
    const/high16 p2, 0x42f00000    # 120.0f

    .line 156
    .line 157
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    add-int/2addr p3, p2

    .line 162
    iput p3, p1, Landroid/graphics/Rect;->bottom:I

    .line 163
    .line 164
    :cond_9
    :goto_4
    iget p0, p0, Ll/puf0;->a:I

    .line 165
    .line 166
    iput p0, p1, Landroid/graphics/Rect;->top:I

    .line 167
    .line 168
    :cond_a
    :goto_5
    return-void
.end method
