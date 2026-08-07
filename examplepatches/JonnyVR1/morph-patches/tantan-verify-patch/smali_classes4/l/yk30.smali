.class public Ll/yk30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/w1m;


# static fields
.field public static final a:Ljava/text/DecimalFormat;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/text/DecimalFormat;

    .line 2
    .line 3
    const-string v1, "##"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/yk30;->a:Ljava/text/DecimalFormat;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/data/OptiMVParams;)V
    .locals 31

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    iget-object v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const-string v2, ""

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    iput-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 14
    .line 15
    :cond_0
    sget-object v1, Ll/yk30;->a:Ljava/text/DecimalFormat;

    .line 16
    .line 17
    iget-wide v3, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->createTime:D

    .line 18
    .line 19
    invoke-virtual {v1, v3, v4}, Ljava/text/NumberFormat;->format(D)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v3, "create_time"

    .line 24
    .line 25
    invoke-static {v3, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const-string v1, "is_online"

    .line 30
    .line 31
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnline:Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 34
    .line 35
    .line 36
    move-result-object v5

    .line 37
    const-string v1, "new_match_rank"

    .line 38
    .line 39
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMatchRank:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 42
    .line 43
    .line 44
    move-result-object v6

    .line 45
    const-string v1, "moments_user_id"

    .line 46
    .line 47
    iget-object v3, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->momentsUserId:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v1, v3}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    const-string v1, "operation_id"

    .line 54
    .line 55
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 56
    .line 57
    .line 58
    move-result-object v8

    .line 59
    const-string v1, "is_new_moment"

    .line 60
    .line 61
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isNewMoment:Ljava/lang/String;

    .line 62
    .line 63
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 64
    .line 65
    .line 66
    move-result-object v9

    .line 67
    const-string v1, "new_msg_page_module"

    .line 68
    .line 69
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->newMsgPageModule:Ljava/lang/String;

    .line 70
    .line 71
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 72
    .line 73
    .line 74
    move-result-object v10

    .line 75
    const-string v1, "is_onlive_anchor"

    .line 76
    .line 77
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isOnliveAnchor:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 80
    .line 81
    .line 82
    move-result-object v11

    .line 83
    const-string v1, "is_red_dot"

    .line 84
    .line 85
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->isRedDot:Ljava/lang/String;

    .line 86
    .line 87
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 88
    .line 89
    .line 90
    move-result-object v12

    .line 91
    const-string v1, "other_uid"

    .line 92
    .line 93
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->otherUid:Ljava/lang/String;

    .line 94
    .line 95
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 96
    .line 97
    .line 98
    move-result-object v13

    .line 99
    const-string v1, "red_dot_num"

    .line 100
    .line 101
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->redDotNum:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 104
    .line 105
    .line 106
    move-result-object v14

    .line 107
    const-string v1, "is_fake"

    .line 108
    .line 109
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_fake:Z

    .line 110
    .line 111
    invoke-static {v1, v2}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 112
    .line 113
    .line 114
    move-result-object v15

    .line 115
    const-string v1, "messagec_cell_type"

    .line 116
    .line 117
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messagecCellType:Ljava/lang/String;

    .line 118
    .line 119
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 120
    .line 121
    .line 122
    move-result-object v16

    .line 123
    const-string v1, "user_tag"

    .line 124
    .line 125
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->user_tag:Ljava/lang/String;

    .line 126
    .line 127
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 128
    .line 129
    .line 130
    move-result-object v17

    .line 131
    const-string v1, "pairing_type"

    .line 132
    .line 133
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->pairing_type:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 136
    .line 137
    .line 138
    move-result-object v18

    .line 139
    const-string v1, "message_tab"

    .line 140
    .line 141
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->messageTab:Ljava/lang/String;

    .line 142
    .line 143
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 144
    .line 145
    .line 146
    move-result-object v19

    .line 147
    const-string v1, "equipment_type"

    .line 148
    .line 149
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->equipment_type:Ljava/lang/String;

    .line 150
    .line 151
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 152
    .line 153
    .line 154
    move-result-object v20

    .line 155
    const-string v1, "day_number"

    .line 156
    .line 157
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->day_number:Ljava/lang/String;

    .line 158
    .line 159
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 160
    .line 161
    .line 162
    move-result-object v21

    .line 163
    const-string v1, "chat_guide"

    .line 164
    .line 165
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_guide:Ljava/lang/String;

    .line 166
    .line 167
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 168
    .line 169
    .line 170
    move-result-object v22

    .line 171
    const-string v1, "chat_game_show"

    .line 172
    .line 173
    iget-boolean v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->chat_game_show:Z

    .line 174
    .line 175
    invoke-static {v1, v2}, Ll/sfj0$a;->i(Ljava/lang/String;Z)Ll/sfj0$a;

    .line 176
    .line 177
    .line 178
    move-result-object v23

    .line 179
    const-string v1, "love_letter"

    .line 180
    .line 181
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->love_letter:Ljava/lang/String;

    .line 182
    .line 183
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 184
    .line 185
    .line 186
    move-result-object v24

    .line 187
    iget-boolean v1, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_platinum_top_chat:Z

    .line 188
    .line 189
    if-eqz v1, :cond_1

    .line 190
    .line 191
    const-string v1, "yes"

    .line 192
    .line 193
    goto :goto_0

    .line 194
    :cond_1
    const-string v1, "no"

    .line 195
    .line 196
    :goto_0
    const-string v2, "is_platinum_top_chat"

    .line 197
    .line 198
    invoke-static {v2, v1}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 199
    .line 200
    .line 201
    move-result-object v25

    .line 202
    const-string v1, "guide_type"

    .line 203
    .line 204
    iget-object v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->guide_type:Ljava/lang/String;

    .line 205
    .line 206
    invoke-static {v1, v2}, Ll/sfj0$a;->h(Ljava/lang/String;Ljava/lang/String;)Ll/sfj0$a;

    .line 207
    .line 208
    .line 209
    move-result-object v26

    .line 210
    const-string v1, "spark_level"

    .line 211
    .line 212
    iget v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->spark_level:I

    .line 213
    .line 214
    invoke-static {v1, v2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 215
    .line 216
    .line 217
    move-result-object v27

    .line 218
    const-string v1, "message_pairs"

    .line 219
    .line 220
    iget v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->message_pairs:I

    .line 221
    .line 222
    invoke-static {v1, v2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 223
    .line 224
    .line 225
    move-result-object v28

    .line 226
    const-string v1, "is_close_friend"

    .line 227
    .line 228
    iget v2, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_close_friend:I

    .line 229
    .line 230
    invoke-static {v1, v2}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 231
    .line 232
    .line 233
    move-result-object v29

    .line 234
    const-string v1, "is_top_recommend"

    .line 235
    .line 236
    iget v0, v0, Lcom/p1/mobile/putong/core/data/OptiMVParams;->is_top_recommend:I

    .line 237
    .line 238
    invoke-static {v1, v0}, Ll/sfj0$a;->f(Ljava/lang/String;I)Ll/sfj0$a;

    .line 239
    .line 240
    .line 241
    move-result-object v30

    .line 242
    filled-new-array/range {v4 .. v30}, [Ll/sfj0$a;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    const-string v1, "e_messages_view_match"

    .line 247
    .line 248
    const-string v2, "p_messages_view"

    .line 249
    .line 250
    invoke-static {v1, v2, v0}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 251
    .line 252
    .line 253
    return-void
.end method
