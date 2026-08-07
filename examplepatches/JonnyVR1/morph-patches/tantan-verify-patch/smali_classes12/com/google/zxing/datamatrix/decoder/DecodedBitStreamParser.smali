.class public final Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    }
.end annotation


# static fields
.field public static final a:[C

.field public static final b:[C

.field public static final c:[C

.field public static final d:[C

.field public static final e:[C


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/16 v0, 0x28

    .line 2
    .line 3
    new-array v1, v0, [C

    .line 4
    .line 5
    fill-array-data v1, :array_0

    .line 6
    .line 7
    .line 8
    sput-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->a:[C

    .line 9
    .line 10
    const/16 v1, 0x1b

    .line 11
    .line 12
    new-array v1, v1, [C

    .line 13
    .line 14
    fill-array-data v1, :array_1

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->b:[C

    .line 18
    .line 19
    new-array v0, v0, [C

    .line 20
    .line 21
    fill-array-data v0, :array_2

    .line 22
    .line 23
    .line 24
    sput-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->c:[C

    .line 25
    .line 26
    sput-object v1, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->d:[C

    .line 27
    .line 28
    const/16 v0, 0x20

    .line 29
    .line 30
    new-array v0, v0, [C

    .line 31
    .line 32
    fill-array-data v0, :array_3

    .line 33
    .line 34
    .line 35
    sput-object v0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->e:[C

    .line 36
    .line 37
    return-void

    .line 38
    nop

    .line 39
    :array_0
    .array-data 2
        0x2as
        0x2as
        0x2as
        0x20s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
    .end array-data

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    .line 67
    .line 68
    .line 69
    .line 70
    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    .line 76
    .line 77
    .line 78
    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    :array_1
    .array-data 2
        0x21s
        0x22s
        0x23s
        0x24s
        0x25s
        0x26s
        0x27s
        0x28s
        0x29s
        0x2as
        0x2bs
        0x2cs
        0x2ds
        0x2es
        0x2fs
        0x3as
        0x3bs
        0x3cs
        0x3ds
        0x3es
        0x3fs
        0x40s
        0x5bs
        0x5cs
        0x5ds
        0x5es
        0x5fs
    .end array-data

    .line 84
    .line 85
    .line 86
    .line 87
    .line 88
    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    .line 99
    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    .line 105
    .line 106
    .line 107
    .line 108
    .line 109
    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    nop

    .line 115
    :array_2
    .array-data 2
        0x2as
        0x2as
        0x2as
        0x20s
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
        0x67s
        0x68s
        0x69s
        0x6as
        0x6bs
        0x6cs
        0x6ds
        0x6es
        0x6fs
        0x70s
        0x71s
        0x72s
        0x73s
        0x74s
        0x75s
        0x76s
        0x77s
        0x78s
        0x79s
        0x7as
    .end array-data

    .line 116
    .line 117
    .line 118
    .line 119
    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    .line 128
    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    :array_3
    .array-data 2
        0x60s
        0x41s
        0x42s
        0x43s
        0x44s
        0x45s
        0x46s
        0x47s
        0x48s
        0x49s
        0x4as
        0x4bs
        0x4cs
        0x4ds
        0x4es
        0x4fs
        0x50s
        0x51s
        0x52s
        0x53s
        0x54s
        0x55s
        0x56s
        0x57s
        0x58s
        0x59s
        0x5as
        0x7bs
        0x7cs
        0x7ds
        0x7es
        0x7fs
    .end array-data
.end method

.method public static a([B)Ll/mid;
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/h13;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/h13;-><init>([B)V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const/16 v2, 0x64

    .line 9
    .line 10
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 11
    .line 12
    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 17
    .line 18
    .line 19
    new-instance v3, Ljava/util/ArrayList;

    .line 20
    .line 21
    const/4 v4, 0x1

    .line 22
    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 23
    .line 24
    .line 25
    sget-object v5, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 26
    .line 27
    :cond_0
    sget-object v6, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 28
    .line 29
    if-ne v5, v6, :cond_1

    .line 30
    .line 31
    invoke-static {v0, v1, v2}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->c(Ll/h13;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;)Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    goto :goto_1

    .line 36
    :cond_1
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$a;->a:[I

    .line 37
    .line 38
    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    aget v5, v7, v5

    .line 43
    .line 44
    if-eq v5, v4, :cond_6

    .line 45
    .line 46
    const/4 v7, 0x2

    .line 47
    if-eq v5, v7, :cond_5

    .line 48
    .line 49
    const/4 v7, 0x3

    .line 50
    if-eq v5, v7, :cond_4

    .line 51
    .line 52
    const/4 v7, 0x4

    .line 53
    if-eq v5, v7, :cond_3

    .line 54
    .line 55
    const/4 v7, 0x5

    .line 56
    if-ne v5, v7, :cond_2

    .line 57
    .line 58
    invoke-static {v0, v1, v3}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->d(Ll/h13;Ljava/lang/StringBuilder;Ljava/util/Collection;)V

    .line 59
    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_2
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    throw p0

    .line 67
    :cond_3
    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->f(Ll/h13;Ljava/lang/StringBuilder;)V

    .line 68
    .line 69
    .line 70
    goto :goto_0

    .line 71
    :cond_4
    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->b(Ll/h13;Ljava/lang/StringBuilder;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_5
    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->g(Ll/h13;Ljava/lang/StringBuilder;)V

    .line 76
    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_6
    invoke-static {v0, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->e(Ll/h13;Ljava/lang/StringBuilder;)V

    .line 80
    .line 81
    .line 82
    :goto_0
    move-object v5, v6

    .line 83
    :goto_1
    sget-object v6, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->PAD_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 84
    .line 85
    if-eq v5, v6, :cond_7

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/h13;->a()I

    .line 88
    .line 89
    .line 90
    move-result v6

    .line 91
    if-gtz v6, :cond_0

    .line 92
    .line 93
    :cond_7
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-lez v0, :cond_8

    .line 98
    .line 99
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/CharSequence;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    :cond_8
    new-instance v0, Ll/mid;

    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 109
    .line 110
    .line 111
    move-result v2

    .line 112
    const/4 v4, 0x0

    .line 113
    if-eqz v2, :cond_9

    .line 114
    .line 115
    move-object v3, v4

    .line 116
    :cond_9
    invoke-direct {v0, p0, v1, v3, v4}, Ll/mid;-><init>([BLjava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    .line 117
    .line 118
    .line 119
    return-object v0
.end method

.method public static b(Ll/h13;Ljava/lang/StringBuilder;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    :cond_0
    invoke-virtual {p0}, Ll/h13;->a()I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    const/16 v3, 0x8

    .line 9
    .line 10
    if-ne v2, v3, :cond_1

    .line 11
    .line 12
    goto :goto_2

    .line 13
    :cond_1
    invoke-virtual {p0, v3}, Ll/h13;->d(I)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/16 v4, 0xfe

    .line 18
    .line 19
    if-ne v2, v4, :cond_2

    .line 20
    .line 21
    goto :goto_2

    .line 22
    :cond_2
    invoke-virtual {p0, v3}, Ll/h13;->d(I)I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-static {v2, v3, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->h(II[I)V

    .line 27
    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    :goto_0
    if-ge v2, v0, :cond_9

    .line 31
    .line 32
    aget v3, v1, v2

    .line 33
    .line 34
    if-eqz v3, :cond_8

    .line 35
    .line 36
    const/4 v4, 0x1

    .line 37
    if-eq v3, v4, :cond_7

    .line 38
    .line 39
    const/4 v4, 0x2

    .line 40
    if-eq v3, v4, :cond_6

    .line 41
    .line 42
    if-eq v3, v0, :cond_5

    .line 43
    .line 44
    const/16 v4, 0xe

    .line 45
    .line 46
    if-ge v3, v4, :cond_3

    .line 47
    .line 48
    add-int/lit8 v3, v3, 0x2c

    .line 49
    .line 50
    int-to-char v3, v3

    .line 51
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_3
    const/16 v4, 0x28

    .line 56
    .line 57
    if-ge v3, v4, :cond_4

    .line 58
    .line 59
    add-int/lit8 v3, v3, 0x33

    .line 60
    .line 61
    int-to-char v3, v3

    .line 62
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_4
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    throw p0

    .line 71
    :cond_5
    const/16 v3, 0x20

    .line 72
    .line 73
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_6
    const/16 v3, 0x3e

    .line 78
    .line 79
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_7
    const/16 v3, 0x2a

    .line 84
    .line 85
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_8
    const/16 v3, 0xd

    .line 90
    .line 91
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_9
    invoke-virtual {p0}, Ll/h13;->a()I

    .line 98
    .line 99
    .line 100
    move-result v2

    .line 101
    if-gtz v2, :cond_0

    .line 102
    .line 103
    :goto_2
    return-void
.end method

.method public static c(Ll/h13;Ljava/lang/StringBuilder;Ljava/lang/StringBuilder;)Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :cond_0
    const/16 v2, 0x8

    .line 4
    .line 5
    invoke-virtual {p0, v2}, Ll/h13;->d(I)I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-eqz v2, :cond_7

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    const/16 v4, 0x80

    .line 13
    .line 14
    if-gt v2, v4, :cond_2

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    add-int/lit16 v2, v2, 0x80

    .line 19
    .line 20
    :cond_1
    sub-int/2addr v2, v3

    .line 21
    int-to-char p0, v2

    .line 22
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    sget-object p0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    const/16 v4, 0x81

    .line 29
    .line 30
    if-ne v2, v4, :cond_3

    .line 31
    .line 32
    sget-object p0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->PAD_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 33
    .line 34
    return-object p0

    .line 35
    :cond_3
    const/16 v4, 0xe5

    .line 36
    .line 37
    if-gt v2, v4, :cond_5

    .line 38
    .line 39
    add-int/lit16 v2, v2, -0x82

    .line 40
    .line 41
    const/16 v3, 0xa

    .line 42
    .line 43
    if-ge v2, v3, :cond_4

    .line 44
    .line 45
    const/16 v3, 0x30

    .line 46
    .line 47
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    :cond_4
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_5
    const-string v4, "\u001e\u0004"

    .line 55
    .line 56
    packed-switch v2, :pswitch_data_0

    .line 57
    .line 58
    .line 59
    const/16 v3, 0xfe

    .line 60
    .line 61
    if-ne v2, v3, :cond_6

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/h13;->a()I

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-nez v2, :cond_6

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_6
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    throw p0

    .line 75
    :pswitch_0
    sget-object p0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->EDIFACT_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 76
    .line 77
    return-object p0

    .line 78
    :pswitch_1
    sget-object p0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->TEXT_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 79
    .line 80
    return-object p0

    .line 81
    :pswitch_2
    sget-object p0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ANSIX12_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 82
    .line 83
    return-object p0

    .line 84
    :pswitch_3
    const-string v2, "[)>\u001e06\u001d"

    .line 85
    .line 86
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {p2, v0, v4}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    goto :goto_0

    .line 93
    :pswitch_4
    const-string v2, "[)>\u001e05\u001d"

    .line 94
    .line 95
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p2, v0, v4}, Ljava/lang/StringBuilder;->insert(ILjava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    goto :goto_0

    .line 102
    :pswitch_5
    move v1, v3

    .line 103
    goto :goto_0

    .line 104
    :pswitch_6
    const/16 v2, 0x1d

    .line 105
    .line 106
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    :goto_0
    :pswitch_7
    invoke-virtual {p0}, Ll/h13;->a()I

    .line 110
    .line 111
    .line 112
    move-result v2

    .line 113
    if-gtz v2, :cond_0

    .line 114
    .line 115
    sget-object p0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->ASCII_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 116
    .line 117
    return-object p0

    .line 118
    :pswitch_8
    sget-object p0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->BASE256_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 119
    .line 120
    return-object p0

    .line 121
    :pswitch_9
    sget-object p0, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;->C40_ENCODE:Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser$Mode;

    .line 122
    .line 123
    return-object p0

    .line 124
    :cond_7
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 125
    .line 126
    .line 127
    move-result-object p0

    .line 128
    throw p0

    .line 129
    :pswitch_data_0
    .packed-switch 0xe6
        :pswitch_9
        :pswitch_8
        :pswitch_6
        :pswitch_7
        :pswitch_7
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_7
    .end packed-switch
.end method

.method public static d(Ll/h13;Ljava/lang/StringBuilder;Ljava/util/Collection;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/h13;",
            "Ljava/lang/StringBuilder;",
            "Ljava/util/Collection<",
            "[B>;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/h13;->c()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v1, v0, 0x1

    .line 6
    .line 7
    const/16 v2, 0x8

    .line 8
    .line 9
    invoke-virtual {p0, v2}, Ll/h13;->d(I)I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    add-int/lit8 v4, v0, 0x2

    .line 14
    .line 15
    invoke-static {v3, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->i(II)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/h13;->a()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    div-int/lit8 v1, v0, 0x8

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/16 v3, 0xfa

    .line 29
    .line 30
    if-ge v1, v3, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    add-int/lit16 v1, v1, -0xf9

    .line 34
    .line 35
    mul-int/2addr v1, v3

    .line 36
    invoke-virtual {p0, v2}, Ll/h13;->d(I)I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    add-int/lit8 v0, v0, 0x3

    .line 41
    .line 42
    invoke-static {v3, v4}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->i(II)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    add-int/2addr v1, v3

    .line 47
    move v4, v0

    .line 48
    :goto_0
    if-ltz v1, :cond_4

    .line 49
    .line 50
    new-array v0, v1, [B

    .line 51
    .line 52
    const/4 v3, 0x0

    .line 53
    :goto_1
    if-ge v3, v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {p0}, Ll/h13;->a()I

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    if-lt v5, v2, :cond_2

    .line 60
    .line 61
    invoke-virtual {p0, v2}, Ll/h13;->d(I)I

    .line 62
    .line 63
    .line 64
    move-result v5

    .line 65
    add-int/lit8 v6, v4, 0x1

    .line 66
    .line 67
    invoke-static {v5, v4}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->i(II)I

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    int-to-byte v4, v4

    .line 72
    aput-byte v4, v0, v3

    .line 73
    .line 74
    add-int/lit8 v3, v3, 0x1

    .line 75
    .line 76
    move v4, v6

    .line 77
    goto :goto_1

    .line 78
    :cond_2
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    throw p0

    .line 83
    :cond_3
    invoke-interface {p2, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    :try_start_0
    new-instance p0, Ljava/lang/String;

    .line 87
    .line 88
    const-string p2, "ISO8859_1"

    .line 89
    .line 90
    invoke-direct {p0, v0, p2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :catch_0
    move-exception p0

    .line 98
    const-string p1, "Platform does not support required encoding: "

    .line 99
    .line 100
    invoke-static {p0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p0

    .line 108
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :cond_4
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    throw p0
.end method

.method public static e(Ll/h13;Ljava/lang/StringBuilder;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    move v3, v2

    .line 6
    move v4, v3

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/h13;->a()I

    .line 8
    .line 9
    .line 10
    move-result v5

    .line 11
    const/16 v6, 0x8

    .line 12
    .line 13
    if-ne v5, v6, :cond_1

    .line 14
    .line 15
    goto/16 :goto_4

    .line 16
    .line 17
    :cond_1
    invoke-virtual {p0, v6}, Ll/h13;->d(I)I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    const/16 v7, 0xfe

    .line 22
    .line 23
    if-ne v5, v7, :cond_2

    .line 24
    .line 25
    goto/16 :goto_4

    .line 26
    .line 27
    :cond_2
    invoke-virtual {p0, v6}, Ll/h13;->d(I)I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    invoke-static {v5, v6, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->h(II[I)V

    .line 32
    .line 33
    .line 34
    move v5, v2

    .line 35
    :goto_0
    if-ge v5, v0, :cond_10

    .line 36
    .line 37
    aget v6, v1, v5

    .line 38
    .line 39
    if-eqz v4, :cond_c

    .line 40
    .line 41
    const/4 v7, 0x1

    .line 42
    if-eq v4, v7, :cond_a

    .line 43
    .line 44
    const/4 v8, 0x2

    .line 45
    if-eq v4, v8, :cond_5

    .line 46
    .line 47
    if-ne v4, v0, :cond_4

    .line 48
    .line 49
    if-eqz v3, :cond_3

    .line 50
    .line 51
    add-int/lit16 v6, v6, 0xe0

    .line 52
    .line 53
    int-to-char v3, v6

    .line 54
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    :goto_1
    move v3, v2

    .line 58
    goto :goto_2

    .line 59
    :cond_3
    add-int/lit8 v6, v6, 0x60

    .line 60
    .line 61
    int-to-char v4, v6

    .line 62
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    :goto_2
    move v4, v2

    .line 66
    goto :goto_3

    .line 67
    :cond_4
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    throw p0

    .line 72
    :cond_5
    sget-object v4, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->b:[C

    .line 73
    .line 74
    array-length v8, v4

    .line 75
    if-ge v6, v8, :cond_7

    .line 76
    .line 77
    aget-char v4, v4, v6

    .line 78
    .line 79
    if-eqz v3, :cond_6

    .line 80
    .line 81
    add-int/lit16 v4, v4, 0x80

    .line 82
    .line 83
    int-to-char v3, v4

    .line 84
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_6
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    goto :goto_2

    .line 92
    :cond_7
    const/16 v4, 0x1b

    .line 93
    .line 94
    if-eq v6, v4, :cond_9

    .line 95
    .line 96
    const/16 v3, 0x1e

    .line 97
    .line 98
    if-ne v6, v3, :cond_8

    .line 99
    .line 100
    move v3, v7

    .line 101
    goto :goto_2

    .line 102
    :cond_8
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    throw p0

    .line 107
    :cond_9
    const/16 v4, 0x1d

    .line 108
    .line 109
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    goto :goto_2

    .line 113
    :cond_a
    if-eqz v3, :cond_b

    .line 114
    .line 115
    add-int/lit16 v6, v6, 0x80

    .line 116
    .line 117
    int-to-char v3, v6

    .line 118
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_b
    int-to-char v4, v6

    .line 123
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    goto :goto_2

    .line 127
    :cond_c
    if-ge v6, v0, :cond_d

    .line 128
    .line 129
    add-int/lit8 v6, v6, 0x1

    .line 130
    .line 131
    move v4, v6

    .line 132
    goto :goto_3

    .line 133
    :cond_d
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->a:[C

    .line 134
    .line 135
    array-length v8, v7

    .line 136
    if-ge v6, v8, :cond_f

    .line 137
    .line 138
    aget-char v6, v7, v6

    .line 139
    .line 140
    if-eqz v3, :cond_e

    .line 141
    .line 142
    add-int/lit16 v6, v6, 0x80

    .line 143
    .line 144
    int-to-char v3, v6

    .line 145
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    move v3, v2

    .line 149
    goto :goto_3

    .line 150
    :cond_e
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    :goto_3
    add-int/lit8 v5, v5, 0x1

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_f
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    throw p0

    .line 161
    :cond_10
    invoke-virtual {p0}, Ll/h13;->a()I

    .line 162
    .line 163
    .line 164
    move-result v5

    .line 165
    if-gtz v5, :cond_0

    .line 166
    .line 167
    :goto_4
    return-void
.end method

.method public static f(Ll/h13;Ljava/lang/StringBuilder;)V
    .locals 3

    .line 1
    :cond_0
    invoke-virtual {p0}, Ll/h13;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x10

    .line 6
    .line 7
    if-gt v0, v1, :cond_1

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_1
    const/4 v0, 0x0

    .line 11
    :goto_0
    const/4 v1, 0x4

    .line 12
    if-ge v0, v1, :cond_4

    .line 13
    .line 14
    const/4 v1, 0x6

    .line 15
    invoke-virtual {p0, v1}, Ll/h13;->d(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/16 v2, 0x1f

    .line 20
    .line 21
    if-ne v1, v2, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0}, Ll/h13;->b()I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    const/16 v0, 0x8

    .line 28
    .line 29
    rsub-int/lit8 p1, p1, 0x8

    .line 30
    .line 31
    if-eq p1, v0, :cond_5

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ll/h13;->d(I)I

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_2
    and-int/lit8 v2, v1, 0x20

    .line 38
    .line 39
    if-nez v2, :cond_3

    .line 40
    .line 41
    or-int/lit8 v1, v1, 0x40

    .line 42
    .line 43
    :cond_3
    int-to-char v1, v1

    .line 44
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    add-int/lit8 v0, v0, 0x1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_4
    invoke-virtual {p0}, Ll/h13;->a()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-gtz v0, :cond_0

    .line 55
    .line 56
    :cond_5
    :goto_1
    return-void
.end method

.method public static g(Ll/h13;Ljava/lang/StringBuilder;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x3

    .line 2
    new-array v1, v0, [I

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    move v3, v2

    .line 6
    move v4, v3

    .line 7
    :cond_0
    invoke-virtual {p0}, Ll/h13;->a()I

    .line 8
    .line 9
    .line 10
    move-result v5

    .line 11
    const/16 v6, 0x8

    .line 12
    .line 13
    if-ne v5, v6, :cond_1

    .line 14
    .line 15
    goto/16 :goto_4

    .line 16
    .line 17
    :cond_1
    invoke-virtual {p0, v6}, Ll/h13;->d(I)I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    const/16 v7, 0xfe

    .line 22
    .line 23
    if-ne v5, v7, :cond_2

    .line 24
    .line 25
    goto/16 :goto_4

    .line 26
    .line 27
    :cond_2
    invoke-virtual {p0, v6}, Ll/h13;->d(I)I

    .line 28
    .line 29
    .line 30
    move-result v6

    .line 31
    invoke-static {v5, v6, v1}, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->h(II[I)V

    .line 32
    .line 33
    .line 34
    move v5, v2

    .line 35
    :goto_0
    if-ge v5, v0, :cond_11

    .line 36
    .line 37
    aget v6, v1, v5

    .line 38
    .line 39
    if-eqz v4, :cond_d

    .line 40
    .line 41
    const/4 v7, 0x1

    .line 42
    if-eq v4, v7, :cond_b

    .line 43
    .line 44
    const/4 v8, 0x2

    .line 45
    if-eq v4, v8, :cond_6

    .line 46
    .line 47
    if-ne v4, v0, :cond_5

    .line 48
    .line 49
    sget-object v4, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->e:[C

    .line 50
    .line 51
    array-length v7, v4

    .line 52
    if-ge v6, v7, :cond_4

    .line 53
    .line 54
    aget-char v4, v4, v6

    .line 55
    .line 56
    if-eqz v3, :cond_3

    .line 57
    .line 58
    add-int/lit16 v4, v4, 0x80

    .line 59
    .line 60
    int-to-char v3, v4

    .line 61
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    :goto_1
    move v3, v2

    .line 65
    goto :goto_2

    .line 66
    :cond_3
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    :goto_2
    move v4, v2

    .line 70
    goto :goto_3

    .line 71
    :cond_4
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    throw p0

    .line 76
    :cond_5
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    throw p0

    .line 81
    :cond_6
    sget-object v4, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->d:[C

    .line 82
    .line 83
    array-length v8, v4

    .line 84
    if-ge v6, v8, :cond_8

    .line 85
    .line 86
    aget-char v4, v4, v6

    .line 87
    .line 88
    if-eqz v3, :cond_7

    .line 89
    .line 90
    add-int/lit16 v4, v4, 0x80

    .line 91
    .line 92
    int-to-char v3, v4

    .line 93
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    goto :goto_1

    .line 97
    :cond_7
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_8
    const/16 v4, 0x1b

    .line 102
    .line 103
    if-eq v6, v4, :cond_a

    .line 104
    .line 105
    const/16 v3, 0x1e

    .line 106
    .line 107
    if-ne v6, v3, :cond_9

    .line 108
    .line 109
    move v3, v7

    .line 110
    goto :goto_2

    .line 111
    :cond_9
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    throw p0

    .line 116
    :cond_a
    const/16 v4, 0x1d

    .line 117
    .line 118
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    goto :goto_2

    .line 122
    :cond_b
    if-eqz v3, :cond_c

    .line 123
    .line 124
    add-int/lit16 v6, v6, 0x80

    .line 125
    .line 126
    int-to-char v3, v6

    .line 127
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_c
    int-to-char v4, v6

    .line 132
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    goto :goto_2

    .line 136
    :cond_d
    if-ge v6, v0, :cond_e

    .line 137
    .line 138
    add-int/lit8 v6, v6, 0x1

    .line 139
    .line 140
    move v4, v6

    .line 141
    goto :goto_3

    .line 142
    :cond_e
    sget-object v7, Lcom/google/zxing/datamatrix/decoder/DecodedBitStreamParser;->c:[C

    .line 143
    .line 144
    array-length v8, v7

    .line 145
    if-ge v6, v8, :cond_10

    .line 146
    .line 147
    aget-char v6, v7, v6

    .line 148
    .line 149
    if-eqz v3, :cond_f

    .line 150
    .line 151
    add-int/lit16 v6, v6, 0x80

    .line 152
    .line 153
    int-to-char v3, v6

    .line 154
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    move v3, v2

    .line 158
    goto :goto_3

    .line 159
    :cond_f
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    :goto_3
    add-int/lit8 v5, v5, 0x1

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_10
    invoke-static {}, Lcom/google/zxing/FormatException;->getFormatInstance()Lcom/google/zxing/FormatException;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    throw p0

    .line 171
    :cond_11
    invoke-virtual {p0}, Ll/h13;->a()I

    .line 172
    .line 173
    .line 174
    move-result v5

    .line 175
    if-gtz v5, :cond_0

    .line 176
    .line 177
    :goto_4
    return-void
.end method

.method public static h(II[I)V
    .locals 2

    .line 1
    shl-int/lit8 p0, p0, 0x8

    .line 2
    .line 3
    add-int/2addr p0, p1

    .line 4
    const/4 p1, 0x1

    .line 5
    sub-int/2addr p0, p1

    .line 6
    div-int/lit16 v0, p0, 0x640

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aput v0, p2, v1

    .line 10
    .line 11
    mul-int/lit16 v0, v0, 0x640

    .line 12
    .line 13
    sub-int/2addr p0, v0

    .line 14
    div-int/lit8 v0, p0, 0x28

    .line 15
    .line 16
    aput v0, p2, p1

    .line 17
    .line 18
    mul-int/lit8 v0, v0, 0x28

    .line 19
    .line 20
    sub-int/2addr p0, v0

    .line 21
    const/4 p1, 0x2

    .line 22
    aput p0, p2, p1

    .line 23
    .line 24
    return-void
.end method

.method public static i(II)I
    .locals 0

    .line 1
    mul-int/lit16 p1, p1, 0x95

    .line 2
    .line 3
    rem-int/lit16 p1, p1, 0xff

    .line 4
    .line 5
    add-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    sub-int/2addr p0, p1

    .line 8
    if-ltz p0, :cond_0

    .line 9
    .line 10
    return p0

    .line 11
    :cond_0
    add-int/lit16 p0, p0, 0x100

    .line 12
    .line 13
    return p0
.end method
