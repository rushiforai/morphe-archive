.class Ll/grx$d;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/grx;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field private a:Z

.field private b:Z

.field private c:J

.field final synthetic d:Ll/grx;


# direct methods
.method public constructor <init>(Ll/grx;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/grx$d;->d:Ll/grx;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/Thread;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/grx$d;->a:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/grx$d;->b:Z

    .line 10
    .line 11
    const-wide/16 p1, 0x0

    .line 12
    .line 13
    iput-wide p1, p0, Ll/grx$d;->c:J

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a()V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/grx$d;->a:Z

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
    const-string v2, "SoftCodecThread quit"

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
    .locals 5

    .line 1
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-nez v0, :cond_5

    .line 7
    .line 8
    iget-boolean v0, p0, Ll/grx$d;->a:Z

    .line 9
    .line 10
    if-nez v0, :cond_5

    .line 11
    .line 12
    iget-object v0, p0, Ll/grx$d;->d:Ll/grx;

    .line 13
    .line 14
    invoke-static {v0}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    iget-boolean v0, p0, Ll/grx$d;->b:Z

    .line 21
    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p0, Ll/grx$d;->d:Ll/grx;

    .line 25
    .line 26
    invoke-static {v0}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sget-object v2, Ll/pwk;->c:[B

    .line 31
    .line 32
    invoke-static {v2}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    sget-object v3, Ll/pwk;->c:[B

    .line 37
    .line 38
    array-length v3, v3

    .line 39
    int-to-long v3, v3

    .line 40
    invoke-interface {v0, v2, v3, v4}, Ll/g220;->z0(Ljava/nio/ByteBuffer;J)Z

    .line 41
    .line 42
    .line 43
    iput-boolean v1, p0, Ll/grx$d;->b:Z

    .line 44
    .line 45
    :cond_0
    const-wide/16 v0, 0x42

    .line 46
    .line 47
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 48
    .line 49
    .line 50
    goto :goto_1

    .line 51
    :catch_0
    move-exception v0

    .line 52
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 53
    .line 54
    .line 55
    :goto_1
    iget-wide v0, p0, Ll/grx$d;->c:J

    .line 56
    .line 57
    const-wide/16 v2, 0xf

    .line 58
    .line 59
    rem-long/2addr v0, v2

    .line 60
    const-wide/16 v2, 0x0

    .line 61
    .line 62
    cmp-long v0, v0, v2

    .line 63
    .line 64
    if-nez v0, :cond_1

    .line 65
    .line 66
    iget-object v0, p0, Ll/grx$d;->d:Ll/grx;

    .line 67
    .line 68
    invoke-static {v0}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    if-eqz v0, :cond_4

    .line 73
    .line 74
    iget-object v0, p0, Ll/grx$d;->d:Ll/grx;

    .line 75
    .line 76
    invoke-static {v0}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    sget-object v1, Ll/pwk;->e:[B

    .line 81
    .line 82
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-interface {v0, v1}, Ll/g220;->p0(Ljava/nio/ByteBuffer;)Z

    .line 87
    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_1
    sget-object v0, Ll/pwk;->f:[B

    .line 91
    .line 92
    if-nez v0, :cond_2

    .line 93
    .line 94
    iget-object v0, p0, Ll/grx$d;->d:Ll/grx;

    .line 95
    .line 96
    iget-object v0, v0, Ll/grx;->i1:Ll/uow;

    .line 97
    .line 98
    iget v1, v0, Ll/tow;->m:I

    .line 99
    .line 100
    iget v0, v0, Ll/tow;->n:I

    .line 101
    .line 102
    mul-int/2addr v1, v0

    .line 103
    mul-int/lit8 v1, v1, 0x3

    .line 104
    .line 105
    div-int/lit8 v1, v1, 0x2

    .line 106
    .line 107
    new-array v0, v1, [B

    .line 108
    .line 109
    sput-object v0, Ll/pwk;->f:[B

    .line 110
    .line 111
    :cond_2
    sget-object v0, Ll/pwk;->f:[B

    .line 112
    .line 113
    if-eqz v0, :cond_3

    .line 114
    .line 115
    iget-object v1, p0, Ll/grx$d;->d:Ll/grx;

    .line 116
    .line 117
    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    invoke-interface {v1, v0}, Lcom/momo/pipline/MomoInterface/MomoCodec;->o1(Ljava/nio/ByteBuffer;)Z

    .line 122
    .line 123
    .line 124
    :cond_3
    iget-object v0, p0, Ll/grx$d;->d:Ll/grx;

    .line 125
    .line 126
    invoke-static {v0}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    if-eqz v0, :cond_4

    .line 131
    .line 132
    iget-object v0, p0, Ll/grx$d;->d:Ll/grx;

    .line 133
    .line 134
    invoke-static {v0}, Ll/grx;->q2(Ll/grx;)Ll/g220;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    sget-object v1, Ll/pwk;->d:[B

    .line 139
    .line 140
    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-interface {v0, v1}, Ll/g220;->p0(Ljava/nio/ByteBuffer;)Z

    .line 145
    .line 146
    .line 147
    :cond_4
    :goto_2
    iget-wide v0, p0, Ll/grx$d;->c:J

    .line 148
    .line 149
    const-wide/16 v2, 0x1

    .line 150
    .line 151
    add-long/2addr v0, v2

    .line 152
    iput-wide v0, p0, Ll/grx$d;->c:J

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :cond_5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    new-instance v2, Ljava/lang/StringBuilder;

    .line 161
    .line 162
    const-string v3, "SoftFakeCodecThread end interrupted"

    .line 163
    .line 164
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    xor-int/2addr v1, v3

    .line 172
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v1, " shouldQuit:"

    .line 176
    .line 177
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    iget-boolean v1, p0, Ll/grx$d;->a:Z

    .line 181
    .line 182
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    const-string v1, " mIsRunning:"

    .line 186
    .line 187
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    iget-object p0, p0, Ll/grx$d;->d:Ll/grx;

    .line 191
    .line 192
    iget-boolean p0, p0, Ll/grx;->X0:Z

    .line 193
    .line 194
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 195
    .line 196
    .line 197
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 202
    .line 203
    invoke-virtual {v0, v1, p0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    return-void
.end method
