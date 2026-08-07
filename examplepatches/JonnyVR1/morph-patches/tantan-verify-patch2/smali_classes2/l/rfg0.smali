.class public final Ll/rfg0;
.super Ll/mng0;
.source "SourceFile"


# instance fields
.field public final a:J

.field public b:J

.field public final synthetic c:Ll/kgg0;


# direct methods
.method public constructor <init>(Ll/kgg0;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/rfg0;->c:Ll/kgg0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/mng0;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-wide p2, p0, Ll/rfg0;->a:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()I
    .locals 6

    .line 1
    iget-wide v0, p0, Ll/rfg0;->a:J

    .line 2
    .line 3
    iget-wide v2, p0, Ll/rfg0;->b:J

    .line 4
    .line 5
    sub-long/2addr v0, v2

    .line 6
    iget-object p0, p0, Ll/rfg0;->c:Ll/kgg0;

    .line 7
    .line 8
    iget-object p0, p0, Ll/kgg0;->c:Ll/drg0;

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/drg0;->bitsAvailable()J

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    const-wide/16 v4, 0x8

    .line 15
    .line 16
    div-long/2addr v2, v4

    .line 17
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    long-to-int p0, v0

    .line 22
    return p0
.end method

.method public final b([BII)I
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p3, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    iget-wide v1, p0, Ll/rfg0;->a:J

    .line 6
    .line 7
    iget-wide v3, p0, Ll/rfg0;->b:J

    .line 8
    .line 9
    sub-long/2addr v1, v3

    .line 10
    int-to-long v3, p3

    .line 11
    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    long-to-int p3, v1

    .line 16
    :goto_0
    if-ge v0, p3, :cond_6

    .line 17
    .line 18
    iget-object v1, p0, Ll/rfg0;->c:Ll/kgg0;

    .line 19
    .line 20
    iget-object v1, v1, Ll/kgg0;->c:Ll/drg0;

    .line 21
    .line 22
    invoke-virtual {v1}, Ll/drg0;->bitsCached()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    iget-object v2, p0, Ll/rfg0;->c:Ll/kgg0;

    .line 27
    .line 28
    const v3, 0xffff

    .line 29
    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    if-lez v1, :cond_2

    .line 33
    .line 34
    iget-object v1, v2, Ll/kgg0;->c:Ll/drg0;

    .line 35
    .line 36
    const/16 v2, 0x8

    .line 37
    .line 38
    invoke-static {v1, v2}, Ll/kgg0;->d(Ll/drg0;I)J

    .line 39
    .line 40
    .line 41
    move-result-wide v1

    .line 42
    long-to-int v1, v1

    .line 43
    int-to-byte v1, v1

    .line 44
    add-int v2, p2, v0

    .line 45
    .line 46
    iget-object v5, p0, Ll/rfg0;->c:Ll/kgg0;

    .line 47
    .line 48
    iget-object v5, v5, Ll/kgg0;->e:Ll/ptg0;

    .line 49
    .line 50
    iget-object v6, v5, Ll/ptg0;->a:[B

    .line 51
    .line 52
    iget v7, v5, Ll/ptg0;->b:I

    .line 53
    .line 54
    aput-byte v1, v6, v7

    .line 55
    .line 56
    add-int/lit8 v6, v7, 0x1

    .line 57
    .line 58
    and-int/2addr v3, v6

    .line 59
    iget-boolean v6, v5, Ll/ptg0;->c:Z

    .line 60
    .line 61
    if-nez v6, :cond_1

    .line 62
    .line 63
    if-ge v3, v7, :cond_1

    .line 64
    .line 65
    iput-boolean v4, v5, Ll/ptg0;->c:Z

    .line 66
    .line 67
    :cond_1
    iput v3, v5, Ll/ptg0;->b:I

    .line 68
    .line 69
    aput-byte v1, p1, v2

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    iget-object v1, v2, Ll/kgg0;->d:Ljava/io/InputStream;

    .line 73
    .line 74
    add-int v2, p2, v0

    .line 75
    .line 76
    sub-int v5, p3, v0

    .line 77
    .line 78
    invoke-virtual {v1, p1, v2, v5}, Ljava/io/InputStream;->read([BII)I

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    const/4 v5, -0x1

    .line 83
    if-eq v1, v5, :cond_5

    .line 84
    .line 85
    iget-object v5, p0, Ll/rfg0;->c:Ll/kgg0;

    .line 86
    .line 87
    iget-object v5, v5, Ll/kgg0;->e:Ll/ptg0;

    .line 88
    .line 89
    move v6, v2

    .line 90
    :goto_1
    add-int v7, v2, v1

    .line 91
    .line 92
    if-ge v6, v7, :cond_4

    .line 93
    .line 94
    aget-byte v7, p1, v6

    .line 95
    .line 96
    iget-object v8, v5, Ll/ptg0;->a:[B

    .line 97
    .line 98
    iget v9, v5, Ll/ptg0;->b:I

    .line 99
    .line 100
    aput-byte v7, v8, v9

    .line 101
    .line 102
    add-int/lit8 v7, v9, 0x1

    .line 103
    .line 104
    and-int/2addr v7, v3

    .line 105
    iget-boolean v8, v5, Ll/ptg0;->c:Z

    .line 106
    .line 107
    if-nez v8, :cond_3

    .line 108
    .line 109
    if-ge v7, v9, :cond_3

    .line 110
    .line 111
    iput-boolean v4, v5, Ll/ptg0;->c:Z

    .line 112
    .line 113
    :cond_3
    iput v7, v5, Ll/ptg0;->b:I

    .line 114
    .line 115
    add-int/lit8 v6, v6, 0x1

    .line 116
    .line 117
    goto :goto_1

    .line 118
    :cond_4
    move v4, v1

    .line 119
    :goto_2
    iget-wide v1, p0, Ll/rfg0;->b:J

    .line 120
    .line 121
    int-to-long v5, v4

    .line 122
    add-long/2addr v1, v5

    .line 123
    iput-wide v1, p0, Ll/rfg0;->b:J

    .line 124
    .line 125
    add-int/2addr v0, v4

    .line 126
    goto :goto_0

    .line 127
    :cond_5
    new-instance p0, Ljava/io/EOFException;

    .line 128
    .line 129
    const-string p1, "Truncated Deflate64 Stream"

    .line 130
    .line 131
    invoke-direct {p0, p1}, Ljava/io/EOFException;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    throw p0

    .line 135
    :cond_6
    return p3
.end method

.method public final c()I
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/rfg0;->b:J

    .line 2
    .line 3
    iget-wide v2, p0, Ll/rfg0;->a:J

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-gez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x2

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public final d()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/rfg0;->b:J

    .line 2
    .line 3
    iget-wide v2, p0, Ll/rfg0;->a:J

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-gez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method
