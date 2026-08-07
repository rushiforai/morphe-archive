.class Ll/s5r$b;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/s5r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field private a:Z

.field private b:Z

.field private c:Z

.field private d:Z

.field private e:Lcom/immomo/mediabase/AudioPlayer;

.field private f:I

.field final synthetic g:Ll/s5r;


# direct methods
.method public constructor <init>(Ll/s5r;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/s5r$b;->g:Ll/s5r;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/s5r$b;->a:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/s5r$b;->b:Z

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Ll/s5r$b;->c:Z

    .line 13
    .line 14
    iput-boolean p1, p0, Ll/s5r$b;->d:Z

    .line 15
    .line 16
    const/4 p1, 0x0

    .line 17
    iput-object p1, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 18
    .line 19
    const/4 p1, 0x3

    .line 20
    iput p1, p0, Ll/s5r$b;->f:I

    .line 21
    .line 22
    const-string p1, "HUOHL_KtvPlayer_MusicData"

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/s5r$b;->c:Z

    .line 3
    .line 4
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/s5r$b;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/s5r$b;->c:Z

    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/s5r$b;->d:Z

    .line 6
    .line 7
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/s5r$b;->a:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/s5r$b;->b:Z

    .line 5
    .line 6
    return-void
.end method

.method public run()V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/immomo/mediabase/AudioPlayer;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/immomo/mediabase/AudioPlayer;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 11
    .line 12
    iget-object v0, p0, Ll/s5r$b;->g:Ll/s5r;

    .line 13
    .line 14
    invoke-static {v0}, Ll/s5r;->j(Ll/s5r;)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Ll/s5r$b;->f:I

    .line 19
    .line 20
    iget-object v1, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Lcom/immomo/mediabase/AudioPlayer;->setStreamType(I)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 26
    .line 27
    invoke-static {}, Ll/s5r;->k()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-static {}, Ll/s5r;->l()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-static {}, Ll/s5r;->m()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-virtual {v0, v1, v2, v3}, Lcom/immomo/mediabase/AudioPlayer;->prepare(III)Z

    .line 40
    .line 41
    .line 42
    :cond_0
    iget-object v0, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 43
    .line 44
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioPlayer;->reset()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioPlayer;->resume()V

    .line 50
    .line 51
    .line 52
    :catch_0
    :cond_1
    :goto_0
    iget-boolean v0, p0, Ll/s5r$b;->b:Z

    .line 53
    .line 54
    if-nez v0, :cond_6

    .line 55
    .line 56
    iget-boolean v0, p0, Ll/s5r$b;->a:Z

    .line 57
    .line 58
    if-eqz v0, :cond_2

    .line 59
    .line 60
    goto/16 :goto_2

    .line 61
    .line 62
    :cond_2
    iget-boolean v0, p0, Ll/s5r$b;->c:Z

    .line 63
    .line 64
    if-eqz v0, :cond_3

    .line 65
    .line 66
    iget-object v0, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioPlayer;->pause()V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioPlayer;->reset()V

    .line 74
    .line 75
    .line 76
    const-wide/16 v0, 0x64

    .line 77
    .line 78
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_3
    iget-object v0, p0, Ll/s5r$b;->g:Ll/s5r;

    .line 83
    .line 84
    invoke-static {v0}, Ll/s5r;->n(Ll/s5r;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    const/4 v1, 0x0

    .line 89
    if-eqz v0, :cond_4

    .line 90
    .line 91
    iget v0, p0, Ll/s5r$b;->f:I

    .line 92
    .line 93
    iget-object v2, p0, Ll/s5r$b;->g:Ll/s5r;

    .line 94
    .line 95
    invoke-static {v2}, Ll/s5r;->j(Ll/s5r;)I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eq v0, v2, :cond_4

    .line 100
    .line 101
    iget-object v0, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 102
    .line 103
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioPlayer;->release()V

    .line 104
    .line 105
    .line 106
    iget-object v0, p0, Ll/s5r$b;->g:Ll/s5r;

    .line 107
    .line 108
    invoke-static {v0}, Ll/s5r;->j(Ll/s5r;)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    iput v0, p0, Ll/s5r$b;->f:I

    .line 113
    .line 114
    iget-object v2, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 115
    .line 116
    invoke-virtual {v2, v0}, Lcom/immomo/mediabase/AudioPlayer;->setStreamType(I)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 120
    .line 121
    invoke-static {}, Ll/s5r;->k()I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    invoke-static {}, Ll/s5r;->l()I

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    invoke-static {}, Ll/s5r;->m()I

    .line 130
    .line 131
    .line 132
    move-result v4

    .line 133
    invoke-virtual {v0, v2, v3, v4}, Lcom/immomo/mediabase/AudioPlayer;->prepare(III)Z

    .line 134
    .line 135
    .line 136
    iget-object v0, p0, Ll/s5r$b;->g:Ll/s5r;

    .line 137
    .line 138
    invoke-static {v0, v1}, Ll/s5r;->o(Ll/s5r;Z)Z

    .line 139
    .line 140
    .line 141
    new-instance v0, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    const-string v2, "run: audiotrack \u66f4\u65b0OK\uff1a "

    .line 144
    .line 145
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    iget-object v2, p0, Ll/s5r$b;->g:Ll/s5r;

    .line 149
    .line 150
    invoke-static {v2}, Ll/s5r;->j(Ll/s5r;)I

    .line 151
    .line 152
    .line 153
    move-result v2

    .line 154
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    const-string v2, "HUOHL_KtvPlayer"

    .line 162
    .line 163
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 164
    .line 165
    .line 166
    :cond_4
    iget-boolean v0, p0, Ll/s5r$b;->d:Z

    .line 167
    .line 168
    if-eqz v0, :cond_5

    .line 169
    .line 170
    iput-boolean v1, p0, Ll/s5r$b;->d:Z

    .line 171
    .line 172
    iget-object v0, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 173
    .line 174
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioPlayer;->reset()V

    .line 175
    .line 176
    .line 177
    iget-object v0, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 178
    .line 179
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioPlayer;->resume()V

    .line 180
    .line 181
    .line 182
    :cond_5
    iget-object v0, p0, Ll/s5r$b;->g:Ll/s5r;

    .line 183
    .line 184
    invoke-static {v0}, Ll/s5r;->h(Ll/s5r;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    const/4 v2, 0x4

    .line 193
    if-le v0, v2, :cond_1

    .line 194
    .line 195
    :goto_1
    if-ge v1, v2, :cond_1

    .line 196
    .line 197
    :try_start_1
    iget-object v0, p0, Ll/s5r$b;->g:Ll/s5r;

    .line 198
    .line 199
    invoke-static {v0}, Ll/s5r;->h(Ll/s5r;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    check-cast v0, Ljava/nio/ByteBuffer;

    .line 208
    .line 209
    iget-object v3, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 210
    .line 211
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    .line 212
    .line 213
    .line 214
    move-result-object v4

    .line 215
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 216
    .line 217
    .line 218
    move-result v5

    .line 219
    invoke-virtual {v3, v4, v5}, Lcom/immomo/mediabase/AudioPlayer;->writeAudio([BI)V

    .line 220
    .line 221
    .line 222
    iget-object v3, p0, Ll/s5r$b;->g:Ll/s5r;

    .line 223
    .line 224
    invoke-virtual {v0}, Ljava/nio/Buffer;->limit()I

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    int-to-long v4, v0

    .line 229
    invoke-static {v3, v4, v5}, Ll/s5r;->x(Ll/s5r;J)J
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 230
    .line 231
    .line 232
    add-int/lit8 v1, v1, 0x1

    .line 233
    .line 234
    goto :goto_1

    .line 235
    :cond_6
    :goto_2
    iget-object v0, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 236
    .line 237
    invoke-virtual {v0}, Lcom/immomo/mediabase/AudioPlayer;->release()V

    .line 238
    .line 239
    .line 240
    const/4 v0, 0x0

    .line 241
    iput-object v0, p0, Ll/s5r$b;->e:Lcom/immomo/mediabase/AudioPlayer;

    .line 242
    .line 243
    return-void
.end method
