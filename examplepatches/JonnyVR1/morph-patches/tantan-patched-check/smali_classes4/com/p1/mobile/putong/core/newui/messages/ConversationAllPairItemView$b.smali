.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final b:I

.field public final c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/data/Conversation;ILcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 7
    .line 8
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->b:I

    .line 9
    .line 10
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->g:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-string v2, "p_messages_view"

    .line 12
    .line 13
    const-string v3, ""

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 18
    .line 19
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->g:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 22
    .line 23
    const-string v4, "moments_user_id"

    .line 24
    .line 25
    invoke-static {v4, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v5

    .line 29
    const-string v1, "profile_photo_number"

    .line 30
    .line 31
    iget v4, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->b:I

    .line 32
    .line 33
    invoke-static {v1, v4}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 38
    .line 39
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 40
    .line 41
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->K(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    const-string v4, "chat_recommend_reason"

    .line 46
    .line 47
    invoke-static {v4, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    new-instance v1, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 57
    .line 58
    iget-object v4, v4, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->g:Lcom/p1/mobile/putong/data/User;

    .line 59
    .line 60
    iget-object v4, v4, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 61
    .line 62
    iget v4, v4, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 63
    .line 64
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    const-string v4, "recommend_photo_distance"

    .line 75
    .line 76
    invoke-static {v4, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 77
    .line 78
    .line 79
    move-result-object v8

    .line 80
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 81
    .line 82
    iget v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->v:I

    .line 83
    .line 84
    const-string v4, "is_close_friend"

    .line 85
    .line 86
    invoke-static {v4, v1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 87
    .line 88
    .line 89
    move-result-object v9

    .line 90
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 91
    .line 92
    iget v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 93
    .line 94
    const/16 v4, 0x15

    .line 95
    .line 96
    if-ne v1, v4, :cond_0

    .line 97
    .line 98
    const-string v1, "1"

    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_0
    const-string v1, "0"

    .line 102
    .line 103
    :goto_0
    const-string v4, "is_female_new_recommend"

    .line 104
    .line 105
    invoke-static {v4, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 106
    .line 107
    .line 108
    move-result-object v10

    .line 109
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 110
    .line 111
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->g:Lcom/p1/mobile/putong/data/User;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 114
    .line 115
    iget-wide v11, v1, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 116
    .line 117
    invoke-static {v11, v12}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const-string v4, "user_active_time"

    .line 122
    .line 123
    invoke-static {v4, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 124
    .line 125
    .line 126
    move-result-object v11

    .line 127
    filled-new-array/range {v5 .. v11}, [Ll/sfj0$a;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    const-string v4, "e_current_online_photo"

    .line 132
    .line 133
    invoke-static {v4, v2, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 134
    .line 135
    .line 136
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 137
    .line 138
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->C:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-nez v1, :cond_2

    .line 145
    .line 146
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 147
    .line 148
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->N()Lcom/p1/mobile/putong/app/PutongAct;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 153
    .line 154
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->C:Ljava/lang/String;

    .line 155
    .line 156
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    invoke-static {v1, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :cond_2
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 165
    .line 166
    iget-boolean v4, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 167
    .line 168
    if-eqz v4, :cond_5

    .line 169
    .line 170
    const-string v4, "onLive"

    .line 171
    .line 172
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->j:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v4, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    const-string v4, "NA"

    .line 179
    .line 180
    const-string v5, "index"

    .line 181
    .line 182
    const-string v6, "liveId"

    .line 183
    .line 184
    const-string v7, "anchorId"

    .line 185
    .line 186
    if-nez v1, :cond_4

    .line 187
    .line 188
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 189
    .line 190
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->j:Ljava/lang/String;

    .line 191
    .line 192
    const-string v8, "onMultiCall"

    .line 193
    .line 194
    invoke-virtual {v8, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    if-eqz v1, :cond_3

    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-interface {v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 206
    .line 207
    .line 208
    move-result-object v8

    .line 209
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 210
    .line 211
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->N()Lcom/p1/mobile/putong/app/PutongAct;

    .line 212
    .line 213
    .line 214
    move-result-object v9

    .line 215
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 216
    .line 217
    iget-object v10, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->g:Ljava/lang/String;

    .line 218
    .line 219
    iget-object v12, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 220
    .line 221
    const/4 v13, 0x0

    .line 222
    const-string v11, "conversation"

    .line 223
    .line 224
    invoke-interface/range {v8 .. v13}, Ll/ftn0;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 228
    .line 229
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->e:Ljava/lang/String;

    .line 230
    .line 231
    invoke-static {v7, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 232
    .line 233
    .line 234
    move-result-object v8

    .line 235
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 236
    .line 237
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->g:Ljava/lang/String;

    .line 238
    .line 239
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 240
    .line 241
    .line 242
    move-result-object v9

    .line 243
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 244
    .line 245
    iget v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->h:I

    .line 246
    .line 247
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-static {v5, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 252
    .line 253
    .line 254
    move-result-object v10

    .line 255
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 256
    .line 257
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 258
    .line 259
    const-string v3, "profile_user_id"

    .line 260
    .line 261
    invoke-static {v3, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 262
    .line 263
    .line 264
    move-result-object v11

    .line 265
    const-string v1, "audio_room_type"

    .line 266
    .line 267
    const-string v3, "normal_audio"

    .line 268
    .line 269
    invoke-static {v1, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 270
    .line 271
    .line 272
    move-result-object v12

    .line 273
    const-string v1, "audio_tab_id"

    .line 274
    .line 275
    invoke-static {v1, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 276
    .line 277
    .line 278
    move-result-object v13

    .line 279
    const-string v1, "audio_card_type"

    .line 280
    .line 281
    const-string v3, "message_new_match"

    .line 282
    .line 283
    invoke-static {v1, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 284
    .line 285
    .line 286
    move-result-object v14

    .line 287
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 288
    .line 289
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->k:Ljava/lang/String;

    .line 290
    .line 291
    const-string v1, "topic_id"

    .line 292
    .line 293
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 294
    .line 295
    .line 296
    move-result-object v15

    .line 297
    filled-new-array/range {v8 .. v15}, [Ll/pf60;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    const-string v1, "e_live_audio_room_enter"

    .line 302
    .line 303
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 304
    .line 305
    .line 306
    return-void

    .line 307
    :cond_4
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 312
    .line 313
    invoke-virtual {v8}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->N()Lcom/p1/mobile/putong/app/PutongAct;

    .line 314
    .line 315
    .line 316
    move-result-object v8

    .line 317
    iget-object v9, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 318
    .line 319
    iget-object v9, v9, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->g:Ljava/lang/String;

    .line 320
    .line 321
    const-string v10, "conversation"

    .line 322
    .line 323
    const/4 v11, 0x0

    .line 324
    invoke-interface {v1, v8, v9, v10, v11}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startAudienceLive(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 325
    .line 326
    .line 327
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 328
    .line 329
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->g:Ljava/lang/String;

    .line 330
    .line 331
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 332
    .line 333
    .line 334
    move-result-object v8

    .line 335
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 336
    .line 337
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 338
    .line 339
    invoke-static {v7, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 340
    .line 341
    .line 342
    move-result-object v9

    .line 343
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 344
    .line 345
    iget v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->h:I

    .line 346
    .line 347
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 348
    .line 349
    .line 350
    move-result-object v1

    .line 351
    invoke-static {v5, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 352
    .line 353
    .line 354
    move-result-object v10

    .line 355
    const-string v1, "show_label"

    .line 356
    .line 357
    invoke-static {v1, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 358
    .line 359
    .line 360
    move-result-object v11

    .line 361
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 362
    .line 363
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 364
    .line 365
    invoke-static {v1, v0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->L(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    const-string v1, "live_room_live_type"

    .line 370
    .line 371
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 372
    .line 373
    .line 374
    move-result-object v12

    .line 375
    const-string v0, "module"

    .line 376
    .line 377
    const-string v1, "new_match"

    .line 378
    .line 379
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 380
    .line 381
    .line 382
    move-result-object v13

    .line 383
    const-string v0, "trace_id"

    .line 384
    .line 385
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 386
    .line 387
    .line 388
    move-result-object v14

    .line 389
    const-string v0, "right_recommend_type"

    .line 390
    .line 391
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 392
    .line 393
    .line 394
    move-result-object v15

    .line 395
    const-string v0, "live_status"

    .line 396
    .line 397
    const-string v1, "on"

    .line 398
    .line 399
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 400
    .line 401
    .line 402
    move-result-object v16

    .line 403
    const-string v0, "liveRecommendCategory"

    .line 404
    .line 405
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 406
    .line 407
    .line 408
    move-result-object v17

    .line 409
    filled-new-array/range {v8 .. v17}, [Ll/pf60;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    const-string v1, "e_live_room_enter"

    .line 414
    .line 415
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 416
    .line 417
    .line 418
    return-void

    .line 419
    :cond_5
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 420
    .line 421
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 422
    .line 423
    .line 424
    move-result v1

    .line 425
    if-eqz v1, :cond_6

    .line 426
    .line 427
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 428
    .line 429
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->N()Lcom/p1/mobile/putong/app/PutongAct;

    .line 430
    .line 431
    .line 432
    move-result-object v1

    .line 433
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    .line 434
    .line 435
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->N()Lcom/p1/mobile/putong/app/PutongAct;

    .line 436
    .line 437
    .line 438
    move-result-object v2

    .line 439
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 440
    .line 441
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 442
    .line 443
    const/16 v3, 0x1b

    .line 444
    .line 445
    const/4 v4, 0x0

    .line 446
    invoke-static {v2, v0, v4, v4, v3}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 447
    .line 448
    .line 449
    move-result-object v0

    .line 450
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 451
    .line 452
    .line 453
    :cond_6
    return-void
.end method
