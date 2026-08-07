.class public Lcom/tencent/liteav/basic/license/h;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:[B


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "#PART#"

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/tencent/liteav/basic/license/h;->a:[B

    .line 8
    .line 9
    return-void
.end method

.method public static a([B[B)[B
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/security/spec/PKCS8EncodedKeySpec;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/security/spec/PKCS8EncodedKeySpec;-><init>([B)V

    .line 4
    .line 5
    .line 6
    const-string p1, "RSA"

    .line 7
    .line 8
    invoke-static {p1}, Ljava/security/KeyFactory;->getInstance(Ljava/lang/String;)Ljava/security/KeyFactory;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1, v0}, Ljava/security/KeyFactory;->generatePrivate(Ljava/security/spec/KeySpec;)Ljava/security/PrivateKey;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v0, "RSA/None/PKCS1Padding"

    .line 17
    .line 18
    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    const/4 v1, 0x2

    .line 23
    invoke-virtual {v0, v1, p1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public static b([B[B)[B
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/tencent/liteav/basic/license/h;->a:[B

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    if-gtz v0, :cond_0

    .line 5
    .line 6
    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/license/h;->a([B[B)[B

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :cond_0
    array-length v1, p0

    .line 12
    new-instance v2, Ljava/util/ArrayList;

    .line 13
    .line 14
    const/16 v3, 0x400

    .line 15
    .line 16
    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 17
    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    move v4, v3

    .line 21
    move v5, v4

    .line 22
    :goto_0
    if-ge v4, v1, :cond_a

    .line 23
    .line 24
    aget-byte v6, p0, v4

    .line 25
    .line 26
    add-int/lit8 v7, v1, -0x1

    .line 27
    .line 28
    const/4 v8, 0x1

    .line 29
    if-ne v4, v7, :cond_3

    .line 30
    .line 31
    sub-int v6, v1, v5

    .line 32
    .line 33
    new-array v7, v6, [B

    .line 34
    .line 35
    invoke-static {p0, v5, v7, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 36
    .line 37
    .line 38
    invoke-static {v7, p1}, Lcom/tencent/liteav/basic/license/h;->a([B[B)[B

    .line 39
    .line 40
    .line 41
    move-result-object v5

    .line 42
    array-length v6, v5

    .line 43
    move v7, v3

    .line 44
    :goto_1
    if-ge v7, v6, :cond_1

    .line 45
    .line 46
    aget-byte v9, v5, v7

    .line 47
    .line 48
    invoke-static {v9}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 49
    .line 50
    .line 51
    move-result-object v9

    .line 52
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    add-int/lit8 v7, v7, 0x1

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    add-int v5, v4, v0

    .line 59
    .line 60
    add-int/lit8 v4, v5, -0x1

    .line 61
    .line 62
    :cond_2
    move v7, v3

    .line 63
    goto :goto_3

    .line 64
    :cond_3
    sget-object v7, Lcom/tencent/liteav/basic/license/h;->a:[B

    .line 65
    .line 66
    aget-byte v7, v7, v3

    .line 67
    .line 68
    if-ne v6, v7, :cond_2

    .line 69
    .line 70
    if-le v0, v8, :cond_6

    .line 71
    .line 72
    add-int v6, v4, v0

    .line 73
    .line 74
    if-ge v6, v1, :cond_2

    .line 75
    .line 76
    move v7, v3

    .line 77
    move v6, v8

    .line 78
    :goto_2
    if-ge v6, v0, :cond_7

    .line 79
    .line 80
    sget-object v9, Lcom/tencent/liteav/basic/license/h;->a:[B

    .line 81
    .line 82
    aget-byte v9, v9, v6

    .line 83
    .line 84
    add-int v10, v4, v6

    .line 85
    .line 86
    aget-byte v10, p0, v10

    .line 87
    .line 88
    if-eq v9, v10, :cond_4

    .line 89
    .line 90
    goto :goto_3

    .line 91
    :cond_4
    add-int/lit8 v9, v0, -0x1

    .line 92
    .line 93
    if-ne v6, v9, :cond_5

    .line 94
    .line 95
    move v7, v8

    .line 96
    :cond_5
    add-int/lit8 v6, v6, 0x1

    .line 97
    .line 98
    goto :goto_2

    .line 99
    :cond_6
    move v7, v8

    .line 100
    :cond_7
    :goto_3
    if-eqz v7, :cond_9

    .line 101
    .line 102
    sub-int v6, v4, v5

    .line 103
    .line 104
    new-array v7, v6, [B

    .line 105
    .line 106
    invoke-static {p0, v5, v7, v3, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 107
    .line 108
    .line 109
    invoke-static {v7, p1}, Lcom/tencent/liteav/basic/license/h;->a([B[B)[B

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    array-length v6, v5

    .line 114
    move v7, v3

    .line 115
    :goto_4
    if-ge v7, v6, :cond_8

    .line 116
    .line 117
    aget-byte v9, v5, v7

    .line 118
    .line 119
    invoke-static {v9}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    .line 120
    .line 121
    .line 122
    move-result-object v9

    .line 123
    invoke-interface {v2, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    add-int/lit8 v7, v7, 0x1

    .line 127
    .line 128
    goto :goto_4

    .line 129
    :cond_8
    add-int/2addr v4, v0

    .line 130
    add-int/lit8 v5, v4, -0x1

    .line 131
    .line 132
    move v11, v5

    .line 133
    move v5, v4

    .line 134
    move v4, v11

    .line 135
    :cond_9
    add-int/2addr v4, v8

    .line 136
    goto :goto_0

    .line 137
    :cond_a
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    new-array p0, p0, [B

    .line 142
    .line 143
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-eqz v0, :cond_b

    .line 152
    .line 153
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    check-cast v0, Ljava/lang/Byte;

    .line 158
    .line 159
    add-int/lit8 v1, v3, 0x1

    .line 160
    .line 161
    invoke-virtual {v0}, Ljava/lang/Byte;->byteValue()B

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    aput-byte v0, p0, v3

    .line 166
    .line 167
    move v3, v1

    .line 168
    goto :goto_5

    .line 169
    :cond_b
    return-object p0
.end method
