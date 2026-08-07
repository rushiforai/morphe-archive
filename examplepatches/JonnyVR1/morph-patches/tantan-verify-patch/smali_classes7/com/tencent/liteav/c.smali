.class public Lcom/tencent/liteav/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/liteav/basic/b/b;
.implements Lcom/tencent/liteav/basic/c/n;
.implements Lcom/tencent/liteav/capturer/b;
.implements Lcom/tencent/liteav/k;


# instance fields
.field a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/b;",
            ">;"
        }
    .end annotation
.end field

.field private b:Landroid/content/Context;

.field private final c:Lcom/tencent/liteav/capturer/a;

.field private d:Lcom/tencent/liteav/l;

.field private e:Z

.field private f:Lcom/tencent/liteav/g;

.field private g:I

.field private h:Lcom/tencent/liteav/basic/c/m;

.field private i:Z

.field private j:J

.field private k:J

.field private l:J

.field private m:I

.field private n:Ljava/lang/Object;

.field private o:Landroid/os/HandlerThread;

.field private p:Landroid/os/Handler;

.field private q:Ljava/lang/String;

.field private r:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/tencent/liteav/g;Lcom/tencent/liteav/basic/c/m;Z)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/liteav/c;->g:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-object v1, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/tencent/liteav/c;->i:Z

    .line 11
    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    iput-wide v2, p0, Lcom/tencent/liteav/c;->j:J

    .line 15
    .line 16
    iput-wide v2, p0, Lcom/tencent/liteav/c;->l:J

    .line 17
    .line 18
    iput v0, p0, Lcom/tencent/liteav/c;->m:I

    .line 19
    .line 20
    new-instance v0, Ljava/lang/Object;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/tencent/liteav/c;->n:Ljava/lang/Object;

    .line 26
    .line 27
    iput-object v1, p0, Lcom/tencent/liteav/c;->o:Landroid/os/HandlerThread;

    .line 28
    .line 29
    iput-object v1, p0, Lcom/tencent/liteav/c;->p:Landroid/os/Handler;

    .line 30
    .line 31
    const-string v0, ""

    .line 32
    .line 33
    iput-object v0, p0, Lcom/tencent/liteav/c;->q:Ljava/lang/String;

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    iput-boolean v0, p0, Lcom/tencent/liteav/c;->r:Z

    .line 37
    .line 38
    new-instance v0, Lcom/tencent/liteav/capturer/a;

    .line 39
    .line 40
    invoke-direct {v0}, Lcom/tencent/liteav/capturer/a;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 44
    .line 45
    :try_start_0
    invoke-virtual {p2}, Lcom/tencent/liteav/g;->clone()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p2

    .line 49
    check-cast p2, Lcom/tencent/liteav/g;

    .line 50
    .line 51
    iput-object p2, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catch_0
    move-exception p2

    .line 55
    new-instance v0, Lcom/tencent/liteav/g;

    .line 56
    .line 57
    invoke-direct {v0}, Lcom/tencent/liteav/g;-><init>()V

    .line 58
    .line 59
    .line 60
    iput-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 61
    .line 62
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 63
    .line 64
    .line 65
    :goto_0
    iput-object p1, p0, Lcom/tencent/liteav/c;->b:Landroid/content/Context;

    .line 66
    .line 67
    iput-object p3, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    .line 68
    .line 69
    invoke-interface {p3, p0}, Lcom/tencent/liteav/basic/c/m;->setSurfaceTextureListener(Lcom/tencent/liteav/basic/c/n;)V

    .line 70
    .line 71
    .line 72
    iget-object p1, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 73
    .line 74
    iput-boolean p4, p1, Lcom/tencent/liteav/g;->W:Z

    .line 75
    .line 76
    iget-object p0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 77
    .line 78
    iget-boolean p1, p1, Lcom/tencent/liteav/g;->U:Z

    .line 79
    .line 80
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/capturer/a;->b(Z)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/g;
    .locals 0

    .line 307
    iget-object p0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    return-object p0
.end method

.method private a(ILjava/lang/String;)V
    .locals 0

    .line 300
    iget-object p0, p0, Lcom/tencent/liteav/c;->a:Ljava/lang/ref/WeakReference;

    invoke-static {p0, p1, p2}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILjava/lang/String;)V

    return-void
.end method

