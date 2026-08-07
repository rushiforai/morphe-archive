.class public Lcom/tencent/rtmp/ui/TXLogView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field a:Ljava/lang/StringBuffer;

.field private b:Landroid/widget/TextView;

.field private c:Landroid/widget/TextView;

.field private d:Landroid/widget/ScrollView;

.field private e:Landroid/widget/ScrollView;

.field private final f:I

.field private g:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 259
    invoke-direct {p0, p1, v0}, Lcom/tencent/rtmp/ui/TXLogView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 11

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    new-instance p2, Ljava/lang/StringBuffer;

    .line 5
    .line 6
    const-string v0, ""

    .line 7
    .line 8
    invoke-direct {p2, v0}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Lcom/tencent/rtmp/ui/TXLogView;->a:Ljava/lang/StringBuffer;

    .line 12
    .line 13
    const/16 p2, 0xbb8

    .line 14
    .line 15
    iput p2, p0, Lcom/tencent/rtmp/ui/TXLogView;->f:I

    .line 16
    .line 17
    const/4 p2, 0x0

    .line 18
    iput-boolean p2, p0, Lcom/tencent/rtmp/ui/TXLogView;->g:Z

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 22
    .line 23
    .line 24
    new-instance v1, Landroid/widget/TextView;

    .line 25
    .line 26
    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    iput-object v1, p0, Lcom/tencent/rtmp/ui/TXLogView;->b:Landroid/widget/TextView;

    .line 30
    .line 31
    new-instance v1, Landroid/widget/TextView;

    .line 32
    .line 33
    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 34
    .line 35
    .line 36
    iput-object v1, p0, Lcom/tencent/rtmp/ui/TXLogView;->c:Landroid/widget/TextView;

    .line 37
    .line 38
    new-instance v1, Landroid/widget/ScrollView;

    .line 39
    .line 40
    invoke-direct {v1, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    iput-object v1, p0, Lcom/tencent/rtmp/ui/TXLogView;->d:Landroid/widget/ScrollView;

    .line 44
    .line 45
    new-instance v1, Landroid/widget/ScrollView;

    .line 46
    .line 47
    invoke-direct {v1, p1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 48
    .line 49
    .line 50
    iput-object v1, p0, Lcom/tencent/rtmp/ui/TXLogView;->e:Landroid/widget/ScrollView;

    .line 51
    .line 52
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 53
    .line 54
    const/4 v2, -0x1

    .line 55
    invoke-direct {v1, v2, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 56
    .line 57
    .line 58
    const v3, 0x3e4ccccd    # 0.2f

    .line 59
    .line 60
    .line 61
    iput v3, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 62
    .line 63
    iget-object v3, p0, Lcom/tencent/rtmp/ui/TXLogView;->d:Landroid/widget/ScrollView;

    .line 64
    .line 65
    invoke-virtual {v3, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Lcom/tencent/rtmp/ui/TXLogView;->d:Landroid/widget/ScrollView;

    .line 69
    .line 70
    const v3, 0x60ffffff

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 74
    .line 75
    .line 76
    iget-object v1, p0, Lcom/tencent/rtmp/ui/TXLogView;->d:Landroid/widget/ScrollView;

    .line 77
    .line 78
    invoke-virtual {v1, v0}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Lcom/tencent/rtmp/ui/TXLogView;->d:Landroid/widget/ScrollView;

    .line 82
    .line 83
    invoke-virtual {v1, v0}, Landroid/view/View;->setScrollbarFadingEnabled(Z)V

    .line 84
    .line 85
    .line 86
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 87
    .line 88
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 89
    .line 90
    .line 91
    iget-object v4, p0, Lcom/tencent/rtmp/ui/TXLogView;->b:Landroid/widget/TextView;

    .line 92
    .line 93
    invoke-virtual {v4, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    .line 95
    .line 96
    iget-object v1, p0, Lcom/tencent/rtmp/ui/TXLogView;->b:Landroid/widget/TextView;

    .line 97
    .line 98
    const/high16 v4, 0x41300000    # 11.0f

    .line 99
    .line 100
    const/4 v5, 0x2

    .line 101
    invoke-virtual {v1, v5, v4}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 102
    .line 103
    .line 104
    iget-object v1, p0, Lcom/tencent/rtmp/ui/TXLogView;->b:Landroid/widget/TextView;

    .line 105
    .line 106
    const/high16 v4, -0x1000000

    .line 107
    .line 108
    invoke-virtual {v1, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 109
    .line 110
    .line 111
    iget-object v1, p0, Lcom/tencent/rtmp/ui/TXLogView;->b:Landroid/widget/TextView;

    .line 112
    .line 113
    sget-object v6, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    .line 114
    .line 115
    invoke-virtual {v1, v6, v0}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;I)V

    .line 116
    .line 117
    .line 118
    iget-object v1, p0, Lcom/tencent/rtmp/ui/TXLogView;->b:Landroid/widget/TextView;

    .line 119
    .line 120
    const/high16 v6, 0x40800000    # 4.0f

    .line 121
    .line 122
    const/high16 v7, 0x3f800000    # 1.0f

    .line 123
    .line 124
    invoke-virtual {v1, v6, v7}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Lcom/tencent/rtmp/ui/TXLogView;->b:Landroid/widget/TextView;

    .line 128
    .line 129
    const/high16 v6, 0x40000000    # 2.0f

    .line 130
    .line 131
    invoke-static {p1, v6}, Lcom/tencent/rtmp/ui/TXLogView;->a(Landroid/content/Context;F)I

    .line 132
    .line 133
    .line 134
    move-result v7

    .line 135
    invoke-static {p1, v6}, Lcom/tencent/rtmp/ui/TXLogView;->a(Landroid/content/Context;F)I

    .line 136
    .line 137
    .line 138
    move-result v8

    .line 139
    invoke-static {p1, v6}, Lcom/tencent/rtmp/ui/TXLogView;->a(Landroid/content/Context;F)I

    .line 140
    .line 141
    .line 142
    move-result v9

    .line 143
    invoke-static {p1, v6}, Lcom/tencent/rtmp/ui/TXLogView;->a(Landroid/content/Context;F)I

    .line 144
    .line 145
    .line 146
    move-result v10

    .line 147
    invoke-virtual {v1, v7, v8, v9, v10}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 148
    .line 149
    .line 150
    iget-object v1, p0, Lcom/tencent/rtmp/ui/TXLogView;->d:Landroid/widget/ScrollView;

    .line 151
    .line 152
    iget-object v7, p0, Lcom/tencent/rtmp/ui/TXLogView;->b:Landroid/widget/TextView;

    .line 153
    .line 154
    invoke-virtual {v1, v7}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 155
    .line 156
    .line 157
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 158
    .line 159
    invoke-direct {v1, v2, p2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 160
    .line 161
    .line 162
    const p2, 0x3f4ccccd    # 0.8f

    .line 163
    .line 164
    .line 165
    iput p2, v1, Landroid/widget/LinearLayout$LayoutParams;->weight:F

    .line 166
    .line 167
    invoke-static {p1, v6}, Lcom/tencent/rtmp/ui/TXLogView;->a(Landroid/content/Context;F)I

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    iput p2, v1, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 172
    .line 173
    iget-object p2, p0, Lcom/tencent/rtmp/ui/TXLogView;->e:Landroid/widget/ScrollView;

    .line 174
    .line 175
    invoke-virtual {p2, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 176
    .line 177
    .line 178
    iget-object p2, p0, Lcom/tencent/rtmp/ui/TXLogView;->e:Landroid/widget/ScrollView;

    .line 179
    .line 180
    invoke-virtual {p2, v3}, Landroid/view/View;->setBackgroundColor(I)V

    .line 181
    .line 182
    .line 183
    iget-object p2, p0, Lcom/tencent/rtmp/ui/TXLogView;->e:Landroid/widget/ScrollView;

    .line 184
    .line 185
    invoke-virtual {p2, v0}, Landroid/view/View;->setVerticalScrollBarEnabled(Z)V

    .line 186
    .line 187
    .line 188
    iget-object p2, p0, Lcom/tencent/rtmp/ui/TXLogView;->e:Landroid/widget/ScrollView;

    .line 189
    .line 190
    invoke-virtual {p2, v0}, Landroid/view/View;->setScrollbarFadingEnabled(Z)V

    .line 191
    .line 192
    .line 193
    new-instance p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 194
    .line 195
    invoke-direct {p2, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 196
    .line 197
    .line 198
    iget-object v0, p0, Lcom/tencent/rtmp/ui/TXLogView;->c:Landroid/widget/TextView;

    .line 199
    .line 200
    invoke-virtual {v0, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 201
    .line 202
    .line 203
    iget-object p2, p0, Lcom/tencent/rtmp/ui/TXLogView;->c:Landroid/widget/TextView;

    .line 204
    .line 205
    const/high16 v0, 0x41500000    # 13.0f

    .line 206
    .line 207
    invoke-virtual {p2, v5, v0}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 208
    .line 209
    .line 210
    iget-object p2, p0, Lcom/tencent/rtmp/ui/TXLogView;->c:Landroid/widget/TextView;

    .line 211
    .line 212
    invoke-virtual {p2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 213
    .line 214
    .line 215
    iget-object p2, p0, Lcom/tencent/rtmp/ui/TXLogView;->c:Landroid/widget/TextView;

    .line 216
    .line 217
    invoke-static {p1, v6}, Lcom/tencent/rtmp/ui/TXLogView;->a(Landroid/content/Context;F)I

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    invoke-static {p1, v6}, Lcom/tencent/rtmp/ui/TXLogView;->a(Landroid/content/Context;F)I

    .line 222
    .line 223
    .line 224
    move-result v1

    .line 225
    invoke-static {p1, v6}, Lcom/tencent/rtmp/ui/TXLogView;->a(Landroid/content/Context;F)I

    .line 226
    .line 227
    .line 228
    move-result v2

    .line 229
    invoke-static {p1, v6}, Lcom/tencent/rtmp/ui/TXLogView;->a(Landroid/content/Context;F)I

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    invoke-virtual {p2, v0, v1, v2, p1}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 234
    .line 235
    .line 236
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXLogView;->e:Landroid/widget/ScrollView;

    .line 237
    .line 238
    iget-object p2, p0, Lcom/tencent/rtmp/ui/TXLogView;->c:Landroid/widget/TextView;

    .line 239
    .line 240
    invoke-virtual {p1, p2}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 241
    .line 242
    .line 243
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXLogView;->d:Landroid/widget/ScrollView;

    .line 244
    .line 245
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 246
    .line 247
    .line 248
    iget-object p1, p0, Lcom/tencent/rtmp/ui/TXLogView;->e:Landroid/widget/ScrollView;

    .line 249
    .line 250
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 251
    .line 252
    .line 253
    const/16 p1, 0x8

    .line 254
    .line 255
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 256
    .line 257
    .line 258
    return-void
.end method

.method public static a(Landroid/content/Context;F)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    mul-float/2addr p1, p0

    .line 12
    const/high16 p0, 0x3f000000    # 0.5f

    .line 13
    .line 14
    add-float/2addr p1, p0

    .line 15
    float-to-int p0, p1

    .line 16
    return p0
.end method
