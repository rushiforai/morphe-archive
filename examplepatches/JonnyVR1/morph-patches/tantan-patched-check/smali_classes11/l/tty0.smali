.class public final Ll/tty0;
.super Ll/fuu0;
.source "SourceFile"


# instance fields
.field public i:I

.field public j:I

.field public k:Z

.field public l:I

.field public m:[B

.field public n:I

.field public o:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/fuu0;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/mpw0;->f:[B

    .line 5
    .line 6
    iput-object v0, p0, Ll/tty0;->m:[B

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ljava/nio/ByteBuffer;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    sub-int v2, v1, v0

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget v3, p0, Ll/tty0;->l:I

    .line 15
    .line 16
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    iget-wide v4, p0, Ll/tty0;->o:J

    .line 21
    .line 22
    iget-object v6, p0, Ll/fuu0;->b:Ll/mqu0;

    .line 23
    .line 24
    iget v6, v6, Ll/mqu0;->d:I

    .line 25
    .line 26
    div-int v6, v3, v6

    .line 27
    .line 28
    int-to-long v6, v6

    .line 29
    add-long/2addr v4, v6

    .line 30
    iput-wide v4, p0, Ll/tty0;->o:J

    .line 31
    .line 32
    iget v4, p0, Ll/tty0;->l:I

    .line 33
    .line 34
    sub-int/2addr v4, v3

    .line 35
    iput v4, p0, Ll/tty0;->l:I

    .line 36
    .line 37
    add-int/2addr v0, v3

    .line 38
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 39
    .line 40
    .line 41
    iget v0, p0, Ll/tty0;->l:I

    .line 42
    .line 43
    if-gtz v0, :cond_1

    .line 44
    .line 45
    sub-int/2addr v2, v3

    .line 46
    iget v0, p0, Ll/tty0;->n:I

    .line 47
    .line 48
    add-int/2addr v0, v2

    .line 49
    iget-object v3, p0, Ll/tty0;->m:[B

    .line 50
    .line 51
    array-length v3, v3

    .line 52
    sub-int/2addr v0, v3

    .line 53
    invoke-virtual {p0, v0}, Ll/fuu0;->d(I)Ljava/nio/ByteBuffer;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    iget v4, p0, Ll/tty0;->n:I

    .line 58
    .line 59
    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    .line 60
    .line 61
    .line 62
    move-result v4

    .line 63
    const/4 v5, 0x0

    .line 64
    invoke-static {v5, v4}, Ljava/lang/Math;->max(II)I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    iget-object v6, p0, Ll/tty0;->m:[B

    .line 69
    .line 70
    invoke-virtual {v3, v6, v5, v4}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 71
    .line 72
    .line 73
    sub-int/2addr v0, v4

    .line 74
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    invoke-static {v5, v0}, Ljava/lang/Math;->max(II)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 83
    .line 84
    .line 85
    move-result v6

    .line 86
    add-int/2addr v6, v0

    .line 87
    invoke-virtual {p1, v6}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 88
    .line 89
    .line 90
    invoke-virtual {v3, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 94
    .line 95
    .line 96
    sub-int/2addr v2, v0

    .line 97
    iget v0, p0, Ll/tty0;->n:I

    .line 98
    .line 99
    sub-int/2addr v0, v4

    .line 100
    iput v0, p0, Ll/tty0;->n:I

    .line 101
    .line 102
    iget-object v1, p0, Ll/tty0;->m:[B

    .line 103
    .line 104
    invoke-static {v1, v4, v1, v5, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 105
    .line 106
    .line 107
    iget-object v0, p0, Ll/tty0;->m:[B

    .line 108
    .line 109
    iget v1, p0, Ll/tty0;->n:I

    .line 110
    .line 111
    invoke-virtual {p1, v0, v1, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 112
    .line 113
    .line 114
    iget p1, p0, Ll/tty0;->n:I

    .line 115
    .line 116
    add-int/2addr p1, v2

    .line 117
    iput p1, p0, Ll/tty0;->n:I

    .line 118
    .line 119
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 120
    .line 121
    .line 122
    :cond_1
    :goto_0
    return-void
.end method

.method public final c(Ll/mqu0;)Ll/mqu0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzds;
        }
    .end annotation

    .line 1
    iget v0, p1, Ll/mqu0;->c:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_2

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/tty0;->k:Z

    .line 8
    .line 9
    iget v0, p0, Ll/tty0;->i:I

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget p0, p0, Ll/tty0;->j:I

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    sget-object p0, Ll/mqu0;->e:Ll/mqu0;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    :goto_0
    return-object p1

    .line 22
    :cond_2
    new-instance p0, Lcom/google/android/gms/internal/ads/zzds;

    .line 23
    .line 24
    const-string v0, "Unhandled input format:"

    .line 25
    .line 26
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/internal/ads/zzds;-><init>(Ljava/lang/String;Ll/mqu0;)V

    .line 27
    .line 28
    .line 29
    throw p0
.end method

.method public final e()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/tty0;->k:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    iput-boolean v1, p0, Ll/tty0;->k:Z

    .line 7
    .line 8
    iget v0, p0, Ll/tty0;->j:I

    .line 9
    .line 10
    iget-object v2, p0, Ll/fuu0;->b:Ll/mqu0;

    .line 11
    .line 12
    iget v2, v2, Ll/mqu0;->d:I

    .line 13
    .line 14
    mul-int/2addr v0, v2

    .line 15
    new-array v0, v0, [B

    .line 16
    .line 17
    iput-object v0, p0, Ll/tty0;->m:[B

    .line 18
    .line 19
    iget v0, p0, Ll/tty0;->i:I

    .line 20
    .line 21
    mul-int/2addr v0, v2

    .line 22
    iput v0, p0, Ll/tty0;->l:I

    .line 23
    .line 24
    :cond_0
    iput v1, p0, Ll/tty0;->n:I

    .line 25
    .line 26
    return-void
.end method

.method public final f()V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/tty0;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Ll/tty0;->n:I

    .line 6
    .line 7
    if-lez v0, :cond_0

    .line 8
    .line 9
    iget-wide v1, p0, Ll/tty0;->o:J

    .line 10
    .line 11
    iget-object v3, p0, Ll/fuu0;->b:Ll/mqu0;

    .line 12
    .line 13
    iget v3, v3, Ll/mqu0;->d:I

    .line 14
    .line 15
    div-int/2addr v0, v3

    .line 16
    int-to-long v3, v0

    .line 17
    add-long/2addr v1, v3

    .line 18
    iput-wide v1, p0, Ll/tty0;->o:J

    .line 19
    .line 20
    :cond_0
    const/4 v0, 0x0

    .line 21
    iput v0, p0, Ll/tty0;->n:I

    .line 22
    .line 23
    :cond_1
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    sget-object v0, Ll/mpw0;->f:[B

    .line 2
    .line 3
    iput-object v0, p0, Ll/tty0;->m:[B

    .line 4
    .line 5
    return-void
.end method

.method public final i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tty0;->o:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final j()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/tty0;->o:J

    .line 4
    .line 5
    return-void
.end method

.method public final k(II)V
    .locals 0

    .line 1
    iput p1, p0, Ll/tty0;->i:I

    .line 2
    .line 3
    iput p2, p0, Ll/tty0;->j:I

    .line 4
    .line 5
    return-void
.end method

.method public final zzb()Ljava/nio/ByteBuffer;
    .locals 4

    .line 1
    invoke-super {p0}, Ll/fuu0;->zzh()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget v0, p0, Ll/tty0;->n:I

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ll/fuu0;->d(I)Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Ll/tty0;->m:[B

    .line 16
    .line 17
    iget v2, p0, Ll/tty0;->n:I

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {v0, v1, v3, v2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 25
    .line 26
    .line 27
    iput v3, p0, Ll/tty0;->n:I

    .line 28
    .line 29
    :cond_0
    invoke-super {p0}, Ll/fuu0;->zzb()Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public final zzh()Z
    .locals 1

    .line 1
    invoke-super {p0}, Ll/fuu0;->zzh()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Ll/tty0;->n:I

    .line 8
    .line 9
    if-nez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method
