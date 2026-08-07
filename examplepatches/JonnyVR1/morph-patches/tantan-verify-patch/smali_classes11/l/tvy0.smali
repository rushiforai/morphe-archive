.class public final Ll/tvy0;
.super Ll/evx0;
.source "SourceFile"


# instance fields
.field public i:J

.field public j:I

.field public k:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x0

    .line 3
    invoke-direct {p0, v0, v1}, Ll/evx0;-><init>(II)V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x20

    .line 7
    .line 8
    iput v0, p0, Ll/tvy0;->k:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final b()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/evx0;->b()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/tvy0;->j:I

    .line 6
    .line 7
    return-void
.end method

.method public final m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/tvy0;->j:I

    .line 2
    .line 3
    return p0
.end method

.method public final n()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/tvy0;->i:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final o(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/IntRange;
            from = 0x1L
        .end annotation
    .end param

    .line 1
    iput p1, p0, Ll/tvy0;->k:I

    .line 2
    .line 3
    return-void
.end method

.method public final p(Ll/evx0;)Z
    .locals 4

    .line 1
    const/high16 v0, 0x40000000    # 2.0f

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ll/fux0;->d(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    xor-int/2addr v0, v1

    .line 9
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 10
    .line 11
    .line 12
    const/high16 v0, 0x10000000

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ll/fux0;->d(I)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    xor-int/2addr v0, v1

    .line 19
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x4

    .line 23
    invoke-virtual {p1, v0}, Ll/fux0;->d(I)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    xor-int/2addr v0, v1

    .line 28
    invoke-static {v0}, Ll/lev0;->d(Z)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Ll/tvy0;->q()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    iget v0, p0, Ll/tvy0;->j:I

    .line 39
    .line 40
    iget v2, p0, Ll/tvy0;->k:I

    .line 41
    .line 42
    if-lt v0, v2, :cond_1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    iget-object v0, p1, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    iget-object v2, p0, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 50
    .line 51
    if-eqz v2, :cond_2

    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/nio/Buffer;->position()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr v2, v0

    .line 62
    const v0, 0x2ee000

    .line 63
    .line 64
    .line 65
    if-le v2, v0, :cond_2

    .line 66
    .line 67
    :goto_0
    const/4 p0, 0x0

    .line 68
    return p0

    .line 69
    :cond_2
    :goto_1
    iget v0, p0, Ll/tvy0;->j:I

    .line 70
    .line 71
    add-int/lit8 v2, v0, 0x1

    .line 72
    .line 73
    iput v2, p0, Ll/tvy0;->j:I

    .line 74
    .line 75
    if-nez v0, :cond_3

    .line 76
    .line 77
    iget-wide v2, p1, Ll/evx0;->f:J

    .line 78
    .line 79
    iput-wide v2, p0, Ll/evx0;->f:J

    .line 80
    .line 81
    invoke-virtual {p1, v1}, Ll/fux0;->d(I)Z

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    if-eqz v0, :cond_3

    .line 86
    .line 87
    invoke-virtual {p0, v1}, Ll/fux0;->c(I)V

    .line 88
    .line 89
    .line 90
    :cond_3
    iget-object v0, p1, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 91
    .line 92
    if-eqz v0, :cond_4

    .line 93
    .line 94
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 95
    .line 96
    .line 97
    move-result v2

    .line 98
    invoke-virtual {p0, v2}, Ll/evx0;->i(I)V

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 102
    .line 103
    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 104
    .line 105
    .line 106
    :cond_4
    iget-wide v2, p1, Ll/evx0;->f:J

    .line 107
    .line 108
    iput-wide v2, p0, Ll/tvy0;->i:J

    .line 109
    .line 110
    return v1
.end method

.method public final q()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/tvy0;->j:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method
