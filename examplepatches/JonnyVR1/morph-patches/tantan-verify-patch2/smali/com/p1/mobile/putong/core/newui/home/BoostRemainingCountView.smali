.class public Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;
.super Landroid/widget/RelativeLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/RelativeLayout;

.field public b:Lv/VText;

.field public c:Landroid/widget/LinearLayout;

.field public d:Lv/VText;

.field public e:Landroid/widget/RelativeLayout;

.field public f:Landroid/widget/ImageView;

.field public g:Lv/VText;

.field public h:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->h:Landroid/animation/AnimatorSet;

    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->h:Landroid/animation/AnimatorSet;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 10
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->h:Landroid/animation/AnimatorSet;

    return-void
.end method

.method private getBoostLimitCount()I
    .locals 2

    const v0, 0x30d40

    return v0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const/4 v0, 0x0

    .line 14
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lcom/p1/mobile/putong/data/BoostLimit;

    .line 25
    .line 26
    iget v1, v1, Lcom/p1/mobile/putong/data/BoostLimit;->remaining:I

    .line 27
    .line 28
    add-int/2addr v0, v1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return v0
.end method

.method private setHeight(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->a:Landroid/widget/RelativeLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 8
    .line 9
    iput p1, v0, Landroid/widget/RelativeLayout$LayoutParams;->height:I

    .line 10
    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->a:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->a:Landroid/widget/RelativeLayout;

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/View;->getLeft()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->a:Landroid/widget/RelativeLayout;

    .line 27
    .line 28
    invoke-virtual {v3}, Landroid/view/View;->getRight()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    add-int/2addr v4, p1

    .line 37
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/view/View;->layout(IIII)V

    .line 38
    .line 39
    .line 40
    const/high16 v0, 0x41c00000    # 24.0f

    .line 41
    .line 42
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->c:Landroid/widget/LinearLayout;

    .line 47
    .line 48
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    add-int/2addr v3, p1

    .line 57
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->c:Landroid/widget/LinearLayout;

    .line 58
    .line 59
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    sub-int/2addr v3, v4

    .line 64
    sub-int/2addr v3, v0

    .line 65
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->c:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    add-int/2addr v5, p1

    .line 76
    sub-int/2addr v5, v0

    .line 77
    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/view/View;->layout(IIII)V

    .line 78
    .line 79
    .line 80
    const/high16 v0, 0x42280000    # 42.0f

    .line 81
    .line 82
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->b:Lv/VText;

    .line 87
    .line 88
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 89
    .line 90
    .line 91
    move-result v2

    .line 92
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 93
    .line 94
    .line 95
    move-result v3

    .line 96
    add-int/2addr v3, p1

    .line 97
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->b:Lv/VText;

    .line 98
    .line 99
    invoke-virtual {v4}, Landroid/view/View;->getHeight()I

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    sub-int/2addr v3, v4

    .line 104
    sub-int/2addr v3, v0

    .line 105
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->b:Lv/VText;

    .line 106
    .line 107
    invoke-virtual {v4}, Landroid/view/View;->getRight()I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 112
    .line 113
    .line 114
    move-result v5

    .line 115
    add-int/2addr v5, p1

    .line 116
    sub-int/2addr v5, v0

    .line 117
    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/view/View;->layout(IIII)V

    .line 118
    .line 119
    .line 120
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->b:Lv/VText;

    .line 121
    .line 122
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-nez p1, :cond_0

    .line 127
    .line 128
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->b:Lv/VText;

    .line 129
    .line 130
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    if-nez p1, :cond_0

    .line 135
    .line 136
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->b:Lv/VText;

    .line 137
    .line 138
    invoke-static {p1}, Ll/bnl0;->n0(Landroid/view/View;)V

    .line 139
    .line 140
    .line 141
    const/high16 p1, 0x41800000    # 16.0f

    .line 142
    .line 143
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->a:Landroid/widget/RelativeLayout;

    .line 148
    .line 149
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->b:Lv/VText;

    .line 154
    .line 155
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    sub-int/2addr v0, v1

    .line 160
    div-int/lit8 v0, v0, 0x2

    .line 161
    .line 162
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->b:Lv/VText;

    .line 163
    .line 164
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    add-int/2addr v2, v0

    .line 169
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->b:Lv/VText;

    .line 170
    .line 171
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    add-int/2addr v3, p1

    .line 176
    invoke-virtual {v1, v0, p1, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 177
    .line 178
    .line 179
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->c:Landroid/widget/LinearLayout;

    .line 180
    .line 181
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    .line 182
    .line 183
    .line 184
    move-result p1

    .line 185
    if-nez p1, :cond_1

    .line 186
    .line 187
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->c:Landroid/widget/LinearLayout;

    .line 188
    .line 189
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    if-nez p1, :cond_1

    .line 194
    .line 195
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->c:Landroid/widget/LinearLayout;

    .line 196
    .line 197
    invoke-static {p1}, Ll/bnl0;->n0(Landroid/view/View;)V

    .line 198
    .line 199
    .line 200
    const/high16 p1, 0x42080000    # 34.0f

    .line 201
    .line 202
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 203
    .line 204
    .line 205
    move-result p1

    .line 206
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->a:Landroid/widget/RelativeLayout;

    .line 207
    .line 208
    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->c:Landroid/widget/LinearLayout;

    .line 213
    .line 214
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    sub-int/2addr v0, v1

    .line 219
    div-int/lit8 v0, v0, 0x2

    .line 220
    .line 221
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->c:Landroid/widget/LinearLayout;

    .line 222
    .line 223
    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    .line 224
    .line 225
    .line 226
    move-result v2

    .line 227
    add-int/2addr v2, v0

    .line 228
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->c:Landroid/widget/LinearLayout;

    .line 229
    .line 230
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 231
    .line 232
    .line 233
    move-result p0

    .line 234
    add-int/2addr p0, p1

    .line 235
    invoke-virtual {v1, v0, p1, v2, p0}, Landroid/view/View;->layout(IIII)V

    .line 236
    .line 237
    .line 238
    :cond_1
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ca3;->a(Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/home/BoostRemainingCountView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public setOnClickListener(Landroid/view/View$OnClickListener;)V
    .locals 0

    return-void
.end method

.method public setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V
    .locals 0

    return-void
.end method
