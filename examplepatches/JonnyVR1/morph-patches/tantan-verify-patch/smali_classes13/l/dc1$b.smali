.class Ll/dc1$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/dc1;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field final synthetic a:Ll/dc1;


# direct methods
.method private constructor <init>(Ll/dc1;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/dc1$b;->a:Ll/dc1;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/dc1;Ll/dc1$a;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/dc1$b;-><init>(Ll/dc1;)V

    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/dc1$b;->a:Ll/dc1;

    .line 2
    .line 3
    invoke-static {p0}, Ll/dc1;->d(Ll/dc1;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public b(Ll/oxd0;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/dc1$b;->a:Ll/dc1;

    .line 2
    .line 3
    invoke-static {v0}, Ll/dc1;->d(Ll/dc1;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/16 v1, 0xa

    .line 12
    .line 13
    if-le v0, v1, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Ll/dc1$b;->a:Ll/dc1;

    .line 16
    .line 17
    invoke-static {v0}, Ll/dc1;->d(Ll/dc1;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Ll/dc1$b;->a:Ll/dc1;

    .line 25
    .line 26
    invoke-static {p0}, Ll/dc1;->d(Ll/dc1;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :catch_0
    move-exception p0

    .line 35
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public run()V
    .locals 12

    .line 1
    :catch_0
    :goto_0
    iget-object v0, p0, Ll/dc1$b;->a:Ll/dc1;

    .line 2
    .line 3
    invoke-static {v0}, Ll/dc1;->a(Ll/dc1;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "AudioQProcessThread"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "AudioProcessRunnable exit"

    .line 12
    .line 13
    invoke-static {v1, p0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string v0, "mAudioFrames.take()"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    :try_start_0
    iget-object v0, p0, Ll/dc1$b;->a:Ll/dc1;

    .line 23
    .line 24
    invoke-static {v0}, Ll/dc1;->c(Ll/dc1;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ll/oxd0;

    .line 33
    .line 34
    invoke-virtual {v0}, Ll/oxd0;->d()J

    .line 35
    .line 36
    .line 37
    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    const-string v4, "mAudioFrames.take() end"

    .line 39
    .line 40
    invoke-static {v1, v4}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    iget-object v4, p0, Ll/dc1$b;->a:Ll/dc1;

    .line 44
    .line 45
    invoke-static {v4}, Ll/dc1;->d(Ll/dc1;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    invoke-virtual {v4}, Ljava/util/AbstractCollection;->isEmpty()Z

    .line 50
    .line 51
    .line 52
    move-result v4

    .line 53
    if-nez v4, :cond_1

    .line 54
    .line 55
    :try_start_1
    iget-object v4, p0, Ll/dc1$b;->a:Ll/dc1;

    .line 56
    .line 57
    invoke-static {v4}, Ll/dc1;->d(Ll/dc1;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-virtual {v4}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    check-cast v4, Ll/oxd0;

    .line 66
    .line 67
    invoke-virtual {v4}, Ll/oxd0;->d()J

    .line 68
    .line 69
    .line 70
    move-result-wide v5
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 71
    goto :goto_1

    .line 72
    :cond_1
    const/4 v4, 0x0

    .line 73
    const-wide/16 v5, 0x0

    .line 74
    .line 75
    :goto_1
    const-string v7, "mSurroundFrames.take() end"

    .line 76
    .line 77
    invoke-static {v1, v7}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    const-wide/16 v7, -0x3039

    .line 81
    .line 82
    cmp-long v9, v2, v7

    .line 83
    .line 84
    const/4 v10, 0x0

    .line 85
    if-eqz v9, :cond_5

    .line 86
    .line 87
    cmp-long v5, v5, v7

    .line 88
    .line 89
    if-nez v5, :cond_2

    .line 90
    .line 91
    goto/16 :goto_4

    .line 92
    .line 93
    :cond_2
    const-string v5, "data = ByteBuffer.allocate"

    .line 94
    .line 95
    invoke-static {v1, v5}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    const-string v5, "outPutFrame = ByteBuffer.allocate"

    .line 99
    .line 100
    invoke-static {v1, v5}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 101
    .line 102
    .line 103
    if-eqz v4, :cond_3

    .line 104
    .line 105
    iget-object v5, p0, Ll/dc1$b;->a:Ll/dc1;

    .line 106
    .line 107
    invoke-virtual {v0}, Ll/oxd0;->c()[B

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    invoke-virtual {v4}, Ll/oxd0;->c()[B

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    iget v8, v0, Ll/oxd0;->e:I

    .line 116
    .line 117
    invoke-virtual {v5, v6, v7, v8}, Ll/dc1;->h([B[BI)Ljava/nio/ByteBuffer;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    invoke-virtual {v0}, Ll/oxd0;->f()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v4}, Ll/oxd0;->f()V

    .line 125
    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_3
    invoke-virtual {v0}, Ll/oxd0;->c()[B

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    move v5, v10

    .line 133
    :goto_2
    iget v6, v0, Ll/oxd0;->e:I

    .line 134
    .line 135
    div-int/lit8 v7, v6, 0x2

    .line 136
    .line 137
    if-ge v5, v7, :cond_4

    .line 138
    .line 139
    mul-int/lit8 v6, v5, 0x2

    .line 140
    .line 141
    add-int/lit8 v7, v6, 0x1

    .line 142
    .line 143
    aget-byte v8, v4, v7

    .line 144
    .line 145
    aget-byte v9, v4, v6

    .line 146
    .line 147
    shl-int/lit8 v8, v8, 0x8

    .line 148
    .line 149
    const v11, 0xff00

    .line 150
    .line 151
    .line 152
    and-int/2addr v8, v11

    .line 153
    and-int/lit16 v9, v9, 0xff

    .line 154
    .line 155
    or-int/2addr v8, v9

    .line 156
    int-to-short v8, v8

    .line 157
    int-to-float v8, v8

    .line 158
    const/high16 v9, 0x3f800000    # 1.0f

    .line 159
    .line 160
    mul-float/2addr v8, v9

    .line 161
    float-to-int v8, v8

    .line 162
    int-to-short v8, v8

    .line 163
    shr-int/lit8 v9, v8, 0x8

    .line 164
    .line 165
    and-int/lit16 v9, v9, 0xff

    .line 166
    .line 167
    int-to-byte v9, v9

    .line 168
    aput-byte v9, v4, v7

    .line 169
    .line 170
    and-int/lit16 v7, v8, 0xff

    .line 171
    .line 172
    int-to-byte v7, v7

    .line 173
    aput-byte v7, v4, v6

    .line 174
    .line 175
    add-int/lit8 v5, v5, 0x1

    .line 176
    .line 177
    goto :goto_2

    .line 178
    :cond_4
    invoke-static {v6}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 179
    .line 180
    .line 181
    move-result-object v5

    .line 182
    invoke-virtual {v5, v4}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v0}, Ll/oxd0;->f()V

    .line 189
    .line 190
    .line 191
    :goto_3
    new-instance v0, Ll/oxd0;

    .line 192
    .line 193
    invoke-direct {v0, v5, v2, v3, v10}, Ll/oxd0;-><init>(Ljava/nio/ByteBuffer;JI)V

    .line 194
    .line 195
    .line 196
    :try_start_2
    const-string v2, "AudioProcessRunnable offer begin"

    .line 197
    .line 198
    invoke-static {v1, v2}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 199
    .line 200
    .line 201
    iget-object v2, p0, Ll/dc1$b;->a:Ll/dc1;

    .line 202
    .line 203
    invoke-static {v2}, Ll/dc1;->e(Ll/dc1;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    invoke-virtual {v2, v0}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    const-string v0, "AudioProcessRunnable offer end"

    .line 211
    .line 212
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 213
    .line 214
    .line 215
    goto/16 :goto_0

    .line 216
    .line 217
    :catch_1
    move-exception v0

    .line 218
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 219
    .line 220
    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :cond_5
    :goto_4
    const-string v0, "AudioProcessRunnable exit FINISH_ID"

    .line 224
    .line 225
    invoke-static {v1, v0}, Ll/t9c;->c(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    .line 227
    .line 228
    iget-object p0, p0, Ll/dc1$b;->a:Ll/dc1;

    .line 229
    .line 230
    invoke-static {p0, v10}, Ll/dc1;->b(Ll/dc1;Z)Z

    .line 231
    .line 232
    .line 233
    return-void
.end method
