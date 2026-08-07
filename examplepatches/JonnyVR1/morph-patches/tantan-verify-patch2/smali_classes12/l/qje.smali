.class public final Ll/qje;
.super Ll/wpj0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/wpj0;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Ll/d13;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/google/zxing/BarcodeFormat;",
            "II",
            "Ljava/util/Map<",
            "Lcom/google/zxing/EncodeHintType;",
            "*>;)",
            "Ll/d13;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/WriterException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->EAN_13:Lcom/google/zxing/BarcodeFormat;

    .line 2
    .line 3
    if-ne p2, v0, :cond_0

    .line 4
    .line 5
    invoke-super/range {p0 .. p5}, Ll/tp50;->a(Ljava/lang/String;Lcom/google/zxing/BarcodeFormat;IILjava/util/Map;)Ll/d13;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "Can only encode EAN_13, but got "

    .line 11
    .line 12
    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x0

    .line 24
    return-object p0
.end method

.method public c(Ljava/lang/String;)[Z
    .locals 9

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const/16 v1, 0xc

    .line 7
    .line 8
    if-eq p0, v1, :cond_2

    .line 9
    .line 10
    const/16 v2, 0xd

    .line 11
    .line 12
    if-ne p0, v2, :cond_1

    .line 13
    .line 14
    :try_start_0
    invoke-static {p1}, Ll/vpj0;->h(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 22
    .line 23
    const-string p1, "Contents do not pass checksum"

    .line 24
    .line 25
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    throw p0
    :try_end_0
    .catch Lcom/google/zxing/FormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 29
    :catch_0
    const-string p0, "Illegal contents"

    .line 30
    .line 31
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_1
    const-string p1, "Requested contents should be 12 or 13 digits long, but got "

    .line 36
    .line 37
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-object v0

    .line 49
    :cond_2
    :try_start_1
    invoke-static {p1}, Ll/vpj0;->q(Ljava/lang/CharSequence;)I

    .line 50
    .line 51
    .line 52
    move-result p0
    :try_end_1
    .catch Lcom/google/zxing/FormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    :goto_0
    const/4 p0, 0x0

    .line 69
    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    const/16 v2, 0xa

    .line 74
    .line 75
    invoke-static {v0, v2}, Ljava/lang/Character;->digit(CI)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    sget-object v3, Ll/pje;->j:[I

    .line 80
    .line 81
    aget v0, v3, v0

    .line 82
    .line 83
    const/16 v3, 0x5f

    .line 84
    .line 85
    new-array v3, v3, [Z

    .line 86
    .line 87
    sget-object v4, Ll/vpj0;->d:[I

    .line 88
    .line 89
    const/4 v5, 0x1

    .line 90
    invoke-static {v3, p0, v4, v5}, Ll/tp50;->b([ZI[IZ)I

    .line 91
    .line 92
    .line 93
    move-result v4

    .line 94
    move v6, v5

    .line 95
    :goto_1
    const/4 v7, 0x6

    .line 96
    if-gt v6, v7, :cond_4

    .line 97
    .line 98
    invoke-virtual {p1, v6}, Ljava/lang/String;->charAt(I)C

    .line 99
    .line 100
    .line 101
    move-result v7

    .line 102
    invoke-static {v7, v2}, Ljava/lang/Character;->digit(CI)I

    .line 103
    .line 104
    .line 105
    move-result v7

    .line 106
    rsub-int/lit8 v8, v6, 0x6

    .line 107
    .line 108
    shr-int v8, v0, v8

    .line 109
    .line 110
    and-int/2addr v8, v5

    .line 111
    if-ne v8, v5, :cond_3

    .line 112
    .line 113
    add-int/lit8 v7, v7, 0xa

    .line 114
    .line 115
    :cond_3
    sget-object v8, Ll/vpj0;->h:[[I

    .line 116
    .line 117
    aget-object v7, v8, v7

    .line 118
    .line 119
    invoke-static {v3, v4, v7, p0}, Ll/tp50;->b([ZI[IZ)I

    .line 120
    .line 121
    .line 122
    move-result v7

    .line 123
    add-int/2addr v4, v7

    .line 124
    add-int/lit8 v6, v6, 0x1

    .line 125
    .line 126
    goto :goto_1

    .line 127
    :cond_4
    sget-object v0, Ll/vpj0;->e:[I

    .line 128
    .line 129
    invoke-static {v3, v4, v0, p0}, Ll/tp50;->b([ZI[IZ)I

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    add-int/2addr v4, p0

    .line 134
    const/4 p0, 0x7

    .line 135
    :goto_2
    if-gt p0, v1, :cond_5

    .line 136
    .line 137
    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    invoke-static {v0, v2}, Ljava/lang/Character;->digit(CI)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    sget-object v6, Ll/vpj0;->g:[[I

    .line 146
    .line 147
    aget-object v0, v6, v0

    .line 148
    .line 149
    invoke-static {v3, v4, v0, v5}, Ll/tp50;->b([ZI[IZ)I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    add-int/2addr v4, v0

    .line 154
    add-int/lit8 p0, p0, 0x1

    .line 155
    .line 156
    goto :goto_2

    .line 157
    :cond_5
    sget-object p0, Ll/vpj0;->d:[I

    .line 158
    .line 159
    invoke-static {v3, v4, p0, v5}, Ll/tp50;->b([ZI[IZ)I

    .line 160
    .line 161
    .line 162
    return-object v3

    .line 163
    :catch_1
    move-exception p0

    .line 164
    invoke-static {p0}, Ll/tg3;->a(Ljava/lang/Throwable;)V

    .line 165
    .line 166
    .line 167
    return-object v0
.end method
