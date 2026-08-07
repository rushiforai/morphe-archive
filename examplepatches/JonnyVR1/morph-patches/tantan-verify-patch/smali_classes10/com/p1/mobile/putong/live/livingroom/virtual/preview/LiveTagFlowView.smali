.class public Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;
.super Landroid/view/ViewGroup;
.source "SourceFile"


# instance fields
.field public a:Landroid/content/Context;

.field public b:Landroid/util/AttributeSet;

.field public c:I

.field public d:I

.field public e:Z

.field public f:I

.field public g:I

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 34
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/high16 p3, 0x41000000    # 8.0f

    .line 5
    .line 6
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->c:I

    .line 11
    .line 12
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->d:I

    .line 17
    .line 18
    const/4 p3, 0x0

    .line 19
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->e:Z

    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->f:I

    .line 23
    .line 24
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->g:I

    .line 25
    .line 26
    iput-boolean p3, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->h:Z

    .line 27
    .line 28
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->a:Landroid/content/Context;

    .line 29
    .line 30
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->b:Landroid/util/AttributeSet;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public onLayout(ZIIII)V
    .locals 7

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 6
    .line 7
    .line 8
    move-result p3

    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 10
    .line 11
    .line 12
    move-result p5

    .line 13
    sub-int/2addr p4, p2

    .line 14
    new-instance p2, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->h:Z

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    move v0, v1

    .line 25
    move v2, v0

    .line 26
    move v3, v2

    .line 27
    :goto_0
    if-ge v0, p1, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 34
    .line 35
    .line 36
    move-result v5

    .line 37
    add-int/2addr v5, p3

    .line 38
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 39
    .line 40
    .line 41
    move-result v6

    .line 42
    add-int/2addr v5, v6

    .line 43
    if-ge p4, v5, :cond_0

    .line 44
    .line 45
    sub-int p3, p4, v2

    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    sub-int/2addr p3, v2

    .line 52
    div-int/lit8 p3, p3, 0x2

    .line 53
    .line 54
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 55
    .line 56
    .line 57
    move-result-object p3

    .line 58
    invoke-interface {p2, p3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 62
    .line 63
    .line 64
    move-result p3

    .line 65
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->c:I

    .line 66
    .line 67
    add-int/2addr p5, v2

    .line 68
    add-int/2addr p5, v3

    .line 69
    move v3, v1

    .line 70
    :cond_0
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    add-int/2addr v2, p3

    .line 75
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 76
    .line 77
    .line 78
    move-result v5

    .line 79
    add-int/2addr v5, p3

    .line 80
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    .line 81
    .line 82
    .line 83
    move-result v6

    .line 84
    add-int/2addr v6, p5

    .line 85
    invoke-virtual {v4, p3, p5, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 89
    .line 90
    .line 91
    move-result v5

    .line 92
    add-int/2addr p3, v5

    .line 93
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->d:I

    .line 94
    .line 95
    add-int/2addr p3, v5

    .line 96
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    .line 97
    .line 98
    .line 99
    move-result v4

    .line 100
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    add-int/lit8 v0, v0, 0x1

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_1
    sub-int p1, p4, v2

    .line 108
    .line 109
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 110
    .line 111
    .line 112
    move-result p3

    .line 113
    sub-int/2addr p1, p3

    .line 114
    div-int/lit8 p1, p1, 0x2

    .line 115
    .line 116
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 117
    .line 118
    .line 119
    move-result-object p1

    .line 120
    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 128
    .line 129
    .line 130
    move-result p3

    .line 131
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 132
    .line 133
    .line 134
    move-result p5

    .line 135
    :cond_2
    move v0, v1

    .line 136
    move v2, v0

    .line 137
    move v3, v2

    .line 138
    :goto_1
    if-ge v0, p1, :cond_6

    .line 139
    .line 140
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 141
    .line 142
    .line 143
    move-result-object v4

    .line 144
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 145
    .line 146
    .line 147
    move-result v5

    .line 148
    add-int/2addr v5, p3

    .line 149
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 150
    .line 151
    .line 152
    move-result v6

    .line 153
    add-int/2addr v5, v6

    .line 154
    if-ge p4, v5, :cond_4

    .line 155
    .line 156
    add-int/lit8 v2, v2, 0x1

    .line 157
    .line 158
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 159
    .line 160
    .line 161
    move-result p3

    .line 162
    iget-boolean v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->h:Z

    .line 163
    .line 164
    if-eqz v5, :cond_3

    .line 165
    .line 166
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 167
    .line 168
    .line 169
    move-result v5

    .line 170
    if-ge v2, v5, :cond_3

    .line 171
    .line 172
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v5

    .line 176
    check-cast v5, Ljava/lang/Integer;

    .line 177
    .line 178
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 179
    .line 180
    .line 181
    move-result v5

    .line 182
    add-int/2addr p3, v5

    .line 183
    :cond_3
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->c:I

    .line 184
    .line 185
    add-int/2addr p5, v5

    .line 186
    add-int/2addr p5, v3

    .line 187
    move v3, v1

    .line 188
    :cond_4
    iget-boolean v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->h:Z

    .line 189
    .line 190
    if-eqz v5, :cond_5

    .line 191
    .line 192
    if-nez v0, :cond_5

    .line 193
    .line 194
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v5

    .line 198
    check-cast v5, Ljava/lang/Integer;

    .line 199
    .line 200
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 201
    .line 202
    .line 203
    move-result v5

    .line 204
    add-int/2addr p3, v5

    .line 205
    :cond_5
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 206
    .line 207
    .line 208
    move-result v5

    .line 209
    add-int/2addr v5, p3

    .line 210
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    .line 211
    .line 212
    .line 213
    move-result v6

    .line 214
    add-int/2addr v6, p5

    .line 215
    invoke-virtual {v4, p3, p5, v5, v6}, Landroid/view/View;->layout(IIII)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredWidth()I

    .line 219
    .line 220
    .line 221
    move-result v5

    .line 222
    add-int/2addr p3, v5

    .line 223
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->d:I

    .line 224
    .line 225
    add-int/2addr p3, v5

    .line 226
    invoke-virtual {v4}, Landroid/view/View;->getMeasuredHeight()I

    .line 227
    .line 228
    .line 229
    move-result v4

    .line 230
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    .line 231
    .line 232
    .line 233
    move-result v3

    .line 234
    add-int/lit8 v0, v0, 0x1

    .line 235
    .line 236
    goto :goto_1

    .line 237
    :cond_6
    return-void
.end method

.method public onMeasure(II)V
    .locals 9

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
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    sub-int/2addr v1, v2

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    sub-int/2addr v1, v2

    .line 19
    const/4 v2, 0x0

    .line 20
    move v3, v2

    .line 21
    move v4, v3

    .line 22
    move v5, v4

    .line 23
    move v6, v5

    .line 24
    :goto_0
    if-ge v3, v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v7

    .line 30
    invoke-virtual {p0, v7, p1, p2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    .line 34
    .line 35
    .line 36
    move-result v8

    .line 37
    add-int/2addr v8, v6

    .line 38
    if-le v8, v1, :cond_0

    .line 39
    .line 40
    iget v6, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->c:I

    .line 41
    .line 42
    add-int/2addr v4, v6

    .line 43
    add-int/2addr v4, v5

    .line 44
    move v5, v2

    .line 45
    move v6, v5

    .line 46
    :cond_0
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredWidth()I

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    add-int/2addr v6, v8

    .line 51
    iget v8, p0, Lcom/p1/mobile/putong/live/livingroom/virtual/preview/LiveTagFlowView;->d:I

    .line 52
    .line 53
    add-int/2addr v6, v8

    .line 54
    invoke-virtual {v7}, Landroid/view/View;->getMeasuredHeight()I

    .line 55
    .line 56
    .line 57
    move-result v7

    .line 58
    invoke-static {v7, v5}, Ljava/lang/Math;->max(II)I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    add-int/lit8 v3, v3, 0x1

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    add-int/2addr v4, v5

    .line 66
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 67
    .line 68
    .line 69
    move-result p1

    .line 70
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 71
    .line 72
    .line 73
    move-result p2

    .line 74
    add-int/2addr v4, p2

    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 76
    .line 77
    .line 78
    move-result p2

    .line 79
    add-int/2addr v4, p2

    .line 80
    invoke-virtual {p0, p1, v4}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 81
    .line 82
    .line 83
    return-void
.end method
