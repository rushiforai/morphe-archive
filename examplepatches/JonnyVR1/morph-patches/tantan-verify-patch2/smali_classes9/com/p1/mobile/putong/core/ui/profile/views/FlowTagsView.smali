.class public Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;
.super Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView$a;
    }
.end annotation


# instance fields
.field public k:I

.field public l:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView$a;

.field public m:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 p1, -0x1

    .line 5
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->k:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public onMeasure(II)V
    .locals 11

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
    const/4 v3, 0x1

    .line 21
    move v4, v2

    .line 22
    move v5, v4

    .line 23
    move v7, v5

    .line 24
    move v8, v7

    .line 25
    move v6, v3

    .line 26
    :goto_0
    if-ge v4, v0, :cond_7

    .line 27
    .line 28
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v9

    .line 32
    invoke-virtual {p0, v9, p1, p2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    .line 36
    .line 37
    .line 38
    move-result v10

    .line 39
    add-int/2addr v10, v5

    .line 40
    if-le v10, v1, :cond_6

    .line 41
    .line 42
    add-int/lit8 v6, v6, 0x1

    .line 43
    .line 44
    iget v10, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->k:I

    .line 45
    .line 46
    if-lez v10, :cond_5

    .line 47
    .line 48
    if-le v6, v10, :cond_5

    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->m:Landroid/view/View;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    if-eqz v0, :cond_2

    .line 57
    .line 58
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->m:Landroid/view/View;

    .line 59
    .line 60
    invoke-virtual {p0, v0, p1, p2}, Landroid/view/ViewGroup;->measureChild(Landroid/view/View;II)V

    .line 61
    .line 62
    .line 63
    add-int/lit8 p2, v4, -0x1

    .line 64
    .line 65
    if-ltz p2, :cond_4

    .line 66
    .line 67
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-ge p2, v0, :cond_4

    .line 72
    .line 73
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    sub-int/2addr v5, v0

    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->m:Landroid/view/View;

    .line 83
    .line 84
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredWidth()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr v5, v0

    .line 89
    if-le v5, v1, :cond_0

    .line 90
    .line 91
    add-int/lit8 v0, v4, -0x2

    .line 92
    .line 93
    if-ltz v0, :cond_0

    .line 94
    .line 95
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-ge v0, v2, :cond_0

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->m:Landroid/view/View;

    .line 110
    .line 111
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    sub-int/2addr v1, v5

    .line 116
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->e:I

    .line 117
    .line 118
    sub-int/2addr v1, v5

    .line 119
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 120
    .line 121
    invoke-virtual {v0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    .line 123
    .line 124
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    sub-int/2addr v0, v4

    .line 129
    add-int/2addr v0, v3

    .line 130
    invoke-virtual {p0, p2, v0}, Landroid/view/ViewGroup;->removeViews(II)V

    .line 131
    .line 132
    .line 133
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->m:Landroid/view/View;

    .line 134
    .line 135
    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 136
    .line 137
    .line 138
    move-result-object p2

    .line 139
    check-cast p2, Landroid/view/ViewGroup;

    .line 140
    .line 141
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-eqz v0, :cond_1

    .line 146
    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->m:Landroid/view/View;

    .line 148
    .line 149
    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 150
    .line 151
    .line 152
    :cond_1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->m:Landroid/view/View;

    .line 153
    .line 154
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 155
    .line 156
    .line 157
    goto :goto_1

    .line 158
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->l:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView$a;

    .line 159
    .line 160
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result p2

    .line 164
    if-eqz p2, :cond_3

    .line 165
    .line 166
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 167
    .line 168
    .line 169
    move-result p2

    .line 170
    sub-int/2addr p2, v4

    .line 171
    invoke-virtual {p0, v4, p2}, Landroid/view/ViewGroup;->removeViews(II)V

    .line 172
    .line 173
    .line 174
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->l:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView$a;

    .line 175
    .line 176
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView$a;->a()V

    .line 177
    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 181
    .line 182
    .line 183
    move-result p2

    .line 184
    sub-int/2addr p2, v4

    .line 185
    invoke-virtual {p0, v4, p2}, Landroid/view/ViewGroup;->removeViews(II)V

    .line 186
    .line 187
    .line 188
    :cond_4
    :goto_1
    const/high16 p2, 0x40800000    # 4.0f

    .line 189
    .line 190
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 191
    .line 192
    .line 193
    move-result p2

    .line 194
    add-int/2addr v8, p2

    .line 195
    goto :goto_2

    .line 196
    :cond_5
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->d:I

    .line 197
    .line 198
    add-int/2addr v8, v5

    .line 199
    add-int/2addr v8, v7

    .line 200
    move v5, v2

    .line 201
    move v7, v5

    .line 202
    :cond_6
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredWidth()I

    .line 203
    .line 204
    .line 205
    move-result v10

    .line 206
    add-int/2addr v5, v10

    .line 207
    iget v10, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowView;->e:I

    .line 208
    .line 209
    add-int/2addr v5, v10

    .line 210
    invoke-virtual {v9}, Landroid/view/View;->getMeasuredHeight()I

    .line 211
    .line 212
    .line 213
    move-result v9

    .line 214
    invoke-static {v9, v7}, Ljava/lang/Math;->max(II)I

    .line 215
    .line 216
    .line 217
    move-result v7

    .line 218
    add-int/lit8 v4, v4, 0x1

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :cond_7
    :goto_2
    add-int/2addr v8, v7

    .line 223
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 228
    .line 229
    .line 230
    move-result p2

    .line 231
    add-int/2addr v8, p2

    .line 232
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 233
    .line 234
    .line 235
    move-result p2

    .line 236
    add-int/2addr v8, p2

    .line 237
    invoke-virtual {p0, p1, v8}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 238
    .line 239
    .line 240
    return-void
.end method

.method public setCallBack(Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->l:Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView$a;

    .line 2
    .line 3
    return-void
.end method

.method public setEndView(Landroid/view/View;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->m:Landroid/view/View;

    .line 2
    .line 3
    return-void
.end method

.method public setMaxLines(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/profile/views/FlowTagsView;->k:I

    .line 2
    .line 3
    return-void
.end method
