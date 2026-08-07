.class public Ll/nsu;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ll/wvk0;Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;)V
    .locals 3

    .line 1
    iget-boolean v0, p1, Ll/knu;->f:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/stu;

    .line 6
    .line 7
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->i:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;

    .line 8
    .line 9
    invoke-direct {v0, p1, v1}, Ll/stu;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatWaitingOrderView;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 13
    .line 14
    .line 15
    new-instance v0, Ll/zvk0;

    .line 16
    .line 17
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;

    .line 18
    .line 19
    invoke-direct {v0, p1, v1}, Ll/zvk0;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatPreviewView;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 23
    .line 24
    .line 25
    new-instance v0, Ll/mgu;

    .line 26
    .line 27
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->l:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

    .line 28
    .line 29
    iget-object v2, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->j:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 30
    .line 31
    invoke-direct {v0, p1, v1, v2}, Ll/mgu;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 35
    .line 36
    .line 37
    new-instance v0, Ll/ics;

    .line 38
    .line 39
    invoke-direct {v0, p1}, Ll/ics;-><init>(Ll/knu;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_0
    new-instance v0, Ll/wgu;

    .line 47
    .line 48
    invoke-direct {v0, p1}, Ll/wgu;-><init>(Ll/knu;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 52
    .line 53
    .line 54
    new-instance v0, Ll/ziu;

    .line 55
    .line 56
    invoke-direct {v0, p1}, Ll/ziu;-><init>(Ll/knu;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 60
    .line 61
    .line 62
    iget-object v0, p1, Ll/knu;->e:Ll/xnu;

    .line 63
    .line 64
    invoke-virtual {v0}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->isFakeCall()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_1

    .line 73
    .line 74
    new-instance v0, Ll/yju;

    .line 75
    .line 76
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->l:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;

    .line 77
    .line 78
    invoke-direct {v0, p1, v1}, Ll/yju;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCalledView;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    iget-object v0, p1, Ll/knu;->e:Ll/xnu;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/xnu;->w()Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/VChatStartData;->isRandomMatch()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    new-instance v0, Ll/kru;

    .line 98
    .line 99
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->j:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 100
    .line 101
    invoke-direct {v0, p1, v1}, Ll/kru;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 105
    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_2
    new-instance v0, Ll/tgu;

    .line 109
    .line 110
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->j:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;

    .line 111
    .line 112
    invoke-direct {v0, p1, v1}, Ll/tgu;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatCallingView;)V

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 116
    .line 117
    .line 118
    :goto_0
    new-instance v0, Ll/vlu;

    .line 119
    .line 120
    invoke-direct {v0, p1}, Ll/vlu;-><init>(Ll/knu;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 124
    .line 125
    .line 126
    new-instance v0, Ll/soe0;

    .line 127
    .line 128
    invoke-direct {v0, p1}, Ll/soe0;-><init>(Ll/knu;)V

    .line 129
    .line 130
    .line 131
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 132
    .line 133
    .line 134
    new-instance v0, Ll/jgu;

    .line 135
    .line 136
    invoke-direct {v0, p1}, Ll/jgu;-><init>(Ll/knu;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 140
    .line 141
    .line 142
    :goto_1
    new-instance v0, Ll/gru;

    .line 143
    .line 144
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->b:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;

    .line 145
    .line 146
    invoke-direct {v0, p1, v1}, Ll/gru;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVideoChatPushView;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 150
    .line 151
    .line 152
    new-instance v0, Ll/cou;

    .line 153
    .line 154
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->c:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;

    .line 155
    .line 156
    invoke-direct {v0, p1, v1}, Ll/cou;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatInfoView;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 160
    .line 161
    .line 162
    new-instance v0, Ll/iqu;

    .line 163
    .line 164
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->f:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;

    .line 165
    .line 166
    iget-object v2, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->k:Lv/VImage;

    .line 167
    .line 168
    invoke-direct {v0, p1, v1, v2}, Ll/iqu;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatOptView;Lv/VImage;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 172
    .line 173
    .line 174
    new-instance v0, Ll/kou;

    .line 175
    .line 176
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->e:Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMessageView;

    .line 177
    .line 178
    invoke-direct {v0, p1, v1}, Ll/kou;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatMessageView;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 182
    .line 183
    .line 184
    new-instance v0, Ll/spu;

    .line 185
    .line 186
    invoke-direct {v0, p1}, Ll/spu;-><init>(Ll/knu;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 190
    .line 191
    .line 192
    new-instance v0, Ll/zsu;

    .line 193
    .line 194
    invoke-direct {v0, p1}, Ll/zsu;-><init>(Ll/knu;)V

    .line 195
    .line 196
    .line 197
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 198
    .line 199
    .line 200
    new-instance v0, Ll/nns;

    .line 201
    .line 202
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->g:Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;

    .line 203
    .line 204
    invoke-direct {v0, p1, v1}, Ll/nns;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/module/giftDialog/tray/LiveVChatGiftTrays;)V

    .line 205
    .line 206
    .line 207
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 208
    .line 209
    .line 210
    new-instance v0, Ll/mvk0;

    .line 211
    .line 212
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->m:Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;

    .line 213
    .line 214
    invoke-direct {v0, p1, v1}, Ll/mvk0;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/effect/LiveVChatGiftLayer;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 218
    .line 219
    .line 220
    new-instance v0, Ll/liu;

    .line 221
    .line 222
    iget-object v1, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->d:Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;

    .line 223
    .line 224
    invoke-direct {v0, p1, v1}, Ll/liu;-><init>(Ll/knu;Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 228
    .line 229
    .line 230
    new-instance v0, Ll/vuu;

    .line 231
    .line 232
    iget-object p2, p2, Lcom/p1/mobile/putong/live/external/internal/vchat/view/LiveVChatView;->h:Landroid/view/View;

    .line 233
    .line 234
    invoke-direct {v0, p1, p2}, Ll/vuu;-><init>(Ll/knu;Landroid/view/View;)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 238
    .line 239
    .line 240
    new-instance p2, Ll/gou;

    .line 241
    .line 242
    invoke-direct {p2, p1}, Ll/gou;-><init>(Ll/knu;)V

    .line 243
    .line 244
    .line 245
    invoke-virtual {p0, p2}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 246
    .line 247
    .line 248
    return-void
.end method
