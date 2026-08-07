.class public final Lcom/google/android/exoplayer2/source/rtsp/d$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/exoplayer2/source/rtsp/g$d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/android/exoplayer2/source/rtsp/d;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "c"
.end annotation


# instance fields
.field public final a:Landroid/os/Handler;

.field public final synthetic b:Lcom/google/android/exoplayer2/source/rtsp/d;


# direct methods
.method public constructor <init>(Lcom/google/android/exoplayer2/source/rtsp/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {}, Ll/bmk0;->w()Landroid/os/Handler;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->a:Landroid/os/Handler;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic d(Lcom/google/android/exoplayer2/source/rtsp/d$c;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/rtsp/d$c;->e(Ljava/util/List;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->a:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/gqd0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/gqd0;-><init>(Lcom/google/android/exoplayer2/source/rtsp/d$c;Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final e(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/google/android/exoplayer2/source/rtsp/d;->h0(Lcom/google/android/exoplayer2/source/rtsp/d;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/h;->e(Ljava/util/List;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/rtsp/d$c;->g(Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/rtsp/d$c;->f(Ljava/util/List;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final f(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/d;->g(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/d$d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/h;->k(Ljava/util/List;)Ll/qqd0;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iget-object p1, p1, Ll/qqd0;->c:Lcom/google/android/exoplayer2/source/rtsp/e;

    .line 12
    .line 13
    const-string v0, "CSeq"

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/source/rtsp/e;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-virtual {p0, p1}, Lcom/google/android/exoplayer2/source/rtsp/d$d;->d(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final g(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/h;->l(Ljava/util/List;)Ll/rqd0;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object v0, p1, Ll/rqd0;->b:Lcom/google/android/exoplayer2/source/rtsp/e;

    .line 6
    .line 7
    const-string v1, "CSeq"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/source/rtsp/e;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/String;

    .line 18
    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 24
    .line 25
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/rtsp/d;->e0(Lcom/google/android/exoplayer2/source/rtsp/d;)Landroid/util/SparseArray;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Ll/qqd0;

    .line 34
    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    goto/16 :goto_6

    .line 38
    .line 39
    :cond_0
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 40
    .line 41
    invoke-static {v2}, Lcom/google/android/exoplayer2/source/rtsp/d;->e0(Lcom/google/android/exoplayer2/source/rtsp/d;)Landroid/util/SparseArray;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-virtual {v2, v0}, Landroid/util/SparseArray;->remove(I)V

    .line 46
    .line 47
    .line 48
    iget v0, v1, Ll/qqd0;->b:I

    .line 49
    .line 50
    :try_start_0
    iget v2, p1, Ll/rqd0;->a:I
    :try_end_0
    .catch Lcom/google/android/exoplayer2/ParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    const/16 v3, 0xc8

    .line 53
    .line 54
    const-string v4, "Transport"

    .line 55
    .line 56
    const/4 v5, 0x0

    .line 57
    if-eq v2, v3, :cond_b

    .line 58
    .line 59
    const/16 v3, 0x191

    .line 60
    .line 61
    const/4 v6, 0x0

    .line 62
    const-string v7, " "

    .line 63
    .line 64
    if-eq v2, v3, :cond_6

    .line 65
    .line 66
    const/16 v3, 0x1cd

    .line 67
    .line 68
    if-eq v2, v3, :cond_4

    .line 69
    .line 70
    const/16 v1, 0x12d

    .line 71
    .line 72
    if-eq v2, v1, :cond_1

    .line 73
    .line 74
    const/16 v1, 0x12e

    .line 75
    .line 76
    if-eq v2, v1, :cond_1

    .line 77
    .line 78
    :try_start_1
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 79
    .line 80
    new-instance v2, Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;

    .line 81
    .line 82
    new-instance v3, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/h;->t(I)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    iget p1, p1, Ll/rqd0;->a:I

    .line 98
    .line 99
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-direct {v2, p1}, Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;-><init>(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v1, v2}, Lcom/google/android/exoplayer2/source/rtsp/d;->d0(Lcom/google/android/exoplayer2/source/rtsp/d;Ljava/lang/Throwable;)V

    .line 110
    .line 111
    .line 112
    return-void

    .line 113
    :catch_0
    move-exception p1

    .line 114
    goto/16 :goto_5

    .line 115
    .line 116
    :catch_1
    move-exception p1

    .line 117
    goto/16 :goto_5

    .line 118
    .line 119
    :cond_1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 120
    .line 121
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->b(Lcom/google/android/exoplayer2/source/rtsp/d;)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    const/4 v1, -0x1

    .line 126
    if-eq v0, v1, :cond_2

    .line 127
    .line 128
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 129
    .line 130
    invoke-static {v0, v6}, Lcom/google/android/exoplayer2/source/rtsp/d;->e(Lcom/google/android/exoplayer2/source/rtsp/d;I)I

    .line 131
    .line 132
    .line 133
    :cond_2
    iget-object p1, p1, Ll/rqd0;->b:Lcom/google/android/exoplayer2/source/rtsp/e;

    .line 134
    .line 135
    const-string v0, "Location"

    .line 136
    .line 137
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/source/rtsp/e;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    if-nez p1, :cond_3

    .line 142
    .line 143
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 144
    .line 145
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/d;->h(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/d$f;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    const-string v0, "Redirection without new location."

    .line 150
    .line 151
    invoke-interface {p1, v0, v5}, Lcom/google/android/exoplayer2/source/rtsp/d$f;->c(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 152
    .line 153
    .line 154
    return-void

    .line 155
    :cond_3
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 160
    .line 161
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/h;->p(Landroid/net/Uri;)Landroid/net/Uri;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/source/rtsp/d;->j(Lcom/google/android/exoplayer2/source/rtsp/d;Landroid/net/Uri;)Landroid/net/Uri;

    .line 166
    .line 167
    .line 168
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 169
    .line 170
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/h;->n(Landroid/net/Uri;)Lcom/google/android/exoplayer2/source/rtsp/h$a;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-static {v0, p1}, Lcom/google/android/exoplayer2/source/rtsp/d;->a0(Lcom/google/android/exoplayer2/source/rtsp/d;Lcom/google/android/exoplayer2/source/rtsp/h$a;)Lcom/google/android/exoplayer2/source/rtsp/h$a;

    .line 175
    .line 176
    .line 177
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 178
    .line 179
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/d;->g(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/d$d;

    .line 180
    .line 181
    .line 182
    move-result-object p1

    .line 183
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 184
    .line 185
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->i(Lcom/google/android/exoplayer2/source/rtsp/d;)Landroid/net/Uri;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 190
    .line 191
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/rtsp/d;->M(Lcom/google/android/exoplayer2/source/rtsp/d;)Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-virtual {p1, v0, v1}, Lcom/google/android/exoplayer2/source/rtsp/d$d;->c(Landroid/net/Uri;Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :cond_4
    new-instance v2, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 202
    .line 203
    .line 204
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/h;->t(I)Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    .line 210
    .line 211
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    iget p1, p1, Ll/rqd0;->a:I

    .line 215
    .line 216
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    iget-object v1, v1, Ll/qqd0;->c:Lcom/google/android/exoplayer2/source/rtsp/e;

    .line 224
    .line 225
    invoke-virtual {v1, v4}, Lcom/google/android/exoplayer2/source/rtsp/e;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    invoke-static {v1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    check-cast v1, Ljava/lang/String;

    .line 234
    .line 235
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 236
    .line 237
    const/16 v3, 0xa

    .line 238
    .line 239
    if-ne v0, v3, :cond_5

    .line 240
    .line 241
    const-string v0, "TCP"

    .line 242
    .line 243
    invoke-virtual {v1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 244
    .line 245
    .line 246
    move-result v0

    .line 247
    if-nez v0, :cond_5

    .line 248
    .line 249
    new-instance v0, Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspUdpUnsupportedTransportException;

    .line 250
    .line 251
    invoke-direct {v0, p1}, Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspUdpUnsupportedTransportException;-><init>(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    goto :goto_0

    .line 255
    :cond_5
    new-instance v0, Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;

    .line 256
    .line 257
    invoke-direct {v0, p1}, Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;-><init>(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    :goto_0
    invoke-static {v2, v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->d0(Lcom/google/android/exoplayer2/source/rtsp/d;Ljava/lang/Throwable;)V

    .line 261
    .line 262
    .line 263
    return-void

    .line 264
    :cond_6
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 265
    .line 266
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/rtsp/d;->Z(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/h$a;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    if-eqz v1, :cond_a

    .line 271
    .line 272
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 273
    .line 274
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/rtsp/d;->k(Lcom/google/android/exoplayer2/source/rtsp/d;)Z

    .line 275
    .line 276
    .line 277
    move-result v1

    .line 278
    if-nez v1, :cond_a

    .line 279
    .line 280
    iget-object p1, p1, Ll/rqd0;->b:Lcom/google/android/exoplayer2/source/rtsp/e;

    .line 281
    .line 282
    const-string v0, "WWW-Authenticate"

    .line 283
    .line 284
    invoke-virtual {p1, v0}, Lcom/google/android/exoplayer2/source/rtsp/e;->e(Ljava/lang/String;)Lcom/google/common/collect/ImmutableList;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    if-nez v0, :cond_9

    .line 293
    .line 294
    :goto_1
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->size()I

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-ge v6, v0, :cond_8

    .line 299
    .line 300
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 301
    .line 302
    invoke-interface {p1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    check-cast v1, Ljava/lang/String;

    .line 307
    .line 308
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/rtsp/h;->o(Ljava/lang/String;)Lcom/google/android/exoplayer2/source/rtsp/c;

    .line 309
    .line 310
    .line 311
    move-result-object v1

    .line 312
    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/source/rtsp/d;->U(Lcom/google/android/exoplayer2/source/rtsp/d;Lcom/google/android/exoplayer2/source/rtsp/c;)Lcom/google/android/exoplayer2/source/rtsp/c;

    .line 313
    .line 314
    .line 315
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 316
    .line 317
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->S(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/c;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    iget v0, v0, Lcom/google/android/exoplayer2/source/rtsp/c;->a:I

    .line 322
    .line 323
    const/4 v1, 0x2

    .line 324
    if-ne v0, v1, :cond_7

    .line 325
    .line 326
    goto :goto_2

    .line 327
    :cond_7
    add-int/lit8 v6, v6, 0x1

    .line 328
    .line 329
    goto :goto_1

    .line 330
    :cond_8
    :goto_2
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 331
    .line 332
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/d;->g(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/d$d;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/source/rtsp/d$d;->b()V

    .line 337
    .line 338
    .line 339
    iget-object p1, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 340
    .line 341
    const/4 v0, 0x1

    .line 342
    invoke-static {p1, v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->m(Lcom/google/android/exoplayer2/source/rtsp/d;Z)Z

    .line 343
    .line 344
    .line 345
    return-void

    .line 346
    :cond_9
    const-string p1, "Missing WWW-Authenticate header in a 401 response."

    .line 347
    .line 348
    invoke-static {p1, v5}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    throw p1

    .line 353
    :cond_a
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 354
    .line 355
    new-instance v2, Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;

    .line 356
    .line 357
    new-instance v3, Ljava/lang/StringBuilder;

    .line 358
    .line 359
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 360
    .line 361
    .line 362
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/h;->t(I)Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 367
    .line 368
    .line 369
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    iget p1, p1, Ll/rqd0;->a:I

    .line 373
    .line 374
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object p1

    .line 381
    invoke-direct {v2, p1}, Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;-><init>(Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    invoke-static {v1, v2}, Lcom/google/android/exoplayer2/source/rtsp/d;->d0(Lcom/google/android/exoplayer2/source/rtsp/d;Ljava/lang/Throwable;)V

    .line 385
    .line 386
    .line 387
    return-void

    .line 388
    :cond_b
    packed-switch v0, :pswitch_data_0

    .line 389
    .line 390
    .line 391
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 392
    .line 393
    invoke-direct {p1}, Ljava/lang/IllegalStateException;-><init>()V

    .line 394
    .line 395
    .line 396
    throw p1

    .line 397
    :pswitch_0
    iget-object v0, p1, Ll/rqd0;->b:Lcom/google/android/exoplayer2/source/rtsp/e;

    .line 398
    .line 399
    const-string v1, "Session"

    .line 400
    .line 401
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/source/rtsp/e;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object v0

    .line 405
    iget-object v1, p1, Ll/rqd0;->b:Lcom/google/android/exoplayer2/source/rtsp/e;

    .line 406
    .line 407
    invoke-virtual {v1, v4}, Lcom/google/android/exoplayer2/source/rtsp/e;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object v1

    .line 411
    if-eqz v0, :cond_c

    .line 412
    .line 413
    if-eqz v1, :cond_c

    .line 414
    .line 415
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/h;->m(Ljava/lang/String;)Lcom/google/android/exoplayer2/source/rtsp/h$b;

    .line 416
    .line 417
    .line 418
    move-result-object v0

    .line 419
    new-instance v2, Lcom/google/android/exoplayer2/source/rtsp/i;

    .line 420
    .line 421
    iget p1, p1, Ll/rqd0;->a:I

    .line 422
    .line 423
    invoke-direct {v2, p1, v0, v1}, Lcom/google/android/exoplayer2/source/rtsp/i;-><init>(ILcom/google/android/exoplayer2/source/rtsp/h$b;Ljava/lang/String;)V

    .line 424
    .line 425
    .line 426
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/source/rtsp/d$c;->l(Lcom/google/android/exoplayer2/source/rtsp/i;)V

    .line 427
    .line 428
    .line 429
    goto/16 :goto_6

    .line 430
    .line 431
    :cond_c
    const-string p1, "Missing mandatory session or transport header"

    .line 432
    .line 433
    invoke-static {p1, v5}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedManifest(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 434
    .line 435
    .line 436
    move-result-object p1

    .line 437
    throw p1

    .line 438
    :pswitch_1
    iget-object v0, p1, Ll/rqd0;->b:Lcom/google/android/exoplayer2/source/rtsp/e;

    .line 439
    .line 440
    const-string v1, "Range"

    .line 441
    .line 442
    invoke-virtual {v0, v1}, Lcom/google/android/exoplayer2/source/rtsp/e;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object v0

    .line 446
    if-nez v0, :cond_d

    .line 447
    .line 448
    sget-object v0, Ll/sqd0;->c:Ll/sqd0;

    .line 449
    .line 450
    goto :goto_3

    .line 451
    :cond_d
    invoke-static {v0}, Ll/sqd0;->d(Ljava/lang/String;)Ll/sqd0;

    .line 452
    .line 453
    .line 454
    move-result-object v0
    :try_end_1
    .catch Lcom/google/android/exoplayer2/ParserException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 455
    :goto_3
    :try_start_2
    iget-object v1, p1, Ll/rqd0;->b:Lcom/google/android/exoplayer2/source/rtsp/e;

    .line 456
    .line 457
    const-string v2, "RTP-Info"

    .line 458
    .line 459
    invoke-virtual {v1, v2}, Lcom/google/android/exoplayer2/source/rtsp/e;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 460
    .line 461
    .line 462
    move-result-object v1

    .line 463
    if-nez v1, :cond_e

    .line 464
    .line 465
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 466
    .line 467
    .line 468
    move-result-object v1

    .line 469
    goto :goto_4

    .line 470
    :cond_e
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 471
    .line 472
    invoke-static {v2}, Lcom/google/android/exoplayer2/source/rtsp/d;->i(Lcom/google/android/exoplayer2/source/rtsp/d;)Landroid/net/Uri;

    .line 473
    .line 474
    .line 475
    move-result-object v2

    .line 476
    invoke-static {v1, v2}, Ll/tqd0;->a(Ljava/lang/String;Landroid/net/Uri;)Lcom/google/common/collect/ImmutableList;

    .line 477
    .line 478
    .line 479
    move-result-object v1
    :try_end_2
    .catch Lcom/google/android/exoplayer2/ParserException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0

    .line 480
    goto :goto_4

    .line 481
    :catch_2
    :try_start_3
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    .line 482
    .line 483
    .line 484
    move-result-object v1

    .line 485
    :goto_4
    new-instance v2, Ll/pqd0;

    .line 486
    .line 487
    iget p1, p1, Ll/rqd0;->a:I

    .line 488
    .line 489
    invoke-direct {v2, p1, v0, v1}, Ll/pqd0;-><init>(ILl/sqd0;Ljava/util/List;)V

    .line 490
    .line 491
    .line 492
    invoke-virtual {p0, v2}, Lcom/google/android/exoplayer2/source/rtsp/d$c;->k(Ll/pqd0;)V

    .line 493
    .line 494
    .line 495
    goto :goto_6

    .line 496
    :pswitch_2
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/source/rtsp/d$c;->j()V

    .line 497
    .line 498
    .line 499
    goto :goto_6

    .line 500
    :pswitch_3
    new-instance v0, Ll/oqd0;

    .line 501
    .line 502
    iget-object p1, p1, Ll/rqd0;->b:Lcom/google/android/exoplayer2/source/rtsp/e;

    .line 503
    .line 504
    const-string v1, "Public"

    .line 505
    .line 506
    invoke-virtual {p1, v1}, Lcom/google/android/exoplayer2/source/rtsp/e;->d(Ljava/lang/String;)Ljava/lang/String;

    .line 507
    .line 508
    .line 509
    move-result-object p1

    .line 510
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/h;->j(Ljava/lang/String;)Lcom/google/common/collect/ImmutableList;

    .line 511
    .line 512
    .line 513
    move-result-object p1

    .line 514
    invoke-direct {v0, v2, p1}, Ll/oqd0;-><init>(ILjava/util/List;)V

    .line 515
    .line 516
    .line 517
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/rtsp/d$c;->i(Ll/oqd0;)V

    .line 518
    .line 519
    .line 520
    goto :goto_6

    .line 521
    :pswitch_4
    new-instance v0, Ll/hqd0;

    .line 522
    .line 523
    iget-object v1, p1, Ll/rqd0;->b:Lcom/google/android/exoplayer2/source/rtsp/e;

    .line 524
    .line 525
    iget-object p1, p1, Ll/rqd0;->c:Ljava/lang/String;

    .line 526
    .line 527
    invoke-static {p1}, Ll/rse0;->b(Ljava/lang/String;)Ll/qse0;

    .line 528
    .line 529
    .line 530
    move-result-object p1

    .line 531
    invoke-direct {v0, v1, v2, p1}, Ll/hqd0;-><init>(Lcom/google/android/exoplayer2/source/rtsp/e;ILl/qse0;)V

    .line 532
    .line 533
    .line 534
    invoke-virtual {p0, v0}, Lcom/google/android/exoplayer2/source/rtsp/d$c;->h(Ll/hqd0;)V
    :try_end_3
    .catch Lcom/google/android/exoplayer2/ParserException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_0

    .line 535
    .line 536
    .line 537
    goto :goto_6

    .line 538
    :goto_5
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 539
    .line 540
    new-instance v0, Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;

    .line 541
    .line 542
    invoke-direct {v0, p1}, Lcom/google/android/exoplayer2/source/rtsp/RtspMediaSource$RtspPlaybackException;-><init>(Ljava/lang/Throwable;)V

    .line 543
    .line 544
    .line 545
    invoke-static {p0, v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->d0(Lcom/google/android/exoplayer2/source/rtsp/d;Ljava/lang/Throwable;)V

    .line 546
    .line 547
    .line 548
    :goto_6
    :pswitch_5
    return-void

    .line 549
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_5
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_5
        :pswitch_5
        :pswitch_5
        :pswitch_0
        :pswitch_5
        :pswitch_5
    .end packed-switch
.end method

.method public final h(Ll/hqd0;)V
    .locals 3

    .line 1
    sget-object v0, Ll/sqd0;->c:Ll/sqd0;

    .line 2
    .line 3
    iget-object v1, p1, Ll/hqd0;->c:Ll/qse0;

    .line 4
    .line 5
    iget-object v1, v1, Ll/qse0;->a:Lcom/google/common/collect/ImmutableMap;

    .line 6
    .line 7
    const-string v2, "range"

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Ljava/lang/String;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    :try_start_0
    invoke-static {v1}, Ll/sqd0;->d(Ljava/lang/String;)Ll/sqd0;

    .line 18
    .line 19
    .line 20
    move-result-object v0
    :try_end_0
    .catch Lcom/google/android/exoplayer2/ParserException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    goto :goto_0

    .line 22
    :catch_0
    move-exception p1

    .line 23
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/d;->h(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/d$f;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string v0, "SDP format error."

    .line 30
    .line 31
    invoke-interface {p0, v0, p1}, Lcom/google/android/exoplayer2/source/rtsp/d$f;->c(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 36
    .line 37
    invoke-static {v1}, Lcom/google/android/exoplayer2/source/rtsp/d;->i(Lcom/google/android/exoplayer2/source/rtsp/d;)Landroid/net/Uri;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {p1, v1}, Lcom/google/android/exoplayer2/source/rtsp/d;->u(Ll/hqd0;Landroid/net/Uri;)Lcom/google/common/collect/ImmutableList;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {p1}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    iget-object v2, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 50
    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    invoke-static {v2}, Lcom/google/android/exoplayer2/source/rtsp/d;->h(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/d$f;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "No playable track."

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    invoke-interface {p0, p1, v0}, Lcom/google/android/exoplayer2/source/rtsp/d$f;->c(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_1
    invoke-static {v2}, Lcom/google/android/exoplayer2/source/rtsp/d;->h(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/d$f;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-interface {v1, v0, p1}, Lcom/google/android/exoplayer2/source/rtsp/d$f;->f(Ll/sqd0;Lcom/google/common/collect/ImmutableList;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 72
    .line 73
    const/4 p1, 0x1

    .line 74
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/source/rtsp/d;->v(Lcom/google/android/exoplayer2/source/rtsp/d;Z)Z

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final i(Ll/oqd0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->n(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/d$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object p1, p1, Ll/oqd0;->b:Lcom/google/common/collect/ImmutableList;

    .line 11
    .line 12
    invoke-static {p1}, Lcom/google/android/exoplayer2/source/rtsp/d;->t(Ljava/util/List;)Z

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 17
    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->g(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/d$d;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->i(Lcom/google/android/exoplayer2/source/rtsp/d;)Landroid/net/Uri;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 31
    .line 32
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/d;->M(Lcom/google/android/exoplayer2/source/rtsp/d;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p1, v0, p0}, Lcom/google/android/exoplayer2/source/rtsp/d$d;->c(Landroid/net/Uri;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_1
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->h(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/d$f;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "DESCRIBE not supported."

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    invoke-interface {p0, p1, v0}, Lcom/google/android/exoplayer2/source/rtsp/d$f;->c(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final j()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->b(Lcom/google/android/exoplayer2/source/rtsp/d;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    const/4 v2, 0x0

    .line 9
    const/4 v3, 0x1

    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    move v0, v3

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move v0, v2

    .line 15
    :goto_0
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 19
    .line 20
    invoke-static {v0, v3}, Lcom/google/android/exoplayer2/source/rtsp/d;->e(Lcom/google/android/exoplayer2/source/rtsp/d;I)I

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 24
    .line 25
    invoke-static {v0, v2}, Lcom/google/android/exoplayer2/source/rtsp/d;->I(Lcom/google/android/exoplayer2/source/rtsp/d;Z)Z

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->F(Lcom/google/android/exoplayer2/source/rtsp/d;)J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    const-wide v2, -0x7fffffffffffffffL    # -4.9E-324

    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    cmp-long v0, v0, v2

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 44
    .line 45
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/d;->F(Lcom/google/android/exoplayer2/source/rtsp/d;)J

    .line 46
    .line 47
    .line 48
    move-result-wide v0

    .line 49
    invoke-static {v0, v1}, Ll/bmk0;->l1(J)J

    .line 50
    .line 51
    .line 52
    move-result-wide v0

    .line 53
    invoke-virtual {p0, v0, v1}, Lcom/google/android/exoplayer2/source/rtsp/d;->v0(J)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public final k(Ll/pqd0;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->b(Lcom/google/android/exoplayer2/source/rtsp/d;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eq v0, v2, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->b(Lcom/google/android/exoplayer2/source/rtsp/d;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v2, 0x0

    .line 21
    :cond_1
    :goto_0
    invoke-static {v2}, Ll/w11;->g(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 25
    .line 26
    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/source/rtsp/d;->e(Lcom/google/android/exoplayer2/source/rtsp/d;I)I

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->n(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/d$b;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 38
    .line 39
    new-instance v1, Lcom/google/android/exoplayer2/source/rtsp/d$b;

    .line 40
    .line 41
    const-wide/16 v2, 0x7530

    .line 42
    .line 43
    invoke-direct {v1, v0, v2, v3}, Lcom/google/android/exoplayer2/source/rtsp/d$b;-><init>(Lcom/google/android/exoplayer2/source/rtsp/d;J)V

    .line 44
    .line 45
    .line 46
    invoke-static {v0, v1}, Lcom/google/android/exoplayer2/source/rtsp/d;->q(Lcom/google/android/exoplayer2/source/rtsp/d;Lcom/google/android/exoplayer2/source/rtsp/d$b;)Lcom/google/android/exoplayer2/source/rtsp/d$b;

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 50
    .line 51
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->n(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/d$b;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {v0}, Lcom/google/android/exoplayer2/source/rtsp/d$b;->k()V

    .line 56
    .line 57
    .line 58
    :cond_2
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 59
    .line 60
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    invoke-static {v0, v1, v2}, Lcom/google/android/exoplayer2/source/rtsp/d;->H(Lcom/google/android/exoplayer2/source/rtsp/d;J)J

    .line 66
    .line 67
    .line 68
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 69
    .line 70
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/d;->J(Lcom/google/android/exoplayer2/source/rtsp/d;)Lcom/google/android/exoplayer2/source/rtsp/d$e;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    iget-object v0, p1, Ll/pqd0;->b:Ll/sqd0;

    .line 75
    .line 76
    iget-wide v0, v0, Ll/sqd0;->a:J

    .line 77
    .line 78
    invoke-static {v0, v1}, Ll/bmk0;->J0(J)J

    .line 79
    .line 80
    .line 81
    move-result-wide v0

    .line 82
    iget-object p1, p1, Ll/pqd0;->c:Lcom/google/common/collect/ImmutableList;

    .line 83
    .line 84
    invoke-interface {p0, v0, v1, p1}, Lcom/google/android/exoplayer2/source/rtsp/d$e;->e(JLcom/google/common/collect/ImmutableList;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public final l(Lcom/google/android/exoplayer2/source/rtsp/i;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/google/android/exoplayer2/source/rtsp/d;->b(Lcom/google/android/exoplayer2/source/rtsp/d;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, -0x1

    .line 8
    const/4 v2, 0x1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    move v0, v2

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    :goto_0
    invoke-static {v0}, Ll/w11;->g(Z)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 18
    .line 19
    invoke-static {v0, v2}, Lcom/google/android/exoplayer2/source/rtsp/d;->e(Lcom/google/android/exoplayer2/source/rtsp/d;I)I

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 23
    .line 24
    iget-object p1, p1, Lcom/google/android/exoplayer2/source/rtsp/i;->b:Lcom/google/android/exoplayer2/source/rtsp/h$b;

    .line 25
    .line 26
    iget-object p1, p1, Lcom/google/android/exoplayer2/source/rtsp/h$b;->a:Ljava/lang/String;

    .line 27
    .line 28
    invoke-static {v0, p1}, Lcom/google/android/exoplayer2/source/rtsp/d;->N(Lcom/google/android/exoplayer2/source/rtsp/d;Ljava/lang/String;)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/google/android/exoplayer2/source/rtsp/d$c;->b:Lcom/google/android/exoplayer2/source/rtsp/d;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/google/android/exoplayer2/source/rtsp/d;->B(Lcom/google/android/exoplayer2/source/rtsp/d;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method
