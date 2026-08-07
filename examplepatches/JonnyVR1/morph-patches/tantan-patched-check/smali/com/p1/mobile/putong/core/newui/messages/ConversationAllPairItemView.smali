.class public Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;
.super Lv/VFrame;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$a;,
        Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

.field public b:Lv/VDraweeView;

.field public c:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

.field public d:Lv/VImage;

.field public e:Lv/VImage;

.field public f:Lv/VText;

.field public g:Lcom/p1/mobile/putong/data/User;

.field public h:Lcom/p1/mobile/putong/core/data/Conversation;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VFrame;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->d:Lv/VImage;

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lv/VDraweeView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->b:Lv/VDraweeView;

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->c:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->a:Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lv/VText;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->f:Lv/VText;

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->O(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->P(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private O(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->b:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->b:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string p0, "active"

    .line 13
    .line 14
    return-object p0
.end method

.method private P(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p0, p1}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Dr(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private a0(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->c:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 6
    .line 7
    const/4 v3, 0x1

    .line 8
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 9
    .line 10
    .line 11
    iget-object v2, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->b:Lv/VDraweeView;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-static {v2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 18
    .line 19
    iget-object v3, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->g:Lcom/p1/mobile/putong/data/User;

    .line 20
    .line 21
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Picture$ImageUri;->base:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Ll/am2;->n(Ljava/lang/String;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    new-instance v3, Ll/q3d0;

    .line 36
    .line 37
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->c:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 38
    .line 39
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->getAvatarSize()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->c:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 44
    .line 45
    invoke-virtual {v5}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->getAvatarSize()I

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    invoke-direct {v3, v4, v5}, Ll/q3d0;-><init>(II)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v2, v3}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->O(Ll/q3d0;)Lcom/facebook/imagepipeline/request/ImageRequestBuilder;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {v2}, Lcom/facebook/imagepipeline/request/ImageRequestBuilder;->a()Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const-string v3, "onVoice"

    .line 61
    .line 62
    iget-object v4, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->j:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    iget-object v4, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->c:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 69
    .line 70
    if-eqz v3, :cond_0

    .line 71
    .line 72
    const v5, -0x298501

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    const v5, -0x9655

    .line 77
    .line 78
    .line 79
    :goto_0
    if-eqz v3, :cond_1

    .line 80
    .line 81
    const v6, -0x578301

    .line 82
    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_1
    const v6, -0xa116

    .line 86
    .line 87
    .line 88
    :goto_1
    invoke-virtual {v4, v5, v6}, Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;->e(II)V

    .line 89
    .line 90
    .line 91
    sget-object v4, Ll/uqb0;->G:Ll/fsb0;

    .line 92
    .line 93
    iget-object v5, v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->c:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 94
    .line 95
    invoke-static {v5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    new-instance v6, Ll/k66;

    .line 99
    .line 100
    invoke-direct {v6, v5}, Ll/k66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v4, v2, v6}, Ll/fsb0;->F(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/y20;)V

    .line 104
    .line 105
    .line 106
    const-string v2, "NA"

    .line 107
    .line 108
    const-string v4, "index"

    .line 109
    .line 110
    const-string v5, "liveId"

    .line 111
    .line 112
    const-string v6, "anchorId"

    .line 113
    .line 114
    const-string v7, "p_messages_view"

    .line 115
    .line 116
    if-eqz v3, :cond_2

    .line 117
    .line 118
    iget-object v0, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->e:Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {v6, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object v8

    .line 124
    iget-object v0, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->g:Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {v5, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 127
    .line 128
    .line 129
    move-result-object v9

    .line 130
    iget v0, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->h:I

    .line 131
    .line 132
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-static {v4, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 137
    .line 138
    .line 139
    move-result-object v10

    .line 140
    const-string v0, "profile_user_id"

    .line 141
    .line 142
    iget-object v3, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 143
    .line 144
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 145
    .line 146
    .line 147
    move-result-object v11

    .line 148
    const-string v0, "audio_card_type"

    .line 149
    .line 150
    const-string v3, "message_new_match"

    .line 151
    .line 152
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 153
    .line 154
    .line 155
    move-result-object v12

    .line 156
    const-string v0, "audio_room_type"

    .line 157
    .line 158
    const-string v3, "normal_audio"

    .line 159
    .line 160
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 161
    .line 162
    .line 163
    move-result-object v13

    .line 164
    const-string v0, "audio_tab_id"

    .line 165
    .line 166
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 167
    .line 168
    .line 169
    move-result-object v14

    .line 170
    const-string v0, "topic_id"

    .line 171
    .line 172
    iget-object v1, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->k:Ljava/lang/String;

    .line 173
    .line 174
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 175
    .line 176
    .line 177
    move-result-object v15

    .line 178
    filled-new-array/range {v8 .. v15}, [Ll/pf60;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    const-string v1, "e_live_audio_room_enter"

    .line 183
    .line 184
    invoke-static {v1, v7, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 185
    .line 186
    .line 187
    return-void

    .line 188
    :cond_2
    iget-object v3, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->g:Ljava/lang/String;

    .line 189
    .line 190
    invoke-static {v5, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 191
    .line 192
    .line 193
    move-result-object v8

    .line 194
    iget-object v3, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 195
    .line 196
    invoke-static {v6, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 197
    .line 198
    .line 199
    move-result-object v9

    .line 200
    iget v3, v1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->h:I

    .line 201
    .line 202
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 203
    .line 204
    .line 205
    move-result-object v3

    .line 206
    invoke-static {v4, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 207
    .line 208
    .line 209
    move-result-object v10

    .line 210
    const-string v3, "show_label"

    .line 211
    .line 212
    const-string v4, ""

    .line 213
    .line 214
    invoke-static {v3, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 215
    .line 216
    .line 217
    move-result-object v11

    .line 218
    const-string v3, "module"

    .line 219
    .line 220
    const-string v5, "new_match"

    .line 221
    .line 222
    invoke-static {v3, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 223
    .line 224
    .line 225
    move-result-object v12

    .line 226
    const-string v3, "live_room_live_type"

    .line 227
    .line 228
    invoke-direct/range {p0 .. p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->P(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 233
    .line 234
    .line 235
    move-result-object v13

    .line 236
    const-string v0, "trace_id"

    .line 237
    .line 238
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 239
    .line 240
    .line 241
    move-result-object v14

    .line 242
    const-string v0, "right_recommend_type"

    .line 243
    .line 244
    invoke-static {v0, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 245
    .line 246
    .line 247
    move-result-object v15

    .line 248
    const-string v0, "live_status"

    .line 249
    .line 250
    const-string v1, "on"

    .line 251
    .line 252
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 253
    .line 254
    .line 255
    move-result-object v16

    .line 256
    const-string v0, "liveRecommendCategory"

    .line 257
    .line 258
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 259
    .line 260
    .line 261
    move-result-object v17

    .line 262
    filled-new-array/range {v8 .. v17}, [Ll/pf60;

    .line 263
    .line 264
    .line 265
    move-result-object v0

    .line 266
    const-string v1, "e_live_room_enter"

    .line 267
    .line 268
    invoke-static {v1, v7, v0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 269
    .line 270
    .line 271
    return-void
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->X(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Ll/pf60;)V

    return-void
.end method

.method public static synthetic s(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->W(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic u(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;ILcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->Y(ILcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V

    return-void
.end method

.method public static synthetic v(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->V(Lcom/p1/mobile/putong/core/data/Conversation;)V

    return-void
.end method

.method public static synthetic w(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->T(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lv/VImage;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->e:Lv/VImage;

    return-void
.end method


# virtual methods
.method public final M(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$a;->a(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public N()Lcom/p1/mobile/putong/app/PutongAct;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    return-object p0
.end method

.method public final Q(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            ")",
            "Lrx/c<",
            "Ll/pf60<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/pf60;

    .line 2
    .line 3
    const/4 p1, -0x1

    .line 4
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 9
    .line 10
    invoke-direct {p0, p1, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final R(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->i:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->g:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-wide p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->latestTime:D

    .line 27
    .line 28
    invoke-static {p0, p1}, Ll/pzi0;->G(D)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->g:Lcom/p1/mobile/putong/data/User;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 36
    .line 37
    return-object p0
.end method

.method public S(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/vx6;->b(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->profileSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic T(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->g:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic V(Lcom/p1/mobile/putong/core/data/Conversation;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->h:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic W(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->Q(Lcom/p1/mobile/putong/core/data/Conversation;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final synthetic X(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Ll/pf60;)V
    .locals 4

    .line 1
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x0

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->a0(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 8
    .line 9
    .line 10
    goto :goto_1

    .line 11
    :cond_0
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->c:Lcom/p1/mobile/putong/core/newui/messages/LiveHaloAvatar;

    .line 12
    .line 13
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 14
    .line 15
    .line 16
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->b:Lv/VDraweeView;

    .line 17
    .line 18
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 19
    .line 20
    .line 21
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->g:Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-nez p2, :cond_2

    .line 28
    .line 29
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->g:Lcom/p1/mobile/putong/data/User;

    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 39
    .line 40
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->b:Lv/VDraweeView;

    .line 41
    .line 42
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->g:Lcom/p1/mobile/putong/data/User;

    .line 43
    .line 44
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->S(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {p2, v2, v3}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    :goto_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->b:Lv/VDraweeView;

    .line 55
    .line 56
    sget v3, Ll/dbc0;->i0:I

    .line 57
    .line 58
    invoke-virtual {p2, v2, v3}, Ll/fsb0;->Y0(Lcom/facebook/drawee/view/SimpleDraweeView;I)V

    .line 59
    .line 60
    .line 61
    :goto_1
    sget-object p2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 62
    .line 63
    iget-object p2, p2, Lcom/p1/mobile/putong/core/api/c;->N0:Lcom/p1/mobile/putong/core/api/f;

    .line 64
    .line 65
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->g:Lcom/p1/mobile/putong/data/User;

    .line 66
    .line 67
    invoke-virtual {p2, v2}, Lcom/p1/mobile/putong/core/api/f;->j3(Lcom/p1/mobile/putong/data/User;)Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-eqz p2, :cond_3

    .line 72
    .line 73
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 74
    .line 75
    if-nez p2, :cond_3

    .line 76
    .line 77
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->e:Lv/VImage;

    .line 78
    .line 79
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 80
    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->e:Lv/VImage;

    .line 84
    .line 85
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 86
    .line 87
    .line 88
    :goto_2
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->h:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 89
    .line 90
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result p2

    .line 94
    if-eqz p2, :cond_5

    .line 95
    .line 96
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->h:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 97
    .line 98
    iget-object p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->read:Ljava/lang/Boolean;

    .line 99
    .line 100
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 101
    .line 102
    .line 103
    move-result p2

    .line 104
    if-nez p2, :cond_5

    .line 105
    .line 106
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->h:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 107
    .line 108
    iget-boolean p2, p2, Lcom/p1/mobile/putong/core/data/Conversation;->localHasMessage:Z

    .line 109
    .line 110
    if-nez p2, :cond_5

    .line 111
    .line 112
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->e:Lv/VImage;

    .line 113
    .line 114
    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    if-eqz p2, :cond_5

    .line 119
    .line 120
    iget-boolean p2, p1, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->f:Z

    .line 121
    .line 122
    if-eqz p2, :cond_4

    .line 123
    .line 124
    goto :goto_3

    .line 125
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->d:Lv/VImage;

    .line 126
    .line 127
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 128
    .line 129
    .line 130
    goto :goto_4

    .line 131
    :cond_5
    :goto_3
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->d:Lv/VImage;

    .line 132
    .line 133
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 134
    .line 135
    .line 136
    :goto_4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->f:Lv/VText;

    .line 137
    .line 138
    invoke-virtual {p2, v1}, Landroidx/appcompat/widget/AppCompatTextView;->setBackgroundResource(I)V

    .line 139
    .line 140
    .line 141
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->f:Lv/VText;

    .line 142
    .line 143
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->R(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 148
    .line 149
    .line 150
    return-void
.end method

.method public final synthetic Y(ILcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;Landroid/view/View;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->h:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 4
    .line 5
    invoke-direct {v0, p0, v1, p1, p2}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/data/Conversation;ILcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p3}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView$b;->onClick(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public Z(Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$b;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;I)V
    .locals 4

    return-void

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->N()Lcom/p1/mobile/putong/app/PutongAct;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 8
    .line 9
    iget-object v2, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v1, v2}, Ll/dkb;->Ka(Ljava/lang/String;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Ll/f66;

    .line 16
    .line 17
    invoke-direct {v2, p0}, Ll/f66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1, v2}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 25
    .line 26
    iget-object v2, v2, Ll/il8;->m:Ll/mm6;

    .line 27
    .line 28
    iget-object v3, p2, Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;->d:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ll/wzh0;->uiGet(Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    new-instance v3, Ll/g66;

    .line 35
    .line 36
    invoke-direct {v3, p0}, Ll/g66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, v3}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    new-instance v3, Ll/h66;

    .line 44
    .line 45
    invoke-direct {v3, p0}, Ll/h66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v3}, Lrx/c;->switchMap(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    new-instance v3, Ll/mie0;

    .line 53
    .line 54
    invoke-direct {v3}, Ll/mie0;-><init>()V

    .line 55
    .line 56
    .line 57
    invoke-static {v1, v2, v3}, Ll/psd0;->r(Lrx/c;Lrx/c;Ll/rcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-virtual {p1, v0, v1}, Ll/jic0;->c(Ll/ner;Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    new-instance v0, Ll/i66;

    .line 74
    .line 75
    invoke-direct {v0, p0, p2}, Ll/i66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;Lcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p1, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    new-instance p1, Ll/j66;

    .line 86
    .line 87
    invoke-direct {p1, p0, p3, p2}, Ll/j66;-><init>(Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;ILcom/p1/mobile/putong/core/newui/messages/ConversationHeadRecommendLayout$c;)V

    .line 88
    .line 89
    .line 90
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/newui/messages/ConversationAllPairItemView;->M(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
