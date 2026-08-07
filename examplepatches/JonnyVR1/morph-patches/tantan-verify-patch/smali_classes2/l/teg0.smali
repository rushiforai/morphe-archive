.class public final Ll/teg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final t:Ljava/lang/Object;

.field public static final u:Ll/rtg0;

.field public static final v:Ljava/util/concurrent/atomic/AtomicInteger;

.field public static final w:Ll/dwg0;


# instance fields
.field public final a:I

.field public final b:Ll/feg0;

.field public final c:Ll/jeg0;

.field public final d:Ll/mgg0;

.field public final e:Ll/zyg0;

.field public final f:Ljava/lang/String;

.field public final g:Ll/lxg0;

.field public final h:I

.field public i:I

.field public final j:Ll/uxg0;

.field public k:Ll/wqg0;

.field public l:Ljava/util/ArrayList;

.field public m:Landroid/graphics/Bitmap;

.field public n:Ljava/util/concurrent/Future;

.field public o:I

.field public p:Ljava/lang/Exception;

.field public q:I

.field public r:I

.field public s:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/teg0;->t:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Ll/rtg0;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/rtg0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/teg0;->u:Ll/rtg0;

    .line 14
    .line 15
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Ll/teg0;->v:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 21
    .line 22
    new-instance v0, Ll/dwg0;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/dwg0;-><init>()V

    .line 25
    .line 26
    .line 27
    sput-object v0, Ll/teg0;->w:Ll/dwg0;

    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Ll/feg0;Ll/jeg0;Ll/cng0;Ll/zyg0;Ll/wqg0;Ll/uxg0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/teg0;->v:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Ll/teg0;->a:I

    .line 11
    .line 12
    iput-object p1, p0, Ll/teg0;->b:Ll/feg0;

    .line 13
    .line 14
    iput-object p2, p0, Ll/teg0;->c:Ll/jeg0;

    .line 15
    .line 16
    iput-object p3, p0, Ll/teg0;->d:Ll/mgg0;

    .line 17
    .line 18
    iput-object p4, p0, Ll/teg0;->e:Ll/zyg0;

    .line 19
    .line 20
    iput-object p5, p0, Ll/teg0;->k:Ll/wqg0;

    .line 21
    .line 22
    iget-object p1, p5, Ll/wqg0;->e:Ljava/lang/String;

    .line 23
    .line 24
    iput-object p1, p0, Ll/teg0;->f:Ljava/lang/String;

    .line 25
    .line 26
    iget-object p1, p5, Ll/wqg0;->b:Ll/lxg0;

    .line 27
    .line 28
    iput-object p1, p0, Ll/teg0;->g:Ll/lxg0;

    .line 29
    .line 30
    iget p1, p1, Ll/lxg0;->c:I

    .line 31
    .line 32
    iput p1, p0, Ll/teg0;->s:I

    .line 33
    .line 34
    iget p1, p5, Ll/wqg0;->d:I

    .line 35
    .line 36
    iput p1, p0, Ll/teg0;->h:I

    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    iput p1, p0, Ll/teg0;->i:I

    .line 40
    .line 41
    iput-object p6, p0, Ll/teg0;->j:Ll/uxg0;

    .line 42
    .line 43
    invoke-virtual {p6}, Ll/uxg0;->a()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    iput p1, p0, Ll/teg0;->r:I

    .line 48
    .line 49
    return-void
.end method

