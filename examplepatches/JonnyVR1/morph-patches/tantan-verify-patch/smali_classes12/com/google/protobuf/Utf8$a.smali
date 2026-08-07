.class public abstract Lcom/google/protobuf/Utf8$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/protobuf/Utf8;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "a"
.end annotation


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

.method public static f(Ljava/nio/ByteBuffer;II)I
    .locals 7

    .line 1
    invoke-static {p0, p1, p2}, Lcom/google/protobuf/Utf8;->c(Ljava/nio/ByteBuffer;II)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/2addr p1, v0

    .line 6
    :cond_0
    :goto_0
    if-lt p1, p2, :cond_1

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_1
    add-int/lit8 v0, p1, 0x1

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-gez v1, :cond_e

    .line 17
    .line 18
    const/16 v2, -0x20

    .line 19
    .line 20
    const/4 v3, -0x1

    .line 21
    const/16 v4, -0x41

    .line 22
    .line 23
    if-ge v1, v2, :cond_5

    .line 24
    .line 25
    if-lt v0, p2, :cond_2

    .line 26
    .line 27
    return v1

    .line 28
    :cond_2
    const/16 v2, -0x3e

    .line 29
    .line 30
    if-lt v1, v2, :cond_4

    .line 31
    .line 32
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-le v0, v4, :cond_3

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_3
    add-int/lit8 p1, p1, 0x2

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_4
    :goto_1
    return v3

    .line 43
    :cond_5
    const/16 v5, -0x10

    .line 44
    .line 45
    if-ge v1, v5, :cond_b

    .line 46
    .line 47
    add-int/lit8 v5, p2, -0x1

    .line 48
    .line 49
    if-lt v0, v5, :cond_6

    .line 50
    .line 51
    sub-int/2addr p2, v0

    .line 52
    invoke-static {p0, v1, v0, p2}, Lcom/google/protobuf/Utf8;->d(Ljava/nio/ByteBuffer;III)I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    return p0

    .line 57
    :cond_6
    add-int/lit8 v5, p1, 0x2

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-gt v0, v4, :cond_a

    .line 64
    .line 65
    const/16 v6, -0x60

    .line 66
    .line 67
    if-ne v1, v2, :cond_7

    .line 68
    .line 69
    if-lt v0, v6, :cond_a

    .line 70
    .line 71
    :cond_7
    const/16 v2, -0x13

    .line 72
    .line 73
    if-ne v1, v2, :cond_8

    .line 74
    .line 75
    if-ge v0, v6, :cond_a

    .line 76
    .line 77
    :cond_8
    invoke-virtual {p0, v5}, Ljava/nio/ByteBuffer;->get(I)B

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-le v0, v4, :cond_9

    .line 82
    .line 83
    goto :goto_2

    .line 84
    :cond_9
    add-int/lit8 p1, p1, 0x3

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_a
    :goto_2
    return v3

    .line 88
    :cond_b
    add-int/lit8 v2, p2, -0x2

    .line 89
    .line 90
    if-lt v0, v2, :cond_c

    .line 91
    .line 92
    sub-int/2addr p2, v0

    .line 93
    invoke-static {p0, v1, v0, p2}, Lcom/google/protobuf/Utf8;->d(Ljava/nio/ByteBuffer;III)I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    return p0

    .line 98
    :cond_c
    add-int/lit8 v2, p1, 0x2

    .line 99
    .line 100
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-gt v0, v4, :cond_d

    .line 105
    .line 106
    shl-int/lit8 v1, v1, 0x1c

    .line 107
    .line 108
    add-int/lit8 v0, v0, 0x70

    .line 109
    .line 110
    add-int/2addr v1, v0

    .line 111
    shr-int/lit8 v0, v1, 0x1e

    .line 112
    .line 113
    if-nez v0, :cond_d

    .line 114
    .line 115
    add-int/lit8 v0, p1, 0x3

    .line 116
    .line 117
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get(I)B

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-gt v1, v4, :cond_d

    .line 122
    .line 123
    add-int/lit8 p1, p1, 0x4

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-le v0, v4, :cond_0

    .line 130
    .line 131
    :cond_d
    return v3

    .line 132
    :cond_e
    move p1, v0

    .line 133
    goto :goto_0
.end method


