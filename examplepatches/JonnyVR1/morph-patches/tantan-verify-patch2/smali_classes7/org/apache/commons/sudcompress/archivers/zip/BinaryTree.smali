.class Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final NODE:I = -0x2

.field private static final UNDEFINED:I = -0x1


# instance fields
.field private final tree:[I


# direct methods
.method public constructor <init>(I)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-ltz p1, :cond_0

    .line 5
    .line 6
    const/16 v0, 0x1e

    .line 7
    .line 8
    if-gt p1, v0, :cond_0

    .line 9
    .line 10
    add-int/lit8 p1, p1, 0x1

    .line 11
    .line 12
    const-wide/16 v0, 0x1

    .line 13
    .line 14
    shl-long v2, v0, p1

    .line 15
    .line 16
    sub-long/2addr v2, v0

    .line 17
    long-to-int p1, v2

    .line 18
    new-array p1, p1, [I

    .line 19
    .line 20
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;->tree:[I

    .line 21
    .line 22
    const/4 p0, -0x1

    .line 23
    invoke-static {p1, p0}, Ljava/util/Arrays;->fill([II)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    const-string p0, "depth must be bigger than 0 and not bigger than 30 but is "

    .line 28
    .line 29
    invoke-static {p1, p0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    throw p0
.end method

.method public static decode(Ljava/io/InputStream;I)Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;
    .locals 12

    .line 1
    const/4 v0, 0x0

    .line 2
    if-ltz p1, :cond_d

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x1

    .line 9
    add-int/2addr v1, v2

    .line 10
    if-eqz v1, :cond_c

    .line 11
    .line 12
    new-array v3, v1, [B

    .line 13
    .line 14
    const/4 v4, 0x0

    .line 15
    invoke-static {p0, v3, v4, v1}, Ll/xeg0;->a(Ljava/io/InputStream;[BII)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-ne p0, v1, :cond_b

    .line 20
    .line 21
    new-array p0, p1, [I

    .line 22
    .line 23
    move v5, v4

    .line 24
    move v6, v5

    .line 25
    move v7, v6

    .line 26
    :goto_0
    if-ge v5, v1, :cond_2

    .line 27
    .line 28
    aget-byte v8, v3, v5

    .line 29
    .line 30
    and-int/lit16 v9, v8, 0xf0

    .line 31
    .line 32
    shr-int/lit8 v9, v9, 0x4

    .line 33
    .line 34
    add-int/2addr v9, v2

    .line 35
    add-int v10, v6, v9

    .line 36
    .line 37
    if-gt v10, p1, :cond_1

    .line 38
    .line 39
    and-int/lit8 v8, v8, 0xf

    .line 40
    .line 41
    add-int/2addr v8, v2

    .line 42
    move v10, v4

    .line 43
    :goto_1
    if-ge v10, v9, :cond_0

    .line 44
    .line 45
    add-int/lit8 v11, v6, 0x1

    .line 46
    .line 47
    aput v8, p0, v6

    .line 48
    .line 49
    add-int/lit8 v10, v10, 0x1

    .line 50
    .line 51
    move v6, v11

    .line 52
    goto :goto_1

    .line 53
    :cond_0
    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    .line 54
    .line 55
    .line 56
    move-result v7

    .line 57
    add-int/lit8 v5, v5, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    const-string p0, "Number of values exceeds given total number of values"

    .line 61
    .line 62
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-object v0

    .line 66
    :cond_2
    new-array v0, p1, [I

    .line 67
    .line 68
    move v1, v4

    .line 69
    :goto_2
    if-ge v1, p1, :cond_3

    .line 70
    .line 71
    aput v1, v0, v1

    .line 72
    .line 73
    add-int/lit8 v1, v1, 0x1

    .line 74
    .line 75
    goto :goto_2

    .line 76
    :cond_3
    new-array v1, p1, [I

    .line 77
    .line 78
    move v3, v4

    .line 79
    move v5, v3

    .line 80
    :goto_3
    if-ge v3, p1, :cond_6

    .line 81
    .line 82
    move v6, v4

    .line 83
    :goto_4
    if-ge v6, p1, :cond_5

    .line 84
    .line 85
    aget v8, p0, v6

    .line 86
    .line 87
    if-ne v8, v3, :cond_4

    .line 88
    .line 89
    aput v3, v1, v5

    .line 90
    .line 91
    aput v6, v0, v5

    .line 92
    .line 93
    add-int/lit8 v5, v5, 0x1

    .line 94
    .line 95
    :cond_4
    add-int/lit8 v6, v6, 0x1

    .line 96
    .line 97
    goto :goto_4

    .line 98
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 99
    .line 100
    goto :goto_3

    .line 101
    :cond_6
    new-array v3, p1, [I

    .line 102
    .line 103
    add-int/lit8 v5, p1, -0x1

    .line 104
    .line 105
    move v6, v4

    .line 106
    move v8, v6

    .line 107
    move v9, v8

    .line 108
    :goto_5
    if-ltz v5, :cond_8

    .line 109
    .line 110
    add-int/2addr v6, v8

    .line 111
    aget v10, v1, v5

    .line 112
    .line 113
    if-eq v10, v9, :cond_7

    .line 114
    .line 115
    rsub-int/lit8 v8, v10, 0x10

    .line 116
    .line 117
    shl-int v8, v2, v8

    .line 118
    .line 119
    move v9, v10

    .line 120
    :cond_7
    aget v10, v0, v5

    .line 121
    .line 122
    aput v6, v3, v10

    .line 123
    .line 124
    add-int/lit8 v5, v5, -0x1

    .line 125
    .line 126
    goto :goto_5

    .line 127
    :cond_8
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;

    .line 128
    .line 129
    invoke-direct {v0, v7}, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;-><init>(I)V

    .line 130
    .line 131
    .line 132
    move v1, v4

    .line 133
    :goto_6
    if-ge v1, p1, :cond_a

    .line 134
    .line 135
    aget v2, p0, v1

    .line 136
    .line 137
    if-lez v2, :cond_9

    .line 138
    .line 139
    aget v5, v3, v1

    .line 140
    .line 141
    shl-int/lit8 v5, v5, 0x10

    .line 142
    .line 143
    invoke-static {v5}, Ljava/lang/Integer;->reverse(I)I

    .line 144
    .line 145
    .line 146
    move-result v5

    .line 147
    invoke-virtual {v0, v4, v5, v2, v1}, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;->addLeaf(IIII)V

    .line 148
    .line 149
    .line 150
    :cond_9
    add-int/lit8 v1, v1, 0x1

    .line 151
    .line 152
    goto :goto_6

    .line 153
    :cond_a
    return-object v0

    .line 154
    :cond_b
    invoke-static {}, Ll/vg3;->a()V

    .line 155
    .line 156
    .line 157
    return-object v0

    .line 158
    :cond_c
    const-string p0, "Cannot read the size of the encoded tree, unexpected end of stream"

    .line 159
    .line 160
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    return-object v0

    .line 164
    :cond_d
    const-string p0, "totalNumberOfValues must be bigger than 0, is "

    .line 165
    .line 166
    invoke-static {p1, p0}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    return-object v0
.end method


# virtual methods
.method public addLeaf(IIII)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;->tree:[I

    .line 2
    .line 3
    if-nez p3, :cond_1

    .line 4
    .line 5
    aget p2, v0, p1

    .line 6
    .line 7
    const/4 p3, -0x1

    .line 8
    if-ne p2, p3, :cond_0

    .line 9
    .line 10
    aput p4, v0, p1

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;->tree:[I

    .line 14
    .line 15
    aget p0, p0, p1

    .line 16
    .line 17
    const-string p2, ")"

    .line 18
    .line 19
    const-string p3, "Tree value at index "

    .line 20
    .line 21
    const-string p4, " has already been assigned ("

    .line 22
    .line 23
    invoke-static {p3, p1, p4, p0, p2}, Ll/cmq;->a(Ljava/lang/String;ILjava/lang/Object;ILjava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const/4 v1, -0x2

    .line 28
    aput v1, v0, p1

    .line 29
    .line 30
    mul-int/lit8 p1, p1, 0x2

    .line 31
    .line 32
    add-int/lit8 p1, p1, 0x1

    .line 33
    .line 34
    and-int/lit8 v0, p2, 0x1

    .line 35
    .line 36
    add-int/2addr p1, v0

    .line 37
    ushr-int/lit8 p2, p2, 0x1

    .line 38
    .line 39
    add-int/lit8 p3, p3, -0x1

    .line 40
    .line 41
    invoke-virtual {p0, p1, p2, p3, p4}, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;->addLeaf(IIII)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public read(Lorg/apache/commons/sudcompress/archivers/zip/BitStream;)I
    .locals 6

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/BitStream;->nextBit()I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    const/4 v2, -0x1

    .line 7
    if-ne v1, v2, :cond_0

    .line 8
    .line 9
    return v2

    .line 10
    :cond_0
    mul-int/lit8 v3, v0, 0x2

    .line 11
    .line 12
    add-int/lit8 v3, v3, 0x1

    .line 13
    .line 14
    add-int/2addr v3, v1

    .line 15
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/BinaryTree;->tree:[I

    .line 16
    .line 17
    aget v4, v4, v3

    .line 18
    .line 19
    const/4 v5, -0x2

    .line 20
    if-ne v4, v5, :cond_1

    .line 21
    .line 22
    move v0, v3

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    if-eq v4, v2, :cond_2

    .line 25
    .line 26
    return v4

    .line 27
    :cond_2
    new-instance p0, Ljava/io/IOException;

    .line 28
    .line 29
    new-instance p1, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    const-string v2, "The child "

    .line 32
    .line 33
    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v1, " of node at index "

    .line 40
    .line 41
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v0, " is not defined"

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    throw p0
.end method
