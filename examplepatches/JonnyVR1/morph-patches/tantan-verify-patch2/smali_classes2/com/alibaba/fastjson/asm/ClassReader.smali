.class public Lcom/alibaba/fastjson/asm/ClassReader;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final b:[B

.field public final header:I

.field private final items:[I

.field private final maxStringLength:I

.field private readAnnotations:Z

.field private final strings:[Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Z)V
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-boolean p2, p0, Lcom/alibaba/fastjson/asm/ClassReader;->readAnnotations:Z

    .line 5
    .line 6
    new-instance p2, Ljava/io/ByteArrayOutputStream;

    .line 7
    .line 8
    invoke-direct {p2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 9
    .line 10
    .line 11
    const/16 v0, 0x400

    .line 12
    .line 13
    new-array v0, v0, [B

    .line 14
    .line 15
    :cond_0
    :goto_0
    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, -0x1

    .line 20
    const/4 v3, 0x0

    .line 21
    if-ne v1, v2, :cond_7

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iput-object p1, p0, Lcom/alibaba/fastjson/asm/ClassReader;->b:[B

    .line 31
    .line 32
    const/16 p1, 0x8

    .line 33
    .line 34
    invoke-direct {p0, p1}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    new-array p1, p1, [I

    .line 39
    .line 40
    iput-object p1, p0, Lcom/alibaba/fastjson/asm/ClassReader;->items:[I

    .line 41
    .line 42
    array-length p1, p1

    .line 43
    new-array p2, p1, [Ljava/lang/String;

    .line 44
    .line 45
    iput-object p2, p0, Lcom/alibaba/fastjson/asm/ClassReader;->strings:[Ljava/lang/String;

    .line 46
    .line 47
    const/4 p2, 0x1

    .line 48
    const/16 v0, 0xa

    .line 49
    .line 50
    move v1, p2

    .line 51
    :goto_1
    if-ge v1, p1, :cond_6

    .line 52
    .line 53
    iget-object v2, p0, Lcom/alibaba/fastjson/asm/ClassReader;->items:[I

    .line 54
    .line 55
    add-int/lit8 v4, v0, 0x1

    .line 56
    .line 57
    aput v4, v2, v1

    .line 58
    .line 59
    iget-object v2, p0, Lcom/alibaba/fastjson/asm/ClassReader;->b:[B

    .line 60
    .line 61
    aget-byte v2, v2, v0

    .line 62
    .line 63
    const/4 v5, 0x3

    .line 64
    if-eq v2, p2, :cond_4

    .line 65
    .line 66
    const/16 v4, 0xf

    .line 67
    .line 68
    const/4 v6, 0x4

    .line 69
    if-eq v2, v4, :cond_3

    .line 70
    .line 71
    const/16 v4, 0x12

    .line 72
    .line 73
    const/4 v7, 0x5

    .line 74
    if-eq v2, v4, :cond_2

    .line 75
    .line 76
    if-eq v2, v5, :cond_2

    .line 77
    .line 78
    if-eq v2, v6, :cond_2

    .line 79
    .line 80
    if-eq v2, v7, :cond_1

    .line 81
    .line 82
    const/4 v4, 0x6

    .line 83
    if-eq v2, v4, :cond_1

    .line 84
    .line 85
    packed-switch v2, :pswitch_data_0

    .line 86
    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 90
    .line 91
    const/16 v5, 0x9

    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_2
    :pswitch_0
    move v5, v7

    .line 95
    goto :goto_2

    .line 96
    :cond_3
    move v5, v6

    .line 97
    goto :goto_2

    .line 98
    :cond_4
    invoke-direct {p0, v4}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    add-int/2addr v5, v2

    .line 103
    if-le v5, v3, :cond_5

    .line 104
    .line 105
    move v3, v5

    .line 106
    :cond_5
    :goto_2
    add-int/2addr v0, v5

    .line 107
    add-int/2addr v1, p2

    .line 108
    goto :goto_1

    .line 109
    :cond_6
    iput v3, p0, Lcom/alibaba/fastjson/asm/ClassReader;->maxStringLength:I

    .line 110
    .line 111
    iput v0, p0, Lcom/alibaba/fastjson/asm/ClassReader;->header:I

    .line 112
    .line 113
    return-void

    .line 114
    :cond_7
    if-lez v1, :cond_0

    .line 115
    .line 116
    invoke-virtual {p2, v0, v3, v1}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    nop

    .line 121
    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method private getAttributes()I
    .locals 4

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/asm/ClassReader;->header:I

    .line 2
    .line 3
    add-int/lit8 v1, v0, 0x8

    .line 4
    .line 5
    add-int/lit8 v0, v0, 0x6

    .line 6
    .line 7
    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    mul-int/lit8 v0, v0, 0x2

    .line 12
    .line 13
    add-int/2addr v1, v0

    .line 14
    invoke-direct {p0, v1}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    :goto_0
    if-lez v0, :cond_1

    .line 19
    .line 20
    add-int/lit8 v2, v1, 0x8

    .line 21
    .line 22
    invoke-direct {p0, v2}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    :goto_1
    if-lez v2, :cond_0

    .line 27
    .line 28
    add-int/lit8 v3, v1, 0xc

    .line 29
    .line 30
    invoke-direct {p0, v3}, Lcom/alibaba/fastjson/asm/ClassReader;->readInt(I)I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    add-int/lit8 v3, v3, 0x6

    .line 35
    .line 36
    add-int/2addr v1, v3

    .line 37
    add-int/lit8 v2, v2, -0x1

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_0
    add-int/lit8 v1, v1, 0x8

    .line 41
    .line 42
    add-int/lit8 v0, v0, -0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_1
    add-int/lit8 v1, v1, 0x2

    .line 46
    .line 47
    invoke-direct {p0, v1}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    :goto_2
    if-lez v0, :cond_3

    .line 52
    .line 53
    add-int/lit8 v2, v1, 0x8

    .line 54
    .line 55
    invoke-direct {p0, v2}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    :goto_3
    if-lez v2, :cond_2

    .line 60
    .line 61
    add-int/lit8 v3, v1, 0xc

    .line 62
    .line 63
    invoke-direct {p0, v3}, Lcom/alibaba/fastjson/asm/ClassReader;->readInt(I)I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    add-int/lit8 v3, v3, 0x6

    .line 68
    .line 69
    add-int/2addr v1, v3

    .line 70
    add-int/lit8 v2, v2, -0x1

    .line 71
    .line 72
    goto :goto_3

    .line 73
    :cond_2
    add-int/lit8 v1, v1, 0x8

    .line 74
    .line 75
    add-int/lit8 v0, v0, -0x1

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_3
    add-int/lit8 v1, v1, 0x2

    .line 79
    .line 80
    return v1
.end method

.method private readInt(I)I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/asm/ClassReader;->b:[B

    .line 2
    .line 3
    aget-byte v0, p0, p1

    .line 4
    .line 5
    and-int/lit16 v0, v0, 0xff

    .line 6
    .line 7
    shl-int/lit8 v0, v0, 0x18

    .line 8
    .line 9
    add-int/lit8 v1, p1, 0x1

    .line 10
    .line 11
    aget-byte v1, p0, v1

    .line 12
    .line 13
    and-int/lit16 v1, v1, 0xff

    .line 14
    .line 15
    shl-int/lit8 v1, v1, 0x10

    .line 16
    .line 17
    or-int/2addr v0, v1

    .line 18
    add-int/lit8 v1, p1, 0x2

    .line 19
    .line 20
    aget-byte v1, p0, v1

    .line 21
    .line 22
    and-int/lit16 v1, v1, 0xff

    .line 23
    .line 24
    shl-int/lit8 v1, v1, 0x8

    .line 25
    .line 26
    or-int/2addr v0, v1

    .line 27
    add-int/lit8 p1, p1, 0x3

    .line 28
    .line 29
    aget-byte p0, p0, p1

    .line 30
    .line 31
    and-int/lit16 p0, p0, 0xff

    .line 32
    .line 33
    or-int/2addr p0, v0

    .line 34
    return p0
.end method

.method private readMethod(Lcom/alibaba/fastjson/asm/TypeCollector;[CI)I
    .locals 9

    .line 1
    invoke-direct {p0, p3}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v1, p3, 0x2

    .line 6
    .line 7
    invoke-direct {p0, v1, p2}, Lcom/alibaba/fastjson/asm/ClassReader;->readUTF8(I[C)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    add-int/lit8 v2, p3, 0x4

    .line 12
    .line 13
    invoke-direct {p0, v2, p2}, Lcom/alibaba/fastjson/asm/ClassReader;->readUTF8(I[C)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    add-int/lit8 v3, p3, 0x6

    .line 18
    .line 19
    invoke-direct {p0, v3}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    add-int/lit8 p3, p3, 0x8

    .line 24
    .line 25
    const/4 v4, 0x0

    .line 26
    move v5, v4

    .line 27
    :goto_0
    if-lez v3, :cond_1

    .line 28
    .line 29
    invoke-direct {p0, p3, p2}, Lcom/alibaba/fastjson/asm/ClassReader;->readUTF8(I[C)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    add-int/lit8 v7, p3, 0x2

    .line 34
    .line 35
    invoke-direct {p0, v7}, Lcom/alibaba/fastjson/asm/ClassReader;->readInt(I)I

    .line 36
    .line 37
    .line 38
    move-result v7

    .line 39
    add-int/lit8 p3, p3, 0x6

    .line 40
    .line 41
    const-string v8, "Code"

    .line 42
    .line 43
    invoke-virtual {v6, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    if-eqz v6, :cond_0

    .line 48
    .line 49
    move v5, p3

    .line 50
    :cond_0
    add-int/2addr p3, v7

    .line 51
    add-int/lit8 v3, v3, -0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    invoke-virtual {p1, v0, v1, v2}, Lcom/alibaba/fastjson/asm/TypeCollector;->visitMethod(ILjava/lang/String;Ljava/lang/String;)Lcom/alibaba/fastjson/asm/MethodCollector;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    if-eqz p1, :cond_7

    .line 59
    .line 60
    if-eqz v5, :cond_7

    .line 61
    .line 62
    add-int/lit8 v0, v5, 0x4

    .line 63
    .line 64
    invoke-direct {p0, v0}, Lcom/alibaba/fastjson/asm/ClassReader;->readInt(I)I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    add-int/lit8 v5, v5, 0x8

    .line 69
    .line 70
    add-int/2addr v5, v0

    .line 71
    invoke-direct {p0, v5}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/lit8 v5, v5, 0x2

    .line 76
    .line 77
    :goto_1
    if-lez v0, :cond_2

    .line 78
    .line 79
    add-int/lit8 v5, v5, 0x8

    .line 80
    .line 81
    add-int/lit8 v0, v0, -0x1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_2
    invoke-direct {p0, v5}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/lit8 v5, v5, 0x2

    .line 89
    .line 90
    move v1, v4

    .line 91
    :goto_2
    if-lez v0, :cond_5

    .line 92
    .line 93
    invoke-direct {p0, v5, p2}, Lcom/alibaba/fastjson/asm/ClassReader;->readUTF8(I[C)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    const-string v3, "LocalVariableTable"

    .line 98
    .line 99
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v3

    .line 103
    if-eqz v3, :cond_3

    .line 104
    .line 105
    add-int/lit8 v2, v5, 0x6

    .line 106
    .line 107
    move v4, v2

    .line 108
    goto :goto_3

    .line 109
    :cond_3
    const-string v3, "LocalVariableTypeTable"

    .line 110
    .line 111
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-eqz v2, :cond_4

    .line 116
    .line 117
    add-int/lit8 v1, v5, 0x6

    .line 118
    .line 119
    :cond_4
    :goto_3
    add-int/lit8 v2, v5, 0x2

    .line 120
    .line 121
    invoke-direct {p0, v2}, Lcom/alibaba/fastjson/asm/ClassReader;->readInt(I)I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    add-int/lit8 v2, v2, 0x6

    .line 126
    .line 127
    add-int/2addr v5, v2

    .line 128
    add-int/lit8 v0, v0, -0x1

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_5
    if-eqz v4, :cond_7

    .line 132
    .line 133
    if-eqz v1, :cond_6

    .line 134
    .line 135
    invoke-direct {p0, v1}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    mul-int/lit8 v0, v0, 0x3

    .line 140
    .line 141
    add-int/lit8 v1, v1, 0x2

    .line 142
    .line 143
    new-array v2, v0, [I

    .line 144
    .line 145
    :goto_4
    if-lez v0, :cond_6

    .line 146
    .line 147
    add-int/lit8 v3, v0, -0x1

    .line 148
    .line 149
    add-int/lit8 v5, v1, 0x6

    .line 150
    .line 151
    aput v5, v2, v3

    .line 152
    .line 153
    add-int/lit8 v3, v0, -0x2

    .line 154
    .line 155
    add-int/lit8 v5, v1, 0x8

    .line 156
    .line 157
    invoke-direct {p0, v5}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 158
    .line 159
    .line 160
    move-result v5

    .line 161
    aput v5, v2, v3

    .line 162
    .line 163
    add-int/lit8 v0, v0, -0x3

    .line 164
    .line 165
    invoke-direct {p0, v1}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    aput v3, v2, v0

    .line 170
    .line 171
    add-int/lit8 v1, v1, 0xa

    .line 172
    .line 173
    goto :goto_4

    .line 174
    :cond_6
    invoke-direct {p0, v4}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    add-int/lit8 v4, v4, 0x2

    .line 179
    .line 180
    :goto_5
    if-lez v0, :cond_7

    .line 181
    .line 182
    add-int/lit8 v1, v4, 0x8

    .line 183
    .line 184
    invoke-direct {p0, v1}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    add-int/lit8 v2, v4, 0x4

    .line 189
    .line 190
    invoke-direct {p0, v2, p2}, Lcom/alibaba/fastjson/asm/ClassReader;->readUTF8(I[C)Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    invoke-virtual {p1, v2, v1}, Lcom/alibaba/fastjson/asm/MethodCollector;->visitLocalVariable(Ljava/lang/String;I)V

    .line 195
    .line 196
    .line 197
    add-int/lit8 v4, v4, 0xa

    .line 198
    .line 199
    add-int/lit8 v0, v0, -0x1

    .line 200
    .line 201
    goto :goto_5

    .line 202
    :cond_7
    return p3
.end method

.method private readUTF(II[C)Ljava/lang/String;
    .locals 9

    .line 1
    add-int/2addr p2, p1

    .line 2
    iget-object p0, p0, Lcom/alibaba/fastjson/asm/ClassReader;->b:[B

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    move v1, v0

    .line 6
    move v2, v1

    .line 7
    move v3, v2

    .line 8
    :goto_0
    if-ge p1, p2, :cond_5

    .line 9
    .line 10
    add-int/lit8 v4, p1, 0x1

    .line 11
    .line 12
    aget-byte p1, p0, p1

    .line 13
    .line 14
    const/4 v5, 0x2

    .line 15
    const/4 v6, 0x1

    .line 16
    if-eqz v2, :cond_2

    .line 17
    .line 18
    if-eq v2, v6, :cond_1

    .line 19
    .line 20
    if-eq v2, v5, :cond_0

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_0
    shl-int/lit8 v2, v3, 0x6

    .line 24
    .line 25
    and-int/lit8 p1, p1, 0x3f

    .line 26
    .line 27
    or-int/2addr p1, v2

    .line 28
    :goto_1
    int-to-char v3, p1

    .line 29
    move v2, v6

    .line 30
    goto :goto_2

    .line 31
    :cond_1
    add-int/lit8 v2, v1, 0x1

    .line 32
    .line 33
    shl-int/lit8 v5, v3, 0x6

    .line 34
    .line 35
    and-int/lit8 p1, p1, 0x3f

    .line 36
    .line 37
    or-int/2addr p1, v5

    .line 38
    int-to-char p1, p1

    .line 39
    aput-char p1, p3, v1

    .line 40
    .line 41
    move v1, v2

    .line 42
    move v2, v0

    .line 43
    goto :goto_2

    .line 44
    :cond_2
    and-int/lit16 v7, p1, 0xff

    .line 45
    .line 46
    const/16 v8, 0x80

    .line 47
    .line 48
    if-ge v7, v8, :cond_3

    .line 49
    .line 50
    add-int/lit8 p1, v1, 0x1

    .line 51
    .line 52
    int-to-char v5, v7

    .line 53
    aput-char v5, p3, v1

    .line 54
    .line 55
    move v1, p1

    .line 56
    goto :goto_2

    .line 57
    :cond_3
    const/16 v2, 0xe0

    .line 58
    .line 59
    if-ge v7, v2, :cond_4

    .line 60
    .line 61
    const/16 v2, 0xbf

    .line 62
    .line 63
    if-le v7, v2, :cond_4

    .line 64
    .line 65
    and-int/lit8 p1, p1, 0x1f

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_4
    and-int/lit8 p1, p1, 0xf

    .line 69
    .line 70
    int-to-char v3, p1

    .line 71
    move v2, v5

    .line 72
    :goto_2
    move p1, v4

    .line 73
    goto :goto_0

    .line 74
    :cond_5
    new-instance p0, Ljava/lang/String;

    .line 75
    .line 76
    invoke-direct {p0, p3, v0, v1}, Ljava/lang/String;-><init>([CII)V

    .line 77
    .line 78
    .line 79
    return-object p0
.end method

.method private readUTF8(I[C)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-direct {p0, p1}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    iget-object v0, p0, Lcom/alibaba/fastjson/asm/ClassReader;->strings:[Ljava/lang/String;

    .line 6
    .line 7
    aget-object v1, v0, p1

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    iget-object v1, p0, Lcom/alibaba/fastjson/asm/ClassReader;->items:[I

    .line 13
    .line 14
    aget v1, v1, p1

    .line 15
    .line 16
    add-int/lit8 v2, v1, 0x2

    .line 17
    .line 18
    invoke-direct {p0, v1}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-direct {p0, v2, v1, p2}, Lcom/alibaba/fastjson/asm/ClassReader;->readUTF(II[C)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    aput-object p0, v0, p1

    .line 27
    .line 28
    return-object p0
.end method

.method private readUnsignedShort(I)I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/asm/ClassReader;->b:[B

    .line 2
    .line 3
    aget-byte v0, p0, p1

    .line 4
    .line 5
    and-int/lit16 v0, v0, 0xff

    .line 6
    .line 7
    shl-int/lit8 v0, v0, 0x8

    .line 8
    .line 9
    add-int/lit8 p1, p1, 0x1

    .line 10
    .line 11
    aget-byte p0, p0, p1

    .line 12
    .line 13
    and-int/lit16 p0, p0, 0xff

    .line 14
    .line 15
    or-int/2addr p0, v0

    .line 16
    return p0
.end method


# virtual methods
.method public accept(Lcom/alibaba/fastjson/asm/TypeCollector;)V
    .locals 8

    .line 1
    iget v0, p0, Lcom/alibaba/fastjson/asm/ClassReader;->maxStringLength:I

    .line 2
    .line 3
    new-array v0, v0, [C

    .line 4
    .line 5
    iget-boolean v1, p0, Lcom/alibaba/fastjson/asm/ClassReader;->readAnnotations:Z

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_1

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/alibaba/fastjson/asm/ClassReader;->getAttributes()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-direct {p0, v1}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    :goto_0
    if-lez v3, :cond_1

    .line 19
    .line 20
    add-int/lit8 v4, v1, 0x2

    .line 21
    .line 22
    invoke-direct {p0, v4, v0}, Lcom/alibaba/fastjson/asm/ClassReader;->readUTF8(I[C)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    const-string v5, "RuntimeVisibleAnnotations"

    .line 27
    .line 28
    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v4

    .line 32
    if-eqz v4, :cond_0

    .line 33
    .line 34
    add-int/lit8 v1, v1, 0x8

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    add-int/lit8 v4, v1, 0x4

    .line 38
    .line 39
    invoke-direct {p0, v4}, Lcom/alibaba/fastjson/asm/ClassReader;->readInt(I)I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    add-int/lit8 v4, v4, 0x6

    .line 44
    .line 45
    add-int/2addr v1, v4

    .line 46
    add-int/lit8 v3, v3, -0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_1
    move v1, v2

    .line 50
    :goto_1
    iget v3, p0, Lcom/alibaba/fastjson/asm/ClassReader;->header:I

    .line 51
    .line 52
    iget-object v4, p0, Lcom/alibaba/fastjson/asm/ClassReader;->items:[I

    .line 53
    .line 54
    add-int/lit8 v5, v3, 0x4

    .line 55
    .line 56
    invoke-direct {p0, v5}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    aget v4, v4, v5

    .line 61
    .line 62
    add-int/lit8 v4, v3, 0x6

    .line 63
    .line 64
    invoke-direct {p0, v4}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 65
    .line 66
    .line 67
    move-result v4

    .line 68
    add-int/lit8 v3, v3, 0x8

    .line 69
    .line 70
    :goto_2
    if-ge v2, v4, :cond_2

    .line 71
    .line 72
    add-int/lit8 v3, v3, 0x2

    .line 73
    .line 74
    add-int/lit8 v2, v2, 0x1

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_2
    invoke-direct {p0, v3}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    add-int/lit8 v4, v3, 0x2

    .line 82
    .line 83
    move v5, v4

    .line 84
    :goto_3
    if-lez v2, :cond_4

    .line 85
    .line 86
    add-int/lit8 v6, v5, 0x6

    .line 87
    .line 88
    invoke-direct {p0, v6}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    add-int/lit8 v5, v5, 0x8

    .line 93
    .line 94
    :goto_4
    if-lez v6, :cond_3

    .line 95
    .line 96
    add-int/lit8 v7, v5, 0x2

    .line 97
    .line 98
    invoke-direct {p0, v7}, Lcom/alibaba/fastjson/asm/ClassReader;->readInt(I)I

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    add-int/lit8 v7, v7, 0x6

    .line 103
    .line 104
    add-int/2addr v5, v7

    .line 105
    add-int/lit8 v6, v6, -0x1

    .line 106
    .line 107
    goto :goto_4

    .line 108
    :cond_3
    add-int/lit8 v2, v2, -0x1

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_4
    invoke-direct {p0, v5}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    add-int/lit8 v5, v5, 0x2

    .line 116
    .line 117
    :goto_5
    if-lez v2, :cond_6

    .line 118
    .line 119
    add-int/lit8 v6, v5, 0x6

    .line 120
    .line 121
    invoke-direct {p0, v6}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    add-int/lit8 v5, v5, 0x8

    .line 126
    .line 127
    :goto_6
    if-lez v6, :cond_5

    .line 128
    .line 129
    add-int/lit8 v7, v5, 0x2

    .line 130
    .line 131
    invoke-direct {p0, v7}, Lcom/alibaba/fastjson/asm/ClassReader;->readInt(I)I

    .line 132
    .line 133
    .line 134
    move-result v7

    .line 135
    add-int/lit8 v7, v7, 0x6

    .line 136
    .line 137
    add-int/2addr v5, v7

    .line 138
    add-int/lit8 v6, v6, -0x1

    .line 139
    .line 140
    goto :goto_6

    .line 141
    :cond_5
    add-int/lit8 v2, v2, -0x1

    .line 142
    .line 143
    goto :goto_5

    .line 144
    :cond_6
    invoke-direct {p0, v5}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    add-int/lit8 v5, v5, 0x2

    .line 149
    .line 150
    :goto_7
    if-lez v2, :cond_7

    .line 151
    .line 152
    add-int/lit8 v6, v5, 0x2

    .line 153
    .line 154
    invoke-direct {p0, v6}, Lcom/alibaba/fastjson/asm/ClassReader;->readInt(I)I

    .line 155
    .line 156
    .line 157
    move-result v6

    .line 158
    add-int/lit8 v6, v6, 0x6

    .line 159
    .line 160
    add-int/2addr v5, v6

    .line 161
    add-int/lit8 v2, v2, -0x1

    .line 162
    .line 163
    goto :goto_7

    .line 164
    :cond_7
    if-eqz v1, :cond_8

    .line 165
    .line 166
    invoke-direct {p0, v1}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 167
    .line 168
    .line 169
    move-result v2

    .line 170
    add-int/lit8 v1, v1, 0x2

    .line 171
    .line 172
    :goto_8
    if-lez v2, :cond_8

    .line 173
    .line 174
    invoke-direct {p0, v1, v0}, Lcom/alibaba/fastjson/asm/ClassReader;->readUTF8(I[C)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v5

    .line 178
    invoke-virtual {p1, v5}, Lcom/alibaba/fastjson/asm/TypeCollector;->visitAnnotation(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    add-int/lit8 v2, v2, -0x1

    .line 182
    .line 183
    goto :goto_8

    .line 184
    :cond_8
    invoke-direct {p0, v3}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    :goto_9
    if-lez v1, :cond_a

    .line 189
    .line 190
    add-int/lit8 v2, v4, 0x6

    .line 191
    .line 192
    invoke-direct {p0, v2}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    add-int/lit8 v4, v4, 0x8

    .line 197
    .line 198
    :goto_a
    if-lez v2, :cond_9

    .line 199
    .line 200
    add-int/lit8 v3, v4, 0x2

    .line 201
    .line 202
    invoke-direct {p0, v3}, Lcom/alibaba/fastjson/asm/ClassReader;->readInt(I)I

    .line 203
    .line 204
    .line 205
    move-result v3

    .line 206
    add-int/lit8 v3, v3, 0x6

    .line 207
    .line 208
    add-int/2addr v4, v3

    .line 209
    add-int/lit8 v2, v2, -0x1

    .line 210
    .line 211
    goto :goto_a

    .line 212
    :cond_9
    add-int/lit8 v1, v1, -0x1

    .line 213
    .line 214
    goto :goto_9

    .line 215
    :cond_a
    invoke-direct {p0, v4}, Lcom/alibaba/fastjson/asm/ClassReader;->readUnsignedShort(I)I

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    add-int/lit8 v4, v4, 0x2

    .line 220
    .line 221
    :goto_b
    if-lez v1, :cond_b

    .line 222
    .line 223
    invoke-direct {p0, p1, v0, v4}, Lcom/alibaba/fastjson/asm/ClassReader;->readMethod(Lcom/alibaba/fastjson/asm/TypeCollector;[CI)I

    .line 224
    .line 225
    .line 226
    move-result v4

    .line 227
    add-int/lit8 v1, v1, -0x1

    .line 228
    .line 229
    goto :goto_b

    .line 230
    :cond_b
    return-void
.end method
