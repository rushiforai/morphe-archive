.class Ltv/danmaku/ijk/media/source/CameraSource$4$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltv/danmaku/ijk/media/source/CameraSource$4;->onPreviewFrame([BLandroid/hardware/Camera;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:[B

.field final synthetic b:Ltv/danmaku/ijk/media/source/CameraSource$4;


# direct methods
.method public constructor <init>(Ltv/danmaku/ijk/media/source/CameraSource$4;[B)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 2
    .line 3
    iput-object p2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->a:[B

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    const-string v0, "onPreviewFrame mDofaceDetect:"

    .line 2
    .line 3
    iget-object v1, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 4
    .line 5
    iget-object v1, v1, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 6
    .line 7
    invoke-static {v1}, Ltv/danmaku/ijk/media/source/CameraSource;->k0(Ltv/danmaku/ijk/media/source/CameraSource;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    monitor-enter v1

    .line 12
    :try_start_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 13
    .line 14
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 15
    .line 16
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->j0(Ltv/danmaku/ijk/media/source/CameraSource;)Landroid/hardware/Camera;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-eqz v2, :cond_4

    .line 21
    .line 22
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->a:[B

    .line 23
    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    goto/16 :goto_2

    .line 27
    .line 28
    :cond_0
    const-string v2, "VideoSource"

    .line 29
    .line 30
    new-instance v3, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 36
    .line 37
    iget-object v0, v0, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 38
    .line 39
    invoke-static {v0}, Ltv/danmaku/ijk/media/source/CameraSource;->l0(Ltv/danmaku/ijk/media/source/CameraSource;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v2, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    new-instance v0, Ll/omw;

    .line 54
    .line 55
    invoke-direct {v0}, Ll/omw;-><init>()V

    .line 56
    .line 57
    .line 58
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 59
    .line 60
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 61
    .line 62
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->l0(Ltv/danmaku/ijk/media/source/CameraSource;)Z

    .line 63
    .line 64
    .line 65
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 66
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 67
    .line 68
    if-eqz v2, :cond_3

    .line 69
    .line 70
    :try_start_1
    iget-object v2, v3, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 71
    .line 72
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->m0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/umw;

    .line 73
    .line 74
    .line 75
    move-result-object v2

    .line 76
    const/16 v3, 0x11

    .line 77
    .line 78
    invoke-virtual {v2, v3}, Ll/umw;->h(I)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 82
    .line 83
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 84
    .line 85
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->m0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/umw;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 90
    .line 91
    iget-object v3, v3, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 92
    .line 93
    iget v3, v3, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 94
    .line 95
    invoke-virtual {v2, v3}, Ll/umw;->m(I)V

    .line 96
    .line 97
    .line 98
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 99
    .line 100
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 101
    .line 102
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->m0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/umw;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 107
    .line 108
    iget-object v3, v3, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 109
    .line 110
    iget v3, v3, Ltv/danmaku/ijk/media/source/CameraSource;->z:I

    .line 111
    .line 112
    invoke-virtual {v2, v3}, Ll/umw;->j(I)V

    .line 113
    .line 114
    .line 115
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 116
    .line 117
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 118
    .line 119
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->m0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/umw;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->a:[B

    .line 124
    .line 125
    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 126
    .line 127
    .line 128
    move-result-object v3

    .line 129
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->array()[B

    .line 130
    .line 131
    .line 132
    move-result-object v3

    .line 133
    invoke-virtual {v2, v3}, Ll/umw;->g([B)V

    .line 134
    .line 135
    .line 136
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 137
    .line 138
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 139
    .line 140
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->m0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/umw;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->a:[B

    .line 145
    .line 146
    array-length v3, v3

    .line 147
    invoke-virtual {v2, v3}, Ll/umw;->f(I)V

    .line 148
    .line 149
    .line 150
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 151
    .line 152
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 153
    .line 154
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->m0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/umw;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 159
    .line 160
    iget-object v3, v3, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 161
    .line 162
    iget v3, v3, Ltv/danmaku/ijk/media/source/CameraSource;->y:I

    .line 163
    .line 164
    invoke-virtual {v2, v3}, Ll/umw;->l(I)V

    .line 165
    .line 166
    .line 167
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 168
    .line 169
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 170
    .line 171
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 176
    .line 177
    iget-object v3, v3, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 178
    .line 179
    iget v3, v3, Ltv/danmaku/ijk/media/source/CameraSource;->t:I

    .line 180
    .line 181
    mul-int/lit8 v3, v3, 0x5a

    .line 182
    .line 183
    invoke-virtual {v2, v3}, Ll/lnw;->A(I)V

    .line 184
    .line 185
    .line 186
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 187
    .line 188
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 189
    .line 190
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 195
    .line 196
    iget-object v3, v3, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 197
    .line 198
    iget v3, v3, Ltv/danmaku/ijk/media/source/CameraSource;->t:I

    .line 199
    .line 200
    mul-int/lit8 v3, v3, 0x5a

    .line 201
    .line 202
    invoke-virtual {v2, v3}, Ll/lnw;->z(I)V

    .line 203
    .line 204
    .line 205
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 206
    .line 207
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 208
    .line 209
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 214
    .line 215
    iget-object v3, v3, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 216
    .line 217
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/CameraSource;->o0(Ltv/danmaku/ijk/media/source/CameraSource;)Z

    .line 218
    .line 219
    .line 220
    move-result v3

    .line 221
    invoke-virtual {v2, v3}, Ll/lnw;->p(Z)V

    .line 222
    .line 223
    .line 224
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 225
    .line 226
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 227
    .line 228
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;

    .line 229
    .line 230
    .line 231
    move-result-object v2

    .line 232
    const/4 v3, 0x0

    .line 233
    invoke-virtual {v2, v3}, Ll/lnw;->k(Z)V

    .line 234
    .line 235
    .line 236
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 237
    .line 238
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 239
    .line 240
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    const/4 v4, 0x1

    .line 245
    invoke-virtual {v2, v4}, Ll/lnw;->i(Z)V

    .line 246
    .line 247
    .line 248
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 249
    .line 250
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 251
    .line 252
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 257
    .line 258
    iget-object v5, v5, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 259
    .line 260
    invoke-static {v5}, Ltv/danmaku/ijk/media/source/CameraSource;->p0(Ltv/danmaku/ijk/media/source/CameraSource;)Z

    .line 261
    .line 262
    .line 263
    move-result v5

    .line 264
    invoke-virtual {v2, v5}, Ll/lnw;->l(Z)V

    .line 265
    .line 266
    .line 267
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 268
    .line 269
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 270
    .line 271
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;

    .line 272
    .line 273
    .line 274
    move-result-object v2

    .line 275
    invoke-virtual {v2, v4}, Ll/lnw;->F(Z)V

    .line 276
    .line 277
    .line 278
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 279
    .line 280
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 281
    .line 282
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;

    .line 283
    .line 284
    .line 285
    move-result-object v2

    .line 286
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 287
    .line 288
    iget-object v5, v5, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 289
    .line 290
    invoke-static {v5}, Ltv/danmaku/ijk/media/source/CameraSource;->S(Ltv/danmaku/ijk/media/source/CameraSource;)I

    .line 291
    .line 292
    .line 293
    move-result v5

    .line 294
    invoke-virtual {v2, v5}, Ll/lnw;->M(I)V

    .line 295
    .line 296
    .line 297
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 298
    .line 299
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 300
    .line 301
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 306
    .line 307
    iget-object v5, v5, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 308
    .line 309
    invoke-static {v5}, Ltv/danmaku/ijk/media/source/CameraSource;->T(Ltv/danmaku/ijk/media/source/CameraSource;)F

    .line 310
    .line 311
    .line 312
    move-result v5

    .line 313
    invoke-virtual {v2, v5}, Ll/lnw;->K(F)V

    .line 314
    .line 315
    .line 316
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 317
    .line 318
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 319
    .line 320
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;

    .line 321
    .line 322
    .line 323
    move-result-object v2

    .line 324
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 325
    .line 326
    iget-object v5, v5, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 327
    .line 328
    invoke-static {v5}, Ltv/danmaku/ijk/media/source/CameraSource;->U(Ltv/danmaku/ijk/media/source/CameraSource;)F

    .line 329
    .line 330
    .line 331
    move-result v5

    .line 332
    invoke-virtual {v2, v5}, Ll/lnw;->L(F)V

    .line 333
    .line 334
    .line 335
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 336
    .line 337
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 338
    .line 339
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;

    .line 340
    .line 341
    .line 342
    move-result-object v2

    .line 343
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 344
    .line 345
    iget-object v5, v5, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 346
    .line 347
    invoke-static {v5}, Ltv/danmaku/ijk/media/source/CameraSource;->V(Ltv/danmaku/ijk/media/source/CameraSource;)Z

    .line 348
    .line 349
    .line 350
    move-result v5

    .line 351
    invoke-virtual {v2, v5}, Ll/lnw;->G(Z)V

    .line 352
    .line 353
    .line 354
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 355
    .line 356
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 357
    .line 358
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;

    .line 359
    .line 360
    .line 361
    move-result-object v2

    .line 362
    invoke-virtual {v2, v4}, Ll/lnw;->h(Z)V

    .line 363
    .line 364
    .line 365
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 366
    .line 367
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 368
    .line 369
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->W(Ltv/danmaku/ijk/media/source/CameraSource;)Lcom/momocv/videoprocessor/VideoProcessor;

    .line 370
    .line 371
    .line 372
    move-result-object v2

    .line 373
    if-nez v2, :cond_1

    .line 374
    .line 375
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 376
    .line 377
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 378
    .line 379
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->Y(Ltv/danmaku/ijk/media/source/CameraSource;)Ljava/util/List;

    .line 380
    .line 381
    .line 382
    move-result-object v2

    .line 383
    if-eqz v2, :cond_1

    .line 384
    .line 385
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 386
    .line 387
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 388
    .line 389
    new-instance v5, Lcom/momocv/videoprocessor/VideoProcessor;

    .line 390
    .line 391
    invoke-direct {v5}, Lcom/momocv/videoprocessor/VideoProcessor;-><init>()V

    .line 392
    .line 393
    .line 394
    invoke-static {v2, v5}, Ltv/danmaku/ijk/media/source/CameraSource;->X(Ltv/danmaku/ijk/media/source/CameraSource;Lcom/momocv/videoprocessor/VideoProcessor;)Lcom/momocv/videoprocessor/VideoProcessor;

    .line 395
    .line 396
    .line 397
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 398
    .line 399
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 400
    .line 401
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->Y(Ltv/danmaku/ijk/media/source/CameraSource;)Ljava/util/List;

    .line 402
    .line 403
    .line 404
    move-result-object v2

    .line 405
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 406
    .line 407
    .line 408
    move-result v2

    .line 409
    const/4 v5, 0x2

    .line 410
    if-lt v2, v5, :cond_1

    .line 411
    .line 412
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 413
    .line 414
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 415
    .line 416
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->W(Ltv/danmaku/ijk/media/source/CameraSource;)Lcom/momocv/videoprocessor/VideoProcessor;

    .line 417
    .line 418
    .line 419
    move-result-object v2

    .line 420
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 421
    .line 422
    iget-object v5, v5, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 423
    .line 424
    invoke-static {v5}, Ltv/danmaku/ijk/media/source/CameraSource;->Y(Ltv/danmaku/ijk/media/source/CameraSource;)Ljava/util/List;

    .line 425
    .line 426
    .line 427
    move-result-object v5

    .line 428
    invoke-interface {v5, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 429
    .line 430
    .line 431
    move-result-object v3

    .line 432
    check-cast v3, Ljava/lang/String;

    .line 433
    .line 434
    iget-object v5, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 435
    .line 436
    iget-object v5, v5, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 437
    .line 438
    invoke-static {v5}, Ltv/danmaku/ijk/media/source/CameraSource;->Y(Ltv/danmaku/ijk/media/source/CameraSource;)Ljava/util/List;

    .line 439
    .line 440
    .line 441
    move-result-object v5

    .line 442
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 443
    .line 444
    .line 445
    move-result-object v4

    .line 446
    check-cast v4, Ljava/lang/String;

    .line 447
    .line 448
    invoke-virtual {v2, v3, v4}, Lcom/momocv/videoprocessor/VideoProcessor;->LoadModel(Ljava/lang/String;Ljava/lang/String;)Z

    .line 449
    .line 450
    .line 451
    goto :goto_0

    .line 452
    :catchall_0
    move-exception p0

    .line 453
    goto :goto_3

    .line 454
    :cond_1
    :goto_0
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 455
    .line 456
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 457
    .line 458
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->W(Ltv/danmaku/ijk/media/source/CameraSource;)Lcom/momocv/videoprocessor/VideoProcessor;

    .line 459
    .line 460
    .line 461
    move-result-object v2

    .line 462
    if-eqz v2, :cond_2

    .line 463
    .line 464
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 465
    .line 466
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 467
    .line 468
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->W(Ltv/danmaku/ijk/media/source/CameraSource;)Lcom/momocv/videoprocessor/VideoProcessor;

    .line 469
    .line 470
    .line 471
    move-result-object v2

    .line 472
    iget-object v3, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 473
    .line 474
    iget-object v3, v3, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 475
    .line 476
    invoke-static {v3}, Ltv/danmaku/ijk/media/source/CameraSource;->m0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/umw;

    .line 477
    .line 478
    .line 479
    move-result-object v3

    .line 480
    invoke-virtual {v3}, Ll/umw;->b()Lcom/momocv/MMFrame;

    .line 481
    .line 482
    .line 483
    move-result-object v3

    .line 484
    iget-object v4, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 485
    .line 486
    iget-object v4, v4, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 487
    .line 488
    invoke-static {v4}, Ltv/danmaku/ijk/media/source/CameraSource;->n0(Ltv/danmaku/ijk/media/source/CameraSource;)Ll/lnw;

    .line 489
    .line 490
    .line 491
    move-result-object v4

    .line 492
    invoke-virtual {v4}, Ll/lnw;->f()Lcom/momocv/videoprocessor/VideoParams;

    .line 493
    .line 494
    .line 495
    move-result-object v4

    .line 496
    iget-object v5, v0, Ll/omw;->k:Lcom/momocv/videoprocessor/VideoInfo;

    .line 497
    .line 498
    invoke-virtual {v2, v3, v4, v5}, Lcom/momocv/videoprocessor/VideoProcessor;->ProcessFrame(Lcom/momocv/MMFrame;Lcom/momocv/videoprocessor/VideoParams;Lcom/momocv/videoprocessor/VideoInfo;)Z

    .line 499
    .line 500
    .line 501
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 502
    .line 503
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 504
    .line 505
    invoke-static {v2}, Ltv/danmaku/ijk/media/source/CameraSource;->S(Ltv/danmaku/ijk/media/source/CameraSource;)I

    .line 506
    .line 507
    .line 508
    move-result v2

    .line 509
    invoke-virtual {v0, v2}, Ll/omw;->b(I)V

    .line 510
    .line 511
    .line 512
    :cond_2
    iget-object v2, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->b:Ltv/danmaku/ijk/media/source/CameraSource$4;

    .line 513
    .line 514
    iget-object v2, v2, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 515
    .line 516
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->a:[B

    .line 517
    .line 518
    invoke-static {v2, v0, p0}, Ltv/danmaku/ijk/media/source/CameraSource;->Z(Ltv/danmaku/ijk/media/source/CameraSource;Ll/omw;[B)V

    .line 519
    .line 520
    .line 521
    goto :goto_1

    .line 522
    :cond_3
    iget-object v2, v3, Ltv/danmaku/ijk/media/source/CameraSource$4;->a:Ltv/danmaku/ijk/media/source/CameraSource;

    .line 523
    .line 524
    iget-object p0, p0, Ltv/danmaku/ijk/media/source/CameraSource$4$1;->a:[B

    .line 525
    .line 526
    invoke-static {v2, v0, p0}, Ltv/danmaku/ijk/media/source/CameraSource;->Z(Ltv/danmaku/ijk/media/source/CameraSource;Ll/omw;[B)V

    .line 527
    .line 528
    .line 529
    :goto_1
    monitor-exit v1

    .line 530
    return-void

    .line 531
    :cond_4
    :goto_2
    const-string p0, "VideoSource"

    .line 532
    .line 533
    const-string v0, "onPreviewFrame return"

    .line 534
    .line 535
    invoke-static {p0, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 536
    .line 537
    .line 538
    monitor-exit v1

    .line 539
    return-void

    .line 540
    :goto_3
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 541
    throw p0
.end method
