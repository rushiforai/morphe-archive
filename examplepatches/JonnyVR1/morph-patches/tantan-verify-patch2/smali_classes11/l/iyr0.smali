.class public final Ll/iyr0;
.super Ll/zox0;
.source "SourceFile"


# instance fields
.field public l:Ljava/util/Date;

.field public m:Ljava/util/Date;

.field public n:J

.field public o:J

.field public p:D

.field public q:F

.field public r:Ll/jpx0;

.field public s:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const-string v0, "mvhd"

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ll/zox0;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-wide/high16 v0, 0x3ff0000000000000L    # 1.0

    .line 7
    .line 8
    iput-wide v0, p0, Ll/iyr0;->p:D

    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    iput v0, p0, Ll/iyr0;->q:F

    .line 13
    .line 14
    sget-object v0, Ll/jpx0;->j:Ll/jpx0;

    .line 15
    .line 16
    iput-object v0, p0, Ll/iyr0;->r:Ll/jpx0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final c(Ljava/nio/ByteBuffer;)V
    .locals 23

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p1}, Ll/zox0;->g(Ljava/nio/ByteBuffer;)J

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ll/zox0;->f()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x1

    .line 11
    if-ne v1, v2, :cond_0

    .line 12
    .line 13
    invoke-static/range {p1 .. p1}, Ll/eyr0;->f(Ljava/nio/ByteBuffer;)J

    .line 14
    .line 15
    .line 16
    move-result-wide v3

    .line 17
    invoke-static {v3, v4}, Ll/epx0;->a(J)Ljava/util/Date;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Ll/iyr0;->l:Ljava/util/Date;

    .line 22
    .line 23
    invoke-static/range {p1 .. p1}, Ll/eyr0;->f(Ljava/nio/ByteBuffer;)J

    .line 24
    .line 25
    .line 26
    move-result-wide v3

    .line 27
    invoke-static {v3, v4}, Ll/epx0;->a(J)Ljava/util/Date;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Ll/iyr0;->m:Ljava/util/Date;

    .line 32
    .line 33
    invoke-static/range {p1 .. p1}, Ll/eyr0;->e(Ljava/nio/ByteBuffer;)J

    .line 34
    .line 35
    .line 36
    move-result-wide v3

    .line 37
    iput-wide v3, v0, Ll/iyr0;->n:J

    .line 38
    .line 39
    invoke-static/range {p1 .. p1}, Ll/eyr0;->f(Ljava/nio/ByteBuffer;)J

    .line 40
    .line 41
    .line 42
    move-result-wide v3

    .line 43
    iput-wide v3, v0, Ll/iyr0;->o:J

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    invoke-static/range {p1 .. p1}, Ll/eyr0;->e(Ljava/nio/ByteBuffer;)J

    .line 47
    .line 48
    .line 49
    move-result-wide v3

    .line 50
    invoke-static {v3, v4}, Ll/epx0;->a(J)Ljava/util/Date;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, v0, Ll/iyr0;->l:Ljava/util/Date;

    .line 55
    .line 56
    invoke-static/range {p1 .. p1}, Ll/eyr0;->e(Ljava/nio/ByteBuffer;)J

    .line 57
    .line 58
    .line 59
    move-result-wide v3

    .line 60
    invoke-static {v3, v4}, Ll/epx0;->a(J)Ljava/util/Date;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    iput-object v1, v0, Ll/iyr0;->m:Ljava/util/Date;

    .line 65
    .line 66
    invoke-static/range {p1 .. p1}, Ll/eyr0;->e(Ljava/nio/ByteBuffer;)J

    .line 67
    .line 68
    .line 69
    move-result-wide v3

    .line 70
    iput-wide v3, v0, Ll/iyr0;->n:J

    .line 71
    .line 72
    invoke-static/range {p1 .. p1}, Ll/eyr0;->e(Ljava/nio/ByteBuffer;)J

    .line 73
    .line 74
    .line 75
    move-result-wide v3

    .line 76
    iput-wide v3, v0, Ll/iyr0;->o:J

    .line 77
    .line 78
    :goto_0
    invoke-static/range {p1 .. p1}, Ll/eyr0;->b(Ljava/nio/ByteBuffer;)D

    .line 79
    .line 80
    .line 81
    move-result-wide v3

    .line 82
    iput-wide v3, v0, Ll/iyr0;->p:D

    .line 83
    .line 84
    const/4 v1, 0x2

    .line 85
    new-array v1, v1, [B

    .line 86
    .line 87
    move-object/from16 v3, p1

    .line 88
    .line 89
    invoke-virtual {v3, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 90
    .line 91
    .line 92
    const/4 v4, 0x0

    .line 93
    aget-byte v4, v1, v4

    .line 94
    .line 95
    shl-int/lit8 v4, v4, 0x8

    .line 96
    .line 97
    aget-byte v1, v1, v2

    .line 98
    .line 99
    and-int/lit16 v1, v1, 0xff

    .line 100
    .line 101
    const v2, 0xff00

    .line 102
    .line 103
    .line 104
    and-int/2addr v2, v4

    .line 105
    int-to-short v2, v2

    .line 106
    or-int/2addr v1, v2

    .line 107
    int-to-short v1, v1

    .line 108
    int-to-float v1, v1

    .line 109
    const/high16 v2, 0x43800000    # 256.0f

    .line 110
    .line 111
    div-float/2addr v1, v2

    .line 112
    iput v1, v0, Ll/iyr0;->q:F

    .line 113
    .line 114
    invoke-static {v3}, Ll/eyr0;->d(Ljava/nio/ByteBuffer;)I

    .line 115
    .line 116
    .line 117
    invoke-static {v3}, Ll/eyr0;->e(Ljava/nio/ByteBuffer;)J

    .line 118
    .line 119
    .line 120
    invoke-static {v3}, Ll/eyr0;->e(Ljava/nio/ByteBuffer;)J

    .line 121
    .line 122
    .line 123
    invoke-static {v3}, Ll/eyr0;->b(Ljava/nio/ByteBuffer;)D

    .line 124
    .line 125
    .line 126
    move-result-wide v5

    .line 127
    invoke-static {v3}, Ll/eyr0;->b(Ljava/nio/ByteBuffer;)D

    .line 128
    .line 129
    .line 130
    move-result-wide v7

    .line 131
    invoke-static {v3}, Ll/eyr0;->a(Ljava/nio/ByteBuffer;)D

    .line 132
    .line 133
    .line 134
    move-result-wide v13

    .line 135
    invoke-static {v3}, Ll/eyr0;->b(Ljava/nio/ByteBuffer;)D

    .line 136
    .line 137
    .line 138
    move-result-wide v9

    .line 139
    invoke-static {v3}, Ll/eyr0;->b(Ljava/nio/ByteBuffer;)D

    .line 140
    .line 141
    .line 142
    move-result-wide v11

    .line 143
    invoke-static {v3}, Ll/eyr0;->a(Ljava/nio/ByteBuffer;)D

    .line 144
    .line 145
    .line 146
    move-result-wide v15

    .line 147
    invoke-static {v3}, Ll/eyr0;->b(Ljava/nio/ByteBuffer;)D

    .line 148
    .line 149
    .line 150
    move-result-wide v19

    .line 151
    invoke-static {v3}, Ll/eyr0;->b(Ljava/nio/ByteBuffer;)D

    .line 152
    .line 153
    .line 154
    move-result-wide v21

    .line 155
    invoke-static {v3}, Ll/eyr0;->a(Ljava/nio/ByteBuffer;)D

    .line 156
    .line 157
    .line 158
    move-result-wide v17

    .line 159
    new-instance v4, Ll/jpx0;

    .line 160
    .line 161
    invoke-direct/range {v4 .. v22}, Ll/jpx0;-><init>(DDDDDDDDD)V

    .line 162
    .line 163
    .line 164
    iput-object v4, v0, Ll/iyr0;->r:Ll/jpx0;

    .line 165
    .line 166
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->getInt()I

    .line 167
    .line 168
    .line 169
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->getInt()I

    .line 170
    .line 171
    .line 172
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->getInt()I

    .line 173
    .line 174
    .line 175
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->getInt()I

    .line 176
    .line 177
    .line 178
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->getInt()I

    .line 179
    .line 180
    .line 181
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->getInt()I

    .line 182
    .line 183
    .line 184
    invoke-static {v3}, Ll/eyr0;->e(Ljava/nio/ByteBuffer;)J

    .line 185
    .line 186
    .line 187
    move-result-wide v1

    .line 188
    iput-wide v1, v0, Ll/iyr0;->s:J

    .line 189
    .line 190
    return-void
.end method

.method public final h()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/iyr0;->o:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/iyr0;->n:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "MovieHeaderBox[creationTime="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/iyr0;->l:Ljava/util/Date;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ";modificationTime="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/iyr0;->m:Ljava/util/Date;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ";timescale="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-wide v1, p0, Ll/iyr0;->n:J

    .line 29
    .line 30
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ";duration="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget-wide v1, p0, Ll/iyr0;->o:J

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ";rate="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-wide v1, p0, Ll/iyr0;->p:D

    .line 49
    .line 50
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ";volume="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget v1, p0, Ll/iyr0;->q:F

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    const-string v1, ";matrix="

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Ll/iyr0;->r:Ll/jpx0;

    .line 69
    .line 70
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v1, ";nextTrackId="

    .line 74
    .line 75
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-wide v1, p0, Ll/iyr0;->s:J

    .line 79
    .line 80
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string p0, "]"

    .line 84
    .line 85
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    return-object p0
.end method
