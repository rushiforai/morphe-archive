.class Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "HashTable"
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field static final MASK:I = 0xffff


# instance fields
.field private final base:I

.field private final chainTable:[S

.field private final hashTable:[I

.field nextToUpdate:I

.field final synthetic this$0:Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->this$0:Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->base:I

    .line 7
    .line 8
    iput p2, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->nextToUpdate:I

    .line 9
    .line 10
    const p1, 0x8000

    .line 11
    .line 12
    .line 13
    new-array p1, p1, [I

    .line 14
    .line 15
    iput-object p1, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->hashTable:[I

    .line 16
    .line 17
    const/4 p2, -0x1

    .line 18
    invoke-static {p1, p2}, Ljava/util/Arrays;->fill([II)V

    .line 19
    .line 20
    .line 21
    const/high16 p1, 0x10000

    .line 22
    .line 23
    new-array p1, p1, [S

    .line 24
    .line 25
    iput-object p1, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->chainTable:[S

    .line 26
    .line 27
    return-void
.end method

.method private addHash(II)V
    .locals 4

    .line 1
    invoke-static {p1}, Lnet/jpountz/lz4/LZ4Utils;->hashHC(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->hashTable:[I

    .line 6
    .line 7
    aget v1, v0, p1

    .line 8
    .line 9
    sub-int v1, p2, v1

    .line 10
    .line 11
    const/high16 v2, 0x10000

    .line 12
    .line 13
    const v3, 0xffff

    .line 14
    .line 15
    .line 16
    if-lt v1, v2, :cond_0

    .line 17
    .line 18
    move v1, v3

    .line 19
    :cond_0
    iget-object p0, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->chainTable:[S

    .line 20
    .line 21
    and-int v2, p2, v3

    .line 22
    .line 23
    int-to-short v1, v1

    .line 24
    aput-short v1, p0, v2

    .line 25
    .line 26
    aput p2, v0, p1

    .line 27
    .line 28
    return-void
.end method

.method private addHash(Ljava/nio/ByteBuffer;I)V
    .locals 0

    .line 29
    invoke-static {p1, p2}, Lnet/jpountz/util/ByteBufferUtils;->readInt(Ljava/nio/ByteBuffer;I)I

    move-result p1

    .line 30
    invoke-direct {p0, p1, p2}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->addHash(II)V

    return-void
.end method

.method private addHash([BI)V
    .locals 0

    .line 31
    invoke-static {p1, p2}, Lnet/jpountz/util/SafeUtils;->readInt([BI)I

    move-result p1

    .line 32
    invoke-direct {p0, p1, p2}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->addHash(II)V

    return-void
.end method

.method private hashPointer(I)I
    .locals 0

    .line 12
    invoke-static {p1}, Lnet/jpountz/lz4/LZ4Utils;->hashHC(I)I

    move-result p1

    .line 13
    iget-object p0, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->hashTable:[I

    aget p0, p0, p1

    return p0
.end method

.method private hashPointer(Ljava/nio/ByteBuffer;I)I
    .locals 0

    .line 10
    invoke-static {p1, p2}, Lnet/jpountz/util/ByteBufferUtils;->readInt(Ljava/nio/ByteBuffer;I)I

    move-result p1

    .line 11
    invoke-direct {p0, p1}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->hashPointer(I)I

    move-result p0

    return p0
.end method

.method private hashPointer([BI)I
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lnet/jpountz/util/SafeUtils;->readInt([BI)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-direct {p0, p1}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->hashPointer(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private next(I)I
    .locals 2

    .line 1
    iget-object p0, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->chainTable:[S

    .line 2
    .line 3
    const v0, 0xffff

    .line 4
    .line 5
    .line 6
    and-int v1, p1, v0

    .line 7
    .line 8
    aget-short p0, p0, v1

    .line 9
    .line 10
    and-int/2addr p0, v0

    .line 11
    sub-int/2addr p1, p0

    .line 12
    return p1
.end method


# virtual methods
.method public insert(ILjava/nio/ByteBuffer;)V
    .locals 1

    .line 16
    :goto_0
    iget v0, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->nextToUpdate:I

    if-ge v0, p1, :cond_0

    .line 17
    invoke-direct {p0, p2, v0}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->addHash(Ljava/nio/ByteBuffer;I)V

    .line 18
    iget v0, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->nextToUpdate:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->nextToUpdate:I

    goto :goto_0

    :cond_0
    return-void
.end method

.method public insert(I[B)V
    .locals 1

    .line 1
    :goto_0
    iget v0, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->nextToUpdate:I

    .line 2
    .line 3
    if-ge v0, p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0, p2, v0}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->addHash([BI)V

    .line 6
    .line 7
    .line 8
    iget v0, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->nextToUpdate:I

    .line 9
    .line 10
    add-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    iput v0, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->nextToUpdate:I

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public insertAndFindBestMatch(Ljava/nio/ByteBuffer;IILnet/jpountz/lz4/LZ4Utils$Match;)Z
    .locals 8

    .line 161
    iput p2, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    const/4 v0, 0x0

    .line 162
    iput v0, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 163
    invoke-virtual {p0, p2, p1}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->insert(ILjava/nio/ByteBuffer;)V

    .line 164
    invoke-direct {p0, p1, p2}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->hashPointer(Ljava/nio/ByteBuffer;I)I

    move-result v1

    add-int/lit8 v2, p2, -0x4

    if-lt v1, v2, :cond_1

    if-gt v1, p2, :cond_1

    .line 165
    iget v2, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->base:I

    if-lt v1, v2, :cond_1

    .line 166
    invoke-static {p1, v1, p2}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->readIntEquals(Ljava/nio/ByteBuffer;II)Z

    move-result v2

    if-eqz v2, :cond_0

    sub-int v2, p2, v1

    add-int/lit8 v3, v1, 0x4

    add-int/lit8 v4, p2, 0x4

    .line 167
    invoke-static {p1, v3, v4, p3}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->commonBytes(Ljava/nio/ByteBuffer;III)I

    move-result v3

    add-int/lit8 v3, v3, 0x4

    iput v3, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 168
    iput v1, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    goto :goto_0

    :cond_0
    move v2, v0

    move v3, v2

    .line 169
    :goto_0
    invoke-direct {p0, v1}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->next(I)I

    move-result v1

    goto :goto_1

    :cond_1
    move v2, v0

    move v3, v2

    :goto_1
    move v4, v0

    .line 170
    :goto_2
    iget-object v5, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->this$0:Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;

    invoke-static {v5}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;->access$000(Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;)I

    move-result v5

    const v6, 0xffff

    if-ge v4, v5, :cond_4

    .line 171
    iget v5, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->base:I

    sub-int v7, p2, v6

    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    move-result v5

    if-lt v1, v5, :cond_4

    if-le v1, p2, :cond_2

    goto :goto_3

    .line 172
    :cond_2
    invoke-static {p1, v1, p2}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->readIntEquals(Ljava/nio/ByteBuffer;II)Z

    move-result v5

    if-eqz v5, :cond_3

    add-int/lit8 v5, v1, 0x4

    add-int/lit8 v6, p2, 0x4

    .line 173
    invoke-static {p1, v5, v6, p3}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->commonBytes(Ljava/nio/ByteBuffer;III)I

    move-result v5

    add-int/lit8 v5, v5, 0x4

    .line 174
    iget v6, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    if-le v5, v6, :cond_3

    .line 175
    iput v1, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    .line 176
    iput v5, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 177
    :cond_3
    invoke-direct {p0, v1}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->next(I)I

    move-result v1

    add-int/lit8 v4, v4, 0x1

    goto :goto_2

    :cond_4
    :goto_3
    const/4 p3, 0x1

    if-eqz v3, :cond_6

    add-int/2addr v3, p2

    add-int/lit8 v3, v3, -0x3

    :goto_4
    sub-int v1, v3, v2

    if-ge p2, v1, :cond_5

    .line 178
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->chainTable:[S

    and-int v4, p2, v6

    int-to-short v5, v2

    aput-short v5, v1, v4

    add-int/lit8 p2, p2, 0x1

    goto :goto_4

    .line 179
    :cond_5
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->chainTable:[S

    and-int v4, p2, v6

    int-to-short v5, v2

    aput-short v5, v1, v4

    .line 180
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->hashTable:[I

    invoke-static {p1, p2}, Lnet/jpountz/util/ByteBufferUtils;->readInt(Ljava/nio/ByteBuffer;I)I

    move-result v4

    invoke-static {v4}, Lnet/jpountz/lz4/LZ4Utils;->hashHC(I)I

    move-result v4

    aput p2, v1, v4

    add-int/2addr p2, p3

    if-lt p2, v3, :cond_5

    .line 181
    iput v3, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->nextToUpdate:I

    .line 182
    :cond_6
    iget p0, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    if-eqz p0, :cond_7

    return p3

    :cond_7
    return v0
.end method

.method public insertAndFindBestMatch([BIILnet/jpountz/lz4/LZ4Utils$Match;)Z
    .locals 8

    .line 1
    iput p2, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    iput v0, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 5
    .line 6
    invoke-virtual {p0, p2, p1}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->insert(I[B)V

    .line 7
    .line 8
    .line 9
    invoke-direct {p0, p1, p2}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->hashPointer([BI)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    add-int/lit8 v2, p2, -0x4

    .line 14
    .line 15
    if-lt v1, v2, :cond_1

    .line 16
    .line 17
    if-gt v1, p2, :cond_1

    .line 18
    .line 19
    iget v2, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->base:I

    .line 20
    .line 21
    if-lt v1, v2, :cond_1

    .line 22
    .line 23
    invoke-static {p1, v1, p2}, Lnet/jpountz/lz4/LZ4SafeUtils;->readIntEquals([BII)Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    sub-int v2, p2, v1

    .line 30
    .line 31
    add-int/lit8 v3, v1, 0x4

    .line 32
    .line 33
    add-int/lit8 v4, p2, 0x4

    .line 34
    .line 35
    invoke-static {p1, v3, v4, p3}, Lnet/jpountz/lz4/LZ4SafeUtils;->commonBytes([BIII)I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    add-int/lit8 v3, v3, 0x4

    .line 40
    .line 41
    iput v3, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 42
    .line 43
    iput v1, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    move v2, v0

    .line 47
    move v3, v2

    .line 48
    :goto_0
    invoke-direct {p0, v1}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->next(I)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    move v2, v0

    .line 54
    move v3, v2

    .line 55
    :goto_1
    move v4, v0

    .line 56
    :goto_2
    iget-object v5, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->this$0:Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;

    .line 57
    .line 58
    invoke-static {v5}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;->access$000(Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;)I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    const v6, 0xffff

    .line 63
    .line 64
    .line 65
    if-ge v4, v5, :cond_4

    .line 66
    .line 67
    iget v5, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->base:I

    .line 68
    .line 69
    sub-int v7, p2, v6

    .line 70
    .line 71
    invoke-static {v5, v7}, Ljava/lang/Math;->max(II)I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    if-lt v1, v5, :cond_4

    .line 76
    .line 77
    if-le v1, p2, :cond_2

    .line 78
    .line 79
    goto :goto_3

    .line 80
    :cond_2
    invoke-static {p1, v1, p2}, Lnet/jpountz/lz4/LZ4SafeUtils;->readIntEquals([BII)Z

    .line 81
    .line 82
    .line 83
    move-result v5

    .line 84
    if-eqz v5, :cond_3

    .line 85
    .line 86
    add-int/lit8 v5, v1, 0x4

    .line 87
    .line 88
    add-int/lit8 v6, p2, 0x4

    .line 89
    .line 90
    invoke-static {p1, v5, v6, p3}, Lnet/jpountz/lz4/LZ4SafeUtils;->commonBytes([BIII)I

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    add-int/lit8 v5, v5, 0x4

    .line 95
    .line 96
    iget v6, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 97
    .line 98
    if-le v5, v6, :cond_3

    .line 99
    .line 100
    iput v1, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    .line 101
    .line 102
    iput v5, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 103
    .line 104
    :cond_3
    invoke-direct {p0, v1}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->next(I)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    add-int/lit8 v4, v4, 0x1

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_4
    :goto_3
    const/4 p3, 0x1

    .line 112
    if-eqz v3, :cond_6

    .line 113
    .line 114
    add-int/2addr v3, p2

    .line 115
    add-int/lit8 v3, v3, -0x3

    .line 116
    .line 117
    :goto_4
    sub-int v1, v3, v2

    .line 118
    .line 119
    if-ge p2, v1, :cond_5

    .line 120
    .line 121
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->chainTable:[S

    .line 122
    .line 123
    and-int v4, p2, v6

    .line 124
    .line 125
    int-to-short v5, v2

    .line 126
    aput-short v5, v1, v4

    .line 127
    .line 128
    add-int/lit8 p2, p2, 0x1

    .line 129
    .line 130
    goto :goto_4

    .line 131
    :cond_5
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->chainTable:[S

    .line 132
    .line 133
    and-int v4, p2, v6

    .line 134
    .line 135
    int-to-short v5, v2

    .line 136
    aput-short v5, v1, v4

    .line 137
    .line 138
    iget-object v1, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->hashTable:[I

    .line 139
    .line 140
    invoke-static {p1, p2}, Lnet/jpountz/util/SafeUtils;->readInt([BI)I

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    invoke-static {v4}, Lnet/jpountz/lz4/LZ4Utils;->hashHC(I)I

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    aput p2, v1, v4

    .line 149
    .line 150
    add-int/2addr p2, p3

    .line 151
    if-lt p2, v3, :cond_5

    .line 152
    .line 153
    iput v3, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->nextToUpdate:I

    .line 154
    .line 155
    :cond_6
    iget p0, p4, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 156
    .line 157
    if-eqz p0, :cond_7

    .line 158
    .line 159
    return p3

    .line 160
    :cond_7
    return v0
.end method

.method public insertAndFindWiderMatch(Ljava/nio/ByteBuffer;IIIILnet/jpountz/lz4/LZ4Utils$Match;)Z
    .locals 6

    .line 87
    iput p5, p6, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 88
    invoke-virtual {p0, p2, p1}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->insert(ILjava/nio/ByteBuffer;)V

    .line 89
    invoke-direct {p0, p1, p2}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->hashPointer(Ljava/nio/ByteBuffer;I)I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    .line 90
    :goto_0
    iget-object v3, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->this$0:Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;

    invoke-static {v3}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;->access$000(Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;)I

    move-result v3

    if-ge v2, v3, :cond_2

    .line 91
    iget v3, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->base:I

    const v4, 0xffff

    sub-int v4, p2, v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    if-lt v0, v3, :cond_2

    if-le v0, p2, :cond_0

    goto :goto_1

    .line 92
    :cond_0
    invoke-static {p1, v0, p2}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->readIntEquals(Ljava/nio/ByteBuffer;II)Z

    move-result v3

    if-eqz v3, :cond_1

    add-int/lit8 v3, v0, 0x4

    add-int/lit8 v4, p2, 0x4

    .line 93
    invoke-static {p1, v3, v4, p4}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->commonBytes(Ljava/nio/ByteBuffer;III)I

    move-result v3

    add-int/lit8 v3, v3, 0x4

    .line 94
    iget v4, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->base:I

    invoke-static {p1, v0, p2, v4, p3}, Lnet/jpountz/lz4/LZ4ByteBufferUtils;->commonBytesBackward(Ljava/nio/ByteBuffer;IIII)I

    move-result v4

    add-int/2addr v3, v4

    .line 95
    iget v5, p6, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    if-le v3, v5, :cond_1

    .line 96
    iput v3, p6, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    sub-int v3, v0, v4

    .line 97
    iput v3, p6, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    sub-int v3, p2, v4

    .line 98
    iput v3, p6, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 99
    :cond_1
    invoke-direct {p0, v0}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->next(I)I

    move-result v0

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 100
    :cond_2
    :goto_1
    iget p0, p6, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    if-le p0, p5, :cond_3

    const/4 p0, 0x1

    return p0

    :cond_3
    return v1
.end method

.method public insertAndFindWiderMatch([BIIIILnet/jpountz/lz4/LZ4Utils$Match;)Z
    .locals 6

    .line 1
    iput p5, p6, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 2
    .line 3
    invoke-virtual {p0, p2, p1}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->insert(I[B)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->hashPointer([BI)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    move v2, v1

    .line 12
    :goto_0
    iget-object v3, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->this$0:Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;

    .line 13
    .line 14
    invoke-static {v3}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;->access$000(Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor;)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-ge v2, v3, :cond_2

    .line 19
    .line 20
    iget v3, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->base:I

    .line 21
    .line 22
    const v4, 0xffff

    .line 23
    .line 24
    .line 25
    sub-int v4, p2, v4

    .line 26
    .line 27
    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-lt v0, v3, :cond_2

    .line 32
    .line 33
    if-le v0, p2, :cond_0

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    invoke-static {p1, v0, p2}, Lnet/jpountz/lz4/LZ4SafeUtils;->readIntEquals([BII)Z

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    if-eqz v3, :cond_1

    .line 41
    .line 42
    add-int/lit8 v3, v0, 0x4

    .line 43
    .line 44
    add-int/lit8 v4, p2, 0x4

    .line 45
    .line 46
    invoke-static {p1, v3, v4, p4}, Lnet/jpountz/lz4/LZ4SafeUtils;->commonBytes([BIII)I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    add-int/lit8 v3, v3, 0x4

    .line 51
    .line 52
    iget v4, p0, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->base:I

    .line 53
    .line 54
    invoke-static {p1, v0, p2, v4, p3}, Lnet/jpountz/lz4/LZ4SafeUtils;->commonBytesBackward([BIIII)I

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    add-int/2addr v3, v4

    .line 59
    iget v5, p6, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 60
    .line 61
    if-le v3, v5, :cond_1

    .line 62
    .line 63
    iput v3, p6, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 64
    .line 65
    sub-int v3, v0, v4

    .line 66
    .line 67
    iput v3, p6, Lnet/jpountz/lz4/LZ4Utils$Match;->ref:I

    .line 68
    .line 69
    sub-int v3, p2, v4

    .line 70
    .line 71
    iput v3, p6, Lnet/jpountz/lz4/LZ4Utils$Match;->start:I

    .line 72
    .line 73
    :cond_1
    invoke-direct {p0, v0}, Lnet/jpountz/lz4/LZ4HCJavaSafeCompressor$HashTable;->next(I)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/lit8 v2, v2, 0x1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_2
    :goto_1
    iget p0, p6, Lnet/jpountz/lz4/LZ4Utils$Match;->len:I

    .line 81
    .line 82
    if-le p0, p5, :cond_3

    .line 83
    .line 84
    const/4 p0, 0x1

    .line 85
    return p0

    .line 86
    :cond_3
    return v1
.end method
