.class public final Ll/xr3;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public a:J

.field public b:J

.field public c:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(J)J
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/xr3;->a:J

    .line 2
    .line 3
    iget-wide v2, p0, Ll/xr3;->b:J

    .line 4
    .line 5
    const-wide/16 v4, 0x211

    .line 6
    .line 7
    sub-long/2addr v2, v4

    .line 8
    const-wide/32 v4, 0xf4240

    .line 9
    .line 10
    .line 11
    mul-long/2addr v2, v4

    .line 12
    div-long/2addr v2, p1

    .line 13
    const-wide/16 p0, 0x0

    .line 14
    .line 15
    invoke-static {p0, p1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    add-long/2addr v0, p0

    .line 20
    return-wide v0
.end method

.method public b(Lcom/google/android/exoplayer2/k;)J
    .locals 2

    .line 1
    iget p1, p1, Lcom/google/android/exoplayer2/k;->z:I

    .line 2
    .line 3
    int-to-long v0, p1

    .line 4
    invoke-virtual {p0, v0, v1}, Ll/xr3;->a(J)J

    .line 5
    .line 6
    .line 7
    move-result-wide p0

    .line 8
    return-wide p0
.end method

.method public c()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/xr3;->a:J

    .line 4
    .line 5
    iput-wide v0, p0, Ll/xr3;->b:J

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/xr3;->c:Z

    .line 9
    .line 10
    return-void
.end method

.method public d(Lcom/google/android/exoplayer2/k;Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;)J
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/xr3;->b:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-wide v0, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->e:J

    .line 10
    .line 11
    iput-wide v0, p0, Ll/xr3;->a:J

    .line 12
    .line 13
    :cond_0
    iget-boolean v0, p0, Ll/xr3;->c:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-wide p0, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->e:J

    .line 18
    .line 19
    return-wide p0

    .line 20
    :cond_1
    iget-object v0, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->c:Ljava/nio/ByteBuffer;

    .line 21
    .line 22
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    const/4 v1, 0x0

    .line 29
    move v4, v1

    .line 30
    :goto_0
    const/4 v5, 0x4

    .line 31
    if-ge v1, v5, :cond_2

    .line 32
    .line 33
    shl-int/lit8 v4, v4, 0x8

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    and-int/lit16 v5, v5, 0xff

    .line 40
    .line 41
    or-int/2addr v4, v5

    .line 42
    add-int/lit8 v1, v1, 0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    invoke-static {v4}, Ll/i710;->m(I)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    const/4 v1, -0x1

    .line 50
    if-ne v0, v1, :cond_3

    .line 51
    .line 52
    const/4 p1, 0x1

    .line 53
    iput-boolean p1, p0, Ll/xr3;->c:Z

    .line 54
    .line 55
    iput-wide v2, p0, Ll/xr3;->b:J

    .line 56
    .line 57
    iget-wide v0, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->e:J

    .line 58
    .line 59
    iput-wide v0, p0, Ll/xr3;->a:J

    .line 60
    .line 61
    const-string p0, "C2Mp3TimestampTracker"

    .line 62
    .line 63
    const-string p1, "MPEG audio header is invalid."

    .line 64
    .line 65
    invoke-static {p0, p1}, Ll/kyv;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    iget-wide p0, p2, Lcom/google/android/exoplayer2/decoder/DecoderInputBuffer;->e:J

    .line 69
    .line 70
    return-wide p0

    .line 71
    :cond_3
    iget p1, p1, Lcom/google/android/exoplayer2/k;->z:I

    .line 72
    .line 73
    int-to-long p1, p1

    .line 74
    invoke-virtual {p0, p1, p2}, Ll/xr3;->a(J)J

    .line 75
    .line 76
    .line 77
    move-result-wide p1

    .line 78
    iget-wide v1, p0, Ll/xr3;->b:J

    .line 79
    .line 80
    int-to-long v3, v0

    .line 81
    add-long/2addr v1, v3

    .line 82
    iput-wide v1, p0, Ll/xr3;->b:J

    .line 83
    .line 84
    return-wide p1
.end method
