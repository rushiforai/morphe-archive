.class public Ll/thd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/immomo/mediabase/DecodeAudioFileListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/thd$a;
    }
.end annotation


# instance fields
.field private a:Z

.field private b:Ljava/lang/String;

.field private c:Ljava/lang/String;

.field private d:Lcom/immomo/mediabase/DecodeAudioFile;

.field private e:Lcom/immomo/mediabase/AudioParameter;

.field private f:Lcom/immomo/mediabase/AudioParameter;

.field private g:Z

.field private h:Lcom/immomo/mediabase/AudioResampleUtils;

.field i:Ljava/io/FileOutputStream;

.field j:Ll/thd$a;

.field private k:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/thd;->a:Z

    .line 6
    .line 7
    const-string v1, ""

    .line 8
    .line 9
    iput-object v1, p0, Ll/thd;->b:Ljava/lang/String;

    .line 10
    .line 11
    iput-object v1, p0, Ll/thd;->c:Ljava/lang/String;

    .line 12
    .line 13
    iput-boolean v0, p0, Ll/thd;->g:Z

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-object v1, p0, Ll/thd;->h:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 17
    .line 18
    iput-object v1, p0, Ll/thd;->i:Ljava/io/FileOutputStream;

    .line 19
    .line 20
    iput-object v1, p0, Ll/thd;->j:Ll/thd$a;

    .line 21
    .line 22
    iput-boolean v0, p0, Ll/thd;->k:Z

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Ljava/lang/String;III)Z
    .locals 7
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    const-string v0, "HUOHL_DecodePcmFromFile"

    .line 2
    .line 3
    const-string v1, "decodeUrl: Start"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iput-object p1, p0, Ll/thd;->b:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p2, p0, Ll/thd;->c:Ljava/lang/String;

    .line 11
    .line 12
    new-instance p1, Ljava/io/File;

    .line 13
    .line 14
    iget-object p2, p0, Ll/thd;->c:Ljava/lang/String;

    .line 15
    .line 16
    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    .line 20
    .line 21
    .line 22
    move-result p2

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 26
    .line 27
    .line 28
    :cond_0
    const/4 p2, 0x0

    .line 29
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z

    .line 30
    .line 31
    .line 32
    new-instance v0, Ljava/io/FileOutputStream;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Ll/thd;->i:Ljava/io/FileOutputStream;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    .line 39
    iget-object p1, p0, Ll/thd;->f:Lcom/immomo/mediabase/AudioParameter;

    .line 40
    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    new-instance p1, Lcom/immomo/mediabase/AudioParameter;

    .line 44
    .line 45
    invoke-direct {p1}, Lcom/immomo/mediabase/AudioParameter;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Ll/thd;->f:Lcom/immomo/mediabase/AudioParameter;

    .line 49
    .line 50
    invoke-virtual {p1, p3}, Lcom/immomo/mediabase/AudioParameter;->setSamplingRate(I)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Ll/thd;->f:Lcom/immomo/mediabase/AudioParameter;

    .line 54
    .line 55
    invoke-virtual {p1, p4}, Lcom/immomo/mediabase/AudioParameter;->setNumChannels(I)V

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/thd;->f:Lcom/immomo/mediabase/AudioParameter;

    .line 59
    .line 60
    invoke-virtual {p1, p5}, Lcom/immomo/mediabase/AudioParameter;->setSampleBits(I)V

    .line 61
    .line 62
    .line 63
    :cond_1
    new-instance p1, Lcom/immomo/mediabase/DecodeAudioFile;

    .line 64
    .line 65
    invoke-direct {p1}, Lcom/immomo/mediabase/DecodeAudioFile;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Ll/thd;->d:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 69
    .line 70
    invoke-virtual {p1, p0}, Lcom/immomo/mediabase/DecodeAudioFile;->setDecoderListener(Lcom/immomo/mediabase/DecodeAudioFileListener;)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/thd;->d:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 74
    .line 75
    iget-object v1, p0, Ll/thd;->b:Ljava/lang/String;

    .line 76
    .line 77
    const-wide/16 v2, 0x0

    .line 78
    .line 79
    const-wide/16 v4, 0x0

    .line 80
    .line 81
    invoke-virtual/range {v0 .. v5}, Lcom/immomo/mediabase/DecodeAudioFile;->setDecodeSource(Ljava/lang/String;JJ)Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    const-string p3, ""

    .line 86
    .line 87
    if-nez p1, :cond_3

    .line 88
    .line 89
    iget-object p0, p0, Ll/thd;->j:Ll/thd$a;

    .line 90
    .line 91
    if-eqz p0, :cond_2

    .line 92
    .line 93
    invoke-interface {p0, p2, p3}, Ll/thd$a;->d(ILjava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    return p2

    .line 97
    :cond_3
    iget-object p1, p0, Ll/thd;->d:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 98
    .line 99
    invoke-virtual {p1}, Lcom/immomo/mediabase/DecodeAudioFile;->getDuration()J

    .line 100
    .line 101
    .line 102
    move-result-wide p4

    .line 103
    const-wide/16 v0, 0x0

    .line 104
    .line 105
    cmp-long p1, p4, v0

    .line 106
    .line 107
    iget-object v0, p0, Ll/thd;->j:Ll/thd$a;

    .line 108
    .line 109
    if-gtz p1, :cond_5

    .line 110
    .line 111
    if-eqz v0, :cond_4

    .line 112
    .line 113
    invoke-interface {v0, p2, p3}, Ll/thd$a;->d(ILjava/lang/String;)V

    .line 114
    .line 115
    .line 116
    :cond_4
    return p2

    .line 117
    :cond_5
    if-eqz v0, :cond_6

    .line 118
    .line 119
    const-wide/16 v1, 0x3e8

    .line 120
    .line 121
    div-long/2addr p4, v1

    .line 122
    invoke-interface {v0, p4, p5}, Ll/thd$a;->c(J)V

    .line 123
    .line 124
    .line 125
    :cond_6
    iget-object p1, p0, Ll/thd;->d:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 126
    .line 127
    invoke-virtual {p1}, Lcom/immomo/mediabase/DecodeAudioFile;->getSrcAudioParam()Lcom/immomo/mediabase/AudioParameter;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iput-object p1, p0, Ll/thd;->e:Lcom/immomo/mediabase/AudioParameter;

    .line 132
    .line 133
    const/4 p4, 0x1

    .line 134
    if-eqz p1, :cond_7

    .line 135
    .line 136
    iget-object p5, p0, Ll/thd;->f:Lcom/immomo/mediabase/AudioParameter;

    .line 137
    .line 138
    if-eqz p5, :cond_7

    .line 139
    .line 140
    invoke-virtual {p1, p5}, Lcom/immomo/mediabase/AudioParameter;->isEqual(Lcom/immomo/mediabase/AudioParameter;)Z

    .line 141
    .line 142
    .line 143
    move-result p1

    .line 144
    xor-int/2addr p1, p4

    .line 145
    iput-boolean p1, p0, Ll/thd;->g:Z

    .line 146
    .line 147
    :cond_7
    iget-boolean p1, p0, Ll/thd;->g:Z

    .line 148
    .line 149
    if-eqz p1, :cond_9

    .line 150
    .line 151
    iget-object p1, p0, Ll/thd;->h:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 152
    .line 153
    if-nez p1, :cond_9

    .line 154
    .line 155
    new-instance v0, Lcom/immomo/mediabase/AudioResampleUtils;

    .line 156
    .line 157
    invoke-direct {v0}, Lcom/immomo/mediabase/AudioResampleUtils;-><init>()V

    .line 158
    .line 159
    .line 160
    iput-object v0, p0, Ll/thd;->h:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 161
    .line 162
    iget-object p1, p0, Ll/thd;->e:Lcom/immomo/mediabase/AudioParameter;

    .line 163
    .line 164
    invoke-virtual {p1}, Lcom/immomo/mediabase/AudioParameter;->getSamplingRate()I

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    iget-object p1, p0, Ll/thd;->e:Lcom/immomo/mediabase/AudioParameter;

    .line 169
    .line 170
    invoke-virtual {p1}, Lcom/immomo/mediabase/AudioParameter;->getNumChannels()I

    .line 171
    .line 172
    .line 173
    move-result v2

    .line 174
    iget-object p1, p0, Ll/thd;->e:Lcom/immomo/mediabase/AudioParameter;

    .line 175
    .line 176
    invoke-virtual {p1}, Lcom/immomo/mediabase/AudioParameter;->getSampleBits()I

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    iget-object p1, p0, Ll/thd;->f:Lcom/immomo/mediabase/AudioParameter;

    .line 181
    .line 182
    invoke-virtual {p1}, Lcom/immomo/mediabase/AudioParameter;->getSamplingRate()I

    .line 183
    .line 184
    .line 185
    move-result v4

    .line 186
    iget-object p1, p0, Ll/thd;->f:Lcom/immomo/mediabase/AudioParameter;

    .line 187
    .line 188
    invoke-virtual {p1}, Lcom/immomo/mediabase/AudioParameter;->getNumChannels()I

    .line 189
    .line 190
    .line 191
    move-result v5

    .line 192
    iget-object p1, p0, Ll/thd;->f:Lcom/immomo/mediabase/AudioParameter;

    .line 193
    .line 194
    invoke-virtual {p1}, Lcom/immomo/mediabase/AudioParameter;->getSampleBits()I

    .line 195
    .line 196
    .line 197
    move-result v6

    .line 198
    invoke-virtual/range {v0 .. v6}, Lcom/immomo/mediabase/AudioResampleUtils;->initResampleInfo(IIIIII)I

    .line 199
    .line 200
    .line 201
    move-result p1

    .line 202
    if-gez p1, :cond_9

    .line 203
    .line 204
    iget-object p0, p0, Ll/thd;->j:Ll/thd$a;

    .line 205
    .line 206
    if-eqz p0, :cond_8

    .line 207
    .line 208
    const/4 p1, -0x1

    .line 209
    invoke-interface {p0, p1, p3}, Ll/thd$a;->d(ILjava/lang/String;)V

    .line 210
    .line 211
    .line 212
    :cond_8
    return p2

    .line 213
    :cond_9
    iget-object p0, p0, Ll/thd;->d:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 214
    .line 215
    invoke-virtual {p0}, Lcom/immomo/mediabase/DecodeAudioFile;->startDecode()V

    .line 216
    .line 217
    .line 218
    return p4

    .line 219
    :catch_0
    return p2
.end method

.method public b(Ll/thd$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/thd;->j:Ll/thd$a;

    .line 2
    .line 3
    return-void
.end method

.method public c()V
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x10
    .end annotation

    .line 1
    iget-object v0, p0, Ll/thd;->d:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/immomo/mediabase/DecodeAudioFile;->release()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/thd;->d:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onDecoderError(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/thd;->j:Ll/thd$a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ll/thd;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    filled-new-array {v0, v1}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "AudioExtract Load Url:%s error, errorcode:%d "

    .line 16
    .line 17
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object p0, p0, Ll/thd;->j:Ll/thd$a;

    .line 22
    .line 23
    invoke-interface {p0, p1, v0}, Ll/thd$a;->d(ILjava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public onFinished()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/thd;->a:Z

    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, Ll/thd;->i:Ljava/io/FileOutputStream;

    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    :catch_0
    iget-object p0, p0, Ll/thd;->j:Ll/thd$a;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ll/thd$a;->a()V

    .line 14
    .line 15
    .line 16
    :cond_0
    const-string p0, "HUOHL_DecodePcmFromFile"

    .line 17
    .line 18
    const-string v0, "onFinished: OK"

    .line 19
    .line 20
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public onForamtChange(Landroid/media/MediaFormat;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onFrameAvailable(Ljava/nio/ByteBuffer;J)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/thd;->j:Ll/thd$a;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-boolean p3, p0, Ll/thd;->k:Z

    .line 6
    .line 7
    if-nez p3, :cond_0

    .line 8
    .line 9
    invoke-interface {p2}, Ll/thd$a;->b()V

    .line 10
    .line 11
    .line 12
    const/4 p2, 0x1

    .line 13
    iput-boolean p2, p0, Ll/thd;->k:Z

    .line 14
    .line 15
    :cond_0
    iget-object p2, p0, Ll/thd;->i:Ljava/io/FileOutputStream;

    .line 16
    .line 17
    if-nez p2, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    iget-object p2, p0, Ll/thd;->d:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 21
    .line 22
    invoke-virtual {p2}, Lcom/immomo/mediabase/DecodeAudioFile;->getSrcAudioParam()Lcom/immomo/mediabase/AudioParameter;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    if-eqz p2, :cond_2

    .line 27
    .line 28
    iget-object p2, p0, Ll/thd;->f:Lcom/immomo/mediabase/AudioParameter;

    .line 29
    .line 30
    if-eqz p2, :cond_2

    .line 31
    .line 32
    iget-object p2, p0, Ll/thd;->d:Lcom/immomo/mediabase/DecodeAudioFile;

    .line 33
    .line 34
    invoke-virtual {p2}, Lcom/immomo/mediabase/DecodeAudioFile;->getSrcAudioParam()Lcom/immomo/mediabase/AudioParameter;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    iget-object p3, p0, Ll/thd;->f:Lcom/immomo/mediabase/AudioParameter;

    .line 39
    .line 40
    invoke-virtual {p2, p3}, Lcom/immomo/mediabase/AudioParameter;->isEqual(Lcom/immomo/mediabase/AudioParameter;)Z

    .line 41
    .line 42
    .line 43
    :cond_2
    :try_start_0
    iget-boolean p2, p0, Ll/thd;->g:Z

    .line 44
    .line 45
    const/4 p3, 0x0

    .line 46
    if-eqz p2, :cond_4

    .line 47
    .line 48
    iget-object p2, p0, Ll/thd;->h:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 49
    .line 50
    if-eqz p2, :cond_4

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 53
    .line 54
    .line 55
    move-result p2

    .line 56
    mul-int/lit8 p2, p2, 0x8

    .line 57
    .line 58
    iget-object v0, p0, Ll/thd;->e:Lcom/immomo/mediabase/AudioParameter;

    .line 59
    .line 60
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioParameter;->getSampleBits()I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    div-int/2addr p2, v0

    .line 65
    iget-object v0, p0, Ll/thd;->e:Lcom/immomo/mediabase/AudioParameter;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioParameter;->getNumChannels()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    div-int/2addr p2, v0

    .line 72
    iget-object v0, p0, Ll/thd;->h:Lcom/immomo/mediabase/AudioResampleUtils;

    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {v0, p1, p2}, Lcom/immomo/mediabase/AudioResampleUtils;->resamplePcmData([BI)Ljava/nio/ByteBuffer;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    if-eqz p1, :cond_3

    .line 83
    .line 84
    iget-object p0, p0, Ll/thd;->i:Ljava/io/FileOutputStream;

    .line 85
    .line 86
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    invoke-virtual {p0, p2, p3, p1}, Ljava/io/FileOutputStream;->write([BII)V

    .line 95
    .line 96
    .line 97
    :cond_3
    :goto_0
    return-void

    .line 98
    :cond_4
    iget-object p0, p0, Ll/thd;->i:Ljava/io/FileOutputStream;

    .line 99
    .line 100
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 101
    .line 102
    .line 103
    move-result-object p2

    .line 104
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    invoke-virtual {p0, p2, p3, p1}, Ljava/io/FileOutputStream;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :catch_0
    move-exception p0

    .line 113
    new-instance p1, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    const-string p2, "onFrameAvailable: "

    .line 116
    .line 117
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p0

    .line 124
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p0

    .line 131
    const-string p1, "HUOHL_DecodePcmFromFile"

    .line 132
    .line 133
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    .line 135
    .line 136
    return-void
.end method
