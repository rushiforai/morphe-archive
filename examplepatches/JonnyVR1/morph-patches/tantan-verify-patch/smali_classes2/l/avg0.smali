.class public abstract Ll/avg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/avg0;->a:Ljava/util/HashMap;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    if-eqz p1, :cond_b

    .line 2
    .line 3
    const-string v0, ""

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_6

    .line 12
    .line 13
    :cond_0
    sget-object v1, Ll/avg0;->a:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Ll/epg0;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-nez v1, :cond_1

    .line 23
    .line 24
    move-object v1, v2

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object v1, v1, Ll/epg0;->a:[B

    .line 27
    .line 28
    :goto_0
    if-eqz v1, :cond_2

    .line 29
    .line 30
    array-length v3, v1

    .line 31
    if-nez v3, :cond_6

    .line 32
    .line 33
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    const-string v3, "key_aes_key_prefix_"

    .line 36
    .line 37
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-static {}, Ll/qlg0;->a()Ll/qlg0;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    iget-object v3, v3, Ll/qlg0;->a:Landroid/content/SharedPreferences;

    .line 52
    .line 53
    invoke-interface {v3, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    if-eqz v1, :cond_5

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-eqz v0, :cond_3

    .line 64
    .line 65
    goto :goto_2

    .line 66
    :cond_3
    invoke-static {v1}, Ll/amg0;->b(Ljava/lang/String;)[B

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const/4 v1, 0x0

    .line 71
    :goto_1
    array-length v3, v0

    .line 72
    if-ge v1, v3, :cond_4

    .line 73
    .line 74
    aget-byte v3, v0, v1

    .line 75
    .line 76
    xor-int/lit8 v3, v3, 0x2

    .line 77
    .line 78
    int-to-byte v3, v3

    .line 79
    aput-byte v3, v0, v1

    .line 80
    .line 81
    add-int/lit8 v1, v1, 0x1

    .line 82
    .line 83
    goto :goto_1

    .line 84
    :cond_4
    move-object v1, v0

    .line 85
    goto :goto_3

    .line 86
    :cond_5
    :goto_2
    move-object v1, v2

    .line 87
    :goto_3
    if-eqz v1, :cond_6

    .line 88
    .line 89
    array-length v0, v1

    .line 90
    if-lez v0, :cond_6

    .line 91
    .line 92
    new-instance v0, Ll/epg0;

    .line 93
    .line 94
    invoke-direct {v0}, Ll/epg0;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object v1, v0, Ll/epg0;->a:[B

    .line 98
    .line 99
    sget-object v3, Ll/avg0;->a:Ljava/util/HashMap;

    .line 100
    .line 101
    invoke-virtual {v3, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    :cond_6
    if-eqz v1, :cond_a

    .line 105
    .line 106
    array-length p0, v1

    .line 107
    if-eqz p0, :cond_a

    .line 108
    .line 109
    sget-object p0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    .line 110
    .line 111
    invoke-virtual {p1, p0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    if-eqz p0, :cond_9

    .line 116
    .line 117
    array-length p1, p0

    .line 118
    if-nez p1, :cond_7

    .line 119
    .line 120
    goto :goto_5

    .line 121
    :cond_7
    new-instance p1, Ljavax/crypto/spec/IvParameterSpec;

    .line 122
    .line 123
    sget-object v0, Ll/jrg0;->a:[B

    .line 124
    .line 125
    invoke-direct {p1, v0}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 126
    .line 127
    .line 128
    const-string v0, "AES/CFB/PKCS5Padding"

    .line 129
    .line 130
    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    array-length v3, v1

    .line 135
    if-nez v3, :cond_8

    .line 136
    .line 137
    goto :goto_4

    .line 138
    :cond_8
    new-instance v2, Ljavax/crypto/spec/SecretKeySpec;

    .line 139
    .line 140
    const-string v3, "AES"

    .line 141
    .line 142
    invoke-direct {v2, v1, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 143
    .line 144
    .line 145
    :goto_4
    const/4 v1, 0x1

    .line 146
    invoke-virtual {v0, v1, v2, p1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {v0, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    :cond_9
    :goto_5
    invoke-static {v2}, Ll/amg0;->a([B)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    return-object p0

    .line 158
    :cond_a
    new-instance p0, LH/Sudnew;

    .line 159
    .line 160
    invoke-direct {p0}, LH/Sudnew;-><init>()V

    .line 161
    .line 162
    .line 163
    throw p0

    .line 164
    :cond_b
    :goto_6
    return-object p1
.end method
