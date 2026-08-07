.class public final Ll/z5f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/xwd0;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Lcom/google/android/exoplayer2/k;

.field public final b:Ll/d5f;

.field public c:[J

.field public d:Z

.field public e:Ll/a6f;

.field public f:Z

.field public g:I

.field public h:J


# direct methods
.method public constructor <init>(Ll/a6f;Lcom/google/android/exoplayer2/k;Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/z5f;->a:Lcom/google/android/exoplayer2/k;

    .line 5
    .line 6
    iput-object p1, p0, Ll/z5f;->e:Ll/a6f;

    .line 7
    .line 8
    new-instance p2, Ll/d5f;

    .line 9
    .line 10
    invoke-direct {p2}, Ll/d5f;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Ll/z5f;->b:Ll/d5f;

    .line 14
    .line 15
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 16
    .line 17
    .line 18
    .line 19
    .line 20
    iput-wide v0, p0, Ll/z5f;->h:J

    .line 21
    .line 22
    iget-object p2, p1, Ll/a6f;->b:[J

    .line 23
    .line 24
    iput-object p2, p0, Ll/z5f;->c:[J

    .line 25
    .line 26
    invoke-virtual {p0, p1, p3}, Ll/z5f;->e(Ll/a6f;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method


# virtual methods
.method public a()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/z5f;->e:Ll/a6f;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/a6f;->a()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public d(J)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/z5f;->c:[J

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    invoke-static {v0, p1, p2, v1, v2}, Ll/bmk0;->e([JJZZ)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Ll/z5f;->g:I

    .line 10
    .line 11
    iget-boolean v1, p0, Ll/z5f;->d:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/z5f;->c:[J

    .line 16
    .line 17
    array-length v1, v1

    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-wide p1, -0x7fffffffffffffffL    # -4.9E-324

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    :goto_0
    iput-wide p1, p0, Ll/z5f;->h:J

    .line 27
    .line 28
    return-void
.end method

.method public e(Ll/a6f;Z)V
    .locals 8

    .line 1
    iget v0, p0, Ll/z5f;->g:I

    .line 2
    .line 3
    const-wide v1, -0x7fffffffffffffffL    # -4.9E-324

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    move-wide v4, v1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object v3, p0, Ll/z5f;->c:[J

    .line 13
    .line 14
    add-int/lit8 v0, v0, -0x1

    .line 15
    .line 16
    aget-wide v4, v3, v0

    .line 17
    .line 18
    :goto_0
    iput-boolean p2, p0, Ll/z5f;->d:Z

    .line 19
    .line 20
    iput-object p1, p0, Ll/z5f;->e:Ll/a6f;

    .line 21
    .line 22
    iget-object p1, p1, Ll/a6f;->b:[J

    .line 23
    .line 24
    iput-object p1, p0, Ll/z5f;->c:[J

    .line 25
    .line 26
    iget-wide v6, p0, Ll/z5f;->h:J

    .line 27
    .line 28
    cmp-long p2, v6, v1

    .line 29
    .line 30
    if-eqz p2, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, v6, v7}, Ll/z5f;->d(J)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    cmp-long p2, v4, v1

    .line 37
    .line 38
    if-eqz p2, :cond_2

    .line 39
    .line 40
    const/4 p2, 0x0

    .line 41
    invoke-static {p1, v4, v5, p2, p2}, Ll/bmk0;->e([JJZZ)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    iput p1, p0, Ll/z5f;->g:I

    .line 46
    .line 47
    :cond_2
    return-void
.end method

.method public k(J)I
    .locals 4

    .line 1
    iget v0, p0, Ll/z5f;->g:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/z5f;->c:[J

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    invoke-static {v1, p1, p2, v2, v3}, Ll/bmk0;->e([JJZZ)I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    invoke-static {v0, p1}, Ljava/lang/Math;->max(II)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget p2, p0, Ll/z5f;->g:I

    .line 16
    .line 17
    sub-int p2, p1, p2

    .line 18
    .line 19
    iput p1, p0, Ll/z5f;->g:I

    .line 20
    .line 21
    return p2
.end method

.method public l(Ll/p1j;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;I)I
    .locals 6

    .line 1
    iget v0, p0, Ll/z5f;->g:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/z5f;->c:[J

    .line 4
    .line 5
    array-length v1, v1

    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    move v1, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    :goto_0
    const/4 v3, -0x4

    .line 13
    const/4 v4, 0x4

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    iget-boolean v5, p0, Ll/z5f;->d:Z

    .line 17
    .line 18
    if-nez v5, :cond_1

    .line 19
    .line 20
    invoke-virtual {p2, v4}, Ll/ah3;->t(I)V

    .line 21
    .line 22
    .line 23
    return v3

    .line 24
    :cond_1
    and-int/lit8 v5, p3, 0x2

    .line 25
    .line 26
    if-nez v5, :cond_6

    .line 27
    .line 28
    iget-boolean v5, p0, Ll/z5f;->f:Z

    .line 29
    .line 30
    if-nez v5, :cond_2

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    if-eqz v1, :cond_3

    .line 34
    .line 35
    const/4 p0, -0x3

    .line 36
    return p0

    .line 37
    :cond_3
    and-int/lit8 p1, p3, 0x1

    .line 38
    .line 39
    if-nez p1, :cond_4

    .line 40
    .line 41
    add-int/lit8 p1, v0, 0x1

    .line 42
    .line 43
    iput p1, p0, Ll/z5f;->g:I

    .line 44
    .line 45
    :cond_4
    and-int/lit8 p1, p3, 0x4

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iget-object p1, p0, Ll/z5f;->b:Ll/d5f;

    .line 50
    .line 51
    iget-object p3, p0, Ll/z5f;->e:Ll/a6f;

    .line 52
    .line 53
    iget-object p3, p3, Ll/a6f;->a:[Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;

    .line 54
    .line 55
    aget-object p3, p3, v0

    .line 56
    .line 57
    invoke-virtual {p1, p3}, Ll/d5f;->a(Lcom/google/android/exoplayer2/metadata/emsg/EventMessage;)[B

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    array-length p3, p1

    .line 62
    invoke-virtual {p2, p3}, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->v(I)V

    .line 63
    .line 64
    .line 65
    iget-object p3, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->c:Ljava/nio/ByteBuffer;

    .line 66
    .line 67
    invoke-virtual {p3, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 68
    .line 69
    .line 70
    :cond_5
    iget-object p0, p0, Ll/z5f;->c:[J

    .line 71
    .line 72
    aget-wide v0, p0, v0

    .line 73
    .line 74
    iput-wide v0, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->e:J

    .line 75
    .line 76
    invoke-virtual {p2, v2}, Ll/ah3;->t(I)V

    .line 77
    .line 78
    .line 79
    return v3

    .line 80
    :cond_6
    :goto_1
    iget-object p2, p0, Ll/z5f;->a:Lcom/google/android/exoplayer2/k;

    .line 81
    .line 82
    iput-object p2, p1, Ll/p1j;->b:Lcom/google/android/exoplayer2/k;

    .line 83
    .line 84
    iput-boolean v2, p0, Ll/z5f;->f:Z

    .line 85
    .line 86
    const/4 p0, -0x5

    .line 87
    return p0
.end method
