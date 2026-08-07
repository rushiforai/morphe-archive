.class Ll/grx$b;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/grx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field private a:Z

.field private b:Lcom/momo/voaac/VoAACEncoder;

.field private c:Z

.field final synthetic d:Ll/grx;


# direct methods
.method public constructor <init>(Ll/grx;Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/grx$b;->d:Ll/grx;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x0

    .line 7
    iput-boolean p2, p0, Ll/grx$b;->a:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Ll/grx$b;->b:Lcom/momo/voaac/VoAACEncoder;

    .line 11
    .line 12
    iput-boolean p2, p0, Ll/grx$b;->c:Z

    .line 13
    .line 14
    new-instance v0, Lcom/momo/voaac/VoAACEncoder;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/momo/voaac/VoAACEncoder;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/grx$b;->b:Lcom/momo/voaac/VoAACEncoder;

    .line 20
    .line 21
    iget-object p0, p1, Ll/grx;->i1:Ll/uow;

    .line 22
    .line 23
    iget p1, p0, Ll/tow;->R:I

    .line 24
    .line 25
    int-to-short p1, p1

    .line 26
    iget v1, p0, Ll/tow;->P:I

    .line 27
    .line 28
    iget p0, p0, Ll/tow;->S:I

    .line 29
    .line 30
    invoke-virtual {v0, v1, p0, p1, p2}, Lcom/momo/voaac/VoAACEncoder;->InitEncoder(IISS)V

    .line 31
    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/grx$b;->a:Z

    .line 3
    .line 4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 9
    .line 10
    const-string v2, "SoftAudioCodecThread quit"

    .line 11
    .line 12
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public run()V
    .locals 6

    .line 1
    :cond_0
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    iget-boolean v0, p0, Ll/grx$b;->a:Z

    .line 10
    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    iget-object v0, p0, Ll/grx$b;->d:Ll/grx;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/grx;->S2()Ll/oxd0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v3, p0, Ll/grx$b;->d:Ll/grx;

    .line 22
    .line 23
    invoke-static {v3}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    if-eqz v3, :cond_0

    .line 28
    .line 29
    iget-object v3, p0, Ll/grx$b;->b:Lcom/momo/voaac/VoAACEncoder;

    .line 30
    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    iget-object v0, v0, Ll/oxd0;->a:[B

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    invoke-virtual {v3, v0}, Lcom/momo/voaac/VoAACEncoder;->EncData([B)[B

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    :cond_1
    if-eqz v2, :cond_0

    .line 42
    .line 43
    iget-object v0, p0, Ll/grx$b;->d:Ll/grx;

    .line 44
    .line 45
    invoke-static {v0}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-boolean v0, p0, Ll/grx$b;->c:Z

    .line 52
    .line 53
    if-nez v0, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Ll/grx$b;->d:Ll/grx;

    .line 56
    .line 57
    invoke-static {v0}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    sget-object v3, Ll/pwk;->a:[B

    .line 62
    .line 63
    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    sget-object v4, Ll/pwk;->a:[B

    .line 68
    .line 69
    array-length v4, v4

    .line 70
    int-to-long v4, v4

    .line 71
    invoke-interface {v0, v3, v4, v5}, Ll/g220;->t1(Ljava/nio/ByteBuffer;J)Z

    .line 72
    .line 73
    .line 74
    iput-boolean v1, p0, Ll/grx$b;->c:Z

    .line 75
    .line 76
    :cond_2
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 81
    .line 82
    const-string v3, "Mp4MuxerWrapper writeSoftAudioSample "

    .line 83
    .line 84
    invoke-virtual {v0, v1, v3}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Ll/grx$b;->d:Ll/grx;

    .line 88
    .line 89
    invoke-static {v0}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    if-eqz v0, :cond_0

    .line 94
    .line 95
    iget-object v0, p0, Ll/grx$b;->d:Ll/grx;

    .line 96
    .line 97
    invoke-static {v0}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-interface {v0, v1}, Ll/g220;->K0(Ljava/nio/ByteBuffer;)Z

    .line 106
    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_3
    iget-object v0, p0, Ll/grx$b;->d:Ll/grx;

    .line 110
    .line 111
    invoke-static {v0}, Ll/grx;->r2(Ll/grx;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    monitor-enter v0

    .line 116
    :try_start_0
    iget-object v3, p0, Ll/grx$b;->b:Lcom/momo/voaac/VoAACEncoder;

    .line 117
    .line 118
    if-eqz v3, :cond_4

    .line 119
    .line 120
    invoke-virtual {v3}, Lcom/momo/voaac/VoAACEncoder;->release()V

    .line 121
    .line 122
    .line 123
    iput-object v2, p0, Ll/grx$b;->b:Lcom/momo/voaac/VoAACEncoder;

    .line 124
    .line 125
    goto :goto_1

    .line 126
    :catchall_0
    move-exception p0

    .line 127
    goto :goto_2

    .line 128
    :cond_4
    :goto_1
    iget-object v3, p0, Ll/grx$b;->d:Ll/grx;

    .line 129
    .line 130
    invoke-static {v3}, Ll/grx;->s2(Ll/grx;)Ljava/util/LinkedList;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    if-eqz v3, :cond_5

    .line 135
    .line 136
    iget-object v3, p0, Ll/grx$b;->d:Ll/grx;

    .line 137
    .line 138
    invoke-static {v3}, Ll/grx;->s2(Ll/grx;)Ljava/util/LinkedList;

    .line 139
    .line 140
    .line 141
    move-result-object v3

    .line 142
    invoke-virtual {v3}, Ljava/util/LinkedList;->clear()V

    .line 143
    .line 144
    .line 145
    iget-object v3, p0, Ll/grx$b;->d:Ll/grx;

    .line 146
    .line 147
    invoke-static {v3, v2}, Ll/grx;->t2(Ll/grx;Ljava/util/LinkedList;)Ljava/util/LinkedList;

    .line 148
    .line 149
    .line 150
    :cond_5
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 151
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 156
    .line 157
    new-instance v3, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    const-string v4, "SoftAudioCodecThread end interrupted"

    .line 160
    .line 161
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 165
    .line 166
    .line 167
    move-result v4

    .line 168
    xor-int/2addr v1, v4

    .line 169
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string v1, " AudioshouldQuit:"

    .line 173
    .line 174
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    iget-boolean v1, p0, Ll/grx$b;->a:Z

    .line 178
    .line 179
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    const-string v1, " AudioIsRunning:"

    .line 183
    .line 184
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    iget-object p0, p0, Ll/grx$b;->d:Ll/grx;

    .line 188
    .line 189
    iget-boolean p0, p0, Ll/grx;->X0:Z

    .line 190
    .line 191
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object p0

    .line 198
    invoke-virtual {v0, v2, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    return-void

    .line 202
    :goto_2
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 203
    throw p0
.end method
