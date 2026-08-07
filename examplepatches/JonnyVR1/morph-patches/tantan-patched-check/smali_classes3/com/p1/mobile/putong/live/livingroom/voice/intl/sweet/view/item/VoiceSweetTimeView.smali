.class public Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/TextView;

.field public b:Landroid/widget/TextView;

.field public c:Landroid/widget/TextView;

.field public d:Landroid/widget/TextView;

.field public e:Landroid/widget/TextView;

.field public f:Landroid/widget/TextView;


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
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/n2p0;->a(Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(JZ)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    div-long/2addr p1, v0

    .line 4
    const-wide/32 v0, 0x15180

    .line 5
    .line 6
    .line 7
    div-long v0, p1, v0

    .line 8
    .line 9
    long-to-int v0, v0

    .line 10
    const v1, 0x15180

    .line 11
    .line 12
    .line 13
    mul-int/2addr v1, v0

    .line 14
    int-to-long v1, v1

    .line 15
    sub-long/2addr p1, v1

    .line 16
    const-wide/16 v1, 0xe10

    .line 17
    .line 18
    div-long v1, p1, v1

    .line 19
    .line 20
    long-to-int v1, v1

    .line 21
    mul-int/lit16 v2, v1, 0xe10

    .line 22
    .line 23
    int-to-long v2, v2

    .line 24
    sub-long/2addr p1, v2

    .line 25
    const-wide/16 v2, 0x3c

    .line 26
    .line 27
    div-long/2addr p1, v2

    .line 28
    long-to-int p1, p1

    .line 29
    const/16 p2, 0x63

    .line 30
    .line 31
    const-string v2, "%02d"

    .line 32
    .line 33
    if-le v0, p2, :cond_0

    .line 34
    .line 35
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    goto :goto_0

    .line 40
    :cond_0
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    filled-new-array {p2}, [Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {v2, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    :goto_0
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {v2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->a:Landroid/widget/TextView;

    .line 77
    .line 78
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    .line 80
    .line 81
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->c:Landroid/widget/TextView;

    .line 82
    .line 83
    invoke-virtual {p2, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 84
    .line 85
    .line 86
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->e:Landroid/widget/TextView;

    .line 87
    .line 88
    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 89
    .line 90
    .line 91
    if-nez p3, :cond_1

    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->a:Landroid/widget/TextView;

    .line 94
    .line 95
    sget p2, Ll/n9c0;->w1:I

    .line 96
    .line 97
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 102
    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->c:Landroid/widget/TextView;

    .line 105
    .line 106
    sget p2, Ll/n9c0;->w1:I

    .line 107
    .line 108
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 109
    .line 110
    .line 111
    move-result p2

    .line 112
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 113
    .line 114
    .line 115
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->e:Landroid/widget/TextView;

    .line 116
    .line 117
    sget p2, Ll/n9c0;->w1:I

    .line 118
    .line 119
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 120
    .line 121
    .line 122
    move-result p2

    .line 123
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->a:Landroid/widget/TextView;

    .line 127
    .line 128
    sget p2, Ll/obc0;->d8:I

    .line 129
    .line 130
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->c:Landroid/widget/TextView;

    .line 134
    .line 135
    sget p2, Ll/obc0;->d8:I

    .line 136
    .line 137
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->e:Landroid/widget/TextView;

    .line 141
    .line 142
    sget p2, Ll/obc0;->d8:I

    .line 143
    .line 144
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundResource(I)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->b:Landroid/widget/TextView;

    .line 148
    .line 149
    sget p2, Ll/n9c0;->o0:I

    .line 150
    .line 151
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 152
    .line 153
    .line 154
    move-result p2

    .line 155
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 156
    .line 157
    .line 158
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->d:Landroid/widget/TextView;

    .line 159
    .line 160
    sget p2, Ll/n9c0;->o0:I

    .line 161
    .line 162
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 163
    .line 164
    .line 165
    move-result p2

    .line 166
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 167
    .line 168
    .line 169
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->f:Landroid/widget/TextView;

    .line 170
    .line 171
    sget p2, Ll/n9c0;->o0:I

    .line 172
    .line 173
    invoke-static {p2}, Ll/n3d0;->a(I)I

    .line 174
    .line 175
    .line 176
    move-result p2

    .line 177
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 178
    .line 179
    .line 180
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->a:Landroid/widget/TextView;

    .line 181
    .line 182
    const/high16 p2, 0x41400000    # 12.0f

    .line 183
    .line 184
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 185
    .line 186
    .line 187
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->c:Landroid/widget/TextView;

    .line 188
    .line 189
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 190
    .line 191
    .line 192
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->e:Landroid/widget/TextView;

    .line 193
    .line 194
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 195
    .line 196
    .line 197
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->b:Landroid/widget/TextView;

    .line 198
    .line 199
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 200
    .line 201
    .line 202
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->d:Landroid/widget/TextView;

    .line 203
    .line 204
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 205
    .line 206
    .line 207
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->f:Landroid/widget/TextView;

    .line 208
    .line 209
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTextSize(F)V

    .line 210
    .line 211
    .line 212
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->b:Landroid/widget/TextView;

    .line 213
    .line 214
    sget p2, Ll/qa00;->d:I

    .line 215
    .line 216
    invoke-static {p1, p2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 217
    .line 218
    .line 219
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->b:Landroid/widget/TextView;

    .line 220
    .line 221
    invoke-static {p1, p2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 222
    .line 223
    .line 224
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->d:Landroid/widget/TextView;

    .line 225
    .line 226
    invoke-static {p1, p2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 227
    .line 228
    .line 229
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->d:Landroid/widget/TextView;

    .line 230
    .line 231
    invoke-static {p1, p2}, Ll/bnl0;->W(Landroid/view/View;I)V

    .line 232
    .line 233
    .line 234
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->f:Landroid/widget/TextView;

    .line 235
    .line 236
    invoke-static {p1, p2}, Ll/bnl0;->V(Landroid/view/View;I)V

    .line 237
    .line 238
    .line 239
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->a:Landroid/widget/TextView;

    .line 240
    .line 241
    sget p2, Ll/qa00;->n:I

    .line 242
    .line 243
    invoke-static {p1, p2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 244
    .line 245
    .line 246
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->c:Landroid/widget/TextView;

    .line 247
    .line 248
    invoke-static {p1, p2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 249
    .line 250
    .line 251
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->e:Landroid/widget/TextView;

    .line 252
    .line 253
    invoke-static {p1, p2}, Ll/bnl0;->C0(Landroid/view/View;I)V

    .line 254
    .line 255
    .line 256
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->a:Landroid/widget/TextView;

    .line 257
    .line 258
    invoke-virtual {p1, p2}, Landroid/view/View;->setMinimumWidth(I)V

    .line 259
    .line 260
    .line 261
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->c:Landroid/widget/TextView;

    .line 262
    .line 263
    invoke-virtual {p1, p2}, Landroid/view/View;->setMinimumWidth(I)V

    .line 264
    .line 265
    .line 266
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->e:Landroid/widget/TextView;

    .line 267
    .line 268
    invoke-virtual {p1, p2}, Landroid/view/View;->setMinimumWidth(I)V

    .line 269
    .line 270
    .line 271
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->a:Landroid/widget/TextView;

    .line 272
    .line 273
    const/high16 p2, 0x40200000    # 2.5f

    .line 274
    .line 275
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 276
    .line 277
    .line 278
    move-result p3

    .line 279
    invoke-static {p1, p3}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 280
    .line 281
    .line 282
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->a:Landroid/widget/TextView;

    .line 283
    .line 284
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 285
    .line 286
    .line 287
    move-result p3

    .line 288
    invoke-static {p1, p3}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 289
    .line 290
    .line 291
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->c:Landroid/widget/TextView;

    .line 292
    .line 293
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 294
    .line 295
    .line 296
    move-result p3

    .line 297
    invoke-static {p1, p3}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 298
    .line 299
    .line 300
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->c:Landroid/widget/TextView;

    .line 301
    .line 302
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 303
    .line 304
    .line 305
    move-result p3

    .line 306
    invoke-static {p1, p3}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 307
    .line 308
    .line 309
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->e:Landroid/widget/TextView;

    .line 310
    .line 311
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 312
    .line 313
    .line 314
    move-result p3

    .line 315
    invoke-static {p1, p3}, Ll/bnl0;->d0(Landroid/view/View;I)V

    .line 316
    .line 317
    .line 318
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->e:Landroid/widget/TextView;

    .line 319
    .line 320
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 321
    .line 322
    .line 323
    move-result p1

    .line 324
    invoke-static {p0, p1}, Ll/bnl0;->e0(Landroid/view/View;I)V

    .line 325
    .line 326
    .line 327
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/voice/intl/sweet/view/item/VoiceSweetTimeView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
