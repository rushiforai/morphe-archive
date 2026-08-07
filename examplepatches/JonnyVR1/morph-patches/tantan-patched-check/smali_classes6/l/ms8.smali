.class public Ll/ms8;
.super Ll/dog;
.source "SourceFile"


# instance fields
.field public H:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/p1/mobile/putong/data/KanPostData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/dog;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/a;->b()Lrx/subjects/a;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/ms8;->H:Lrx/subjects/a;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic A0(Ll/ms8;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ms8;->O0(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic B0(Ll/ms8;Ljava/util/List;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ms8;->Q0(Ljava/util/List;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic C0(Ljava/util/List;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/util/List;)Lcom/p1/mobile/putong/data/BubbleInfo;
    .locals 3

    .line 1
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-lez v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/Video;->isFromNewCamera:Z

    .line 23
    .line 24
    if-eqz v1, :cond_1

    .line 25
    .line 26
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-lez v1, :cond_1

    .line 31
    .line 32
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    invoke-interface {p2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Lcom/p1/mobile/putong/data/Video;

    .line 45
    .line 46
    invoke-static {}, Lcom/p1/mobile/putong/data/GifMedia;->new_()Lcom/p1/mobile/putong/data/GifMedia;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Video;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 51
    .line 52
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 53
    .line 54
    iput-object v2, v1, Lcom/p1/mobile/putong/data/GifMedia;->url:Ljava/lang/String;

    .line 55
    .line 56
    const-string v2, "image/gif"

    .line 57
    .line 58
    iput-object v2, v1, Lcom/p1/mobile/putong/data/GifMedia;->type:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/data/AudioMedia;->new_()Lcom/p1/mobile/putong/data/AudioMedia;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Video;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 65
    .line 66
    iget-boolean v2, p0, Lcom/p1/mobile/putong/data/Video;->hasOriginalSound:Z

    .line 67
    .line 68
    if-nez v2, :cond_0

    .line 69
    .line 70
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Video;->isLocalMusic:Z

    .line 71
    .line 72
    if-eqz p0, :cond_1

    .line 73
    .line 74
    :cond_0
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 75
    .line 76
    iput-object p0, v1, Lcom/p1/mobile/putong/data/AudioMedia;->url:Ljava/lang/String;

    .line 77
    .line 78
    const-string p0, "audio/mp3"

    .line 79
    .line 80
    iput-object p0, v1, Lcom/p1/mobile/putong/data/AudioMedia;->type:Ljava/lang/String;

    .line 81
    .line 82
    :cond_1
    iput-object p2, p1, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 83
    .line 84
    return-object p1
.end method

.method public static synthetic D0(Ll/ms8;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ms8;->T0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic E0(Ljava/util/List;)Lrx/c;
    .locals 2

    .line 1
    const-string v0, "myState"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {p0, v0, v1}, Ll/mrb0;->K(Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public static synthetic F0(Ll/ms8;Ljava/lang/String;Ll/y20;Lcom/p1/mobile/putong/data/BubbleInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ms8;->L0(Ljava/lang/String;Ll/y20;Lcom/p1/mobile/putong/data/BubbleInfo;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic G0(Ll/ms8;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;Ll/y20;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/ms8;->K0(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;Ll/y20;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic H0(Lcom/p1/mobile/putong/data/BubbleInfo;)Lcom/p1/mobile/putong/data/BubbleInfo;
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_7

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_7

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 26
    .line 27
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Media;->status:Lcom/p1/mobile/putong/data/MediaLocalStatus;

    .line 28
    .line 29
    const-string v3, "raw"

    .line 30
    .line 31
    invoke-static {v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_0

    .line 36
    .line 37
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 38
    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    new-instance v2, Ll/sim;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {v3}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    invoke-direct {v2, v3}, Ll/sim;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    move-object v3, v1

    .line 53
    check-cast v3, Lcom/p1/mobile/putong/data/Picture;

    .line 54
    .line 55
    new-instance v4, Lcom/p1/mobile/putong/data/Dimension;

    .line 56
    .line 57
    iget-object v5, v2, Ll/sim;->d:[I

    .line 58
    .line 59
    invoke-direct {v4, v5}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 60
    .line 61
    .line 62
    iput-object v4, v3, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 63
    .line 64
    iget-object v2, v2, Ll/sim;->c:Ljava/lang/String;

    .line 65
    .line 66
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    instance-of v2, v1, Lcom/p1/mobile/putong/data/Video;

    .line 70
    .line 71
    if-eqz v2, :cond_0

    .line 72
    .line 73
    check-cast v1, Lcom/p1/mobile/putong/data/Video;

    .line 74
    .line 75
    new-instance v2, Ll/vel0;

    .line 76
    .line 77
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 78
    .line 79
    invoke-static {v3}, Ll/oki;->z(Ljava/lang/String;)Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-direct {v2, v3}, Ll/vel0;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    iget-boolean v3, v2, Ll/vel0;->g:Z

    .line 87
    .line 88
    const/4 v4, 0x0

    .line 89
    if-nez v3, :cond_2

    .line 90
    .line 91
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/Video;->isFromNewCamera:Z

    .line 92
    .line 93
    if-eqz v3, :cond_2

    .line 94
    .line 95
    iput-boolean v4, v1, Lcom/p1/mobile/putong/data/Video;->hasOriginalSound:Z

    .line 96
    .line 97
    :cond_2
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 98
    .line 99
    if-eqz v3, :cond_3

    .line 100
    .line 101
    iget-object v3, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 102
    .line 103
    if-eqz v3, :cond_3

    .line 104
    .line 105
    iget-object v5, v3, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 106
    .line 107
    if-eqz v5, :cond_3

    .line 108
    .line 109
    iget-object v5, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 110
    .line 111
    if-eqz v5, :cond_3

    .line 112
    .line 113
    iget-object v3, v3, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 114
    .line 115
    if-nez v3, :cond_0

    .line 116
    .line 117
    :cond_3
    new-instance v3, Ll/wel0;

    .line 118
    .line 119
    invoke-direct {v3, v2, v4, v4}, Ll/wel0;-><init>(Ll/vel0;ZZ)V

    .line 120
    .line 121
    .line 122
    const-string v2, "video/mp4"

    .line 123
    .line 124
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 125
    .line 126
    new-instance v2, Lcom/p1/mobile/putong/data/Dimension;

    .line 127
    .line 128
    invoke-virtual {v3}, Ll/wel0;->m()[I

    .line 129
    .line 130
    .line 131
    move-result-object v5

    .line 132
    invoke-direct {v2, v5}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 133
    .line 134
    .line 135
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Video;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 136
    .line 137
    iget-wide v5, v3, Ll/wel0;->b:J

    .line 138
    .line 139
    long-to-float v2, v5

    .line 140
    iput v2, v1, Lcom/p1/mobile/putong/data/Video;->duration:F

    .line 141
    .line 142
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 143
    .line 144
    if-eqz v2, :cond_4

    .line 145
    .line 146
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 147
    .line 148
    if-nez v2, :cond_0

    .line 149
    .line 150
    :cond_4
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 151
    .line 152
    .line 153
    move-result-wide v5

    .line 154
    iput-wide v5, v1, Lcom/p1/mobile/putong/data/Media;->processStartTime:J

    .line 155
    .line 156
    new-instance v2, Lcom/p1/mobile/putong/data/Picture;

    .line 157
    .line 158
    invoke-direct {v2}, Lcom/p1/mobile/putong/data/Picture;-><init>()V

    .line 159
    .line 160
    .line 161
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 162
    .line 163
    :try_start_0
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Video;->cutting:Lcom/p1/mobile/putong/data/CuttingData;

    .line 164
    .line 165
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    if-eqz v2, :cond_5

    .line 170
    .line 171
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 172
    .line 173
    iget-object v4, v1, Lcom/p1/mobile/putong/data/Video;->cutting:Lcom/p1/mobile/putong/data/CuttingData;

    .line 174
    .line 175
    iget-wide v4, v4, Lcom/p1/mobile/putong/data/CuttingData;->start:J

    .line 176
    .line 177
    long-to-int v4, v4

    .line 178
    invoke-virtual {v3, v4}, Ll/wel0;->e(I)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    invoke-static {v4}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v4

    .line 186
    iput-object v4, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 187
    .line 188
    goto :goto_2

    .line 189
    :cond_5
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 190
    .line 191
    const/16 v5, 0x1e

    .line 192
    .line 193
    const-string v6, ".jpg"

    .line 194
    .line 195
    if-lt v2, v5, :cond_6

    .line 196
    .line 197
    :try_start_1
    new-instance v2, Ljava/io/File;

    .line 198
    .line 199
    invoke-static {}, Ll/uqb0;->t0()Ljava/io/File;

    .line 200
    .line 201
    .line 202
    move-result-object v5

    .line 203
    new-instance v7, Ljava/lang/StringBuilder;

    .line 204
    .line 205
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 206
    .line 207
    .line 208
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 209
    .line 210
    .line 211
    move-result-wide v8

    .line 212
    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 213
    .line 214
    .line 215
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v6

    .line 222
    invoke-direct {v2, v5, v6}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v2

    .line 229
    goto :goto_1

    .line 230
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 233
    .line 234
    .line 235
    new-instance v5, Ljava/io/File;

    .line 236
    .line 237
    iget-object v7, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 238
    .line 239
    invoke-direct {v5, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
    invoke-virtual {v5}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 243
    .line 244
    .line 245
    move-result-object v5

    .line 246
    invoke-virtual {v5}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v5

    .line 250
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 259
    .line 260
    .line 261
    move-result-wide v7

    .line 262
    invoke-virtual {v2, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    :goto_1
    iget-object v5, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 273
    .line 274
    iget-object v6, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 275
    .line 276
    invoke-static {v2, v6, v4}, Ll/wel0;->d(Ljava/lang/String;Ljava/lang/String;I)Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v2

    .line 280
    invoke-static {v2}, Ll/oki;->B(Ljava/lang/String;)Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v2

    .line 284
    iput-object v2, v5, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 285
    .line 286
    :goto_2
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 287
    .line 288
    new-instance v4, Lcom/p1/mobile/putong/data/Dimension;

    .line 289
    .line 290
    invoke-virtual {v3}, Ll/wel0;->k()[I

    .line 291
    .line 292
    .line 293
    move-result-object v3

    .line 294
    invoke-direct {v4, v3}, Lcom/p1/mobile/putong/data/Dimension;-><init>([I)V

    .line 295
    .line 296
    .line 297
    iput-object v4, v2, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 298
    .line 299
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 300
    .line 301
    const-string v3, "image/jpeg"

    .line 302
    .line 303
    iput-object v3, v2, Lcom/p1/mobile/putong/data/Media;->mediaType:Ljava/lang/String;

    .line 304
    .line 305
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 306
    .line 307
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 308
    .line 309
    invoke-virtual {v2, v1}, Ll/fsb0;->x0(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    goto/16 :goto_0

    .line 313
    .line 314
    :catch_0
    move-exception p0

    .line 315
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 316
    .line 317
    .line 318
    new-instance v0, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$GetVideoFrameException;

    .line 319
    .line 320
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    invoke-direct {v0, v1, p0}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil$GetVideoFrameException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 329
    .line 330
    .line 331
    throw v0

    .line 332
    :cond_7
    return-object p0
.end method

.method public static synthetic I0(Ll/ms8;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ms8;->S0(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic J0(Ll/ms8;Ljava/lang/String;Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ms8;->P0(Ljava/lang/String;Ljava/util/List;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method private U0(Ljava/lang/String;)Z
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->signedIn_()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-interface {p0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public static synthetic t0(Ll/ms8;Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ms8;->R0(Ljava/lang/Throwable;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic u0(Ll/qcj;Lcom/p1/mobile/putong/data/BubbleInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic v0(Ll/ms8;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ms8;->N0(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic w0(Lcom/p1/mobile/putong/data/BubbleInfo;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/ks8;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/ks8;-><init>(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public static synthetic x0(Lcom/p1/mobile/putong/data/BubbleInfo;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Ll/dog;->G:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Ll/dog;->N()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/BubbleInfo;->toJson()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v0, p0}, Ll/x1d0$a;->l(Ll/z1d0;)Ll/x1d0$a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public static synthetic y0(Ll/qcj;Lcom/p1/mobile/putong/data/BubbleInfo;)Lrx/c;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lrx/c;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic z0(Ll/ms8;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ms8;->M0(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final synthetic K0(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;Ll/y20;)Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/ti20;

    .line 2
    .line 3
    new-instance v1, Ll/or8;

    .line 4
    .line 5
    invoke-direct {v1, p1}, Ll/or8;-><init>(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 6
    .line 7
    .line 8
    sget p1, Ll/dog;->E:I

    .line 9
    .line 10
    invoke-direct {v0, v1, p1}, Ll/ti20;-><init>(Ll/pcj;I)V

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {v0, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    new-instance v0, Ll/qr8;

    .line 22
    .line 23
    invoke-direct {v0, p0, p2}, Ll/qr8;-><init>(Ll/ms8;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p3}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public final synthetic L0(Ljava/lang/String;Ll/y20;Lcom/p1/mobile/putong/data/BubbleInfo;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/kr8;

    .line 2
    .line 3
    invoke-direct {v0, p0, p3, p1, p2}, Ll/kr8;-><init>(Ll/ms8;Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;Ll/y20;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "postMyState"

    .line 7
    .line 8
    const/4 p2, -0x1

    .line 9
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final synthetic M0(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ms8;->U0(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic N0(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ms8;->U0(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic O0(Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ms8;->U0(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic P0(Ljava/lang/String;Ljava/util/List;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ms8;->U0(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final synthetic Q0(Ljava/util/List;Ljava/lang/String;Lcom/p1/mobile/putong/data/BubbleInfo;)Lrx/c;
    .locals 3

    .line 1
    iget-object v0, p3, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p3, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-lez v0, :cond_1

    .line 16
    .line 17
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    move v1, v0

    .line 22
    :goto_0
    iget-object v2, p3, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-ge v1, v2, :cond_0

    .line 29
    .line 30
    iget-object v2, p3, Lcom/p1/mobile/putong/data/BubbleInfo;->media:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 37
    .line 38
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    new-instance v1, Ll/i1y;

    .line 45
    .line 46
    new-instance v2, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v2, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 49
    .line 50
    .line 51
    invoke-direct {v1, v2, v0, p2}, Ll/i1y;-><init>(Ljava/util/List;ZLjava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {v1, v0}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lrx/c;->last()Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ll/er8;

    .line 75
    .line 76
    invoke-direct {v1, p0, p2}, Ll/er8;-><init>(Ll/ms8;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    new-instance p2, Ll/gr8;

    .line 84
    .line 85
    invoke-direct {p2}, Ll/gr8;-><init>()V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-static {}, Ll/dog;->n0()Lrx/c$d;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p0, p2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    new-instance p2, Ll/ir8;

    .line 101
    .line 102
    invoke-direct {p2, p1, p3}, Ll/ir8;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p0, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0

    .line 110
    :cond_1
    invoke-static {p3}, Lrx/c;->just(Ljava/lang/Object;)Lrx/c;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0
.end method

.method public final synthetic R0(Ljava/lang/Throwable;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/KanPostData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/KanPostData;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "postError"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/KanKanStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/KanKanStatus;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/KanPostData;->status:Lcom/p1/mobile/putong/data/KanKanStatus;

    .line 13
    .line 14
    iget-object p0, p0, Ll/ms8;->H:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const/4 v0, 0x0

    .line 27
    invoke-virtual {p0, v0, p2}, Ll/er60;->I(ZLjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    sget-object p0, Ll/arh;->Q:Ljava/lang/String;

    .line 31
    .line 32
    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_2

    .line 37
    .line 38
    instance-of p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 39
    .line 40
    const-string p2, "\u53d1\u5e03\u5931\u8d25"

    .line 41
    .line 42
    if-eqz p0, :cond_1

    .line 43
    .line 44
    check-cast p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;

    .line 45
    .line 46
    iget p0, p1, Lcom/p1/mobile/putong/api/api/TantanException$Client$TantanForbidden;->code:I

    .line 47
    .line 48
    const p1, 0x9da1

    .line 49
    .line 50
    .line 51
    if-ne p0, p1, :cond_0

    .line 52
    .line 53
    const-string p0, "\u5df2\u8fbe\u5230\u6bcf\u65e5\u8bbe\u7f6e\u4e0a\u9650\u6b21\u6570"

    .line 54
    .line 55
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    invoke-static {p2}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    invoke-static {p2}, Ll/r1j0;->b(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    return-void
.end method

.method public final synthetic S0(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    new-instance v0, Ll/mr8;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2, p1}, Ll/mr8;-><init>(Ll/ms8;Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->M(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final synthetic T0(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/KanPostData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/KanPostData;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "success"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/KanKanStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/KanKanStatus;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/KanPostData;->status:Lcom/p1/mobile/putong/data/KanKanStatus;

    .line 13
    .line 14
    iget-object p0, p0, Ll/ms8;->H:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p2, Lcom/p1/mobile/putong/data/Envelope;->data:Lcom/p1/mobile/putong/data/Data;

    .line 20
    .line 21
    const-class p2, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 22
    .line 23
    invoke-virtual {p0, p2}, Lcom/p1/mobile/putong/data/Data;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result p2

    .line 45
    if-lez p2, :cond_1

    .line 46
    .line 47
    sget-object p2, Lcom/p1/mobile/putong/feed/FeedModule;->d:Ll/jka;

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    check-cast p0, Lcom/p1/mobile/putong/data/BubbleInfo;

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Ll/jka;->lc(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    const-string p0, "p_meet_greet"

    .line 60
    .line 61
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    if-eqz p0, :cond_2

    .line 66
    .line 67
    const-string p0, "\u4eca\u65e5\u5076\u9047\u673a\u4f1a+1"

    .line 68
    .line 69
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    const-string p0, "follow_top_state"

    .line 74
    .line 75
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    if-eqz p0, :cond_3

    .line 80
    .line 81
    const-string p0, "\u72b6\u6001\u53d1\u5e03\u6210\u529f\uff0c\u6233\u6233\u597d\u53cb\u5206\u4eab\u4f60\u7684\u5fc3\u60c5"

    .line 82
    .line 83
    invoke-static {p0}, Ll/r1j0;->g(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_3
    sget-object p0, Ll/arh;->Q:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    if-nez p0, :cond_4

    .line 94
    .line 95
    const-string p0, "p_moment_post"

    .line 96
    .line 97
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-nez p0, :cond_4

    .line 102
    .line 103
    sget p0, Lcom/p1/mobile/putong/feed/R$string;->K1:I

    .line 104
    .line 105
    invoke-static {p0}, Ll/r1j0;->f(I)V

    .line 106
    .line 107
    .line 108
    :cond_4
    :goto_1
    invoke-static {}, Ll/er60;->w()Ll/er60;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    const/4 p2, 0x1

    .line 113
    invoke-virtual {p0, p2, p1}, Ll/er60;->I(ZLjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 117
    .line 118
    return-object p0
.end method

.method public V0(Lcom/p1/mobile/putong/data/BubbleInfo;Ljava/lang/String;)Lrx/c;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/BubbleInfo;",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/KanPostData;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/KanPostData;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "start"

    .line 7
    .line 8
    invoke-static {v1}, Lcom/p1/mobile/putong/data/KanKanStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/KanKanStatus;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, v0, Lcom/p1/mobile/putong/data/KanPostData;->status:Lcom/p1/mobile/putong/data/KanKanStatus;

    .line 13
    .line 14
    iget-object v1, p0, Ll/ms8;->H:Lrx/subjects/a;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->F()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-interface {v0}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    new-instance v1, Ll/cr8;

    .line 28
    .line 29
    invoke-direct {v1, p1}, Ll/cr8;-><init>(Lcom/p1/mobile/putong/data/BubbleInfo;)V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v2, Ll/ur8;

    .line 38
    .line 39
    invoke-direct {v2, p0, p1, v0}, Ll/ur8;-><init>(Ll/ms8;Ljava/util/List;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    new-instance v3, Ll/wr8;

    .line 43
    .line 44
    invoke-direct {v3, p0, p2}, Ll/wr8;-><init>(Ll/ms8;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    new-instance v4, Ll/yr8;

    .line 48
    .line 49
    invoke-direct {v4, p0, p2, v3}, Ll/yr8;-><init>(Ll/ms8;Ljava/lang/String;Ll/y20;)V

    .line 50
    .line 51
    .line 52
    invoke-interface {v1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    check-cast p2, Lrx/c;

    .line 57
    .line 58
    invoke-static {}, Ll/psd0;->Q()Lrx/c$d;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p2, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    new-instance v1, Ll/as8;

    .line 67
    .line 68
    invoke-direct {v1, p0, v0}, Ll/as8;-><init>(Ll/ms8;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p2, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 72
    .line 73
    .line 74
    move-result-object p2

    .line 75
    new-instance v1, Ll/cs8;

    .line 76
    .line 77
    invoke-direct {v1, v2}, Ll/cs8;-><init>(Ll/qcj;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {p2, v1}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 81
    .line 82
    .line 83
    move-result-object p2

    .line 84
    new-instance v1, Ll/es8;

    .line 85
    .line 86
    invoke-direct {v1, p0, v0}, Ll/es8;-><init>(Ll/ms8;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object p2

    .line 93
    const-string v1, "myState"

    .line 94
    .line 95
    const/4 v2, 0x0

    .line 96
    invoke-static {v1, p1, v2}, Lcom/p1/mobile/putong/util/TrackMediaUploadUtil;->f0(Ljava/lang/String;Ljava/util/List;Ll/qcj;)Lrx/c$d;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    invoke-virtual {p2, p1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-virtual {p1, v3}, Lrx/c;->doOnError(Ll/y20;)Lrx/c;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    new-instance p2, Ll/gs8;

    .line 109
    .line 110
    invoke-direct {p2, p0, v0}, Ll/gs8;-><init>(Ll/ms8;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1, p2}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    new-instance p2, Ll/is8;

    .line 118
    .line 119
    invoke-direct {p2, v4}, Ll/is8;-><init>(Ll/qcj;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, p2}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/RunnerProxy;->now(Lrx/c;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object p0

    .line 130
    return-object p0
.end method
