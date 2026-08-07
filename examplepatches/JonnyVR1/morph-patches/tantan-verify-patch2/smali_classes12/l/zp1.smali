.class public final Ll/zp1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fmc0;


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


# virtual methods
.method public a(Ll/cy2;Ljava/util/Map;)Ll/r5d0;
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/cy2;",
            "Ljava/util/Map<",
            "Lcom/google/zxing/DecodeHintType;",
            "*>;)",
            "Ll/r5d0;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/zxing/NotFoundException;,
            Lcom/google/zxing/FormatException;
        }
    .end annotation

    .line 1
    new-instance p0, Ll/vyd;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/cy2;->a()Ll/d13;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1}, Ll/vyd;-><init>(Ll/d13;)V

    .line 8
    .line 9
    .line 10
    const/4 p1, 0x0

    .line 11
    const/4 v1, 0x0

    .line 12
    :try_start_0
    invoke-virtual {p0, p1}, Ll/vyd;->a(Z)Ll/yp1;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/dzd;->b()[Ll/s5d0;

    .line 17
    .line 18
    .line 19
    move-result-object v2
    :try_end_0
    .catch Lcom/google/zxing/NotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Lcom/google/zxing/FormatException; {:try_start_0 .. :try_end_0} :catch_2

    .line 20
    :try_start_1
    new-instance v3, Lcom/google/zxing/aztec/decoder/Decoder;

    .line 21
    .line 22
    invoke-direct {v3}, Lcom/google/zxing/aztec/decoder/Decoder;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v3, v0}, Lcom/google/zxing/aztec/decoder/Decoder;->c(Ll/yp1;)Ll/mid;

    .line 26
    .line 27
    .line 28
    move-result-object v0
    :try_end_1
    .catch Lcom/google/zxing/NotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lcom/google/zxing/FormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 29
    move-object v3, v1

    .line 30
    move-object v1, v0

    .line 31
    move-object v0, v2

    .line 32
    move-object v2, v3

    .line 33
    goto :goto_2

    .line 34
    :catch_0
    move-exception v0

    .line 35
    goto :goto_0

    .line 36
    :catch_1
    move-exception v0

    .line 37
    goto :goto_1

    .line 38
    :catch_2
    move-exception v0

    .line 39
    move-object v2, v1

    .line 40
    goto :goto_0

    .line 41
    :catch_3
    move-exception v0

    .line 42
    move-object v2, v1

    .line 43
    goto :goto_1

    .line 44
    :goto_0
    move-object v3, v0

    .line 45
    move-object v0, v2

    .line 46
    move-object v2, v1

    .line 47
    goto :goto_2

    .line 48
    :goto_1
    move-object v3, v2

    .line 49
    move-object v2, v0

    .line 50
    move-object v0, v3

    .line 51
    move-object v3, v1

    .line 52
    :goto_2
    if-nez v1, :cond_0

    .line 53
    .line 54
    const/4 v0, 0x1

    .line 55
    :try_start_2
    invoke-virtual {p0, v0}, Ll/vyd;->a(Z)Ll/yp1;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-virtual {p0}, Ll/dzd;->b()[Ll/s5d0;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    new-instance v1, Lcom/google/zxing/aztec/decoder/Decoder;

    .line 64
    .line 65
    invoke-direct {v1}, Lcom/google/zxing/aztec/decoder/Decoder;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {v1, p0}, Lcom/google/zxing/aztec/decoder/Decoder;->c(Ll/yp1;)Ll/mid;

    .line 69
    .line 70
    .line 71
    move-result-object v1
    :try_end_2
    .catch Lcom/google/zxing/NotFoundException; {:try_start_2 .. :try_end_2} :catch_5
    .catch Lcom/google/zxing/FormatException; {:try_start_2 .. :try_end_2} :catch_4

    .line 72
    :cond_0
    move-object v8, v0

    .line 73
    goto :goto_5

    .line 74
    :catch_4
    move-exception v0

    .line 75
    :goto_3
    move-object p0, v0

    .line 76
    goto :goto_4

    .line 77
    :catch_5
    move-exception v0

    .line 78
    goto :goto_3

    .line 79
    :goto_4
    if-nez v2, :cond_2

    .line 80
    .line 81
    if-eqz v3, :cond_1

    .line 82
    .line 83
    throw v3

    .line 84
    :cond_1
    throw p0

    .line 85
    :cond_2
    throw v2

    .line 86
    :goto_5
    if-eqz p2, :cond_3

    .line 87
    .line 88
    sget-object p0, Lcom/google/zxing/DecodeHintType;->NEED_RESULT_POINT_CALLBACK:Lcom/google/zxing/DecodeHintType;

    .line 89
    .line 90
    invoke-interface {p2, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    check-cast p0, Ll/t5d0;

    .line 95
    .line 96
    if-eqz p0, :cond_3

    .line 97
    .line 98
    array-length p2, v8

    .line 99
    :goto_6
    if-ge p1, p2, :cond_3

    .line 100
    .line 101
    aget-object v0, v8, p1

    .line 102
    .line 103
    invoke-interface {p0, v0}, Ll/t5d0;->a(Ll/s5d0;)V

    .line 104
    .line 105
    .line 106
    add-int/lit8 p1, p1, 0x1

    .line 107
    .line 108
    goto :goto_6

    .line 109
    :cond_3
    new-instance v4, Ll/r5d0;

    .line 110
    .line 111
    invoke-virtual {v1}, Ll/mid;->h()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    invoke-virtual {v1}, Ll/mid;->e()[B

    .line 116
    .line 117
    .line 118
    move-result-object v6

    .line 119
    invoke-virtual {v1}, Ll/mid;->c()I

    .line 120
    .line 121
    .line 122
    move-result v7

    .line 123
    sget-object v9, Lcom/google/zxing/BarcodeFormat;->AZTEC:Lcom/google/zxing/BarcodeFormat;

    .line 124
    .line 125
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 126
    .line 127
    .line 128
    move-result-wide v10

    .line 129
    invoke-direct/range {v4 .. v11}, Ll/r5d0;-><init>(Ljava/lang/String;[BI[Ll/s5d0;Lcom/google/zxing/BarcodeFormat;J)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1}, Ll/mid;->a()Ljava/util/List;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    if-eqz p0, :cond_4

    .line 137
    .line 138
    sget-object p1, Lcom/google/zxing/ResultMetadataType;->BYTE_SEGMENTS:Lcom/google/zxing/ResultMetadataType;

    .line 139
    .line 140
    invoke-virtual {v4, p1, p0}, Ll/r5d0;->h(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    :cond_4
    invoke-virtual {v1}, Ll/mid;->b()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object p0

    .line 147
    if-eqz p0, :cond_5

    .line 148
    .line 149
    sget-object p1, Lcom/google/zxing/ResultMetadataType;->ERROR_CORRECTION_LEVEL:Lcom/google/zxing/ResultMetadataType;

    .line 150
    .line 151
    invoke-virtual {v4, p1, p0}, Ll/r5d0;->h(Lcom/google/zxing/ResultMetadataType;Ljava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    :cond_5
    return-object v4
.end method

.method public reset()V
    .locals 0

    .line 1
    return-void
.end method
