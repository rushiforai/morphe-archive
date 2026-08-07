.class public Lcom/p1/mobile/putong/core/ui/report/f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/report/f$b;
    }
.end annotation


# static fields
.field public static final g:Lcom/p1/mobile/putong/core/ui/report/f;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/report/f$b;",
            ">;"
        }
    .end annotation
.end field

.field public f:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/ui/report/f;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/ui/report/f;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/ui/report/f;->g:Lcom/p1/mobile/putong/core/ui/report/f;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/f;->a:Ljava/lang/String;

    .line 7
    .line 8
    const-string v1, "unmatch"

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->b:Ljava/lang/String;

    .line 11
    .line 12
    const-string v1, "good"

    .line 13
    .line 14
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->c:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->e:Ljava/util/List;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/f;->f:Ljava/lang/String;

    .line 24
    .line 25
    return-void
.end method

.method public static b()Lcom/p1/mobile/putong/core/ui/report/f;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/ui/report/f;->g:Lcom/p1/mobile/putong/core/ui/report/f;

    .line 2
    .line 3
    return-object v0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/f;->c:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/f;->e:Ljava/util/List;

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
    check-cast v0, Lcom/p1/mobile/putong/core/ui/report/f$b;

    .line 18
    .line 19
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/ui/report/f$b;->f0()V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 8

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->d:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/f;->a:Ljava/lang/String;

    .line 6
    .line 7
    const-string v1, "unmatch"

    .line 8
    .line 9
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->b:Ljava/lang/String;

    .line 10
    .line 11
    const-string v2, "good"

    .line 12
    .line 13
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/report/f;->c:Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {}, Ll/ve60;->d()Ll/ue60;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/report/f;->a:Ljava/lang/String;

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {v2}, Ll/ue60;->c()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 31
    .line 32
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    iget-boolean v3, v2, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v3, 0x0

    .line 42
    :goto_0
    const-string v4, "conversation"

    .line 43
    .line 44
    if-eqz v3, :cond_2

    .line 45
    .line 46
    move-object v3, v4

    .line 47
    goto :goto_1

    .line 48
    :cond_2
    const-string v3, "match"

    .line 49
    .line 50
    :goto_1
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 53
    .line 54
    invoke-virtual {v5, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    const-string v5, "swipe"

    .line 59
    .line 60
    const-string v6, "quick_chat"

    .line 61
    .line 62
    if-eqz p1, :cond_a

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->matchedOrFollowed()Z

    .line 65
    .line 66
    .line 67
    move-result v7

    .line 68
    if-eqz v7, :cond_a

    .line 69
    .line 70
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 71
    .line 72
    if-eqz v2, :cond_9

    .line 73
    .line 74
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    if-eqz p1, :cond_3

    .line 81
    .line 82
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/report/f;->b:Ljava/lang/String;

    .line 83
    .line 84
    goto/16 :goto_3

    .line 85
    .line 86
    :cond_3
    const-string p1, "letter"

    .line 87
    .line 88
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 89
    .line 90
    .line 91
    move-result-object v6

    .line 92
    invoke-interface {v2, v6}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result v6

    .line 96
    if-eqz v6, :cond_4

    .line 97
    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->b:Ljava/lang/String;

    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_4
    const-string p1, "superLiked"

    .line 102
    .line 103
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-interface {v2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-nez p1, :cond_8

    .line 112
    .line 113
    const-string p1, "superLikedEach"

    .line 114
    .line 115
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-interface {v2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result p1

    .line 123
    if-eqz p1, :cond_5

    .line 124
    .line 125
    goto :goto_2

    .line 126
    :cond_5
    const-string p1, "boosted"

    .line 127
    .line 128
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-interface {v2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p1

    .line 136
    if-eqz p1, :cond_6

    .line 137
    .line 138
    const-string p1, "boost"

    .line 139
    .line 140
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->b:Ljava/lang/String;

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_6
    const-string p1, "secretcrush"

    .line 144
    .line 145
    invoke-static {p1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-interface {v2, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    if-eqz p1, :cond_7

    .line 154
    .line 155
    const-string p1, "secret"

    .line 156
    .line 157
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->b:Ljava/lang/String;

    .line 158
    .line 159
    goto :goto_3

    .line 160
    :cond_7
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/report/f;->b:Ljava/lang/String;

    .line 161
    .line 162
    goto :goto_3

    .line 163
    :cond_8
    :goto_2
    const-string p1, "superlike"

    .line 164
    .line 165
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->b:Ljava/lang/String;

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_9
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 169
    .line 170
    if-eqz p1, :cond_c

    .line 171
    .line 172
    const-string p1, "follow"

    .line 173
    .line 174
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->b:Ljava/lang/String;

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :cond_a
    if-eqz p1, :cond_b

    .line 178
    .line 179
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    if-eqz p1, :cond_b

    .line 184
    .line 185
    iput-object v6, p0, Lcom/p1/mobile/putong/core/ui/report/f;->b:Ljava/lang/String;

    .line 186
    .line 187
    goto :goto_3

    .line 188
    :cond_b
    if-eqz v2, :cond_c

    .line 189
    .line 190
    iget-object p1, v2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 191
    .line 192
    const-string v2, "default"

    .line 193
    .line 194
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    if-eqz p1, :cond_c

    .line 199
    .line 200
    iput-object v5, p0, Lcom/p1/mobile/putong/core/ui/report/f;->b:Ljava/lang/String;

    .line 201
    .line 202
    :cond_c
    :goto_3
    const-string p1, "p_suggest_user_profile_info_view"

    .line 203
    .line 204
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    const-string v2, "profile"

    .line 209
    .line 210
    if-eqz p1, :cond_e

    .line 211
    .line 212
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->f:Ljava/lang/String;

    .line 213
    .line 214
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 215
    .line 216
    .line 217
    move-result p1

    .line 218
    if-eqz p1, :cond_d

    .line 219
    .line 220
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/report/f;->a:Ljava/lang/String;

    .line 221
    .line 222
    return-void

    .line 223
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->f:Ljava/lang/String;

    .line 224
    .line 225
    invoke-virtual {p0, p1, v3}, Lcom/p1/mobile/putong/core/ui/report/f;->e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->a:Ljava/lang/String;

    .line 230
    .line 231
    return-void

    .line 232
    :cond_e
    const-string p1, "p_unmatch_profile"

    .line 233
    .line 234
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    move-result v5

    .line 238
    if-nez v5, :cond_15

    .line 239
    .line 240
    const-string v5, "p_chat_setting"

    .line 241
    .line 242
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v5

    .line 246
    if-eqz v5, :cond_f

    .line 247
    .line 248
    goto :goto_4

    .line 249
    :cond_f
    const-string p1, "p_album"

    .line 250
    .line 251
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    const-string v1, "personal_moment"

    .line 256
    .line 257
    if-eqz p1, :cond_10

    .line 258
    .line 259
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->a:Ljava/lang/String;

    .line 260
    .line 261
    return-void

    .line 262
    :cond_10
    const-string p1, "p_kankan_chat_popup"

    .line 263
    .line 264
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    move-result p1

    .line 268
    if-eqz p1, :cond_11

    .line 269
    .line 270
    const-string p1, "greeting"

    .line 271
    .line 272
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->a:Ljava/lang/String;

    .line 273
    .line 274
    return-void

    .line 275
    :cond_11
    const-string p1, "p_user_profile_more_popup"

    .line 276
    .line 277
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    move-result p1

    .line 281
    if-eqz p1, :cond_12

    .line 282
    .line 283
    iput-object v2, p0, Lcom/p1/mobile/putong/core/ui/report/f;->a:Ljava/lang/String;

    .line 284
    .line 285
    return-void

    .line 286
    :cond_12
    const-string p1, "p_messages_view"

    .line 287
    .line 288
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 289
    .line 290
    .line 291
    move-result p1

    .line 292
    if-eqz p1, :cond_13

    .line 293
    .line 294
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/report/f;->a:Ljava/lang/String;

    .line 295
    .line 296
    return-void

    .line 297
    :cond_13
    const-string p1, "p_user_moment_fullscreen_browse_view"

    .line 298
    .line 299
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result p1

    .line 303
    if-nez p1, :cond_14

    .line 304
    .line 305
    const-string p1, "p_user_moments_view"

    .line 306
    .line 307
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result p1

    .line 311
    if-eqz p1, :cond_16

    .line 312
    .line 313
    :cond_14
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->a:Ljava/lang/String;

    .line 314
    .line 315
    return-void

    .line 316
    :cond_15
    :goto_4
    iput-object v3, p0, Lcom/p1/mobile/putong/core/ui/report/f;->a:Ljava/lang/String;

    .line 317
    .line 318
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 319
    .line 320
    .line 321
    move-result p1

    .line 322
    if-eqz p1, :cond_16

    .line 323
    .line 324
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->b:Ljava/lang/String;

    .line 325
    .line 326
    :cond_16
    return-void
.end method

.method public final e(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/zbj;->a(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "moment"

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "home_card"

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    const-string p0, "swipe"

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const-string p0, "profile_bubble"

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_3

    .line 28
    .line 29
    const-string p0, "messages_thumbnail_left"

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_3

    .line 36
    .line 37
    const-string p0, "messages_title"

    .line 38
    .line 39
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_3

    .line 44
    .line 45
    const-string p0, "message_ice_break_dialog"

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_3

    .line 52
    .line 53
    const-string p0, "conversation_view"

    .line 54
    .line 55
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-nez p0, :cond_3

    .line 60
    .line 61
    const-string p0, "messages_cover"

    .line 62
    .line 63
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    if-eqz p0, :cond_2

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    const-string p0, "profile"

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_3
    :goto_0
    return-object p2
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/report/f;->f:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public g(Lcom/p1/mobile/putong/core/ui/report/f$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/f;->e:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Lcom/p1/mobile/putong/core/ui/report/f$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/f;->e:Ljava/util/List;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/f;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/report/f;->d:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public l(Lcom/p1/mobile/putong/core/ui/report/ReportCategory;)Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/report/f$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    const-string p0, "REPORT_REASON_OTHER"

    .line 13
    .line 14
    return-object p0

    .line 15
    :pswitch_0
    const-string p0, "REPORT_REASON_RECOMMEND"

    .line 16
    .line 17
    return-object p0

    .line 18
    :pswitch_1
    const-string p0, "REPORT_REASON_VIOLENCE"

    .line 19
    .line 20
    return-object p0

    .line 21
    :pswitch_2
    const-string p0, "REPORT_REASON_EXPLICIT"

    .line 22
    .line 23
    return-object p0

    .line 24
    :pswitch_3
    const-string p0, "REPORT_REASON_PROFANITY"

    .line 25
    .line 26
    return-object p0

    .line 27
    :pswitch_4
    const-string p0, "REPORT_REASON_FRAUD"

    .line 28
    .line 29
    return-object p0

    .line 30
    :pswitch_5
    const-string p0, "REPORT_REASON_SPAM"

    .line 31
    .line 32
    return-object p0

    .line 33
    :pswitch_6
    const-string p0, "REPORT_REASON_FAKE_ACCOUNT"

    .line 34
    .line 35
    return-object p0

    .line 36
    nop

    .line 37
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
