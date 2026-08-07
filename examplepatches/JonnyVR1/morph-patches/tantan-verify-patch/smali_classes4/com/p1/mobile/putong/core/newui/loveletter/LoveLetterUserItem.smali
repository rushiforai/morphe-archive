.class public Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/core/ui/VText_Bold;

.field public d:Landroid/view/View;

.field public e:Landroid/widget/FrameLayout;

.field public f:Lv/VLinear;

.field public g:Lv/VText;

.field public h:Lv/VText;

.field public i:Lv/VText;

.field public j:Lcom/p1/mobile/putong/data/User;

.field public k:Lcom/p1/mobile/putong/core/data/Conversation;

.field public l:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;Ll/few;Ljava/lang/String;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->f(Ll/few;Ljava/lang/String;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;Ll/y20;Ll/few;Ljava/lang/String;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->e(Ll/y20;Ll/few;Ljava/lang/String;Ll/pf60;)V

    return-void
.end method

.method private getRootHeight()I
    .locals 4

    .line 1
    invoke-static {}, Ll/qa00;->c()Landroid/util/DisplayMetrics;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 6
    .line 7
    sget v0, Ll/qa00;->q:I

    .line 8
    .line 9
    sub-int/2addr p0, v0

    .line 10
    div-int/lit8 p0, p0, 0x2

    .line 11
    .line 12
    int-to-double v0, p0

    .line 13
    const-wide v2, 0x3ff553f7ced91687L    # 1.333

    .line 14
    .line 15
    .line 16
    .line 17
    .line 18
    mul-double/2addr v0, v2

    .line 19
    double-to-int p0, v0

    .line 20
    return p0
.end method


# virtual methods
.method public final d(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/qew;->a(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic e(Ll/y20;Ll/few;Ljava/lang/String;Ll/pf60;)V
    .locals 6

    .line 1
    iget-object v0, p4, Ll/pf60;->a:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    iget-object p4, p4, Ll/pf60;->b:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast p4, Lcom/p1/mobile/putong/core/data/Conversation;

    .line 10
    .line 11
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isBanedOrInactivated()Z

    .line 14
    .line 15
    .line 16
    move-result p4

    .line 17
    if-nez p4, :cond_c

    .line 18
    .line 19
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 20
    .line 21
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 22
    .line 23
    const-string v0, "dismissed"

    .line 24
    .line 25
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result p4

    .line 29
    if-nez p4, :cond_c

    .line 30
    .line 31
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 32
    .line 33
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 34
    .line 35
    const-string v0, "blocked"

    .line 36
    .line 37
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result p4

    .line 41
    if-nez p4, :cond_c

    .line 42
    .line 43
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 44
    .line 45
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 46
    .line 47
    const-string v0, "deleted"

    .line 48
    .line 49
    invoke-static {p4, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    move-result p4

    .line 53
    if-eqz p4, :cond_0

    .line 54
    .line 55
    goto/16 :goto_7

    .line 56
    .line 57
    :cond_0
    sget-object p1, Ll/uqb0;->G:Ll/fsb0;

    .line 58
    .line 59
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->b:Lv/VDraweeView;

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const/16 v1, 0x1e0

    .line 68
    .line 69
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Picture;->maxWidth(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const/4 v1, 0x0

    .line 78
    invoke-virtual {p1, p4, v0, v1}, Ll/fsb0;->N0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;Z)V

    .line 79
    .line 80
    .line 81
    const-string p1, ""

    .line 82
    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->l:Ljava/lang/String;

    .line 84
    .line 85
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 86
    .line 87
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->isIdAndPicBothVerified()Z

    .line 88
    .line 89
    .line 90
    move-result p4

    .line 91
    const/4 v0, 0x1

    .line 92
    if-eqz p4, :cond_1

    .line 93
    .line 94
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->d:Landroid/view/View;

    .line 95
    .line 96
    invoke-static {p4, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 97
    .line 98
    .line 99
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->d:Landroid/view/View;

    .line 100
    .line 101
    sget v2, Ll/dbc0;->dj:I

    .line 102
    .line 103
    invoke-virtual {p4, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 104
    .line 105
    .line 106
    sget p4, Ll/qa00;->O:I

    .line 107
    .line 108
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->d:Landroid/view/View;

    .line 109
    .line 110
    filled-new-array {v2}, [Landroid/view/View;

    .line 111
    .line 112
    .line 113
    move-result-object v2

    .line 114
    invoke-static {p4, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 115
    .line 116
    .line 117
    const-string p4, "\u5b9e\u540d\u00b7\u5934\u50cf\u672c\u4eba"

    .line 118
    .line 119
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->l:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_1
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 123
    .line 124
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 125
    .line 126
    .line 127
    move-result p4

    .line 128
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->d:Landroid/view/View;

    .line 129
    .line 130
    if-eqz p4, :cond_2

    .line 131
    .line 132
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 133
    .line 134
    .line 135
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->d:Landroid/view/View;

    .line 136
    .line 137
    sget v2, Ll/dbc0;->cj:I

    .line 138
    .line 139
    invoke-virtual {p4, v2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 140
    .line 141
    .line 142
    const/high16 p4, 0x42860000    # 67.0f

    .line 143
    .line 144
    invoke-static {p4}, Ll/qa00;->d(F)I

    .line 145
    .line 146
    .line 147
    move-result p4

    .line 148
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->d:Landroid/view/View;

    .line 149
    .line 150
    filled-new-array {v2}, [Landroid/view/View;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-static {p4, v2}, Ll/bnl0;->D0(I[Landroid/view/View;)V

    .line 155
    .line 156
    .line 157
    const-string p4, "\u5934\u50cf\u672c\u4eba"

    .line 158
    .line 159
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->l:Ljava/lang/String;

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_2
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 163
    .line 164
    .line 165
    :goto_0
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 166
    .line 167
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 168
    .line 169
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 170
    .line 171
    if-eqz p4, :cond_4

    .line 172
    .line 173
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->suggestTags:Ljava/util/List;

    .line 174
    .line 175
    invoke-static {p4}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 176
    .line 177
    .line 178
    move-result p4

    .line 179
    if-nez p4, :cond_4

    .line 180
    .line 181
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 182
    .line 183
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 184
    .line 185
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 186
    .line 187
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->suggestTags:Ljava/util/List;

    .line 188
    .line 189
    invoke-interface {p4, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object p4

    .line 193
    check-cast p4, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetterTag;

    .line 194
    .line 195
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->c:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 196
    .line 197
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 198
    .line 199
    .line 200
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->c:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 201
    .line 202
    iget-object v3, p4, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetterTag;->tag:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 205
    .line 206
    .line 207
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->l:Ljava/lang/String;

    .line 208
    .line 209
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 210
    .line 211
    .line 212
    move-result v2

    .line 213
    iget-object p4, p4, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetterTag;->tag:Ljava/lang/String;

    .line 214
    .line 215
    if-eqz v2, :cond_3

    .line 216
    .line 217
    goto :goto_1

    .line 218
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    .line 219
    .line 220
    const-string v3, ","

    .line 221
    .line 222
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p4

    .line 232
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .line 236
    .line 237
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->l:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p4

    .line 249
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->l:Ljava/lang/String;

    .line 250
    .line 251
    goto :goto_2

    .line 252
    :cond_4
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->c:Lcom/p1/mobile/putong/core/ui/VText_Bold;

    .line 253
    .line 254
    invoke-static {p4, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 255
    .line 256
    .line 257
    :goto_2
    sget-object p4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 258
    .line 259
    iget-object p4, p4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 260
    .line 261
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 262
    .line 263
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 264
    .line 265
    invoke-virtual {p4, v2}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p4

    .line 269
    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 270
    .line 271
    .line 272
    move-result v2

    .line 273
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->g:Lv/VText;

    .line 274
    .line 275
    if-nez v2, :cond_5

    .line 276
    .line 277
    invoke-virtual {v3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 278
    .line 279
    .line 280
    goto :goto_3

    .line 281
    :cond_5
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 282
    .line 283
    iget-object p4, p4, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 284
    .line 285
    invoke-virtual {v3, p4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 286
    .line 287
    .line 288
    :goto_3
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->h:Lv/VText;

    .line 289
    .line 290
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 291
    .line 292
    iget-object v2, v2, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 293
    .line 294
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    invoke-virtual {p4, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 299
    .line 300
    .line 301
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->h:Lv/VText;

    .line 302
    .line 303
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 304
    .line 305
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 306
    .line 307
    .line 308
    move-result v2

    .line 309
    xor-int/2addr v2, v0

    .line 310
    invoke-static {p4, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 311
    .line 312
    .line 313
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 314
    .line 315
    invoke-virtual {p4}, Lcom/p1/mobile/putong/data/User;->isHideLocationFromSVip()Z

    .line 316
    .line 317
    .line 318
    move-result p4

    .line 319
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 320
    .line 321
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isHideActiveFromSVip()Z

    .line 322
    .line 323
    .line 324
    move-result v2

    .line 325
    if-eqz p4, :cond_6

    .line 326
    .line 327
    if-eqz v2, :cond_6

    .line 328
    .line 329
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->i:Lv/VText;

    .line 330
    .line 331
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 332
    .line 333
    .line 334
    goto :goto_5

    .line 335
    :cond_6
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->i:Lv/VText;

    .line 336
    .line 337
    invoke-static {v3, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 338
    .line 339
    .line 340
    const/4 v3, 0x0

    .line 341
    if-nez v2, :cond_7

    .line 342
    .line 343
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 344
    .line 345
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 346
    .line 347
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 348
    .line 349
    const/4 v5, 0x5

    .line 350
    invoke-virtual {v2, v4, v5}, Lcom/p1/mobile/putong/core/api/f;->k3(Lcom/p1/mobile/putong/data/User;I)Z

    .line 351
    .line 352
    .line 353
    move-result v2

    .line 354
    if-eqz v2, :cond_7

    .line 355
    .line 356
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 357
    .line 358
    .line 359
    move-result-object p1

    .line 360
    sget v2, Ll/dbc0;->mj:I

    .line 361
    .line 362
    invoke-virtual {p1, v2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 363
    .line 364
    .line 365
    move-result-object p1

    .line 366
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getMinimumWidth()I

    .line 367
    .line 368
    .line 369
    move-result v2

    .line 370
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getMinimumHeight()I

    .line 371
    .line 372
    .line 373
    move-result v4

    .line 374
    invoke-virtual {p1, v1, v1, v2, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 375
    .line 376
    .line 377
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->i:Lv/VText;

    .line 378
    .line 379
    invoke-virtual {v2, p1, v3, v3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 380
    .line 381
    .line 382
    const-string p1, "\u5728\u7ebf"

    .line 383
    .line 384
    goto :goto_4

    .line 385
    :cond_7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->i:Lv/VText;

    .line 386
    .line 387
    invoke-virtual {v2, v3, v3, v3, v3}, Landroidx/appcompat/widget/AppCompatTextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    .line 388
    .line 389
    .line 390
    :goto_4
    if-nez p4, :cond_9

    .line 391
    .line 392
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 393
    .line 394
    .line 395
    move-result p4

    .line 396
    if-nez p4, :cond_8

    .line 397
    .line 398
    const-string p4, " \u00b7 "

    .line 399
    .line 400
    invoke-virtual {p1, p4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 401
    .line 402
    .line 403
    move-result-object p1

    .line 404
    :cond_8
    new-instance p4, Ljava/lang/StringBuilder;

    .line 405
    .line 406
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 407
    .line 408
    .line 409
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    .line 411
    .line 412
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 413
    .line 414
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 415
    .line 416
    iget p1, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 417
    .line 418
    invoke-static {p1, v0}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object p1

    .line 422
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 423
    .line 424
    .line 425
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object p1

    .line 429
    :cond_9
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 430
    .line 431
    .line 432
    move-result p4

    .line 433
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->i:Lv/VText;

    .line 434
    .line 435
    if-nez p4, :cond_a

    .line 436
    .line 437
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 438
    .line 439
    .line 440
    goto :goto_5

    .line 441
    :cond_a
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 442
    .line 443
    .line 444
    :goto_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 445
    .line 446
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 447
    .line 448
    .line 449
    move-result p1

    .line 450
    iget-object p4, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->e:Landroid/widget/FrameLayout;

    .line 451
    .line 452
    const/high16 v0, 0x436a0000    # 234.0f

    .line 453
    .line 454
    if-eqz p1, :cond_b

    .line 455
    .line 456
    sget p1, Ll/dbc0;->Ih:I

    .line 457
    .line 458
    invoke-virtual {p4, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 459
    .line 460
    .line 461
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->e:Landroid/widget/FrameLayout;

    .line 462
    .line 463
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->getRootHeight()I

    .line 464
    .line 465
    .line 466
    move-result p4

    .line 467
    const/high16 v1, 0x42640000    # 57.0f

    .line 468
    .line 469
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 470
    .line 471
    .line 472
    move-result v1

    .line 473
    mul-int/2addr p4, v1

    .line 474
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 475
    .line 476
    .line 477
    move-result v0

    .line 478
    div-int/2addr p4, v0

    .line 479
    invoke-static {p1, p4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 480
    .line 481
    .line 482
    goto :goto_6

    .line 483
    :cond_b
    sget p1, Ll/dbc0;->Ng:I

    .line 484
    .line 485
    invoke-virtual {p4, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 486
    .line 487
    .line 488
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->e:Landroid/widget/FrameLayout;

    .line 489
    .line 490
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->getRootHeight()I

    .line 491
    .line 492
    .line 493
    move-result p4

    .line 494
    const/high16 v1, 0x42d80000    # 108.0f

    .line 495
    .line 496
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 497
    .line 498
    .line 499
    move-result v1

    .line 500
    mul-int/2addr p4, v1

    .line 501
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 502
    .line 503
    .line 504
    move-result v0

    .line 505
    div-int/2addr p4, v0

    .line 506
    invoke-static {p1, p4}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 507
    .line 508
    .line 509
    :goto_6
    invoke-interface {p2}, Ll/few;->pageId()Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object p1

    .line 513
    new-instance p2, Ll/pf60;

    .line 514
    .line 515
    const-string p4, "to_uid"

    .line 516
    .line 517
    invoke-direct {p2, p4, p3}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 518
    .line 519
    .line 520
    new-instance p3, Ll/pf60;

    .line 521
    .line 522
    const-string p4, "card_tag"

    .line 523
    .line 524
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->l:Ljava/lang/String;

    .line 525
    .line 526
    invoke-direct {p3, p4, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 527
    .line 528
    .line 529
    filled-new-array {p2, p3}, [Ll/pf60;

    .line 530
    .line 531
    .line 532
    move-result-object p0

    .line 533
    const-string p2, "e_user_card"

    .line 534
    .line 535
    invoke-static {p2, p1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 536
    .line 537
    .line 538
    return-void

    .line 539
    :cond_c
    :goto_7
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 540
    .line 541
    .line 542
    move-result p2

    .line 543
    if-eqz p2, :cond_d

    .line 544
    .line 545
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->j:Lcom/p1/mobile/putong/data/User;

    .line 546
    .line 547
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 548
    .line 549
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 550
    .line 551
    .line 552
    :cond_d
    return-void
.end method

.method public final synthetic f(Ll/few;Ljava/lang/String;Landroid/view/View;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-interface/range {p1 .. p1}, Ll/few;->pageId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    new-instance v2, Ll/pf60;

    .line 8
    .line 9
    const-string v3, "to_uid"

    .line 10
    .line 11
    move-object/from16 v4, p2

    .line 12
    .line 13
    invoke-direct {v2, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    new-instance v3, Ll/pf60;

    .line 17
    .line 18
    const-string v5, "card_tag"

    .line 19
    .line 20
    iget-object v6, v0, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->l:Ljava/lang/String;

    .line 21
    .line 22
    invoke-direct {v3, v5, v6}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    filled-new-array {v2, v3}, [Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "e_user_card"

    .line 30
    .line 31
    invoke-static {v3, v1, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 32
    .line 33
    .line 34
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 35
    .line 36
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 37
    .line 38
    invoke-virtual {v1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    if-nez v1, :cond_1

    .line 47
    .line 48
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 49
    .line 50
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->s4()Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const-string v2, "pending"

    .line 57
    .line 58
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    if-eqz v1, :cond_0

    .line 63
    .line 64
    const-string v0, "\u8bf7\u7a0d\u540e\uff0c\u6b63\u5728\u5ba1\u6838\u4e2d\u3002"

    .line 65
    .line 66
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :cond_0
    invoke-interface/range {p1 .. p1}, Ll/few;->act()Lcom/p1/mobile/android/app/Act;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    sget v4, Ll/dbc0;->v8:I

    .line 75
    .line 76
    new-instance v6, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem$a;

    .line 77
    .line 78
    invoke-direct {v6, v0, v1}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem$a;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;Lcom/p1/mobile/android/app/Act;)V

    .line 79
    .line 80
    .line 81
    new-instance v9, Ll/pew;

    .line 82
    .line 83
    invoke-direct {v9}, Ll/pew;-><init>()V

    .line 84
    .line 85
    .line 86
    const/4 v15, 0x0

    .line 87
    const/16 v16, 0x0

    .line 88
    .line 89
    const-string v2, "\u8bf7\u5148\u5b8c\u6210\u5934\u50cf\u672c\u4eba\u8ba4\u8bc1"

    .line 90
    .line 91
    const-string v3, "\u8ba4\u8bc1\u771f\u5b9e\u4e5f\u662f\u8868\u8fbe\u771f\u8bda\u7684\u4e00\u90e8\u5206\uff0c\u8bda\u610f\u6ee1\u6ee1\u7684\u60c5\u4e66\u66f4\u52a8\u4eba"

    .line 92
    .line 93
    const-string v5, "\u53bb\u8ba4\u8bc1"

    .line 94
    .line 95
    const/4 v7, 0x1

    .line 96
    const-string v8, "\u4ee5\u540e\u518d\u8bf4"

    .line 97
    .line 98
    const/4 v10, 0x0

    .line 99
    const/4 v11, 0x0

    .line 100
    const/4 v12, 0x1

    .line 101
    const/4 v13, 0x0

    .line 102
    const/4 v14, 0x0

    .line 103
    invoke-static/range {v1 .. v16}, Lcom/p1/mobile/putong/core/ui/dlg/CoreDlg;->G1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/CharSequence;ILjava/lang/String;Ll/x20;ZLjava/lang/String;Ll/x20;Ll/x20;Lcom/p1/mobile/putong/data/User;ZZLjava/lang/String;Ll/x20;Z)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_1
    invoke-interface/range {p1 .. p2}, Ll/few;->R(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    return-void
.end method

.method public g(Ll/jic0;Ll/few;Ljava/lang/String;Ll/y20;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jic0<",
            "Lcom/p1/mobile/putong/core/newui/loveletter/a$b;",
            ">;",
            "Ll/few;",
            "Ljava/lang/String;",
            "Ll/y20<",
            "Ljava/lang/String;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-interface {p2}, Ll/few;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p5

    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 15
    .line 16
    invoke-virtual {v0, p3}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 23
    .line 24
    invoke-virtual {v1, p3}, Lcom/p1/mobile/putong/core/api/g;->Ne(Ljava/lang/String;)Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    new-instance v2, Ll/qu20;

    .line 29
    .line 30
    invoke-direct {v2}, Ll/qu20;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-static {v0, v1, v2}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p1, p5, v0}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance p5, Ll/new;

    .line 42
    .line 43
    invoke-direct {p5, p0, p4, p2, p3}, Ll/new;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;Ll/y20;Ll/few;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p5}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 47
    .line 48
    .line 49
    move-result-object p4

    .line 50
    invoke-virtual {p1, p4}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    new-instance p1, Ll/oew;

    .line 54
    .line 55
    invoke-direct {p1, p0, p2, p3}, Ll/oew;-><init>(Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;Ll/few;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->d(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/newui/loveletter/LoveLetterUserItem;->getRootHeight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    invoke-static {v0, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
