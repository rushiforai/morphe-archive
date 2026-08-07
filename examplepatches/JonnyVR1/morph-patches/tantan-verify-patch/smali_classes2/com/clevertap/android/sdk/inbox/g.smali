.class Lcom/clevertap/android/sdk/inbox/g;
.super Lcom/clevertap/android/sdk/inbox/d;
.source "SourceFile"


# instance fields
.field private final r:Landroid/widget/Button;

.field private final s:Landroid/widget/Button;

.field private final t:Landroid/widget/Button;

.field private final u:Landroid/widget/TextView;

.field private final v:Landroid/widget/TextView;

.field private final w:Landroid/widget/TextView;


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
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/g;->w:Landroid/widget/TextView;

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
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/g;->u:Landroid/widget/TextView;

    .line 26
    .line 27
    sget v0, Ll/icc0;->P0:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Landroid/widget/TextView;

    .line 34
    .line 35
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/g;->v:Landroid/widget/TextView;

    .line 36
    .line 37
    sget v0, Ll/icc0;->o:I

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Landroid/widget/Button;

    .line 44
    .line 45
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 46
    .line 47
    sget v0, Ll/icc0;->p:I

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/widget/Button;

    .line 54
    .line 55
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/g;->s:Landroid/widget/Button;

    .line 56
    .line 57
    sget v0, Ll/icc0;->q:I

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
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/g;->t:Landroid/widget/Button;

    .line 66
    .line 67
    sget v0, Ll/icc0;->C0:I

    .line 68
    .line 69
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Landroid/widget/ImageView;

    .line 74
    .line 75
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 76
    .line 77
    sget v0, Ll/icc0;->J0:I

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    check-cast v0, Landroid/widget/RelativeLayout;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->j:Landroid/widget/RelativeLayout;

    .line 86
    .line 87
    sget v0, Ll/icc0;->I0:I

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
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->k:Landroid/widget/RelativeLayout;

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
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->b:Landroid/widget/LinearLayout;

    .line 136
    .line 137
    sget v0, Ll/icc0;->b:I

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Landroid/widget/LinearLayout;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->c:Landroid/widget/LinearLayout;

    .line 146
    .line 147
    sget v0, Ll/icc0;->K0:I

    .line 148
    .line 149
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    check-cast v0, Landroid/widget/FrameLayout;

    .line 154
    .line 155
    iput-object v0, p0, Lcom/clevertap/android/sdk/inbox/d;->i:Landroid/widget/FrameLayout;

    .line 156
    .line 157
    sget v0, Ll/icc0;->D0:I

    .line 158
    .line 159
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    check-cast p1, Landroid/widget/RelativeLayout;

    .line 164
    .line 165
    iput-object p1, p0, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 166
    .line 167
    return-void
.end method


