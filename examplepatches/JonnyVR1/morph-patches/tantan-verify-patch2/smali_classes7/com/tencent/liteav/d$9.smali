.class Lcom/tencent/liteav/d$9;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/liteav/d;->a(Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/graphics/Bitmap;

.field final synthetic b:Ljava/nio/ByteBuffer;

.field final synthetic c:I

.field final synthetic d:I

.field final synthetic e:Lcom/tencent/liteav/d;


# direct methods
.method public constructor <init>(Lcom/tencent/liteav/d;Landroid/graphics/Bitmap;Ljava/nio/ByteBuffer;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/liteav/d$9;->a:Landroid/graphics/Bitmap;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/tencent/liteav/d$9;->b:Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    iput p4, p0, Lcom/tencent/liteav/d$9;->c:I

    .line 8
    .line 9
    iput p5, p0, Lcom/tencent/liteav/d$9;->d:I

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tencent/liteav/d;->m(Lcom/tencent/liteav/d;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x2

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tencent/liteav/d;->n(Lcom/tencent/liteav/d;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_7

    .line 17
    .line 18
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->a:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    if-eqz v0, :cond_7

    .line 21
    .line 22
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->b:Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    if-nez v0, :cond_1

    .line 25
    .line 26
    goto/16 :goto_0

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/b;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 37
    .line 38
    invoke-static {v0}, Lcom/tencent/liteav/d;->o(Lcom/tencent/liteav/d;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 45
    .line 46
    invoke-static {v0}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->width:I

    .line 51
    .line 52
    iget v2, p0, Lcom/tencent/liteav/d$9;->c:I

    .line 53
    .line 54
    if-ne v0, v2, :cond_2

    .line 55
    .line 56
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 57
    .line 58
    invoke-static {v0}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->height:I

    .line 63
    .line 64
    iget v2, p0, Lcom/tencent/liteav/d$9;->d:I

    .line 65
    .line 66
    if-ne v0, v2, :cond_2

    .line 67
    .line 68
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 69
    .line 70
    invoke-static {v0}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encodeType:I

    .line 75
    .line 76
    if-ne v0, v1, :cond_2

    .line 77
    .line 78
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 79
    .line 80
    invoke-static {v0}, Lcom/tencent/liteav/d;->c(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->gop:I

    .line 85
    .line 86
    iget-object v2, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 87
    .line 88
    invoke-static {v2}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget v2, v2, Lcom/tencent/liteav/g;->i:I

    .line 93
    .line 94
    if-eq v0, v2, :cond_3

    .line 95
    .line 96
    :cond_2
    iget-object v2, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 97
    .line 98
    iget v3, p0, Lcom/tencent/liteav/d$9;->c:I

    .line 99
    .line 100
    iget v4, p0, Lcom/tencent/liteav/d$9;->d:I

    .line 101
    .line 102
    invoke-static {v2}, Lcom/tencent/liteav/d;->d(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/g;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    iget v7, v0, Lcom/tencent/liteav/g;->C:I

    .line 107
    .line 108
    const/4 v8, 0x1

    .line 109
    const/4 v5, 0x2

    .line 110
    const/4 v6, 0x0

    .line 111
    invoke-static/range {v2 .. v8}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/d;IIILjava/lang/Object;IZ)V

    .line 112
    .line 113
    .line 114
    :cond_3
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 115
    .line 116
    invoke-static {v0}, Lcom/tencent/liteav/d;->b(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/b;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    if-eqz v0, :cond_4

    .line 121
    .line 122
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 123
    .line 124
    invoke-static {v0}, Lcom/tencent/liteav/d;->g(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iget v0, v0, Lcom/tencent/liteav/videoencoder/TXSVideoEncoderParam;->encodeType:I

    .line 129
    .line 130
    if-eq v0, v1, :cond_5

    .line 131
    .line 132
    :cond_4
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 133
    .line 134
    invoke-static {v0}, Lcom/tencent/liteav/d;->p(Lcom/tencent/liteav/d;)Z

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    if-eqz v0, :cond_5

    .line 139
    .line 140
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 141
    .line 142
    const/4 v2, 0x0

    .line 143
    const/4 v3, 0x1

    .line 144
    invoke-static {v0, v2, v1, v3}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/d;Ljava/lang/Object;IZ)V

    .line 145
    .line 146
    .line 147
    :cond_5
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->a:Landroid/graphics/Bitmap;

    .line 148
    .line 149
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 150
    .line 151
    .line 152
    move-result v4

    .line 153
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->a:Landroid/graphics/Bitmap;

    .line 154
    .line 155
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 156
    .line 157
    .line 158
    move-result v5

    .line 159
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 160
    .line 161
    invoke-static {v0}, Lcom/tencent/liteav/d;->a(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/b;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    if-eqz v1, :cond_6

    .line 166
    .line 167
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->b:Ljava/nio/ByteBuffer;

    .line 168
    .line 169
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 170
    .line 171
    .line 172
    move-result-object v2

    .line 173
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->generatePtsMS()J

    .line 174
    .line 175
    .line 176
    move-result-wide v6

    .line 177
    const/4 v3, 0x2

    .line 178
    invoke-virtual/range {v1 .. v7}, Lcom/tencent/liteav/videoencoder/b;->a([BIIIJ)J

    .line 179
    .line 180
    .line 181
    :cond_6
    iget-object v0, p0, Lcom/tencent/liteav/d$9;->e:Lcom/tencent/liteav/d;

    .line 182
    .line 183
    invoke-static {v0}, Lcom/tencent/liteav/d;->b(Lcom/tencent/liteav/d;)Lcom/tencent/liteav/videoencoder/b;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    if-eqz v1, :cond_7

    .line 188
    .line 189
    iget-object p0, p0, Lcom/tencent/liteav/d$9;->b:Ljava/nio/ByteBuffer;

    .line 190
    .line 191
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    invoke-static {}, Lcom/tencent/liteav/basic/util/TXCTimeUtil;->generatePtsMS()J

    .line 196
    .line 197
    .line 198
    move-result-wide v6

    .line 199
    const/4 v3, 0x2

    .line 200
    invoke-virtual/range {v1 .. v7}, Lcom/tencent/liteav/videoencoder/b;->a([BIIIJ)J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    .line 202
    .line 203
    :cond_7
    :goto_0
    return-void

    .line 204
    :catch_0
    move-exception v0

    .line 205
    move-object p0, v0

    .line 206
    new-instance v0, Ljava/lang/StringBuilder;

    .line 207
    .line 208
    const-string v1, "onPushBitmap failed."

    .line 209
    .line 210
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 218
    .line 219
    .line 220
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    const-string v0, "TXCCaptureAndEnc"

    .line 225
    .line 226
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 227
    .line 228
    .line 229
    return-void
.end method
