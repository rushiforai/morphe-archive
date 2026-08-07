.class public final Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/leaderboard/LiveVoiceAuctionLeaderboardListItem;
.super Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001B\u001b\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\n\u0008\u0002\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0015\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u001f\u0010\u0011\u001a\u00020\n2\u0006\u0010\u000e\u001a\u00020\r2\u0006\u0010\u0010\u001a\u00020\u000fH\u0007\u00a2\u0006\u0004\u0008\u0011\u0010\u0012J\u0017\u0010\u0015\u001a\u00020\u000f2\u0006\u0010\u0014\u001a\u00020\u0013H\u0002\u00a2\u0006\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u0017"
    }
    d2 = {
        "Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/leaderboard/LiveVoiceAuctionLeaderboardListItem;",
        "Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
        "Ll/kom0;",
        "model",
        "",
        "d",
        "(Ll/kom0;)V",
        "Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;",
        "item",
        "",
        "type",
        "c",
        "(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;Ljava/lang/String;)V",
        "",
        "heart",
        "b",
        "(I)Ljava/lang/String;",
        "livingroom_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 10
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;ILkotlin/jvm/internal/DefaultConstructorMarker;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/4 p2, 0x0

    .line 6
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/leaderboard/LiveVoiceAuctionLeaderboardListItem;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final b(I)Ljava/lang/String;
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "0"

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    int-to-double p0, p1

    .line 7
    invoke-static {p0, p1}, Ll/yau;->c(D)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method public final c(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;Ljava/lang/String;)V
    .locals 12
    .param p1    # Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetTextI18n"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->f:Lv/VText;

    .line 8
    .line 9
    sget-object v1, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->c:Lv/VText;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->d:Lv/VText;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 22
    .line 23
    .line 24
    const-string v0, "today"

    .line 25
    .line 26
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    const/4 v0, 0x4

    .line 31
    const/4 v1, 0x0

    .line 32
    const/4 v2, 0x1

    .line 33
    if-eqz p2, :cond_3

    .line 34
    .line 35
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->b:Lv/VLinear;

    .line 36
    .line 37
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 38
    .line 39
    .line 40
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->f:Lv/VText;

    .line 41
    .line 42
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->rank:I

    .line 43
    .line 44
    invoke-static {p2, v3}, Ll/okc0;->f(Landroid/widget/TextView;I)V

    .line 45
    .line 46
    .line 47
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->rank:I

    .line 48
    .line 49
    if-gt v2, p2, :cond_1

    .line 50
    .line 51
    if-ge p2, v0, :cond_1

    .line 52
    .line 53
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->f:Lv/VText;

    .line 54
    .line 55
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 59
    .line 60
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 61
    .line 62
    .line 63
    invoke-static {}, Ll/i9n;->b()Z

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 68
    .line 69
    const/4 v4, 0x0

    .line 70
    if-eqz p2, :cond_0

    .line 71
    .line 72
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->rank:I

    .line 73
    .line 74
    invoke-static {p2}, Ll/okc0;->a(I)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p2

    .line 78
    invoke-virtual {v3, p2, v2, v4}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_0
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->rank:I

    .line 83
    .line 84
    invoke-static {p2}, Ll/okc0;->a(I)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p2

    .line 88
    const/4 v5, -0x1

    .line 89
    invoke-virtual {v3, p2, v5, v4}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->l(Ljava/lang/String;ILl/wo0;)V

    .line 90
    .line 91
    .line 92
    :goto_0
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->f:Lv/VText;

    .line 93
    .line 94
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->rank:I

    .line 95
    .line 96
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v3

    .line 100
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 101
    .line 102
    .line 103
    goto/16 :goto_1

    .line 104
    .line 105
    :cond_1
    if-gt v0, p2, :cond_2

    .line 106
    .line 107
    const/16 v3, 0x64

    .line 108
    .line 109
    if-ge p2, v3, :cond_2

    .line 110
    .line 111
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->f:Lv/VText;

    .line 112
    .line 113
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 114
    .line 115
    .line 116
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 117
    .line 118
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 119
    .line 120
    .line 121
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 122
    .line 123
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 124
    .line 125
    .line 126
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->f:Lv/VText;

    .line 127
    .line 128
    iget v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->rank:I

    .line 129
    .line 130
    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 135
    .line 136
    .line 137
    goto :goto_1

    .line 138
    :cond_2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->f:Lv/VText;

    .line 139
    .line 140
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 141
    .line 142
    .line 143
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 144
    .line 145
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 146
    .line 147
    .line 148
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 149
    .line 150
    invoke-virtual {p2}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->o()V

    .line 151
    .line 152
    .line 153
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->f:Lv/VText;

    .line 154
    .line 155
    const-string v3, "99+"

    .line 156
    .line 157
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 158
    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_3
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->f:Lv/VText;

    .line 162
    .line 163
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 164
    .line 165
    .line 166
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->e:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 167
    .line 168
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 169
    .line 170
    .line 171
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->b:Lv/VLinear;

    .line 172
    .line 173
    invoke-static {p2, v2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 174
    .line 175
    .line 176
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 177
    .line 178
    .line 179
    move-result-object p2

    .line 180
    iget-wide v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->auctionTime:J

    .line 181
    .line 182
    const-wide/16 v5, 0x3e8

    .line 183
    .line 184
    mul-long/2addr v3, v5

    .line 185
    invoke-virtual {p2, v3, v4}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 186
    .line 187
    .line 188
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->c:Lv/VText;

    .line 189
    .line 190
    const/4 v4, 0x5

    .line 191
    invoke-virtual {p2, v4}, Ljava/util/Calendar;->get(I)I

    .line 192
    .line 193
    .line 194
    move-result v4

    .line 195
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v4

    .line 199
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 200
    .line 201
    .line 202
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->d:Lv/VText;

    .line 203
    .line 204
    sget-object v4, Lkotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lkotlin/jvm/internal/StringCompanionObject;

    .line 205
    .line 206
    const/4 v4, 0x2

    .line 207
    invoke-virtual {p2, v4}, Ljava/util/Calendar;->get(I)I

    .line 208
    .line 209
    .line 210
    move-result p2

    .line 211
    add-int/2addr p2, v2

    .line 212
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 213
    .line 214
    .line 215
    move-result-object p2

    .line 216
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object p2

    .line 220
    invoke-static {p2, v2}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object p2

    .line 224
    const-string v4, "%02d\u6708"

    .line 225
    .line 226
    invoke-static {v4, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    invoke-virtual {v3, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 231
    .line 232
    .line 233
    :goto_1
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->k:Lv/VText;

    .line 234
    .line 235
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 236
    .line 237
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->userName:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 240
    .line 241
    .line 242
    invoke-static {v3, v0}, Ll/bf10;->w(Ljava/lang/String;I)Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v3

    .line 246
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 247
    .line 248
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->userName:Ljava/lang/String;

    .line 249
    .line 250
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 251
    .line 252
    .line 253
    invoke-static {v4, v0}, Ll/bf10;->w(Ljava/lang/String;I)Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v4

    .line 257
    new-instance v5, Ljava/lang/StringBuilder;

    .line 258
    .line 259
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    const-string v3, " \u62cd\u4e0b "

    .line 266
    .line 267
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v3

    .line 277
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 278
    .line 279
    .line 280
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->m:Lv/VText;

    .line 281
    .line 282
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 283
    .line 284
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->name:Ljava/lang/String;

    .line 285
    .line 286
    invoke-virtual {p2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 287
    .line 288
    .line 289
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->l:Lv/VDraweeView;

    .line 290
    .line 291
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 292
    .line 293
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->tagImage:Ljava/lang/String;

    .line 294
    .line 295
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 296
    .line 297
    .line 298
    move-result v3

    .line 299
    xor-int/2addr v3, v2

    .line 300
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 301
    .line 302
    .line 303
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->m:Lv/VText;

    .line 304
    .line 305
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 306
    .line 307
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->tagImage:Ljava/lang/String;

    .line 308
    .line 309
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 310
    .line 311
    .line 312
    move-result v3

    .line 313
    invoke-static {p2, v3}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 314
    .line 315
    .line 316
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 317
    .line 318
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->tagImage:Ljava/lang/String;

    .line 319
    .line 320
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 321
    .line 322
    .line 323
    move-result p2

    .line 324
    if-nez p2, :cond_4

    .line 325
    .line 326
    iget-object v4, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->l:Lv/VDraweeView;

    .line 327
    .line 328
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 329
    .line 330
    iget-object v5, p2, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->tagImage:Ljava/lang/String;

    .line 331
    .line 332
    const/high16 p2, 0x42740000    # 61.0f

    .line 333
    .line 334
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 335
    .line 336
    .line 337
    move-result v6

    .line 338
    const/high16 p2, 0x41600000    # 14.0f

    .line 339
    .line 340
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 341
    .line 342
    .line 343
    move-result v7

    .line 344
    new-instance v11, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/leaderboard/LiveVoiceAuctionLeaderboardListItem$a;

    .line 345
    .line 346
    invoke-direct {v11, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/leaderboard/LiveVoiceAuctionLeaderboardListItem$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/leaderboard/LiveVoiceAuctionLeaderboardListItem;)V

    .line 347
    .line 348
    .line 349
    const-string v3, "context_livingAct"

    .line 350
    .line 351
    const/4 v8, 0x0

    .line 352
    const/4 v9, 0x0

    .line 353
    const/4 v10, 0x0

    .line 354
    invoke-static/range {v3 .. v11}, Ll/izs;->v(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;IIZZZLl/fn2;)V

    .line 355
    .line 356
    .line 357
    goto :goto_2

    .line 358
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->m:Lv/VText;

    .line 359
    .line 360
    iget-object v3, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 361
    .line 362
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->startBgColor:Ljava/lang/String;

    .line 363
    .line 364
    invoke-static {v3}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 365
    .line 366
    .line 367
    move-result v3

    .line 368
    iget-object v4, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->relationDetail:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;

    .line 369
    .line 370
    iget-object v4, v4, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionRelation;->endBgColor:Ljava/lang/String;

    .line 371
    .line 372
    invoke-static {v4}, Ll/ynp0;->B(Ljava/lang/String;)I

    .line 373
    .line 374
    .line 375
    move-result v4

    .line 376
    sget-object v5, Landroid/graphics/drawable/GradientDrawable$Orientation;->LEFT_RIGHT:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 377
    .line 378
    invoke-static {v3, v4, v0, v5}, Ll/fc2;->k(IIILandroid/graphics/drawable/GradientDrawable$Orientation;)Landroid/graphics/drawable/GradientDrawable;

    .line 379
    .line 380
    .line 381
    move-result-object v0

    .line 382
    invoke-virtual {p2, v0}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 383
    .line 384
    .line 385
    :goto_2
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->n:Lv/VText;

    .line 386
    .line 387
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->worth:I

    .line 388
    .line 389
    if-lez v0, :cond_5

    .line 390
    .line 391
    move v1, v2

    .line 392
    :cond_5
    invoke-static {p2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 393
    .line 394
    .line 395
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->n:Lv/VText;

    .line 396
    .line 397
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->worth:I

    .line 398
    .line 399
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/leaderboard/LiveVoiceAuctionLeaderboardListItem;->b(I)Ljava/lang/String;

    .line 400
    .line 401
    .line 402
    move-result-object v0

    .line 403
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 404
    .line 405
    .line 406
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->g:Lv/VDraweeView;

    .line 407
    .line 408
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 409
    .line 410
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->avatar:Ljava/lang/String;

    .line 411
    .line 412
    const-string v1, "context_single_room"

    .line 413
    .line 414
    invoke-static {v1, p2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 415
    .line 416
    .line 417
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->h:Lv/VDraweeView;

    .line 418
    .line 419
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 420
    .line 421
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->avatar:Ljava/lang/String;

    .line 422
    .line 423
    invoke-static {v1, p2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 424
    .line 425
    .line 426
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->i:Lv/VDraweeView;

    .line 427
    .line 428
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 429
    .line 430
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->tagImage:Ljava/lang/String;

    .line 431
    .line 432
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 433
    .line 434
    .line 435
    move-result v0

    .line 436
    xor-int/2addr v0, v2

    .line 437
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 438
    .line 439
    .line 440
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->i:Lv/VDraweeView;

    .line 441
    .line 442
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->userInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 443
    .line 444
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->tagImage:Ljava/lang/String;

    .line 445
    .line 446
    invoke-static {v1, p2, v0}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 447
    .line 448
    .line 449
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->j:Lv/VDraweeView;

    .line 450
    .line 451
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 452
    .line 453
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->tagImage:Ljava/lang/String;

    .line 454
    .line 455
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 456
    .line 457
    .line 458
    move-result v0

    .line 459
    xor-int/2addr v0, v2

    .line 460
    invoke-static {p2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 461
    .line 462
    .line 463
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/binding/LiveVoiceAuctionLeaderboardItemBindings;->j:Lv/VDraweeView;

    .line 464
    .line 465
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;->otherUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;

    .line 466
    .line 467
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAuctionUserInfo;->tagImage:Ljava/lang/String;

    .line 468
    .line 469
    invoke-static {v1, p0, p1}, Ll/izs;->s(Ljava/lang/String;Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 470
    .line 471
    .line 472
    return-void
.end method

.method public final d(Ll/kom0;)V
    .locals 1
    .param p1    # Ll/kom0;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/kom0;->H()Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p1}, Ll/kom0;->I()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/live/livingroom/voice/call/auction/dialog/leaderboard/LiveVoiceAuctionLeaderboardListItem;->c(Lcom/p1/mobile/putong/live/base/data/BLiveAuctionLeaderboardItem;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
