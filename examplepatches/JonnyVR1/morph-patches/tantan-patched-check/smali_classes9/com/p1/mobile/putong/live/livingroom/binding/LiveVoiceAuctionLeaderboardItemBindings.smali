.class public Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/leaderboard/LiveVoiceAuctionLeaderboardListItem;

.field public b:Lv/VLinear;

.field public c:Lv/VText;

.field public d:Lv/VText;

.field public e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

.field public f:Lv/VText;

.field public g:Lv/VDraweeView;

.field public h:Lv/VDraweeView;

.field public i:Lv/VDraweeView;

.field public j:Lv/VDraweeView;

.field public k:Lv/VText;

.field public l:Lv/VDraweeView;

.field public m:Lv/VText;

.field public n:Lv/VText;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public a(Landroid/view/ViewGroup;)V
    .locals 6

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/leaderboard/LiveVoiceAuctionLeaderboardListItem;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/leaderboard/LiveVoiceAuctionLeaderboardListItem;

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Lv/VLinear;

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->b:Lv/VLinear;

    .line 14
    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    const-string v1, "_time_layout"

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    :goto_0
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    check-cast v2, Landroid/view/ViewGroup;

    .line 26
    .line 27
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lv/VText;

    .line 32
    .line 33
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->c:Lv/VText;

    .line 34
    .line 35
    if-nez v2, :cond_1

    .line 36
    .line 37
    const-string v1, "_time_layout_day"

    .line 38
    .line 39
    :cond_1
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    check-cast v2, Landroid/view/ViewGroup;

    .line 44
    .line 45
    const/4 v3, 0x2

    .line 46
    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    check-cast v2, Lv/VText;

    .line 51
    .line 52
    iput-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->d:Lv/VText;

    .line 53
    .line 54
    if-nez v2, :cond_2

    .line 55
    .line 56
    const-string v1, "_time_layout_month"

    .line 57
    .line 58
    :cond_2
    const/4 v2, 0x1

    .line 59
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object v4

    .line 63
    check-cast v4, Landroid/view/ViewGroup;

    .line 64
    .line 65
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    check-cast v4, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 70
    .line 71
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 72
    .line 73
    if-nez v4, :cond_3

    .line 74
    .line 75
    const-string v1, "_rank_svga"

    .line 76
    .line 77
    :cond_3
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    check-cast v4, Landroid/view/ViewGroup;

    .line 82
    .line 83
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    check-cast v4, Lv/VText;

    .line 88
    .line 89
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->f:Lv/VText;

    .line 90
    .line 91
    if-nez v4, :cond_4

    .line 92
    .line 93
    const-string v1, "_rank"

    .line 94
    .line 95
    :cond_4
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    check-cast v4, Landroid/view/ViewGroup;

    .line 100
    .line 101
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    check-cast v4, Lv/VDraweeView;

    .line 106
    .line 107
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->g:Lv/VDraweeView;

    .line 108
    .line 109
    if-nez v4, :cond_5

    .line 110
    .line 111
    const-string v1, "_avatar_view"

    .line 112
    .line 113
    :cond_5
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    check-cast v4, Landroid/view/ViewGroup;

    .line 118
    .line 119
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 120
    .line 121
    .line 122
    move-result-object v4

    .line 123
    check-cast v4, Lv/VDraweeView;

    .line 124
    .line 125
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->h:Lv/VDraweeView;

    .line 126
    .line 127
    if-nez v4, :cond_6

    .line 128
    .line 129
    const-string v1, "_avatar_view_other"

    .line 130
    .line 131
    :cond_6
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v4

    .line 135
    check-cast v4, Landroid/view/ViewGroup;

    .line 136
    .line 137
    invoke-virtual {v4, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 138
    .line 139
    .line 140
    move-result-object v4

    .line 141
    check-cast v4, Lv/VDraweeView;

    .line 142
    .line 143
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->i:Lv/VDraweeView;

    .line 144
    .line 145
    if-nez v4, :cond_7

    .line 146
    .line 147
    const-string v1, "_avatar_tag_view"

    .line 148
    .line 149
    :cond_7
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 150
    .line 151
    .line 152
    move-result-object v4

    .line 153
    check-cast v4, Landroid/view/ViewGroup;

    .line 154
    .line 155
    const/4 v5, 0x3

    .line 156
    invoke-virtual {v4, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    check-cast v4, Lv/VDraweeView;

    .line 161
    .line 162
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->j:Lv/VDraweeView;

    .line 163
    .line 164
    if-nez v4, :cond_8

    .line 165
    .line 166
    const-string v1, "_avatar_tag_view_other"

    .line 167
    .line 168
    :cond_8
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    check-cast v4, Landroid/view/ViewGroup;

    .line 173
    .line 174
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    check-cast v4, Lv/VText;

    .line 179
    .line 180
    iput-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->k:Lv/VText;

    .line 181
    .line 182
    if-nez v4, :cond_9

    .line 183
    .line 184
    const-string v1, "_name"

    .line 185
    .line 186
    :cond_9
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    check-cast v4, Landroid/view/ViewGroup;

    .line 191
    .line 192
    invoke-virtual {v4, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 193
    .line 194
    .line 195
    move-result-object v4

    .line 196
    check-cast v4, Landroid/view/ViewGroup;

    .line 197
    .line 198
    invoke-virtual {v4, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    check-cast v0, Lv/VDraweeView;

    .line 203
    .line 204
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->l:Lv/VDraweeView;

    .line 205
    .line 206
    if-nez v0, :cond_a

    .line 207
    .line 208
    const-string v1, "_relation_img"

    .line 209
    .line 210
    :cond_a
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 211
    .line 212
    .line 213
    move-result-object v0

    .line 214
    check-cast v0, Landroid/view/ViewGroup;

    .line 215
    .line 216
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    check-cast v0, Landroid/view/ViewGroup;

    .line 221
    .line 222
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    check-cast v0, Lv/VText;

    .line 227
    .line 228
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->m:Lv/VText;

    .line 229
    .line 230
    if-nez v0, :cond_b

    .line 231
    .line 232
    const-string v1, "_relation"

    .line 233
    .line 234
    :cond_b
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    check-cast p1, Landroid/view/ViewGroup;

    .line 239
    .line 240
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    check-cast p1, Landroid/view/ViewGroup;

    .line 245
    .line 246
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    check-cast p1, Lv/VText;

    .line 251
    .line 252
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->n:Lv/VText;

    .line 253
    .line 254
    if-nez p1, :cond_c

    .line 255
    .line 256
    const-string v1, "_user_worth"

    .line 257
    .line 258
    :cond_c
    if-nez v1, :cond_d

    .line 259
    .line 260
    return-void

    .line 261
    :cond_d
    const-string p0, "Missing required view with ID:"

    .line 262
    .line 263
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object p0

    .line 267
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 268
    .line 269
    .line 270
    return-void
.end method

.method public getRoot()Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/leaderboard/LiveVoiceAuctionLeaderboardListItem;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->a:Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/leaderboard/LiveVoiceAuctionLeaderboardListItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->a(Landroid/view/ViewGroup;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
