.class public final Ll/lpp0$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lpp0$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/lpp0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# static fields
.field public static final m:[I

.field public static final n:[I


# instance fields
.field public final a:Ll/bsf;

.field public final b:Ll/qfj0;

.field public final c:Ll/mpp0;

.field public final d:I

.field public final e:[B

.field public final f:Ll/ig60;

.field public final g:I

.field public final h:Lcom/google/android/exoplayer2/k;

.field public i:I

.field public j:J

.field public k:I

.field public l:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    new-array v0, v0, [I

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/lpp0$a;->m:[I

    .line 9
    .line 10
    const/16 v0, 0x59

    .line 11
    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    fill-array-data v0, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/lpp0$a;->n:[I

    .line 18
    .line 19
    return-void

    .line 20
    nop

    .line 21
    :array_0
    .array-data 4
        -0x1
        -0x1
        -0x1
        -0x1
        0x2
        0x4
        0x6
        0x8
        -0x1
        -0x1
        -0x1
        -0x1
        0x2
        0x4
        0x6
        0x8
    .end array-data

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    :array_1
    .array-data 4
        0x7
        0x8
        0x9
        0xa
        0xb
        0xc
        0xd
        0xe
        0x10
        0x11
        0x13
        0x15
        0x17
        0x19
        0x1c
        0x1f
        0x22
        0x25
        0x29
        0x2d
        0x32
        0x37
        0x3c
        0x42
        0x49
        0x50
        0x58
        0x61
        0x6b
        0x76
        0x82
        0x8f
        0x9d
        0xad
        0xbe
        0xd1
        0xe6
        0xfd
        0x117
        0x133
        0x151
        0x173
        0x198
        0x1c1
        0x1ee
        0x220
        0x256
        0x292
        0x2d4
        0x31c
        0x36c
        0x3c3
        0x424
        0x48e
        0x502
        0x583
        0x610
        0x6ab
        0x756
        0x812
        0x8e0
        0x9c3
        0xabd
        0xbd0
        0xcff
        0xe4c
        0xfba
        0x114c
        0x1307
        0x14ee
        0x1706
        0x1954
        0x1bdc
        0x1ea5
        0x21b6
        0x2515
        0x28ca
        0x2cdf
        0x315b
        0x364b
        0x3bb9
        0x41b2
        0x4844
        0x4f7e
        0x5771
        0x602f
        0x69ce
        0x7462
        0x7fff
    .end array-data
.end method

.method public constructor <init>(Ll/bsf;Ll/qfj0;Ll/mpp0;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/exoplayer2/ParserException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/lpp0$a;->a:Ll/bsf;

    .line 5
    .line 6
    iput-object p2, p0, Ll/lpp0$a;->b:Ll/qfj0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/lpp0$a;->c:Ll/mpp0;

    .line 9
    .line 10
    iget p1, p3, Ll/mpp0;->c:I

    .line 11
    .line 12
    div-int/lit8 p1, p1, 0xa

    .line 13
    .line 14
    const/4 p2, 0x1

    .line 15
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    iput p1, p0, Ll/lpp0$a;->g:I

    .line 20
    .line 21
    new-instance v0, Ll/ig60;

    .line 22
    .line 23
    iget-object v1, p3, Ll/mpp0;->g:[B

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ll/ig60;-><init>([B)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ll/ig60;->z()I

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ll/ig60;->z()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    iput v0, p0, Ll/lpp0$a;->d:I

    .line 36
    .line 37
    iget v1, p3, Ll/mpp0;->b:I

    .line 38
    .line 39
    iget v2, p3, Ll/mpp0;->e:I

    .line 40
    .line 41
    mul-int/lit8 v3, v1, 0x4

    .line 42
    .line 43
    sub-int/2addr v2, v3

    .line 44
    mul-int/lit8 v2, v2, 0x8

    .line 45
    .line 46
    iget v3, p3, Ll/mpp0;->f:I

    .line 47
    .line 48
    mul-int/2addr v3, v1

    .line 49
    div-int/2addr v2, v3

    .line 50
    add-int/2addr v2, p2

    .line 51
    if-ne v0, v2, :cond_0

    .line 52
    .line 53
    invoke-static {p1, v0}, Ll/bmk0;->l(II)I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iget v2, p3, Ll/mpp0;->e:I

    .line 58
    .line 59
    mul-int/2addr v2, p2

    .line 60
    new-array v2, v2, [B

    .line 61
    .line 62
    iput-object v2, p0, Ll/lpp0$a;->e:[B

    .line 63
    .line 64
    new-instance v2, Ll/ig60;

    .line 65
    .line 66
    invoke-static {v0, v1}, Ll/lpp0$a;->h(II)I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    mul-int/2addr p2, v3

    .line 71
    invoke-direct {v2, p2}, Ll/ig60;-><init>(I)V

    .line 72
    .line 73
    .line 74
    iput-object v2, p0, Ll/lpp0$a;->f:Ll/ig60;

    .line 75
    .line 76
    iget p2, p3, Ll/mpp0;->c:I

    .line 77
    .line 78
    iget v2, p3, Ll/mpp0;->e:I

    .line 79
    .line 80
    mul-int/2addr p2, v2

    .line 81
    mul-int/lit8 p2, p2, 0x8

    .line 82
    .line 83
    div-int/2addr p2, v0

    .line 84
    new-instance v0, Lcom/google/android/exoplayer2/k$b;

    .line 85
    .line 86
    invoke-direct {v0}, Lcom/google/android/exoplayer2/k$b;-><init>()V

    .line 87
    .line 88
    .line 89
    const-string v2, "audio/raw"

    .line 90
    .line 91
    invoke-virtual {v0, v2}, Lcom/google/android/exoplayer2/k$b;->g0(Ljava/lang/String;)Lcom/google/android/exoplayer2/k$b;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0, p2}, Lcom/google/android/exoplayer2/k$b;->I(I)Lcom/google/android/exoplayer2/k$b;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    invoke-virtual {v0, p2}, Lcom/google/android/exoplayer2/k$b;->b0(I)Lcom/google/android/exoplayer2/k$b;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    invoke-static {p1, v1}, Ll/lpp0$a;->h(II)I

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    invoke-virtual {p2, p1}, Lcom/google/android/exoplayer2/k$b;->Y(I)Lcom/google/android/exoplayer2/k$b;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iget p2, p3, Ll/mpp0;->b:I

    .line 112
    .line 113
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/k$b;->J(I)Lcom/google/android/exoplayer2/k$b;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    iget p2, p3, Ll/mpp0;->c:I

    .line 118
    .line 119
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/k$b;->h0(I)Lcom/google/android/exoplayer2/k$b;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    const/4 p2, 0x2

    .line 124
    invoke-virtual {p1, p2}, Lcom/google/android/exoplayer2/k$b;->a0(I)Lcom/google/android/exoplayer2/k$b;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-virtual {p1}, Lcom/google/android/exoplayer2/k$b;->G()Lcom/google/android/exoplayer2/k;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Ll/lpp0$a;->h:Lcom/google/android/exoplayer2/k;

    .line 133
    .line 134
    return-void

    .line 135
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    const-string p1, "Expected frames per block: "

    .line 138
    .line 139
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    const-string p1, "; got: "

    .line 146
    .line 147
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    const/4 p1, 0x0

    .line 158
    invoke-static {p0, p1}, Lcom/google/android/exoplayer2/ParserException;->createForMalformedContainer(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/exoplayer2/ParserException;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    throw p0
.end method

.method public static h(II)I
    .locals 0

    .line 1
    mul-int/lit8 p0, p0, 0x2

    .line 2
    .line 3
    mul-int/2addr p0, p1

    .line 4
    return p0
.end method


# virtual methods
.method public a(Ll/asf;J)Z
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Ll/lpp0$a;->g:I

    .line 2
    .line 3
    iget v1, p0, Ll/lpp0$a;->k:I

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Ll/lpp0$a;->f(I)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int/2addr v0, v1

    .line 10
    iget v1, p0, Ll/lpp0$a;->d:I

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/bmk0;->l(II)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object v1, p0, Ll/lpp0$a;->c:Ll/mpp0;

    .line 17
    .line 18
    iget v1, v1, Ll/mpp0;->e:I

    .line 19
    .line 20
    mul-int/2addr v0, v1

    .line 21
    const-wide/16 v1, 0x0

    .line 22
    .line 23
    cmp-long v1, p2, v1

    .line 24
    .line 25
    const/4 v2, 0x1

    .line 26
    if-nez v1, :cond_0

    .line 27
    .line 28
    :goto_0
    move v1, v2

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    const/4 v1, 0x0

    .line 31
    :goto_1
    if-nez v1, :cond_2

    .line 32
    .line 33
    iget v3, p0, Ll/lpp0$a;->i:I

    .line 34
    .line 35
    if-ge v3, v0, :cond_2

    .line 36
    .line 37
    sub-int v3, v0, v3

    .line 38
    .line 39
    int-to-long v3, v3

    .line 40
    invoke-static {v3, v4, p2, p3}, Ljava/lang/Math;->min(JJ)J

    .line 41
    .line 42
    .line 43
    move-result-wide v3

    .line 44
    long-to-int v3, v3

    .line 45
    iget-object v4, p0, Ll/lpp0$a;->e:[B

    .line 46
    .line 47
    iget v5, p0, Ll/lpp0$a;->i:I

    .line 48
    .line 49
    invoke-interface {p1, v4, v5, v3}, Ll/asf;->read([BII)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    const/4 v4, -0x1

    .line 54
    if-ne v3, v4, :cond_1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget v4, p0, Ll/lpp0$a;->i:I

    .line 58
    .line 59
    add-int/2addr v4, v3

    .line 60
    iput v4, p0, Ll/lpp0$a;->i:I

    .line 61
    .line 62
    goto :goto_1

    .line 63
    :cond_2
    iget p1, p0, Ll/lpp0$a;->i:I

    .line 64
    .line 65
    iget-object p2, p0, Ll/lpp0$a;->c:Ll/mpp0;

    .line 66
    .line 67
    iget p2, p2, Ll/mpp0;->e:I

    .line 68
    .line 69
    div-int/2addr p1, p2

    .line 70
    if-lez p1, :cond_3

    .line 71
    .line 72
    iget-object p2, p0, Ll/lpp0$a;->e:[B

    .line 73
    .line 74
    iget-object p3, p0, Ll/lpp0$a;->f:Ll/ig60;

    .line 75
    .line 76
    invoke-virtual {p0, p2, p1, p3}, Ll/lpp0$a;->d([BILl/ig60;)V

    .line 77
    .line 78
    .line 79
    iget p2, p0, Ll/lpp0$a;->i:I

    .line 80
    .line 81
    iget-object p3, p0, Ll/lpp0$a;->c:Ll/mpp0;

    .line 82
    .line 83
    iget p3, p3, Ll/mpp0;->e:I

    .line 84
    .line 85
    mul-int/2addr p1, p3

    .line 86
    sub-int/2addr p2, p1

    .line 87
    iput p2, p0, Ll/lpp0$a;->i:I

    .line 88
    .line 89
    iget-object p1, p0, Ll/lpp0$a;->f:Ll/ig60;

    .line 90
    .line 91
    invoke-virtual {p1}, Ll/ig60;->g()I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iget-object p2, p0, Ll/lpp0$a;->b:Ll/qfj0;

    .line 96
    .line 97
    iget-object p3, p0, Ll/lpp0$a;->f:Ll/ig60;

    .line 98
    .line 99
    invoke-interface {p2, p3, p1}, Ll/qfj0;->d(Ll/ig60;I)V

    .line 100
    .line 101
    .line 102
    iget p2, p0, Ll/lpp0$a;->k:I

    .line 103
    .line 104
    add-int/2addr p2, p1

    .line 105
    iput p2, p0, Ll/lpp0$a;->k:I

    .line 106
    .line 107
    invoke-virtual {p0, p2}, Ll/lpp0$a;->f(I)I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    iget p2, p0, Ll/lpp0$a;->g:I

    .line 112
    .line 113
    if-lt p1, p2, :cond_3

    .line 114
    .line 115
    invoke-virtual {p0, p2}, Ll/lpp0$a;->i(I)V

    .line 116
    .line 117
    .line 118
    :cond_3
    if-eqz v1, :cond_4

    .line 119
    .line 120
    iget p1, p0, Ll/lpp0$a;->k:I

    .line 121
    .line 122
    invoke-virtual {p0, p1}, Ll/lpp0$a;->f(I)I

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    if-lez p1, :cond_4

    .line 127
    .line 128
    invoke-virtual {p0, p1}, Ll/lpp0$a;->i(I)V

    .line 129
    .line 130
    .line 131
    :cond_4
    return v1
.end method

.method public b(IJ)V
    .locals 8

    .line 1
    iget-object v0, p0, Ll/lpp0$a;->a:Ll/bsf;

    .line 2
    .line 3
    new-instance v1, Ll/opp0;

    .line 4
    .line 5
    iget-object v2, p0, Ll/lpp0$a;->c:Ll/mpp0;

    .line 6
    .line 7
    iget v3, p0, Ll/lpp0$a;->d:I

    .line 8
    .line 9
    int-to-long v4, p1

    .line 10
    move-wide v6, p2

    .line 11
    invoke-direct/range {v1 .. v7}, Ll/opp0;-><init>(Ll/mpp0;IJJ)V

    .line 12
    .line 13
    .line 14
    invoke-interface {v0, v1}, Ll/bsf;->k(Ll/mke0;)V

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Ll/lpp0$a;->b:Ll/qfj0;

    .line 18
    .line 19
    iget-object p0, p0, Ll/lpp0$a;->h:Lcom/google/android/exoplayer2/k;

    .line 20
    .line 21
    invoke-interface {p1, p0}, Ll/qfj0;->b(Lcom/google/android/exoplayer2/k;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public c(J)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/lpp0$a;->i:I

    .line 3
    .line 4
    iput-wide p1, p0, Ll/lpp0$a;->j:J

    .line 5
    .line 6
    iput v0, p0, Ll/lpp0$a;->k:I

    .line 7
    .line 8
    const-wide/16 p1, 0x0

    .line 9
    .line 10
    iput-wide p1, p0, Ll/lpp0$a;->l:J

    .line 11
    .line 12
    return-void
.end method

.method public final d([BILl/ig60;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    if-ge v1, p2, :cond_1

    .line 4
    .line 5
    move v2, v0

    .line 6
    :goto_1
    iget-object v3, p0, Ll/lpp0$a;->c:Ll/mpp0;

    .line 7
    .line 8
    iget v3, v3, Ll/mpp0;->b:I

    .line 9
    .line 10
    if-ge v2, v3, :cond_0

    .line 11
    .line 12
    invoke-virtual {p3}, Ll/ig60;->e()[B

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-virtual {p0, p1, v1, v2, v3}, Ll/lpp0$a;->e([BII[B)V

    .line 17
    .line 18
    .line 19
    add-int/lit8 v2, v2, 0x1

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iget p1, p0, Ll/lpp0$a;->d:I

    .line 26
    .line 27
    mul-int/2addr p1, p2

    .line 28
    invoke-virtual {p0, p1}, Ll/lpp0$a;->g(I)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p3, v0}, Ll/ig60;->U(I)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p3, p0}, Ll/ig60;->T(I)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public final e([BII[B)V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/lpp0$a;->c:Ll/mpp0;

    .line 2
    .line 3
    iget v1, v0, Ll/mpp0;->e:I

    .line 4
    .line 5
    iget v0, v0, Ll/mpp0;->b:I

    .line 6
    .line 7
    mul-int v2, p2, v1

    .line 8
    .line 9
    mul-int/lit8 v3, p3, 0x4

    .line 10
    .line 11
    add-int/2addr v2, v3

    .line 12
    mul-int/lit8 v3, v0, 0x4

    .line 13
    .line 14
    add-int/2addr v3, v2

    .line 15
    div-int/2addr v1, v0

    .line 16
    add-int/lit8 v1, v1, -0x4

    .line 17
    .line 18
    add-int/lit8 v4, v2, 0x1

    .line 19
    .line 20
    aget-byte v4, p1, v4

    .line 21
    .line 22
    and-int/lit16 v4, v4, 0xff

    .line 23
    .line 24
    shl-int/lit8 v4, v4, 0x8

    .line 25
    .line 26
    aget-byte v5, p1, v2

    .line 27
    .line 28
    and-int/lit16 v5, v5, 0xff

    .line 29
    .line 30
    or-int/2addr v4, v5

    .line 31
    int-to-short v4, v4

    .line 32
    add-int/lit8 v2, v2, 0x2

    .line 33
    .line 34
    aget-byte v2, p1, v2

    .line 35
    .line 36
    and-int/lit16 v2, v2, 0xff

    .line 37
    .line 38
    const/16 v5, 0x58

    .line 39
    .line 40
    invoke-static {v2, v5}, Ljava/lang/Math;->min(II)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    sget-object v5, Ll/lpp0$a;->n:[I

    .line 45
    .line 46
    aget v5, v5, v2

    .line 47
    .line 48
    iget p0, p0, Ll/lpp0$a;->d:I

    .line 49
    .line 50
    mul-int/2addr p2, p0

    .line 51
    mul-int/2addr p2, v0

    .line 52
    add-int/2addr p2, p3

    .line 53
    mul-int/lit8 p2, p2, 0x2

    .line 54
    .line 55
    and-int/lit16 p0, v4, 0xff

    .line 56
    .line 57
    int-to-byte p0, p0

    .line 58
    aput-byte p0, p4, p2

    .line 59
    .line 60
    add-int/lit8 p0, p2, 0x1

    .line 61
    .line 62
    shr-int/lit8 p3, v4, 0x8

    .line 63
    .line 64
    int-to-byte p3, p3

    .line 65
    aput-byte p3, p4, p0

    .line 66
    .line 67
    const/4 p0, 0x0

    .line 68
    move p3, p0

    .line 69
    :goto_0
    mul-int/lit8 v6, v1, 0x2

    .line 70
    .line 71
    if-ge p3, v6, :cond_2

    .line 72
    .line 73
    div-int/lit8 v6, p3, 0x8

    .line 74
    .line 75
    div-int/lit8 v7, p3, 0x2

    .line 76
    .line 77
    rem-int/lit8 v7, v7, 0x4

    .line 78
    .line 79
    mul-int/2addr v6, v0

    .line 80
    mul-int/lit8 v6, v6, 0x4

    .line 81
    .line 82
    add-int/2addr v6, v3

    .line 83
    add-int/2addr v6, v7

    .line 84
    aget-byte v6, p1, v6

    .line 85
    .line 86
    and-int/lit16 v7, v6, 0xff

    .line 87
    .line 88
    rem-int/lit8 v8, p3, 0x2

    .line 89
    .line 90
    if-nez v8, :cond_0

    .line 91
    .line 92
    and-int/lit8 v6, v6, 0xf

    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_0
    shr-int/lit8 v6, v7, 0x4

    .line 96
    .line 97
    :goto_1
    and-int/lit8 v7, v6, 0x7

    .line 98
    .line 99
    mul-int/lit8 v7, v7, 0x2

    .line 100
    .line 101
    add-int/lit8 v7, v7, 0x1

    .line 102
    .line 103
    mul-int/2addr v7, v5

    .line 104
    shr-int/lit8 v5, v7, 0x3

    .line 105
    .line 106
    and-int/lit8 v7, v6, 0x8

    .line 107
    .line 108
    if-eqz v7, :cond_1

    .line 109
    .line 110
    neg-int v5, v5

    .line 111
    :cond_1
    add-int/2addr v4, v5

    .line 112
    const/16 v5, -0x8000

    .line 113
    .line 114
    const/16 v7, 0x7fff

    .line 115
    .line 116
    invoke-static {v4, v5, v7}, Ll/bmk0;->q(III)I

    .line 117
    .line 118
    .line 119
    move-result v4

    .line 120
    mul-int/lit8 v5, v0, 0x2

    .line 121
    .line 122
    add-int/2addr p2, v5

    .line 123
    and-int/lit16 v5, v4, 0xff

    .line 124
    .line 125
    int-to-byte v5, v5

    .line 126
    aput-byte v5, p4, p2

    .line 127
    .line 128
    add-int/lit8 v5, p2, 0x1

    .line 129
    .line 130
    shr-int/lit8 v7, v4, 0x8

    .line 131
    .line 132
    int-to-byte v7, v7

    .line 133
    aput-byte v7, p4, v5

    .line 134
    .line 135
    sget-object v5, Ll/lpp0$a;->m:[I

    .line 136
    .line 137
    aget v5, v5, v6

    .line 138
    .line 139
    add-int/2addr v2, v5

    .line 140
    sget-object v5, Ll/lpp0$a;->n:[I

    .line 141
    .line 142
    array-length v6, v5

    .line 143
    add-int/lit8 v6, v6, -0x1

    .line 144
    .line 145
    invoke-static {v2, p0, v6}, Ll/bmk0;->q(III)I

    .line 146
    .line 147
    .line 148
    move-result v2

    .line 149
    aget v5, v5, v2

    .line 150
    .line 151
    add-int/lit8 p3, p3, 0x1

    .line 152
    .line 153
    goto :goto_0

    .line 154
    :cond_2
    return-void
.end method

.method public final f(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lpp0$a;->c:Ll/mpp0;

    .line 2
    .line 3
    iget p0, p0, Ll/mpp0;->b:I

    .line 4
    .line 5
    mul-int/lit8 p0, p0, 0x2

    .line 6
    .line 7
    div-int/2addr p1, p0

    .line 8
    return p1
.end method

.method public final g(I)I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lpp0$a;->c:Ll/mpp0;

    .line 2
    .line 3
    iget p0, p0, Ll/mpp0;->b:I

    .line 4
    .line 5
    invoke-static {p1, p0}, Ll/lpp0$a;->h(II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final i(I)V
    .locals 11

    .line 1
    iget-wide v0, p0, Ll/lpp0$a;->j:J

    .line 2
    .line 3
    iget-wide v2, p0, Ll/lpp0$a;->l:J

    .line 4
    .line 5
    iget-object v4, p0, Ll/lpp0$a;->c:Ll/mpp0;

    .line 6
    .line 7
    iget v4, v4, Ll/mpp0;->c:I

    .line 8
    .line 9
    int-to-long v6, v4

    .line 10
    const-wide/32 v4, 0xf4240

    .line 11
    .line 12
    .line 13
    invoke-static/range {v2 .. v7}, Ll/bmk0;->W0(JJJ)J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    add-long v5, v0, v2

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ll/lpp0$a;->g(I)I

    .line 20
    .line 21
    .line 22
    move-result v8

    .line 23
    iget v0, p0, Ll/lpp0$a;->k:I

    .line 24
    .line 25
    sub-int v9, v0, v8

    .line 26
    .line 27
    iget-object v4, p0, Ll/lpp0$a;->b:Ll/qfj0;

    .line 28
    .line 29
    const/4 v7, 0x1

    .line 30
    const/4 v10, 0x0

    .line 31
    invoke-interface/range {v4 .. v10}, Ll/qfj0;->a(JIIILl/qfj0$a;)V

    .line 32
    .line 33
    .line 34
    iget-wide v0, p0, Ll/lpp0$a;->l:J

    .line 35
    .line 36
    int-to-long v2, p1

    .line 37
    add-long/2addr v0, v2

    .line 38
    iput-wide v0, p0, Ll/lpp0$a;->l:J

    .line 39
    .line 40
    iget p1, p0, Ll/lpp0$a;->k:I

    .line 41
    .line 42
    sub-int/2addr p1, v8

    .line 43
    iput p1, p0, Ll/lpp0$a;->k:I

    .line 44
    .line 45
    return-void
.end method
