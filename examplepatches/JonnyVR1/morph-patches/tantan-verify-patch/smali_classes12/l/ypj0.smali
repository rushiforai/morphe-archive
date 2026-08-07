.class public final Ll/ypj0;
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
    sget-object v0, Lcom/google/zxing/BarcodeFormat;->UPC_E:Lcom/google/zxing/BarcodeFormat;

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
    const-string p0, "Can only encode UPC_E, but got "

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
    .locals 8

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x7

    .line 7
    if-eq p0, v1, :cond_2

    .line 8
    .line 9
    const/16 v2, 0x8

    .line 10
    .line 11
    if-ne p0, v2, :cond_1

    .line 12
    .line 13
    :try_start_0
    invoke-static {p1}, Ll/vpj0;->h(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 21
    .line 22
    const-string p1, "Contents do not pass checksum"

    .line 23
    .line 24
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    throw p0
    :try_end_0
    .catch Lcom/google/zxing/FormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 28
    :catch_0
    const-string p0, "Illegal contents"

    .line 29
    .line 30
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_1
    const-string p1, "Requested contents should be 8 digits long, but got "

    .line 35
    .line 36
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_2
    :try_start_1
    invoke-static {p1}, Ll/xpj0;->r(Ljava/lang/String;)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {p0}, Ll/vpj0;->q(Ljava/lang/CharSequence;)I

    .line 53
    .line 54
    .line 55
    move-result p0
    :try_end_1
    .catch Lcom/google/zxing/FormatException; {:try_start_1 .. :try_end_1} :catch_1

    .line 56
    new-instance v2, Ljava/lang/StringBuilder;

    .line 57
    .line 58
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    :goto_0
    const/4 p0, 0x0

    .line 72
    invoke-virtual {p1, p0}, Ljava/lang/String;->charAt(I)C

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    const/16 v3, 0xa

    .line 77
    .line 78
    invoke-static {v2, v3}, Ljava/lang/Character;->digit(CI)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    const/4 v4, 0x1

    .line 83
    if-eqz v2, :cond_4

    .line 84
    .line 85
    if-ne v2, v4, :cond_3

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_3
    const-string p0, "Number system must be 0 or 1"

    .line 89
    .line 90
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-object v0

    .line 94
    :cond_4
    :goto_1
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    invoke-static {v0, v3}, Ljava/lang/Character;->digit(CI)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    sget-object v1, Ll/xpj0;->k:[[I

    .line 103
    .line 104
    aget-object v1, v1, v2

    .line 105
    .line 106
    aget v0, v1, v0

    .line 107
    .line 108
    const/16 v1, 0x33

    .line 109
    .line 110
    new-array v1, v1, [Z

    .line 111
    .line 112
    sget-object v2, Ll/vpj0;->d:[I

    .line 113
    .line 114
    invoke-static {v1, p0, v2, v4}, Ll/tp50;->b([ZI[IZ)I

    .line 115
    .line 116
    .line 117
    move-result v2

    .line 118
    move v5, v4

    .line 119
    :goto_2
    const/4 v6, 0x6

    .line 120
    if-gt v5, v6, :cond_6

    .line 121
    .line 122
    invoke-virtual {p1, v5}, Ljava/lang/String;->charAt(I)C

    .line 123
    .line 124
    .line 125
    move-result v6

    .line 126
    invoke-static {v6, v3}, Ljava/lang/Character;->digit(CI)I

    .line 127
    .line 128
    .line 129
    move-result v6

    .line 130
    rsub-int/lit8 v7, v5, 0x6

    .line 131
    .line 132
    shr-int v7, v0, v7

    .line 133
    .line 134
    and-int/2addr v7, v4

    .line 135
    if-ne v7, v4, :cond_5

    .line 136
    .line 137
    add-int/lit8 v6, v6, 0xa

    .line 138
    .line 139
    :cond_5
    sget-object v7, Ll/vpj0;->h:[[I

    .line 140
    .line 141
    aget-object v6, v7, v6

    .line 142
    .line 143
    invoke-static {v1, v2, v6, p0}, Ll/tp50;->b([ZI[IZ)I

    .line 144
    .line 145
    .line 146
    move-result v6

    .line 147
    add-int/2addr v2, v6

    .line 148
    add-int/lit8 v5, v5, 0x1

    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_6
    sget-object p1, Ll/vpj0;->f:[I

    .line 152
    .line 153
    invoke-static {v1, v2, p1, p0}, Ll/tp50;->b([ZI[IZ)I

    .line 154
    .line 155
    .line 156
    return-object v1

    .line 157
    :catch_1
    move-exception p0

    .line 158
    invoke-static {p0}, Ll/tg3;->a(Ljava/lang/Throwable;)V

    .line 159
    .line 160
    .line 161
    return-object v0
.end method
