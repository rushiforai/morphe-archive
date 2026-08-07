.class public Ll/zch0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/wch0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Landroid/widget/LinearLayout;

.field public b:Lv/VText;

.field public c:Lv/VText;

.field public d:Landroid/widget/RelativeLayout;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lv/VText;

.field public h:Landroid/widget/RelativeLayout;

.field public i:Landroid/widget/LinearLayout;

.field public j:Lv/VEditText;

.field public k:Lv/VText;

.field public l:Landroid/widget/RelativeLayout;

.field public m:Lv/VScroll;

.field public n:Landroid/widget/LinearLayout;

.field public o:Landroid/widget/RelativeLayout;

.field public p:Lv/VButton;

.field public q:Lcom/p1/mobile/putong/core/ui/survey/SurveyAct;

.field public r:Ll/wch0;

.field public s:Ljava/lang/String;

.field public t:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public u:Ljava/lang/String;

.field public v:Ljava/lang/String;

.field public w:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Surveys;",
            ">;"
        }
    .end annotation
.end field

.field public x:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/survey/SurveyAct;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v1, Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Ll/zch0;->t:Ljava/util/List;

    .line 14
    .line 15
    iput-object v0, p0, Ll/zch0;->u:Ljava/lang/String;

    .line 16
    .line 17
    iput-object v0, p0, Ll/zch0;->v:Ljava/lang/String;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Ll/zch0;->w:Ljava/util/List;

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Ll/zch0;->x:I

    .line 24
    .line 25
    iput-object p1, p0, Ll/zch0;->q:Lcom/p1/mobile/putong/core/ui/survey/SurveyAct;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(Ll/zch0;Lv/VText;Ljava/util/List;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/zch0;->l(Lv/VText;Ljava/util/List;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Ll/zch0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/zch0;->k(Landroid/view/View;)V

    return-void
.end method

.method private synthetic k(Landroid/view/View;)V
    .locals 11

    .line 1
    const-string p1, "survey"

    .line 2
    .line 3
    const-string v0, "type"

    .line 4
    .line 5
    const-string v1, "id"

    .line 6
    .line 7
    iget-object v2, p0, Ll/zch0;->p:Lv/VButton;

    .line 8
    .line 9
    invoke-virtual {v2}, Landroid/view/View;->isEnabled()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-object v2, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 17
    .line 18
    const-string v3, "surveys_finish"

    .line 19
    .line 20
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Ll/zch0;->d()Lcom/p1/mobile/putong/core/ui/survey/SurveyAct;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/survey/SurveyAct;->finish()V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_1
    iget-object v2, p0, Ll/zch0;->w:Ljava/util/List;

    .line 35
    .line 36
    invoke-static {v2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    :goto_0
    return-void

    .line 43
    :cond_2
    iget-object v2, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 44
    .line 45
    const-string v3, "selection"

    .line 46
    .line 47
    invoke-static {v2, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    const-string v4, "fill_blank"

    .line 52
    .line 53
    const-string v5, "multi_selection"

    .line 54
    .line 55
    const-string v6, ""

    .line 56
    .line 57
    if-eqz v2, :cond_3

    .line 58
    .line 59
    const-string v2, "single_choice"

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_3
    iget-object v2, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 63
    .line 64
    invoke-static {v2, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-eqz v2, :cond_4

    .line 69
    .line 70
    const-string v2, "multiple_choice"

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_4
    iget-object v2, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result v2

    .line 79
    if-eqz v2, :cond_5

    .line 80
    .line 81
    const-string v2, "question_answer"

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_5
    move-object v2, v6

    .line 85
    :goto_1
    const-string v7, "feedback_question_type"

    .line 86
    .line 87
    invoke-static {v7, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    iget-object v7, p0, Ll/zch0;->w:Ljava/util/List;

    .line 92
    .line 93
    const/4 v8, 0x0

    .line 94
    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v7

    .line 98
    check-cast v7, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 99
    .line 100
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {v7, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v7

    .line 106
    check-cast v7, Lcom/p1/mobile/putong/core/data/Questions;

    .line 107
    .line 108
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/Questions;->index:Ljava/lang/String;

    .line 109
    .line 110
    const-string v9, "feedback_question_num"

    .line 111
    .line 112
    invoke-static {v9, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 113
    .line 114
    .line 115
    move-result-object v7

    .line 116
    filled-new-array {v2, v7}, [Ll/pf60;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    const-string v7, "e_feedback_question_submit_button"

    .line 121
    .line 122
    const-string v9, "p_feedback_question_popup"

    .line 123
    .line 124
    invoke-static {v7, v9, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 125
    .line 126
    .line 127
    invoke-static {}, Ll/pzi0;->o()J

    .line 128
    .line 129
    .line 130
    move-result-wide v9

    .line 131
    invoke-static {v9, v10}, Lcom/p1/mobile/putong/data/Converter;->dateToApiTimeString(J)Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    iput-object v2, p0, Ll/zch0;->v:Ljava/lang/String;

    .line 136
    .line 137
    :try_start_0
    new-instance v2, Lorg/json/JSONObject;

    .line 138
    .line 139
    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 140
    .line 141
    .line 142
    new-instance v7, Lorg/json/JSONObject;

    .line 143
    .line 144
    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 145
    .line 146
    .line 147
    iget-object v9, p0, Ll/zch0;->r:Ll/wch0;

    .line 148
    .line 149
    invoke-virtual {v9}, Ll/wch0;->m0()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v9

    .line 153
    invoke-virtual {v7, v1, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v7, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v2, p1, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 160
    .line 161
    .line 162
    new-instance p1, Lorg/json/JSONObject;

    .line 163
    .line 164
    invoke-direct {p1}, Lorg/json/JSONObject;-><init>()V

    .line 165
    .line 166
    .line 167
    iget-object v7, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 168
    .line 169
    invoke-static {v7, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 170
    .line 171
    .line 172
    move-result v7

    .line 173
    if-nez v7, :cond_7

    .line 174
    .line 175
    iget-object v7, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 176
    .line 177
    invoke-static {v7, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 178
    .line 179
    .line 180
    move-result v5

    .line 181
    if-eqz v5, :cond_6

    .line 182
    .line 183
    goto :goto_2

    .line 184
    :cond_6
    iget-object v3, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 185
    .line 186
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    if-eqz v3, :cond_8

    .line 191
    .line 192
    new-instance v3, Lorg/json/JSONObject;

    .line 193
    .line 194
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 195
    .line 196
    .line 197
    const-string v4, "value"

    .line 198
    .line 199
    iget-object v5, p0, Ll/zch0;->j:Lv/VEditText;

    .line 200
    .line 201
    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    .line 202
    .line 203
    .line 204
    move-result-object v5

    .line 205
    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v5

    .line 209
    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v5

    .line 213
    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 214
    .line 215
    .line 216
    const-string v4, "fillBlank"

    .line 217
    .line 218
    invoke-virtual {p1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 219
    .line 220
    .line 221
    goto :goto_3

    .line 222
    :catch_0
    move-exception p1

    .line 223
    goto :goto_4

    .line 224
    :cond_7
    :goto_2
    new-instance v4, Lorg/json/JSONArray;

    .line 225
    .line 226
    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 227
    .line 228
    .line 229
    invoke-virtual {p0, v4}, Ll/zch0;->s(Lorg/json/JSONArray;)V

    .line 230
    .line 231
    .line 232
    new-instance v5, Lorg/json/JSONObject;

    .line 233
    .line 234
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 235
    .line 236
    .line 237
    const-string v7, "choices"

    .line 238
    .line 239
    invoke-virtual {v5, v7, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 240
    .line 241
    .line 242
    invoke-virtual {p1, v3, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 243
    .line 244
    .line 245
    :cond_8
    :goto_3
    new-instance v3, Lorg/json/JSONObject;

    .line 246
    .line 247
    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 248
    .line 249
    .line 250
    iget-object v4, p0, Ll/zch0;->w:Ljava/util/List;

    .line 251
    .line 252
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v4

    .line 256
    check-cast v4, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 257
    .line 258
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 259
    .line 260
    invoke-interface {v4, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object v4

    .line 264
    check-cast v4, Lcom/p1/mobile/putong/core/data/Questions;

    .line 265
    .line 266
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/Questions;->id:Ljava/lang/String;

    .line 267
    .line 268
    invoke-virtual {v3, v1, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 269
    .line 270
    .line 271
    const-string v4, "survey_question"

    .line 272
    .line 273
    invoke-virtual {v3, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 274
    .line 275
    .line 276
    new-instance v4, Lorg/json/JSONObject;

    .line 277
    .line 278
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 279
    .line 280
    .line 281
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 282
    .line 283
    .line 284
    move-result-object v5

    .line 285
    invoke-interface {v5}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object v5

    .line 289
    invoke-virtual {v4, v1, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 290
    .line 291
    .line 292
    const-string v1, "user"

    .line 293
    .line 294
    invoke-virtual {v4, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 295
    .line 296
    .line 297
    const-string v0, "question"

    .line 298
    .line 299
    invoke-virtual {v2, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 300
    .line 301
    .line 302
    const-string v0, "owner"

    .line 303
    .line 304
    invoke-virtual {v2, v0, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 305
    .line 306
    .line 307
    const-string v0, "solution"

    .line 308
    .line 309
    invoke-virtual {v2, v0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 310
    .line 311
    .line 312
    const-string p1, "startTime"

    .line 313
    .line 314
    iget-object v0, p0, Ll/zch0;->u:Ljava/lang/String;

    .line 315
    .line 316
    invoke-virtual {v2, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 317
    .line 318
    .line 319
    const-string p1, "endTime"

    .line 320
    .line 321
    iget-object v0, p0, Ll/zch0;->v:Ljava/lang/String;

    .line 322
    .line 323
    invoke-virtual {v2, p1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 324
    .line 325
    .line 326
    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 327
    .line 328
    .line 329
    move-result-object v6
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 330
    goto :goto_5

    .line 331
    :goto_4
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 332
    .line 333
    .line 334
    :goto_5
    iget-object p0, p0, Ll/zch0;->r:Ll/wch0;

    .line 335
    .line 336
    invoke-virtual {p0, v6}, Ll/wch0;->x0(Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zch0;->q:Lcom/p1/mobile/putong/core/ui/survey/SurveyAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public bridge synthetic act()Lcom/p1/mobile/android/app/Act;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/zch0;->d()Lcom/p1/mobile/putong/core/ui/survey/SurveyAct;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/adh0;->b(Ll/zch0;Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public d()Lcom/p1/mobile/putong/core/ui/survey/SurveyAct;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zch0;->q:Lcom/p1/mobile/putong/core/ui/survey/SurveyAct;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Ll/wch0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zch0;->r:Ll/wch0;

    .line 2
    .line 3
    return-void
.end method

.method public f()I
    .locals 0

    .line 1
    const/16 p0, 0x32

    .line 2
    .line 3
    return p0
.end method

.method public final i()I
    .locals 2

    .line 1
    iget-object p0, p0, Ll/zch0;->t:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x0

    .line 8
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/view/View;->isSelected()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_0

    .line 25
    .line 26
    add-int/lit8 v0, v0, 0x1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    return v0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wch0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/zch0;->e(Ll/wch0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/zch0;->c(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j(Landroid/view/View;)Z
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Ll/zch0;->t:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Ll/zch0;->t:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Landroid/view/View;

    .line 18
    .line 19
    sget v3, Ll/adc0;->sd:I

    .line 20
    .line 21
    invoke-virtual {p1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    check-cast v3, Lv/VText;

    .line 26
    .line 27
    invoke-virtual {v3}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    sget v4, Ll/adc0;->sd:I

    .line 36
    .line 37
    invoke-virtual {v2, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lv/VText;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroidx/appcompat/widget/AppCompatTextView;->getText()Ljava/lang/CharSequence;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_0

    .line 56
    .line 57
    iget-object p0, p0, Ll/zch0;->w:Ljava/util/List;

    .line 58
    .line 59
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    check-cast p0, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 64
    .line 65
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 66
    .line 67
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    check-cast p0, Lcom/p1/mobile/putong/core/data/Questions;

    .line 72
    .line 73
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Questions;->content:Lcom/p1/mobile/putong/core/data/Content;

    .line 74
    .line 75
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Content;->selection:Lcom/p1/mobile/putong/core/data/Selection;

    .line 76
    .line 77
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Selection;->options:Ljava/util/List;

    .line 78
    .line 79
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, Lcom/p1/mobile/putong/core/data/Options;

    .line 84
    .line 85
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/Options;->exclusive:Z

    .line 86
    .line 87
    return p0

    .line 88
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_1
    return v0
.end method

.method public final synthetic l(Lv/VText;Ljava/util/List;Landroid/view/View;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "selection"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/zch0;->q()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p3, v1}, Landroid/view/View;->setSelected(Z)V

    .line 16
    .line 17
    .line 18
    const-string p2, "#d74d37"

    .line 19
    .line 20
    invoke-static {p2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 25
    .line 26
    .line 27
    sget p1, Ll/adc0;->rd:I

    .line 28
    .line 29
    invoke-virtual {p3, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    sget p2, Ll/dbc0;->xq:I

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    iget-object p1, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 40
    .line 41
    const-string v0, "multi_selection"

    .line 42
    .line 43
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_3

    .line 48
    .line 49
    iget p1, p0, Ll/zch0;->x:I

    .line 50
    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    check-cast v2, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 57
    .line 58
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 59
    .line 60
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Lcom/p1/mobile/putong/core/data/Questions;

    .line 65
    .line 66
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Questions;->content:Lcom/p1/mobile/putong/core/data/Content;

    .line 67
    .line 68
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Content;->selection:Lcom/p1/mobile/putong/core/data/Selection;

    .line 69
    .line 70
    iget v2, v2, Lcom/p1/mobile/putong/core/data/Selection;->maxChoices:I

    .line 71
    .line 72
    if-lt p1, v2, :cond_1

    .line 73
    .line 74
    invoke-virtual {p0, p3}, Ll/zch0;->j(Landroid/view/View;)Z

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    if-nez p1, :cond_1

    .line 79
    .line 80
    iget p1, p0, Ll/zch0;->x:I

    .line 81
    .line 82
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    check-cast p2, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 87
    .line 88
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 89
    .line 90
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p2

    .line 94
    check-cast p2, Lcom/p1/mobile/putong/core/data/Questions;

    .line 95
    .line 96
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Questions;->content:Lcom/p1/mobile/putong/core/data/Content;

    .line 97
    .line 98
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Content;->selection:Lcom/p1/mobile/putong/core/data/Selection;

    .line 99
    .line 100
    iget p2, p2, Lcom/p1/mobile/putong/core/data/Selection;->maxChoices:I

    .line 101
    .line 102
    if-ne p1, p2, :cond_3

    .line 103
    .line 104
    invoke-virtual {p3}, Landroid/view/View;->isSelected()Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_3

    .line 109
    .line 110
    :cond_1
    invoke-virtual {p3}, Landroid/view/View;->isSelected()Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    xor-int/2addr p1, v1

    .line 115
    invoke-virtual {p3, p1}, Landroid/view/View;->setSelected(Z)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, p3}, Ll/zch0;->m(Landroid/view/View;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {p3}, Landroid/view/View;->isSelected()Z

    .line 122
    .line 123
    .line 124
    move-result p1

    .line 125
    if-eqz p1, :cond_2

    .line 126
    .line 127
    invoke-virtual {p0, p3}, Ll/zch0;->j(Landroid/view/View;)Z

    .line 128
    .line 129
    .line 130
    move-result p1

    .line 131
    invoke-virtual {p0, p1}, Ll/zch0;->n(Z)V

    .line 132
    .line 133
    .line 134
    :cond_2
    invoke-virtual {p0}, Ll/zch0;->i()I

    .line 135
    .line 136
    .line 137
    move-result p1

    .line 138
    iput p1, p0, Ll/zch0;->x:I

    .line 139
    .line 140
    :cond_3
    :goto_0
    invoke-virtual {p0}, Ll/zch0;->p()V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public final m(Landroid/view/View;)V
    .locals 1

    .line 1
    sget p0, Ll/adc0;->rd:I

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    sget v0, Ll/dbc0;->xq:I

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    sget v0, Ll/dbc0;->wq:I

    .line 17
    .line 18
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setBackgroundResource(I)V

    .line 19
    .line 20
    .line 21
    sget p0, Ll/adc0;->sd:I

    .line 22
    .line 23
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lv/VText;

    .line 28
    .line 29
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    const-string v0, "#d74d37"

    .line 36
    .line 37
    :goto_1
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    goto :goto_2

    .line 42
    :cond_1
    const-string v0, "#212121"

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :goto_2
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 46
    .line 47
    .line 48
    sget p0, Ll/adc0;->qd:I

    .line 49
    .line 50
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    xor-int/lit8 v0, v0, 0x1

    .line 59
    .line 60
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    sget p0, Ll/adc0;->pd:I

    .line 64
    .line 65
    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    invoke-virtual {p1}, Landroid/view/View;->isSelected()Z

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 74
    .line 75
    .line 76
    return-void
.end method

.method public final n(Z)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/zch0;->w:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 9
    .line 10
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Lcom/p1/mobile/putong/core/data/Questions;

    .line 17
    .line 18
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Questions;->content:Lcom/p1/mobile/putong/core/data/Content;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Content;->selection:Lcom/p1/mobile/putong/core/data/Selection;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Selection;->options:Ljava/util/List;

    .line 23
    .line 24
    move v2, v1

    .line 25
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-ge v2, v3, :cond_1

    .line 30
    .line 31
    invoke-static {p1}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Lcom/p1/mobile/putong/core/data/Options;

    .line 40
    .line 41
    iget-boolean v4, v4, Lcom/p1/mobile/putong/core/data/Options;->exclusive:Z

    .line 42
    .line 43
    invoke-static {v4}, Ljava/lang/Boolean;->toString(Z)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result v3

    .line 51
    if-nez v3, :cond_0

    .line 52
    .line 53
    iget-object v3, p0, Ll/zch0;->t:Ljava/util/List;

    .line 54
    .line 55
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v3

    .line 59
    check-cast v3, Landroid/view/View;

    .line 60
    .line 61
    invoke-virtual {v3, v1}, Landroid/view/View;->setSelected(Z)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0, v3}, Ll/zch0;->m(Landroid/view/View;)V

    .line 65
    .line 66
    .line 67
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    return-void
.end method

.method public final p()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zch0;->t:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/view/View;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->isSelected()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Ll/zch0;->p:Lv/VButton;

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p0, p0, Ll/zch0;->p:Lv/VButton;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-virtual {p0, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final q()V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/zch0;->t:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Landroid/view/View;

    .line 18
    .line 19
    sget v1, Ll/adc0;->rd:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    sget v2, Ll/dbc0;->wq:I

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 28
    .line 29
    .line 30
    sget v1, Ll/adc0;->sd:I

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lv/VText;

    .line 37
    .line 38
    const-string v2, "#212121"

    .line 39
    .line 40
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 45
    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {v0, v1}, Landroid/view/View;->setSelected(Z)V

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    return-void
.end method

.method public r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zch0;->c:Lv/VText;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/zch0;->p:Lv/VButton;

    .line 12
    .line 13
    new-instance v1, Ll/ych0;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/ych0;-><init>(Ll/zch0;)V

    .line 16
    .line 17
    .line 18
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final s(Lorg/json/JSONArray;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/zch0;->w:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    move v1, v0

    .line 12
    :goto_0
    iget-object v2, p0, Ll/zch0;->t:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-ge v1, v2, :cond_2

    .line 19
    .line 20
    iget-object v2, p0, Ll/zch0;->t:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    check-cast v2, Landroid/view/View;

    .line 27
    .line 28
    invoke-virtual {v2}, Landroid/view/View;->isSelected()Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    iget-object v2, p0, Ll/zch0;->w:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 41
    .line 42
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Lcom/p1/mobile/putong/core/data/Questions;

    .line 49
    .line 50
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Questions;->content:Lcom/p1/mobile/putong/core/data/Content;

    .line 51
    .line 52
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Content;->selection:Lcom/p1/mobile/putong/core/data/Selection;

    .line 53
    .line 54
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Selection;->options:Ljava/util/List;

    .line 55
    .line 56
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Lcom/p1/mobile/putong/core/data/Options;

    .line 61
    .line 62
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Options;->id:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 65
    .line 66
    .line 67
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    :goto_1
    return-void
.end method

.method public u()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/zch0;->m:Lv/VScroll;

    .line 2
    .line 3
    invoke-static {}, Ll/bnl0;->y0()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    neg-int v1, v1

    .line 8
    int-to-float v1, v1

    .line 9
    const/4 v2, 0x2

    .line 10
    new-array v3, v2, [F

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    const/4 v5, 0x0

    .line 14
    aput v5, v3, v4

    .line 15
    .line 16
    const/4 v6, 0x1

    .line 17
    aput v1, v3, v6

    .line 18
    .line 19
    const-string v1, "translationX"

    .line 20
    .line 21
    invoke-static {v0, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object p0, p0, Ll/zch0;->m:Lv/VScroll;

    .line 26
    .line 27
    invoke-static {}, Ll/bnl0;->y0()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    int-to-float v3, v3

    .line 32
    new-array v7, v2, [F

    .line 33
    .line 34
    aput v3, v7, v4

    .line 35
    .line 36
    aput v5, v7, v6

    .line 37
    .line 38
    invoke-static {p0, v1, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 43
    .line 44
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 45
    .line 46
    .line 47
    const-wide/16 v7, 0x64

    .line 48
    .line 49
    invoke-virtual {v1, v7, v8}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 50
    .line 51
    .line 52
    new-array v2, v2, [Landroid/animation/Animator;

    .line 53
    .line 54
    aput-object v0, v2, v4

    .line 55
    .line 56
    aput-object p0, v2, v6

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public v(Ljava/util/List;)V
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/Surveys;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/zch0;->w:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput v0, p0, Ll/zch0;->x:I

    .line 5
    .line 6
    invoke-static {}, Ll/pzi0;->o()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/Converter;->dateToApiTimeString(J)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iput-object v1, p0, Ll/zch0;->u:Ljava/lang/String;

    .line 15
    .line 16
    iget-object v1, p0, Ll/zch0;->n:Landroid/widget/LinearLayout;

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Ll/zch0;->t:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Ll/zch0;->h:Landroid/widget/RelativeLayout;

    .line 27
    .line 28
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/zch0;->l:Landroid/widget/RelativeLayout;

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Ll/zch0;->d:Landroid/widget/RelativeLayout;

    .line 37
    .line 38
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/zch0;->p:Lv/VButton;

    .line 42
    .line 43
    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 44
    .line 45
    .line 46
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    const/4 v2, 0x1

    .line 51
    if-nez v1, :cond_7

    .line 52
    .line 53
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 58
    .line 59
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 60
    .line 61
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_0

    .line 66
    .line 67
    goto/16 :goto_2

    .line 68
    .line 69
    :cond_0
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v1

    .line 73
    check-cast v1, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 74
    .line 75
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 76
    .line 77
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, Lcom/p1/mobile/putong/core/data/Questions;

    .line 82
    .line 83
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Questions;->type:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v1, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 86
    .line 87
    const-string v3, "fill_blank"

    .line 88
    .line 89
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-eqz v1, :cond_2

    .line 94
    .line 95
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    check-cast v1, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 100
    .line 101
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    check-cast v1, Lcom/p1/mobile/putong/core/data/Questions;

    .line 108
    .line 109
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Questions;->content:Lcom/p1/mobile/putong/core/data/Content;

    .line 110
    .line 111
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Content;->fillBlank:Lcom/p1/mobile/putong/core/data/FillBlank;

    .line 112
    .line 113
    iget-boolean v1, v1, Lcom/p1/mobile/putong/core/data/FillBlank;->required:Z

    .line 114
    .line 115
    if-nez v1, :cond_1

    .line 116
    .line 117
    iget-object v1, p0, Ll/zch0;->p:Lv/VButton;

    .line 118
    .line 119
    invoke-virtual {v1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 120
    .line 121
    .line 122
    :cond_1
    iget-object v1, p0, Ll/zch0;->h:Landroid/widget/RelativeLayout;

    .line 123
    .line 124
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 125
    .line 126
    .line 127
    iget-object v1, p0, Ll/zch0;->b:Lv/VText;

    .line 128
    .line 129
    new-instance v2, Ljava/lang/StringBuilder;

    .line 130
    .line 131
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 132
    .line 133
    .line 134
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v3

    .line 138
    check-cast v3, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 139
    .line 140
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 141
    .line 142
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    check-cast v3, Lcom/p1/mobile/putong/core/data/Questions;

    .line 147
    .line 148
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Questions;->index:Ljava/lang/String;

    .line 149
    .line 150
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    const-string v3, " \u586b\u7a7a"

    .line 154
    .line 155
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    .line 164
    .line 165
    iget-object v1, p0, Ll/zch0;->c:Lv/VText;

    .line 166
    .line 167
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    check-cast v2, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 172
    .line 173
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 174
    .line 175
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    check-cast v0, Lcom/p1/mobile/putong/core/data/Questions;

    .line 180
    .line 181
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/Questions;->title:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Ll/zch0;->j:Lv/VEditText;

    .line 187
    .line 188
    new-instance v1, Ll/zch0$a;

    .line 189
    .line 190
    invoke-direct {v1, p0, p1}, Ll/zch0$a;-><init>(Ll/zch0;Ljava/util/List;)V

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 194
    .line 195
    .line 196
    return-void

    .line 197
    :cond_2
    iget-object v1, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 198
    .line 199
    const-string v3, "selection"

    .line 200
    .line 201
    invoke-static {v1, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    const-string v4, "multi_selection"

    .line 206
    .line 207
    if-nez v1, :cond_3

    .line 208
    .line 209
    iget-object v1, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 210
    .line 211
    invoke-static {v1, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    if-eqz v1, :cond_6

    .line 216
    .line 217
    :cond_3
    iget-object v1, p0, Ll/zch0;->b:Lv/VText;

    .line 218
    .line 219
    new-instance v5, Ljava/lang/StringBuilder;

    .line 220
    .line 221
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 222
    .line 223
    .line 224
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v6

    .line 228
    check-cast v6, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 229
    .line 230
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 231
    .line 232
    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v6

    .line 236
    check-cast v6, Lcom/p1/mobile/putong/core/data/Questions;

    .line 237
    .line 238
    iget-object v6, v6, Lcom/p1/mobile/putong/core/data/Questions;->index:Ljava/lang/String;

    .line 239
    .line 240
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    const-string v6, " "

    .line 244
    .line 245
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    iget-object v6, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 249
    .line 250
    invoke-static {v6, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 251
    .line 252
    .line 253
    move-result v3

    .line 254
    if-eqz v3, :cond_4

    .line 255
    .line 256
    const-string v3, "\u5355\u9009"

    .line 257
    .line 258
    goto :goto_0

    .line 259
    :cond_4
    const-string v3, "\u591a\u9009"

    .line 260
    .line 261
    :goto_0
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 262
    .line 263
    .line 264
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v3

    .line 268
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 269
    .line 270
    .line 271
    iget-object v1, p0, Ll/zch0;->c:Lv/VText;

    .line 272
    .line 273
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object v3

    .line 277
    check-cast v3, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 278
    .line 279
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 280
    .line 281
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object v3

    .line 285
    check-cast v3, Lcom/p1/mobile/putong/core/data/Questions;

    .line 286
    .line 287
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Questions;->title:Ljava/lang/String;

    .line 288
    .line 289
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 290
    .line 291
    .line 292
    iget-object v1, p0, Ll/zch0;->l:Landroid/widget/RelativeLayout;

    .line 293
    .line 294
    invoke-static {v1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 295
    .line 296
    .line 297
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object v1

    .line 301
    check-cast v1, Lcom/p1/mobile/putong/core/data/Surveys;

    .line 302
    .line 303
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Surveys;->questions:Ljava/util/List;

    .line 304
    .line 305
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    check-cast v1, Lcom/p1/mobile/putong/core/data/Questions;

    .line 310
    .line 311
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Questions;->content:Lcom/p1/mobile/putong/core/data/Content;

    .line 312
    .line 313
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Content;->selection:Lcom/p1/mobile/putong/core/data/Selection;

    .line 314
    .line 315
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/Selection;->options:Ljava/util/List;

    .line 316
    .line 317
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 322
    .line 323
    .line 324
    move-result v3

    .line 325
    if-eqz v3, :cond_6

    .line 326
    .line 327
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object v3

    .line 331
    check-cast v3, Lcom/p1/mobile/putong/core/data/Options;

    .line 332
    .line 333
    invoke-virtual {p0}, Ll/zch0;->d()Lcom/p1/mobile/putong/core/ui/survey/SurveyAct;

    .line 334
    .line 335
    .line 336
    move-result-object v5

    .line 337
    invoke-static {v5}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 338
    .line 339
    .line 340
    move-result-object v5

    .line 341
    sget v6, Ll/kec0;->vc:I

    .line 342
    .line 343
    const/4 v7, 0x0

    .line 344
    invoke-virtual {v5, v6, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 345
    .line 346
    .line 347
    move-result-object v5

    .line 348
    sget v6, Ll/adc0;->sd:I

    .line 349
    .line 350
    invoke-virtual {v5, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 351
    .line 352
    .line 353
    move-result-object v6

    .line 354
    check-cast v6, Lv/VText;

    .line 355
    .line 356
    sget v7, Ll/adc0;->qd:I

    .line 357
    .line 358
    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 359
    .line 360
    .line 361
    move-result-object v7

    .line 362
    check-cast v7, Lv/VImage;

    .line 363
    .line 364
    sget v8, Ll/adc0;->pd:I

    .line 365
    .line 366
    invoke-virtual {v5, v8}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 367
    .line 368
    .line 369
    move-result-object v8

    .line 370
    check-cast v8, Lv/VImage;

    .line 371
    .line 372
    sget v9, Ll/adc0;->rd:I

    .line 373
    .line 374
    invoke-virtual {v5, v9}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 375
    .line 376
    .line 377
    move-result-object v9

    .line 378
    const/high16 v10, 0x42780000    # 62.0f

    .line 379
    .line 380
    invoke-static {v10}, Ll/qa00;->d(F)I

    .line 381
    .line 382
    .line 383
    move-result v10

    .line 384
    invoke-virtual {v9, v10}, Landroid/view/View;->setMinimumHeight(I)V

    .line 385
    .line 386
    .line 387
    iget-object v9, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 388
    .line 389
    invoke-static {v9, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 390
    .line 391
    .line 392
    move-result v9

    .line 393
    if-eqz v9, :cond_5

    .line 394
    .line 395
    invoke-static {v7, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 396
    .line 397
    .line 398
    invoke-static {v8, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 399
    .line 400
    .line 401
    :cond_5
    invoke-virtual {v6}, Landroid/widget/TextView;->getPaint()Landroid/text/TextPaint;

    .line 402
    .line 403
    .line 404
    move-result-object v7

    .line 405
    invoke-virtual {v7, v2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 406
    .line 407
    .line 408
    iget-object v3, v3, Lcom/p1/mobile/putong/core/data/Options;->text:Ljava/lang/String;

    .line 409
    .line 410
    invoke-virtual {v6, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 411
    .line 412
    .line 413
    iget-object v3, p0, Ll/zch0;->t:Ljava/util/List;

    .line 414
    .line 415
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 416
    .line 417
    .line 418
    new-instance v3, Ll/xch0;

    .line 419
    .line 420
    invoke-direct {v3, p0, v6, p1}, Ll/xch0;-><init>(Ll/zch0;Lv/VText;Ljava/util/List;)V

    .line 421
    .line 422
    .line 423
    invoke-virtual {v5, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 424
    .line 425
    .line 426
    iget-object v3, p0, Ll/zch0;->n:Landroid/widget/LinearLayout;

    .line 427
    .line 428
    invoke-virtual {v3, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 429
    .line 430
    .line 431
    goto :goto_1

    .line 432
    :cond_6
    return-void

    .line 433
    :cond_7
    :goto_2
    const-string p1, "surveys_finish"

    .line 434
    .line 435
    iput-object p1, p0, Ll/zch0;->s:Ljava/lang/String;

    .line 436
    .line 437
    iget-object p1, p0, Ll/zch0;->c:Lv/VText;

    .line 438
    .line 439
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 440
    .line 441
    .line 442
    iget-object p1, p0, Ll/zch0;->b:Lv/VText;

    .line 443
    .line 444
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 445
    .line 446
    .line 447
    iget-object p1, p0, Ll/zch0;->d:Landroid/widget/RelativeLayout;

    .line 448
    .line 449
    invoke-static {p1, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 450
    .line 451
    .line 452
    iget-object p1, p0, Ll/zch0;->p:Lv/VButton;

    .line 453
    .line 454
    invoke-virtual {p1, v2}, Landroid/view/View;->setEnabled(Z)V

    .line 455
    .line 456
    .line 457
    iget-object p0, p0, Ll/zch0;->p:Lv/VButton;

    .line 458
    .line 459
    const-string p1, "\u5b8c\u6210"

    .line 460
    .line 461
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 462
    .line 463
    .line 464
    return-void
.end method
