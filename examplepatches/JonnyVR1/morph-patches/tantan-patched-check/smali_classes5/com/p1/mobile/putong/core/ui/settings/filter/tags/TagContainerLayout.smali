.class public Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:Z

.field public d:I

.field public e:Z

.field public f:Z

.field public g:Z

.field public h:Z

.field public i:Ll/j1i0;

.field public j:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 84
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 83
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p3, 0x0

    .line 5
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->e:Z

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->f:Z

    .line 9
    .line 10
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->g:Z

    .line 11
    .line 12
    iput-boolean p3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->h:Z

    .line 13
    .line 14
    new-instance v0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;-><init>(Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;Ll/k1i0;)V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->j:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;

    .line 21
    .line 22
    sget-object v0, Ll/xhc0;->e0:[I

    .line 23
    .line 24
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    sget p2, Ll/xhc0;->g0:I

    .line 29
    .line 30
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/high16 v1, 0x41800000    # 16.0f

    .line 35
    .line 36
    invoke-static {v0, v1}, Ll/jvd;->a(Landroid/content/Context;F)I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->a:I

    .line 45
    .line 46
    sget p2, Ll/xhc0;->i0:I

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v0, v1}, Ll/jvd;->a(Landroid/content/Context;F)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->b:I

    .line 61
    .line 62
    sget p2, Ll/xhc0;->f0:I

    .line 63
    .line 64
    const/4 v0, 0x3

    .line 65
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->d:I

    .line 70
    .line 71
    sget p2, Ll/xhc0;->h0:I

    .line 72
    .line 73
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 74
    .line 75
    .line 76
    move-result p2

    .line 77
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->c:Z

    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;)Ll/j1i0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->i:Ll/j1i0;

    return-object p0
.end method


# virtual methods
.method public getCOLUMN()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->i:Ll/j1i0;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->i:Ll/j1i0;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/j1i0;->e()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    const/4 p1, 0x0

    .line 5
    move p3, p1

    .line 6
    move p5, p3

    .line 7
    move v0, p5

    .line 8
    move v1, v0

    .line 9
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge p3, v2, :cond_3

    .line 14
    .line 15
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredHeight()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    add-int/2addr p5, v3

    .line 28
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->b:I

    .line 29
    .line 30
    add-int v6, v4, v5

    .line 31
    .line 32
    mul-int/2addr v6, v0

    .line 33
    add-int/2addr v6, v4

    .line 34
    sub-int v7, p4, p2

    .line 35
    .line 36
    if-gt p5, v7, :cond_1

    .line 37
    .line 38
    iget-boolean v7, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->e:Z

    .line 39
    .line 40
    if-eqz v7, :cond_2

    .line 41
    .line 42
    iget v7, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->d:I

    .line 43
    .line 44
    if-lt v1, v7, :cond_2

    .line 45
    .line 46
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 47
    .line 48
    add-int/2addr v5, v4

    .line 49
    mul-int/2addr v5, v0

    .line 50
    add-int v6, v5, v4

    .line 51
    .line 52
    move v1, p1

    .line 53
    move p5, v3

    .line 54
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    sub-int v3, p5, v3

    .line 57
    .line 58
    sub-int v4, v6, v4

    .line 59
    .line 60
    invoke-virtual {v2, v3, v4, p5, v6}, Landroid/view/View;->layout(IIII)V

    .line 61
    .line 62
    .line 63
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->a:I

    .line 64
    .line 65
    add-int/2addr p5, v2

    .line 66
    add-int/lit8 p3, p3, 0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    :goto_1
    return-void
.end method

