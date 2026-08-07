.class public abstract Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullNativeFragment;
.super Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008 \u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0002\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\'\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0008\u001a\u00020\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\t2\u0006\u0010\u000b\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\r\u0010\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullNativeFragment;",
        "Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment;",
        "<init>",
        "()V",
        "",
        "E4",
        "()I",
        "Landroid/widget/Button;",
        "inAppButton",
        "Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;",
        "inAppNotificationButton",
        "buttonIndex",
        "",
        "F4",
        "(Landroid/widget/Button;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;I)V",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullFragment;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final E4()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "window"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/view/WindowManager;

    .line 12
    .line 13
    const/16 v1, 0xa0

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return v1

    .line 18
    :cond_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 19
    .line 20
    const/16 v3, 0x1e

    .line 21
    .line 22
    if-lt v2, v3, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    iget p0, p0, Landroid/content/res/Configuration;->densityDpi:I

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    new-instance p0, Landroid/util/DisplayMetrics;

    .line 40
    .line 41
    invoke-direct {p0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0, p0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 49
    .line 50
    .line 51
    iget p0, p0, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 52
    .line 53
    :goto_0
    if-lez p0, :cond_2

    .line 54
    .line 55
    return p0

    .line 56
    :cond_2
    return v1
.end method


# virtual methods
.method public final F4(Landroid/widget/Button;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;I)V
    .locals 16
    .param p1    # Landroid/widget/Button;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    const/16 v1, 0x8

    .line 7
    .line 8
    if-eqz p2, :cond_5

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 12
    .line 13
    .line 14
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v0, v3}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual/range {p2 .. p2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;->d()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual/range {p2 .. p2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;->e()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 37
    .line 38
    .line 39
    new-instance v3, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment$a;

    .line 40
    .line 41
    move-object/from16 v4, p0

    .line 42
    .line 43
    invoke-direct {v3, v4}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment$a;-><init>(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual/range {p2 .. p2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;->c()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-interface {v3}, Ljava/lang/CharSequence;->length()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    const/4 v5, 0x2

    .line 58
    const/4 v6, 0x0

    .line 59
    const/4 v7, 0x1

    .line 60
    if-lez v3, :cond_1

    .line 61
    .line 62
    invoke-virtual/range {p2 .. p2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;->c()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-static {v3}, Lkotlin/text/c;->n(Ljava/lang/String;)Ljava/lang/Float;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    if-eqz v3, :cond_0

    .line 71
    .line 72
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    goto :goto_0

    .line 77
    :cond_0
    const/4 v3, 0x0

    .line 78
    :goto_0
    invoke-direct {v4}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFullNativeFragment;->E4()I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    int-to-float v4, v4

    .line 83
    const/high16 v8, 0x43f00000    # 480.0f

    .line 84
    .line 85
    div-float/2addr v8, v4

    .line 86
    mul-float/2addr v3, v8

    .line 87
    const/high16 v4, 0x40000000    # 2.0f

    .line 88
    .line 89
    mul-float/2addr v3, v4

    .line 90
    new-instance v4, Landroid/graphics/drawable/ShapeDrawable;

    .line 91
    .line 92
    new-instance v8, Landroid/graphics/drawable/shapes/RoundRectShape;

    .line 93
    .line 94
    new-array v9, v1, [F

    .line 95
    .line 96
    aput v3, v9, v2

    .line 97
    .line 98
    aput v3, v9, v7

    .line 99
    .line 100
    aput v3, v9, v5

    .line 101
    .line 102
    const/4 v10, 0x3

    .line 103
    aput v3, v9, v10

    .line 104
    .line 105
    const/4 v11, 0x4

    .line 106
    aput v3, v9, v11

    .line 107
    .line 108
    const/4 v12, 0x5

    .line 109
    aput v3, v9, v12

    .line 110
    .line 111
    const/4 v13, 0x6

    .line 112
    aput v3, v9, v13

    .line 113
    .line 114
    const/4 v14, 0x7

    .line 115
    aput v3, v9, v14

    .line 116
    .line 117
    new-array v15, v1, [F

    .line 118
    .line 119
    fill-array-data v15, :array_0

    .line 120
    .line 121
    .line 122
    invoke-direct {v8, v9, v6, v15}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    .line 123
    .line 124
    .line 125
    invoke-direct {v4, v8}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {v4}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 129
    .line 130
    .line 131
    move-result-object v8

    .line 132
    invoke-virtual/range {p2 .. p2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;->a()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v9

    .line 136
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    move-result v9

    .line 140
    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v4}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 144
    .line 145
    .line 146
    move-result-object v8

    .line 147
    sget-object v9, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 148
    .line 149
    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 150
    .line 151
    .line 152
    invoke-virtual {v4}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 153
    .line 154
    .line 155
    move-result-object v8

    .line 156
    invoke-virtual {v8, v7}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 157
    .line 158
    .line 159
    new-instance v8, Landroid/graphics/drawable/ShapeDrawable;

    .line 160
    .line 161
    new-instance v9, Landroid/graphics/drawable/shapes/RoundRectShape;

    .line 162
    .line 163
    new-array v15, v1, [F

    .line 164
    .line 165
    aput v3, v15, v2

    .line 166
    .line 167
    aput v3, v15, v7

    .line 168
    .line 169
    aput v3, v15, v5

    .line 170
    .line 171
    aput v3, v15, v10

    .line 172
    .line 173
    aput v3, v15, v11

    .line 174
    .line 175
    aput v3, v15, v12

    .line 176
    .line 177
    aput v3, v15, v13

    .line 178
    .line 179
    aput v3, v15, v14

    .line 180
    .line 181
    new-array v1, v1, [F

    .line 182
    .line 183
    aput v3, v1, v2

    .line 184
    .line 185
    aput v3, v1, v7

    .line 186
    .line 187
    aput v3, v1, v5

    .line 188
    .line 189
    aput v3, v1, v10

    .line 190
    .line 191
    aput v3, v1, v11

    .line 192
    .line 193
    aput v3, v1, v12

    .line 194
    .line 195
    aput v3, v1, v13

    .line 196
    .line 197
    aput v3, v1, v14

    .line 198
    .line 199
    invoke-direct {v9, v15, v6, v1}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    .line 200
    .line 201
    .line 202
    invoke-direct {v8, v9}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 203
    .line 204
    .line 205
    move-object v6, v8

    .line 206
    goto :goto_1

    .line 207
    :cond_1
    move-object v4, v6

    .line 208
    :goto_1
    invoke-virtual/range {p2 .. p2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;->b()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    if-nez v1, :cond_2

    .line 217
    .line 218
    goto :goto_2

    .line 219
    :cond_2
    if-eqz v6, :cond_3

    .line 220
    .line 221
    invoke-virtual {v6}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-virtual/range {p2 .. p2}, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;->b()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 230
    .line 231
    .line 232
    move-result v3

    .line 233
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v6, v7, v7, v7, v7}, Landroid/graphics/drawable/ShapeDrawable;->setPadding(IIII)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v6}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 244
    .line 245
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 246
    .line 247
    .line 248
    :cond_3
    :goto_2
    if-eqz v4, :cond_4

    .line 249
    .line 250
    if-eqz v6, :cond_4

    .line 251
    .line 252
    new-array v1, v5, [Landroid/graphics/drawable/Drawable;

    .line 253
    .line 254
    aput-object v6, v1, v2

    .line 255
    .line 256
    aput-object v4, v1, v7

    .line 257
    .line 258
    new-instance v2, Landroid/graphics/drawable/LayerDrawable;

    .line 259
    .line 260
    invoke-direct {v2, v1}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 264
    .line 265
    .line 266
    :cond_4
    return-void

    .line 267
    :cond_5
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 268
    .line 269
    .line 270
    return-void

    .line 271
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method
