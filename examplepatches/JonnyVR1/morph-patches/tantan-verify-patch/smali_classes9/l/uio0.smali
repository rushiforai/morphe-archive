.class public Ll/uio0;
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

.method public static a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;Landroid/view/View;)V
    .locals 7

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->a:Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Lv/VRelative;

    .line 14
    .line 15
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->b:Lv/VRelative;

    .line 16
    .line 17
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    check-cast v1, Landroid/view/ViewGroup;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Landroid/widget/ImageView;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->c:Landroid/widget/ImageView;

    .line 30
    .line 31
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Landroid/view/ViewGroup;

    .line 36
    .line 37
    const/4 v2, 0x1

    .line 38
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lv/VText;

    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->d:Lv/VText;

    .line 45
    .line 46
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Landroid/view/ViewGroup;

    .line 51
    .line 52
    const/4 v3, 0x2

    .line 53
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lv/VText;

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->e:Lv/VText;

    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    check-cast v1, Landroid/view/ViewGroup;

    .line 66
    .line 67
    const/4 v4, 0x3

    .line 68
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Landroid/widget/FrameLayout;

    .line 73
    .line 74
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->f:Landroid/widget/FrameLayout;

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Landroid/view/ViewGroup;

    .line 81
    .line 82
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    check-cast v1, Landroid/view/ViewGroup;

    .line 87
    .line 88
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    check-cast v1, Lv/VEditText;

    .line 93
    .line 94
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->g:Lv/VEditText;

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    check-cast v1, Landroid/view/ViewGroup;

    .line 101
    .line 102
    invoke-virtual {v1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    check-cast v1, Landroid/view/ViewGroup;

    .line 107
    .line 108
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    check-cast v1, Lv/VEditText;

    .line 113
    .line 114
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->h:Lv/VEditText;

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    check-cast v1, Landroid/view/ViewGroup;

    .line 121
    .line 122
    const/4 v5, 0x4

    .line 123
    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    check-cast v1, Lv/VText;

    .line 128
    .line 129
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->i:Lv/VText;

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    check-cast v1, Landroid/view/ViewGroup;

    .line 136
    .line 137
    const/4 v6, 0x5

    .line 138
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    check-cast v1, Lv/VText;

    .line 143
    .line 144
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->j:Lv/VText;

    .line 145
    .line 146
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    check-cast v1, Landroid/view/ViewGroup;

    .line 151
    .line 152
    const/4 v6, 0x6

    .line 153
    invoke-virtual {v1, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    check-cast v1, Lv/VText;

    .line 158
    .line 159
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->k:Lv/VText;

    .line 160
    .line 161
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    check-cast v1, Lv/VScroll;

    .line 166
    .line 167
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->l:Lv/VScroll;

    .line 168
    .line 169
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    check-cast v1, Landroid/view/ViewGroup;

    .line 174
    .line 175
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    check-cast v1, Lorg/apmem/tools/layouts/FlowLayout;

    .line 180
    .line 181
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->m:Lorg/apmem/tools/layouts/FlowLayout;

    .line 182
    .line 183
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    check-cast v1, Lv/VLinear;

    .line 188
    .line 189
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->n:Lv/VLinear;

    .line 190
    .line 191
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    check-cast v1, Landroid/view/ViewGroup;

    .line 196
    .line 197
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    check-cast v1, Landroid/view/ViewGroup;

    .line 202
    .line 203
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    check-cast v1, Lv/VImage;

    .line 208
    .line 209
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->o:Lv/VImage;

    .line 210
    .line 211
    invoke-virtual {p1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 212
    .line 213
    .line 214
    move-result-object v1

    .line 215
    check-cast v1, Landroid/view/ViewGroup;

    .line 216
    .line 217
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    check-cast v1, Lv/VLinear;

    .line 222
    .line 223
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->p:Lv/VLinear;

    .line 224
    .line 225
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    check-cast v1, Lv/VText;

    .line 230
    .line 231
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->q:Lv/VText;

    .line 232
    .line 233
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 234
    .line 235
    .line 236
    move-result-object v1

    .line 237
    check-cast v1, Lv/VLinear;

    .line 238
    .line 239
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->r:Lv/VLinear;

    .line 240
    .line 241
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    check-cast v1, Landroid/view/ViewGroup;

    .line 246
    .line 247
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    check-cast v0, Landroid/widget/TextView;

    .line 252
    .line 253
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->s:Landroid/widget/TextView;

    .line 254
    .line 255
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    check-cast p1, Landroid/view/ViewGroup;

    .line 260
    .line 261
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    check-cast p1, Landroid/widget/TextView;

    .line 266
    .line 267
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/preview/VoicePreviewViewModel;->t:Landroid/widget/TextView;

    .line 268
    .line 269
    return-void
.end method
