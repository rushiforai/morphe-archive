.class public Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/data/Conversation;

.field public final b:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

.field public final c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

.field public final synthetic d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 9
    .line 10
    iput-object p4, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 4
    .line 5
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/16 v2, 0x15

    .line 12
    .line 13
    const-string v3, "p_messages_view"

    .line 14
    .line 15
    const-string v4, ""

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 20
    .line 21
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    const-string v5, "moments_user_id"

    .line 26
    .line 27
    invoke-static {v5, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 28
    .line 29
    .line 30
    move-result-object v6

    .line 31
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 32
    .line 33
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->b:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;

    .line 34
    .line 35
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 36
    .line 37
    invoke-virtual {v1, v5, v7}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->w(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const-string v5, "profile_photo_number"

    .line 42
    .line 43
    invoke-static {v5, v1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 48
    .line 49
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 50
    .line 51
    invoke-virtual {v1, v5}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->u(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v5, "chat_recommend_reason"

    .line 56
    .line 57
    invoke-static {v5, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 58
    .line 59
    .line 60
    move-result-object v8

    .line 61
    new-instance v1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 67
    .line 68
    iget-object v5, v5, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 69
    .line 70
    iget-object v5, v5, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 71
    .line 72
    iget v5, v5, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 73
    .line 74
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    const-string v5, "recommend_photo_distance"

    .line 85
    .line 86
    invoke-static {v5, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 87
    .line 88
    .line 89
    move-result-object v9

    .line 90
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 91
    .line 92
    iget v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->v:I

    .line 93
    .line 94
    const-string v5, "is_close_friend"

    .line 95
    .line 96
    invoke-static {v5, v1}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 97
    .line 98
    .line 99
    move-result-object v10

    .line 100
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 101
    .line 102
    iget v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 103
    .line 104
    if-ne v1, v2, :cond_0

    .line 105
    .line 106
    const-string v1, "1"

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_0
    const-string v1, "0"

    .line 110
    .line 111
    :goto_0
    const-string v5, "is_female_new_recommend"

    .line 112
    .line 113
    invoke-static {v5, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 114
    .line 115
    .line 116
    move-result-object v11

    .line 117
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 118
    .line 119
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->a:Lcom/p1/mobile/putong/data/User;

    .line 120
    .line 121
    iget-object v1, v1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 122
    .line 123
    iget-wide v12, v1, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 124
    .line 125
    invoke-static {v12, v13}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v1

    .line 129
    const-string v5, "user_active_time"

    .line 130
    .line 131
    invoke-static {v5, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 132
    .line 133
    .line 134
    move-result-object v12

    .line 135
    filled-new-array/range {v6 .. v12}, [Ll/sfj0$a;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    const-string v5, "e_current_online_photo"

    .line 140
    .line 141
    invoke-static {v5, v3, v1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 142
    .line 143
    .line 144
    :cond_1
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 145
    .line 146
    iget v5, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a:I

    .line 147
    .line 148
    if-ne v5, v2, :cond_2

    .line 149
    .line 150
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 151
    .line 152
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 157
    .line 158
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/messages/OOFMkWebViewAct;->n2(Landroid/content/Context;)Landroid/content/Intent;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 167
    .line 168
    .line 169
    return-void

    .line 170
    :cond_2
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->C:Ljava/lang/String;

    .line 171
    .line 172
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    if-nez v1, :cond_3

    .line 177
    .line 178
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 179
    .line 180
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 185
    .line 186
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->C:Ljava/lang/String;

    .line 187
    .line 188
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-static {v1, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 193
    .line 194
    .line 195
    return-void

    .line 196
    :cond_3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 197
    .line 198
    iget-boolean v2, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 199
    .line 200
    if-eqz v2, :cond_6

    .line 201
    .line 202
    const-string v2, "onLive"

    .line 203
    .line 204
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->j:Ljava/lang/String;

    .line 205
    .line 206
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 207
    .line 208
    .line 209
    move-result v1

    .line 210
    const-string v2, "index"

    .line 211
    .line 212
    const-string v5, "liveId"

    .line 213
    .line 214
    const-string v6, "anchorId"

    .line 215
    .line 216
    if-nez v1, :cond_5

    .line 217
    .line 218
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 219
    .line 220
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->j:Ljava/lang/String;

    .line 221
    .line 222
    const-string v7, "onMultiCall"

    .line 223
    .line 224
    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    if-eqz v1, :cond_4

    .line 229
    .line 230
    goto :goto_1

    .line 231
    :cond_4
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-interface {v1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->M6()Ll/ftn0;

    .line 236
    .line 237
    .line 238
    move-result-object v7

    .line 239
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 240
    .line 241
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 242
    .line 243
    .line 244
    move-result-object v8

    .line 245
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 246
    .line 247
    iget-object v9, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->g:Ljava/lang/String;

    .line 248
    .line 249
    iget-object v11, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 250
    .line 251
    const/4 v12, 0x0

    .line 252
    const-string v10, "conversation"

    .line 253
    .line 254
    invoke-interface/range {v7 .. v12}, Ll/ftn0;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 258
    .line 259
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->e:Ljava/lang/String;

    .line 260
    .line 261
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 262
    .line 263
    .line 264
    move-result-object v7

    .line 265
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 266
    .line 267
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->g:Ljava/lang/String;

    .line 268
    .line 269
    invoke-static {v5, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 270
    .line 271
    .line 272
    move-result-object v8

    .line 273
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 274
    .line 275
    iget v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->h:I

    .line 276
    .line 277
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 278
    .line 279
    .line 280
    move-result-object v1

    .line 281
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 282
    .line 283
    .line 284
    move-result-object v9

    .line 285
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 286
    .line 287
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 288
    .line 289
    const-string v2, "profile_user_id"

    .line 290
    .line 291
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 292
    .line 293
    .line 294
    move-result-object v10

    .line 295
    const-string v1, "audio_room_type"

    .line 296
    .line 297
    const-string v2, "normal_audio"

    .line 298
    .line 299
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 300
    .line 301
    .line 302
    move-result-object v11

    .line 303
    const-string v1, "audio_tab_id"

    .line 304
    .line 305
    const-string v2, "NA"

    .line 306
    .line 307
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 308
    .line 309
    .line 310
    move-result-object v12

    .line 311
    const-string v1, "audio_card_type"

    .line 312
    .line 313
    const-string v2, "message_new_match"

    .line 314
    .line 315
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 316
    .line 317
    .line 318
    move-result-object v13

    .line 319
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 320
    .line 321
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->k:Ljava/lang/String;

    .line 322
    .line 323
    const-string v1, "topic_id"

    .line 324
    .line 325
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 326
    .line 327
    .line 328
    move-result-object v14

    .line 329
    filled-new-array/range {v7 .. v14}, [Ll/pf60;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    const-string v1, "e_live_audio_room_enter"

    .line 334
    .line 335
    invoke-static {v1, v3, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 336
    .line 337
    .line 338
    return-void

    .line 339
    :cond_5
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    iget-object v7, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 344
    .line 345
    invoke-virtual {v7}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 346
    .line 347
    .line 348
    move-result-object v7

    .line 349
    iget-object v8, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 350
    .line 351
    iget-object v8, v8, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->g:Ljava/lang/String;

    .line 352
    .line 353
    const-string v9, "conversation"

    .line 354
    .line 355
    const/4 v10, 0x0

    .line 356
    invoke-interface {v1, v7, v8, v9, v10}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->startAudienceLive(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 357
    .line 358
    .line 359
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 360
    .line 361
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->g:Ljava/lang/String;

    .line 362
    .line 363
    invoke-static {v5, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 364
    .line 365
    .line 366
    move-result-object v7

    .line 367
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 368
    .line 369
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 370
    .line 371
    invoke-static {v6, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 372
    .line 373
    .line 374
    move-result-object v8

    .line 375
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 376
    .line 377
    iget v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->h:I

    .line 378
    .line 379
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 380
    .line 381
    .line 382
    move-result-object v1

    .line 383
    invoke-static {v2, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 384
    .line 385
    .line 386
    move-result-object v9

    .line 387
    const-string v1, "show_label"

    .line 388
    .line 389
    invoke-static {v1, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 390
    .line 391
    .line 392
    move-result-object v10

    .line 393
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 394
    .line 395
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 396
    .line 397
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->v(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v0

    .line 401
    const-string v1, "live_room_live_type"

    .line 402
    .line 403
    invoke-static {v1, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 404
    .line 405
    .line 406
    move-result-object v11

    .line 407
    const-string v0, "module"

    .line 408
    .line 409
    const-string v1, "new_match"

    .line 410
    .line 411
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 412
    .line 413
    .line 414
    move-result-object v12

    .line 415
    const-string v0, "trace_id"

    .line 416
    .line 417
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 418
    .line 419
    .line 420
    move-result-object v13

    .line 421
    const-string v0, "right_recommend_type"

    .line 422
    .line 423
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 424
    .line 425
    .line 426
    move-result-object v14

    .line 427
    const-string v0, "live_status"

    .line 428
    .line 429
    const-string v1, "on"

    .line 430
    .line 431
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 432
    .line 433
    .line 434
    move-result-object v15

    .line 435
    const-string v0, "liveRecommendCategory"

    .line 436
    .line 437
    const-string v1, "basic"

    .line 438
    .line 439
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 440
    .line 441
    .line 442
    move-result-object v16

    .line 443
    filled-new-array/range {v7 .. v16}, [Ll/pf60;

    .line 444
    .line 445
    .line 446
    move-result-object v0

    .line 447
    const-string v1, "e_live_room_enter"

    .line 448
    .line 449
    invoke-static {v1, v3, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 450
    .line 451
    .line 452
    return-void

    .line 453
    :cond_6
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 454
    .line 455
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 456
    .line 457
    .line 458
    move-result v1

    .line 459
    if-eqz v1, :cond_8

    .line 460
    .line 461
    iget-object v1, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 462
    .line 463
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 464
    .line 465
    .line 466
    move-result-object v1

    .line 467
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 468
    .line 469
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 470
    .line 471
    const/16 v3, 0x1b

    .line 472
    .line 473
    const/4 v4, 0x0

    .line 474
    invoke-static {v1, v2, v4, v4, v3}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l2(Landroid/content/Context;Ljava/lang/String;ZZI)Landroid/content/Intent;

    .line 475
    .line 476
    .line 477
    move-result-object v1

    .line 478
    invoke-static {}, Ll/gra;->C1()Z

    .line 479
    .line 480
    .line 481
    move-result v2

    .line 482
    if-eqz v2, :cond_7

    .line 483
    .line 484
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 485
    .line 486
    iget-boolean v2, v2, Lcom/p1/mobile/putong/core/data/Conversation;->localEverHasMessage:Z

    .line 487
    .line 488
    if-nez v2, :cond_7

    .line 489
    .line 490
    invoke-static {}, Ll/k05;->h()Ll/k05;

    .line 491
    .line 492
    .line 493
    move-result-object v2

    .line 494
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->a:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 495
    .line 496
    iget-object v3, v3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 497
    .line 498
    invoke-virtual {v2, v3}, Ll/k05;->d(Ljava/lang/String;)V

    .line 499
    .line 500
    .line 501
    const-string v2, "one_new_match"

    .line 502
    .line 503
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->u2(Landroid/content/Intent;Ljava/lang/String;)V

    .line 504
    .line 505
    .line 506
    :cond_7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 507
    .line 508
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->p()Lcom/p1/mobile/putong/app/PutongAct;

    .line 509
    .line 510
    .line 511
    move-result-object v0

    .line 512
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 513
    .line 514
    .line 515
    :cond_8
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->a(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->d:Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView$b;->c:Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;

    .line 7
    .line 8
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/newui/messages/BaseConversationRecommendItemView;->E(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
