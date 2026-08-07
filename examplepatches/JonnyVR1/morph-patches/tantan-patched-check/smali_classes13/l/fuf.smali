.class public Ll/fuf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bam;


# instance fields
.field public a:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fuf;->a:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method public static c(J)Ljava/lang/String;
    .locals 6

    .line 1
    const-wide/16 v0, 0x3e8

    .line 2
    .line 3
    div-long/2addr p0, v0

    .line 4
    const-wide/16 v0, 0x3c

    .line 5
    .line 6
    div-long v2, p0, v0

    .line 7
    .line 8
    div-long v4, v2, v0

    .line 9
    .line 10
    rem-long/2addr p0, v0

    .line 11
    rem-long/2addr v2, v0

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v1, ":"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method


# virtual methods
.method public a(Ljava/lang/String;Ll/ht5;Ll/it5;Ll/bam$c;Ll/bam$d;Ll/bam$a;Ll/bam$b;)Z
    .locals 6

    .line 1
    new-instance v0, Ll/fuf$a;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v4, p4

    .line 5
    move-object v3, p5

    .line 6
    move-object v5, p6

    .line 7
    move-object v2, p7

    .line 8
    invoke-direct/range {v0 .. v5}, Ll/fuf$a;-><init>(Ll/fuf;Ll/bam$b;Ll/bam$d;Ll/bam$c;Ll/bam$a;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, p1, p2, p3, v0}, Ll/fuf;->b(Ljava/lang/String;Ll/ht5;Ll/it5;Ll/bam$e;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public b(Ljava/lang/String;Ll/ht5;Ll/it5;Ll/bam$e;)Z
    .locals 38

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v3, p4

    .line 8
    .line 9
    const-string v4, ":"

    .line 10
    .line 11
    const-string v5, "crop="

    .line 12
    .line 13
    const/4 v6, 0x1

    .line 14
    const/4 v7, 0x0

    .line 15
    if-eqz v3, :cond_0

    .line 16
    .line 17
    :try_start_0
    iget-object v8, v0, Ll/fuf;->a:Ljava/lang/String;

    .line 18
    .line 19
    invoke-interface {v3, v8, v6}, Ll/bam$e;->a(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move v6, v7

    .line 24
    goto/16 :goto_2

    .line 25
    .line 26
    :catch_0
    move-exception v0

    .line 27
    goto/16 :goto_1

    .line 28
    .line 29
    :cond_0
    :goto_0
    iget-wide v8, v2, Ll/it5;->h:J

    .line 30
    .line 31
    iget-wide v10, v2, Ll/it5;->i:J

    .line 32
    .line 33
    const-string v12, "ffmpeg"

    .line 34
    .line 35
    const-string v13, "-probesize"

    .line 36
    .line 37
    const-string v14, "32M"

    .line 38
    .line 39
    const-string v15, "-analyzeduration"

    .line 40
    .line 41
    const-string v16, "10000000"

    .line 42
    .line 43
    const-string v17, "-i"

    .line 44
    .line 45
    iget-object v0, v0, Ll/fuf;->a:Ljava/lang/String;

    .line 46
    .line 47
    const-string v19, "-vf"

    .line 48
    .line 49
    move/from16 p2, v6

    .line 50
    .line 51
    new-instance v6, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    invoke-direct {v6, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget v5, v2, Ll/it5;->f:I

    .line 57
    .line 58
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    iget v5, v2, Ll/it5;->g:I

    .line 65
    .line 66
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget v5, v2, Ll/it5;->j:I

    .line 73
    .line 74
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget v5, v2, Ll/it5;->k:I

    .line 81
    .line 82
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    const-string v5, ",scale="

    .line 86
    .line 87
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    iget v5, v2, Ll/it5;->d:I

    .line 91
    .line 92
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    iget v2, v2, Ll/it5;->e:I

    .line 99
    .line 100
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v20

    .line 107
    const-string v21, "-preset"

    .line 108
    .line 109
    const-string v22, "veryfast"

    .line 110
    .line 111
    const-string v23, "-tune"

    .line 112
    .line 113
    const-string v24, "fastdecode"

    .line 114
    .line 115
    const-string v25, "-tune"

    .line 116
    .line 117
    const-string v26, "zerolatency"

    .line 118
    .line 119
    const-string v27, "-y"

    .line 120
    .line 121
    const-string v28, "-c:v"

    .line 122
    .line 123
    const-string v29, "libx264"

    .line 124
    .line 125
    const-string v30, "-c:a"

    .line 126
    .line 127
    const-string v31, "aac"

    .line 128
    .line 129
    const-string v32, "-b:a"

    .line 130
    .line 131
    const-string v33, "48k"

    .line 132
    .line 133
    const-string v34, "-strict"

    .line 134
    .line 135
    const-string v35, "-2"

    .line 136
    .line 137
    const-string v36, "-metadata:s:v:0"

    .line 138
    .line 139
    const-string v37, "rotate=0"

    .line 140
    .line 141
    move-object/from16 v18, v0

    .line 142
    .line 143
    filled-new-array/range {v12 .. v37}, [Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-static {v0}, Lcom/google/common/collect/Lists;->m([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    const-wide/16 v4, -0x1

    .line 152
    .line 153
    cmp-long v2, v8, v4

    .line 154
    .line 155
    if-eqz v2, :cond_1

    .line 156
    .line 157
    cmp-long v2, v10, v4

    .line 158
    .line 159
    if-eqz v2, :cond_1

    .line 160
    .line 161
    const-string v2, "-ss"

    .line 162
    .line 163
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    invoke-static {v8, v9}, Ll/fuf;->c(J)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    const-string v2, "-t"

    .line 174
    .line 175
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    sub-long/2addr v10, v8

    .line 179
    invoke-static {v10, v11}, Ll/fuf;->c(J)Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    :cond_1
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    new-array v2, v2, [Ljava/lang/String;

    .line 197
    .line 198
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    invoke-static {v2}, Lcom/p1/mobile/android/media/TTFFmpegCommand;->a([Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/p1/mobile/android/media/TTFFmpegCommand$FFmpegCommandException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 202
    .line 203
    .line 204
    if-eqz v3, :cond_2

    .line 205
    .line 206
    :try_start_1
    invoke-interface {v3, v1}, Ll/bam$e;->onSuccess(Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/p1/mobile/android/media/TTFFmpegCommand$FFmpegCommandException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 207
    .line 208
    .line 209
    return p2

    .line 210
    :catchall_1
    move/from16 v6, p2

    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_2
    return p2

    .line 214
    :goto_1
    if-eqz v3, :cond_3

    .line 215
    .line 216
    :try_start_2
    invoke-interface {v3, v0, v1}, Ll/bam$e;->c(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    :cond_3
    throw v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 220
    :goto_2
    return v6
.end method