.method private a(I[B[FI)V
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/c;->e:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_3

    .line 6
    .line 7
    :cond_0
    iget-boolean v0, p0, Lcom/tencent/liteav/c;->i:Z

    .line 8
    .line 9
    const-string v1, "CameraCapture"

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v4, "VideoCapture[%d]: capture first frame"

    .line 28
    .line 29
    invoke-static {v4, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v4, ""

    .line 34
    .line 35
    const/4 v5, 0x2

    .line 36
    invoke-static {v5, v0, v4, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/tencent/liteav/c;->a:Ljava/lang/ref/WeakReference;

    .line 40
    .line 41
    const/16 v4, 0x3ef

    .line 42
    .line 43
    const-string v5, "First frame capture completed"

    .line 44
    .line 45
    invoke-static {v0, v4, v5}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iput-boolean v2, p0, Lcom/tencent/liteav/c;->i:Z

    .line 49
    .line 50
    iput-boolean v2, p0, Lcom/tencent/liteav/c;->r:Z

    .line 51
    .line 52
    const-string v0, "trtc_render: render first frame"

    .line 53
    .line 54
    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    new-instance v0, Lcom/tencent/liteav/basic/structs/b;

    .line 58
    .line 59
    invoke-direct {v0}, Lcom/tencent/liteav/basic/structs/b;-><init>()V

    .line 60
    .line 61
    .line 62
    iget-object v4, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 63
    .line 64
    invoke-virtual {v4}, Lcom/tencent/liteav/capturer/a;->j()I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    iput v4, v0, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 69
    .line 70
    iget-object v4, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 71
    .line 72
    invoke-virtual {v4}, Lcom/tencent/liteav/capturer/a;->k()I

    .line 73
    .line 74
    .line 75
    move-result v4

    .line 76
    iput v4, v0, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 77
    .line 78
    iget-object v4, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 79
    .line 80
    iget v5, v4, Lcom/tencent/liteav/g;->a:I

    .line 81
    .line 82
    iput v5, v0, Lcom/tencent/liteav/basic/structs/b;->g:I

    .line 83
    .line 84
    iget v4, v4, Lcom/tencent/liteav/g;->b:I

    .line 85
    .line 86
    iput v4, v0, Lcom/tencent/liteav/basic/structs/b;->h:I

    .line 87
    .line 88
    iget-object v4, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 89
    .line 90
    invoke-virtual {v4}, Lcom/tencent/liteav/capturer/a;->h()I

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    iput v4, v0, Lcom/tencent/liteav/basic/structs/b;->j:I

    .line 95
    .line 96
    iget-object v4, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 97
    .line 98
    invoke-virtual {v4}, Lcom/tencent/liteav/capturer/a;->i()Z

    .line 99
    .line 100
    .line 101
    move-result v4

    .line 102
    iget-object v5, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 103
    .line 104
    if-eqz v4, :cond_3

    .line 105
    .line 106
    iget-boolean v4, v5, Lcom/tencent/liteav/g;->S:Z

    .line 107
    .line 108
    if-nez v4, :cond_2

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    move v2, v3

    .line 112
    goto :goto_0

    .line 113
    :cond_3
    iget-boolean v2, v5, Lcom/tencent/liteav/g;->S:Z

    .line 114
    .line 115
    :goto_0
    iput-boolean v2, v0, Lcom/tencent/liteav/basic/structs/b;->i:Z

    .line 116
    .line 117
    iput p1, v0, Lcom/tencent/liteav/basic/structs/b;->a:I

    .line 118
    .line 119
    iput-object p3, v0, Lcom/tencent/liteav/basic/structs/b;->c:[F

    .line 120
    .line 121
    iget-object p1, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 122
    .line 123
    iget-boolean p3, p1, Lcom/tencent/liteav/g;->W:Z

    .line 124
    .line 125
    iput-boolean p3, v0, Lcom/tencent/liteav/basic/structs/b;->d:Z

    .line 126
    .line 127
    iput-object p2, v0, Lcom/tencent/liteav/basic/structs/b;->m:[B

    .line 128
    .line 129
    iput p4, v0, Lcom/tencent/liteav/basic/structs/b;->b:I

    .line 130
    .line 131
    iget p2, v0, Lcom/tencent/liteav/basic/structs/b;->j:I

    .line 132
    .line 133
    if-eqz p2, :cond_5

    .line 134
    .line 135
    const/16 p3, 0xb4

    .line 136
    .line 137
    if-ne p2, p3, :cond_4

    .line 138
    .line 139
    goto :goto_1

    .line 140
    :cond_4
    iget p2, p1, Lcom/tencent/liteav/g;->a:I

    .line 141
    .line 142
    iput p2, v0, Lcom/tencent/liteav/basic/structs/b;->g:I

    .line 143
    .line 144
    iget p2, p1, Lcom/tencent/liteav/g;->b:I

    .line 145
    .line 146
    iput p2, v0, Lcom/tencent/liteav/basic/structs/b;->h:I

    .line 147
    .line 148
    goto :goto_2

    .line 149
    :cond_5
    :goto_1
    iget p2, p1, Lcom/tencent/liteav/g;->b:I

    .line 150
    .line 151
    iput p2, v0, Lcom/tencent/liteav/basic/structs/b;->g:I

    .line 152
    .line 153
    iget p2, p1, Lcom/tencent/liteav/g;->a:I

    .line 154
    .line 155
    iput p2, v0, Lcom/tencent/liteav/basic/structs/b;->h:I

    .line 156
    .line 157
    :goto_2
    iget p2, v0, Lcom/tencent/liteav/basic/structs/b;->e:I

    .line 158
    .line 159
    iget p3, v0, Lcom/tencent/liteav/basic/structs/b;->f:I

    .line 160
    .line 161
    iget p4, p1, Lcom/tencent/liteav/g;->b:I

    .line 162
    .line 163
    iget p1, p1, Lcom/tencent/liteav/g;->a:I

    .line 164
    .line 165
    invoke-static {p2, p3, p4, p1}, Lcom/tencent/liteav/basic/util/f;->a(IIII)Lcom/tencent/liteav/basic/c/a;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iput-object p1, v0, Lcom/tencent/liteav/basic/structs/b;->l:Lcom/tencent/liteav/basic/c/a;

    .line 170
    .line 171
    iget-object p1, p0, Lcom/tencent/liteav/c;->d:Lcom/tencent/liteav/l;

    .line 172
    .line 173
    if-eqz p1, :cond_6

    .line 174
    .line 175
    invoke-interface {p1, v0}, Lcom/tencent/liteav/l;->b(Lcom/tencent/liteav/basic/structs/b;)V

    .line 176
    .line 177
    .line 178
    :cond_6
    iget-boolean p1, p0, Lcom/tencent/liteav/c;->r:Z

    .line 179
    .line 180
    if-eqz p1, :cond_7

    .line 181
    .line 182
    iput-boolean v3, p0, Lcom/tencent/liteav/c;->r:Z

    .line 183
    .line 184
    iget p1, v0, Lcom/tencent/liteav/basic/structs/b;->g:I

    .line 185
    .line 186
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    iget p2, v0, Lcom/tencent/liteav/basic/structs/b;->h:I

    .line 191
    .line 192
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 193
    .line 194
    .line 195
    move-result-object p2

    .line 196
    iget p3, v0, Lcom/tencent/liteav/basic/structs/b;->j:I

    .line 197
    .line 198
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 199
    .line 200
    .line 201
    move-result-object p3

    .line 202
    filled-new-array {p1, p2, p3}, [Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    const-string p2, "vsize onCaptureFrame w*h:%d*%d angle:%d"

    .line 207
    .line 208
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    invoke-static {v1, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    :cond_7
    iget-wide p1, p0, Lcom/tencent/liteav/c;->j:J

    .line 216
    .line 217
    const-wide/16 p3, 0x1

    .line 218
    .line 219
    add-long/2addr p1, p3

    .line 220
    iput-wide p1, p0, Lcom/tencent/liteav/c;->j:J

    .line 221
    .line 222
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 223
    .line 224
    .line 225
    move-result-wide p1

    .line 226
    iget-wide p3, p0, Lcom/tencent/liteav/c;->k:J

    .line 227
    .line 228
    sub-long/2addr p1, p3

    .line 229
    const-wide/16 p3, 0x3e8

    .line 230
    .line 231
    cmp-long p3, p1, p3

    .line 232
    .line 233
    if-ltz p3, :cond_8

    .line 234
    .line 235
    iget-wide p3, p0, Lcom/tencent/liteav/c;->j:J

    .line 236
    .line 237
    iget-wide v0, p0, Lcom/tencent/liteav/c;->l:J

    .line 238
    .line 239
    sub-long/2addr p3, v0

    .line 240
    long-to-double p3, p3

    .line 241
    const-wide v0, 0x408f400000000000L    # 1000.0

    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    mul-double/2addr p3, v0

    .line 247
    long-to-double v0, p1

    .line 248
    div-double/2addr p3, v0

    .line 249
    iget-object v0, p0, Lcom/tencent/liteav/c;->q:Ljava/lang/String;

    .line 250
    .line 251
    iget v1, p0, Lcom/tencent/liteav/c;->m:I

    .line 252
    .line 253
    invoke-static {p3, p4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 254
    .line 255
    .line 256
    move-result-object p3

    .line 257
    const/16 p4, 0x3e9

    .line 258
    .line 259
    invoke-static {v0, p4, v1, p3}, Lcom/tencent/liteav/basic/module/TXCStatus;->a(Ljava/lang/String;IILjava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    iget-wide p3, p0, Lcom/tencent/liteav/c;->j:J

    .line 263
    .line 264
    iput-wide p3, p0, Lcom/tencent/liteav/c;->l:J

    .line 265
    .line 266
    iget-wide p3, p0, Lcom/tencent/liteav/c;->k:J

    .line 267
    .line 268
    add-long/2addr p3, p1

    .line 269
    iput-wide p3, p0, Lcom/tencent/liteav/c;->k:J

    .line 270
    .line 271
    :cond_8
    :goto_3
    return-void
.end method

.method public static synthetic b(Lcom/tencent/liteav/c;)Z
    .locals 0

    .line 201
    invoke-direct {p0}, Lcom/tencent/liteav/c;->o()Z

    move-result p0

    return p0
.end method

.method public static synthetic c(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/capturer/a;
    .locals 0

    .line 191
    iget-object p0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    return-object p0
.end method

.method private c(Landroid/graphics/SurfaceTexture;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/tencent/liteav/c;->e:Z

    .line 4
    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/tencent/liteav/capturer/a;->a(Lcom/tencent/liteav/capturer/b;)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/capturer/a;->a(Landroid/graphics/SurfaceTexture;)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 20
    .line 21
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 22
    .line 23
    iget v0, v0, Lcom/tencent/liteav/g;->h:I

    .line 24
    .line 25
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/capturer/a;->a(I)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 29
    .line 30
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 31
    .line 32
    iget v0, v0, Lcom/tencent/liteav/g;->l:I

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/capturer/a;->c(I)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 38
    .line 39
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 40
    .line 41
    iget-boolean v0, v0, Lcom/tencent/liteav/g;->K:Z

    .line 42
    .line 43
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/capturer/a;->c(Z)V

    .line 44
    .line 45
    .line 46
    iget-object p1, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 47
    .line 48
    invoke-direct {p0}, Lcom/tencent/liteav/c;->n()Lcom/tencent/liteav/capturer/a$a;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/capturer/a;->a(Lcom/tencent/liteav/capturer/a$a;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 56
    .line 57
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 58
    .line 59
    iget-boolean v1, v0, Lcom/tencent/liteav/g;->W:Z

    .line 60
    .line 61
    iget v2, v0, Lcom/tencent/liteav/g;->a:I

    .line 62
    .line 63
    iget v0, v0, Lcom/tencent/liteav/g;->b:I

    .line 64
    .line 65
    invoke-virtual {p1, v1, v2, v0}, Lcom/tencent/liteav/capturer/a;->a(ZII)V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 69
    .line 70
    iget p1, p1, Lcom/tencent/liteav/g;->a:I

    .line 71
    .line 72
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 77
    .line 78
    iget v0, v0, Lcom/tencent/liteav/g;->b:I

    .line 79
    .line 80
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    iget-object v1, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 85
    .line 86
    iget v1, v1, Lcom/tencent/liteav/g;->l:I

    .line 87
    .line 88
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    filled-new-array {p1, v0, v1}, [Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    const-string v0, "vsize startCapture w*h:%d*%d orientation:%d"

    .line 97
    .line 98
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    const-string v0, "CameraCapture"

    .line 103
    .line 104
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 108
    .line 109
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 110
    .line 111
    iget-boolean v0, v0, Lcom/tencent/liteav/g;->m:Z

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/capturer/a;->d(Z)I

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    const/4 v0, 0x0

    .line 118
    if-nez p1, :cond_1

    .line 119
    .line 120
    const/4 p1, 0x1

    .line 121
    iput-boolean p1, p0, Lcom/tencent/liteav/c;->e:Z

    .line 122
    .line 123
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 124
    .line 125
    .line 126
    move-result-wide v1

    .line 127
    iput-wide v1, p0, Lcom/tencent/liteav/c;->k:J

    .line 128
    .line 129
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iget-object v1, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 138
    .line 139
    iget-boolean v1, v1, Lcom/tencent/liteav/g;->m:Z

    .line 140
    .line 141
    if-eqz v1, :cond_0

    .line 142
    .line 143
    const-string v1, "front"

    .line 144
    .line 145
    goto :goto_0

    .line 146
    :cond_0
    const-string v1, "back"

    .line 147
    .line 148
    :goto_0
    filled-new-array {p1, v1}, [Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    const-string v1, "VideoCapture[%d]: start %s camera successfully"

    .line 153
    .line 154
    invoke-static {v1, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    const-string v1, ""

    .line 159
    .line 160
    const/4 v2, 0x2

    .line 161
    invoke-static {v2, p1, v1, v0}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 162
    .line 163
    .line 164
    const/16 p1, 0x3eb

    .line 165
    .line 166
    const-string v1, "Enabled camera successfully"

    .line 167
    .line 168
    invoke-direct {p0, p1, v1}, Lcom/tencent/liteav/c;->a(ILjava/lang/String;)V

    .line 169
    .line 170
    .line 171
    iput-boolean v0, p0, Lcom/tencent/liteav/c;->i:Z

    .line 172
    .line 173
    return-void

    .line 174
    :cond_1
    iput-boolean v0, p0, Lcom/tencent/liteav/c;->e:Z

    .line 175
    .line 176
    const/16 p1, -0x515

    .line 177
    .line 178
    const-string v0, "Failed to open camera, please confirm whether the camera permission is turned on"

    .line 179
    .line 180
    invoke-direct {p0, p1, v0}, Lcom/tencent/liteav/c;->a(ILjava/lang/String;)V

    .line 181
    .line 182
    .line 183
    :cond_2
    return-void
.end method

.method public static synthetic d(Lcom/tencent/liteav/c;)Lcom/tencent/liteav/basic/c/m;
    .locals 0

    .line 10
    iget-object p0, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    return-object p0
.end method

.method public static synthetic e(Lcom/tencent/liteav/c;)Landroid/os/Handler;
    .locals 0

    .line 54
    iget-object p0, p0, Lcom/tencent/liteav/c;->p:Landroid/os/Handler;

    return-object p0
.end method

.method private n()Lcom/tencent/liteav/capturer/a$a;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/tencent/liteav/g;->T:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/tencent/liteav/capturer/a$a;->i:Lcom/tencent/liteav/capturer/a$a;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    sget-object v0, Lcom/tencent/liteav/c$3;->a:[I

    .line 11
    .line 12
    iget-object p0, p0, Lcom/tencent/liteav/g;->k:Lcom/tencent/liteav/basic/a/c;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    aget p0, v0, p0

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    if-eq p0, v0, :cond_5

    .line 22
    .line 23
    const/4 v0, 0x2

    .line 24
    if-eq p0, v0, :cond_4

    .line 25
    .line 26
    const/4 v0, 0x3

    .line 27
    if-eq p0, v0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    if-eq p0, v0, :cond_2

    .line 31
    .line 32
    const/4 v0, 0x5

    .line 33
    if-eq p0, v0, :cond_1

    .line 34
    .line 35
    sget-object p0, Lcom/tencent/liteav/capturer/a$a;->g:Lcom/tencent/liteav/capturer/a$a;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_1
    sget-object p0, Lcom/tencent/liteav/capturer/a$a;->d:Lcom/tencent/liteav/capturer/a$a;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_2
    sget-object p0, Lcom/tencent/liteav/capturer/a$a;->h:Lcom/tencent/liteav/capturer/a$a;

    .line 42
    .line 43
    return-object p0

    .line 44
    :cond_3
    sget-object p0, Lcom/tencent/liteav/capturer/a$a;->f:Lcom/tencent/liteav/capturer/a$a;

    .line 45
    .line 46
    return-object p0

    .line 47
    :cond_4
    sget-object p0, Lcom/tencent/liteav/capturer/a$a;->e:Lcom/tencent/liteav/capturer/a$a;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_5
    sget-object p0, Lcom/tencent/liteav/capturer/a$a;->a:Lcom/tencent/liteav/capturer/a$a;

    .line 51
    .line 52
    return-object p0
.end method

.method private o()Z
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/tencent/liteav/c;->b:Landroid/content/Context;

    .line 3
    .line 4
    if-eqz v1, :cond_3

    .line 5
    .line 6
    const-string v2, "activity"

    .line 7
    .line 8
    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Landroid/app/ActivityManager;

    .line 13
    .line 14
    invoke-virtual {v1}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    const-string v2, "CameraCapture"

    .line 19
    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    :try_start_1
    const-string p0, "List of RunningAppProcessInfo is null"

    .line 23
    .line 24
    invoke-static {v2, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return v0

    .line 28
    :cond_0
    move v3, v0

    .line 29
    :goto_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-ge v3, v4, :cond_3

    .line 34
    .line 35
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    check-cast v4, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 40
    .line 41
    if-nez v4, :cond_1

    .line 42
    .line 43
    const-string v4, "ActivityManager.RunningAppProcessInfo is null"

    .line 44
    .line 45
    invoke-static {v2, v4}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    iget-object v5, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 50
    .line 51
    iget-object v6, p0, Lcom/tencent/liteav/c;->b:Landroid/content/Context;

    .line 52
    .line 53
    invoke-virtual {v6}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v5

    .line 61
    if-eqz v5, :cond_2

    .line 62
    .line 63
    iget v4, v4, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 64
    .line 65
    const/16 v5, 0x64

    .line 66
    .line 67
    if-ne v4, v5, :cond_2

    .line 68
    .line 69
    const/4 p0, 0x1

    .line 70
    return p0

    .line 71
    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :catch_0
    :cond_3
    return v0
.end method


# virtual methods
.method public a(I[F)I
    .locals 2

    const/4 v0, 0x0

    const/4 v1, 0x4

    .line 305
    invoke-direct {p0, p1, v0, p2, v1}, Lcom/tencent/liteav/c;->a(I[B[FI)V

    const/4 p0, 0x0

    return p0
.end method

.method public a()V
    .locals 4

    .line 272
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const-string v1, "VideoCapture[%d]: start camera"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, ""

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-static {v3, v0, v1, v2}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 273
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "start->enter with getSurfaceTexture:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    invoke-interface {v1}, Lcom/tencent/liteav/basic/c/m;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CameraCapture"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    iget-object v0, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    iget-object v1, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    iget v2, v1, Lcom/tencent/liteav/g;->h:I

    iget-boolean v1, v1, Lcom/tencent/liteav/g;->W:Z

    xor-int/lit8 v1, v1, 0x1

    invoke-interface {v0, v2, v1}, Lcom/tencent/liteav/basic/c/m;->a(IZ)V

    .line 275
    iget-object v0, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    invoke-interface {v0}, Lcom/tencent/liteav/basic/c/m;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/tencent/liteav/c;->c(Landroid/graphics/SurfaceTexture;)V

    return-void
.end method

.method public a(FF)V
    .locals 1

    .line 298
    iget-object v0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    iget-boolean p0, p0, Lcom/tencent/liteav/g;->K:Z

    if-eqz p0, :cond_0

    .line 299
    invoke-virtual {v0, p1, p2}, Lcom/tencent/liteav/capturer/a;->a(FF)V

    :cond_0
    return-void
.end method

.method public a(II)V
    .locals 0

    .line 290
    iget-object p0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    int-to-float p1, p1

    int-to-float p2, p2

    invoke-virtual {p0, p1, p2}, Lcom/tencent/liteav/capturer/a;->a(FF)V

    return-void
.end method

.method public a(Landroid/graphics/SurfaceTexture;)V
    .locals 2

    .line 301
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "onSurfaceTextureAvailable->enter with mListener:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/tencent/liteav/c;->d:Lcom/tencent/liteav/l;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CameraCapture"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 302
    invoke-direct {p0, p1}, Lcom/tencent/liteav/c;->c(Landroid/graphics/SurfaceTexture;)V

    .line 303
    iget-object p0, p0, Lcom/tencent/liteav/c;->d:Lcom/tencent/liteav/l;

    if-eqz p0, :cond_0

    .line 304
    invoke-interface {p0, p1}, Lcom/tencent/liteav/l;->a(Landroid/graphics/SurfaceTexture;)V

    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/a/c;)V
    .locals 1

    .line 296
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    iput-object p1, v0, Lcom/tencent/liteav/g;->k:Lcom/tencent/liteav/basic/a/c;

    const/4 p1, 0x1

    .line 297
    iput-boolean p1, p0, Lcom/tencent/liteav/c;->r:Z

    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/b/b;)V
    .locals 1

    .line 295
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/tencent/liteav/c;->a:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/structs/b;)V
    .locals 7

    .line 292
    iget-object v0, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    if-eqz v0, :cond_0

    .line 293
    iget v1, p1, Lcom/tencent/liteav/basic/structs/b;->a:I

    iget-boolean v2, p1, Lcom/tencent/liteav/basic/structs/b;->i:Z

    iget v3, p0, Lcom/tencent/liteav/c;->g:I

    iget v4, p1, Lcom/tencent/liteav/basic/structs/b;->e:I

    iget v5, p1, Lcom/tencent/liteav/basic/structs/b;->f:I

    iget-object p0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->i()Z

    move-result v6

    invoke-interface/range {v0 .. v6}, Lcom/tencent/liteav/basic/c/m;->a(IZIIIZ)V

    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/liteav/l;)V
    .locals 0

    .line 291
    iput-object p1, p0, Lcom/tencent/liteav/c;->d:Lcom/tencent/liteav/l;

    return-void
.end method

.method public a(Ljava/lang/Runnable;)V
    .locals 0

    .line 294
    iget-object p0, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    invoke-interface {p0, p1}, Lcom/tencent/liteav/basic/c/m;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public a(Ljava/lang/String;)V
    .locals 0

    .line 288
    iput-object p1, p0, Lcom/tencent/liteav/c;->q:Ljava/lang/String;

    return-void
.end method

.method public a(Z)V
    .locals 3

    .line 276
    const-string p1, "VideoCapture[%d]: stop camera"

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, ""

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-static {v2, p1, v0, v1}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 277
    invoke-virtual {p0}, Lcom/tencent/liteav/c;->c()V

    .line 278
    iget-object p1, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    invoke-interface {p1}, Lcom/tencent/liteav/basic/c/m;->a()V

    .line 279
    iget-object p1, p0, Lcom/tencent/liteav/c;->n:Ljava/lang/Object;

    monitor-enter p1

    .line 280
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/c;->p:Landroid/os/Handler;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 281
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 282
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/tencent/liteav/c;->o:Landroid/os/HandlerThread;

    if-eqz v0, :cond_1

    .line 283
    const-string v0, "CameraCapture"

    const-string v2, "stop camera monitor "

    invoke-static {v0, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    iget-object v0, p0, Lcom/tencent/liteav/c;->o:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    .line 285
    iput-object v1, p0, Lcom/tencent/liteav/c;->o:Landroid/os/HandlerThread;

    .line 286
    iput-object v1, p0, Lcom/tencent/liteav/c;->p:Landroid/os/Handler;

    .line 287
    :cond_1
    monitor-exit p1

    return-void

    :goto_1
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a([B)V
    .locals 0

    .line 308
    iget-object p0, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    if-eqz p0, :cond_0

    .line 309
    invoke-interface {p0, p1}, Lcom/tencent/liteav/basic/c/m;->a([B)V

    :cond_0
    return-void
.end method

.method public a([B[F)V
    .locals 2

    const/4 v0, -0x1

    const/4 v1, 0x3

    .line 306
    invoke-direct {p0, v0, p1, p2, v1}, Lcom/tencent/liteav/c;->a(I[B[FI)V

    return-void
.end method

.method public a(I)Z
    .locals 0

    .line 289
    iget-object p0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/capturer/a;->b(I)Z

    move-result p0

    return p0
.end method

.method public b()V
    .locals 2

    .line 199
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "startCapture->enter with getSurfaceTexture:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    invoke-interface {v1}, Lcom/tencent/liteav/basic/c/m;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "CameraCapture"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    iget-object v0, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    invoke-interface {v0}, Lcom/tencent/liteav/basic/c/m;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/tencent/liteav/c;->c(Landroid/graphics/SurfaceTexture;)V

    return-void
.end method

.method public b(I)V
    .locals 0

    .line 202
    iput p1, p0, Lcom/tencent/liteav/c;->g:I

    return-void
.end method

.method public b(II)V
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    iput p1, v0, Lcom/tencent/liteav/g;->a:I

    .line 204
    iput p2, v0, Lcom/tencent/liteav/g;->b:I

    const/4 p2, 0x1

    .line 205
    iput-boolean p2, p0, Lcom/tencent/liteav/c;->r:Z

    .line 206
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iget-object p2, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    iget p2, p2, Lcom/tencent/liteav/g;->b:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    iget-object p0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    iget p0, p0, Lcom/tencent/liteav/g;->l:I

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    filled-new-array {p1, p2, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p1, "vsize setVideoEncSize w*h:%d*%d orientation:%d"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string p1, "CameraCapture"

    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public b(Landroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 207
    invoke-virtual {p0}, Lcom/tencent/liteav/c;->c()V

    .line 208
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "onSurfaceTextureDestroy->enter with mListener:"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/tencent/liteav/c;->d:Lcom/tencent/liteav/l;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "CameraCapture"

    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 209
    iget-object p0, p0, Lcom/tencent/liteav/c;->d:Lcom/tencent/liteav/l;

    if-eqz p0, :cond_0

    .line 210
    invoke-interface {p0}, Lcom/tencent/liteav/l;->q()V

    :cond_0
    return-void
.end method

.method public b(Z)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/c;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 6
    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    iget-object v1, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 10
    .line 11
    const/4 v2, 0x1

    .line 12
    const/4 v3, 0x0

    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    iget-boolean p1, v1, Lcom/tencent/liteav/g;->m:Z

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    move p1, v2

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move p1, v3

    .line 22
    goto :goto_0

    .line 23
    :cond_1
    iget-boolean p1, v1, Lcom/tencent/liteav/g;->m:Z

    .line 24
    .line 25
    :goto_0
    iput-boolean p1, v1, Lcom/tencent/liteav/g;->m:Z

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/tencent/liteav/capturer/a;->g()V

    .line 28
    .line 29
    .line 30
    iget-object p1, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    .line 31
    .line 32
    invoke-interface {p1, v3}, Lcom/tencent/liteav/basic/c/m;->a(Z)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 36
    .line 37
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 38
    .line 39
    iget v0, v0, Lcom/tencent/liteav/g;->h:I

    .line 40
    .line 41
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/capturer/a;->a(I)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 45
    .line 46
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 47
    .line 48
    iget v0, v0, Lcom/tencent/liteav/g;->l:I

    .line 49
    .line 50
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/capturer/a;->c(I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 54
    .line 55
    invoke-direct {p0}, Lcom/tencent/liteav/c;->n()Lcom/tencent/liteav/capturer/a$a;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/capturer/a;->a(Lcom/tencent/liteav/capturer/a$a;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 63
    .line 64
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 65
    .line 66
    iget-boolean v1, v0, Lcom/tencent/liteav/g;->W:Z

    .line 67
    .line 68
    iget v4, v0, Lcom/tencent/liteav/g;->a:I

    .line 69
    .line 70
    iget v0, v0, Lcom/tencent/liteav/g;->b:I

    .line 71
    .line 72
    invoke-virtual {p1, v1, v4, v0}, Lcom/tencent/liteav/capturer/a;->a(ZII)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 76
    .line 77
    invoke-virtual {p1, p0}, Lcom/tencent/liteav/capturer/a;->a(Lcom/tencent/liteav/capturer/b;)V

    .line 78
    .line 79
    .line 80
    iget-object p1, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 81
    .line 82
    iget-object v0, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    .line 83
    .line 84
    invoke-interface {v0}, Lcom/tencent/liteav/basic/c/m;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/capturer/a;->a(Landroid/graphics/SurfaceTexture;)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 92
    .line 93
    iget p1, p1, Lcom/tencent/liteav/g;->a:I

    .line 94
    .line 95
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 100
    .line 101
    iget v0, v0, Lcom/tencent/liteav/g;->b:I

    .line 102
    .line 103
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iget-object v1, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 108
    .line 109
    iget v1, v1, Lcom/tencent/liteav/g;->l:I

    .line 110
    .line 111
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    filled-new-array {p1, v0, v1}, [Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    const-string v0, "vsize refreshCapture w*h:%d*%d orientation:%d"

    .line 120
    .line 121
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    const-string v0, "CameraCapture"

    .line 126
    .line 127
    invoke-static {v0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-object p1, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 131
    .line 132
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 133
    .line 134
    iget-boolean v0, v0, Lcom/tencent/liteav/g;->m:Z

    .line 135
    .line 136
    invoke-virtual {p1, v0}, Lcom/tencent/liteav/capturer/a;->d(Z)I

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-nez p1, :cond_3

    .line 141
    .line 142
    iput-boolean v2, p0, Lcom/tencent/liteav/c;->e:Z

    .line 143
    .line 144
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 145
    .line 146
    .line 147
    move-result p1

    .line 148
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 153
    .line 154
    iget-boolean v0, v0, Lcom/tencent/liteav/g;->m:Z

    .line 155
    .line 156
    if-eqz v0, :cond_2

    .line 157
    .line 158
    const-string v0, "front"

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_2
    const-string v0, "back"

    .line 162
    .line 163
    :goto_1
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    const-string v0, "VideoCapture[%d]: start %s camera successfully"

    .line 168
    .line 169
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p1

    .line 173
    const-string v0, ""

    .line 174
    .line 175
    const/4 v1, 0x2

    .line 176
    invoke-static {v1, p1, v0, v3}, Lcom/tencent/liteav/basic/module/Monitor;->a(ILjava/lang/String;Ljava/lang/String;I)V

    .line 177
    .line 178
    .line 179
    const/16 p1, 0x3eb

    .line 180
    .line 181
    const-string v0, "Enabled camera successfully"

    .line 182
    .line 183
    invoke-direct {p0, p1, v0}, Lcom/tencent/liteav/c;->a(ILjava/lang/String;)V

    .line 184
    .line 185
    .line 186
    goto :goto_2

    .line 187
    :cond_3
    iput-boolean v3, p0, Lcom/tencent/liteav/c;->e:Z

    .line 188
    .line 189
    const/16 p1, -0x515

    .line 190
    .line 191
    const-string v0, "Failed to open the camera, please confirm whether the camera permission is turned on"

    .line 192
    .line 193
    invoke-direct {p0, p1, v0}, Lcom/tencent/liteav/c;->a(ILjava/lang/String;)V

    .line 194
    .line 195
    .line 196
    :goto_2
    iput-boolean v3, p0, Lcom/tencent/liteav/c;->i:Z

    .line 197
    .line 198
    :cond_4
    return-void
.end method

.method public c()V
    .locals 2

    .line 184
    const-string v0, "CameraCapture"

    const-string v1, "stopCapture->enter with null"

    invoke-static {v0, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    iget-object v0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/tencent/liteav/capturer/a;->a(Lcom/tencent/liteav/capturer/b;)V

    .line 186
    iget-object v0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    invoke-virtual {v0}, Lcom/tencent/liteav/capturer/a;->g()V

    const/4 v0, 0x0

    .line 187
    iput-boolean v0, p0, Lcom/tencent/liteav/c;->e:Z

    return-void
.end method

.method public c(I)V
    .locals 0

    .line 188
    iget-object p0, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    if-eqz p0, :cond_0

    .line 189
    invoke-interface {p0, p1}, Lcom/tencent/liteav/basic/c/m;->setRendMode(I)V

    :cond_0
    return-void
.end method

.method public c(Z)V
    .locals 1

    .line 190
    new-instance v0, Lcom/tencent/liteav/c$1;

    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/c$1;-><init>(Lcom/tencent/liteav/c;Z)V

    invoke-virtual {p0, v0}, Lcom/tencent/liteav/c;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public d(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/tencent/liteav/basic/c/m;->setRendMirror(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public d()Z
    .locals 0

    .line 9
    iget-boolean p0, p0, Lcom/tencent/liteav/c;->e:Z

    return p0
.end method

.method public d(Z)Z
    .locals 0

    .line 11
    iget-object p0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    invoke-virtual {p0, p1}, Lcom/tencent/liteav/capturer/a;->a(Z)Z

    move-result p0

    return p0
.end method

.method public e()I
    .locals 0

    .line 53
    iget-object p0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->f()I

    move-result p0

    return p0
.end method

.method public e(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 2
    .line 3
    iput p1, v0, Lcom/tencent/liteav/g;->l:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/capturer/a;->c(I)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lcom/tencent/liteav/c;->r:Z

    .line 12
    .line 13
    iget-object p1, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 14
    .line 15
    iget p1, p1, Lcom/tencent/liteav/g;->a:I

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 22
    .line 23
    iget v0, v0, Lcom/tencent/liteav/g;->b:I

    .line 24
    .line 25
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 30
    .line 31
    iget p0, p0, Lcom/tencent/liteav/g;->l:I

    .line 32
    .line 33
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    filled-new-array {p1, v0, p0}, [Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const-string p1, "vsize setCaptureOrientation w*h:%d*%d orientation:%d"

    .line 42
    .line 43
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    const-string p1, "CameraCapture"

    .line 48
    .line 49
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public e(Z)V
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    iput-boolean p1, v0, Lcom/tencent/liteav/g;->U:Z

    .line 56
    iget-object v0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    invoke-virtual {v0, p1}, Lcom/tencent/liteav/capturer/a;->b(Z)V

    const/4 p1, 0x1

    .line 57
    iput-boolean p1, p0, Lcom/tencent/liteav/c;->r:Z

    return-void
.end method

.method public f()Ljavax/microedition/khronos/egl/EGLContext;
    .locals 0

    .line 26
    iget-object p0, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    invoke-interface {p0}, Lcom/tencent/liteav/basic/c/m;->getGLContext()Ljavax/microedition/khronos/egl/EGLContext;

    move-result-object p0

    return-object p0
.end method

.method public f(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 2
    .line 3
    iput p1, v0, Lcom/tencent/liteav/g;->h:I

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/tencent/liteav/capturer/a;->a(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/c;->h:Lcom/tencent/liteav/basic/c/m;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    instance-of v0, p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    check-cast p0, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/tencent/liteav/renderer/TXCGLSurfaceView;->setFPS(I)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public g()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/c;->f:Lcom/tencent/liteav/g;

    .line 2
    .line 3
    iget p0, p0, Lcom/tencent/liteav/g;->h:I

    .line 4
    .line 5
    return p0
.end method

.method public g(I)V
    .locals 0

    .line 6
    iput p1, p0, Lcom/tencent/liteav/c;->m:I

    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->b()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public i()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->c()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public j()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->d()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public k()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->e()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public l()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/tencent/liteav/capturer/a;->i()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public m()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/liteav/capturer/a;->l()Landroid/hardware/Camera;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/tencent/liteav/c;->c:Lcom/tencent/liteav/capturer/a;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/tencent/liteav/capturer/a;->g()V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Lcom/tencent/liteav/c;->n:Ljava/lang/Object;

    .line 15
    .line 16
    monitor-enter v0

    .line 17
    :try_start_0
    iget-object v1, p0, Lcom/tencent/liteav/c;->o:Landroid/os/HandlerThread;

    .line 18
    .line 19
    if-nez v1, :cond_1

    .line 20
    .line 21
    new-instance v1, Landroid/os/HandlerThread;

    .line 22
    .line 23
    const-string v2, "cameraMonitorThread"

    .line 24
    .line 25
    invoke-direct {v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lcom/tencent/liteav/c;->o:Landroid/os/HandlerThread;

    .line 29
    .line 30
    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    .line 31
    .line 32
    .line 33
    new-instance v1, Landroid/os/Handler;

    .line 34
    .line 35
    iget-object v2, p0, Lcom/tencent/liteav/c;->o:Landroid/os/HandlerThread;

    .line 36
    .line 37
    invoke-virtual {v2}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Lcom/tencent/liteav/c;->p:Landroid/os/Handler;

    .line 45
    .line 46
    const-string v1, "CameraCapture"

    .line 47
    .line 48
    const-string v2, "start camera monitor "

    .line 49
    .line 50
    invoke-static {v1, v2}, Lcom/tencent/liteav/basic/log/TXCLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/tencent/liteav/c;->p:Landroid/os/Handler;

    .line 57
    .line 58
    if-eqz v1, :cond_2

    .line 59
    .line 60
    new-instance v2, Lcom/tencent/liteav/c$2;

    .line 61
    .line 62
    invoke-direct {v2, p0}, Lcom/tencent/liteav/c$2;-><init>(Lcom/tencent/liteav/c;)V

    .line 63
    .line 64
    .line 65
    const-wide/16 v3, 0x7d0

    .line 66
    .line 67
    invoke-virtual {v1, v2, v3, v4}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 68
    .line 69
    .line 70
    :cond_2
    monitor-exit v0

    .line 71
    return-void

    .line 72
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 73
    throw p0
.end method

.method public onNotifyEvent(ILandroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/c;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/tencent/liteav/basic/util/f;->a(Ljava/lang/ref/WeakReference;ILandroid/os/Bundle;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
