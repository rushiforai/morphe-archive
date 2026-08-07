.class public Ll/a0s;
.super Ll/vn2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/vn2<",
        "Ll/mu40;",
        ">;"
    }
.end annotation


# instance fields
.field public x:Ll/jxd0;

.field public y:Ll/jxd0;


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "Ll/mu40;",
            ">;",
            "Lcom/p1/mobile/putong/live/livingroom/common/bubble/LiveBubbleView;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/vn2;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 7
    .line 8
    const-string v1, "bottom_setting_sticker_bubble_show"

    .line 9
    .line 10
    invoke-direct {p1, v1, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/a0s;->x:Ll/jxd0;

    .line 14
    .line 15
    new-instance p1, Ll/jxd0;

    .line 16
    .line 17
    const-string v1, "bottom_setting_song_game_bubble_show"

    .line 18
    .line 19
    invoke-direct {p1, v1, v0}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/a0s;->y:Ll/jxd0;

    .line 23
    .line 24
    invoke-virtual {p0, p2}, Ll/l6t;->C(Ll/iam;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public I4(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/vn2;->I4(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    const-string v0, "songGameNoticeBubble"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const-string v0, "stickerBubble"

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    iget-object p0, p0, Ll/a0s;->x:Ll/jxd0;

    .line 25
    .line 26
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    iget-object p0, p0, Ll/a0s;->y:Ll/jxd0;

    .line 33
    .line 34
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public k4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)Z
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;->type:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x1

    .line 12
    const/4 v4, -0x1

    .line 13
    sparse-switch v1, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    goto/16 :goto_0

    .line 17
    .line 18
    :sswitch_0
    const-string v1, "signInUpgradeBubble"

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    const/4 v4, 0x7

    .line 28
    goto :goto_0

    .line 29
    :sswitch_1
    const-string v1, "signInBubble"

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 v4, 0x6

    .line 39
    goto :goto_0

    .line 40
    :sswitch_2
    const-string v1, "firstRechargeBubble"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    const/4 v4, 0x5

    .line 50
    goto :goto_0

    .line 51
    :sswitch_3
    const-string v1, "stickerBubble"

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_3

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_3
    const/4 v4, 0x4

    .line 61
    goto :goto_0

    .line 62
    :sswitch_4
    const-string v1, "userDailyTaskBubble"

    .line 63
    .line 64
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_4

    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    const/4 v4, 0x3

    .line 72
    goto :goto_0

    .line 73
    :sswitch_5
    const-string v1, "songGameNoticeBubble"

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_5

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_5
    const/4 v4, 0x2

    .line 83
    goto :goto_0

    .line 84
    :sswitch_6
    const-string v1, "fastGiftButtonBubble"

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_6

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_6
    move v4, v3

    .line 94
    goto :goto_0

    .line 95
    :sswitch_7
    const-string v1, "localFollowLiveButtonBubble"

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_7

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_7
    move v4, v2

    .line 105
    :goto_0
    const/16 v0, 0x6a4

    .line 106
    .line 107
    packed-switch v4, :pswitch_data_0

    .line 108
    .line 109
    .line 110
    invoke-super {p0, p1, p2}, Ll/g4;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    return p0

    .line 115
    :pswitch_0
    iget-object p1, p0, Ll/a0s;->x:Ll/jxd0;

    .line 116
    .line 117
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Ljava/lang/Boolean;

    .line 122
    .line 123
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-nez p1, :cond_8

    .line 128
    .line 129
    new-instance p1, Ll/i5g0;

    .line 130
    .line 131
    invoke-direct {p1, v0}, Ll/i5g0;-><init>(I)V

    .line 132
    .line 133
    .line 134
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    check-cast p0, Ljava/lang/Boolean;

    .line 139
    .line 140
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    if-eqz p0, :cond_8

    .line 145
    .line 146
    return v3

    .line 147
    :cond_8
    :pswitch_1
    return v2

    .line 148
    :pswitch_2
    iget-object p1, p0, Ll/a0s;->y:Ll/jxd0;

    .line 149
    .line 150
    invoke-virtual {p1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    check-cast p1, Ljava/lang/Boolean;

    .line 155
    .line 156
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    if-nez p1, :cond_9

    .line 161
    .line 162
    new-instance p1, Ll/re3;

    .line 163
    .line 164
    invoke-direct {p1, v0}, Ll/re3;-><init>(I)V

    .line 165
    .line 166
    .line 167
    invoke-virtual {p0, p1}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    check-cast p0, Ljava/lang/Boolean;

    .line 172
    .line 173
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    if-eqz p0, :cond_9

    .line 178
    .line 179
    return v3

    .line 180
    :cond_9
    return v2

    .line 181
    :pswitch_3
    sget-object v0, Ll/htd0;->f:Ll/htd0;

    .line 182
    .line 183
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    check-cast v0, Ll/civ;

    .line 188
    .line 189
    invoke-virtual {v0}, Ll/civ;->j()Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-nez v0, :cond_a

    .line 194
    .line 195
    invoke-super {p0, p1, p2}, Ll/g4;->k4(Lcom/p1/mobile/putong/live/base/data/BLiveBubbleConfig;Ll/gg3;)Z

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    if-eqz p0, :cond_a

    .line 200
    .line 201
    return v3

    .line 202
    :cond_a
    return v2

    .line 203
    :pswitch_4
    return v3

    .line 204
    nop

    .line 205
    :sswitch_data_0
    .sparse-switch
        -0x797a8b7a -> :sswitch_7
        -0x4bd98bd6 -> :sswitch_6
        -0xee19635 -> :sswitch_5
        0xc21ea1f -> :sswitch_4
        0x25c50829 -> :sswitch_3
        0x2aa270e3 -> :sswitch_2
        0x56f0b2ee -> :sswitch_1
        0x692ca526 -> :sswitch_0
    .end sparse-switch

    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_4
        :pswitch_1
        :pswitch_1
    .end packed-switch
.end method