.method public onMeasure(II)V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-gtz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, v1, v2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->measureChildren(II)V

    .line 17
    .line 18
    .line 19
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->c:Z

    .line 20
    .line 21
    const/4 p2, 0x1

    .line 22
    if-eqz p1, :cond_7

    .line 23
    .line 24
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->g:Z

    .line 25
    .line 26
    if-eqz p1, :cond_1

    .line 27
    .line 28
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->d:I

    .line 29
    .line 30
    if-le p1, p2, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget p1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 41
    .line 42
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->d:I

    .line 43
    .line 44
    mul-int v4, v3, p1

    .line 45
    .line 46
    sub-int v4, v1, v4

    .line 47
    .line 48
    sub-int/2addr v3, p2

    .line 49
    div-int/2addr v4, v3

    .line 50
    iput v4, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->a:I

    .line 51
    .line 52
    iput v4, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->b:I

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->d:I

    .line 56
    .line 57
    add-int/lit8 v3, p1, -0x1

    .line 58
    .line 59
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->a:I

    .line 60
    .line 61
    mul-int/2addr v3, v4

    .line 62
    sub-int v3, v1, v3

    .line 63
    .line 64
    div-int p1, v3, p1

    .line 65
    .line 66
    :goto_0
    move v3, v2

    .line 67
    :goto_1
    if-ge v3, v0, :cond_4

    .line 68
    .line 69
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    const/high16 v5, 0x40000000    # 2.0f

    .line 74
    .line 75
    invoke-static {p1, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    iget-boolean v7, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->h:Z

    .line 80
    .line 81
    if-eqz v7, :cond_2

    .line 82
    .line 83
    invoke-static {p1, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    goto :goto_2

    .line 88
    :cond_2
    iget-boolean v7, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->f:Z

    .line 89
    .line 90
    if-eqz v7, :cond_3

    .line 91
    .line 92
    const/16 v5, 0x96

    .line 93
    .line 94
    goto :goto_2

    .line 95
    :cond_3
    invoke-virtual {v4}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    iget v7, v7, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 100
    .line 101
    invoke-static {v7, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 102
    .line 103
    .line 104
    move-result v5

    .line 105
    :goto_2
    invoke-virtual {v4, v6, v5}, Landroid/view/View;->measure(II)V

    .line 106
    .line 107
    .line 108
    add-int/lit8 v3, v3, 0x1

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :cond_4
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    .line 116
    .line 117
    .line 118
    move-result v3

    .line 119
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->d:I

    .line 120
    .line 121
    div-int v5, v0, v4

    .line 122
    .line 123
    rem-int/2addr v0, v4

    .line 124
    if-lez v0, :cond_5

    .line 125
    .line 126
    move v2, p2

    .line 127
    :cond_5
    add-int/2addr v5, v2

    .line 128
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->h:Z

    .line 129
    .line 130
    if-eqz v0, :cond_6

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_6
    move p1, v3

    .line 134
    :goto_3
    mul-int/2addr p1, v5

    .line 135
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->b:I

    .line 136
    .line 137
    mul-int/2addr v0, v5

    .line 138
    add-int/2addr p1, v0

    .line 139
    sub-int/2addr p1, p2

    .line 140
    goto :goto_6

    .line 141
    :cond_7
    move v3, p2

    .line 142
    move v4, v1

    .line 143
    move p1, v2

    .line 144
    move v5, p1

    .line 145
    :goto_4
    if-ge p1, v0, :cond_a

    .line 146
    .line 147
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 148
    .line 149
    .line 150
    move-result-object v6

    .line 151
    invoke-virtual {v6}, Landroid/view/View;->getMeasuredWidth()I

    .line 152
    .line 153
    .line 154
    move-result v6

    .line 155
    if-lt v4, v6, :cond_9

    .line 156
    .line 157
    iget-boolean v7, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->e:Z

    .line 158
    .line 159
    if-eqz v7, :cond_8

    .line 160
    .line 161
    iget v7, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->d:I

    .line 162
    .line 163
    if-ge v5, v7, :cond_9

    .line 164
    .line 165
    :cond_8
    sub-int/2addr v4, v6

    .line 166
    add-int/lit8 v5, v5, 0x1

    .line 167
    .line 168
    goto :goto_5

    .line 169
    :cond_9
    add-int/lit8 v3, v3, 0x1

    .line 170
    .line 171
    sub-int v4, v1, v6

    .line 172
    .line 173
    move v5, p2

    .line 174
    :goto_5
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->a:I

    .line 175
    .line 176
    sub-int/2addr v4, v6

    .line 177
    add-int/lit8 p1, p1, 0x1

    .line 178
    .line 179
    goto :goto_4

    .line 180
    :cond_a
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    mul-int/2addr p1, v3

    .line 189
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->b:I

    .line 190
    .line 191
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->e:Z

    .line 192
    .line 193
    xor-int/2addr p2, v2

    .line 194
    sub-int/2addr v3, p2

    .line 195
    mul-int/2addr v0, v3

    .line 196
    add-int/2addr p1, v0

    .line 197
    :goto_6
    invoke-virtual {p0, v1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public setAdapter(Ll/j1i0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->i:Ll/j1i0;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->j:Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout$a;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Ll/j1i0;->d(Landroid/database/DataSetObserver;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setAutoAdjustSpace(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->g:Z

    .line 2
    .line 3
    return-void
.end method

.method public setCOLUMN(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->d:I

    .line 2
    .line 3
    return-void
.end method

.method public setCanAdjustChildHeight(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->f:Z

    .line 2
    .line 3
    return-void
.end method

.method public setColumnLimitWithoutCenter(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->e:Z

    .line 2
    .line 3
    return-void
.end method

.method public setISCENTER(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->c:Z

    .line 2
    .line 3
    return-void
.end method

.method public setIsSquare(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/settings/filter/tags/TagContainerLayout;->h:Z

    .line 2
    .line 3
    return-void
.end method
