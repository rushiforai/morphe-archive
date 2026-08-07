.class public Ll/vrd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lzc0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/google/android/exoplayer2/mediacodec/b;

.field public c:I

.field public d:J

.field public e:Z

.field public f:Lcom/google/android/exoplayer2/mediacodec/e;

.field public g:Z

.field public h:Z

.field public i:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/vrd;->a:Landroid/content/Context;

    .line 5
    .line 6
    new-instance p1, Lcom/google/android/exoplayer2/mediacodec/b;

    .line 7
    .line 8
    invoke-direct {p1}, Lcom/google/android/exoplayer2/mediacodec/b;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/vrd;->b:Lcom/google/android/exoplayer2/mediacodec/b;

    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    iput p1, p0, Ll/vrd;->c:I

    .line 15
    .line 16
    const-wide/16 v0, 0x1388

    .line 17
    .line 18
    iput-wide v0, p0, Ll/vrd;->d:J

    .line 19
    .line 20
    sget-object p1, Lcom/google/android/exoplayer2/mediacodec/e;->a:Lcom/google/android/exoplayer2/mediacodec/e;

    .line 21
    .line 22
    iput-object p1, p0, Ll/vrd;->f:Lcom/google/android/exoplayer2/mediacodec/e;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public a(Landroid/os/Handler;Ll/wjl0;Lcom/google/android/exoplayer2/audio/c;Ll/asi0;Ll/ga00;)[Lcom/google/android/exoplayer2/x;
    .locals 10

    .line 1
    new-instance v5, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/vrd;->a:Landroid/content/Context;

    .line 7
    .line 8
    iget v2, p0, Ll/vrd;->c:I

    .line 9
    .line 10
    iget-object v3, p0, Ll/vrd;->f:Lcom/google/android/exoplayer2/mediacodec/e;

    .line 11
    .line 12
    iget-boolean v4, p0, Ll/vrd;->e:Z

    .line 13
    .line 14
    iget-wide v7, p0, Ll/vrd;->d:J

    .line 15
    .line 16
    move-object v0, p0

    .line 17
    move-object v6, p2

    .line 18
    move-object v9, v5

    .line 19
    move-object v5, p1

    .line 20
    invoke-virtual/range {v0 .. v9}, Ll/vrd;->h(Landroid/content/Context;ILcom/google/android/exoplayer2/mediacodec/e;ZLandroid/os/Handler;Ll/wjl0;JLjava/util/ArrayList;)V

    .line 21
    .line 22
    .line 23
    move-object v8, v9

    .line 24
    iget-object p0, v0, Ll/vrd;->a:Landroid/content/Context;

    .line 25
    .line 26
    iget-boolean p1, v0, Ll/vrd;->g:Z

    .line 27
    .line 28
    iget-boolean p2, v0, Ll/vrd;->h:Z

    .line 29
    .line 30
    iget-boolean v1, v0, Ll/vrd;->i:Z

    .line 31
    .line 32
    invoke-virtual {v0, p0, p1, p2, v1}, Ll/vrd;->c(Landroid/content/Context;ZZZ)Lcom/google/android/exoplayer2/audio/AudioSink;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    iget-object v1, v0, Ll/vrd;->a:Landroid/content/Context;

    .line 39
    .line 40
    iget v2, v0, Ll/vrd;->c:I

    .line 41
    .line 42
    iget-object v3, v0, Ll/vrd;->f:Lcom/google/android/exoplayer2/mediacodec/e;

    .line 43
    .line 44
    iget-boolean v4, v0, Ll/vrd;->e:Z

    .line 45
    .line 46
    move-object v7, p3

    .line 47
    move-object v6, v5

    .line 48
    move-object v5, p0

    .line 49
    invoke-virtual/range {v0 .. v8}, Ll/vrd;->b(Landroid/content/Context;ILcom/google/android/exoplayer2/mediacodec/e;ZLcom/google/android/exoplayer2/audio/AudioSink;Landroid/os/Handler;Lcom/google/android/exoplayer2/audio/c;Ljava/util/ArrayList;)V

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    move-object v6, v5

    .line 54
    :goto_0
    iget-object v1, v0, Ll/vrd;->a:Landroid/content/Context;

    .line 55
    .line 56
    invoke-virtual {v6}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    iget v4, v0, Ll/vrd;->c:I

    .line 61
    .line 62
    move-object v2, p4

    .line 63
    move-object v5, v8

    .line 64
    invoke-virtual/range {v0 .. v5}, Ll/vrd;->g(Landroid/content/Context;Ll/asi0;Landroid/os/Looper;ILjava/util/ArrayList;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, v0, Ll/vrd;->a:Landroid/content/Context;

    .line 68
    .line 69
    invoke-virtual {v6}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    iget p4, v0, Ll/vrd;->c:I

    .line 74
    .line 75
    move-object p2, p5

    .line 76
    move-object p0, v0

    .line 77
    move-object p5, v8

    .line 78
    invoke-virtual/range {p0 .. p5}, Ll/vrd;->e(Landroid/content/Context;Ll/ga00;Landroid/os/Looper;ILjava/util/ArrayList;)V

    .line 79
    .line 80
    .line 81
    iget-object p0, v0, Ll/vrd;->a:Landroid/content/Context;

    .line 82
    .line 83
    iget p1, v0, Ll/vrd;->c:I

    .line 84
    .line 85
    invoke-virtual {v0, p0, p1, v8}, Ll/vrd;->d(Landroid/content/Context;ILjava/util/ArrayList;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, v0, Ll/vrd;->a:Landroid/content/Context;

    .line 89
    .line 90
    iget p1, v0, Ll/vrd;->c:I

    .line 91
    .line 92
    invoke-virtual {v0, p0, v6, p1, v8}, Ll/vrd;->f(Landroid/content/Context;Landroid/os/Handler;ILjava/util/ArrayList;)V

    .line 93
    .line 94
    .line 95
    const/4 p0, 0x0

    .line 96
    new-array p0, p0, [Lcom/google/android/exoplayer2/x;

    .line 97
    .line 98
    invoke-virtual {v8, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    check-cast p0, [Lcom/google/android/exoplayer2/x;

    .line 103
    .line 104
    return-object p0
.end method

.method public b(Landroid/content/Context;ILcom/google/android/exoplayer2/mediacodec/e;ZLcom/google/android/exoplayer2/audio/AudioSink;Landroid/os/Handler;Lcom/google/android/exoplayer2/audio/c;Ljava/util/ArrayList;)V
    .locals 14
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Lcom/google/android/exoplayer2/mediacodec/e;",
            "Z",
            "Lcom/google/android/exoplayer2/audio/AudioSink;",
            "Landroid/os/Handler;",
            "Lcom/google/android/exoplayer2/audio/c;",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/exoplayer2/x;",
            ">;)V"
        }
    .end annotation

    .line 1
    move/from16 v0, p2

    .line 2
    .line 3
    move-object/from16 v9, p8

    .line 4
    .line 5
    const-class v10, Lcom/google/android/exoplayer2/audio/AudioSink;

    .line 6
    .line 7
    const-class v11, Lcom/google/android/exoplayer2/audio/c;

    .line 8
    .line 9
    const-class v12, Landroid/os/Handler;

    .line 10
    .line 11
    const-string v13, "DefaultRenderersFactory"

    .line 12
    .line 13
    new-instance v1, Lcom/google/android/exoplayer2/audio/h;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/vrd;->i()Lcom/google/android/exoplayer2/mediacodec/c$b;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    move-object v2, p1

    .line 20
    move-object/from16 v4, p3

    .line 21
    .line 22
    move/from16 v5, p4

    .line 23
    .line 24
    move-object/from16 v8, p5

    .line 25
    .line 26
    move-object/from16 v6, p6

    .line 27
    .line 28
    move-object/from16 v7, p7

    .line 29
    .line 30
    invoke-direct/range {v1 .. v8}, Lcom/google/android/exoplayer2/audio/h;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/mediacodec/c$b;Lcom/google/android/exoplayer2/mediacodec/e;ZLandroid/os/Handler;Lcom/google/android/exoplayer2/audio/c;Lcom/google/android/exoplayer2/audio/AudioSink;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    if-nez v0, :cond_0

    .line 37
    .line 38
    goto/16 :goto_6

    .line 39
    .line 40
    :cond_0
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    const/4 p1, 0x2

    .line 45
    if-ne v0, p1, :cond_1

    .line 46
    .line 47
    add-int/lit8 p0, p0, -0x1

    .line 48
    .line 49
    :cond_1
    :try_start_0
    const-string p1, "com.google.android.exoplayer2.decoder.midi.MidiRenderer"

    .line 50
    .line 51
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/4 v0, 0x0

    .line 56
    invoke-virtual {p1, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/google/android/exoplayer2/x;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 65
    .line 66
    add-int/lit8 v0, p0, 0x1

    .line 67
    .line 68
    :try_start_1
    invoke-virtual {v9, p0, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    const-string p0, "Loaded MidiRenderer."

    .line 72
    .line 73
    invoke-static {v13, p0}, Ll/kyv;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :catch_0
    move p0, v0

    .line 78
    goto :goto_0

    .line 79
    :catch_1
    move-exception v0

    .line 80
    move-object p0, v0

    .line 81
    const-string p1, "Error instantiating MIDI extension"

    .line 82
    .line 83
    invoke-static {p1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :catch_2
    :goto_0
    move v0, p0

    .line 88
    :goto_1
    :try_start_2
    const-string p0, "com.google.android.exoplayer2.ext.opus.LibopusAudioRenderer"

    .line 89
    .line 90
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    filled-new-array {v12, v11, v10}, [Ljava/lang/Class;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    filled-new-array {v6, v7, v8}, [Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-virtual {p0, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    check-cast p0, Lcom/google/android/exoplayer2/x;
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    .line 111
    .line 112
    add-int/lit8 p1, v0, 0x1

    .line 113
    .line 114
    :try_start_3
    invoke-virtual {v9, v0, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    const-string p0, "Loaded LibopusAudioRenderer."

    .line 118
    .line 119
    invoke-static {v13, p0}, Ll/kyv;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 120
    .line 121
    .line 122
    goto :goto_3

    .line 123
    :catch_3
    move v0, p1

    .line 124
    goto :goto_2

    .line 125
    :catch_4
    move-exception v0

    .line 126
    move-object p0, v0

    .line 127
    const-string p1, "Error instantiating Opus extension"

    .line 128
    .line 129
    invoke-static {p1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :catch_5
    :goto_2
    move p1, v0

    .line 134
    :goto_3
    :try_start_4
    const-string p0, "com.google.android.exoplayer2.ext.flac.LibflacAudioRenderer"

    .line 135
    .line 136
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    filled-new-array {v12, v11, v10}, [Ljava/lang/Class;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {p0, v0}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    filled-new-array {v6, v7, v8}, [Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-virtual {p0, v0}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    check-cast p0, Lcom/google/android/exoplayer2/x;
    :try_end_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_4} :catch_8
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_7

    .line 157
    .line 158
    add-int/lit8 v0, p1, 0x1

    .line 159
    .line 160
    :try_start_5
    invoke-virtual {v9, p1, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    const-string p0, "Loaded LibflacAudioRenderer."

    .line 164
    .line 165
    invoke-static {v13, p0}, Ll/kyv;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_5 .. :try_end_5} :catch_6
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_7

    .line 166
    .line 167
    .line 168
    goto :goto_5

    .line 169
    :catch_6
    move p1, v0

    .line 170
    goto :goto_4

    .line 171
    :catch_7
    move-exception v0

    .line 172
    move-object p0, v0

    .line 173
    const-string p1, "Error instantiating FLAC extension"

    .line 174
    .line 175
    invoke-static {p1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :catch_8
    :goto_4
    move v0, p1

    .line 180
    :goto_5
    :try_start_6
    const-string p0, "com.google.android.exoplayer2.ext.ffmpeg.FfmpegAudioRenderer"

    .line 181
    .line 182
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    filled-new-array {v12, v11, v10}, [Ljava/lang/Class;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-virtual {p0, p1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 191
    .line 192
    .line 193
    move-result-object p0

    .line 194
    filled-new-array {v6, v7, v8}, [Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object p1

    .line 198
    invoke-virtual {p0, p1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    check-cast p0, Lcom/google/android/exoplayer2/x;

    .line 203
    .line 204
    invoke-virtual {v9, v0, p0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 205
    .line 206
    .line 207
    const-string p0, "Loaded FfmpegAudioRenderer."

    .line 208
    .line 209
    invoke-static {v13, p0}, Ll/kyv;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/ClassNotFoundException; {:try_start_6 .. :try_end_6} :catch_a
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_9

    .line 210
    .line 211
    .line 212
    goto :goto_6

    .line 213
    :catch_9
    move-exception v0

    .line 214
    move-object p0, v0

    .line 215
    const-string p1, "Error instantiating FFmpeg extension"

    .line 216
    .line 217
    invoke-static {p1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 218
    .line 219
    .line 220
    :catch_a
    :goto_6
    return-void
.end method

.method public c(Landroid/content/Context;ZZZ)Lcom/google/android/exoplayer2/audio/AudioSink;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    new-instance p0, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p2}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;->i(Z)Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p0, p3}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;->h(Z)Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0, p4}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;->j(I)Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-virtual {p0}, Lcom/google/android/exoplayer2/audio/DefaultAudioSink$f;->g()Lcom/google/android/exoplayer2/audio/DefaultAudioSink;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    return-object p0
.end method

.method public d(Landroid/content/Context;ILjava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/exoplayer2/x;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/hb4;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/hb4;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p3, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public e(Landroid/content/Context;Ll/ga00;Landroid/os/Looper;ILjava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/ga00;",
            "Landroid/os/Looper;",
            "I",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/exoplayer2/x;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/google/android/exoplayer2/metadata/a;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Lcom/google/android/exoplayer2/metadata/a;-><init>(Ll/ga00;Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p5, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f(Landroid/content/Context;Landroid/os/Handler;ILjava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Landroid/os/Handler;",
            "I",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/exoplayer2/x;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public g(Landroid/content/Context;Ll/asi0;Landroid/os/Looper;ILjava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ll/asi0;",
            "Landroid/os/Looper;",
            "I",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/exoplayer2/x;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/esi0;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Ll/esi0;-><init>(Ll/asi0;Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p5, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h(Landroid/content/Context;ILcom/google/android/exoplayer2/mediacodec/e;ZLandroid/os/Handler;Ll/wjl0;JLjava/util/ArrayList;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Lcom/google/android/exoplayer2/mediacodec/e;",
            "Z",
            "Landroid/os/Handler;",
            "Ll/wjl0;",
            "J",
            "Ljava/util/ArrayList<",
            "Lcom/google/android/exoplayer2/x;",
            ">;)V"
        }
    .end annotation

    .line 1
    move/from16 v0, p2

    .line 2
    .line 3
    move-object/from16 v11, p9

    .line 4
    .line 5
    const-string v12, "DefaultRenderersFactory"

    .line 6
    .line 7
    const/16 v1, 0x32

    .line 8
    .line 9
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v13

    .line 13
    sget-object v14, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 14
    .line 15
    const-class v15, Ll/wjl0;

    .line 16
    .line 17
    const-class v1, Landroid/os/Handler;

    .line 18
    .line 19
    sget-object v2, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 20
    .line 21
    move-object v3, v1

    .line 22
    new-instance v1, Ll/xrx;

    .line 23
    .line 24
    invoke-virtual/range {p0 .. p0}, Ll/vrd;->i()Lcom/google/android/exoplayer2/mediacodec/c$b;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    const/16 v10, 0x32

    .line 29
    .line 30
    move/from16 v7, p4

    .line 31
    .line 32
    move-object/from16 v8, p5

    .line 33
    .line 34
    move-object/from16 v9, p6

    .line 35
    .line 36
    move-wide/from16 v5, p7

    .line 37
    .line 38
    move-object/from16 v16, v12

    .line 39
    .line 40
    move-object/from16 v17, v13

    .line 41
    .line 42
    move-object v13, v2

    .line 43
    move-object v12, v3

    .line 44
    move-object v3, v4

    .line 45
    move-object/from16 v2, p1

    .line 46
    .line 47
    move-object/from16 v4, p3

    .line 48
    .line 49
    invoke-direct/range {v1 .. v10}, Ll/xrx;-><init>(Landroid/content/Context;Lcom/google/android/exoplayer2/mediacodec/c$b;Lcom/google/android/exoplayer2/mediacodec/e;JZLandroid/os/Handler;Ll/wjl0;I)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v11, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    goto/16 :goto_3

    .line 58
    .line 59
    :cond_0
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    const/4 v2, 0x2

    .line 64
    if-ne v0, v2, :cond_1

    .line 65
    .line 66
    add-int/lit8 v1, v1, -0x1

    .line 67
    .line 68
    :cond_1
    :try_start_0
    const-string v0, "com.google.android.exoplayer2.ext.vp9.LibvpxVideoRenderer"

    .line 69
    .line 70
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    filled-new-array {v13, v12, v15, v14}, [Ljava/lang/Class;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v0, v2}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-static/range {p7 .. p8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 83
    .line 84
    .line 85
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    .line 86
    move-object/from16 v3, v17

    .line 87
    .line 88
    :try_start_1
    filled-new-array {v2, v8, v9, v3}, [Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    check-cast v0, Lcom/google/android/exoplayer2/x;
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    .line 97
    .line 98
    add-int/lit8 v2, v1, 0x1

    .line 99
    .line 100
    :try_start_2
    invoke-virtual {v11, v1, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    const-string v0, "Loaded LibvpxVideoRenderer."
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    .line 104
    .line 105
    move-object/from16 v4, v16

    .line 106
    .line 107
    :try_start_3
    invoke-static {v4, v0}, Ll/kyv;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/ClassNotFoundException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    .line 108
    .line 109
    .line 110
    goto :goto_2

    .line 111
    :catch_0
    :goto_0
    move v1, v2

    .line 112
    goto :goto_1

    .line 113
    :catch_1
    move-object/from16 v4, v16

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :catch_2
    move-object/from16 v4, v16

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :catch_3
    move-object/from16 v4, v16

    .line 120
    .line 121
    move-object/from16 v3, v17

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :catch_4
    move-exception v0

    .line 125
    const-string v1, "Error instantiating VP9 extension"

    .line 126
    .line 127
    invoke-static {v1, v0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :goto_1
    move v2, v1

    .line 132
    :goto_2
    :try_start_4
    const-string v0, "com.google.android.exoplayer2.ext.av1.Libgav1VideoRenderer"

    .line 133
    .line 134
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    filled-new-array {v13, v12, v15, v14}, [Ljava/lang/Class;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    invoke-virtual {v0, v1}, Ljava/lang/Class;->getConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    invoke-static/range {p7 .. p8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    filled-new-array {v1, v8, v9, v3}, [Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Lcom/google/android/exoplayer2/x;

    .line 159
    .line 160
    invoke-virtual {v11, v2, v0}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 161
    .line 162
    .line 163
    const-string v0, "Loaded Libgav1VideoRenderer."

    .line 164
    .line 165
    invoke-static {v4, v0}, Ll/kyv;->f(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/ClassNotFoundException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5

    .line 166
    .line 167
    .line 168
    goto :goto_3

    .line 169
    :catch_5
    move-exception v0

    .line 170
    const-string v1, "Error instantiating AV1 extension"

    .line 171
    .line 172
    invoke-static {v1, v0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 173
    .line 174
    .line 175
    :catch_6
    :goto_3
    return-void
.end method

.method public i()Lcom/google/android/exoplayer2/mediacodec/c$b;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vrd;->b:Lcom/google/android/exoplayer2/mediacodec/b;

    .line 2
    .line 3
    return-object p0
.end method
