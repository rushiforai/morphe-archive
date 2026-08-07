.class public final Ll/etg0;
.super Ll/oxg0;
.source "SourceFile"


# instance fields
.field public c:Landroid/widget/Button;

.field public d:Landroid/widget/ImageButton;

.field public e:F

.field public final f:Ljava/lang/String;

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:Ljava/lang/String;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:I

.field public q:I

.field public r:I


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/oxg0;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "type"

    .line 5
    .line 6
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/etg0;->f:Ljava/lang/String;

    .line 11
    .line 12
    const-string v0, "text"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/etg0;->g:Ljava/lang/String;

    .line 19
    .line 20
    const-string v0, "image"

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Ll/etg0;->h:Ljava/lang/String;

    .line 27
    .line 28
    const-string v0, "style"

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    if-eqz p1, :cond_0

    .line 35
    .line 36
    const-string v0, "left"

    .line 37
    .line 38
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    iput v0, p0, Ll/etg0;->i:I

    .line 43
    .line 44
    const-string v0, "top"

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, p0, Ll/etg0;->j:I

    .line 51
    .line 52
    const-string v0, "width"

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    iput v0, p0, Ll/etg0;->k:I

    .line 59
    .line 60
    const-string v0, "height"

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iput v0, p0, Ll/etg0;->l:I

    .line 67
    .line 68
    const-string v0, "color"

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Ll/etg0;->m:Ljava/lang/String;

    .line 75
    .line 76
    const-string v0, "backgroundColor"

    .line 77
    .line 78
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    iput-object v0, p0, Ll/etg0;->n:Ljava/lang/String;

    .line 83
    .line 84
    const-string v0, "borderColor"

    .line 85
    .line 86
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Ll/etg0;->o:Ljava/lang/String;

    .line 91
    .line 92
    const-string v0, "borderWidth"

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    iput v0, p0, Ll/etg0;->p:I

    .line 99
    .line 100
    const-string v0, "borderRadius"

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    iput v0, p0, Ll/etg0;->q:I

    .line 107
    .line 108
    const-string v0, "textAlign"

    .line 109
    .line 110
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    const-string v0, "fontSize"

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    iput v0, p0, Ll/etg0;->r:I

    .line 120
    .line 121
    const-string p0, "lineHeight"

    .line 122
    .line 123
    invoke-virtual {p1, p0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    :cond_0
    return-void
.end method

.method public static g(Ljava/lang/String;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x7

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/16 v1, 0x9

    .line 13
    .line 14
    if-ne v0, v1, :cond_1

    .line 15
    .line 16
    :cond_0
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/String;->charAt(I)C

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/16 v1, 0x23

    .line 22
    .line 23
    if-ne v0, v1, :cond_1

    .line 24
    .line 25
    invoke-static {p0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    return p0

    .line 30
    :cond_1
    const/high16 p0, -0x1000000

    .line 31
    .line 32
    return p0
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/oxg0;->b:Ll/pgg0;

    .line 2
    .line 3
    iget v1, v0, Ll/pgg0;->i:F

    .line 4
    .line 5
    iput v1, p0, Ll/etg0;->e:F

    .line 6
    .line 7
    iget-object v0, v0, Ll/pgg0;->m:Landroid/widget/FrameLayout;

    .line 8
    .line 9
    iget-object v1, p0, Ll/etg0;->f:Ljava/lang/String;

    .line 10
    .line 11
    const-string v2, "image"

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    new-instance v1, Landroid/widget/ImageButton;

    .line 21
    .line 22
    iget-object v3, p0, Ll/oxg0;->b:Ll/pgg0;

    .line 23
    .line 24
    iget-object v3, v3, Ll/pgg0;->b:Landroid/app/Activity;

    .line 25
    .line 26
    invoke-direct {v1, v3}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 27
    .line 28
    .line 29
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 30
    .line 31
    invoke-direct {v3, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 35
    .line 36
    .line 37
    new-instance v3, Ll/xyg0;

    .line 38
    .line 39
    invoke-direct {v3, p0}, Ll/xyg0;-><init>(Ll/etg0;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 46
    .line 47
    .line 48
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    .line 49
    .line 50
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 51
    .line 52
    .line 53
    iput-object v1, p0, Ll/etg0;->d:Landroid/widget/ImageButton;

    .line 54
    .line 55
    iget-object v2, p0, Ll/etg0;->h:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz v2, :cond_0

    .line 58
    .line 59
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-nez v2, :cond_0

    .line 64
    .line 65
    iget-object v2, p0, Ll/etg0;->h:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    iget-object v3, p0, Ll/etg0;->d:Landroid/widget/ImageButton;

    .line 72
    .line 73
    invoke-virtual {v3, v2}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 74
    .line 75
    .line 76
    :cond_0
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    new-instance v1, Landroid/widget/Button;

    .line 81
    .line 82
    iget-object v3, p0, Ll/oxg0;->b:Ll/pgg0;

    .line 83
    .line 84
    iget-object v3, v3, Ll/pgg0;->b:Landroid/app/Activity;

    .line 85
    .line 86
    invoke-direct {v1, v3}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 87
    .line 88
    .line 89
    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    .line 90
    .line 91
    invoke-direct {v3, v2, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {v1, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    .line 96
    .line 97
    iput-object v1, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 98
    .line 99
    invoke-virtual {v1, v2, v2, v2, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMinWidth(I)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setMinHeight(I)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v2}, Landroid/view/View;->setMinimumHeight(I)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v1, v2}, Landroid/view/View;->setMinimumWidth(I)V

    .line 112
    .line 113
    .line 114
    iget-object v2, p0, Ll/etg0;->g:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 117
    .line 118
    .line 119
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    .line 120
    .line 121
    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 125
    .line 126
    .line 127
    iget v2, p0, Ll/etg0;->r:I

    .line 128
    .line 129
    int-to-float v2, v2

    .line 130
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 131
    .line 132
    .line 133
    iget-object v2, p0, Ll/etg0;->m:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {v2}, Ll/etg0;->g(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Ll/etg0;->h()V

    .line 143
    .line 144
    .line 145
    new-instance v2, Ll/m0h0;

    .line 146
    .line 147
    invoke-direct {v2, p0}, Ll/m0h0;-><init>(Ll/etg0;)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v1, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 154
    .line 155
    .line 156
    :goto_0
    iget-object v0, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 157
    .line 158
    if-eqz v0, :cond_2

    .line 159
    .line 160
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 165
    .line 166
    iget v2, p0, Ll/etg0;->k:I

    .line 167
    .line 168
    int-to-float v2, v2

    .line 169
    iget v3, p0, Ll/etg0;->e:F

    .line 170
    .line 171
    mul-float/2addr v2, v3

    .line 172
    float-to-int v2, v2

    .line 173
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 174
    .line 175
    iget v2, p0, Ll/etg0;->l:I

    .line 176
    .line 177
    int-to-float v2, v2

    .line 178
    mul-float/2addr v2, v3

    .line 179
    float-to-int v2, v2

    .line 180
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 181
    .line 182
    iget v2, p0, Ll/etg0;->i:I

    .line 183
    .line 184
    int-to-float v2, v2

    .line 185
    mul-float/2addr v2, v3

    .line 186
    float-to-int v2, v2

    .line 187
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 188
    .line 189
    iget v2, p0, Ll/etg0;->j:I

    .line 190
    .line 191
    int-to-float v2, v2

    .line 192
    mul-float/2addr v2, v3

    .line 193
    float-to-int v2, v2

    .line 194
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 195
    .line 196
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 197
    .line 198
    .line 199
    :cond_2
    iget-object v0, p0, Ll/etg0;->d:Landroid/widget/ImageButton;

    .line 200
    .line 201
    if-eqz v0, :cond_3

    .line 202
    .line 203
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    check-cast v1, Landroid/widget/FrameLayout$LayoutParams;

    .line 208
    .line 209
    iget v2, p0, Ll/etg0;->k:I

    .line 210
    .line 211
    int-to-float v2, v2

    .line 212
    iget v3, p0, Ll/etg0;->e:F

    .line 213
    .line 214
    mul-float/2addr v2, v3

    .line 215
    float-to-int v2, v2

    .line 216
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 217
    .line 218
    iget v2, p0, Ll/etg0;->l:I

    .line 219
    .line 220
    int-to-float v2, v2

    .line 221
    mul-float/2addr v2, v3

    .line 222
    float-to-int v2, v2

    .line 223
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 224
    .line 225
    iget v2, p0, Ll/etg0;->i:I

    .line 226
    .line 227
    int-to-float v2, v2

    .line 228
    mul-float/2addr v2, v3

    .line 229
    float-to-int v2, v2

    .line 230
    iput v2, v1, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 231
    .line 232
    iget p0, p0, Ll/etg0;->j:I

    .line 233
    .line 234
    int-to-float p0, p0

    .line 235
    mul-float/2addr p0, v3

    .line 236
    float-to-int p0, p0

    .line 237
    iput p0, v1, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 238
    .line 239
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 240
    .line 241
    .line 242
    :cond_3
    return-void
.end method

.method public final c(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 8

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x3

    .line 9
    const/4 v2, 0x2

    .line 10
    const-string v3, "prop"

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    const/4 v5, 0x1

    .line 14
    const/4 v6, -0x1

    .line 15
    sparse-switch v0, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    :goto_0
    move p1, v6

    .line 19
    goto :goto_1

    .line 20
    :sswitch_0
    const-string v0, "style"

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    move p1, v1

    .line 30
    goto :goto_1

    .line 31
    :sswitch_1
    const-string v0, "show"

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move p1, v2

    .line 41
    goto :goto_1

    .line 42
    :sswitch_2
    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    if-nez p1, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    move p1, v5

    .line 50
    goto :goto_1

    .line 51
    :sswitch_3
    const-string v0, "hide"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    if-nez p1, :cond_3

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    move p1, v4

    .line 61
    :goto_1
    const/4 v0, 0x4

    .line 62
    const-string v7, "value"

    .line 63
    .line 64
    packed-switch p1, :pswitch_data_0

    .line 65
    .line 66
    .line 67
    return v4

    .line 68
    :pswitch_0
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    sparse-switch v3, :sswitch_data_1

    .line 80
    .line 81
    .line 82
    :goto_2
    move v1, v6

    .line 83
    goto/16 :goto_3

    .line 84
    .line 85
    :sswitch_4
    const-string v0, "borderRadius"

    .line 86
    .line 87
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    if-nez p1, :cond_4

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_4
    const/16 v1, 0xb

    .line 95
    .line 96
    goto/16 :goto_3

    .line 97
    .line 98
    :sswitch_5
    const-string v0, "backgroundColor"

    .line 99
    .line 100
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result p1

    .line 104
    if-nez p1, :cond_5

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_5
    const/16 v1, 0xa

    .line 108
    .line 109
    goto/16 :goto_3

    .line 110
    .line 111
    :sswitch_6
    const-string v0, "borderWidth"

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-nez p1, :cond_6

    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_6
    const/16 v1, 0x9

    .line 121
    .line 122
    goto/16 :goto_3

    .line 123
    .line 124
    :sswitch_7
    const-string v0, "borderColor"

    .line 125
    .line 126
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    if-nez p1, :cond_7

    .line 131
    .line 132
    goto :goto_2

    .line 133
    :cond_7
    const/16 v1, 0x8

    .line 134
    .line 135
    goto/16 :goto_3

    .line 136
    .line 137
    :sswitch_8
    const-string v0, "fontSize"

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 140
    .line 141
    .line 142
    move-result p1

    .line 143
    if-nez p1, :cond_8

    .line 144
    .line 145
    goto :goto_2

    .line 146
    :cond_8
    const/4 v1, 0x7

    .line 147
    goto :goto_3

    .line 148
    :sswitch_9
    const-string v0, "width"

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    move-result p1

    .line 154
    if-nez p1, :cond_9

    .line 155
    .line 156
    goto :goto_2

    .line 157
    :cond_9
    const/4 v1, 0x6

    .line 158
    goto :goto_3

    .line 159
    :sswitch_a
    const-string v0, "color"

    .line 160
    .line 161
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result p1

    .line 165
    if-nez p1, :cond_a

    .line 166
    .line 167
    goto :goto_2

    .line 168
    :cond_a
    const/4 v1, 0x5

    .line 169
    goto :goto_3

    .line 170
    :sswitch_b
    const-string v1, "left"

    .line 171
    .line 172
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-nez p1, :cond_b

    .line 177
    .line 178
    goto :goto_2

    .line 179
    :cond_b
    move v1, v0

    .line 180
    goto :goto_3

    .line 181
    :sswitch_c
    const-string v0, "top"

    .line 182
    .line 183
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    if-nez p1, :cond_f

    .line 188
    .line 189
    goto :goto_2

    .line 190
    :sswitch_d
    const-string v0, "lineHeight"

    .line 191
    .line 192
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    move-result p1

    .line 196
    if-nez p1, :cond_c

    .line 197
    .line 198
    goto :goto_2

    .line 199
    :cond_c
    move v1, v2

    .line 200
    goto :goto_3

    .line 201
    :sswitch_e
    const-string v0, "textAlign"

    .line 202
    .line 203
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-nez p1, :cond_d

    .line 208
    .line 209
    goto :goto_2

    .line 210
    :cond_d
    move v1, v5

    .line 211
    goto :goto_3

    .line 212
    :sswitch_f
    const-string v0, "height"

    .line 213
    .line 214
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    if-nez p1, :cond_e

    .line 219
    .line 220
    goto/16 :goto_2

    .line 221
    .line 222
    :cond_e
    move v1, v4

    .line 223
    :cond_f
    :goto_3
    packed-switch v1, :pswitch_data_1

    .line 224
    .line 225
    .line 226
    goto/16 :goto_4

    .line 227
    .line 228
    :pswitch_1
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 229
    .line 230
    .line 231
    move-result p1

    .line 232
    iput p1, p0, Ll/etg0;->q:I

    .line 233
    .line 234
    invoke-virtual {p0}, Ll/etg0;->h()V

    .line 235
    .line 236
    .line 237
    goto/16 :goto_4

    .line 238
    .line 239
    :pswitch_2
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    iput-object p1, p0, Ll/etg0;->n:Ljava/lang/String;

    .line 244
    .line 245
    invoke-virtual {p0}, Ll/etg0;->h()V

    .line 246
    .line 247
    .line 248
    goto/16 :goto_4

    .line 249
    .line 250
    :pswitch_3
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 251
    .line 252
    .line 253
    move-result p1

    .line 254
    iput p1, p0, Ll/etg0;->p:I

    .line 255
    .line 256
    invoke-virtual {p0}, Ll/etg0;->h()V

    .line 257
    .line 258
    .line 259
    goto/16 :goto_4

    .line 260
    .line 261
    :pswitch_4
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    iput-object p1, p0, Ll/etg0;->o:Ljava/lang/String;

    .line 266
    .line 267
    invoke-virtual {p0}, Ll/etg0;->h()V

    .line 268
    .line 269
    .line 270
    goto/16 :goto_4

    .line 271
    .line 272
    :pswitch_5
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 273
    .line 274
    .line 275
    move-result p1

    .line 276
    iput p1, p0, Ll/etg0;->r:I

    .line 277
    .line 278
    iget-object p0, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 279
    .line 280
    if-eqz p0, :cond_14

    .line 281
    .line 282
    int-to-float p1, p1

    .line 283
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 284
    .line 285
    .line 286
    goto/16 :goto_4

    .line 287
    .line 288
    :pswitch_6
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 289
    .line 290
    .line 291
    move-result p1

    .line 292
    iput p1, p0, Ll/etg0;->k:I

    .line 293
    .line 294
    iget-object p1, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 295
    .line 296
    if-eqz p1, :cond_10

    .line 297
    .line 298
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 299
    .line 300
    .line 301
    move-result-object p2

    .line 302
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 303
    .line 304
    iget v0, p0, Ll/etg0;->k:I

    .line 305
    .line 306
    int-to-float v0, v0

    .line 307
    iget v1, p0, Ll/etg0;->e:F

    .line 308
    .line 309
    mul-float/2addr v0, v1

    .line 310
    float-to-int v0, v0

    .line 311
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 312
    .line 313
    iget v0, p0, Ll/etg0;->l:I

    .line 314
    .line 315
    int-to-float v0, v0

    .line 316
    mul-float/2addr v0, v1

    .line 317
    float-to-int v0, v0

    .line 318
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 319
    .line 320
    iget v0, p0, Ll/etg0;->i:I

    .line 321
    .line 322
    int-to-float v0, v0

    .line 323
    mul-float/2addr v0, v1

    .line 324
    float-to-int v0, v0

    .line 325
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 326
    .line 327
    iget v0, p0, Ll/etg0;->j:I

    .line 328
    .line 329
    int-to-float v0, v0

    .line 330
    mul-float/2addr v0, v1

    .line 331
    float-to-int v0, v0

    .line 332
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 333
    .line 334
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 335
    .line 336
    .line 337
    :cond_10
    iget-object p1, p0, Ll/etg0;->d:Landroid/widget/ImageButton;

    .line 338
    .line 339
    if-eqz p1, :cond_14

    .line 340
    .line 341
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 342
    .line 343
    .line 344
    move-result-object p2

    .line 345
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 346
    .line 347
    iget v0, p0, Ll/etg0;->k:I

    .line 348
    .line 349
    int-to-float v0, v0

    .line 350
    iget v1, p0, Ll/etg0;->e:F

    .line 351
    .line 352
    mul-float/2addr v0, v1

    .line 353
    float-to-int v0, v0

    .line 354
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 355
    .line 356
    iget v0, p0, Ll/etg0;->l:I

    .line 357
    .line 358
    int-to-float v0, v0

    .line 359
    mul-float/2addr v0, v1

    .line 360
    float-to-int v0, v0

    .line 361
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 362
    .line 363
    iget v0, p0, Ll/etg0;->i:I

    .line 364
    .line 365
    int-to-float v0, v0

    .line 366
    mul-float/2addr v0, v1

    .line 367
    float-to-int v0, v0

    .line 368
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 369
    .line 370
    iget p0, p0, Ll/etg0;->j:I

    .line 371
    .line 372
    int-to-float p0, p0

    .line 373
    mul-float/2addr p0, v1

    .line 374
    float-to-int p0, p0

    .line 375
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 376
    .line 377
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 378
    .line 379
    .line 380
    goto/16 :goto_4

    .line 381
    .line 382
    :pswitch_7
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object p1

    .line 386
    iput-object p1, p0, Ll/etg0;->m:Ljava/lang/String;

    .line 387
    .line 388
    iget-object p0, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 389
    .line 390
    if-eqz p0, :cond_14

    .line 391
    .line 392
    invoke-static {p1}, Ll/etg0;->g(Ljava/lang/String;)I

    .line 393
    .line 394
    .line 395
    move-result p1

    .line 396
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 397
    .line 398
    .line 399
    goto/16 :goto_4

    .line 400
    .line 401
    :pswitch_8
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 402
    .line 403
    .line 404
    move-result p1

    .line 405
    iput p1, p0, Ll/etg0;->i:I

    .line 406
    .line 407
    iget-object p1, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 408
    .line 409
    if-eqz p1, :cond_11

    .line 410
    .line 411
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 412
    .line 413
    .line 414
    move-result-object p2

    .line 415
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 416
    .line 417
    iget v0, p0, Ll/etg0;->k:I

    .line 418
    .line 419
    int-to-float v0, v0

    .line 420
    iget v1, p0, Ll/etg0;->e:F

    .line 421
    .line 422
    mul-float/2addr v0, v1

    .line 423
    float-to-int v0, v0

    .line 424
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 425
    .line 426
    iget v0, p0, Ll/etg0;->l:I

    .line 427
    .line 428
    int-to-float v0, v0

    .line 429
    mul-float/2addr v0, v1

    .line 430
    float-to-int v0, v0

    .line 431
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 432
    .line 433
    iget v0, p0, Ll/etg0;->i:I

    .line 434
    .line 435
    int-to-float v0, v0

    .line 436
    mul-float/2addr v0, v1

    .line 437
    float-to-int v0, v0

    .line 438
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 439
    .line 440
    iget v0, p0, Ll/etg0;->j:I

    .line 441
    .line 442
    int-to-float v0, v0

    .line 443
    mul-float/2addr v0, v1

    .line 444
    float-to-int v0, v0

    .line 445
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 446
    .line 447
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 448
    .line 449
    .line 450
    :cond_11
    iget-object p1, p0, Ll/etg0;->d:Landroid/widget/ImageButton;

    .line 451
    .line 452
    if-eqz p1, :cond_14

    .line 453
    .line 454
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 455
    .line 456
    .line 457
    move-result-object p2

    .line 458
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 459
    .line 460
    iget v0, p0, Ll/etg0;->k:I

    .line 461
    .line 462
    int-to-float v0, v0

    .line 463
    iget v1, p0, Ll/etg0;->e:F

    .line 464
    .line 465
    mul-float/2addr v0, v1

    .line 466
    float-to-int v0, v0

    .line 467
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 468
    .line 469
    iget v0, p0, Ll/etg0;->l:I

    .line 470
    .line 471
    int-to-float v0, v0

    .line 472
    mul-float/2addr v0, v1

    .line 473
    float-to-int v0, v0

    .line 474
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 475
    .line 476
    iget v0, p0, Ll/etg0;->i:I

    .line 477
    .line 478
    int-to-float v0, v0

    .line 479
    mul-float/2addr v0, v1

    .line 480
    float-to-int v0, v0

    .line 481
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 482
    .line 483
    iget p0, p0, Ll/etg0;->j:I

    .line 484
    .line 485
    int-to-float p0, p0

    .line 486
    mul-float/2addr p0, v1

    .line 487
    float-to-int p0, p0

    .line 488
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 489
    .line 490
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 491
    .line 492
    .line 493
    goto/16 :goto_4

    .line 494
    .line 495
    :pswitch_9
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 496
    .line 497
    .line 498
    move-result p1

    .line 499
    iput p1, p0, Ll/etg0;->j:I

    .line 500
    .line 501
    iget-object p1, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 502
    .line 503
    if-eqz p1, :cond_12

    .line 504
    .line 505
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 506
    .line 507
    .line 508
    move-result-object p2

    .line 509
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 510
    .line 511
    iget v0, p0, Ll/etg0;->k:I

    .line 512
    .line 513
    int-to-float v0, v0

    .line 514
    iget v1, p0, Ll/etg0;->e:F

    .line 515
    .line 516
    mul-float/2addr v0, v1

    .line 517
    float-to-int v0, v0

    .line 518
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 519
    .line 520
    iget v0, p0, Ll/etg0;->l:I

    .line 521
    .line 522
    int-to-float v0, v0

    .line 523
    mul-float/2addr v0, v1

    .line 524
    float-to-int v0, v0

    .line 525
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 526
    .line 527
    iget v0, p0, Ll/etg0;->i:I

    .line 528
    .line 529
    int-to-float v0, v0

    .line 530
    mul-float/2addr v0, v1

    .line 531
    float-to-int v0, v0

    .line 532
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 533
    .line 534
    iget v0, p0, Ll/etg0;->j:I

    .line 535
    .line 536
    int-to-float v0, v0

    .line 537
    mul-float/2addr v0, v1

    .line 538
    float-to-int v0, v0

    .line 539
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 540
    .line 541
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 542
    .line 543
    .line 544
    :cond_12
    iget-object p1, p0, Ll/etg0;->d:Landroid/widget/ImageButton;

    .line 545
    .line 546
    if-eqz p1, :cond_14

    .line 547
    .line 548
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 549
    .line 550
    .line 551
    move-result-object p2

    .line 552
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 553
    .line 554
    iget v0, p0, Ll/etg0;->k:I

    .line 555
    .line 556
    int-to-float v0, v0

    .line 557
    iget v1, p0, Ll/etg0;->e:F

    .line 558
    .line 559
    mul-float/2addr v0, v1

    .line 560
    float-to-int v0, v0

    .line 561
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 562
    .line 563
    iget v0, p0, Ll/etg0;->l:I

    .line 564
    .line 565
    int-to-float v0, v0

    .line 566
    mul-float/2addr v0, v1

    .line 567
    float-to-int v0, v0

    .line 568
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 569
    .line 570
    iget v0, p0, Ll/etg0;->i:I

    .line 571
    .line 572
    int-to-float v0, v0

    .line 573
    mul-float/2addr v0, v1

    .line 574
    float-to-int v0, v0

    .line 575
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 576
    .line 577
    iget p0, p0, Ll/etg0;->j:I

    .line 578
    .line 579
    int-to-float p0, p0

    .line 580
    mul-float/2addr p0, v1

    .line 581
    float-to-int p0, p0

    .line 582
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 583
    .line 584
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 585
    .line 586
    .line 587
    goto :goto_4

    .line 588
    :pswitch_a
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 589
    .line 590
    .line 591
    goto :goto_4

    .line 592
    :pswitch_b
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 593
    .line 594
    .line 595
    goto :goto_4

    .line 596
    :pswitch_c
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 597
    .line 598
    .line 599
    move-result p1

    .line 600
    iput p1, p0, Ll/etg0;->l:I

    .line 601
    .line 602
    iget-object p1, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 603
    .line 604
    if-eqz p1, :cond_13

    .line 605
    .line 606
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 607
    .line 608
    .line 609
    move-result-object p2

    .line 610
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 611
    .line 612
    iget v0, p0, Ll/etg0;->k:I

    .line 613
    .line 614
    int-to-float v0, v0

    .line 615
    iget v1, p0, Ll/etg0;->e:F

    .line 616
    .line 617
    mul-float/2addr v0, v1

    .line 618
    float-to-int v0, v0

    .line 619
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 620
    .line 621
    iget v0, p0, Ll/etg0;->l:I

    .line 622
    .line 623
    int-to-float v0, v0

    .line 624
    mul-float/2addr v0, v1

    .line 625
    float-to-int v0, v0

    .line 626
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 627
    .line 628
    iget v0, p0, Ll/etg0;->i:I

    .line 629
    .line 630
    int-to-float v0, v0

    .line 631
    mul-float/2addr v0, v1

    .line 632
    float-to-int v0, v0

    .line 633
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 634
    .line 635
    iget v0, p0, Ll/etg0;->j:I

    .line 636
    .line 637
    int-to-float v0, v0

    .line 638
    mul-float/2addr v0, v1

    .line 639
    float-to-int v0, v0

    .line 640
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 641
    .line 642
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 643
    .line 644
    .line 645
    :cond_13
    iget-object p1, p0, Ll/etg0;->d:Landroid/widget/ImageButton;

    .line 646
    .line 647
    if-eqz p1, :cond_14

    .line 648
    .line 649
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 650
    .line 651
    .line 652
    move-result-object p2

    .line 653
    check-cast p2, Landroid/widget/FrameLayout$LayoutParams;

    .line 654
    .line 655
    iget v0, p0, Ll/etg0;->k:I

    .line 656
    .line 657
    int-to-float v0, v0

    .line 658
    iget v1, p0, Ll/etg0;->e:F

    .line 659
    .line 660
    mul-float/2addr v0, v1

    .line 661
    float-to-int v0, v0

    .line 662
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->width:I

    .line 663
    .line 664
    iget v0, p0, Ll/etg0;->l:I

    .line 665
    .line 666
    int-to-float v0, v0

    .line 667
    mul-float/2addr v0, v1

    .line 668
    float-to-int v0, v0

    .line 669
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->height:I

    .line 670
    .line 671
    iget v0, p0, Ll/etg0;->i:I

    .line 672
    .line 673
    int-to-float v0, v0

    .line 674
    mul-float/2addr v0, v1

    .line 675
    float-to-int v0, v0

    .line 676
    iput v0, p2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 677
    .line 678
    iget p0, p0, Ll/etg0;->j:I

    .line 679
    .line 680
    int-to-float p0, p0

    .line 681
    mul-float/2addr p0, v1

    .line 682
    float-to-int p0, p0

    .line 683
    iput p0, p2, Landroid/widget/FrameLayout$LayoutParams;->topMargin:I

    .line 684
    .line 685
    invoke-virtual {p1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 686
    .line 687
    .line 688
    :cond_14
    :goto_4
    return v5

    .line 689
    :pswitch_d
    iget-object p1, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 690
    .line 691
    if-eqz p1, :cond_15

    .line 692
    .line 693
    invoke-virtual {p1, v4}, Landroid/view/View;->setVisibility(I)V

    .line 694
    .line 695
    .line 696
    :cond_15
    iget-object p0, p0, Ll/etg0;->d:Landroid/widget/ImageButton;

    .line 697
    .line 698
    if-eqz p0, :cond_16

    .line 699
    .line 700
    invoke-virtual {p0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 701
    .line 702
    .line 703
    :cond_16
    return v5

    .line 704
    :pswitch_e
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 705
    .line 706
    .line 707
    move-result-object p1

    .line 708
    invoke-virtual {p2, v7}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 709
    .line 710
    .line 711
    move-result-object p2

    .line 712
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 713
    .line 714
    .line 715
    const-string v0, "text"

    .line 716
    .line 717
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 718
    .line 719
    .line 720
    move-result v0

    .line 721
    if-nez v0, :cond_18

    .line 722
    .line 723
    const-string v0, "image"

    .line 724
    .line 725
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 726
    .line 727
    .line 728
    move-result p1

    .line 729
    if-nez p1, :cond_17

    .line 730
    .line 731
    goto :goto_5

    .line 732
    :cond_17
    iput-object p2, p0, Ll/etg0;->h:Ljava/lang/String;

    .line 733
    .line 734
    iget-object p1, p0, Ll/etg0;->d:Landroid/widget/ImageButton;

    .line 735
    .line 736
    if-eqz p1, :cond_19

    .line 737
    .line 738
    if-eqz p2, :cond_19

    .line 739
    .line 740
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    .line 741
    .line 742
    .line 743
    move-result p1

    .line 744
    if-nez p1, :cond_19

    .line 745
    .line 746
    iget-object p1, p0, Ll/etg0;->h:Ljava/lang/String;

    .line 747
    .line 748
    invoke-static {p1}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 749
    .line 750
    .line 751
    move-result-object p1

    .line 752
    iget-object p0, p0, Ll/etg0;->d:Landroid/widget/ImageButton;

    .line 753
    .line 754
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 755
    .line 756
    .line 757
    goto :goto_5

    .line 758
    :cond_18
    iput-object p2, p0, Ll/etg0;->g:Ljava/lang/String;

    .line 759
    .line 760
    iget-object p0, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 761
    .line 762
    if-eqz p0, :cond_19

    .line 763
    .line 764
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 765
    .line 766
    .line 767
    :cond_19
    :goto_5
    return v5

    .line 768
    :pswitch_f
    iget-object p1, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 769
    .line 770
    if-eqz p1, :cond_1a

    .line 771
    .line 772
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 773
    .line 774
    .line 775
    :cond_1a
    iget-object p0, p0, Ll/etg0;->d:Landroid/widget/ImageButton;

    .line 776
    .line 777
    if-eqz p0, :cond_1b

    .line 778
    .line 779
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 780
    .line 781
    .line 782
    :cond_1b
    return v5

    .line 783
    :sswitch_data_0
    .sparse-switch
        0x30dd42 -> :sswitch_3
        0x34a363 -> :sswitch_2
        0x35dafd -> :sswitch_1
        0x68b1db1 -> :sswitch_0
    .end sparse-switch

    .line 784
    .line 785
    .line 786
    .line 787
    .line 788
    .line 789
    .line 790
    .line 791
    .line 792
    .line 793
    .line 794
    .line 795
    .line 796
    .line 797
    .line 798
    .line 799
    .line 800
    .line 801
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_0
    .end packed-switch

    .line 802
    .line 803
    .line 804
    .line 805
    .line 806
    .line 807
    .line 808
    .line 809
    .line 810
    .line 811
    .line 812
    .line 813
    :sswitch_data_1
    .sparse-switch
        -0x48c76ed9 -> :sswitch_f
        -0x3f826a28 -> :sswitch_e
        -0x1ebe99c5 -> :sswitch_d
        0x1c155 -> :sswitch_c
        0x32a007 -> :sswitch_b
        0x5a72f63 -> :sswitch_a
        0x6be2dc6 -> :sswitch_9
        0x15caa0f0 -> :sswitch_8
        0x2b158697 -> :sswitch_7
        0x2c2c84fa -> :sswitch_6
        0x4cb7f6d5 -> :sswitch_5
        0x506afbde -> :sswitch_4
    .end sparse-switch

    .line 814
    .line 815
    .line 816
    .line 817
    .line 818
    .line 819
    .line 820
    .line 821
    .line 822
    .line 823
    .line 824
    .line 825
    .line 826
    .line 827
    .line 828
    .line 829
    .line 830
    .line 831
    .line 832
    .line 833
    .line 834
    .line 835
    .line 836
    .line 837
    .line 838
    .line 839
    .line 840
    .line 841
    .line 842
    .line 843
    .line 844
    .line 845
    .line 846
    .line 847
    .line 848
    .line 849
    .line 850
    .line 851
    .line 852
    .line 853
    .line 854
    .line 855
    .line 856
    .line 857
    .line 858
    .line 859
    .line 860
    .line 861
    .line 862
    .line 863
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public final d()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iget-object v2, p0, Ll/oxg0;->b:Ll/pgg0;

    .line 7
    .line 8
    iget-object v2, v2, Ll/pgg0;->m:Landroid/widget/FrameLayout;

    .line 9
    .line 10
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/etg0;->d:Landroid/widget/ImageButton;

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v2, p0, Ll/oxg0;->b:Ll/pgg0;

    .line 20
    .line 21
    iget-object v2, v2, Ll/pgg0;->m:Landroid/widget/FrameLayout;

    .line 22
    .line 23
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/etg0;->d:Landroid/widget/ImageButton;

    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final h()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Landroid/graphics/drawable/GradientDrawable;

    .line 10
    .line 11
    iget-object v1, p0, Ll/etg0;->n:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {v1}, Ll/etg0;->g(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 18
    .line 19
    .line 20
    iget v1, p0, Ll/etg0;->q:I

    .line 21
    .line 22
    int-to-float v1, v1

    .line 23
    iget v2, p0, Ll/etg0;->e:F

    .line 24
    .line 25
    mul-float/2addr v1, v2

    .line 26
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 27
    .line 28
    .line 29
    iget v1, p0, Ll/etg0;->p:I

    .line 30
    .line 31
    int-to-float v1, v1

    .line 32
    iget v2, p0, Ll/etg0;->e:F

    .line 33
    .line 34
    mul-float/2addr v1, v2

    .line 35
    float-to-int v1, v1

    .line 36
    iget-object v2, p0, Ll/etg0;->o:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v2}, Ll/etg0;->g(Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    invoke-virtual {v0, v1, v2}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Ll/etg0;->c:Landroid/widget/Button;

    .line 46
    .line 47
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 48
    .line 49
    .line 50
    :cond_0
    return-void
.end method