# virtual methods
.method public abstract a(Ljava/lang/CharSequence;[BII)I
.end method

.method public final b(Ljava/nio/ByteBuffer;II)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/google/protobuf/Utf8$a;->d(ILjava/nio/ByteBuffer;II)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    return v0
.end method

.method public final c([BII)Z
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0, p1, p2, p3}, Lcom/google/protobuf/Utf8$a;->e(I[BII)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    return v0
.end method

.method public final d(ILjava/nio/ByteBuffer;II)I
    .locals 1

    .line 1
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->hasArray()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->array()[B

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    add-int/2addr p3, v0

    .line 16
    add-int/2addr v0, p4

    .line 17
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/google/protobuf/Utf8$a;->e(I[BII)I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->isDirect()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/protobuf/Utf8$a;->h(ILjava/nio/ByteBuffer;II)I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    return p0

    .line 33
    :cond_1
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/google/protobuf/Utf8$a;->g(ILjava/nio/ByteBuffer;II)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public abstract e(I[BII)I
.end method

.method public final g(ILjava/nio/ByteBuffer;II)I
    .locals 5

    .line 1
    if-eqz p1, :cond_f

    .line 2
    .line 3
    if-lt p3, p4, :cond_0

    .line 4
    .line 5
    return p1

    .line 6
    :cond_0
    int-to-byte p0, p1

    .line 7
    const/16 v0, -0x20

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    const/16 v2, -0x41

    .line 11
    .line 12
    if-ge p0, v0, :cond_3

    .line 13
    .line 14
    const/16 p1, -0x3e

    .line 15
    .line 16
    if-lt p0, p1, :cond_2

    .line 17
    .line 18
    add-int/lit8 p0, p3, 0x1

    .line 19
    .line 20
    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 21
    .line 22
    .line 23
    move-result p1

    .line 24
    if-le p1, v2, :cond_1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    move p3, p0

    .line 28
    goto/16 :goto_2

    .line 29
    .line 30
    :cond_2
    :goto_0
    return v1

    .line 31
    :cond_3
    const/16 v3, -0x10

    .line 32
    .line 33
    if-ge p0, v3, :cond_9

    .line 34
    .line 35
    shr-int/lit8 p1, p1, 0x8

    .line 36
    .line 37
    not-int p1, p1

    .line 38
    int-to-byte p1, p1

    .line 39
    if-nez p1, :cond_5

    .line 40
    .line 41
    add-int/lit8 p1, p3, 0x1

    .line 42
    .line 43
    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 44
    .line 45
    .line 46
    move-result p3

    .line 47
    if-lt p1, p4, :cond_4

    .line 48
    .line 49
    invoke-static {p0, p3}, Lcom/google/protobuf/Utf8;->a(II)I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    return p0

    .line 54
    :cond_4
    move v4, p3

    .line 55
    move p3, p1

    .line 56
    move p1, v4

    .line 57
    :cond_5
    if-gt p1, v2, :cond_8

    .line 58
    .line 59
    const/16 v3, -0x60

    .line 60
    .line 61
    if-ne p0, v0, :cond_6

    .line 62
    .line 63
    if-lt p1, v3, :cond_8

    .line 64
    .line 65
    :cond_6
    const/16 v0, -0x13

    .line 66
    .line 67
    if-ne p0, v0, :cond_7

    .line 68
    .line 69
    if-ge p1, v3, :cond_8

    .line 70
    .line 71
    :cond_7
    add-int/lit8 p0, p3, 0x1

    .line 72
    .line 73
    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 74
    .line 75
    .line 76
    move-result p1

    .line 77
    if-le p1, v2, :cond_1

    .line 78
    .line 79
    :cond_8
    return v1

    .line 80
    :cond_9
    shr-int/lit8 v0, p1, 0x8

    .line 81
    .line 82
    not-int v0, v0

    .line 83
    int-to-byte v0, v0

    .line 84
    if-nez v0, :cond_b

    .line 85
    .line 86
    add-int/lit8 p1, p3, 0x1

    .line 87
    .line 88
    invoke-virtual {p2, p3}, Ljava/nio/ByteBuffer;->get(I)B

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-lt p1, p4, :cond_a

    .line 93
    .line 94
    invoke-static {p0, v0}, Lcom/google/protobuf/Utf8;->a(II)I

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    return p0

    .line 99
    :cond_a
    const/4 p3, 0x0

    .line 100
    goto :goto_1

    .line 101
    :cond_b
    shr-int/lit8 p1, p1, 0x10

    .line 102
    .line 103
    int-to-byte p1, p1

    .line 104
    move v4, p3

    .line 105
    move p3, p1

    .line 106
    move p1, v4

    .line 107
    :goto_1
    if-nez p3, :cond_d

    .line 108
    .line 109
    add-int/lit8 p3, p1, 0x1

    .line 110
    .line 111
    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 112
    .line 113
    .line 114
    move-result p1

    .line 115
    if-lt p3, p4, :cond_c

    .line 116
    .line 117
    invoke-static {p0, v0, p1}, Lcom/google/protobuf/Utf8;->b(III)I

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    return p0

    .line 122
    :cond_c
    move v4, p3

    .line 123
    move p3, p1

    .line 124
    move p1, v4

    .line 125
    :cond_d
    if-gt v0, v2, :cond_e

    .line 126
    .line 127
    shl-int/lit8 p0, p0, 0x1c

    .line 128
    .line 129
    add-int/lit8 v0, v0, 0x70

    .line 130
    .line 131
    add-int/2addr p0, v0

    .line 132
    shr-int/lit8 p0, p0, 0x1e

    .line 133
    .line 134
    if-nez p0, :cond_e

    .line 135
    .line 136
    if-gt p3, v2, :cond_e

    .line 137
    .line 138
    add-int/lit8 p3, p1, 0x1

    .line 139
    .line 140
    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->get(I)B

    .line 141
    .line 142
    .line 143
    move-result p0

    .line 144
    if-le p0, v2, :cond_f

    .line 145
    .line 146
    :cond_e
    return v1

    .line 147
    :cond_f
    :goto_2
    invoke-static {p2, p3, p4}, Lcom/google/protobuf/Utf8$a;->f(Ljava/nio/ByteBuffer;II)I

    .line 148
    .line 149
    .line 150
    move-result p0

    .line 151
    return p0
.end method

.method public abstract h(ILjava/nio/ByteBuffer;II)I
.end method
