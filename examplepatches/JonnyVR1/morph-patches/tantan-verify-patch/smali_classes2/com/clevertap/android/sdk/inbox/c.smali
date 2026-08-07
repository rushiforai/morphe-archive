.class Lcom/clevertap/android/sdk/inbox/c;
.super Lcom/clevertap/android/sdk/inbox/d;
.source "SourceFile"


# instance fields
.field private final r:Landroid/widget/RelativeLayout;

.field private final s:Landroid/widget/Button;

.field private final t:Landroid/widget/Button;

.field private final u:Landroid/widget/Button;

.field private final v:Landroid/widget/LinearLayout;

.field private final w:Landroid/widget/ImageView;

.field private final x:Landroid/widget/TextView;

.field private final y:Landroid/widget/TextView;

.field private final z:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/inbox/d;-><init>(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 5
    .line 6
    .line 7
    sget v0, Ll/icc0;->F0:I

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/widget/TextView;

    .line 14
    .line 15
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/c;->x:Landroid/widget/TextView;

    .line 16
    .line 17
    sget v0, Ll/icc0;->E0:I

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroid/widget/TextView;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/c;->y:Landroid/widget/TextView;

    .line 26
    .line 27
    sget v0, Ll/icc0;->C0:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/widget/ImageView;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 36
    .line 37
    sget v0, Ll/icc0;->f0:I

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Landroid/widget/ImageView;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/c;->w:Landroid/widget/ImageView;

    .line 46
    .line 47
    sget v0, Ll/icc0;->P0:I

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/widget/TextView;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/c;->z:Landroid/widget/TextView;

    .line 56
    .line 57
    sget v0, Ll/icc0;->o:I

    .line 58
    .line 59
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    check-cast v0, Landroid/widget/Button;

    .line 64
    .line 65
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 66
    .line 67
    sget v0, Ll/icc0;->p:I

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Landroid/widget/Button;

    .line 74
    .line 75
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/c;->t:Landroid/widget/Button;

    .line 76
    .line 77
    sget v0, Ll/icc0;->q:I

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Landroid/widget/Button;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/c;->u:Landroid/widget/Button;

    .line 86
    .line 87
    sget v0, Ll/icc0;->b0:I

    .line 88
    .line 89
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    check-cast v0, Landroid/widget/FrameLayout;

    .line 94
    .line 95
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->d:Landroid/widget/FrameLayout;

    .line 96
    .line 97
    sget v0, Ll/icc0;->N0:I

    .line 98
    .line 99
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    check-cast v0, Landroid/widget/ImageView;

    .line 104
    .line 105
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 106
    .line 107
    sget v0, Ll/icc0;->t:I

    .line 108
    .line 109
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Landroid/widget/ImageView;

    .line 114
    .line 115
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 116
    .line 117
    sget v0, Ll/icc0;->d:I

    .line 118
    .line 119
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 124
    .line 125
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/c;->r:Landroid/widget/RelativeLayout;

    .line 126
    .line 127
    sget v0, Ll/icc0;->r:I

    .line 128
    .line 129
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Landroid/widget/LinearLayout;

    .line 134
    .line 135
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/c;->v:Landroid/widget/LinearLayout;

    .line 136
    .line 137
    sget v0, Ll/icc0;->c0:I

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Landroid/widget/FrameLayout;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->i:Landroid/widget/FrameLayout;

    .line 146
    .line 147
    sget v0, Ll/icc0;->D0:I

    .line 148
    .line 149
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    check-cast p1, Landroid/widget/RelativeLayout;

    .line 154
    .line 155
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 156
    .line 157
    return-void
.end method


# virtual methods
.method public f(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;I)V
    .locals 21

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, "CleverTap SDK requires Glide dependency. Please refer CleverTap Documentation for more info"

    .line 4
    .line 5
    const-string v3, "l"

    .line 6
    .line 7
    const-string v4, "p"

    .line 8
    .line 9
    const-string v5, "CleverTap SDK requires Glide v4.9.0 or above. Please refer CleverTap Documentation for more info"

    .line 10
    .line 11
    const-string v6, "ct_image"

    .line 12
    .line 13
    invoke-super/range {p0 .. p3}, Lcom/clevertap/android/sdk/inbox/d;->f(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inbox/d;->i()Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 17
    .line 18
    .line 19
    move-result-object v12

    .line 20
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->d()Ljava/util/ArrayList;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/4 v15, 0x0

    .line 25
    invoke-virtual {v0, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    move-object v7, v0

    .line 30
    check-cast v7, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 31
    .line 32
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->x:Landroid/widget/TextView;

    .line 33
    .line 34
    invoke-virtual {v7}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->s()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v8

    .line 38
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    .line 40
    .line 41
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->x:Landroid/widget/TextView;

    .line 42
    .line 43
    invoke-virtual {v7}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->t()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v8

    .line 47
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v8

    .line 51
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 52
    .line 53
    .line 54
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->y:Landroid/widget/TextView;

    .line 55
    .line 56
    invoke-virtual {v7}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->p()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v8

    .line 60
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->y:Landroid/widget/TextView;

    .line 64
    .line 65
    invoke-virtual {v7}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->q()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v8

    .line 69
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v8

    .line 73
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 74
    .line 75
    .line 76
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->r:Landroid/widget/RelativeLayout;

    .line 77
    .line 78
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->a()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v8

    .line 82
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v8

    .line 86
    invoke-virtual {v0, v8}, Landroid/view/View;->setBackgroundColor(I)V

    .line 87
    .line 88
    .line 89
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->c()J

    .line 90
    .line 91
    .line 92
    move-result-wide v8

    .line 93
    invoke-virtual {v1, v8, v9}, Lcom/clevertap/android/sdk/inbox/d;->e(J)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iget-object v8, v1, Lcom/clevertap/android/sdk/inbox/c;->z:Landroid/widget/TextView;

    .line 98
    .line 99
    invoke-virtual {v8, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 100
    .line 101
    .line 102
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->z:Landroid/widget/TextView;

    .line 103
    .line 104
    invoke-virtual {v7}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->t()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v8

    .line 108
    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v8

    .line 112
    invoke-virtual {v0, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 113
    .line 114
    .line 115
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->k()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    iget-object v8, v1, Lcom/clevertap/android/sdk/inbox/d;->q:Landroid/widget/ImageView;

    .line 120
    .line 121
    const/16 v9, 0x8

    .line 122
    .line 123
    if-eqz v0, :cond_0

    .line 124
    .line 125
    invoke-virtual {v8, v9}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 126
    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_0
    invoke-virtual {v8, v15}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 130
    .line 131
    .line 132
    :goto_0
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->d:Landroid/widget/FrameLayout;

    .line 133
    .line 134
    invoke-virtual {v0, v9}, Landroid/view/View;->setVisibility(I)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v7}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->l()Lorg/json/JSONArray;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iget-object v8, v1, Lcom/clevertap/android/sdk/inbox/c;->v:Landroid/widget/LinearLayout;

    .line 142
    .line 143
    const/4 v10, 0x2

    .line 144
    if-eqz v0, :cond_6

    .line 145
    .line 146
    invoke-virtual {v8, v15}, Landroid/view/View;->setVisibility(I)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 150
    .line 151
    .line 152
    move-result v8

    .line 153
    const/4 v11, 0x1

    .line 154
    if-eq v8, v11, :cond_4

    .line 155
    .line 156
    if-eq v8, v10, :cond_3

    .line 157
    .line 158
    const/4 v13, 0x3

    .line 159
    if-eq v8, v13, :cond_2

    .line 160
    .line 161
    :cond_1
    move-object/from16 v17, v2

    .line 162
    .line 163
    move-object v15, v7

    .line 164
    goto/16 :goto_3

    .line 165
    .line 166
    :cond_2
    :try_start_0
    invoke-virtual {v0, v15}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 167
    .line 168
    .line 169
    move-result-object v8

    .line 170
    iget-object v13, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 171
    .line 172
    invoke-virtual {v13, v15}, Landroid/view/View;->setVisibility(I)V

    .line 173
    .line 174
    .line 175
    iget-object v13, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 176
    .line 177
    invoke-virtual {v7, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->i(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v14

    .line 181
    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 182
    .line 183
    .line 184
    iget-object v13, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 185
    .line 186
    invoke-virtual {v7, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->f(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v14

    .line 190
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 191
    .line 192
    .line 193
    move-result v14

    .line 194
    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 195
    .line 196
    .line 197
    iget-object v13, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 198
    .line 199
    invoke-virtual {v7, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->e(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v14

    .line 203
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 204
    .line 205
    .line 206
    move-result v14

    .line 207
    invoke-virtual {v13, v14}, Landroid/view/View;->setBackgroundColor(I)V

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 211
    .line 212
    .line 213
    move-result-object v11

    .line 214
    iget-object v13, v1, Lcom/clevertap/android/sdk/inbox/c;->t:Landroid/widget/Button;

    .line 215
    .line 216
    invoke-virtual {v13, v15}, Landroid/view/View;->setVisibility(I)V

    .line 217
    .line 218
    .line 219
    iget-object v13, v1, Lcom/clevertap/android/sdk/inbox/c;->t:Landroid/widget/Button;

    .line 220
    .line 221
    invoke-virtual {v7, v11}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->i(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v14

    .line 225
    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 226
    .line 227
    .line 228
    iget-object v13, v1, Lcom/clevertap/android/sdk/inbox/c;->t:Landroid/widget/Button;

    .line 229
    .line 230
    invoke-virtual {v7, v11}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->f(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v14

    .line 234
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 235
    .line 236
    .line 237
    move-result v14

    .line 238
    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 239
    .line 240
    .line 241
    iget-object v13, v1, Lcom/clevertap/android/sdk/inbox/c;->t:Landroid/widget/Button;

    .line 242
    .line 243
    invoke-virtual {v7, v11}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->e(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v14

    .line 247
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 248
    .line 249
    .line 250
    move-result v14

    .line 251
    invoke-virtual {v13, v14}, Landroid/view/View;->setBackgroundColor(I)V

    .line 252
    .line 253
    .line 254
    invoke-virtual {v0, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    iget-object v13, v1, Lcom/clevertap/android/sdk/inbox/c;->u:Landroid/widget/Button;

    .line 259
    .line 260
    invoke-virtual {v13, v15}, Landroid/view/View;->setVisibility(I)V

    .line 261
    .line 262
    .line 263
    iget-object v13, v1, Lcom/clevertap/android/sdk/inbox/c;->u:Landroid/widget/Button;

    .line 264
    .line 265
    invoke-virtual {v7, v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->i(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v14

    .line 269
    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 270
    .line 271
    .line 272
    iget-object v13, v1, Lcom/clevertap/android/sdk/inbox/c;->u:Landroid/widget/Button;

    .line 273
    .line 274
    invoke-virtual {v7, v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->f(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v14

    .line 278
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 279
    .line 280
    .line 281
    move-result v14

    .line 282
    invoke-virtual {v13, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 283
    .line 284
    .line 285
    iget-object v13, v1, Lcom/clevertap/android/sdk/inbox/c;->u:Landroid/widget/Button;

    .line 286
    .line 287
    invoke-virtual {v7, v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->e(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v14

    .line 291
    invoke-static {v14}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 292
    .line 293
    .line 294
    move-result v14

    .line 295
    invoke-virtual {v13, v14}, Landroid/view/View;->setBackgroundColor(I)V

    .line 296
    .line 297
    .line 298
    if-eqz v12, :cond_1

    .line 299
    .line 300
    iget-object v13, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    .line 301
    .line 302
    move-object v14, v7

    .line 303
    :try_start_1
    new-instance v7, Lcom/clevertap/android/sdk/inbox/e;

    .line 304
    .line 305
    invoke-virtual {v13}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 306
    .line 307
    .line 308
    move-result-object v16

    .line 309
    invoke-interface/range {v16 .. v16}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v16
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 313
    move-object/from16 v17, v13

    .line 314
    .line 315
    const/4 v13, 0x0

    .line 316
    move-object/from16 v18, v14

    .line 317
    .line 318
    const/4 v14, 0x0

    .line 319
    move-object/from16 v10, v16

    .line 320
    .line 321
    move-object/from16 v15, v17

    .line 322
    .line 323
    move-object/from16 v19, v18

    .line 324
    .line 325
    move-object/from16 v17, v2

    .line 326
    .line 327
    move v2, v9

    .line 328
    move-object/from16 v16, v11

    .line 329
    .line 330
    move-object/from16 v9, p1

    .line 331
    .line 332
    move-object v11, v8

    .line 333
    move/from16 v8, p3

    .line 334
    .line 335
    :try_start_2
    invoke-direct/range {v7 .. v14}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 336
    .line 337
    .line 338
    invoke-virtual {v15, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 339
    .line 340
    .line 341
    iget-object v15, v1, Lcom/clevertap/android/sdk/inbox/c;->t:Landroid/widget/Button;

    .line 342
    .line 343
    new-instance v7, Lcom/clevertap/android/sdk/inbox/e;

    .line 344
    .line 345
    invoke-virtual {v15}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 346
    .line 347
    .line 348
    move-result-object v8

    .line 349
    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v10

    .line 353
    const/4 v13, 0x0

    .line 354
    const/4 v14, 0x1

    .line 355
    move-object/from16 v9, p1

    .line 356
    .line 357
    move/from16 v8, p3

    .line 358
    .line 359
    move-object/from16 v11, v16

    .line 360
    .line 361
    invoke-direct/range {v7 .. v14}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 362
    .line 363
    .line 364
    invoke-virtual {v15, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 365
    .line 366
    .line 367
    iget-object v15, v1, Lcom/clevertap/android/sdk/inbox/c;->u:Landroid/widget/Button;

    .line 368
    .line 369
    new-instance v7, Lcom/clevertap/android/sdk/inbox/e;

    .line 370
    .line 371
    invoke-virtual {v15}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 372
    .line 373
    .line 374
    move-result-object v8

    .line 375
    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v10

    .line 379
    const/4 v13, 0x0

    .line 380
    const/4 v14, 0x2

    .line 381
    move-object/from16 v9, p1

    .line 382
    .line 383
    move/from16 v8, p3

    .line 384
    .line 385
    move-object v11, v0

    .line 386
    invoke-direct/range {v7 .. v14}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 387
    .line 388
    .line 389
    invoke-virtual {v15, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 390
    .line 391
    .line 392
    move-object/from16 v15, v19

    .line 393
    .line 394
    goto/16 :goto_3

    .line 395
    .line 396
    :catch_0
    move-exception v0

    .line 397
    :goto_1
    move-object/from16 v15, v19

    .line 398
    .line 399
    goto/16 :goto_2

    .line 400
    .line 401
    :catch_1
    move-exception v0

    .line 402
    move-object/from16 v17, v2

    .line 403
    .line 404
    move v2, v9

    .line 405
    move-object/from16 v19, v14

    .line 406
    .line 407
    goto :goto_1

    .line 408
    :catch_2
    move-exception v0

    .line 409
    move-object/from16 v17, v2

    .line 410
    .line 411
    move-object/from16 v19, v7

    .line 412
    .line 413
    move v2, v9

    .line 414
    goto :goto_1

    .line 415
    :cond_3
    move-object/from16 v17, v2

    .line 416
    .line 417
    move-object/from16 v19, v7

    .line 418
    .line 419
    move v2, v9

    .line 420
    move v7, v15

    .line 421
    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 422
    .line 423
    .line 424
    move-result-object v8

    .line 425
    iget-object v9, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 426
    .line 427
    invoke-virtual {v9, v7}, Landroid/view/View;->setVisibility(I)V

    .line 428
    .line 429
    .line 430
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 431
    .line 432
    move-object/from16 v15, v19

    .line 433
    .line 434
    :try_start_3
    invoke-virtual {v15, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->i(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object v9

    .line 438
    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 439
    .line 440
    .line 441
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 442
    .line 443
    invoke-virtual {v15, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->f(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 444
    .line 445
    .line 446
    move-result-object v9

    .line 447
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 448
    .line 449
    .line 450
    move-result v9

    .line 451
    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 452
    .line 453
    .line 454
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 455
    .line 456
    invoke-virtual {v15, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->e(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 457
    .line 458
    .line 459
    move-result-object v9

    .line 460
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 461
    .line 462
    .line 463
    move-result v9

    .line 464
    invoke-virtual {v7, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 465
    .line 466
    .line 467
    invoke-virtual {v0, v11}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 468
    .line 469
    .line 470
    move-result-object v0

    .line 471
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/c;->t:Landroid/widget/Button;

    .line 472
    .line 473
    const/4 v9, 0x0

    .line 474
    invoke-virtual {v7, v9}, Landroid/view/View;->setVisibility(I)V

    .line 475
    .line 476
    .line 477
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/c;->t:Landroid/widget/Button;

    .line 478
    .line 479
    invoke-virtual {v15, v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->i(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 480
    .line 481
    .line 482
    move-result-object v9

    .line 483
    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 484
    .line 485
    .line 486
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/c;->t:Landroid/widget/Button;

    .line 487
    .line 488
    invoke-virtual {v15, v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->f(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 489
    .line 490
    .line 491
    move-result-object v9

    .line 492
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 493
    .line 494
    .line 495
    move-result v9

    .line 496
    invoke-virtual {v7, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 497
    .line 498
    .line 499
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/c;->t:Landroid/widget/Button;

    .line 500
    .line 501
    invoke-virtual {v15, v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->e(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 502
    .line 503
    .line 504
    move-result-object v9

    .line 505
    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 506
    .line 507
    .line 508
    move-result v9

    .line 509
    invoke-virtual {v7, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 510
    .line 511
    .line 512
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 513
    .line 514
    iget-object v9, v1, Lcom/clevertap/android/sdk/inbox/c;->t:Landroid/widget/Button;

    .line 515
    .line 516
    iget-object v10, v1, Lcom/clevertap/android/sdk/inbox/c;->u:Landroid/widget/Button;

    .line 517
    .line 518
    invoke-virtual {v1, v7, v9, v10}, Lcom/clevertap/android/sdk/inbox/d;->j(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    .line 519
    .line 520
    .line 521
    if-eqz v12, :cond_5

    .line 522
    .line 523
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 524
    .line 525
    move-object v9, v7

    .line 526
    new-instance v7, Lcom/clevertap/android/sdk/inbox/e;

    .line 527
    .line 528
    invoke-virtual {v9}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 529
    .line 530
    .line 531
    move-result-object v10

    .line 532
    invoke-interface {v10}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object v10

    .line 536
    const/4 v13, 0x0

    .line 537
    const/4 v14, 0x0

    .line 538
    move-object v11, v8

    .line 539
    move-object v2, v9

    .line 540
    move-object/from16 v9, p1

    .line 541
    .line 542
    move/from16 v8, p3

    .line 543
    .line 544
    invoke-direct/range {v7 .. v14}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 545
    .line 546
    .line 547
    invoke-virtual {v2, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 548
    .line 549
    .line 550
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/c;->t:Landroid/widget/Button;

    .line 551
    .line 552
    new-instance v7, Lcom/clevertap/android/sdk/inbox/e;

    .line 553
    .line 554
    invoke-virtual {v2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 555
    .line 556
    .line 557
    move-result-object v8

    .line 558
    invoke-interface {v8}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 559
    .line 560
    .line 561
    move-result-object v10

    .line 562
    const/4 v13, 0x0

    .line 563
    const/4 v14, 0x1

    .line 564
    move-object/from16 v9, p1

    .line 565
    .line 566
    move/from16 v8, p3

    .line 567
    .line 568
    move-object v11, v0

    .line 569
    invoke-direct/range {v7 .. v14}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 570
    .line 571
    .line 572
    invoke-virtual {v2, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 573
    .line 574
    .line 575
    goto :goto_3

    .line 576
    :catch_3
    move-exception v0

    .line 577
    goto :goto_2

    .line 578
    :cond_4
    move/from16 v17, v15

    .line 579
    .line 580
    move-object v15, v7

    .line 581
    move/from16 v7, v17

    .line 582
    .line 583
    move-object/from16 v17, v2

    .line 584
    .line 585
    invoke-virtual {v0, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 586
    .line 587
    .line 588
    move-result-object v11

    .line 589
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 590
    .line 591
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 592
    .line 593
    .line 594
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 595
    .line 596
    invoke-virtual {v15, v11}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->i(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 597
    .line 598
    .line 599
    move-result-object v2

    .line 600
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 601
    .line 602
    .line 603
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 604
    .line 605
    invoke-virtual {v15, v11}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->f(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 606
    .line 607
    .line 608
    move-result-object v2

    .line 609
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 610
    .line 611
    .line 612
    move-result v2

    .line 613
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 614
    .line 615
    .line 616
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 617
    .line 618
    invoke-virtual {v15, v11}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->e(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 619
    .line 620
    .line 621
    move-result-object v2

    .line 622
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 623
    .line 624
    .line 625
    move-result v2

    .line 626
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 627
    .line 628
    .line 629
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 630
    .line 631
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/c;->t:Landroid/widget/Button;

    .line 632
    .line 633
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/c;->u:Landroid/widget/Button;

    .line 634
    .line 635
    invoke-virtual {v1, v0, v2, v7}, Lcom/clevertap/android/sdk/inbox/d;->k(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    .line 636
    .line 637
    .line 638
    if-eqz v12, :cond_5

    .line 639
    .line 640
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->s:Landroid/widget/Button;

    .line 641
    .line 642
    new-instance v7, Lcom/clevertap/android/sdk/inbox/e;

    .line 643
    .line 644
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 645
    .line 646
    .line 647
    move-result-object v2

    .line 648
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 649
    .line 650
    .line 651
    move-result-object v10

    .line 652
    const/4 v13, 0x0

    .line 653
    const/4 v14, 0x0

    .line 654
    move-object/from16 v9, p1

    .line 655
    .line 656
    move/from16 v8, p3

    .line 657
    .line 658
    invoke-direct/range {v7 .. v14}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 659
    .line 660
    .line 661
    invoke-virtual {v0, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_3

    .line 662
    .line 663
    .line 664
    goto :goto_3

    .line 665
    :goto_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 666
    .line 667
    const-string v7, "Error parsing CTA JSON - "

    .line 668
    .line 669
    invoke-direct {v2, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 670
    .line 671
    .line 672
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 673
    .line 674
    .line 675
    move-result-object v0

    .line 676
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 677
    .line 678
    .line 679
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 680
    .line 681
    .line 682
    move-result-object v0

    .line 683
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 684
    .line 685
    .line 686
    :cond_5
    :goto_3
    const/16 v2, 0x8

    .line 687
    .line 688
    goto :goto_4

    .line 689
    :cond_6
    move-object/from16 v17, v2

    .line 690
    .line 691
    move-object v15, v7

    .line 692
    move v2, v9

    .line 693
    invoke-virtual {v8, v2}, Landroid/view/View;->setVisibility(I)V

    .line 694
    .line 695
    .line 696
    :goto_4
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 697
    .line 698
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 699
    .line 700
    .line 701
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 702
    .line 703
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->a()Ljava/lang/String;

    .line 704
    .line 705
    .line 706
    move-result-object v7

    .line 707
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 708
    .line 709
    .line 710
    move-result v7

    .line 711
    invoke-virtual {v0, v7}, Landroid/view/View;->setBackgroundColor(I)V

    .line 712
    .line 713
    .line 714
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 715
    .line 716
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 717
    .line 718
    .line 719
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 720
    .line 721
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->a()Ljava/lang/String;

    .line 722
    .line 723
    .line 724
    move-result-object v7

    .line 725
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 726
    .line 727
    .line 728
    move-result v7

    .line 729
    invoke-virtual {v0, v7}, Landroid/view/View;->setBackgroundColor(I)V

    .line 730
    .line 731
    .line 732
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 733
    .line 734
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 735
    .line 736
    .line 737
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 738
    .line 739
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->a()Ljava/lang/String;

    .line 740
    .line 741
    .line 742
    move-result-object v7

    .line 743
    invoke-static {v7}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 744
    .line 745
    .line 746
    move-result v7

    .line 747
    invoke-virtual {v0, v7}, Landroid/view/View;->setBackgroundColor(I)V

    .line 748
    .line 749
    .line 750
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 751
    .line 752
    const/4 v7, 0x0

    .line 753
    invoke-virtual {v0, v7}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 754
    .line 755
    .line 756
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 757
    .line 758
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 759
    .line 760
    .line 761
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->i:Landroid/widget/FrameLayout;

    .line 762
    .line 763
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 764
    .line 765
    .line 766
    :try_start_4
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->f()Ljava/lang/String;

    .line 767
    .line 768
    .line 769
    move-result-object v0

    .line 770
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 771
    .line 772
    .line 773
    move-result v2
    :try_end_4
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_4 .. :try_end_4} :catch_d

    .line 774
    const/16 v7, 0x6c

    .line 775
    .line 776
    const-string v8, "ct_audio"

    .line 777
    .line 778
    const/4 v9, -0x1

    .line 779
    const-string v10, "ct_video_1"

    .line 780
    .line 781
    if-eq v2, v7, :cond_f

    .line 782
    .line 783
    const/16 v7, 0x70

    .line 784
    .line 785
    if-eq v2, v7, :cond_7

    .line 786
    .line 787
    goto/16 :goto_7

    .line 788
    .line 789
    :cond_7
    :try_start_5
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 790
    .line 791
    .line 792
    move-result v0

    .line 793
    if-eqz v0, :cond_15

    .line 794
    .line 795
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->o()Ljava/lang/String;

    .line 796
    .line 797
    .line 798
    move-result-object v0

    .line 799
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 800
    .line 801
    .line 802
    move-result v0

    .line 803
    if-nez v0, :cond_8

    .line 804
    .line 805
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 806
    .line 807
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->o()Ljava/lang/String;

    .line 808
    .line 809
    .line 810
    move-result-object v2

    .line 811
    invoke-virtual {v0, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 812
    .line 813
    .line 814
    :cond_8
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->z()Z

    .line 815
    .line 816
    .line 817
    move-result v0

    .line 818
    if-eqz v0, :cond_9

    .line 819
    .line 820
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 821
    .line 822
    const/4 v7, 0x0

    .line 823
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 824
    .line 825
    .line 826
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 827
    .line 828
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 829
    .line 830
    .line 831
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 832
    .line 833
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 834
    .line 835
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_5
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_5 .. :try_end_5} :catch_d

    .line 836
    .line 837
    .line 838
    :try_start_6
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 839
    .line 840
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 841
    .line 842
    .line 843
    move-result-object v0

    .line 844
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 845
    .line 846
    .line 847
    move-result-object v0

    .line 848
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 849
    .line 850
    .line 851
    move-result-object v2

    .line 852
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 853
    .line 854
    .line 855
    move-result-object v0

    .line 856
    new-instance v2, Ll/p2d0;

    .line 857
    .line 858
    invoke-direct {v2}, Ll/p2d0;-><init>()V

    .line 859
    .line 860
    .line 861
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 862
    .line 863
    invoke-static {v7, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 864
    .line 865
    .line 866
    move-result v7

    .line 867
    invoke-virtual {v2, v7}, Ll/lr2;->Y(I)Ll/lr2;

    .line 868
    .line 869
    .line 870
    move-result-object v2

    .line 871
    check-cast v2, Ll/p2d0;

    .line 872
    .line 873
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 874
    .line 875
    invoke-static {v7, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 876
    .line 877
    .line 878
    move-result v7

    .line 879
    invoke-virtual {v2, v7}, Ll/lr2;->j(I)Ll/lr2;

    .line 880
    .line 881
    .line 882
    move-result-object v2

    .line 883
    invoke-virtual {v0, v2}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 884
    .line 885
    .line 886
    move-result-object v0

    .line 887
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 888
    .line 889
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_6
    .catch Ljava/lang/NoSuchMethodError; {:try_start_6 .. :try_end_6} :catch_4
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_6 .. :try_end_6} :catch_d

    .line 890
    .line 891
    .line 892
    goto/16 :goto_8

    .line 893
    .line 894
    :catch_4
    :try_start_7
    invoke-static {v5}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 895
    .line 896
    .line 897
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 898
    .line 899
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 900
    .line 901
    .line 902
    move-result-object v0

    .line 903
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 904
    .line 905
    .line 906
    move-result-object v0

    .line 907
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 908
    .line 909
    .line 910
    move-result-object v2

    .line 911
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 912
    .line 913
    .line 914
    move-result-object v0

    .line 915
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 916
    .line 917
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 918
    .line 919
    .line 920
    goto/16 :goto_8

    .line 921
    .line 922
    :cond_9
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->y()Z

    .line 923
    .line 924
    .line 925
    move-result v0

    .line 926
    if-eqz v0, :cond_a

    .line 927
    .line 928
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 929
    .line 930
    const/4 v7, 0x0

    .line 931
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 932
    .line 933
    .line 934
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 935
    .line 936
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 937
    .line 938
    .line 939
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 940
    .line 941
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 942
    .line 943
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_7
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_7 .. :try_end_7} :catch_d

    .line 944
    .line 945
    .line 946
    :try_start_8
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 947
    .line 948
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 949
    .line 950
    .line 951
    move-result-object v0

    .line 952
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 953
    .line 954
    .line 955
    move-result-object v0

    .line 956
    invoke-virtual {v0}, Ll/m2d0;->m()Ll/a2d0;

    .line 957
    .line 958
    .line 959
    move-result-object v0

    .line 960
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 961
    .line 962
    .line 963
    move-result-object v2

    .line 964
    invoke-virtual {v0, v2}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 965
    .line 966
    .line 967
    move-result-object v0

    .line 968
    new-instance v2, Ll/p2d0;

    .line 969
    .line 970
    invoke-direct {v2}, Ll/p2d0;-><init>()V

    .line 971
    .line 972
    .line 973
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 974
    .line 975
    invoke-static {v7, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 976
    .line 977
    .line 978
    move-result v7

    .line 979
    invoke-virtual {v2, v7}, Ll/lr2;->Y(I)Ll/lr2;

    .line 980
    .line 981
    .line 982
    move-result-object v2

    .line 983
    check-cast v2, Ll/p2d0;

    .line 984
    .line 985
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 986
    .line 987
    invoke-static {v7, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 988
    .line 989
    .line 990
    move-result v7

    .line 991
    invoke-virtual {v2, v7}, Ll/lr2;->j(I)Ll/lr2;

    .line 992
    .line 993
    .line 994
    move-result-object v2

    .line 995
    invoke-virtual {v0, v2}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 996
    .line 997
    .line 998
    move-result-object v0

    .line 999
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1000
    .line 1001
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_8
    .catch Ljava/lang/NoSuchMethodError; {:try_start_8 .. :try_end_8} :catch_5
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_8 .. :try_end_8} :catch_d

    .line 1002
    .line 1003
    .line 1004
    goto/16 :goto_8

    .line 1005
    .line 1006
    :catch_5
    :try_start_9
    invoke-static {v5}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 1007
    .line 1008
    .line 1009
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1010
    .line 1011
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1012
    .line 1013
    .line 1014
    move-result-object v0

    .line 1015
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1016
    .line 1017
    .line 1018
    move-result-object v0

    .line 1019
    invoke-virtual {v0}, Ll/m2d0;->m()Ll/a2d0;

    .line 1020
    .line 1021
    .line 1022
    move-result-object v0

    .line 1023
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1024
    .line 1025
    .line 1026
    move-result-object v2

    .line 1027
    invoke-virtual {v0, v2}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 1028
    .line 1029
    .line 1030
    move-result-object v0

    .line 1031
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1032
    .line 1033
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1034
    .line 1035
    .line 1036
    goto/16 :goto_8

    .line 1037
    .line 1038
    :cond_a
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->B()Z

    .line 1039
    .line 1040
    .line 1041
    move-result v0

    .line 1042
    if-eqz v0, :cond_e

    .line 1043
    .line 1044
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1045
    .line 1046
    const/4 v7, 0x0

    .line 1047
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1048
    .line 1049
    .line 1050
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 1051
    .line 1052
    .line 1053
    move-result-object v0

    .line 1054
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 1055
    .line 1056
    .line 1057
    move-result v0

    .line 1058
    if-nez v0, :cond_c

    .line 1059
    .line 1060
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1061
    .line 1062
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1063
    .line 1064
    .line 1065
    sget v0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->k:I
    :try_end_9
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_9 .. :try_end_9} :catch_d

    .line 1066
    .line 1067
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1068
    .line 1069
    const/4 v7, 0x2

    .line 1070
    if-ne v0, v7, :cond_b

    .line 1071
    .line 1072
    :try_start_a
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 1073
    .line 1074
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1075
    .line 1076
    .line 1077
    goto :goto_5

    .line 1078
    :cond_b
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 1079
    .line 1080
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_a
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_a .. :try_end_a} :catch_d

    .line 1081
    .line 1082
    .line 1083
    :goto_5
    :try_start_b
    invoke-static {v5}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 1084
    .line 1085
    .line 1086
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1087
    .line 1088
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1089
    .line 1090
    .line 1091
    move-result-object v0

    .line 1092
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1093
    .line 1094
    .line 1095
    move-result-object v0

    .line 1096
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 1097
    .line 1098
    .line 1099
    move-result-object v2

    .line 1100
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1101
    .line 1102
    .line 1103
    move-result-object v0

    .line 1104
    new-instance v2, Ll/p2d0;

    .line 1105
    .line 1106
    invoke-direct {v2}, Ll/p2d0;-><init>()V

    .line 1107
    .line 1108
    .line 1109
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1110
    .line 1111
    invoke-static {v7, v10}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1112
    .line 1113
    .line 1114
    move-result v7

    .line 1115
    invoke-virtual {v2, v7}, Ll/lr2;->Y(I)Ll/lr2;

    .line 1116
    .line 1117
    .line 1118
    move-result-object v2

    .line 1119
    check-cast v2, Ll/p2d0;

    .line 1120
    .line 1121
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1122
    .line 1123
    invoke-static {v7, v10}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1124
    .line 1125
    .line 1126
    move-result v7

    .line 1127
    invoke-virtual {v2, v7}, Ll/lr2;->j(I)Ll/lr2;

    .line 1128
    .line 1129
    .line 1130
    move-result-object v2

    .line 1131
    invoke-virtual {v0, v2}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 1132
    .line 1133
    .line 1134
    move-result-object v0

    .line 1135
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1136
    .line 1137
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_b
    .catch Ljava/lang/NoSuchMethodError; {:try_start_b .. :try_end_b} :catch_6
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_b .. :try_end_b} :catch_d

    .line 1138
    .line 1139
    .line 1140
    goto/16 :goto_8

    .line 1141
    .line 1142
    :catch_6
    :try_start_c
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1143
    .line 1144
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1145
    .line 1146
    .line 1147
    move-result-object v0

    .line 1148
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1149
    .line 1150
    .line 1151
    move-result-object v0

    .line 1152
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 1153
    .line 1154
    .line 1155
    move-result-object v2

    .line 1156
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1157
    .line 1158
    .line 1159
    move-result-object v0

    .line 1160
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1161
    .line 1162
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1163
    .line 1164
    .line 1165
    goto/16 :goto_8

    .line 1166
    .line 1167
    :cond_c
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1168
    .line 1169
    const/4 v7, 0x0

    .line 1170
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1171
    .line 1172
    .line 1173
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1174
    .line 1175
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1176
    .line 1177
    .line 1178
    sget v0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->k:I
    :try_end_c
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_c .. :try_end_c} :catch_d

    .line 1179
    .line 1180
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1181
    .line 1182
    const/4 v7, 0x2

    .line 1183
    if-ne v0, v7, :cond_d

    .line 1184
    .line 1185
    :try_start_d
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 1186
    .line 1187
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1188
    .line 1189
    .line 1190
    goto :goto_6

    .line 1191
    :cond_d
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 1192
    .line 1193
    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1194
    .line 1195
    .line 1196
    :goto_6
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1197
    .line 1198
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inbox/d;->g()I

    .line 1199
    .line 1200
    .line 1201
    move-result v2

    .line 1202
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1203
    .line 1204
    .line 1205
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1206
    .line 1207
    invoke-static {v0, v10}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1208
    .line 1209
    .line 1210
    move-result v0

    .line 1211
    if-eq v0, v9, :cond_1b

    .line 1212
    .line 1213
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1214
    .line 1215
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1216
    .line 1217
    .line 1218
    move-result-object v2

    .line 1219
    invoke-static {v2}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1220
    .line 1221
    .line 1222
    move-result-object v2

    .line 1223
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1224
    .line 1225
    .line 1226
    move-result-object v0

    .line 1227
    invoke-virtual {v2, v0}, Ll/m2d0;->s(Ljava/lang/Integer;)Ll/a2d0;

    .line 1228
    .line 1229
    .line 1230
    move-result-object v0

    .line 1231
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1232
    .line 1233
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1234
    .line 1235
    .line 1236
    goto/16 :goto_8

    .line 1237
    .line 1238
    :cond_e
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->x()Z

    .line 1239
    .line 1240
    .line 1241
    move-result v0

    .line 1242
    if-eqz v0, :cond_1b

    .line 1243
    .line 1244
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1245
    .line 1246
    const/4 v7, 0x0

    .line 1247
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1248
    .line 1249
    .line 1250
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1251
    .line 1252
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1253
    .line 1254
    .line 1255
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1256
    .line 1257
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 1258
    .line 1259
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1260
    .line 1261
    .line 1262
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1263
    .line 1264
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inbox/d;->g()I

    .line 1265
    .line 1266
    .line 1267
    move-result v2

    .line 1268
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1269
    .line 1270
    .line 1271
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1272
    .line 1273
    invoke-static {v0, v8}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1274
    .line 1275
    .line 1276
    move-result v0

    .line 1277
    if-eq v0, v9, :cond_1b

    .line 1278
    .line 1279
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1280
    .line 1281
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1282
    .line 1283
    .line 1284
    move-result-object v2

    .line 1285
    invoke-static {v2}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1286
    .line 1287
    .line 1288
    move-result-object v2

    .line 1289
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1290
    .line 1291
    .line 1292
    move-result-object v0

    .line 1293
    invoke-virtual {v2, v0}, Ll/m2d0;->s(Ljava/lang/Integer;)Ll/a2d0;

    .line 1294
    .line 1295
    .line 1296
    move-result-object v0

    .line 1297
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1298
    .line 1299
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1300
    .line 1301
    .line 1302
    goto/16 :goto_8

    .line 1303
    .line 1304
    :cond_f
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1305
    .line 1306
    .line 1307
    move-result v0

    .line 1308
    if-eqz v0, :cond_15

    .line 1309
    .line 1310
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->o()Ljava/lang/String;

    .line 1311
    .line 1312
    .line 1313
    move-result-object v0

    .line 1314
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1315
    .line 1316
    .line 1317
    move-result v0

    .line 1318
    if-nez v0, :cond_10

    .line 1319
    .line 1320
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1321
    .line 1322
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->o()Ljava/lang/String;

    .line 1323
    .line 1324
    .line 1325
    move-result-object v2

    .line 1326
    invoke-virtual {v0, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1327
    .line 1328
    .line 1329
    :cond_10
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->z()Z

    .line 1330
    .line 1331
    .line 1332
    move-result v0

    .line 1333
    if-eqz v0, :cond_11

    .line 1334
    .line 1335
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1336
    .line 1337
    const/4 v7, 0x0

    .line 1338
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1339
    .line 1340
    .line 1341
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1342
    .line 1343
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1344
    .line 1345
    .line 1346
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1347
    .line 1348
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 1349
    .line 1350
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_d
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_d .. :try_end_d} :catch_d

    .line 1351
    .line 1352
    .line 1353
    :try_start_e
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1354
    .line 1355
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1356
    .line 1357
    .line 1358
    move-result-object v0

    .line 1359
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1360
    .line 1361
    .line 1362
    move-result-object v0

    .line 1363
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1364
    .line 1365
    .line 1366
    move-result-object v2

    .line 1367
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1368
    .line 1369
    .line 1370
    move-result-object v0

    .line 1371
    new-instance v2, Ll/p2d0;

    .line 1372
    .line 1373
    invoke-direct {v2}, Ll/p2d0;-><init>()V

    .line 1374
    .line 1375
    .line 1376
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1377
    .line 1378
    invoke-static {v7, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1379
    .line 1380
    .line 1381
    move-result v7

    .line 1382
    invoke-virtual {v2, v7}, Ll/lr2;->Y(I)Ll/lr2;

    .line 1383
    .line 1384
    .line 1385
    move-result-object v2

    .line 1386
    check-cast v2, Ll/p2d0;

    .line 1387
    .line 1388
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1389
    .line 1390
    invoke-static {v7, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1391
    .line 1392
    .line 1393
    move-result v7

    .line 1394
    invoke-virtual {v2, v7}, Ll/lr2;->j(I)Ll/lr2;

    .line 1395
    .line 1396
    .line 1397
    move-result-object v2

    .line 1398
    invoke-virtual {v0, v2}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 1399
    .line 1400
    .line 1401
    move-result-object v0

    .line 1402
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1403
    .line 1404
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_e
    .catch Ljava/lang/NoSuchMethodError; {:try_start_e .. :try_end_e} :catch_7
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_e .. :try_end_e} :catch_d

    .line 1405
    .line 1406
    .line 1407
    goto/16 :goto_8

    .line 1408
    .line 1409
    :catch_7
    :try_start_f
    invoke-static {v5}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 1410
    .line 1411
    .line 1412
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1413
    .line 1414
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1415
    .line 1416
    .line 1417
    move-result-object v0

    .line 1418
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1419
    .line 1420
    .line 1421
    move-result-object v0

    .line 1422
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1423
    .line 1424
    .line 1425
    move-result-object v2

    .line 1426
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1427
    .line 1428
    .line 1429
    move-result-object v0

    .line 1430
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1431
    .line 1432
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1433
    .line 1434
    .line 1435
    goto/16 :goto_8

    .line 1436
    .line 1437
    :cond_11
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->y()Z

    .line 1438
    .line 1439
    .line 1440
    move-result v0

    .line 1441
    if-eqz v0, :cond_12

    .line 1442
    .line 1443
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1444
    .line 1445
    const/4 v7, 0x0

    .line 1446
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1447
    .line 1448
    .line 1449
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1450
    .line 1451
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1452
    .line 1453
    .line 1454
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1455
    .line 1456
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 1457
    .line 1458
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_f
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_f .. :try_end_f} :catch_d

    .line 1459
    .line 1460
    .line 1461
    :try_start_10
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1462
    .line 1463
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1464
    .line 1465
    .line 1466
    move-result-object v0

    .line 1467
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1468
    .line 1469
    .line 1470
    move-result-object v0

    .line 1471
    invoke-virtual {v0}, Ll/m2d0;->m()Ll/a2d0;

    .line 1472
    .line 1473
    .line 1474
    move-result-object v0

    .line 1475
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1476
    .line 1477
    .line 1478
    move-result-object v2

    .line 1479
    invoke-virtual {v0, v2}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 1480
    .line 1481
    .line 1482
    move-result-object v0

    .line 1483
    new-instance v2, Ll/p2d0;

    .line 1484
    .line 1485
    invoke-direct {v2}, Ll/p2d0;-><init>()V

    .line 1486
    .line 1487
    .line 1488
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1489
    .line 1490
    invoke-static {v7, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1491
    .line 1492
    .line 1493
    move-result v7

    .line 1494
    invoke-virtual {v2, v7}, Ll/lr2;->Y(I)Ll/lr2;

    .line 1495
    .line 1496
    .line 1497
    move-result-object v2

    .line 1498
    check-cast v2, Ll/p2d0;

    .line 1499
    .line 1500
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1501
    .line 1502
    invoke-static {v7, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1503
    .line 1504
    .line 1505
    move-result v7

    .line 1506
    invoke-virtual {v2, v7}, Ll/lr2;->j(I)Ll/lr2;

    .line 1507
    .line 1508
    .line 1509
    move-result-object v2

    .line 1510
    invoke-virtual {v0, v2}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 1511
    .line 1512
    .line 1513
    move-result-object v0

    .line 1514
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1515
    .line 1516
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_10
    .catch Ljava/lang/NoSuchMethodError; {:try_start_10 .. :try_end_10} :catch_8
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_10 .. :try_end_10} :catch_d

    .line 1517
    .line 1518
    .line 1519
    goto/16 :goto_8

    .line 1520
    .line 1521
    :catch_8
    :try_start_11
    invoke-static {v5}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 1522
    .line 1523
    .line 1524
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1525
    .line 1526
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1527
    .line 1528
    .line 1529
    move-result-object v0

    .line 1530
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1531
    .line 1532
    .line 1533
    move-result-object v0

    .line 1534
    invoke-virtual {v0}, Ll/m2d0;->m()Ll/a2d0;

    .line 1535
    .line 1536
    .line 1537
    move-result-object v0

    .line 1538
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1539
    .line 1540
    .line 1541
    move-result-object v2

    .line 1542
    invoke-virtual {v0, v2}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 1543
    .line 1544
    .line 1545
    move-result-object v0

    .line 1546
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1547
    .line 1548
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1549
    .line 1550
    .line 1551
    goto/16 :goto_8

    .line 1552
    .line 1553
    :cond_12
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->B()Z

    .line 1554
    .line 1555
    .line 1556
    move-result v0

    .line 1557
    if-eqz v0, :cond_14

    .line 1558
    .line 1559
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1560
    .line 1561
    const/4 v7, 0x0

    .line 1562
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1563
    .line 1564
    .line 1565
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 1566
    .line 1567
    .line 1568
    move-result-object v0

    .line 1569
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 1570
    .line 1571
    .line 1572
    move-result v0

    .line 1573
    if-nez v0, :cond_13

    .line 1574
    .line 1575
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1576
    .line 1577
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1578
    .line 1579
    .line 1580
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1581
    .line 1582
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 1583
    .line 1584
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_11
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_11 .. :try_end_11} :catch_d

    .line 1585
    .line 1586
    .line 1587
    :try_start_12
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1588
    .line 1589
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1590
    .line 1591
    .line 1592
    move-result-object v0

    .line 1593
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1594
    .line 1595
    .line 1596
    move-result-object v0

    .line 1597
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 1598
    .line 1599
    .line 1600
    move-result-object v2

    .line 1601
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1602
    .line 1603
    .line 1604
    move-result-object v0

    .line 1605
    new-instance v2, Ll/p2d0;

    .line 1606
    .line 1607
    invoke-direct {v2}, Ll/p2d0;-><init>()V

    .line 1608
    .line 1609
    .line 1610
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1611
    .line 1612
    invoke-static {v7, v10}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1613
    .line 1614
    .line 1615
    move-result v7

    .line 1616
    invoke-virtual {v2, v7}, Ll/lr2;->Y(I)Ll/lr2;

    .line 1617
    .line 1618
    .line 1619
    move-result-object v2

    .line 1620
    check-cast v2, Ll/p2d0;

    .line 1621
    .line 1622
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1623
    .line 1624
    invoke-static {v7, v10}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1625
    .line 1626
    .line 1627
    move-result v7

    .line 1628
    invoke-virtual {v2, v7}, Ll/lr2;->j(I)Ll/lr2;

    .line 1629
    .line 1630
    .line 1631
    move-result-object v2

    .line 1632
    invoke-virtual {v0, v2}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 1633
    .line 1634
    .line 1635
    move-result-object v0

    .line 1636
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1637
    .line 1638
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_12
    .catch Ljava/lang/NoSuchMethodError; {:try_start_12 .. :try_end_12} :catch_9
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_12 .. :try_end_12} :catch_d

    .line 1639
    .line 1640
    .line 1641
    goto/16 :goto_8

    .line 1642
    .line 1643
    :catch_9
    :try_start_13
    invoke-static {v5}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 1644
    .line 1645
    .line 1646
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1647
    .line 1648
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1649
    .line 1650
    .line 1651
    move-result-object v0

    .line 1652
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1653
    .line 1654
    .line 1655
    move-result-object v0

    .line 1656
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 1657
    .line 1658
    .line 1659
    move-result-object v2

    .line 1660
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1661
    .line 1662
    .line 1663
    move-result-object v0

    .line 1664
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1665
    .line 1666
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1667
    .line 1668
    .line 1669
    goto/16 :goto_8

    .line 1670
    .line 1671
    :cond_13
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1672
    .line 1673
    const/4 v7, 0x0

    .line 1674
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1675
    .line 1676
    .line 1677
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1678
    .line 1679
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1680
    .line 1681
    .line 1682
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1683
    .line 1684
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 1685
    .line 1686
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1687
    .line 1688
    .line 1689
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1690
    .line 1691
    invoke-static {v0, v10}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1692
    .line 1693
    .line 1694
    move-result v0

    .line 1695
    if-eq v0, v9, :cond_1b

    .line 1696
    .line 1697
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1698
    .line 1699
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1700
    .line 1701
    .line 1702
    move-result-object v2

    .line 1703
    invoke-static {v2}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1704
    .line 1705
    .line 1706
    move-result-object v2

    .line 1707
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1708
    .line 1709
    .line 1710
    move-result-object v0

    .line 1711
    invoke-virtual {v2, v0}, Ll/m2d0;->s(Ljava/lang/Integer;)Ll/a2d0;

    .line 1712
    .line 1713
    .line 1714
    move-result-object v0

    .line 1715
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1716
    .line 1717
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1718
    .line 1719
    .line 1720
    goto/16 :goto_8

    .line 1721
    .line 1722
    :cond_14
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->x()Z

    .line 1723
    .line 1724
    .line 1725
    move-result v0

    .line 1726
    if-eqz v0, :cond_1b

    .line 1727
    .line 1728
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1729
    .line 1730
    const/4 v7, 0x0

    .line 1731
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1732
    .line 1733
    .line 1734
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1735
    .line 1736
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1737
    .line 1738
    .line 1739
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1740
    .line 1741
    sget-object v2, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 1742
    .line 1743
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1744
    .line 1745
    .line 1746
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1747
    .line 1748
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inbox/d;->g()I

    .line 1749
    .line 1750
    .line 1751
    move-result v2

    .line 1752
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1753
    .line 1754
    .line 1755
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1756
    .line 1757
    invoke-static {v0, v8}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1758
    .line 1759
    .line 1760
    move-result v0

    .line 1761
    if-eq v0, v9, :cond_1b

    .line 1762
    .line 1763
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1764
    .line 1765
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1766
    .line 1767
    .line 1768
    move-result-object v2

    .line 1769
    invoke-static {v2}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1770
    .line 1771
    .line 1772
    move-result-object v2

    .line 1773
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1774
    .line 1775
    .line 1776
    move-result-object v0

    .line 1777
    invoke-virtual {v2, v0}, Ll/m2d0;->s(Ljava/lang/Integer;)Ll/a2d0;

    .line 1778
    .line 1779
    .line 1780
    move-result-object v0

    .line 1781
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1782
    .line 1783
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1784
    .line 1785
    .line 1786
    goto/16 :goto_8

    .line 1787
    .line 1788
    :cond_15
    :goto_7
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1789
    .line 1790
    .line 1791
    move-result-object v0

    .line 1792
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1793
    .line 1794
    .line 1795
    move-result v0

    .line 1796
    if-nez v0, :cond_1b

    .line 1797
    .line 1798
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->o()Ljava/lang/String;

    .line 1799
    .line 1800
    .line 1801
    move-result-object v0

    .line 1802
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1803
    .line 1804
    .line 1805
    move-result v0

    .line 1806
    if-nez v0, :cond_16

    .line 1807
    .line 1808
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1809
    .line 1810
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->o()Ljava/lang/String;

    .line 1811
    .line 1812
    .line 1813
    move-result-object v2

    .line 1814
    invoke-virtual {v0, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1815
    .line 1816
    .line 1817
    :cond_16
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->z()Z

    .line 1818
    .line 1819
    .line 1820
    move-result v0

    .line 1821
    if-eqz v0, :cond_17

    .line 1822
    .line 1823
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1824
    .line 1825
    const/4 v7, 0x0

    .line 1826
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1827
    .line 1828
    .line 1829
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1830
    .line 1831
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1832
    .line 1833
    .line 1834
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1835
    .line 1836
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 1837
    .line 1838
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_13
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_13 .. :try_end_13} :catch_d

    .line 1839
    .line 1840
    .line 1841
    :try_start_14
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1842
    .line 1843
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1844
    .line 1845
    .line 1846
    move-result-object v0

    .line 1847
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1848
    .line 1849
    .line 1850
    move-result-object v0

    .line 1851
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1852
    .line 1853
    .line 1854
    move-result-object v2

    .line 1855
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1856
    .line 1857
    .line 1858
    move-result-object v0

    .line 1859
    new-instance v2, Ll/p2d0;

    .line 1860
    .line 1861
    invoke-direct {v2}, Ll/p2d0;-><init>()V

    .line 1862
    .line 1863
    .line 1864
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1865
    .line 1866
    invoke-static {v7, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1867
    .line 1868
    .line 1869
    move-result v7

    .line 1870
    invoke-virtual {v2, v7}, Ll/lr2;->Y(I)Ll/lr2;

    .line 1871
    .line 1872
    .line 1873
    move-result-object v2

    .line 1874
    check-cast v2, Ll/p2d0;

    .line 1875
    .line 1876
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1877
    .line 1878
    invoke-static {v7, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1879
    .line 1880
    .line 1881
    move-result v7

    .line 1882
    invoke-virtual {v2, v7}, Ll/lr2;->j(I)Ll/lr2;

    .line 1883
    .line 1884
    .line 1885
    move-result-object v2

    .line 1886
    invoke-virtual {v0, v2}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 1887
    .line 1888
    .line 1889
    move-result-object v0

    .line 1890
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1891
    .line 1892
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_14
    .catch Ljava/lang/NoSuchMethodError; {:try_start_14 .. :try_end_14} :catch_a
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_14 .. :try_end_14} :catch_d

    .line 1893
    .line 1894
    .line 1895
    goto/16 :goto_8

    .line 1896
    .line 1897
    :catch_a
    :try_start_15
    invoke-static {v5}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 1898
    .line 1899
    .line 1900
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1901
    .line 1902
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1903
    .line 1904
    .line 1905
    move-result-object v0

    .line 1906
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1907
    .line 1908
    .line 1909
    move-result-object v0

    .line 1910
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1911
    .line 1912
    .line 1913
    move-result-object v2

    .line 1914
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1915
    .line 1916
    .line 1917
    move-result-object v0

    .line 1918
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1919
    .line 1920
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1921
    .line 1922
    .line 1923
    goto/16 :goto_8

    .line 1924
    .line 1925
    :cond_17
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->y()Z

    .line 1926
    .line 1927
    .line 1928
    move-result v0

    .line 1929
    if-eqz v0, :cond_18

    .line 1930
    .line 1931
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1932
    .line 1933
    const/4 v7, 0x0

    .line 1934
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1935
    .line 1936
    .line 1937
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1938
    .line 1939
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1940
    .line 1941
    .line 1942
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1943
    .line 1944
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 1945
    .line 1946
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_15
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_15 .. :try_end_15} :catch_d

    .line 1947
    .line 1948
    .line 1949
    :try_start_16
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1950
    .line 1951
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1952
    .line 1953
    .line 1954
    move-result-object v0

    .line 1955
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1956
    .line 1957
    .line 1958
    move-result-object v0

    .line 1959
    invoke-virtual {v0}, Ll/m2d0;->m()Ll/a2d0;

    .line 1960
    .line 1961
    .line 1962
    move-result-object v0

    .line 1963
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1964
    .line 1965
    .line 1966
    move-result-object v2

    .line 1967
    invoke-virtual {v0, v2}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 1968
    .line 1969
    .line 1970
    move-result-object v0

    .line 1971
    new-instance v2, Ll/p2d0;

    .line 1972
    .line 1973
    invoke-direct {v2}, Ll/p2d0;-><init>()V

    .line 1974
    .line 1975
    .line 1976
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1977
    .line 1978
    invoke-static {v7, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1979
    .line 1980
    .line 1981
    move-result v7

    .line 1982
    invoke-virtual {v2, v7}, Ll/lr2;->Y(I)Ll/lr2;

    .line 1983
    .line 1984
    .line 1985
    move-result-object v2

    .line 1986
    check-cast v2, Ll/p2d0;

    .line 1987
    .line 1988
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1989
    .line 1990
    invoke-static {v7, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1991
    .line 1992
    .line 1993
    move-result v7

    .line 1994
    invoke-virtual {v2, v7}, Ll/lr2;->j(I)Ll/lr2;

    .line 1995
    .line 1996
    .line 1997
    move-result-object v2

    .line 1998
    invoke-virtual {v0, v2}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 1999
    .line 2000
    .line 2001
    move-result-object v0

    .line 2002
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2003
    .line 2004
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_16
    .catch Ljava/lang/NoSuchMethodError; {:try_start_16 .. :try_end_16} :catch_b
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_16 .. :try_end_16} :catch_d

    .line 2005
    .line 2006
    .line 2007
    goto/16 :goto_8

    .line 2008
    .line 2009
    :catch_b
    :try_start_17
    invoke-static {v5}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 2010
    .line 2011
    .line 2012
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2013
    .line 2014
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2015
    .line 2016
    .line 2017
    move-result-object v0

    .line 2018
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 2019
    .line 2020
    .line 2021
    move-result-object v0

    .line 2022
    invoke-virtual {v0}, Ll/m2d0;->m()Ll/a2d0;

    .line 2023
    .line 2024
    .line 2025
    move-result-object v0

    .line 2026
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 2027
    .line 2028
    .line 2029
    move-result-object v2

    .line 2030
    invoke-virtual {v0, v2}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 2031
    .line 2032
    .line 2033
    move-result-object v0

    .line 2034
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2035
    .line 2036
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 2037
    .line 2038
    .line 2039
    goto/16 :goto_8

    .line 2040
    .line 2041
    :cond_18
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->B()Z

    .line 2042
    .line 2043
    .line 2044
    move-result v0

    .line 2045
    if-eqz v0, :cond_1a

    .line 2046
    .line 2047
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 2048
    .line 2049
    const/4 v7, 0x0

    .line 2050
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 2051
    .line 2052
    .line 2053
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 2054
    .line 2055
    .line 2056
    move-result-object v0

    .line 2057
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 2058
    .line 2059
    .line 2060
    move-result v0
    :try_end_17
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_17 .. :try_end_17} :catch_d

    .line 2061
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2062
    .line 2063
    if-nez v0, :cond_19

    .line 2064
    .line 2065
    :try_start_18
    invoke-virtual {v2, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2066
    .line 2067
    .line 2068
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2069
    .line 2070
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 2071
    .line 2072
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_18
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_18 .. :try_end_18} :catch_d

    .line 2073
    .line 2074
    .line 2075
    :try_start_19
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2076
    .line 2077
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2078
    .line 2079
    .line 2080
    move-result-object v0

    .line 2081
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 2082
    .line 2083
    .line 2084
    move-result-object v0

    .line 2085
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 2086
    .line 2087
    .line 2088
    move-result-object v2

    .line 2089
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 2090
    .line 2091
    .line 2092
    move-result-object v0

    .line 2093
    new-instance v2, Ll/p2d0;

    .line 2094
    .line 2095
    invoke-direct {v2}, Ll/p2d0;-><init>()V

    .line 2096
    .line 2097
    .line 2098
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 2099
    .line 2100
    invoke-static {v7, v10}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 2101
    .line 2102
    .line 2103
    move-result v7

    .line 2104
    invoke-virtual {v2, v7}, Ll/lr2;->Y(I)Ll/lr2;

    .line 2105
    .line 2106
    .line 2107
    move-result-object v2

    .line 2108
    check-cast v2, Ll/p2d0;

    .line 2109
    .line 2110
    iget-object v7, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 2111
    .line 2112
    invoke-static {v7, v10}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 2113
    .line 2114
    .line 2115
    move-result v7

    .line 2116
    invoke-virtual {v2, v7}, Ll/lr2;->j(I)Ll/lr2;

    .line 2117
    .line 2118
    .line 2119
    move-result-object v2

    .line 2120
    invoke-virtual {v0, v2}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 2121
    .line 2122
    .line 2123
    move-result-object v0

    .line 2124
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2125
    .line 2126
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_19
    .catch Ljava/lang/NoSuchMethodError; {:try_start_19 .. :try_end_19} :catch_c
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_19 .. :try_end_19} :catch_d

    .line 2127
    .line 2128
    .line 2129
    goto/16 :goto_8

    .line 2130
    .line 2131
    :catch_c
    :try_start_1a
    invoke-static {v5}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 2132
    .line 2133
    .line 2134
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2135
    .line 2136
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2137
    .line 2138
    .line 2139
    move-result-object v0

    .line 2140
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 2141
    .line 2142
    .line 2143
    move-result-object v0

    .line 2144
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 2145
    .line 2146
    .line 2147
    move-result-object v2

    .line 2148
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 2149
    .line 2150
    .line 2151
    move-result-object v0

    .line 2152
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2153
    .line 2154
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 2155
    .line 2156
    .line 2157
    goto :goto_8

    .line 2158
    :cond_19
    invoke-virtual {v2, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2159
    .line 2160
    .line 2161
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2162
    .line 2163
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 2164
    .line 2165
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 2166
    .line 2167
    .line 2168
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 2169
    .line 2170
    invoke-static {v0, v10}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 2171
    .line 2172
    .line 2173
    move-result v0

    .line 2174
    if-eq v0, v9, :cond_1b

    .line 2175
    .line 2176
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2177
    .line 2178
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2179
    .line 2180
    .line 2181
    move-result-object v2

    .line 2182
    invoke-static {v2}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 2183
    .line 2184
    .line 2185
    move-result-object v2

    .line 2186
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2187
    .line 2188
    .line 2189
    move-result-object v0

    .line 2190
    invoke-virtual {v2, v0}, Ll/m2d0;->s(Ljava/lang/Integer;)Ll/a2d0;

    .line 2191
    .line 2192
    .line 2193
    move-result-object v0

    .line 2194
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2195
    .line 2196
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 2197
    .line 2198
    .line 2199
    goto :goto_8

    .line 2200
    :cond_1a
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->x()Z

    .line 2201
    .line 2202
    .line 2203
    move-result v0

    .line 2204
    if-eqz v0, :cond_1b

    .line 2205
    .line 2206
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 2207
    .line 2208
    const/4 v7, 0x0

    .line 2209
    invoke-virtual {v0, v7}, Landroid/view/View;->setVisibility(I)V

    .line 2210
    .line 2211
    .line 2212
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2213
    .line 2214
    invoke-virtual {v0, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2215
    .line 2216
    .line 2217
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2218
    .line 2219
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 2220
    .line 2221
    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 2222
    .line 2223
    .line 2224
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2225
    .line 2226
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inbox/d;->g()I

    .line 2227
    .line 2228
    .line 2229
    move-result v2

    .line 2230
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 2231
    .line 2232
    .line 2233
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 2234
    .line 2235
    invoke-static {v0, v8}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 2236
    .line 2237
    .line 2238
    move-result v0

    .line 2239
    if-eq v0, v9, :cond_1b

    .line 2240
    .line 2241
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2242
    .line 2243
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2244
    .line 2245
    .line 2246
    move-result-object v2

    .line 2247
    invoke-static {v2}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 2248
    .line 2249
    .line 2250
    move-result-object v2

    .line 2251
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2252
    .line 2253
    .line 2254
    move-result-object v0

    .line 2255
    invoke-virtual {v2, v0}, Ll/m2d0;->s(Ljava/lang/Integer;)Ll/a2d0;

    .line 2256
    .line 2257
    .line 2258
    move-result-object v0

    .line 2259
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2260
    .line 2261
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_1a
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1a .. :try_end_1a} :catch_d

    .line 2262
    .line 2263
    .line 2264
    goto :goto_8

    .line 2265
    :catch_d
    invoke-static/range {v17 .. v17}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 2266
    .line 2267
    .line 2268
    :cond_1b
    :goto_8
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 2269
    .line 2270
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2271
    .line 2272
    .line 2273
    move-result-object v0

    .line 2274
    sget v2, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->k:I

    .line 2275
    .line 2276
    const/4 v7, 0x2

    .line 2277
    if-ne v2, v7, :cond_1c

    .line 2278
    .line 2279
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 2280
    .line 2281
    .line 2282
    move-result-object v2

    .line 2283
    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 2284
    .line 2285
    div-int/2addr v2, v7

    .line 2286
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 2287
    .line 2288
    .line 2289
    move-result-object v0

    .line 2290
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 2291
    .line 2292
    div-int/2addr v0, v7

    .line 2293
    goto :goto_a

    .line 2294
    :cond_1c
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 2295
    .line 2296
    .line 2297
    move-result-object v0

    .line 2298
    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 2299
    .line 2300
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->f()Ljava/lang/String;

    .line 2301
    .line 2302
    .line 2303
    move-result-object v0

    .line 2304
    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 2305
    .line 2306
    .line 2307
    move-result v0

    .line 2308
    const/high16 v3, 0x3f100000    # 0.5625f

    .line 2309
    .line 2310
    if-eqz v0, :cond_1d

    .line 2311
    .line 2312
    int-to-float v0, v2

    .line 2313
    mul-float/2addr v0, v3

    .line 2314
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 2315
    .line 2316
    .line 2317
    move-result v0

    .line 2318
    :goto_9
    move/from16 v20, v2

    .line 2319
    .line 2320
    move v2, v0

    .line 2321
    move/from16 v0, v20

    .line 2322
    .line 2323
    goto :goto_a

    .line 2324
    :cond_1d
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->f()Ljava/lang/String;

    .line 2325
    .line 2326
    .line 2327
    move-result-object v0

    .line 2328
    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 2329
    .line 2330
    .line 2331
    move-result v0

    .line 2332
    if-eqz v0, :cond_1e

    .line 2333
    .line 2334
    move v0, v2

    .line 2335
    goto :goto_a

    .line 2336
    :cond_1e
    int-to-float v0, v2

    .line 2337
    mul-float/2addr v0, v3

    .line 2338
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 2339
    .line 2340
    .line 2341
    move-result v0

    .line 2342
    goto :goto_9

    .line 2343
    :goto_a
    iget-object v3, v1, Lcom/clevertap/android/sdk/inbox/d;->i:Landroid/widget/FrameLayout;

    .line 2344
    .line 2345
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    .line 2346
    .line 2347
    invoke-direct {v4, v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 2348
    .line 2349
    .line 2350
    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2351
    .line 2352
    .line 2353
    move-object/from16 v9, p1

    .line 2354
    .line 2355
    move/from16 v8, p3

    .line 2356
    .line 2357
    invoke-virtual {v1, v9, v8}, Lcom/clevertap/android/sdk/inbox/d;->l(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;I)V

    .line 2358
    .line 2359
    .line 2360
    :try_start_1b
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->c()Ljava/lang/String;

    .line 2361
    .line 2362
    .line 2363
    move-result-object v0

    .line 2364
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 2365
    .line 2366
    .line 2367
    move-result v0
    :try_end_1b
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1b .. :try_end_1b} :catch_f

    .line 2368
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/c;->w:Landroid/widget/ImageView;

    .line 2369
    .line 2370
    if-nez v0, :cond_20

    .line 2371
    .line 2372
    const/4 v7, 0x0

    .line 2373
    :try_start_1c
    invoke-virtual {v2, v7}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2374
    .line 2375
    .line 2376
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->d()Ljava/lang/String;

    .line 2377
    .line 2378
    .line 2379
    move-result-object v0

    .line 2380
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 2381
    .line 2382
    .line 2383
    move-result v0

    .line 2384
    if-nez v0, :cond_1f

    .line 2385
    .line 2386
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->w:Landroid/widget/ImageView;

    .line 2387
    .line 2388
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->d()Ljava/lang/String;

    .line 2389
    .line 2390
    .line 2391
    move-result-object v2

    .line 2392
    invoke-virtual {v0, v2}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V
    :try_end_1c
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1c .. :try_end_1c} :catch_f

    .line 2393
    .line 2394
    .line 2395
    :cond_1f
    :try_start_1d
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->w:Landroid/widget/ImageView;

    .line 2396
    .line 2397
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2398
    .line 2399
    .line 2400
    move-result-object v0

    .line 2401
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 2402
    .line 2403
    .line 2404
    move-result-object v0

    .line 2405
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->c()Ljava/lang/String;

    .line 2406
    .line 2407
    .line 2408
    move-result-object v2

    .line 2409
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 2410
    .line 2411
    .line 2412
    move-result-object v0

    .line 2413
    new-instance v2, Ll/p2d0;

    .line 2414
    .line 2415
    invoke-direct {v2}, Ll/p2d0;-><init>()V

    .line 2416
    .line 2417
    .line 2418
    iget-object v3, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 2419
    .line 2420
    invoke-static {v3, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 2421
    .line 2422
    .line 2423
    move-result v3

    .line 2424
    invoke-virtual {v2, v3}, Ll/lr2;->Y(I)Ll/lr2;

    .line 2425
    .line 2426
    .line 2427
    move-result-object v2

    .line 2428
    check-cast v2, Ll/p2d0;

    .line 2429
    .line 2430
    iget-object v3, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 2431
    .line 2432
    invoke-static {v3, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 2433
    .line 2434
    .line 2435
    move-result v3

    .line 2436
    invoke-virtual {v2, v3}, Ll/lr2;->j(I)Ll/lr2;

    .line 2437
    .line 2438
    .line 2439
    move-result-object v2

    .line 2440
    invoke-virtual {v0, v2}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 2441
    .line 2442
    .line 2443
    move-result-object v0

    .line 2444
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/c;->w:Landroid/widget/ImageView;

    .line 2445
    .line 2446
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_1d
    .catch Ljava/lang/NoSuchMethodError; {:try_start_1d .. :try_end_1d} :catch_e
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1d .. :try_end_1d} :catch_f

    .line 2447
    .line 2448
    .line 2449
    goto :goto_b

    .line 2450
    :catch_e
    :try_start_1e
    invoke-static {v5}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 2451
    .line 2452
    .line 2453
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->w:Landroid/widget/ImageView;

    .line 2454
    .line 2455
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2456
    .line 2457
    .line 2458
    move-result-object v0

    .line 2459
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 2460
    .line 2461
    .line 2462
    move-result-object v0

    .line 2463
    invoke-virtual {v15}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->c()Ljava/lang/String;

    .line 2464
    .line 2465
    .line 2466
    move-result-object v2

    .line 2467
    invoke-virtual {v0, v2}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 2468
    .line 2469
    .line 2470
    move-result-object v0

    .line 2471
    iget-object v2, v1, Lcom/clevertap/android/sdk/inbox/c;->w:Landroid/widget/ImageView;

    .line 2472
    .line 2473
    invoke-virtual {v0, v2}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 2474
    .line 2475
    .line 2476
    goto :goto_b

    .line 2477
    :cond_20
    const/16 v3, 0x8

    .line 2478
    .line 2479
    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setVisibility(I)V
    :try_end_1e
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1e .. :try_end_1e} :catch_f

    .line 2480
    .line 2481
    .line 2482
    goto :goto_b

    .line 2483
    :catch_f
    invoke-static/range {v17 .. v17}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 2484
    .line 2485
    .line 2486
    :goto_b
    if-eqz v12, :cond_21

    .line 2487
    .line 2488
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/c;->r:Landroid/widget/RelativeLayout;

    .line 2489
    .line 2490
    new-instance v7, Lcom/clevertap/android/sdk/inbox/e;

    .line 2491
    .line 2492
    const/4 v13, 0x1

    .line 2493
    const/4 v14, -0x1

    .line 2494
    const/4 v10, 0x0

    .line 2495
    const/4 v11, 0x0

    .line 2496
    invoke-direct/range {v7 .. v14}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 2497
    .line 2498
    .line 2499
    invoke-virtual {v0, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2500
    .line 2501
    .line 2502
    :cond_21
    return-void
.end method
