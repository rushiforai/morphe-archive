.class public final Ll/ahr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# static fields
.field public static final n:Ll/ifr0;

.field public static final o:[I

.field public static final p:[I

.field public static final q:[B

.field public static final r:[B

.field public static final s:I


# instance fields
.field public final a:[B

.field public b:Z

.field public c:J

.field public d:I

.field public e:I

.field public f:Z

.field public g:I

.field public h:I

.field public i:J

.field public j:Ll/ser0;

.field public k:Ll/sgr0;

.field public l:Ll/bgr0;

.field public m:Z


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    sget-object v0, Ll/zgr0;->b:Ll/zgr0;

    .line 2
    .line 3
    sput-object v0, Ll/ahr0;->n:Ll/ifr0;

    .line 4
    .line 5
    const/16 v0, 0x10

    .line 6
    .line 7
    new-array v1, v0, [I

    .line 8
    .line 9
    fill-array-data v1, :array_0

    .line 10
    .line 11
    .line 12
    sput-object v1, Ll/ahr0;->o:[I

    .line 13
    .line 14
    new-array v0, v0, [I

    .line 15
    .line 16
    fill-array-data v0, :array_1

    .line 17
    .line 18
    .line 19
    sput-object v0, Ll/ahr0;->p:[I

    .line 20
    .line 21
    sget v1, Ll/mpw0;->a:I

    .line 22
    .line 23
    sget-object v1, Ll/cow0;->c:Ljava/nio/charset/Charset;

    .line 24
    .line 25
    const-string v2, "#!AMR\n"

    .line 26
    .line 27
    invoke-virtual {v2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    sput-object v2, Ll/ahr0;->q:[B

    .line 32
    .line 33
    const-string v2, "#!AMR-WB\n"

    .line 34
    .line 35
    invoke-virtual {v2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sput-object v1, Ll/ahr0;->r:[B

    .line 40
    .line 41
    const/16 v1, 0x8

    .line 42
    .line 43
    aget v0, v0, v1

    .line 44
    .line 45
    sput v0, Ll/ahr0;->s:I

    .line 46
    .line 47
    return-void

    .line 48
    nop

    .line 49
    :array_0
    .array-data 4
        0xd
        0xe
        0x10
        0x12
        0x14
        0x15
        0x1b
        0x20
        0x6
        0x7
        0x6
        0x6
        0x1
        0x1
        0x1
        0x1
    .end array-data

    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    :array_1
    .array-data 4
        0x12
        0x18
        0x21
        0x25
        0x29
        0x2f
        0x33
        0x3b
        0x3d
        0x6
        0x1
        0x1
        0x1
        0x1
        0x1
        0x1
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, v0}, Ll/ahr0;-><init>(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    new-array p1, p1, [B

    .line 6
    .line 7
    iput-object p1, p0, Ll/ahr0;->a:[B

    .line 8
    .line 9
    const/4 p1, -0x1

    .line 10
    iput p1, p0, Ll/ahr0;->g:I

    .line 11
    .line 12
    return-void
.end method

.method public static b(Ll/qer0;[B)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ll/qer0;->zzj()V

    .line 2
    .line 3
    .line 4
    array-length v0, p1

    .line 5
    new-array v1, v0, [B

    .line 6
    .line 7
    check-cast p0, Ll/fer0;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {p0, v1, v2, v0, v2}, Ll/fer0;->c([BIIZ)Z

    .line 11
    .line 12
    .line 13
    invoke-static {v1, p1}, Ljava/util/Arrays;->equals([B[B)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method


# virtual methods
.method public final a(Ll/qer0;)I
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/RequiresNonNull;
        value = {
            "trackOutput"
        }
    .end annotation

    .line 1
    const-string v0, "Illegal AMR "

    .line 2
    .line 3
    const-string v1, "Invalid padding bits for frame header "

    .line 4
    .line 5
    iget v2, p0, Ll/ahr0;->e:I

    .line 6
    .line 7
    const/4 v3, -0x1

    .line 8
    const/4 v4, 0x1

    .line 9
    const/4 v5, 0x0

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    goto :goto_3

    .line 13
    :cond_0
    :try_start_0
    invoke-interface {p1}, Ll/qer0;->zzj()V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Ll/ahr0;->a:[B

    .line 17
    .line 18
    move-object v6, p1

    .line 19
    check-cast v6, Ll/fer0;

    .line 20
    .line 21
    invoke-virtual {v6, v2, v5, v4, v5}, Ll/fer0;->c([BIIZ)Z

    .line 22
    .line 23
    .line 24
    iget-object v2, p0, Ll/ahr0;->a:[B

    .line 25
    .line 26
    aget-byte v2, v2, v5

    .line 27
    .line 28
    and-int/lit16 v6, v2, 0x83

    .line 29
    .line 30
    const/4 v7, 0x0

    .line 31
    if-gtz v6, :cond_a

    .line 32
    .line 33
    shr-int/lit8 v1, v2, 0x3

    .line 34
    .line 35
    iget-boolean v2, p0, Ll/ahr0;->b:Z

    .line 36
    .line 37
    and-int/lit8 v1, v1, 0xf

    .line 38
    .line 39
    if-eqz v2, :cond_1

    .line 40
    .line 41
    const/16 v6, 0xa

    .line 42
    .line 43
    if-lt v1, v6, :cond_2

    .line 44
    .line 45
    const/16 v6, 0xd

    .line 46
    .line 47
    if-le v1, v6, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    if-nez v2, :cond_8

    .line 51
    .line 52
    const/16 v6, 0xc

    .line 53
    .line 54
    if-lt v1, v6, :cond_2

    .line 55
    .line 56
    const/16 v6, 0xe

    .line 57
    .line 58
    if-gt v1, v6, :cond_2

    .line 59
    .line 60
    goto :goto_4

    .line 61
    :cond_2
    :goto_0
    if-eqz v2, :cond_3

    .line 62
    .line 63
    sget-object v0, Ll/ahr0;->p:[I

    .line 64
    .line 65
    aget v0, v0, v1

    .line 66
    .line 67
    :goto_1
    move v2, v0

    .line 68
    goto :goto_2

    .line 69
    :cond_3
    sget-object v0, Ll/ahr0;->o:[I

    .line 70
    .line 71
    aget v0, v0, v1

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :goto_2
    iput v2, p0, Ll/ahr0;->d:I
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    iput v2, p0, Ll/ahr0;->e:I

    .line 77
    .line 78
    iget v0, p0, Ll/ahr0;->g:I

    .line 79
    .line 80
    if-ne v0, v3, :cond_4

    .line 81
    .line 82
    iput v2, p0, Ll/ahr0;->g:I

    .line 83
    .line 84
    move v0, v2

    .line 85
    :cond_4
    if-ne v0, v2, :cond_5

    .line 86
    .line 87
    iget v0, p0, Ll/ahr0;->h:I

    .line 88
    .line 89
    add-int/2addr v0, v4

    .line 90
    iput v0, p0, Ll/ahr0;->h:I

    .line 91
    .line 92
    :cond_5
    :goto_3
    iget-object v0, p0, Ll/ahr0;->k:Ll/sgr0;

    .line 93
    .line 94
    invoke-static {v0, p1, v2, v4}, Ll/fgr0;->a(Ll/sgr0;Ll/nyy0;IZ)I

    .line 95
    .line 96
    .line 97
    move-result p1

    .line 98
    if-ne p1, v3, :cond_6

    .line 99
    .line 100
    return v3

    .line 101
    :cond_6
    iget v0, p0, Ll/ahr0;->e:I

    .line 102
    .line 103
    sub-int/2addr v0, p1

    .line 104
    iput v0, p0, Ll/ahr0;->e:I

    .line 105
    .line 106
    if-lez v0, :cond_7

    .line 107
    .line 108
    return v5

    .line 109
    :cond_7
    iget-object v6, p0, Ll/ahr0;->k:Ll/sgr0;

    .line 110
    .line 111
    iget-wide v7, p0, Ll/ahr0;->c:J

    .line 112
    .line 113
    iget v10, p0, Ll/ahr0;->d:I

    .line 114
    .line 115
    const/4 v11, 0x0

    .line 116
    const/4 v12, 0x0

    .line 117
    const/4 v9, 0x1

    .line 118
    invoke-interface/range {v6 .. v12}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 119
    .line 120
    .line 121
    iget-wide v0, p0, Ll/ahr0;->c:J

    .line 122
    .line 123
    const-wide/16 v2, 0x4e20

    .line 124
    .line 125
    add-long/2addr v0, v2

    .line 126
    iput-wide v0, p0, Ll/ahr0;->c:J

    .line 127
    .line 128
    return v5

    .line 129
    :cond_8
    :goto_4
    :try_start_1
    const-string p0, "WB"

    .line 130
    .line 131
    const-string p1, "NB"

    .line 132
    .line 133
    if-eq v4, v2, :cond_9

    .line 134
    .line 135
    move-object p0, p1

    .line 136
    :cond_9
    new-instance p1, Ljava/lang/StringBuilder;

    .line 137
    .line 138
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    const-string p0, " frame type "

    .line 145
    .line 146
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-static {p0, v7}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    throw p0

    .line 161
    :cond_a
    new-instance p0, Ljava/lang/StringBuilder;

    .line 162
    .line 163
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-static {p0, v7}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 174
    .line 175
    .line 176
    move-result-object p0

    .line 177
    throw p0
    :try_end_1
    .catch Ljava/io/EOFException; {:try_start_1 .. :try_end_1} :catch_0

    .line 178
    :catch_0
    return v3
.end method

.method public final c(JJ)V
    .locals 0

    .line 1
    const-wide/16 p1, 0x0

    .line 2
    .line 3
    iput-wide p1, p0, Ll/ahr0;->c:J

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    iput p3, p0, Ll/ahr0;->d:I

    .line 7
    .line 8
    iput p3, p0, Ll/ahr0;->e:I

    .line 9
    .line 10
    iput-wide p1, p0, Ll/ahr0;->i:J

    .line 11
    .line 12
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Ll/ahr0;->g(Ll/qer0;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public final e(Ll/ser0;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/ahr0;->j:Ll/ser0;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-interface {p1, v0, v1}, Ll/ser0;->i(II)Ll/sgr0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/ahr0;->k:Ll/sgr0;

    .line 10
    .line 11
    invoke-interface {p1}, Ll/ser0;->c()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p2, p0, Ll/ahr0;->k:Ll/sgr0;

    .line 2
    .line 3
    invoke-static {p2}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    sget p2, Ll/mpw0;->a:I

    .line 7
    .line 8
    invoke-interface {p1}, Ll/qer0;->zzf()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    const-wide/16 v2, 0x0

    .line 13
    .line 14
    cmp-long p2, v0, v2

    .line 15
    .line 16
    if-nez p2, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ll/ahr0;->g(Ll/qer0;)Z

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    const-string p0, "Could not find AMR header."

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-static {p0, p1}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    throw p0

    .line 33
    :cond_1
    :goto_0
    iget-boolean p2, p0, Ll/ahr0;->m:Z

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    if-nez p2, :cond_4

    .line 37
    .line 38
    iput-boolean v0, p0, Ll/ahr0;->m:Z

    .line 39
    .line 40
    iget-boolean p2, p0, Ll/ahr0;->b:Z

    .line 41
    .line 42
    if-eq v0, p2, :cond_2

    .line 43
    .line 44
    const-string v1, "audio/3gpp"

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    const-string v1, "audio/amr-wb"

    .line 48
    .line 49
    :goto_1
    if-eq v0, p2, :cond_3

    .line 50
    .line 51
    const/16 p2, 0x1f40

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_3
    const/16 p2, 0x3e80

    .line 55
    .line 56
    :goto_2
    iget-object v4, p0, Ll/ahr0;->k:Ll/sgr0;

    .line 57
    .line 58
    new-instance v5, Ll/znr0;

    .line 59
    .line 60
    invoke-direct {v5}, Ll/znr0;-><init>()V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v5, v1}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 64
    .line 65
    .line 66
    sget v1, Ll/ahr0;->s:I

    .line 67
    .line 68
    invoke-virtual {v5, v1}, Ll/znr0;->o(I)Ll/znr0;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v5, v0}, Ll/znr0;->k0(I)Ll/znr0;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v5, p2}, Ll/znr0;->x(I)Ll/znr0;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v5}, Ll/znr0;->D()Ll/sqr0;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    invoke-interface {v4, p2}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 82
    .line 83
    .line 84
    :cond_4
    invoke-virtual {p0, p1}, Ll/ahr0;->a(Ll/qer0;)I

    .line 85
    .line 86
    .line 87
    move-result p1

    .line 88
    iget-boolean p2, p0, Ll/ahr0;->f:Z

    .line 89
    .line 90
    if-eqz p2, :cond_5

    .line 91
    .line 92
    return p1

    .line 93
    :cond_5
    new-instance p2, Ll/agr0;

    .line 94
    .line 95
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    invoke-direct {p2, v4, v5, v2, v3}, Ll/agr0;-><init>(JJ)V

    .line 101
    .line 102
    .line 103
    iput-object p2, p0, Ll/ahr0;->l:Ll/bgr0;

    .line 104
    .line 105
    iget-object v1, p0, Ll/ahr0;->j:Ll/ser0;

    .line 106
    .line 107
    invoke-interface {v1, p2}, Ll/ser0;->j(Ll/bgr0;)V

    .line 108
    .line 109
    .line 110
    iput-boolean v0, p0, Ll/ahr0;->f:Z

    .line 111
    .line 112
    return p1
.end method

.method public final g(Ll/qer0;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/ahr0;->q:[B

    .line 2
    .line 3
    invoke-static {p1, v0}, Ll/ahr0;->b(Ll/qer0;[B)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    const/4 v3, 0x0

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iput-boolean v3, p0, Ll/ahr0;->b:Z

    .line 12
    .line 13
    array-length p0, v0

    .line 14
    check-cast p1, Ll/fer0;

    .line 15
    .line 16
    invoke-virtual {p1, p0, v3}, Ll/fer0;->k(IZ)Z

    .line 17
    .line 18
    .line 19
    return v2

    .line 20
    :cond_0
    sget-object v0, Ll/ahr0;->r:[B

    .line 21
    .line 22
    invoke-static {p1, v0}, Ll/ahr0;->b(Ll/qer0;[B)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_1

    .line 27
    .line 28
    iput-boolean v2, p0, Ll/ahr0;->b:Z

    .line 29
    .line 30
    array-length p0, v0

    .line 31
    check-cast p1, Ll/fer0;

    .line 32
    .line 33
    invoke-virtual {p1, p0, v3}, Ll/fer0;->k(IZ)Z

    .line 34
    .line 35
    .line 36
    return v2

    .line 37
    :cond_1
    return v3
.end method
