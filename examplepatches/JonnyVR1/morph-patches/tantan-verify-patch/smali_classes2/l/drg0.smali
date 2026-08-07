.class public Ll/drg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# static fields
.field private static final MASKS:[J

.field private static final MAXIMUM_CACHE_SIZE:I = 0x3f


# instance fields
.field private bitsCached:J

.field private bitsCachedSize:I

.field private final byteOrder:Ljava/nio/ByteOrder;

.field private final in:Ll/ezg0;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    const/16 v0, 0x40

    .line 2
    .line 3
    new-array v0, v0, [J

    .line 4
    .line 5
    sput-object v0, Ll/drg0;->MASKS:[J

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    move v1, v0

    .line 9
    :goto_0
    const/16 v2, 0x3f

    .line 10
    .line 11
    if-gt v1, v2, :cond_0

    .line 12
    .line 13
    sget-object v2, Ll/drg0;->MASKS:[J

    .line 14
    .line 15
    add-int/lit8 v3, v1, -0x1

    .line 16
    .line 17
    aget-wide v3, v2, v3

    .line 18
    .line 19
    shl-long/2addr v3, v0

    .line 20
    const-wide/16 v5, 0x1

    .line 21
    .line 22
    add-long/2addr v3, v5

    .line 23
    aput-wide v3, v2, v1

    .line 24
    .line 25
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ll/drg0;->bitsCached:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput v0, p0, Ll/drg0;->bitsCachedSize:I

    .line 10
    .line 11
    new-instance v0, Ll/ezg0;

    .line 12
    .line 13
    invoke-direct {v0, p1}, Ll/ezg0;-><init>(Ljava/io/InputStream;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/drg0;->in:Ll/ezg0;

    .line 17
    .line 18
    iput-object p2, p0, Ll/drg0;->byteOrder:Ljava/nio/ByteOrder;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public alignWithByteBoundary()V
    .locals 7

    .line 1
    iget v0, p0, Ll/drg0;->bitsCachedSize:I

    .line 2
    .line 3
    rem-int/lit8 v1, v0, 0x8

    .line 4
    .line 5
    if-lez v1, :cond_1

    .line 6
    .line 7
    iget-object v2, p0, Ll/drg0;->byteOrder:Ljava/nio/ByteOrder;

    .line 8
    .line 9
    sget-object v3, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 10
    .line 11
    if-ne v2, v3, :cond_0

    .line 12
    .line 13
    iget-wide v2, p0, Ll/drg0;->bitsCached:J

    .line 14
    .line 15
    sget-object v4, Ll/drg0;->MASKS:[J

    .line 16
    .line 17
    aget-wide v5, v4, v1

    .line 18
    .line 19
    ushr-long/2addr v2, v1

    .line 20
    iput-wide v2, p0, Ll/drg0;->bitsCached:J

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    sget-object v2, Ll/drg0;->MASKS:[J

    .line 24
    .line 25
    aget-wide v3, v2, v1

    .line 26
    .line 27
    :goto_0
    sub-int/2addr v0, v1

    .line 28
    iput v0, p0, Ll/drg0;->bitsCachedSize:I

    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public bitsAvailable()J
    .locals 6

    .line 1
    iget v0, p0, Ll/drg0;->bitsCachedSize:I

    .line 2
    .line 3
    int-to-long v0, v0

    .line 4
    iget-object p0, p0, Ll/drg0;->in:Ll/ezg0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ljava/io/InputStream;->available()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    int-to-long v2, p0

    .line 11
    const-wide/16 v4, 0x8

    .line 12
    .line 13
    mul-long/2addr v2, v4

    .line 14
    add-long/2addr v2, v0

    .line 15
    return-wide v2
.end method

.method public bitsCached()I
    .locals 0

    .line 1
    iget p0, p0, Ll/drg0;->bitsCachedSize:I

    .line 2
    .line 3
    return p0
.end method

.method public clearBitCache()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Ll/drg0;->bitsCached:J

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput v0, p0, Ll/drg0;->bitsCachedSize:I

    .line 7
    .line 8
    return-void
.end method

.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/drg0;->in:Ll/ezg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getBytesRead()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/drg0;->in:Ll/ezg0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ezg0;->getBytesRead()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public readBits(I)J
    .locals 11

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    if-ltz p1, :cond_7

    .line 4
    .line 5
    const/16 v2, 0x3f

    .line 6
    .line 7
    if-gt p1, v2, :cond_7

    .line 8
    .line 9
    :goto_0
    iget v2, p0, Ll/drg0;->bitsCachedSize:I

    .line 10
    .line 11
    if-ge v2, p1, :cond_2

    .line 12
    .line 13
    const/16 v3, 0x39

    .line 14
    .line 15
    if-ge v2, v3, :cond_2

    .line 16
    .line 17
    iget-object v2, p0, Ll/drg0;->in:Ll/ezg0;

    .line 18
    .line 19
    invoke-virtual {v2}, Ll/ezg0;->read()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    int-to-long v2, v2

    .line 24
    cmp-long v4, v2, v0

    .line 25
    .line 26
    if-gez v4, :cond_0

    .line 27
    .line 28
    const-wide/16 p0, -0x1

    .line 29
    .line 30
    return-wide p0

    .line 31
    :cond_0
    iget-object v4, p0, Ll/drg0;->byteOrder:Ljava/nio/ByteOrder;

    .line 32
    .line 33
    sget-object v5, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 34
    .line 35
    iget-wide v6, p0, Ll/drg0;->bitsCached:J

    .line 36
    .line 37
    const/16 v8, 0x8

    .line 38
    .line 39
    if-ne v4, v5, :cond_1

    .line 40
    .line 41
    iget v4, p0, Ll/drg0;->bitsCachedSize:I

    .line 42
    .line 43
    shl-long/2addr v2, v4

    .line 44
    or-long/2addr v2, v6

    .line 45
    iput-wide v2, p0, Ll/drg0;->bitsCached:J

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    shl-long v4, v6, v8

    .line 49
    .line 50
    or-long/2addr v2, v4

    .line 51
    iput-wide v2, p0, Ll/drg0;->bitsCached:J

    .line 52
    .line 53
    :goto_1
    iget v2, p0, Ll/drg0;->bitsCachedSize:I

    .line 54
    .line 55
    add-int/2addr v2, v8

    .line 56
    iput v2, p0, Ll/drg0;->bitsCachedSize:I

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_2
    if-ge v2, p1, :cond_5

    .line 60
    .line 61
    sub-int v2, p1, v2

    .line 62
    .line 63
    rsub-int/lit8 v3, v2, 0x8

    .line 64
    .line 65
    iget-object v4, p0, Ll/drg0;->in:Ll/ezg0;

    .line 66
    .line 67
    invoke-virtual {v4}, Ll/ezg0;->read()I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    int-to-long v4, v4

    .line 72
    cmp-long v0, v4, v0

    .line 73
    .line 74
    if-gez v0, :cond_3

    .line 75
    .line 76
    return-wide v4

    .line 77
    :cond_3
    iget-object v0, p0, Ll/drg0;->byteOrder:Ljava/nio/ByteOrder;

    .line 78
    .line 79
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 80
    .line 81
    if-ne v0, v1, :cond_4

    .line 82
    .line 83
    sget-object v0, Ll/drg0;->MASKS:[J

    .line 84
    .line 85
    aget-wide v6, v0, v2

    .line 86
    .line 87
    and-long/2addr v6, v4

    .line 88
    iget-wide v8, p0, Ll/drg0;->bitsCached:J

    .line 89
    .line 90
    iget v1, p0, Ll/drg0;->bitsCachedSize:I

    .line 91
    .line 92
    shl-long/2addr v6, v1

    .line 93
    or-long/2addr v6, v8

    .line 94
    iput-wide v6, p0, Ll/drg0;->bitsCached:J

    .line 95
    .line 96
    ushr-long v1, v4, v2

    .line 97
    .line 98
    aget-wide v4, v0, v3

    .line 99
    .line 100
    and-long v0, v1, v4

    .line 101
    .line 102
    goto :goto_2

    .line 103
    :cond_4
    iget-wide v0, p0, Ll/drg0;->bitsCached:J

    .line 104
    .line 105
    shl-long/2addr v0, v2

    .line 106
    iput-wide v0, p0, Ll/drg0;->bitsCached:J

    .line 107
    .line 108
    ushr-long v6, v4, v3

    .line 109
    .line 110
    sget-object v8, Ll/drg0;->MASKS:[J

    .line 111
    .line 112
    aget-wide v9, v8, v2

    .line 113
    .line 114
    and-long/2addr v6, v9

    .line 115
    or-long/2addr v0, v6

    .line 116
    iput-wide v0, p0, Ll/drg0;->bitsCached:J

    .line 117
    .line 118
    aget-wide v0, v8, v3

    .line 119
    .line 120
    and-long/2addr v0, v4

    .line 121
    :goto_2
    iget-wide v4, p0, Ll/drg0;->bitsCached:J

    .line 122
    .line 123
    sget-object v2, Ll/drg0;->MASKS:[J

    .line 124
    .line 125
    aget-wide v6, v2, p1

    .line 126
    .line 127
    and-long/2addr v4, v6

    .line 128
    iput-wide v0, p0, Ll/drg0;->bitsCached:J

    .line 129
    .line 130
    iput v3, p0, Ll/drg0;->bitsCachedSize:I

    .line 131
    .line 132
    return-wide v4

    .line 133
    :cond_5
    iget-object v0, p0, Ll/drg0;->byteOrder:Ljava/nio/ByteOrder;

    .line 134
    .line 135
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 136
    .line 137
    iget-wide v3, p0, Ll/drg0;->bitsCached:J

    .line 138
    .line 139
    if-ne v0, v1, :cond_6

    .line 140
    .line 141
    sget-object v0, Ll/drg0;->MASKS:[J

    .line 142
    .line 143
    aget-wide v5, v0, p1

    .line 144
    .line 145
    and-long v0, v3, v5

    .line 146
    .line 147
    ushr-long/2addr v3, p1

    .line 148
    iput-wide v3, p0, Ll/drg0;->bitsCached:J

    .line 149
    .line 150
    goto :goto_3

    .line 151
    :cond_6
    sub-int v0, v2, p1

    .line 152
    .line 153
    shr-long v0, v3, v0

    .line 154
    .line 155
    sget-object v3, Ll/drg0;->MASKS:[J

    .line 156
    .line 157
    aget-wide v4, v3, p1

    .line 158
    .line 159
    and-long/2addr v0, v4

    .line 160
    :goto_3
    sub-int/2addr v2, p1

    .line 161
    iput v2, p0, Ll/drg0;->bitsCachedSize:I

    .line 162
    .line 163
    return-wide v0

    .line 164
    :cond_7
    const-string p0, "count must not be negative or greater than 63"

    .line 165
    .line 166
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    return-wide v0
.end method
