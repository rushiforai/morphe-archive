.class Lcom/tencent/rtmp/a/b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/rtmp/a/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field private a:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/rtmp/a/b;",
            ">;"
        }
    .end annotation
.end field

.field private b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/tencent/rtmp/a/b;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/rtmp/a/b$a;->a:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/tencent/rtmp/a/b$a;->b:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private a(Ljava/lang/String;)F
    .locals 4

    .line 1
    const-string p0, ":"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    array-length p1, p0

    .line 8
    const/4 v0, 0x3

    .line 9
    const/4 v1, 0x2

    .line 10
    const/4 v2, 0x1

    .line 11
    const/4 v3, 0x0

    .line 12
    if-ne p1, v0, :cond_0

    .line 13
    .line 14
    aget-object p1, p0, v3

    .line 15
    .line 16
    aget-object p1, p0, v2

    .line 17
    .line 18
    aget-object p0, p0, v1

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    array-length p1, p0

    .line 22
    if-ne p1, v1, :cond_1

    .line 23
    .line 24
    aget-object p1, p0, v3

    .line 25
    .line 26
    aget-object p0, p0, v2

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    array-length p1, p0

    .line 30
    const/4 v0, 0x0

    .line 31
    if-ne p1, v2, :cond_2

    .line 32
    .line 33
    aget-object p0, p0, v3

    .line 34
    .line 35
    move-object p1, v0

    .line 36
    goto :goto_0

    .line 37
    :cond_2
    move-object p0, v0

    .line 38
    move-object p1, p0

    .line 39
    :goto_0
    const/4 v0, 0x0

    .line 40
    if-eqz p1, :cond_3

    .line 41
    .line 42
    invoke-static {p1}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    const/high16 v1, 0x42700000    # 60.0f

    .line 51
    .line 52
    mul-float/2addr p1, v1

    .line 53
    add-float/2addr v0, p1

    .line 54
    :cond_3
    if-eqz p0, :cond_4

    .line 55
    .line 56
    invoke-static {p0}, Ljava/lang/Float;->valueOf(Ljava/lang/String;)Ljava/lang/Float;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0}, Ljava/lang/Float;->floatValue()F

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    add-float/2addr v0, p0

    .line 65
    :cond_4
    return v0
.end method


