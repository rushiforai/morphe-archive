.class public Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/youtu/sdkkitframework/common/Base64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Decoder"
.end annotation


# static fields
.field public static final c:[I

.field public static final d:[I

.field public static final e:Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;

.field public static final f:Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;

.field public static final g:Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;


# instance fields
.field public final a:Z

.field public final b:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 6

    .line 1
    const/16 v0, 0x100

    .line 2
    .line 3
    new-array v1, v0, [I

    .line 4
    .line 5
    sput-object v1, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->c:[I

    .line 6
    .line 7
    const/4 v2, -0x1

    .line 8
    invoke-static {v1, v2}, Ljava/util/Arrays;->fill([II)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    move v3, v1

    .line 13
    :goto_0
    sget-object v4, Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;->e:[C

    .line 14
    .line 15
    array-length v5, v4

    .line 16
    if-ge v3, v5, :cond_0

    .line 17
    .line 18
    sget-object v5, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->c:[I

    .line 19
    .line 20
    aget-char v4, v4, v3

    .line 21
    .line 22
    aput v3, v5, v4

    .line 23
    .line 24
    add-int/lit8 v3, v3, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    sget-object v3, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->c:[I

    .line 28
    .line 29
    const/16 v4, 0x3d

    .line 30
    .line 31
    const/4 v5, -0x2

    .line 32
    aput v5, v3, v4

    .line 33
    .line 34
    new-array v0, v0, [I

    .line 35
    .line 36
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->d:[I

    .line 37
    .line 38
    invoke-static {v0, v2}, Ljava/util/Arrays;->fill([II)V

    .line 39
    .line 40
    .line 41
    move v0, v1

    .line 42
    :goto_1
    sget-object v2, Lcom/tencent/youtu/sdkkitframework/common/Base64$Encoder;->f:[C

    .line 43
    .line 44
    array-length v3, v2

    .line 45
    if-ge v0, v3, :cond_1

    .line 46
    .line 47
    sget-object v3, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->d:[I

    .line 48
    .line 49
    aget-char v2, v2, v0

    .line 50
    .line 51
    aput v0, v3, v2

    .line 52
    .line 53
    add-int/lit8 v0, v0, 0x1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->d:[I

    .line 57
    .line 58
    aput v5, v0, v4

    .line 59
    .line 60
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;

    .line 61
    .line 62
    invoke-direct {v0, v1, v1}, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;-><init>(ZZ)V

    .line 63
    .line 64
    .line 65
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->e:Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;

    .line 66
    .line 67
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;

    .line 68
    .line 69
    const/4 v2, 0x1

    .line 70
    invoke-direct {v0, v2, v1}, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;-><init>(ZZ)V

    .line 71
    .line 72
    .line 73
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->f:Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;

    .line 74
    .line 75
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;

    .line 76
    .line 77
    invoke-direct {v0, v1, v2}, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;-><init>(ZZ)V

    .line 78
    .line 79
    .line 80
    sput-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->g:Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;

    .line 81
    .line 82
    return-void
.end method

.method public constructor <init>(ZZ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->a:Z

    .line 5
    .line 6
    iput-boolean p2, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->b:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a([BII)I
    .locals 7

    .line 165
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->a:Z

    if-eqz v0, :cond_0

    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->d:[I

    goto :goto_0

    :cond_0
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->c:[I

    :goto_0
    sub-int v1, p3, p2

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 166
    :cond_1
    iget-boolean p0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->b:Z

    const/4 v3, -0x1

    const/4 v4, 0x2

    if-ge v1, v4, :cond_3

    if-eqz p0, :cond_2

    .line 167
    aget p0, v0, v2

    if-ne p0, v3, :cond_2

    return v2

    .line 168
    :cond_2
    const-string p0, "Input byte[] should at least have 2 bytes for base64 bytes"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return v2

    :cond_3
    const/16 v5, 0x3d

    const/4 v6, 0x1

    if-eqz p0, :cond_7

    move p0, v2

    :goto_1
    if-ge p2, p3, :cond_6

    add-int/lit8 v4, p2, 0x1

    .line 169
    aget-byte p2, p1, p2

    and-int/lit16 p2, p2, 0xff

    if-ne p2, v5, :cond_4

    sub-int/2addr p3, v4

    add-int/2addr p3, v6

    sub-int/2addr v1, p3

    goto :goto_2

    .line 170
    :cond_4
    aget p2, v0, p2

    if-ne p2, v3, :cond_5

    add-int/lit8 p0, p0, 0x1

    :cond_5
    move p2, v4

    goto :goto_1

    :cond_6
    :goto_2
    sub-int/2addr v1, p0

    goto :goto_3

    :cond_7
    add-int/lit8 p0, p3, -0x1

    .line 171
    aget-byte p0, p1, p0

    if-ne p0, v5, :cond_9

    sub-int/2addr p3, v4

    .line 172
    aget-byte p0, p1, p3

    if-ne p0, v5, :cond_8

    move v2, v4

    goto :goto_3

    :cond_8
    move v2, v6

    :cond_9
    :goto_3
    if-nez v2, :cond_a

    and-int/lit8 p0, v1, 0x3

    if-eqz p0, :cond_a

    rsub-int/lit8 v2, p0, 0x4

    :cond_a
    add-int/lit8 v1, v1, 0x3

    .line 173
    div-int/lit8 v1, v1, 0x4

    mul-int/lit8 v1, v1, 0x3

    sub-int/2addr v1, v2

    return v1
.end method

.method public final a([BII[B)I
    .locals 11

    .line 1
    iget-boolean v0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->d:[I

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->c:[I

    .line 9
    .line 10
    :goto_0
    const/16 v1, 0x12

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    move v4, v1

    .line 14
    move v3, v2

    .line 15
    move v5, v3

    .line 16
    :goto_1
    const/4 v6, 0x6

    .line 17
    const/16 v7, 0x10

    .line 18
    .line 19
    if-ge p2, p3, :cond_7

    .line 20
    .line 21
    add-int/lit8 v8, p2, 0x1

    .line 22
    .line 23
    aget-byte v9, p1, p2

    .line 24
    .line 25
    and-int/lit16 v9, v9, 0xff

    .line 26
    .line 27
    aget v9, v0, v9

    .line 28
    .line 29
    if-gez v9, :cond_6

    .line 30
    .line 31
    const/4 v10, -0x2

    .line 32
    if-ne v9, v10, :cond_3

    .line 33
    .line 34
    if-ne v4, v6, :cond_1

    .line 35
    .line 36
    if-eq v8, p3, :cond_2

    .line 37
    .line 38
    add-int/lit8 p2, p2, 0x2

    .line 39
    .line 40
    aget-byte v8, p1, v8

    .line 41
    .line 42
    const/16 v9, 0x3d

    .line 43
    .line 44
    if-ne v8, v9, :cond_2

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_1
    move p2, v8

    .line 48
    :goto_2
    if-eq v4, v1, :cond_2

    .line 49
    .line 50
    goto :goto_4

    .line 51
    :cond_2
    const-string p0, "Input byte array has wrong 4-byte ending unit"

    .line 52
    .line 53
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return v2

    .line 57
    :cond_3
    iget-boolean v6, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->b:Z

    .line 58
    .line 59
    if-eqz v6, :cond_5

    .line 60
    .line 61
    :cond_4
    :goto_3
    move p2, v8

    .line 62
    goto :goto_1

    .line 63
    :cond_5
    aget-byte p0, p1, p2

    .line 64
    .line 65
    invoke-static {p0, v7}, Ljava/lang/Integer;->toString(II)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    const-string p1, "Illegal base64 character "

    .line 70
    .line 71
    invoke-static {p1, p0}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    return v2

    .line 75
    :cond_6
    shl-int p2, v9, v4

    .line 76
    .line 77
    or-int/2addr v3, p2

    .line 78
    add-int/lit8 v4, v4, -0x6

    .line 79
    .line 80
    if-gez v4, :cond_4

    .line 81
    .line 82
    add-int/lit8 p2, v5, 0x1

    .line 83
    .line 84
    shr-int/lit8 v4, v3, 0x10

    .line 85
    .line 86
    int-to-byte v4, v4

    .line 87
    aput-byte v4, p4, v5

    .line 88
    .line 89
    add-int/lit8 v4, v5, 0x2

    .line 90
    .line 91
    shr-int/lit8 v6, v3, 0x8

    .line 92
    .line 93
    int-to-byte v6, v6

    .line 94
    aput-byte v6, p4, p2

    .line 95
    .line 96
    add-int/lit8 v5, v5, 0x3

    .line 97
    .line 98
    int-to-byte p2, v3

    .line 99
    aput-byte p2, p4, v4

    .line 100
    .line 101
    move v4, v1

    .line 102
    move v3, v2

    .line 103
    goto :goto_3

    .line 104
    :cond_7
    :goto_4
    if-ne v4, v6, :cond_8

    .line 105
    .line 106
    add-int/lit8 v1, v5, 0x1

    .line 107
    .line 108
    shr-int/2addr v3, v7

    .line 109
    int-to-byte v3, v3

    .line 110
    aput-byte v3, p4, v5

    .line 111
    .line 112
    move v5, v1

    .line 113
    goto :goto_5

    .line 114
    :cond_8
    if-nez v4, :cond_9

    .line 115
    .line 116
    add-int/lit8 v1, v5, 0x1

    .line 117
    .line 118
    shr-int/lit8 v4, v3, 0x10

    .line 119
    .line 120
    int-to-byte v4, v4

    .line 121
    aput-byte v4, p4, v5

    .line 122
    .line 123
    add-int/lit8 v5, v5, 0x2

    .line 124
    .line 125
    shr-int/lit8 v3, v3, 0x8

    .line 126
    .line 127
    int-to-byte v3, v3

    .line 128
    aput-byte v3, p4, v1

    .line 129
    .line 130
    goto :goto_5

    .line 131
    :cond_9
    const/16 p4, 0xc

    .line 132
    .line 133
    if-eq v4, p4, :cond_d

    .line 134
    .line 135
    :goto_5
    if-ge p2, p3, :cond_c

    .line 136
    .line 137
    iget-boolean p4, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->b:Z

    .line 138
    .line 139
    if-eqz p4, :cond_b

    .line 140
    .line 141
    add-int/lit8 p4, p2, 0x1

    .line 142
    .line 143
    aget-byte p2, p1, p2

    .line 144
    .line 145
    aget p2, v0, p2

    .line 146
    .line 147
    if-gez p2, :cond_a

    .line 148
    .line 149
    move p2, p4

    .line 150
    goto :goto_5

    .line 151
    :cond_a
    move p2, p4

    .line 152
    :cond_b
    const-string p0, "Input byte array has incorrect ending byte at "

    .line 153
    .line 154
    invoke-static {p0, p2}, Ll/za50;->a(Ljava/lang/String;I)V

    .line 155
    .line 156
    .line 157
    return v2

    .line 158
    :cond_c
    return v5

    .line 159
    :cond_d
    const-string p0, "Last unit does not have enough valid bits"

    .line 160
    .line 161
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    return v2
.end method

.method public decode([B[B)I
    .locals 3

    .line 74
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->a([BII)I

    move-result v0

    .line 75
    array-length v2, p2

    if-lt v2, v0, :cond_0

    .line 76
    array-length v0, p1

    invoke-virtual {p0, p1, v1, v0, p2}, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->a([BII[B)I

    move-result p0

    return p0

    .line 77
    :cond_0
    const-string p0, "Output byte array is too small for decoding all input bytes"

    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    return v1
.end method

.method public decode(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 6

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    :try_start_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->hasArray()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    add-int/2addr v3, v4

    .line 25
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    add-int/2addr v4, v5

    .line 34
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    invoke-virtual {p1, v5}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catch_0
    move-exception p0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 45
    .line 46
    .line 47
    move-result v4

    .line 48
    new-array v1, v4, [B

    .line 49
    .line 50
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 51
    .line 52
    .line 53
    move v3, v2

    .line 54
    :goto_0
    invoke-virtual {p0, v1, v3, v4}, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->a([BII)I

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    new-array v5, v5, [B

    .line 59
    .line 60
    invoke-virtual {p0, v1, v3, v4, v5}, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->a([BII[B)I

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    invoke-static {v5, v2, p0}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    .line 67
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    return-object p0

    .line 69
    :goto_1
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 70
    .line 71
    .line 72
    throw p0
.end method

.method public decode(Ljava/lang/String;)[B
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 73
    sget-object v0, Ljava/nio/charset/StandardCharsets;->ISO_8859_1:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->decode([B)[B

    move-result-object p0

    return-object p0
.end method

.method public decode([B)[B
    .locals 4

    .line 78
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->a([BII)I

    move-result v0

    new-array v2, v0, [B

    .line 79
    array-length v3, p1

    invoke-virtual {p0, p1, v1, v3, v2}, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->a([BII[B)I

    move-result p0

    if-eq p0, v0, :cond_0

    .line 80
    invoke-static {v2, p0}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p0

    return-object p0

    :cond_0
    return-object v2
.end method

.method public wrap(Ljava/io/InputStream;)Ljava/io/InputStream;
    .locals 2

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;

    .line 5
    .line 6
    iget-boolean v1, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->a:Z

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->d:[I

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    sget-object v1, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->c:[I

    .line 14
    .line 15
    :goto_0
    iget-boolean p0, p0, Lcom/tencent/youtu/sdkkitframework/common/Base64$Decoder;->b:Z

    .line 16
    .line 17
    invoke-direct {v0, p1, v1, p0}, Lcom/tencent/youtu/sdkkitframework/common/Base64$DecInputStream;-><init>(Ljava/io/InputStream;[IZ)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method