# virtual methods
.method public f(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;I)V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const-string v2, "l"

    .line 4
    .line 5
    const-string v3, "p"

    .line 6
    .line 7
    invoke-super/range {p0 .. p3}, Lcom/clevertap/android/sdk/inbox/d;->f(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;I)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inbox/d;->i()Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;

    .line 11
    .line 12
    .line 13
    move-result-object v9

    .line 14
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->d()Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const/4 v12, 0x0

    .line 19
    invoke-virtual {v0, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    move-object v13, v0

    .line 24
    check-cast v13, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;

    .line 25
    .line 26
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/g;->w:Landroid/widget/TextView;

    .line 27
    .line 28
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->s()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/g;->w:Landroid/widget/TextView;

    .line 36
    .line 37
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->t()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/g;->u:Landroid/widget/TextView;

    .line 49
    .line 50
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->p()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/g;->u:Landroid/widget/TextView;

    .line 58
    .line 59
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->q()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v4

    .line 67
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->c:Landroid/widget/LinearLayout;

    .line 71
    .line 72
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->a()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 81
    .line 82
    .line 83
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->c()J

    .line 84
    .line 85
    .line 86
    move-result-wide v4

    .line 87
    invoke-virtual {v1, v4, v5}, Lcom/clevertap/android/sdk/inbox/d;->e(J)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->v:Landroid/widget/TextView;

    .line 92
    .line 93
    invoke-virtual {v4, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/g;->v:Landroid/widget/TextView;

    .line 97
    .line 98
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->t()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 107
    .line 108
    .line 109
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->k()Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->q:Landroid/widget/ImageView;

    .line 114
    .line 115
    const/16 v14, 0x8

    .line 116
    .line 117
    if-eqz v0, :cond_0

    .line 118
    .line 119
    invoke-virtual {v4, v14}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_0
    invoke-virtual {v4, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 124
    .line 125
    .line 126
    :goto_0
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->d:Landroid/widget/FrameLayout;

    .line 127
    .line 128
    invoke-virtual {v0, v14}, Landroid/view/View;->setVisibility(I)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->l()Lorg/json/JSONArray;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->b:Landroid/widget/LinearLayout;

    .line 136
    .line 137
    const/4 v15, 0x2

    .line 138
    if-eqz v0, :cond_4

    .line 139
    .line 140
    invoke-virtual {v4, v12}, Landroid/view/View;->setVisibility(I)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {v0}, Lorg/json/JSONArray;->length()I

    .line 144
    .line 145
    .line 146
    move-result v4

    .line 147
    const/4 v5, 0x1

    .line 148
    if-eq v4, v5, :cond_3

    .line 149
    .line 150
    if-eq v4, v15, :cond_2

    .line 151
    .line 152
    const/4 v6, 0x3

    .line 153
    if-eq v4, v6, :cond_1

    .line 154
    .line 155
    goto/16 :goto_2

    .line 156
    .line 157
    :cond_1
    :try_start_0
    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 158
    .line 159
    .line 160
    move-result-object v8

    .line 161
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 162
    .line 163
    invoke-virtual {v4, v12}, Landroid/view/View;->setVisibility(I)V

    .line 164
    .line 165
    .line 166
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 167
    .line 168
    invoke-virtual {v13, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->i(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v6

    .line 172
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 173
    .line 174
    .line 175
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 176
    .line 177
    invoke-virtual {v13, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->f(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v6

    .line 181
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    move-result v6

    .line 185
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 186
    .line 187
    .line 188
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 189
    .line 190
    invoke-virtual {v13, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->e(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v6

    .line 194
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 195
    .line 196
    .line 197
    move-result v6

    .line 198
    invoke-virtual {v4, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 199
    .line 200
    .line 201
    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 202
    .line 203
    .line 204
    move-result-object v4

    .line 205
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/g;->s:Landroid/widget/Button;

    .line 206
    .line 207
    invoke-virtual {v5, v12}, Landroid/view/View;->setVisibility(I)V

    .line 208
    .line 209
    .line 210
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/g;->s:Landroid/widget/Button;

    .line 211
    .line 212
    invoke-virtual {v13, v4}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->i(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v6

    .line 216
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 217
    .line 218
    .line 219
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/g;->s:Landroid/widget/Button;

    .line 220
    .line 221
    invoke-virtual {v13, v4}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->f(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v6

    .line 225
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 226
    .line 227
    .line 228
    move-result v6

    .line 229
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 230
    .line 231
    .line 232
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/g;->s:Landroid/widget/Button;

    .line 233
    .line 234
    invoke-virtual {v13, v4}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->e(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v6

    .line 238
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 239
    .line 240
    .line 241
    move-result v6

    .line 242
    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {v0, v15}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/g;->t:Landroid/widget/Button;

    .line 250
    .line 251
    invoke-virtual {v5, v12}, Landroid/view/View;->setVisibility(I)V

    .line 252
    .line 253
    .line 254
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/g;->t:Landroid/widget/Button;

    .line 255
    .line 256
    invoke-virtual {v13, v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->i(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v6

    .line 260
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 261
    .line 262
    .line 263
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/g;->t:Landroid/widget/Button;

    .line 264
    .line 265
    invoke-virtual {v13, v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->f(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v6

    .line 269
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 270
    .line 271
    .line 272
    move-result v6

    .line 273
    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 274
    .line 275
    .line 276
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/g;->t:Landroid/widget/Button;

    .line 277
    .line 278
    invoke-virtual {v13, v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->e(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v6

    .line 282
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 283
    .line 284
    .line 285
    move-result v6

    .line 286
    invoke-virtual {v5, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 287
    .line 288
    .line 289
    if-eqz v9, :cond_5

    .line 290
    .line 291
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 292
    .line 293
    move-object v6, v4

    .line 294
    new-instance v4, Lcom/clevertap/android/sdk/inbox/e;

    .line 295
    .line 296
    invoke-virtual {v5}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 297
    .line 298
    .line 299
    move-result-object v7

    .line 300
    invoke-interface {v7}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v7

    .line 304
    const/4 v10, 0x0

    .line 305
    const/4 v11, 0x0

    .line 306
    move-object v15, v5

    .line 307
    move-object/from16 v16, v6

    .line 308
    .line 309
    move-object/from16 v6, p1

    .line 310
    .line 311
    move/from16 v5, p3

    .line 312
    .line 313
    invoke-direct/range {v4 .. v11}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {v15, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 317
    .line 318
    .line 319
    iget-object v15, v1, Lcom/clevertap/android/sdk/inbox/g;->s:Landroid/widget/Button;

    .line 320
    .line 321
    new-instance v4, Lcom/clevertap/android/sdk/inbox/e;

    .line 322
    .line 323
    invoke-virtual {v15}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 324
    .line 325
    .line 326
    move-result-object v5

    .line 327
    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v7

    .line 331
    const/4 v10, 0x0

    .line 332
    const/4 v11, 0x1

    .line 333
    move-object/from16 v6, p1

    .line 334
    .line 335
    move/from16 v5, p3

    .line 336
    .line 337
    move-object/from16 v8, v16

    .line 338
    .line 339
    invoke-direct/range {v4 .. v11}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 340
    .line 341
    .line 342
    invoke-virtual {v15, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 343
    .line 344
    .line 345
    iget-object v15, v1, Lcom/clevertap/android/sdk/inbox/g;->t:Landroid/widget/Button;

    .line 346
    .line 347
    new-instance v4, Lcom/clevertap/android/sdk/inbox/e;

    .line 348
    .line 349
    invoke-virtual {v15}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 350
    .line 351
    .line 352
    move-result-object v5

    .line 353
    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 354
    .line 355
    .line 356
    move-result-object v7

    .line 357
    const/4 v10, 0x0

    .line 358
    const/4 v11, 0x2

    .line 359
    move-object/from16 v6, p1

    .line 360
    .line 361
    move/from16 v5, p3

    .line 362
    .line 363
    move-object v8, v0

    .line 364
    invoke-direct/range {v4 .. v11}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 365
    .line 366
    .line 367
    invoke-virtual {v15, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 368
    .line 369
    .line 370
    goto/16 :goto_2

    .line 371
    .line 372
    :catch_0
    move-exception v0

    .line 373
    goto/16 :goto_1

    .line 374
    .line 375
    :cond_2
    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 376
    .line 377
    .line 378
    move-result-object v8

    .line 379
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 380
    .line 381
    invoke-virtual {v4, v12}, Landroid/view/View;->setVisibility(I)V

    .line 382
    .line 383
    .line 384
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 385
    .line 386
    invoke-virtual {v13, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->i(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v6

    .line 390
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 391
    .line 392
    .line 393
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 394
    .line 395
    invoke-virtual {v13, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->f(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v6

    .line 399
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 400
    .line 401
    .line 402
    move-result v6

    .line 403
    invoke-virtual {v4, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 404
    .line 405
    .line 406
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 407
    .line 408
    invoke-virtual {v13, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->e(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object v6

    .line 412
    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 413
    .line 414
    .line 415
    move-result v6

    .line 416
    invoke-virtual {v4, v6}, Landroid/view/View;->setBackgroundColor(I)V

    .line 417
    .line 418
    .line 419
    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 420
    .line 421
    .line 422
    move-result-object v0

    .line 423
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->s:Landroid/widget/Button;

    .line 424
    .line 425
    invoke-virtual {v4, v12}, Landroid/view/View;->setVisibility(I)V

    .line 426
    .line 427
    .line 428
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->s:Landroid/widget/Button;

    .line 429
    .line 430
    invoke-virtual {v13, v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->i(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 431
    .line 432
    .line 433
    move-result-object v5

    .line 434
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 435
    .line 436
    .line 437
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->s:Landroid/widget/Button;

    .line 438
    .line 439
    invoke-virtual {v13, v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->f(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 440
    .line 441
    .line 442
    move-result-object v5

    .line 443
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 444
    .line 445
    .line 446
    move-result v5

    .line 447
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 448
    .line 449
    .line 450
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->s:Landroid/widget/Button;

    .line 451
    .line 452
    invoke-virtual {v13, v0}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->e(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 453
    .line 454
    .line 455
    move-result-object v5

    .line 456
    invoke-static {v5}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 457
    .line 458
    .line 459
    move-result v5

    .line 460
    invoke-virtual {v4, v5}, Landroid/view/View;->setBackgroundColor(I)V

    .line 461
    .line 462
    .line 463
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 464
    .line 465
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/g;->s:Landroid/widget/Button;

    .line 466
    .line 467
    iget-object v6, v1, Lcom/clevertap/android/sdk/inbox/g;->t:Landroid/widget/Button;

    .line 468
    .line 469
    invoke-virtual {v1, v4, v5, v6}, Lcom/clevertap/android/sdk/inbox/d;->j(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    .line 470
    .line 471
    .line 472
    if-eqz v9, :cond_5

    .line 473
    .line 474
    iget-object v15, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 475
    .line 476
    new-instance v4, Lcom/clevertap/android/sdk/inbox/e;

    .line 477
    .line 478
    invoke-virtual {v15}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 479
    .line 480
    .line 481
    move-result-object v5

    .line 482
    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v7

    .line 486
    const/4 v10, 0x0

    .line 487
    const/4 v11, 0x0

    .line 488
    move-object/from16 v6, p1

    .line 489
    .line 490
    move/from16 v5, p3

    .line 491
    .line 492
    invoke-direct/range {v4 .. v11}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 493
    .line 494
    .line 495
    invoke-virtual {v15, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 496
    .line 497
    .line 498
    iget-object v15, v1, Lcom/clevertap/android/sdk/inbox/g;->s:Landroid/widget/Button;

    .line 499
    .line 500
    new-instance v4, Lcom/clevertap/android/sdk/inbox/e;

    .line 501
    .line 502
    invoke-virtual {v15}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 503
    .line 504
    .line 505
    move-result-object v5

    .line 506
    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 507
    .line 508
    .line 509
    move-result-object v7

    .line 510
    const/4 v10, 0x0

    .line 511
    const/4 v11, 0x1

    .line 512
    move-object/from16 v6, p1

    .line 513
    .line 514
    move/from16 v5, p3

    .line 515
    .line 516
    move-object v8, v0

    .line 517
    invoke-direct/range {v4 .. v11}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 518
    .line 519
    .line 520
    invoke-virtual {v15, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 521
    .line 522
    .line 523
    goto :goto_2

    .line 524
    :cond_3
    invoke-virtual {v0, v12}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 525
    .line 526
    .line 527
    move-result-object v8

    .line 528
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 529
    .line 530
    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 531
    .line 532
    .line 533
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 534
    .line 535
    invoke-virtual {v13, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->i(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 536
    .line 537
    .line 538
    move-result-object v4

    .line 539
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 540
    .line 541
    .line 542
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 543
    .line 544
    invoke-virtual {v13, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->f(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object v4

    .line 548
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 549
    .line 550
    .line 551
    move-result v4

    .line 552
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 553
    .line 554
    .line 555
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 556
    .line 557
    invoke-virtual {v13, v8}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->e(Lorg/json/JSONObject;)Ljava/lang/String;

    .line 558
    .line 559
    .line 560
    move-result-object v4

    .line 561
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 562
    .line 563
    .line 564
    move-result v4

    .line 565
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 566
    .line 567
    .line 568
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 569
    .line 570
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/g;->s:Landroid/widget/Button;

    .line 571
    .line 572
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/g;->t:Landroid/widget/Button;

    .line 573
    .line 574
    invoke-virtual {v1, v0, v4, v5}, Lcom/clevertap/android/sdk/inbox/d;->k(Landroid/widget/Button;Landroid/widget/Button;Landroid/widget/Button;)V

    .line 575
    .line 576
    .line 577
    if-eqz v9, :cond_5

    .line 578
    .line 579
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/g;->r:Landroid/widget/Button;

    .line 580
    .line 581
    new-instance v4, Lcom/clevertap/android/sdk/inbox/e;

    .line 582
    .line 583
    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 584
    .line 585
    .line 586
    move-result-object v5

    .line 587
    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 588
    .line 589
    .line 590
    move-result-object v7

    .line 591
    const/4 v10, 0x0

    .line 592
    const/4 v11, 0x0

    .line 593
    move-object/from16 v6, p1

    .line 594
    .line 595
    move/from16 v5, p3

    .line 596
    .line 597
    invoke-direct/range {v4 .. v11}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 598
    .line 599
    .line 600
    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 601
    .line 602
    .line 603
    goto :goto_2

    .line 604
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    .line 605
    .line 606
    const-string v5, "Error parsing CTA JSON - "

    .line 607
    .line 608
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 609
    .line 610
    .line 611
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 612
    .line 613
    .line 614
    move-result-object v0

    .line 615
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 616
    .line 617
    .line 618
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 619
    .line 620
    .line 621
    move-result-object v0

    .line 622
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 623
    .line 624
    .line 625
    goto :goto_2

    .line 626
    :cond_4
    invoke-virtual {v4, v14}, Landroid/view/View;->setVisibility(I)V

    .line 627
    .line 628
    .line 629
    :cond_5
    :goto_2
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 630
    .line 631
    invoke-virtual {v0, v14}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 632
    .line 633
    .line 634
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 635
    .line 636
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->a()Ljava/lang/String;

    .line 637
    .line 638
    .line 639
    move-result-object v4

    .line 640
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 641
    .line 642
    .line 643
    move-result v4

    .line 644
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 645
    .line 646
    .line 647
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 648
    .line 649
    invoke-virtual {v0, v14}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 650
    .line 651
    .line 652
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 653
    .line 654
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->a()Ljava/lang/String;

    .line 655
    .line 656
    .line 657
    move-result-object v4

    .line 658
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 659
    .line 660
    .line 661
    move-result v4

    .line 662
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 663
    .line 664
    .line 665
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 666
    .line 667
    invoke-virtual {v0, v14}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 668
    .line 669
    .line 670
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 671
    .line 672
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->a()Ljava/lang/String;

    .line 673
    .line 674
    .line 675
    move-result-object v4

    .line 676
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 677
    .line 678
    .line 679
    move-result v4

    .line 680
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 681
    .line 682
    .line 683
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 684
    .line 685
    const/4 v4, 0x0

    .line 686
    invoke-virtual {v0, v4}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 687
    .line 688
    .line 689
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 690
    .line 691
    invoke-virtual {v0, v14}, Landroid/view/View;->setVisibility(I)V

    .line 692
    .line 693
    .line 694
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->i:Landroid/widget/FrameLayout;

    .line 695
    .line 696
    invoke-virtual {v0, v14}, Landroid/view/View;->setVisibility(I)V

    .line 697
    .line 698
    .line 699
    :try_start_1
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->f()Ljava/lang/String;

    .line 700
    .line 701
    .line 702
    move-result-object v0

    .line 703
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 704
    .line 705
    .line 706
    move-result v4
    :try_end_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_1 .. :try_end_1} :catch_a

    .line 707
    const/16 v5, 0x6c

    .line 708
    .line 709
    const-string v6, "ct_audio"

    .line 710
    .line 711
    const/4 v7, -0x1

    .line 712
    const-string v8, "ct_video_1"

    .line 713
    .line 714
    const-string v10, "CleverTap SDK requires Glide v4.9.0 or above. Please refer CleverTap Documentation for more info"

    .line 715
    .line 716
    const-string v11, "ct_image"

    .line 717
    .line 718
    if-eq v4, v5, :cond_e

    .line 719
    .line 720
    const/16 v5, 0x70

    .line 721
    .line 722
    if-eq v4, v5, :cond_6

    .line 723
    .line 724
    goto/16 :goto_5

    .line 725
    .line 726
    :cond_6
    :try_start_2
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 727
    .line 728
    .line 729
    move-result v0

    .line 730
    if-eqz v0, :cond_14

    .line 731
    .line 732
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->o()Ljava/lang/String;

    .line 733
    .line 734
    .line 735
    move-result-object v0

    .line 736
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 737
    .line 738
    .line 739
    move-result v0

    .line 740
    if-nez v0, :cond_7

    .line 741
    .line 742
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 743
    .line 744
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->o()Ljava/lang/String;

    .line 745
    .line 746
    .line 747
    move-result-object v4

    .line 748
    invoke-virtual {v0, v4}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 749
    .line 750
    .line 751
    :cond_7
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->z()Z

    .line 752
    .line 753
    .line 754
    move-result v0

    .line 755
    if-eqz v0, :cond_8

    .line 756
    .line 757
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 758
    .line 759
    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 760
    .line 761
    .line 762
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 763
    .line 764
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 765
    .line 766
    .line 767
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 768
    .line 769
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 770
    .line 771
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_2
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_2 .. :try_end_2} :catch_a

    .line 772
    .line 773
    .line 774
    :try_start_3
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 775
    .line 776
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 777
    .line 778
    .line 779
    move-result-object v0

    .line 780
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 781
    .line 782
    .line 783
    move-result-object v0

    .line 784
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 785
    .line 786
    .line 787
    move-result-object v4

    .line 788
    invoke-virtual {v0, v4}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 789
    .line 790
    .line 791
    move-result-object v0

    .line 792
    new-instance v4, Ll/p2d0;

    .line 793
    .line 794
    invoke-direct {v4}, Ll/p2d0;-><init>()V

    .line 795
    .line 796
    .line 797
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 798
    .line 799
    invoke-static {v5, v11}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 800
    .line 801
    .line 802
    move-result v5

    .line 803
    invoke-virtual {v4, v5}, Ll/lr2;->Y(I)Ll/lr2;

    .line 804
    .line 805
    .line 806
    move-result-object v4

    .line 807
    check-cast v4, Ll/p2d0;

    .line 808
    .line 809
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 810
    .line 811
    invoke-static {v5, v11}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 812
    .line 813
    .line 814
    move-result v5

    .line 815
    invoke-virtual {v4, v5}, Ll/lr2;->j(I)Ll/lr2;

    .line 816
    .line 817
    .line 818
    move-result-object v4

    .line 819
    invoke-virtual {v0, v4}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 820
    .line 821
    .line 822
    move-result-object v0

    .line 823
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 824
    .line 825
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_3
    .catch Ljava/lang/NoSuchMethodError; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_3 .. :try_end_3} :catch_a

    .line 826
    .line 827
    .line 828
    goto/16 :goto_6

    .line 829
    .line 830
    :catch_1
    :try_start_4
    invoke-static {v10}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 831
    .line 832
    .line 833
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 834
    .line 835
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 836
    .line 837
    .line 838
    move-result-object v0

    .line 839
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 840
    .line 841
    .line 842
    move-result-object v0

    .line 843
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 844
    .line 845
    .line 846
    move-result-object v4

    .line 847
    invoke-virtual {v0, v4}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 848
    .line 849
    .line 850
    move-result-object v0

    .line 851
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 852
    .line 853
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 854
    .line 855
    .line 856
    goto/16 :goto_6

    .line 857
    .line 858
    :cond_8
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->y()Z

    .line 859
    .line 860
    .line 861
    move-result v0

    .line 862
    if-eqz v0, :cond_9

    .line 863
    .line 864
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 865
    .line 866
    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 867
    .line 868
    .line 869
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 870
    .line 871
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 872
    .line 873
    .line 874
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 875
    .line 876
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 877
    .line 878
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_4
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_4 .. :try_end_4} :catch_a

    .line 879
    .line 880
    .line 881
    :try_start_5
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 882
    .line 883
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 884
    .line 885
    .line 886
    move-result-object v0

    .line 887
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 888
    .line 889
    .line 890
    move-result-object v0

    .line 891
    invoke-virtual {v0}, Ll/m2d0;->m()Ll/a2d0;

    .line 892
    .line 893
    .line 894
    move-result-object v0

    .line 895
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 896
    .line 897
    .line 898
    move-result-object v4

    .line 899
    invoke-virtual {v0, v4}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 900
    .line 901
    .line 902
    move-result-object v0

    .line 903
    new-instance v4, Ll/p2d0;

    .line 904
    .line 905
    invoke-direct {v4}, Ll/p2d0;-><init>()V

    .line 906
    .line 907
    .line 908
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 909
    .line 910
    invoke-static {v5, v11}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 911
    .line 912
    .line 913
    move-result v5

    .line 914
    invoke-virtual {v4, v5}, Ll/lr2;->Y(I)Ll/lr2;

    .line 915
    .line 916
    .line 917
    move-result-object v4

    .line 918
    check-cast v4, Ll/p2d0;

    .line 919
    .line 920
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 921
    .line 922
    invoke-static {v5, v11}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 923
    .line 924
    .line 925
    move-result v5

    .line 926
    invoke-virtual {v4, v5}, Ll/lr2;->j(I)Ll/lr2;

    .line 927
    .line 928
    .line 929
    move-result-object v4

    .line 930
    invoke-virtual {v0, v4}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 931
    .line 932
    .line 933
    move-result-object v0

    .line 934
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 935
    .line 936
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_5
    .catch Ljava/lang/NoSuchMethodError; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_5 .. :try_end_5} :catch_a

    .line 937
    .line 938
    .line 939
    goto/16 :goto_6

    .line 940
    .line 941
    :catch_2
    :try_start_6
    invoke-static {v10}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 942
    .line 943
    .line 944
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 945
    .line 946
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 947
    .line 948
    .line 949
    move-result-object v0

    .line 950
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 951
    .line 952
    .line 953
    move-result-object v0

    .line 954
    invoke-virtual {v0}, Ll/m2d0;->m()Ll/a2d0;

    .line 955
    .line 956
    .line 957
    move-result-object v0

    .line 958
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 959
    .line 960
    .line 961
    move-result-object v4

    .line 962
    invoke-virtual {v0, v4}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 963
    .line 964
    .line 965
    move-result-object v0

    .line 966
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 967
    .line 968
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 969
    .line 970
    .line 971
    goto/16 :goto_6

    .line 972
    .line 973
    :cond_9
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->B()Z

    .line 974
    .line 975
    .line 976
    move-result v0

    .line 977
    if-eqz v0, :cond_d

    .line 978
    .line 979
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 980
    .line 981
    .line 982
    move-result-object v0

    .line 983
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 984
    .line 985
    .line 986
    move-result v0
    :try_end_6
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_6 .. :try_end_6} :catch_a

    .line 987
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 988
    .line 989
    if-nez v0, :cond_b

    .line 990
    .line 991
    :try_start_7
    invoke-virtual {v4, v12}, Landroid/view/View;->setVisibility(I)V

    .line 992
    .line 993
    .line 994
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 995
    .line 996
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 997
    .line 998
    .line 999
    sget v0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->k:I
    :try_end_7
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_7 .. :try_end_7} :catch_a

    .line 1000
    .line 1001
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1002
    .line 1003
    const/4 v5, 0x2

    .line 1004
    if-ne v0, v5, :cond_a

    .line 1005
    .line 1006
    :try_start_8
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 1007
    .line 1008
    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1009
    .line 1010
    .line 1011
    goto :goto_3

    .line 1012
    :cond_a
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 1013
    .line 1014
    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_8
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_8 .. :try_end_8} :catch_a

    .line 1015
    .line 1016
    .line 1017
    :goto_3
    :try_start_9
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1018
    .line 1019
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1020
    .line 1021
    .line 1022
    move-result-object v0

    .line 1023
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1024
    .line 1025
    .line 1026
    move-result-object v0

    .line 1027
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 1028
    .line 1029
    .line 1030
    move-result-object v4

    .line 1031
    invoke-virtual {v0, v4}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1032
    .line 1033
    .line 1034
    move-result-object v0

    .line 1035
    new-instance v4, Ll/p2d0;

    .line 1036
    .line 1037
    invoke-direct {v4}, Ll/p2d0;-><init>()V

    .line 1038
    .line 1039
    .line 1040
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1041
    .line 1042
    invoke-static {v5, v8}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1043
    .line 1044
    .line 1045
    move-result v5

    .line 1046
    invoke-virtual {v4, v5}, Ll/lr2;->Y(I)Ll/lr2;

    .line 1047
    .line 1048
    .line 1049
    move-result-object v4

    .line 1050
    check-cast v4, Ll/p2d0;

    .line 1051
    .line 1052
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1053
    .line 1054
    invoke-static {v5, v8}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1055
    .line 1056
    .line 1057
    move-result v5

    .line 1058
    invoke-virtual {v4, v5}, Ll/lr2;->j(I)Ll/lr2;

    .line 1059
    .line 1060
    .line 1061
    move-result-object v4

    .line 1062
    invoke-virtual {v0, v4}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 1063
    .line 1064
    .line 1065
    move-result-object v0

    .line 1066
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1067
    .line 1068
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_9
    .catch Ljava/lang/NoSuchMethodError; {:try_start_9 .. :try_end_9} :catch_3
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_9 .. :try_end_9} :catch_a

    .line 1069
    .line 1070
    .line 1071
    goto/16 :goto_6

    .line 1072
    .line 1073
    :catch_3
    :try_start_a
    invoke-static {v10}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 1074
    .line 1075
    .line 1076
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1077
    .line 1078
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1079
    .line 1080
    .line 1081
    move-result-object v0

    .line 1082
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1083
    .line 1084
    .line 1085
    move-result-object v0

    .line 1086
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 1087
    .line 1088
    .line 1089
    move-result-object v4

    .line 1090
    invoke-virtual {v0, v4}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1091
    .line 1092
    .line 1093
    move-result-object v0

    .line 1094
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1095
    .line 1096
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1097
    .line 1098
    .line 1099
    goto/16 :goto_6

    .line 1100
    .line 1101
    :cond_b
    invoke-virtual {v4, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1102
    .line 1103
    .line 1104
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1105
    .line 1106
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1107
    .line 1108
    .line 1109
    sget v0, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->k:I
    :try_end_a
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_a .. :try_end_a} :catch_a

    .line 1110
    .line 1111
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1112
    .line 1113
    const/4 v5, 0x2

    .line 1114
    if-ne v0, v5, :cond_c

    .line 1115
    .line 1116
    :try_start_b
    sget-object v0, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 1117
    .line 1118
    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1119
    .line 1120
    .line 1121
    goto :goto_4

    .line 1122
    :cond_c
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 1123
    .line 1124
    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1125
    .line 1126
    .line 1127
    :goto_4
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1128
    .line 1129
    invoke-static {v0, v8}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1130
    .line 1131
    .line 1132
    move-result v0

    .line 1133
    if-eq v0, v7, :cond_1a

    .line 1134
    .line 1135
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1136
    .line 1137
    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1138
    .line 1139
    .line 1140
    move-result-object v4

    .line 1141
    invoke-static {v4}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1142
    .line 1143
    .line 1144
    move-result-object v4

    .line 1145
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1146
    .line 1147
    .line 1148
    move-result-object v0

    .line 1149
    invoke-virtual {v4, v0}, Ll/m2d0;->s(Ljava/lang/Integer;)Ll/a2d0;

    .line 1150
    .line 1151
    .line 1152
    move-result-object v0

    .line 1153
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1154
    .line 1155
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1156
    .line 1157
    .line 1158
    goto/16 :goto_6

    .line 1159
    .line 1160
    :cond_d
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->x()Z

    .line 1161
    .line 1162
    .line 1163
    move-result v0

    .line 1164
    if-eqz v0, :cond_1a

    .line 1165
    .line 1166
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1167
    .line 1168
    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1169
    .line 1170
    .line 1171
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1172
    .line 1173
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1174
    .line 1175
    .line 1176
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1177
    .line 1178
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 1179
    .line 1180
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1181
    .line 1182
    .line 1183
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1184
    .line 1185
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inbox/d;->g()I

    .line 1186
    .line 1187
    .line 1188
    move-result v4

    .line 1189
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1190
    .line 1191
    .line 1192
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1193
    .line 1194
    invoke-static {v0, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1195
    .line 1196
    .line 1197
    move-result v0

    .line 1198
    if-eq v0, v7, :cond_1a

    .line 1199
    .line 1200
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1201
    .line 1202
    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1203
    .line 1204
    .line 1205
    move-result-object v4

    .line 1206
    invoke-static {v4}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1207
    .line 1208
    .line 1209
    move-result-object v4

    .line 1210
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1211
    .line 1212
    .line 1213
    move-result-object v0

    .line 1214
    invoke-virtual {v4, v0}, Ll/m2d0;->s(Ljava/lang/Integer;)Ll/a2d0;

    .line 1215
    .line 1216
    .line 1217
    move-result-object v0

    .line 1218
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->f:Landroid/widget/ImageView;

    .line 1219
    .line 1220
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1221
    .line 1222
    .line 1223
    goto/16 :goto_6

    .line 1224
    .line 1225
    :cond_e
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 1226
    .line 1227
    .line 1228
    move-result v0

    .line 1229
    if-eqz v0, :cond_14

    .line 1230
    .line 1231
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->o()Ljava/lang/String;

    .line 1232
    .line 1233
    .line 1234
    move-result-object v0

    .line 1235
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1236
    .line 1237
    .line 1238
    move-result v0

    .line 1239
    if-nez v0, :cond_f

    .line 1240
    .line 1241
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1242
    .line 1243
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->o()Ljava/lang/String;

    .line 1244
    .line 1245
    .line 1246
    move-result-object v4

    .line 1247
    invoke-virtual {v0, v4}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1248
    .line 1249
    .line 1250
    :cond_f
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->z()Z

    .line 1251
    .line 1252
    .line 1253
    move-result v0

    .line 1254
    if-eqz v0, :cond_10

    .line 1255
    .line 1256
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1257
    .line 1258
    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1259
    .line 1260
    .line 1261
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1262
    .line 1263
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1264
    .line 1265
    .line 1266
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1267
    .line 1268
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 1269
    .line 1270
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_b
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_b .. :try_end_b} :catch_a

    .line 1271
    .line 1272
    .line 1273
    :try_start_c
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1274
    .line 1275
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1276
    .line 1277
    .line 1278
    move-result-object v0

    .line 1279
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1280
    .line 1281
    .line 1282
    move-result-object v0

    .line 1283
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1284
    .line 1285
    .line 1286
    move-result-object v4

    .line 1287
    invoke-virtual {v0, v4}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1288
    .line 1289
    .line 1290
    move-result-object v0

    .line 1291
    new-instance v4, Ll/p2d0;

    .line 1292
    .line 1293
    invoke-direct {v4}, Ll/p2d0;-><init>()V

    .line 1294
    .line 1295
    .line 1296
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1297
    .line 1298
    invoke-static {v5, v11}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1299
    .line 1300
    .line 1301
    move-result v5

    .line 1302
    invoke-virtual {v4, v5}, Ll/lr2;->Y(I)Ll/lr2;

    .line 1303
    .line 1304
    .line 1305
    move-result-object v4

    .line 1306
    check-cast v4, Ll/p2d0;

    .line 1307
    .line 1308
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1309
    .line 1310
    invoke-static {v5, v11}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1311
    .line 1312
    .line 1313
    move-result v5

    .line 1314
    invoke-virtual {v4, v5}, Ll/lr2;->j(I)Ll/lr2;

    .line 1315
    .line 1316
    .line 1317
    move-result-object v4

    .line 1318
    invoke-virtual {v0, v4}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 1319
    .line 1320
    .line 1321
    move-result-object v0

    .line 1322
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1323
    .line 1324
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_c
    .catch Ljava/lang/NoSuchMethodError; {:try_start_c .. :try_end_c} :catch_4
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_c .. :try_end_c} :catch_a

    .line 1325
    .line 1326
    .line 1327
    goto/16 :goto_6

    .line 1328
    .line 1329
    :catch_4
    :try_start_d
    invoke-static {v10}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 1330
    .line 1331
    .line 1332
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1333
    .line 1334
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1335
    .line 1336
    .line 1337
    move-result-object v0

    .line 1338
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1339
    .line 1340
    .line 1341
    move-result-object v0

    .line 1342
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1343
    .line 1344
    .line 1345
    move-result-object v4

    .line 1346
    invoke-virtual {v0, v4}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1347
    .line 1348
    .line 1349
    move-result-object v0

    .line 1350
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1351
    .line 1352
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1353
    .line 1354
    .line 1355
    goto/16 :goto_6

    .line 1356
    .line 1357
    :cond_10
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->y()Z

    .line 1358
    .line 1359
    .line 1360
    move-result v0

    .line 1361
    if-eqz v0, :cond_11

    .line 1362
    .line 1363
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1364
    .line 1365
    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1366
    .line 1367
    .line 1368
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1369
    .line 1370
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1371
    .line 1372
    .line 1373
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1374
    .line 1375
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 1376
    .line 1377
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_d
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_d .. :try_end_d} :catch_a

    .line 1378
    .line 1379
    .line 1380
    :try_start_e
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1381
    .line 1382
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1383
    .line 1384
    .line 1385
    move-result-object v0

    .line 1386
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1387
    .line 1388
    .line 1389
    move-result-object v0

    .line 1390
    invoke-virtual {v0}, Ll/m2d0;->m()Ll/a2d0;

    .line 1391
    .line 1392
    .line 1393
    move-result-object v0

    .line 1394
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1395
    .line 1396
    .line 1397
    move-result-object v4

    .line 1398
    invoke-virtual {v0, v4}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 1399
    .line 1400
    .line 1401
    move-result-object v0

    .line 1402
    new-instance v4, Ll/p2d0;

    .line 1403
    .line 1404
    invoke-direct {v4}, Ll/p2d0;-><init>()V

    .line 1405
    .line 1406
    .line 1407
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1408
    .line 1409
    invoke-static {v5, v11}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1410
    .line 1411
    .line 1412
    move-result v5

    .line 1413
    invoke-virtual {v4, v5}, Ll/lr2;->Y(I)Ll/lr2;

    .line 1414
    .line 1415
    .line 1416
    move-result-object v4

    .line 1417
    check-cast v4, Ll/p2d0;

    .line 1418
    .line 1419
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1420
    .line 1421
    invoke-static {v5, v11}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1422
    .line 1423
    .line 1424
    move-result v5

    .line 1425
    invoke-virtual {v4, v5}, Ll/lr2;->j(I)Ll/lr2;

    .line 1426
    .line 1427
    .line 1428
    move-result-object v4

    .line 1429
    invoke-virtual {v0, v4}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 1430
    .line 1431
    .line 1432
    move-result-object v0

    .line 1433
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1434
    .line 1435
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_e
    .catch Ljava/lang/NoSuchMethodError; {:try_start_e .. :try_end_e} :catch_5
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_e .. :try_end_e} :catch_a

    .line 1436
    .line 1437
    .line 1438
    goto/16 :goto_6

    .line 1439
    .line 1440
    :catch_5
    :try_start_f
    invoke-static {v10}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 1441
    .line 1442
    .line 1443
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1444
    .line 1445
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1446
    .line 1447
    .line 1448
    move-result-object v0

    .line 1449
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1450
    .line 1451
    .line 1452
    move-result-object v0

    .line 1453
    invoke-virtual {v0}, Ll/m2d0;->m()Ll/a2d0;

    .line 1454
    .line 1455
    .line 1456
    move-result-object v0

    .line 1457
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1458
    .line 1459
    .line 1460
    move-result-object v4

    .line 1461
    invoke-virtual {v0, v4}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 1462
    .line 1463
    .line 1464
    move-result-object v0

    .line 1465
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1466
    .line 1467
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1468
    .line 1469
    .line 1470
    goto/16 :goto_6

    .line 1471
    .line 1472
    :cond_11
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->B()Z

    .line 1473
    .line 1474
    .line 1475
    move-result v0

    .line 1476
    if-eqz v0, :cond_13

    .line 1477
    .line 1478
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 1479
    .line 1480
    .line 1481
    move-result-object v0

    .line 1482
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 1483
    .line 1484
    .line 1485
    move-result v0
    :try_end_f
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_f .. :try_end_f} :catch_a

    .line 1486
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1487
    .line 1488
    if-nez v0, :cond_12

    .line 1489
    .line 1490
    :try_start_10
    invoke-virtual {v4, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1491
    .line 1492
    .line 1493
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1494
    .line 1495
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1496
    .line 1497
    .line 1498
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1499
    .line 1500
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 1501
    .line 1502
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_10
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_10 .. :try_end_10} :catch_a

    .line 1503
    .line 1504
    .line 1505
    :try_start_11
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1506
    .line 1507
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1508
    .line 1509
    .line 1510
    move-result-object v0

    .line 1511
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1512
    .line 1513
    .line 1514
    move-result-object v0

    .line 1515
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 1516
    .line 1517
    .line 1518
    move-result-object v4

    .line 1519
    invoke-virtual {v0, v4}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1520
    .line 1521
    .line 1522
    move-result-object v0

    .line 1523
    new-instance v4, Ll/p2d0;

    .line 1524
    .line 1525
    invoke-direct {v4}, Ll/p2d0;-><init>()V

    .line 1526
    .line 1527
    .line 1528
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1529
    .line 1530
    invoke-static {v5, v8}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1531
    .line 1532
    .line 1533
    move-result v5

    .line 1534
    invoke-virtual {v4, v5}, Ll/lr2;->Y(I)Ll/lr2;

    .line 1535
    .line 1536
    .line 1537
    move-result-object v4

    .line 1538
    check-cast v4, Ll/p2d0;

    .line 1539
    .line 1540
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1541
    .line 1542
    invoke-static {v5, v8}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1543
    .line 1544
    .line 1545
    move-result v5

    .line 1546
    invoke-virtual {v4, v5}, Ll/lr2;->j(I)Ll/lr2;

    .line 1547
    .line 1548
    .line 1549
    move-result-object v4

    .line 1550
    invoke-virtual {v0, v4}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 1551
    .line 1552
    .line 1553
    move-result-object v0

    .line 1554
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1555
    .line 1556
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_11
    .catch Ljava/lang/NoSuchMethodError; {:try_start_11 .. :try_end_11} :catch_6
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_11 .. :try_end_11} :catch_a

    .line 1557
    .line 1558
    .line 1559
    goto/16 :goto_6

    .line 1560
    .line 1561
    :catch_6
    :try_start_12
    invoke-static {v10}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 1562
    .line 1563
    .line 1564
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1565
    .line 1566
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1567
    .line 1568
    .line 1569
    move-result-object v0

    .line 1570
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1571
    .line 1572
    .line 1573
    move-result-object v0

    .line 1574
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 1575
    .line 1576
    .line 1577
    move-result-object v4

    .line 1578
    invoke-virtual {v0, v4}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1579
    .line 1580
    .line 1581
    move-result-object v0

    .line 1582
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1583
    .line 1584
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1585
    .line 1586
    .line 1587
    goto/16 :goto_6

    .line 1588
    .line 1589
    :cond_12
    invoke-virtual {v4, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1590
    .line 1591
    .line 1592
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1593
    .line 1594
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1595
    .line 1596
    .line 1597
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1598
    .line 1599
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 1600
    .line 1601
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1602
    .line 1603
    .line 1604
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1605
    .line 1606
    invoke-static {v0, v8}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1607
    .line 1608
    .line 1609
    move-result v0

    .line 1610
    if-eq v0, v7, :cond_1a

    .line 1611
    .line 1612
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1613
    .line 1614
    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1615
    .line 1616
    .line 1617
    move-result-object v4

    .line 1618
    invoke-static {v4}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1619
    .line 1620
    .line 1621
    move-result-object v4

    .line 1622
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1623
    .line 1624
    .line 1625
    move-result-object v0

    .line 1626
    invoke-virtual {v4, v0}, Ll/m2d0;->s(Ljava/lang/Integer;)Ll/a2d0;

    .line 1627
    .line 1628
    .line 1629
    move-result-object v0

    .line 1630
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1631
    .line 1632
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1633
    .line 1634
    .line 1635
    goto/16 :goto_6

    .line 1636
    .line 1637
    :cond_13
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->x()Z

    .line 1638
    .line 1639
    .line 1640
    move-result v0

    .line 1641
    if-eqz v0, :cond_1a

    .line 1642
    .line 1643
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1644
    .line 1645
    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1646
    .line 1647
    .line 1648
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1649
    .line 1650
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1651
    .line 1652
    .line 1653
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1654
    .line 1655
    sget-object v4, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 1656
    .line 1657
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 1658
    .line 1659
    .line 1660
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1661
    .line 1662
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inbox/d;->g()I

    .line 1663
    .line 1664
    .line 1665
    move-result v4

    .line 1666
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 1667
    .line 1668
    .line 1669
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1670
    .line 1671
    invoke-static {v0, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1672
    .line 1673
    .line 1674
    move-result v0

    .line 1675
    if-eq v0, v7, :cond_1a

    .line 1676
    .line 1677
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1678
    .line 1679
    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1680
    .line 1681
    .line 1682
    move-result-object v4

    .line 1683
    invoke-static {v4}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1684
    .line 1685
    .line 1686
    move-result-object v4

    .line 1687
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 1688
    .line 1689
    .line 1690
    move-result-object v0

    .line 1691
    invoke-virtual {v4, v0}, Ll/m2d0;->s(Ljava/lang/Integer;)Ll/a2d0;

    .line 1692
    .line 1693
    .line 1694
    move-result-object v0

    .line 1695
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->e:Landroid/widget/ImageView;

    .line 1696
    .line 1697
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1698
    .line 1699
    .line 1700
    goto/16 :goto_6

    .line 1701
    .line 1702
    :cond_14
    :goto_5
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1703
    .line 1704
    .line 1705
    move-result-object v0

    .line 1706
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1707
    .line 1708
    .line 1709
    move-result v0

    .line 1710
    if-nez v0, :cond_1a

    .line 1711
    .line 1712
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->o()Ljava/lang/String;

    .line 1713
    .line 1714
    .line 1715
    move-result-object v0

    .line 1716
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1717
    .line 1718
    .line 1719
    move-result v0

    .line 1720
    if-nez v0, :cond_15

    .line 1721
    .line 1722
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1723
    .line 1724
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->o()Ljava/lang/String;

    .line 1725
    .line 1726
    .line 1727
    move-result-object v4

    .line 1728
    invoke-virtual {v0, v4}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 1729
    .line 1730
    .line 1731
    :cond_15
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->z()Z

    .line 1732
    .line 1733
    .line 1734
    move-result v0

    .line 1735
    if-eqz v0, :cond_16

    .line 1736
    .line 1737
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1738
    .line 1739
    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1740
    .line 1741
    .line 1742
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1743
    .line 1744
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1745
    .line 1746
    .line 1747
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1748
    .line 1749
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 1750
    .line 1751
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_12
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_12 .. :try_end_12} :catch_a

    .line 1752
    .line 1753
    .line 1754
    :try_start_13
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1755
    .line 1756
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1757
    .line 1758
    .line 1759
    move-result-object v0

    .line 1760
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1761
    .line 1762
    .line 1763
    move-result-object v0

    .line 1764
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1765
    .line 1766
    .line 1767
    move-result-object v4

    .line 1768
    invoke-virtual {v0, v4}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1769
    .line 1770
    .line 1771
    move-result-object v0

    .line 1772
    new-instance v4, Ll/p2d0;

    .line 1773
    .line 1774
    invoke-direct {v4}, Ll/p2d0;-><init>()V

    .line 1775
    .line 1776
    .line 1777
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1778
    .line 1779
    invoke-static {v5, v11}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1780
    .line 1781
    .line 1782
    move-result v5

    .line 1783
    invoke-virtual {v4, v5}, Ll/lr2;->Y(I)Ll/lr2;

    .line 1784
    .line 1785
    .line 1786
    move-result-object v4

    .line 1787
    check-cast v4, Ll/p2d0;

    .line 1788
    .line 1789
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1790
    .line 1791
    invoke-static {v5, v11}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1792
    .line 1793
    .line 1794
    move-result v5

    .line 1795
    invoke-virtual {v4, v5}, Ll/lr2;->j(I)Ll/lr2;

    .line 1796
    .line 1797
    .line 1798
    move-result-object v4

    .line 1799
    invoke-virtual {v0, v4}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 1800
    .line 1801
    .line 1802
    move-result-object v0

    .line 1803
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1804
    .line 1805
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_13
    .catch Ljava/lang/NoSuchMethodError; {:try_start_13 .. :try_end_13} :catch_7
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_13 .. :try_end_13} :catch_a

    .line 1806
    .line 1807
    .line 1808
    goto/16 :goto_6

    .line 1809
    .line 1810
    :catch_7
    :try_start_14
    invoke-static {v10}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 1811
    .line 1812
    .line 1813
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1814
    .line 1815
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1816
    .line 1817
    .line 1818
    move-result-object v0

    .line 1819
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1820
    .line 1821
    .line 1822
    move-result-object v0

    .line 1823
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1824
    .line 1825
    .line 1826
    move-result-object v4

    .line 1827
    invoke-virtual {v0, v4}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 1828
    .line 1829
    .line 1830
    move-result-object v0

    .line 1831
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1832
    .line 1833
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1834
    .line 1835
    .line 1836
    goto/16 :goto_6

    .line 1837
    .line 1838
    :cond_16
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->y()Z

    .line 1839
    .line 1840
    .line 1841
    move-result v0

    .line 1842
    if-eqz v0, :cond_17

    .line 1843
    .line 1844
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1845
    .line 1846
    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1847
    .line 1848
    .line 1849
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1850
    .line 1851
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1852
    .line 1853
    .line 1854
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1855
    .line 1856
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 1857
    .line 1858
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_14
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_14 .. :try_end_14} :catch_a

    .line 1859
    .line 1860
    .line 1861
    :try_start_15
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1862
    .line 1863
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1864
    .line 1865
    .line 1866
    move-result-object v0

    .line 1867
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1868
    .line 1869
    .line 1870
    move-result-object v0

    .line 1871
    invoke-virtual {v0}, Ll/m2d0;->m()Ll/a2d0;

    .line 1872
    .line 1873
    .line 1874
    move-result-object v0

    .line 1875
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1876
    .line 1877
    .line 1878
    move-result-object v4

    .line 1879
    invoke-virtual {v0, v4}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 1880
    .line 1881
    .line 1882
    move-result-object v0

    .line 1883
    new-instance v4, Ll/p2d0;

    .line 1884
    .line 1885
    invoke-direct {v4}, Ll/p2d0;-><init>()V

    .line 1886
    .line 1887
    .line 1888
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1889
    .line 1890
    invoke-static {v5, v11}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1891
    .line 1892
    .line 1893
    move-result v5

    .line 1894
    invoke-virtual {v4, v5}, Ll/lr2;->Y(I)Ll/lr2;

    .line 1895
    .line 1896
    .line 1897
    move-result-object v4

    .line 1898
    check-cast v4, Ll/p2d0;

    .line 1899
    .line 1900
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 1901
    .line 1902
    invoke-static {v5, v11}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 1903
    .line 1904
    .line 1905
    move-result v5

    .line 1906
    invoke-virtual {v4, v5}, Ll/lr2;->j(I)Ll/lr2;

    .line 1907
    .line 1908
    .line 1909
    move-result-object v4

    .line 1910
    invoke-virtual {v0, v4}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 1911
    .line 1912
    .line 1913
    move-result-object v0

    .line 1914
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1915
    .line 1916
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_15
    .catch Ljava/lang/NoSuchMethodError; {:try_start_15 .. :try_end_15} :catch_8
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_15 .. :try_end_15} :catch_a

    .line 1917
    .line 1918
    .line 1919
    goto/16 :goto_6

    .line 1920
    .line 1921
    :catch_8
    :try_start_16
    invoke-static {v10}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 1922
    .line 1923
    .line 1924
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1925
    .line 1926
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1927
    .line 1928
    .line 1929
    move-result-object v0

    .line 1930
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1931
    .line 1932
    .line 1933
    move-result-object v0

    .line 1934
    invoke-virtual {v0}, Ll/m2d0;->m()Ll/a2d0;

    .line 1935
    .line 1936
    .line 1937
    move-result-object v0

    .line 1938
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->n()Ljava/lang/String;

    .line 1939
    .line 1940
    .line 1941
    move-result-object v4

    .line 1942
    invoke-virtual {v0, v4}, Ll/a2d0;->D0(Ljava/lang/String;)Ll/a2d0;

    .line 1943
    .line 1944
    .line 1945
    move-result-object v0

    .line 1946
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1947
    .line 1948
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 1949
    .line 1950
    .line 1951
    goto/16 :goto_6

    .line 1952
    .line 1953
    :cond_17
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->B()Z

    .line 1954
    .line 1955
    .line 1956
    move-result v0

    .line 1957
    if-eqz v0, :cond_19

    .line 1958
    .line 1959
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 1960
    .line 1961
    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 1962
    .line 1963
    .line 1964
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 1965
    .line 1966
    .line 1967
    move-result-object v0

    .line 1968
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 1969
    .line 1970
    .line 1971
    move-result v0
    :try_end_16
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_16 .. :try_end_16} :catch_a

    .line 1972
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1973
    .line 1974
    if-nez v0, :cond_18

    .line 1975
    .line 1976
    :try_start_17
    invoke-virtual {v4, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 1977
    .line 1978
    .line 1979
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1980
    .line 1981
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 1982
    .line 1983
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V
    :try_end_17
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_17 .. :try_end_17} :catch_a

    .line 1984
    .line 1985
    .line 1986
    :try_start_18
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 1987
    .line 1988
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 1989
    .line 1990
    .line 1991
    move-result-object v0

    .line 1992
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 1993
    .line 1994
    .line 1995
    move-result-object v0

    .line 1996
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 1997
    .line 1998
    .line 1999
    move-result-object v4

    .line 2000
    invoke-virtual {v0, v4}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 2001
    .line 2002
    .line 2003
    move-result-object v0

    .line 2004
    new-instance v4, Ll/p2d0;

    .line 2005
    .line 2006
    invoke-direct {v4}, Ll/p2d0;-><init>()V

    .line 2007
    .line 2008
    .line 2009
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 2010
    .line 2011
    invoke-static {v5, v8}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 2012
    .line 2013
    .line 2014
    move-result v5

    .line 2015
    invoke-virtual {v4, v5}, Ll/lr2;->Y(I)Ll/lr2;

    .line 2016
    .line 2017
    .line 2018
    move-result-object v4

    .line 2019
    check-cast v4, Ll/p2d0;

    .line 2020
    .line 2021
    iget-object v5, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 2022
    .line 2023
    invoke-static {v5, v8}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 2024
    .line 2025
    .line 2026
    move-result v5

    .line 2027
    invoke-virtual {v4, v5}, Ll/lr2;->j(I)Ll/lr2;

    .line 2028
    .line 2029
    .line 2030
    move-result-object v4

    .line 2031
    invoke-virtual {v0, v4}, Ll/a2d0;->n0(Ll/lr2;)Ll/a2d0;

    .line 2032
    .line 2033
    .line 2034
    move-result-object v0

    .line 2035
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2036
    .line 2037
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_18
    .catch Ljava/lang/NoSuchMethodError; {:try_start_18 .. :try_end_18} :catch_9
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_18 .. :try_end_18} :catch_a

    .line 2038
    .line 2039
    .line 2040
    goto/16 :goto_6

    .line 2041
    .line 2042
    :catch_9
    :try_start_19
    invoke-static {v10}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 2043
    .line 2044
    .line 2045
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2046
    .line 2047
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2048
    .line 2049
    .line 2050
    move-result-object v0

    .line 2051
    invoke-static {v0}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 2052
    .line 2053
    .line 2054
    move-result-object v0

    .line 2055
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->r()Ljava/lang/String;

    .line 2056
    .line 2057
    .line 2058
    move-result-object v4

    .line 2059
    invoke-virtual {v0, v4}, Ll/m2d0;->t(Ljava/lang/String;)Ll/a2d0;

    .line 2060
    .line 2061
    .line 2062
    move-result-object v0

    .line 2063
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2064
    .line 2065
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 2066
    .line 2067
    .line 2068
    goto :goto_6

    .line 2069
    :cond_18
    invoke-virtual {v4, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2070
    .line 2071
    .line 2072
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2073
    .line 2074
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 2075
    .line 2076
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 2077
    .line 2078
    .line 2079
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 2080
    .line 2081
    invoke-static {v0, v8}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 2082
    .line 2083
    .line 2084
    move-result v0

    .line 2085
    if-eq v0, v7, :cond_1a

    .line 2086
    .line 2087
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2088
    .line 2089
    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2090
    .line 2091
    .line 2092
    move-result-object v4

    .line 2093
    invoke-static {v4}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 2094
    .line 2095
    .line 2096
    move-result-object v4

    .line 2097
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2098
    .line 2099
    .line 2100
    move-result-object v0

    .line 2101
    invoke-virtual {v4, v0}, Ll/m2d0;->s(Ljava/lang/Integer;)Ll/a2d0;

    .line 2102
    .line 2103
    .line 2104
    move-result-object v0

    .line 2105
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2106
    .line 2107
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;

    .line 2108
    .line 2109
    .line 2110
    goto :goto_6

    .line 2111
    :cond_19
    invoke-virtual {v13}, Lcom/clevertap/android/sdk/inbox/CTInboxMessageContent;->x()Z

    .line 2112
    .line 2113
    .line 2114
    move-result v0

    .line 2115
    if-eqz v0, :cond_1a

    .line 2116
    .line 2117
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->h:Landroid/widget/RelativeLayout;

    .line 2118
    .line 2119
    invoke-virtual {v0, v12}, Landroid/view/View;->setVisibility(I)V

    .line 2120
    .line 2121
    .line 2122
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2123
    .line 2124
    invoke-virtual {v0, v12}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 2125
    .line 2126
    .line 2127
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2128
    .line 2129
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 2130
    .line 2131
    invoke-virtual {v0, v4}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 2132
    .line 2133
    .line 2134
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2135
    .line 2136
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/inbox/d;->g()I

    .line 2137
    .line 2138
    .line 2139
    move-result v4

    .line 2140
    invoke-virtual {v0, v4}, Landroid/view/View;->setBackgroundColor(I)V

    .line 2141
    .line 2142
    .line 2143
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 2144
    .line 2145
    invoke-static {v0, v6}, Lcom/clevertap/android/sdk/Utils;->s(Landroid/content/Context;Ljava/lang/String;)I

    .line 2146
    .line 2147
    .line 2148
    move-result v0

    .line 2149
    if-eq v0, v7, :cond_1a

    .line 2150
    .line 2151
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2152
    .line 2153
    invoke-virtual {v4}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2154
    .line 2155
    .line 2156
    move-result-object v4

    .line 2157
    invoke-static {v4}, Lcom/bumptech/glide/a;->t(Landroid/content/Context;)Ll/m2d0;

    .line 2158
    .line 2159
    .line 2160
    move-result-object v4

    .line 2161
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 2162
    .line 2163
    .line 2164
    move-result-object v0

    .line 2165
    invoke-virtual {v4, v0}, Ll/m2d0;->s(Ljava/lang/Integer;)Ll/a2d0;

    .line 2166
    .line 2167
    .line 2168
    move-result-object v0

    .line 2169
    iget-object v4, v1, Lcom/clevertap/android/sdk/inbox/d;->g:Landroid/widget/ImageView;

    .line 2170
    .line 2171
    invoke-virtual {v0, v4}, Ll/a2d0;->x0(Landroid/widget/ImageView;)Ll/mml0;
    :try_end_19
    .catch Ljava/lang/NoClassDefFoundError; {:try_start_19 .. :try_end_19} :catch_a

    .line 2172
    .line 2173
    .line 2174
    goto :goto_6

    .line 2175
    :catch_a
    const-string v0, "CleverTap SDK requires Glide dependency. Please refer CleverTap Documentation for more info"

    .line 2176
    .line 2177
    invoke-static {v0}, Lcom/clevertap/android/sdk/Logger;->d(Ljava/lang/String;)V

    .line 2178
    .line 2179
    .line 2180
    :cond_1a
    :goto_6
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->a:Landroid/content/Context;

    .line 2181
    .line 2182
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2183
    .line 2184
    .line 2185
    move-result-object v0

    .line 2186
    sget v4, Lcom/clevertap/android/sdk/inbox/CTInboxActivity;->k:I

    .line 2187
    .line 2188
    const/4 v5, 0x2

    .line 2189
    if-ne v4, v5, :cond_1b

    .line 2190
    .line 2191
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 2192
    .line 2193
    .line 2194
    move-result-object v2

    .line 2195
    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 2196
    .line 2197
    div-int/2addr v2, v5

    .line 2198
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 2199
    .line 2200
    .line 2201
    move-result-object v0

    .line 2202
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 2203
    .line 2204
    div-int/2addr v0, v5

    .line 2205
    goto :goto_7

    .line 2206
    :cond_1b
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 2207
    .line 2208
    .line 2209
    move-result-object v0

    .line 2210
    iget v0, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 2211
    .line 2212
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->f()Ljava/lang/String;

    .line 2213
    .line 2214
    .line 2215
    move-result-object v4

    .line 2216
    invoke-virtual {v4, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 2217
    .line 2218
    .line 2219
    move-result v2

    .line 2220
    const/high16 v4, 0x3f100000    # 0.5625f

    .line 2221
    .line 2222
    if-eqz v2, :cond_1c

    .line 2223
    .line 2224
    int-to-float v2, v0

    .line 2225
    mul-float/2addr v2, v4

    .line 2226
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 2227
    .line 2228
    .line 2229
    move-result v2

    .line 2230
    goto :goto_7

    .line 2231
    :cond_1c
    invoke-virtual/range {p1 .. p1}, Lcom/clevertap/android/sdk/inbox/CTInboxMessage;->f()Ljava/lang/String;

    .line 2232
    .line 2233
    .line 2234
    move-result-object v2

    .line 2235
    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 2236
    .line 2237
    .line 2238
    move-result v2

    .line 2239
    if-eqz v2, :cond_1d

    .line 2240
    .line 2241
    move v2, v0

    .line 2242
    goto :goto_7

    .line 2243
    :cond_1d
    int-to-float v2, v0

    .line 2244
    mul-float/2addr v2, v4

    .line 2245
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 2246
    .line 2247
    .line 2248
    move-result v2

    .line 2249
    :goto_7
    iget-object v3, v1, Lcom/clevertap/android/sdk/inbox/d;->i:Landroid/widget/FrameLayout;

    .line 2250
    .line 2251
    new-instance v4, Landroid/widget/RelativeLayout$LayoutParams;

    .line 2252
    .line 2253
    invoke-direct {v4, v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 2254
    .line 2255
    .line 2256
    invoke-virtual {v3, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2257
    .line 2258
    .line 2259
    move-object/from16 v6, p1

    .line 2260
    .line 2261
    move/from16 v5, p3

    .line 2262
    .line 2263
    invoke-virtual {v1, v6, v5}, Lcom/clevertap/android/sdk/inbox/d;->l(Lcom/clevertap/android/sdk/inbox/CTInboxMessage;I)V

    .line 2264
    .line 2265
    .line 2266
    if-eqz v9, :cond_1e

    .line 2267
    .line 2268
    iget-object v0, v1, Lcom/clevertap/android/sdk/inbox/d;->k:Landroid/widget/RelativeLayout;

    .line 2269
    .line 2270
    new-instance v4, Lcom/clevertap/android/sdk/inbox/e;

    .line 2271
    .line 2272
    const/4 v10, 0x1

    .line 2273
    const/4 v11, -0x1

    .line 2274
    const/4 v7, 0x0

    .line 2275
    const/4 v8, 0x0

    .line 2276
    invoke-direct/range {v4 .. v11}, Lcom/clevertap/android/sdk/inbox/e;-><init>(ILcom/clevertap/android/sdk/inbox/CTInboxMessage;Ljava/lang/String;Lorg/json/JSONObject;Lcom/clevertap/android/sdk/inbox/CTInboxListViewFragment;ZI)V

    .line 2277
    .line 2278
    .line 2279
    invoke-virtual {v0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2280
    .line 2281
    .line 2282
    :cond_1e
    return-void
.end method