# virtual methods
.method public run()V
    .locals 11

    .line 1
    const-string v0, "TXImageSprite"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/rtmp/a/b$a;->a:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    check-cast v1, Lcom/tencent/rtmp/a/b;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    :try_start_0
    iget-object v3, p0, Lcom/tencent/rtmp/a/b$a;->b:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {v1, v3}, Lcom/tencent/rtmp/a/b;->a(Lcom/tencent/rtmp/a/b;Ljava/lang/String;)Ljava/io/InputStream;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    goto/16 :goto_4

    .line 21
    .line 22
    :cond_0
    new-instance v4, Ljava/io/BufferedReader;

    .line 23
    .line 24
    new-instance v5, Ljava/io/InputStreamReader;

    .line 25
    .line 26
    invoke-direct {v5, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    .line 27
    .line 28
    .line 29
    invoke-direct {v4, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 30
    .line 31
    .line 32
    :try_start_1
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-eqz v2, :cond_6

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    if-eqz v3, :cond_6

    .line 43
    .line 44
    const-string v3, "WEBVTT"

    .line 45
    .line 46
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-nez v2, :cond_1

    .line 51
    .line 52
    goto/16 :goto_2

    .line 53
    .line 54
    :cond_1
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    if-eqz v2, :cond_5

    .line 59
    .line 60
    const-string v3, "-->"

    .line 61
    .line 62
    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_5

    .line 67
    .line 68
    const-string v3, " --> "

    .line 69
    .line 70
    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    array-length v5, v3

    .line 75
    const/4 v6, 0x2

    .line 76
    if-eq v5, v6, :cond_2

    .line 77
    .line 78
    goto/16 :goto_1

    .line 79
    .line 80
    :cond_2
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    new-instance v7, Lcom/tencent/rtmp/a/c;

    .line 85
    .line 86
    invoke-direct {v7}, Lcom/tencent/rtmp/a/c;-><init>()V

    .line 87
    .line 88
    .line 89
    const/4 v8, 0x0

    .line 90
    aget-object v9, v3, v8

    .line 91
    .line 92
    invoke-direct {p0, v9}, Lcom/tencent/rtmp/a/b$a;->a(Ljava/lang/String;)F

    .line 93
    .line 94
    .line 95
    move-result v9

    .line 96
    iput v9, v7, Lcom/tencent/rtmp/a/c;->a:F

    .line 97
    .line 98
    const/4 v9, 0x1

    .line 99
    aget-object v3, v3, v9

    .line 100
    .line 101
    invoke-direct {p0, v3}, Lcom/tencent/rtmp/a/b$a;->a(Ljava/lang/String;)F

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    iput v3, v7, Lcom/tencent/rtmp/a/c;->b:F

    .line 106
    .line 107
    iput-object v5, v7, Lcom/tencent/rtmp/a/c;->c:Ljava/lang/String;

    .line 108
    .line 109
    const-string v3, "#"

    .line 110
    .line 111
    invoke-virtual {v5, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result v3

    .line 115
    const/4 v10, -0x1

    .line 116
    if-eq v3, v10, :cond_3

    .line 117
    .line 118
    invoke-virtual {v5, v8, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    iput-object v3, v7, Lcom/tencent/rtmp/a/c;->d:Ljava/lang/String;

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :catchall_0
    move-exception p0

    .line 126
    move-object v2, v4

    .line 127
    goto/16 :goto_5

    .line 128
    .line 129
    :catch_0
    move-exception p0

    .line 130
    move-object v2, v4

    .line 131
    goto/16 :goto_3

    .line 132
    .line 133
    :cond_3
    :goto_0
    const-string v3, "="

    .line 134
    .line 135
    invoke-virtual {v5, v3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    if-eq v3, v10, :cond_4

    .line 140
    .line 141
    add-int/lit8 v3, v3, 0x1

    .line 142
    .line 143
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 144
    .line 145
    .line 146
    move-result v10

    .line 147
    if-ge v3, v10, :cond_4

    .line 148
    .line 149
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 150
    .line 151
    .line 152
    move-result v10

    .line 153
    invoke-virtual {v5, v3, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v3

    .line 157
    const-string v5, ","

    .line 158
    .line 159
    invoke-virtual {v3, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v3

    .line 163
    array-length v5, v3

    .line 164
    const/4 v10, 0x4

    .line 165
    if-ne v5, v10, :cond_4

    .line 166
    .line 167
    aget-object v5, v3, v8

    .line 168
    .line 169
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 170
    .line 171
    .line 172
    move-result-object v5

    .line 173
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 174
    .line 175
    .line 176
    move-result v5

    .line 177
    iput v5, v7, Lcom/tencent/rtmp/a/c;->e:I

    .line 178
    .line 179
    aget-object v5, v3, v9

    .line 180
    .line 181
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 182
    .line 183
    .line 184
    move-result-object v5

    .line 185
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 186
    .line 187
    .line 188
    move-result v5

    .line 189
    iput v5, v7, Lcom/tencent/rtmp/a/c;->f:I

    .line 190
    .line 191
    aget-object v5, v3, v6

    .line 192
    .line 193
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 198
    .line 199
    .line 200
    move-result v5

    .line 201
    iput v5, v7, Lcom/tencent/rtmp/a/c;->g:I

    .line 202
    .line 203
    const/4 v5, 0x3

    .line 204
    aget-object v3, v3, v5

    .line 205
    .line 206
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 207
    .line 208
    .line 209
    move-result-object v3

    .line 210
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 211
    .line 212
    .line 213
    move-result v3

    .line 214
    iput v3, v7, Lcom/tencent/rtmp/a/c;->h:I

    .line 215
    .line 216
    :cond_4
    if-eqz v1, :cond_5

    .line 217
    .line 218
    invoke-static {v1}, Lcom/tencent/rtmp/a/b;->a(Lcom/tencent/rtmp/a/b;)Ljava/util/List;

    .line 219
    .line 220
    .line 221
    move-result-object v3

    .line 222
    if-eqz v3, :cond_5

    .line 223
    .line 224
    invoke-static {v1}, Lcom/tencent/rtmp/a/b;->a(Lcom/tencent/rtmp/a/b;)Ljava/util/List;

    .line 225
    .line 226
    .line 227
    move-result-object v3

    .line 228
    invoke-interface {v3, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 229
    .line 230
    .line 231
    :cond_5
    :goto_1
    if-nez v2, :cond_1

    .line 232
    .line 233
    :try_start_2
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_3

    .line 234
    .line 235
    .line 236
    return-void

    .line 237
    :cond_6
    :goto_2
    :try_start_3
    const-string p0, "DownloadAndParseVTTFileTask : getVTT File Error!"

    .line 238
    .line 239
    invoke-static {v0, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    if-eqz v1, :cond_7

    .line 243
    .line 244
    invoke-static {v1}, Lcom/tencent/rtmp/a/b;->c(Lcom/tencent/rtmp/a/b;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 245
    .line 246
    .line 247
    :cond_7
    :try_start_4
    invoke-virtual {v4}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    .line 248
    .line 249
    .line 250
    :catch_1
    return-void

    .line 251
    :catchall_1
    move-exception p0

    .line 252
    goto :goto_5

    .line 253
    :catch_2
    move-exception p0

    .line 254
    :goto_3
    :try_start_5
    const-string v1, "load image sprite failed."

    .line 255
    .line 256
    invoke-static {v0, v1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 257
    .line 258
    .line 259
    if-eqz v2, :cond_8

    .line 260
    .line 261
    :try_start_6
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3

    .line 262
    .line 263
    .line 264
    :catch_3
    :cond_8
    :goto_4
    return-void

    .line 265
    :goto_5
    if-eqz v2, :cond_9

    .line 266
    .line 267
    :try_start_7
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    .line 268
    .line 269
    .line 270
    :catch_4
    :cond_9
    throw p0
.end method
