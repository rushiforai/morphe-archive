.class Ll/diw$f;
.super Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/diw;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/diw;


# direct methods
.method public constructor <init>(Ll/diw;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/diw$f;->a:Ll/diw;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private a(Landroid/hardware/camera2/CaptureResult;)V
    .locals 8

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p0, Ll/diw$f;->a:Ll/diw;

    .line 7
    .line 8
    invoke-static {v1}, Ll/diw;->I(Ll/diw;)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    const-string v4, "Camera"

    .line 15
    .line 16
    if-eqz v1, :cond_a

    .line 17
    .line 18
    const/4 v0, 0x1

    .line 19
    const/4 v5, 0x2

    .line 20
    const/4 v6, 0x5

    .line 21
    const/4 v7, 0x4

    .line 22
    if-eq v1, v0, :cond_4

    .line 23
    .line 24
    const/4 v0, 0x3

    .line 25
    if-eq v1, v5, :cond_2

    .line 26
    .line 27
    if-eq v1, v0, :cond_0

    .line 28
    .line 29
    goto/16 :goto_0

    .line 30
    .line 31
    :cond_0
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 32
    .line 33
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Ljava/lang/Integer;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    if-ne p1, v6, :cond_1

    .line 46
    .line 47
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 48
    .line 49
    .line 50
    move-result-wide v0

    .line 51
    iget-object p1, p0, Ll/diw$f;->a:Ll/diw;

    .line 52
    .line 53
    invoke-static {p1}, Ll/diw;->K(Ll/diw;)J

    .line 54
    .line 55
    .line 56
    move-result-wide v2

    .line 57
    sub-long/2addr v0, v2

    .line 58
    const-wide/16 v2, 0xc8

    .line 59
    .line 60
    cmp-long p1, v0, v2

    .line 61
    .line 62
    if-lez p1, :cond_6

    .line 63
    .line 64
    :cond_1
    iget-object p1, p0, Ll/diw$f;->a:Ll/diw;

    .line 65
    .line 66
    invoke-static {p1, v7}, Ll/diw;->J(Ll/diw;I)I

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Ll/diw$f;->a:Ll/diw;

    .line 70
    .line 71
    invoke-static {p0}, Ll/diw;->P(Ll/diw;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_2
    iget-object v1, p0, Ll/diw$f;->a:Ll/diw;

    .line 76
    .line 77
    invoke-static {v1, v2, v3}, Ll/diw;->L(Ll/diw;J)J

    .line 78
    .line 79
    .line 80
    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 81
    .line 82
    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    check-cast p1, Ljava/lang/Integer;

    .line 87
    .line 88
    if-eqz p1, :cond_3

    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-eq v1, v6, :cond_3

    .line 95
    .line 96
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    if-ne p1, v7, :cond_6

    .line 101
    .line 102
    :cond_3
    iget-object p1, p0, Ll/diw$f;->a:Ll/diw;

    .line 103
    .line 104
    invoke-static {p1, v0}, Ll/diw;->J(Ll/diw;I)I

    .line 105
    .line 106
    .line 107
    iget-object p0, p0, Ll/diw$f;->a:Ll/diw;

    .line 108
    .line 109
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 110
    .line 111
    .line 112
    move-result-wide v0

    .line 113
    invoke-static {p0, v0, v1}, Ll/diw;->L(Ll/diw;J)J

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_4
    iget-object v0, p0, Ll/diw$f;->a:Ll/diw;

    .line 118
    .line 119
    invoke-static {v0, v2, v3}, Ll/diw;->L(Ll/diw;J)J

    .line 120
    .line 121
    .line 122
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Ljava/lang/Integer;

    .line 129
    .line 130
    if-nez v0, :cond_5

    .line 131
    .line 132
    const-string p1, "CaptureResult.null"

    .line 133
    .line 134
    invoke-static {v4, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    iget-object p0, p0, Ll/diw$f;->a:Ll/diw;

    .line 138
    .line 139
    invoke-static {p0}, Ll/diw;->P(Ll/diw;)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_5
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eq v7, v1, :cond_7

    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-ne v6, v0, :cond_6

    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_6
    :goto_0
    return-void

    .line 157
    :cond_7
    :goto_1
    sget-object v0, Landroid/hardware/camera2/CaptureResult;->CONTROL_AE_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 158
    .line 159
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    check-cast p1, Ljava/lang/Integer;

    .line 164
    .line 165
    if-eqz p1, :cond_9

    .line 166
    .line 167
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-ne p1, v5, :cond_8

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_8
    const-string p1, "CaptureResult.null stick taken"

    .line 175
    .line 176
    invoke-static {v4, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    iget-object p0, p0, Ll/diw$f;->a:Ll/diw;

    .line 180
    .line 181
    invoke-static {p0}, Ll/diw;->R(Ll/diw;)V

    .line 182
    .line 183
    .line 184
    return-void

    .line 185
    :cond_9
    :goto_2
    iget-object p1, p0, Ll/diw$f;->a:Ll/diw;

    .line 186
    .line 187
    invoke-static {p1, v7}, Ll/diw;->J(Ll/diw;I)I

    .line 188
    .line 189
    .line 190
    const-string p1, "CaptureResult.still taken"

    .line 191
    .line 192
    invoke-static {v4, p1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    iget-object p0, p0, Ll/diw$f;->a:Ll/diw;

    .line 196
    .line 197
    invoke-static {p0}, Ll/diw;->P(Ll/diw;)V

    .line 198
    .line 199
    .line 200
    return-void

    .line 201
    :cond_a
    iget-object v1, p0, Ll/diw$f;->a:Ll/diw;

    .line 202
    .line 203
    invoke-static {v1, v2, v3}, Ll/diw;->L(Ll/diw;J)J

    .line 204
    .line 205
    .line 206
    sget-object v1, Landroid/hardware/camera2/CaptureResult;->CONTROL_AF_STATE:Landroid/hardware/camera2/CaptureResult$Key;

    .line 207
    .line 208
    invoke-virtual {p1, v1}, Landroid/hardware/camera2/CaptureResult;->get(Landroid/hardware/camera2/CaptureResult$Key;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    check-cast p1, Ljava/lang/Integer;

    .line 213
    .line 214
    if-eqz p1, :cond_b

    .line 215
    .line 216
    iget-object v1, p0, Ll/diw$f;->a:Ll/diw;

    .line 217
    .line 218
    invoke-static {v1}, Ll/diw;->M(Ll/diw;)Ljava/lang/Integer;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-virtual {p1, v1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    if-nez v1, :cond_b

    .line 227
    .line 228
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 229
    .line 230
    .line 231
    move-result v1

    .line 232
    packed-switch v1, :pswitch_data_0

    .line 233
    .line 234
    .line 235
    goto :goto_3

    .line 236
    :pswitch_0
    const-string v0, "CaptureResult.CONTROL_AF_STATE_PASSIVE_UNFOCUSED"

    .line 237
    .line 238
    invoke-static {v4, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    goto :goto_3

    .line 242
    :pswitch_1
    iget-object v1, p0, Ll/diw$f;->a:Ll/diw;

    .line 243
    .line 244
    invoke-static {v1}, Ll/diw;->O(Ll/diw;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 249
    .line 250
    invoke-virtual {v1, v2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 251
    .line 252
    .line 253
    iget-object v0, p0, Ll/diw$f;->a:Ll/diw;

    .line 254
    .line 255
    invoke-static {v0}, Ll/diw;->G(Ll/diw;)V

    .line 256
    .line 257
    .line 258
    const-string v0, "CaptureResult.CONTROL_AF_STATE_NOT_FOCUSED_LOCKED"

    .line 259
    .line 260
    invoke-static {v4, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    goto :goto_3

    .line 264
    :pswitch_2
    iget-object v1, p0, Ll/diw$f;->a:Ll/diw;

    .line 265
    .line 266
    invoke-static {v1}, Ll/diw;->O(Ll/diw;)Landroid/hardware/camera2/CaptureRequest$Builder;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    sget-object v2, Landroid/hardware/camera2/CaptureRequest;->CONTROL_AF_TRIGGER:Landroid/hardware/camera2/CaptureRequest$Key;

    .line 271
    .line 272
    invoke-virtual {v1, v2, v0}, Landroid/hardware/camera2/CaptureRequest$Builder;->set(Landroid/hardware/camera2/CaptureRequest$Key;Ljava/lang/Object;)V

    .line 273
    .line 274
    .line 275
    iget-object v0, p0, Ll/diw$f;->a:Ll/diw;

    .line 276
    .line 277
    invoke-static {v0}, Ll/diw;->G(Ll/diw;)V

    .line 278
    .line 279
    .line 280
    const-string v0, "CaptureResult.CONTROL_AF_STATE_FOCUSED_LOCKED"

    .line 281
    .line 282
    invoke-static {v4, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    goto :goto_3

    .line 286
    :pswitch_3
    const-string v0, "CaptureResult.CONTROL_AF_STATE_ACTIVE_SCAN"

    .line 287
    .line 288
    invoke-static {v4, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    goto :goto_3

    .line 292
    :pswitch_4
    const-string v0, "CaptureResult.CONTROL_AF_STATE_PASSIVE_FOCUSED"

    .line 293
    .line 294
    invoke-static {v4, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 295
    .line 296
    .line 297
    goto :goto_3

    .line 298
    :pswitch_5
    const-string v0, "CaptureResult.CONTROL_AF_STATE_PASSIVE_SCAN"

    .line 299
    .line 300
    invoke-static {v4, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    goto :goto_3

    .line 304
    :pswitch_6
    const-string v0, "CaptureResult.CONTROL_AF_STATE_INACTIVE"

    .line 305
    .line 306
    invoke-static {v4, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    :cond_b
    :goto_3
    iget-object p0, p0, Ll/diw$f;->a:Ll/diw;

    .line 310
    .line 311
    invoke-static {p0, p1}, Ll/diw;->N(Ll/diw;Ljava/lang/Integer;)Ljava/lang/Integer;

    .line 312
    .line 313
    .line 314
    return-void

    .line 315
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method public onCaptureCompleted(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/TotalCaptureResult;)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/TotalCaptureResult;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p3}, Ll/diw$f;->a(Landroid/hardware/camera2/CaptureResult;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onCaptureProgressed(Landroid/hardware/camera2/CameraCaptureSession;Landroid/hardware/camera2/CaptureRequest;Landroid/hardware/camera2/CaptureResult;)V
    .locals 0
    .param p1    # Landroid/hardware/camera2/CameraCaptureSession;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/hardware/camera2/CaptureRequest;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/hardware/camera2/CaptureResult;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p3}, Ll/diw$f;->a(Landroid/hardware/camera2/CaptureResult;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
