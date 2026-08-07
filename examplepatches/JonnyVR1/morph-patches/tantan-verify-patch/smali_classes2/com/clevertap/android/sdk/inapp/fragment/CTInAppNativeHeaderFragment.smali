.class public final Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHeaderFragment;
.super Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBasePartialNativeFragment;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0000\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000f\u0010\u0005\u001a\u00020\u0004H\u0014\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J-\u0010\u000e\u001a\u0004\u0018\u00010\r2\u0006\u0010\u0008\u001a\u00020\u00072\u0008\u0010\n\u001a\u0004\u0018\u00010\t2\u0008\u0010\u000c\u001a\u0004\u0018\u00010\u000bH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000f\u00a8\u0006\u0010"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHeaderFragment;",
        "Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBasePartialNativeFragment;",
        "<init>",
        "()V",
        "Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;",
        "W3",
        "()Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;",
        "Landroid/view/LayoutInflater;",
        "inflater",
        "Landroid/view/ViewGroup;",
        "container",
        "Landroid/os/Bundle;",
        "savedInstanceState",
        "Landroid/view/View;",
        "onCreateView",
        "(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;",
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
    invoke-direct {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBasePartialNativeFragment;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static C4(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHeaderFragment;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBasePartialNativeFragment;->w4()Landroid/view/GestureDetector;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p0, p2}, Landroid/view/GestureDetector;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public static D4(Ll/svm;Landroid/view/ViewGroup$MarginLayoutParams;)Lkotlin/Unit;
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget v0, p0, Ll/svm;->a:I

    .line 8
    .line 9
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 10
    .line 11
    iget v0, p0, Ll/svm;->c:I

    .line 12
    .line 13
    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 14
    .line 15
    iget p0, p0, Ll/svm;->b:I

    .line 16
    .line 17
    iput p0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 18
    .line 19
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 20
    .line 21
    return-object p0
.end method


# virtual methods
.method public W3()Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;
    .locals 11
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    sget-object v0, Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;->Companion:Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->e4()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->m4()Lcom/clevertap/android/sdk/inapp/images/FileResourceProvider;

    .line 12
    .line 13
    .line 14
    move-result-object v5

    .line 15
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->b4()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v8

    .line 19
    const/16 v9, 0x60

    .line 20
    .line 21
    const/4 v10, 0x0

    .line 22
    const/4 v4, 0x0

    .line 23
    const/4 v6, 0x0

    .line 24
    const/4 v7, 0x0

    .line 25
    move-object v1, p0

    .line 26
    invoke-static/range {v0 .. v10}, Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;->b(Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$a;Landroidx/fragment/app/Fragment;Lcom/clevertap/android/sdk/inapp/CTInAppNotification;IZLcom/clevertap/android/sdk/inapp/images/FileResourceProvider;ZLkotlin/jvm/functions/Function0;Ljava/lang/String;ILjava/lang/Object;)Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 21
    .param p1    # Landroid/view/LayoutInflater;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/view/ViewGroup;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    sget v2, Ll/efc0;->h:I

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    move-object/from16 v4, p1

    .line 15
    .line 16
    move-object/from16 v5, p2

    .line 17
    .line 18
    invoke-virtual {v4, v2, v5, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v2}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBasePartialNativeFragment;->A4(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    sget v4, Ll/icc0;->T:I

    .line 26
    .line 27
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    check-cast v4, Landroid/widget/FrameLayout;

    .line 32
    .line 33
    sget v5, Ll/icc0;->Z:I

    .line 34
    .line 35
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    move-object v6, v4

    .line 40
    check-cast v6, Landroid/widget/RelativeLayout;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->d()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v4

    .line 54
    invoke-virtual {v6, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 55
    .line 56
    .line 57
    sget v4, Ll/icc0;->V:I

    .line 58
    .line 59
    invoke-virtual {v6, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    check-cast v4, Landroid/widget/LinearLayout;

    .line 64
    .line 65
    sget v5, Ll/icc0;->W:I

    .line 66
    .line 67
    invoke-virtual {v6, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object v5

    .line 71
    move-object v11, v5

    .line 72
    check-cast v11, Landroid/widget/LinearLayout;

    .line 73
    .line 74
    sget v5, Ll/icc0;->X:I

    .line 75
    .line 76
    invoke-virtual {v6, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v5

    .line 80
    check-cast v5, Landroid/widget/LinearLayout;

    .line 81
    .line 82
    sget v7, Ll/icc0;->R:I

    .line 83
    .line 84
    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    move-object v12, v7

    .line 89
    check-cast v12, Landroid/widget/Button;

    .line 90
    .line 91
    invoke-virtual {v12}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 92
    .line 93
    .line 94
    invoke-interface {v1, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    sget v7, Ll/icc0;->S:I

    .line 98
    .line 99
    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    move-object v13, v5

    .line 104
    check-cast v13, Landroid/widget/Button;

    .line 105
    .line 106
    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 107
    .line 108
    .line 109
    invoke-interface {v1, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    sget v5, Ll/icc0;->U:I

    .line 113
    .line 114
    invoke-virtual {v4, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    check-cast v4, Landroid/widget/ImageView;

    .line 119
    .line 120
    const/16 v5, 0x8

    .line 121
    .line 122
    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->h4()Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;

    .line 126
    .line 127
    .line 128
    move-result-object v5

    .line 129
    new-instance v14, Ll/brm;

    .line 130
    .line 131
    sget v15, Ll/icc0;->U:I

    .line 132
    .line 133
    sget v18, Ll/icc0;->I:I

    .line 134
    .line 135
    const/16 v19, 0x4

    .line 136
    .line 137
    const/16 v20, 0x0

    .line 138
    .line 139
    const/16 v16, 0x0

    .line 140
    .line 141
    const/16 v17, 0x0

    .line 142
    .line 143
    invoke-direct/range {v14 .. v20}, Ll/brm;-><init>(IZIIILkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 144
    .line 145
    .line 146
    const/4 v9, 0x4

    .line 147
    const/4 v10, 0x0

    .line 148
    const/4 v8, 0x0

    .line 149
    move-object v7, v14

    .line 150
    invoke-static/range {v5 .. v10}, Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler$b;->b(Lcom/clevertap/android/sdk/inapp/media/InAppMediaHandler;Landroid/widget/RelativeLayout;Ll/brm;Landroid/view/View$OnClickListener;ILjava/lang/Object;)V

    .line 151
    .line 152
    .line 153
    sget v4, Ll/icc0;->a0:I

    .line 154
    .line 155
    invoke-virtual {v11, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v4

    .line 159
    check-cast v4, Landroid/widget/TextView;

    .line 160
    .line 161
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 162
    .line 163
    .line 164
    move-result-object v5

    .line 165
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->B()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 173
    .line 174
    .line 175
    move-result-object v5

    .line 176
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->C()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v5

    .line 180
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    move-result v5

    .line 184
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 185
    .line 186
    .line 187
    sget v4, Ll/icc0;->Y:I

    .line 188
    .line 189
    invoke-virtual {v11, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    check-cast v4, Landroid/widget/TextView;

    .line 194
    .line 195
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 196
    .line 197
    .line 198
    move-result-object v5

    .line 199
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->w()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v5

    .line 203
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 207
    .line 208
    .line 209
    move-result-object v5

    .line 210
    invoke-virtual {v5}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->x()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v5

    .line 214
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 215
    .line 216
    .line 217
    move-result v5

    .line 218
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 219
    .line 220
    .line 221
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 222
    .line 223
    .line 224
    move-result-object v4

    .line 225
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->f()Ljava/util/List;

    .line 226
    .line 227
    .line 228
    move-result-object v4

    .line 229
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 230
    .line 231
    .line 232
    move-result v5

    .line 233
    if-nez v5, :cond_1

    .line 234
    .line 235
    move-object v5, v4

    .line 236
    check-cast v5, Ljava/util/Collection;

    .line 237
    .line 238
    invoke-interface {v5}, Ljava/util/Collection;->size()I

    .line 239
    .line 240
    .line 241
    move-result v5

    .line 242
    :goto_0
    if-ge v3, v5, :cond_1

    .line 243
    .line 244
    const/4 v6, 0x2

    .line 245
    if-lt v3, v6, :cond_0

    .line 246
    .line 247
    goto :goto_1

    .line 248
    :cond_0
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v6

    .line 252
    check-cast v6, Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;

    .line 253
    .line 254
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v7

    .line 258
    check-cast v7, Landroid/widget/Button;

    .line 259
    .line 260
    invoke-virtual {v0, v7, v6, v3}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBasePartialNativeFragment;->B4(Landroid/widget/Button;Lcom/clevertap/android/sdk/inapp/CTInAppNotificationButton;I)V

    .line 261
    .line 262
    .line 263
    add-int/lit8 v3, v3, 0x1

    .line 264
    .line 265
    goto :goto_0

    .line 266
    :cond_1
    :goto_1
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBaseFragment;->f4()Lcom/clevertap/android/sdk/inapp/CTInAppNotification;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inapp/CTInAppNotification;->e()I

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    const/4 v3, 0x1

    .line 275
    if-ne v1, v3, :cond_2

    .line 276
    .line 277
    invoke-virtual {v0, v12, v13}, Lcom/clevertap/android/sdk/inapp/fragment/CTInAppBasePartialNativeFragment;->y4(Landroid/widget/Button;Landroid/widget/Button;)V

    .line 278
    .line 279
    .line 280
    :cond_2
    new-instance v1, Ll/tv3;

    .line 281
    .line 282
    invoke-direct {v1, v0}, Ll/tv3;-><init>(Lcom/clevertap/android/sdk/inapp/fragment/CTInAppNativeHeaderFragment;)V

    .line 283
    .line 284
    .line 285
    invoke-virtual {v2, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 286
    .line 287
    .line 288
    new-instance v0, Ll/uv3;

    .line 289
    .line 290
    invoke-direct {v0}, Ll/uv3;-><init>()V

    .line 291
    .line 292
    .line 293
    invoke-static {v2, v0}, Ll/kx3;->c(Landroid/view/View;Lkotlin/jvm/functions/Function2;)V

    .line 294
    .line 295
    .line 296
    return-object v2
.end method