.method public static b(Lokio/Source;Ll/lxg0;)Landroid/graphics/Bitmap;
    .locals 4

    .line 1
    invoke-static {p0}, Lokio/Okio;->buffer(Lokio/Source;)Lokio/BufferedSource;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Ll/yuq0;->b:Lokio/ByteString;

    .line 6
    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    invoke-interface {p0, v1, v2, v0}, Lokio/BufferedSource;->rangeEquals(JLokio/ByteString;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    sget-object v0, Ll/yuq0;->c:Lokio/ByteString;

    .line 17
    .line 18
    const-wide/16 v2, 0x8

    .line 19
    .line 20
    invoke-interface {p0, v2, v3, v0}, Lokio/BufferedSource;->rangeEquals(JLokio/ByteString;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v0, v1

    .line 29
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    const/4 p1, 0x0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    invoke-interface {p0}, Lokio/BufferedSource;->inputStream()Ljava/io/InputStream;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0, p1, p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    if-eqz p0, :cond_1

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_1
    const-string p0, "Failed to decode stream."

    .line 47
    .line 48
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-object p1

    .line 52
    :cond_2
    invoke-interface {p0}, Lokio/BufferedSource;->readByteArray()[B

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    array-length v0, p0

    .line 57
    invoke-static {p0, v1, v0, p1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method public static d(Ll/lxg0;)V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/lxg0;->a:Landroid/net/Uri;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    invoke-static {p0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :goto_0
    sget-object v0, Ll/teg0;->u:Ll/rtg0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/16 v2, 0xb

    .line 32
    .line 33
    add-int/2addr v1, v2

    .line 34
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->ensureCapacity(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->length()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    invoke-virtual {v0, v2, v1, p0}, Ljava/lang/StringBuilder;->replace(IILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public final a()Landroid/graphics/Bitmap;
    .locals 12

    .line 1
    iget v0, p0, Ll/teg0;->h:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    and-int/2addr v0, v1

    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/teg0;->d:Ll/mgg0;

    .line 10
    .line 11
    iget-object v4, p0, Ll/teg0;->f:Ljava/lang/String;

    .line 12
    .line 13
    check-cast v0, Ll/cng0;

    .line 14
    .line 15
    invoke-virtual {v0, v4}, Ll/cng0;->b(Ljava/lang/String;)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v3, p0, Ll/teg0;->e:Ll/zyg0;

    .line 22
    .line 23
    iget-object v3, v3, Ll/zyg0;->b:Ll/mxg0;

    .line 24
    .line 25
    invoke-virtual {v3, v2}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 26
    .line 27
    .line 28
    iput v1, p0, Ll/teg0;->o:I

    .line 29
    .line 30
    iget-object p0, p0, Ll/teg0;->b:Ll/feg0;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    .line 34
    .line 35
    return-object v0

    .line 36
    :cond_0
    move-object v0, v3

    .line 37
    :cond_1
    iget v4, p0, Ll/teg0;->r:I

    .line 38
    .line 39
    const/4 v5, 0x4

    .line 40
    if-nez v4, :cond_2

    .line 41
    .line 42
    move v4, v5

    .line 43
    goto :goto_0

    .line 44
    :cond_2
    iget v4, p0, Ll/teg0;->i:I

    .line 45
    .line 46
    :goto_0
    iput v4, p0, Ll/teg0;->i:I

    .line 47
    .line 48
    iget-object v6, p0, Ll/teg0;->j:Ll/uxg0;

    .line 49
    .line 50
    iget-object v7, p0, Ll/teg0;->g:Ll/lxg0;

    .line 51
    .line 52
    invoke-virtual {v6, v7, v4}, Ll/uxg0;->b(Ll/lxg0;I)Ll/aig0;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    if-eqz v4, :cond_3

    .line 57
    .line 58
    iget v0, v4, Ll/aig0;->a:I

    .line 59
    .line 60
    iput v0, p0, Ll/teg0;->o:I

    .line 61
    .line 62
    iget v0, v4, Ll/aig0;->d:I

    .line 63
    .line 64
    iput v0, p0, Ll/teg0;->q:I

    .line 65
    .line 66
    iget-object v0, v4, Ll/aig0;->b:Landroid/graphics/Bitmap;

    .line 67
    .line 68
    if-nez v0, :cond_3

    .line 69
    .line 70
    iget-object v4, v4, Ll/aig0;->c:Lokio/Source;

    .line 71
    .line 72
    :try_start_0
    iget-object v0, p0, Ll/teg0;->g:Ll/lxg0;

    .line 73
    .line 74
    invoke-static {v4, v0}, Ll/teg0;->b(Lokio/Source;Ll/lxg0;)Landroid/graphics/Bitmap;

    .line 75
    .line 76
    .line 77
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    :try_start_1
    invoke-interface {v4}, Lokio/Source;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :catchall_0
    move-exception v0

    .line 83
    move-object p0, v0

    .line 84
    :try_start_2
    invoke-interface {v4}, Lokio/Source;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 85
    .line 86
    .line 87
    :catch_0
    throw p0

    .line 88
    :catch_1
    :cond_3
    :goto_1
    if-eqz v0, :cond_d

    .line 89
    .line 90
    iget-object v4, p0, Ll/teg0;->b:Ll/feg0;

    .line 91
    .line 92
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 93
    .line 94
    .line 95
    iget-object v4, p0, Ll/teg0;->e:Ll/zyg0;

    .line 96
    .line 97
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 98
    .line 99
    .line 100
    invoke-static {v0}, Ll/yuq0;->b(Landroid/graphics/Bitmap;)I

    .line 101
    .line 102
    .line 103
    move-result v6

    .line 104
    iget-object v4, v4, Ll/zyg0;->b:Ll/mxg0;

    .line 105
    .line 106
    const/4 v7, 0x2

    .line 107
    invoke-virtual {v4, v7, v6, v2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    invoke-virtual {v4, v6}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 112
    .line 113
    .line 114
    iget-object v4, p0, Ll/teg0;->g:Ll/lxg0;

    .line 115
    .line 116
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 117
    .line 118
    .line 119
    iget-object v4, v4, Ll/lxg0;->b:Ljava/util/List;

    .line 120
    .line 121
    if-eqz v4, :cond_4

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :cond_4
    iget v4, p0, Ll/teg0;->q:I

    .line 125
    .line 126
    if-eqz v4, :cond_d

    .line 127
    .line 128
    :goto_2
    sget-object v4, Ll/teg0;->t:Ljava/lang/Object;

    .line 129
    .line 130
    monitor-enter v4

    .line 131
    :try_start_3
    iget-object v6, p0, Ll/teg0;->g:Ll/lxg0;

    .line 132
    .line 133
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 134
    .line 135
    .line 136
    iget v6, p0, Ll/teg0;->q:I

    .line 137
    .line 138
    if-eqz v6, :cond_9

    .line 139
    .line 140
    iget-object v8, p0, Ll/teg0;->g:Ll/lxg0;

    .line 141
    .line 142
    move-object v9, v8

    .line 143
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 144
    .line 145
    .line 146
    move-result v8

    .line 147
    move-object v10, v9

    .line 148
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 149
    .line 150
    .line 151
    move-result v9

    .line 152
    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 153
    .line 154
    .line 155
    new-instance v10, Landroid/graphics/Matrix;

    .line 156
    .line 157
    invoke-direct {v10}, Landroid/graphics/Matrix;-><init>()V

    .line 158
    .line 159
    .line 160
    if-eqz v6, :cond_7

    .line 161
    .line 162
    if-eqz v6, :cond_7

    .line 163
    .line 164
    packed-switch v6, :pswitch_data_0

    .line 165
    .line 166
    .line 167
    move v11, v2

    .line 168
    goto :goto_3

    .line 169
    :pswitch_0
    const/16 v11, 0x10e

    .line 170
    .line 171
    goto :goto_3

    .line 172
    :pswitch_1
    const/16 v11, 0x5a

    .line 173
    .line 174
    goto :goto_3

    .line 175
    :pswitch_2
    const/16 v11, 0xb4

    .line 176
    .line 177
    :goto_3
    if-eq v6, v7, :cond_5

    .line 178
    .line 179
    const/4 v7, 0x7

    .line 180
    if-eq v6, v7, :cond_5

    .line 181
    .line 182
    if-eq v6, v5, :cond_5

    .line 183
    .line 184
    const/4 v5, 0x5

    .line 185
    if-eq v6, v5, :cond_5

    .line 186
    .line 187
    move v5, v1

    .line 188
    goto :goto_4

    .line 189
    :cond_5
    const/4 v5, -0x1

    .line 190
    :goto_4
    if-eqz v11, :cond_6

    .line 191
    .line 192
    int-to-float v6, v11

    .line 193
    invoke-virtual {v10, v6}, Landroid/graphics/Matrix;->preRotate(F)Z

    .line 194
    .line 195
    .line 196
    goto :goto_5

    .line 197
    :catchall_1
    move-exception v0

    .line 198
    move-object p0, v0

    .line 199
    goto :goto_a

    .line 200
    :cond_6
    :goto_5
    if-eq v5, v1, :cond_7

    .line 201
    .line 202
    int-to-float v1, v5

    .line 203
    const/high16 v5, 0x3f800000    # 1.0f

    .line 204
    .line 205
    invoke-virtual {v10, v1, v5}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 206
    .line 207
    .line 208
    :cond_7
    const/4 v7, 0x0

    .line 209
    const/4 v11, 0x1

    .line 210
    const/4 v6, 0x0

    .line 211
    move-object v5, v0

    .line 212
    invoke-static/range {v5 .. v11}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    if-eq v0, v5, :cond_8

    .line 217
    .line 218
    invoke-virtual {v5}, Landroid/graphics/Bitmap;->recycle()V

    .line 219
    .line 220
    .line 221
    goto :goto_6

    .line 222
    :cond_8
    move-object v0, v5

    .line 223
    :goto_6
    iget-object v1, p0, Ll/teg0;->b:Ll/feg0;

    .line 224
    .line 225
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 226
    .line 227
    .line 228
    goto :goto_7

    .line 229
    :cond_9
    move-object v5, v0

    .line 230
    :goto_7
    iget-object v1, p0, Ll/teg0;->g:Ll/lxg0;

    .line 231
    .line 232
    iget-object v1, v1, Ll/lxg0;->b:Ljava/util/List;

    .line 233
    .line 234
    if-eqz v1, :cond_c

    .line 235
    .line 236
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 237
    .line 238
    .line 239
    move-result v5

    .line 240
    if-gtz v5, :cond_a

    .line 241
    .line 242
    move-object v3, v0

    .line 243
    goto :goto_8

    .line 244
    :cond_a
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 248
    if-nez v0, :cond_b

    .line 249
    .line 250
    :try_start_4
    throw v3
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 251
    :catch_2
    move-exception v0

    .line 252
    :try_start_5
    sget-object v1, Ll/feg0;->i:Ll/txg0;

    .line 253
    .line 254
    new-instance v5, Ll/bzg0;

    .line 255
    .line 256
    invoke-direct {v5, v0}, Ll/bzg0;-><init>(Ljava/lang/RuntimeException;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v1, v5}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 260
    .line 261
    .line 262
    :goto_8
    iget-object v0, p0, Ll/teg0;->b:Ll/feg0;

    .line 263
    .line 264
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 265
    .line 266
    .line 267
    move-object v0, v3

    .line 268
    goto :goto_9

    .line 269
    :cond_b
    new-instance p0, Ljava/lang/ClassCastException;

    .line 270
    .line 271
    invoke-direct {p0}, Ljava/lang/ClassCastException;-><init>()V

    .line 272
    .line 273
    .line 274
    throw p0

    .line 275
    :cond_c
    :goto_9
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 276
    if-eqz v0, :cond_e

    .line 277
    .line 278
    iget-object p0, p0, Ll/teg0;->e:Ll/zyg0;

    .line 279
    .line 280
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 281
    .line 282
    .line 283
    invoke-static {v0}, Ll/yuq0;->b(Landroid/graphics/Bitmap;)I

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    iget-object p0, p0, Ll/zyg0;->b:Ll/mxg0;

    .line 288
    .line 289
    const/4 v3, 0x3

    .line 290
    invoke-virtual {p0, v3, v1, v2}, Landroid/os/Handler;->obtainMessage(III)Landroid/os/Message;

    .line 291
    .line 292
    .line 293
    move-result-object v1

    .line 294
    invoke-virtual {p0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 295
    .line 296
    .line 297
    goto :goto_b

    .line 298
    :goto_a
    :try_start_6
    monitor-exit v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 299
    throw p0

    .line 300
    :cond_d
    move-object v5, v0

    .line 301
    move-object v0, v5

    .line 302
    :cond_e
    :goto_b
    return-object v0

    .line 303
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final c(Ll/wqg0;)V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/teg0;->k:Ll/wqg0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne v0, p1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/teg0;->k:Ll/wqg0;

    .line 9
    .line 10
    move v0, v1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v0, p0, Ll/teg0;->l:Ljava/util/ArrayList;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    move v0, v2

    .line 22
    :goto_0
    if-eqz v0, :cond_7

    .line 23
    .line 24
    iget-object p1, p1, Ll/wqg0;->b:Ll/lxg0;

    .line 25
    .line 26
    iget p1, p1, Ll/lxg0;->c:I

    .line 27
    .line 28
    iget v0, p0, Ll/teg0;->s:I

    .line 29
    .line 30
    if-ne p1, v0, :cond_7

    .line 31
    .line 32
    iget-object p1, p0, Ll/teg0;->l:Ljava/util/ArrayList;

    .line 33
    .line 34
    if-eqz p1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    if-nez p1, :cond_2

    .line 41
    .line 42
    move p1, v1

    .line 43
    goto :goto_1

    .line 44
    :cond_2
    move p1, v2

    .line 45
    :goto_1
    iget-object v0, p0, Ll/teg0;->k:Ll/wqg0;

    .line 46
    .line 47
    if-nez v0, :cond_3

    .line 48
    .line 49
    if-eqz p1, :cond_6

    .line 50
    .line 51
    :cond_3
    if-eqz v0, :cond_4

    .line 52
    .line 53
    iget-object v0, v0, Ll/wqg0;->b:Ll/lxg0;

    .line 54
    .line 55
    iget v1, v0, Ll/lxg0;->c:I

    .line 56
    .line 57
    :cond_4
    if-eqz p1, :cond_6

    .line 58
    .line 59
    iget-object p1, p0, Ll/teg0;->l:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    :goto_2
    if-ge v2, p1, :cond_6

    .line 66
    .line 67
    iget-object v0, p0, Ll/teg0;->l:Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    check-cast v0, Ll/wqg0;

    .line 74
    .line 75
    iget-object v0, v0, Ll/wqg0;->b:Ll/lxg0;

    .line 76
    .line 77
    iget v0, v0, Ll/lxg0;->c:I

    .line 78
    .line 79
    invoke-static {v0}, Ll/pxg0;->a(I)I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    invoke-static {v1}, Ll/pxg0;->a(I)I

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-le v3, v4, :cond_5

    .line 88
    .line 89
    move v1, v0

    .line 90
    :cond_5
    add-int/lit8 v2, v2, 0x1

    .line 91
    .line 92
    goto :goto_2

    .line 93
    :cond_6
    iput v1, p0, Ll/teg0;->s:I

    .line 94
    .line 95
    :cond_7
    iget-object p0, p0, Ll/teg0;->b:Ll/feg0;

    .line 96
    .line 97
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public final run()V
    .locals 6

    .line 1
    const-string v0, "SudPicasso-Idle"

    .line 2
    .line 3
    const/4 v1, 0x6

    .line 4
    :try_start_0
    iget-object v2, p0, Ll/teg0;->g:Ll/lxg0;

    .line 5
    .line 6
    invoke-static {v2}, Ll/teg0;->d(Ll/lxg0;)V

    .line 7
    .line 8
    .line 9
    iget-object v2, p0, Ll/teg0;->b:Ll/feg0;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/teg0;->a()Landroid/graphics/Bitmap;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iput-object v2, p0, Ll/teg0;->m:Landroid/graphics/Bitmap;
    :try_end_0
    .catch LSuddo/Sudimport; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    iget-object v3, p0, Ll/teg0;->c:Ll/jeg0;

    .line 21
    .line 22
    if-nez v2, :cond_0

    .line 23
    .line 24
    :try_start_1
    invoke-virtual {v3, p0}, Ll/jeg0;->c(Ll/teg0;)V

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto/16 :goto_6

    .line 30
    .line 31
    :catch_0
    move-exception v2

    .line 32
    goto :goto_1

    .line 33
    :catch_1
    move-exception v2

    .line 34
    goto :goto_2

    .line 35
    :catch_2
    move-exception v1

    .line 36
    goto :goto_3

    .line 37
    :catch_3
    move-exception v2

    .line 38
    goto :goto_4

    .line 39
    :cond_0
    invoke-virtual {v3, p0}, Ll/jeg0;->d(Ll/teg0;)V
    :try_end_1
    .catch LSuddo/Sudimport; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/OutOfMemoryError; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    .line 41
    .line 42
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :goto_1
    :try_start_2
    iput-object v2, p0, Ll/teg0;->p:Ljava/lang/Exception;

    .line 51
    .line 52
    iget-object v2, p0, Ll/teg0;->c:Ll/jeg0;

    .line 53
    .line 54
    iget-object v2, v2, Ll/jeg0;->h:Ll/nvg0;

    .line 55
    .line 56
    invoke-virtual {v2, v1, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {v2, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_5

    .line 64
    :goto_2
    new-instance v3, Ljava/io/StringWriter;

    .line 65
    .line 66
    invoke-direct {v3}, Ljava/io/StringWriter;-><init>()V

    .line 67
    .line 68
    .line 69
    iget-object v4, p0, Ll/teg0;->e:Ll/zyg0;

    .line 70
    .line 71
    invoke-virtual {v4}, Ll/zyg0;->a()Ll/dtg0;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    new-instance v5, Ljava/io/PrintWriter;

    .line 76
    .line 77
    invoke-direct {v5, v3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v4, v5}, Ll/dtg0;->a(Ljava/io/PrintWriter;)V

    .line 81
    .line 82
    .line 83
    new-instance v4, Ljava/lang/RuntimeException;

    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    invoke-direct {v4, v3, v2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 90
    .line 91
    .line 92
    iput-object v4, p0, Ll/teg0;->p:Ljava/lang/Exception;

    .line 93
    .line 94
    iget-object v2, p0, Ll/teg0;->c:Ll/jeg0;

    .line 95
    .line 96
    iget-object v2, v2, Ll/jeg0;->h:Ll/nvg0;

    .line 97
    .line 98
    invoke-virtual {v2, v1, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-virtual {v2, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 103
    .line 104
    .line 105
    goto :goto_5

    .line 106
    :goto_3
    iput-object v1, p0, Ll/teg0;->p:Ljava/lang/Exception;

    .line 107
    .line 108
    iget-object v1, p0, Ll/teg0;->c:Ll/jeg0;

    .line 109
    .line 110
    iget-object v1, v1, Ll/jeg0;->h:Ll/nvg0;

    .line 111
    .line 112
    const/4 v2, 0x5

    .line 113
    invoke-virtual {v1, v2, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    const-wide/16 v2, 0x1f4

    .line 118
    .line 119
    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 120
    .line 121
    .line 122
    goto :goto_5

    .line 123
    :goto_4
    iput-object v2, p0, Ll/teg0;->p:Ljava/lang/Exception;

    .line 124
    .line 125
    iget-object v2, p0, Ll/teg0;->c:Ll/jeg0;

    .line 126
    .line 127
    iget-object v2, v2, Ll/jeg0;->h:Ll/nvg0;

    .line 128
    .line 129
    invoke-virtual {v2, v1, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {v2, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 134
    .line 135
    .line 136
    :goto_5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :goto_6
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    invoke-virtual {v1, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    throw p0
.end method
