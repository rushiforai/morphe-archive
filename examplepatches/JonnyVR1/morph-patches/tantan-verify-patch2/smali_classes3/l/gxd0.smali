.class public Ll/gxd0;
.super Ll/eyd0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/eyd0<",
        "Lcom/p1/mobile/putong/data/AuthData;",
        ">;"
    }
.end annotation


# static fields
.field public static p:Ll/jxd0;

.field public static q:[B


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Ll/jxd0;

    .line 2
    .line 3
    const-string v1, "ever_show_radar_on_main"

    .line 4
    .line 5
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/gxd0;->p:Ll/jxd0;

    .line 11
    .line 12
    const/16 v0, 0x8

    .line 13
    .line 14
    new-array v0, v0, [B

    .line 15
    .line 16
    fill-array-data v0, :array_0

    .line 17
    .line 18
    .line 19
    sput-object v0, Ll/gxd0;->q:[B

    .line 20
    .line 21
    return-void

    .line 22
    nop

    .line 23
    :array_0
    .array-data 1
        0x1t
        0x2t
        0x3t
        0x4t
        0x5t
        0x6t
        0x7t
        0x8t
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;ZLjava/lang/String;)V
    .locals 6

    .line 1
    const/4 v3, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v4, p3

    .line 6
    move-object v5, p4

    .line 7
    invoke-direct/range {v0 .. v5}, Ll/eyd0;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/Object;ZLjava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static o(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    new-instance v0, Ljavax/crypto/spec/IvParameterSpec;

    .line 7
    .line 8
    sget-object v1, Ll/gxd0;->q:[B

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 11
    .line 12
    .line 13
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    .line 14
    .line 15
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const-string v2, "DES"

    .line 20
    .line 21
    invoke-direct {v1, p1, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    const-string p1, "DES/CBC/PKCS5Padding"

    .line 25
    .line 26
    invoke-static {p1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    const/4 v2, 0x2

    .line 31
    invoke-virtual {p1, v2, v1, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance p1, Ljava/lang/String;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Ljava/lang/String;-><init>([B)V

    .line 41
    .line 42
    .line 43
    return-object p1
.end method

.method public static p(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljavax/crypto/spec/IvParameterSpec;

    .line 2
    .line 3
    sget-object v1, Ll/gxd0;->q:[B

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const-string v2, "DES"

    .line 15
    .line 16
    invoke-direct {v1, p1, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    const-string p1, "DES/CBC/PKCS5Padding"

    .line 20
    .line 21
    invoke-static {p1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    const/4 v2, 0x1

    .line 26
    invoke-virtual {p1, v2, v1, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p1, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    const/4 p1, 0x0

    .line 38
    invoke-static {p0, p1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    return-object p0
.end method


# virtual methods
.method public bridge synthetic f()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gxd0;->q()Lcom/p1/mobile/putong/data/AuthData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic g(Ljava/lang/Object;)Landroid/util/Pair;
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/gxd0;->t(Lcom/p1/mobile/putong/data/AuthData;)Landroid/util/Pair;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic h(Ljava/lang/Object;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/data/AuthData;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/gxd0;->m(Lcom/p1/mobile/putong/data/AuthData;Lcom/p1/mobile/putong/data/AuthData;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public bridge synthetic k(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    .line 2
    .line 3
    check-cast p2, Lcom/p1/mobile/putong/data/AuthData;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Ll/gxd0;->n(Lcom/p1/mobile/putong/data/AuthData;Lcom/p1/mobile/putong/data/AuthData;)Lcom/p1/mobile/putong/data/AuthData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public m(Lcom/p1/mobile/putong/data/AuthData;Lcom/p1/mobile/putong/data/AuthData;)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/data/AuthData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/data/AuthData;->equals(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public n(Lcom/p1/mobile/putong/data/AuthData;Lcom/p1/mobile/putong/data/AuthData;)Lcom/p1/mobile/putong/data/AuthData;
    .locals 0
    .param p2    # Lcom/p1/mobile/putong/data/AuthData;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/AuthData;->clone()Lcom/p1/mobile/putong/data/AuthData;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public q()Lcom/p1/mobile/putong/data/AuthData;
    .locals 5

    .line 1
    invoke-virtual {p0}, Ll/ixd0;->d()Landroid/content/SharedPreferences;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/ixd0;->a:Ljava/lang/String;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0}, Ll/ixd0;->e()Landroid/content/SharedPreferences;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    iget-object v3, p0, Ll/ixd0;->b:Ljava/lang/String;

    .line 17
    .line 18
    invoke-interface {v1, v3, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-nez v3, :cond_0

    .line 33
    .line 34
    new-instance v0, Ljava/lang/RuntimeException;

    .line 35
    .line 36
    new-instance v3, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    const-string v4, "MMKV retrieveValue id="

    .line 39
    .line 40
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v4, p0, Ll/ixd0;->a:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-direct {v0, v3}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Ll/ixd0;->d()Landroid/content/SharedPreferences;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    iget-object v3, p0, Ll/ixd0;->a:Ljava/lang/String;

    .line 67
    .line 68
    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 73
    .line 74
    .line 75
    move-object v0, v1

    .line 76
    :cond_0
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 77
    .line 78
    .line 79
    move-result v3

    .line 80
    if-eqz v3, :cond_1

    .line 81
    .line 82
    return-object v2

    .line 83
    :cond_1
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-nez v1, :cond_2

    .line 88
    .line 89
    invoke-virtual {p0}, Ll/ixd0;->e()Landroid/content/SharedPreferences;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    iget-object v2, p0, Ll/ixd0;->b:Ljava/lang/String;

    .line 98
    .line 99
    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 104
    .line 105
    .line 106
    :cond_2
    const-string v1, "{"

    .line 107
    .line 108
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_3

    .line 113
    .line 114
    const-string v1, "}"

    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_3

    .line 121
    .line 122
    sget-object v1, Ll/gxd0;->p:Ll/jxd0;

    .line 123
    .line 124
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    check-cast v1, Ljava/lang/Boolean;

    .line 129
    .line 130
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    if-nez v1, :cond_3

    .line 135
    .line 136
    invoke-virtual {p0, v0}, Ll/gxd0;->s(Ljava/lang/String;)Lcom/p1/mobile/putong/data/AuthData;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    return-object p0

    .line 141
    :cond_3
    invoke-virtual {p0, v0}, Ll/gxd0;->r(Ljava/lang/String;)Lcom/p1/mobile/putong/data/AuthData;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    return-object p0
.end method

.method public final r(Ljava/lang/String;)Lcom/p1/mobile/putong/data/AuthData;
    .locals 5

    .line 1
    const-string p0, "t = "

    .line 2
    .line 3
    const-string v0, "retrieve str: "

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    const-string v2, "[putong-common][account]"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-static {v2, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/p1/mobile/putong/data/AuthData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    invoke-static {p1, v2}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {v0, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->parse([B)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/data/AuthData;

    .line 35
    .line 36
    const-string v0, ""
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_3

    .line 37
    .line 38
    :try_start_1
    invoke-static {}, Ll/ja5;->z()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    if-nez v4, :cond_0

    .line 47
    .line 48
    const/16 v4, 0x8

    .line 49
    .line 50
    invoke-virtual {v3, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v2, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v2, v0}, Ll/gxd0;->o(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iput-object v2, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;
    :try_end_1
    .catch Ljavax/crypto/BadPaddingException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_0

    .line 61
    .line 62
    goto :goto_3

    .line 63
    :catch_0
    move-exception p0

    .line 64
    goto :goto_0

    .line 65
    :catch_1
    move-exception p0

    .line 66
    goto :goto_1

    .line 67
    :catch_2
    move-exception v2

    .line 68
    goto :goto_2

    .line 69
    :goto_0
    :try_start_2
    new-instance v0, Ljava/lang/RuntimeException;

    .line 70
    .line 71
    const-string v2, "ClientTracking class load failed in retrieve"

    .line 72
    .line 73
    invoke-direct {v0, v2, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 74
    .line 75
    .line 76
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 77
    .line 78
    .line 79
    goto :goto_3

    .line 80
    :catch_3
    move-exception p0

    .line 81
    goto :goto_4

    .line 82
    :catch_4
    move-exception p0

    .line 83
    goto :goto_5

    .line 84
    :goto_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 85
    .line 86
    .line 87
    goto :goto_3

    .line 88
    :goto_2
    new-instance v3, Ljava/lang/Exception;

    .line 89
    .line 90
    new-instance v4, Ljava/lang/StringBuilder;

    .line 91
    .line 92
    invoke-direct {v4, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    const-string p0, ", d5 ="

    .line 101
    .line 102
    invoke-virtual {v4, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-direct {v3, p0, v2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 113
    .line 114
    .line 115
    const/16 p0, 0x32

    .line 116
    .line 117
    invoke-static {v3, p0}, Lcom/tantanapp/common/utils/CrashHelper;->d(Ljava/lang/Throwable;I)V

    .line 118
    .line 119
    .line 120
    :cond_0
    :goto_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 121
    .line 122
    if-eqz p0, :cond_1

    .line 123
    .line 124
    iget p0, p1, Lcom/p1/mobile/putong/data/AuthData;->expiresIn:I

    .line 125
    .line 126
    const/high16 v0, -0x80000000

    .line 127
    .line 128
    if-eq p0, v0, :cond_1

    .line 129
    .line 130
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AuthData;->tokenType:Ljava/lang/String;

    .line 131
    .line 132
    if-eqz p0, :cond_1

    .line 133
    .line 134
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_3

    .line 135
    .line 136
    if-eqz p0, :cond_1

    .line 137
    .line 138
    return-object p1

    .line 139
    :cond_1
    return-object v1

    .line 140
    :goto_4
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 141
    .line 142
    .line 143
    return-object v1

    .line 144
    :goto_5
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 145
    .line 146
    .line 147
    return-object v1
.end method

.method public final s(Ljava/lang/String;)Lcom/p1/mobile/putong/data/AuthData;
    .locals 10

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_b

    .line 3
    .line 4
    new-instance v1, Lcom/p1/mobile/putong/data/AuthData;

    .line 5
    .line 6
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/AuthData;-><init>()V

    .line 7
    .line 8
    .line 9
    const/high16 v2, -0x80000000

    .line 10
    .line 11
    iput v2, v1, Lcom/p1/mobile/putong/data/AuthData;->expiresIn:I

    .line 12
    .line 13
    const-string v3, "}"

    .line 14
    .line 15
    invoke-virtual {p1, v3}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    const/4 v4, 0x0

    .line 20
    invoke-virtual {p1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v3, ","

    .line 25
    .line 26
    invoke-virtual {p1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    array-length v3, p1

    .line 31
    const/4 v5, 0x4

    .line 32
    if-eq v3, v5, :cond_0

    .line 33
    .line 34
    return-object v0

    .line 35
    :cond_0
    move v3, v4

    .line 36
    :goto_0
    if-ge v3, v5, :cond_a

    .line 37
    .line 38
    aget-object v6, p1, v3

    .line 39
    .line 40
    const-string v7, ":"

    .line 41
    .line 42
    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    array-length v7, v6

    .line 47
    const/4 v8, 0x2

    .line 48
    if-eq v7, v8, :cond_1

    .line 49
    .line 50
    return-object v0

    .line 51
    :cond_1
    aget-object v7, v6, v4

    .line 52
    .line 53
    const-string v8, "access_token"

    .line 54
    .line 55
    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    const/4 v8, 0x1

    .line 60
    if-nez v7, :cond_9

    .line 61
    .line 62
    aget-object v7, v6, v4

    .line 63
    .line 64
    const-string v9, "accessToken"

    .line 65
    .line 66
    invoke-virtual {v7, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v7

    .line 70
    if-eqz v7, :cond_2

    .line 71
    .line 72
    goto/16 :goto_4

    .line 73
    .line 74
    :cond_2
    aget-object v7, v6, v4

    .line 75
    .line 76
    const-string v9, "token_type"

    .line 77
    .line 78
    invoke-virtual {v7, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v7

    .line 82
    if-nez v7, :cond_8

    .line 83
    .line 84
    aget-object v7, v6, v4

    .line 85
    .line 86
    const-string v9, "tokenType"

    .line 87
    .line 88
    invoke-virtual {v7, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 89
    .line 90
    .line 91
    move-result v7

    .line 92
    if-eqz v7, :cond_3

    .line 93
    .line 94
    goto :goto_3

    .line 95
    :cond_3
    aget-object v7, v6, v4

    .line 96
    .line 97
    const-string v9, "expires_in"

    .line 98
    .line 99
    invoke-virtual {v7, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 100
    .line 101
    .line 102
    move-result v7

    .line 103
    if-nez v7, :cond_7

    .line 104
    .line 105
    aget-object v7, v6, v4

    .line 106
    .line 107
    const-string v9, "expiresIn"

    .line 108
    .line 109
    invoke-virtual {v7, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 110
    .line 111
    .line 112
    move-result v7

    .line 113
    if-eqz v7, :cond_4

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_4
    aget-object v7, v6, v4

    .line 117
    .line 118
    const-string v9, "user_id"

    .line 119
    .line 120
    invoke-virtual {v7, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 121
    .line 122
    .line 123
    move-result v7

    .line 124
    if-nez v7, :cond_6

    .line 125
    .line 126
    aget-object v7, v6, v4

    .line 127
    .line 128
    const-string v9, "userId"

    .line 129
    .line 130
    invoke-virtual {v7, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 131
    .line 132
    .line 133
    move-result v7

    .line 134
    if-eqz v7, :cond_5

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_5
    return-object v0

    .line 138
    :cond_6
    :goto_1
    aget-object v6, v6, v8

    .line 139
    .line 140
    invoke-virtual {p0, v6}, Ll/gxd0;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v6

    .line 144
    iput-object v6, v1, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 145
    .line 146
    goto :goto_5

    .line 147
    :cond_7
    :goto_2
    :try_start_0
    aget-object v6, v6, v8

    .line 148
    .line 149
    invoke-virtual {p0, v6}, Ll/gxd0;->u(Ljava/lang/String;)I

    .line 150
    .line 151
    .line 152
    move-result v6

    .line 153
    iput v6, v1, Lcom/p1/mobile/putong/data/AuthData;->expiresIn:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 154
    .line 155
    goto :goto_5

    .line 156
    :catch_0
    move-exception v6

    .line 157
    new-instance v7, Ljava/lang/Exception;

    .line 158
    .line 159
    new-instance v8, Ljava/lang/StringBuilder;

    .line 160
    .line 161
    const-string v9, "AccountApi retrieveValue:"

    .line 162
    .line 163
    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    invoke-virtual {v6}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v9

    .line 170
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v8

    .line 177
    invoke-direct {v7, v8, v6}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 178
    .line 179
    .line 180
    invoke-static {v7}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 181
    .line 182
    .line 183
    goto :goto_5

    .line 184
    :cond_8
    :goto_3
    aget-object v6, v6, v8

    .line 185
    .line 186
    invoke-virtual {p0, v6}, Ll/gxd0;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v6

    .line 190
    iput-object v6, v1, Lcom/p1/mobile/putong/data/AuthData;->tokenType:Ljava/lang/String;

    .line 191
    .line 192
    goto :goto_5

    .line 193
    :cond_9
    :goto_4
    aget-object v6, v6, v8

    .line 194
    .line 195
    invoke-virtual {p0, v6}, Ll/gxd0;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v6

    .line 199
    iput-object v6, v1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 200
    .line 201
    :goto_5
    add-int/lit8 v3, v3, 0x1

    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :cond_a
    iget-object p0, v1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 206
    .line 207
    if-eqz p0, :cond_b

    .line 208
    .line 209
    iget p0, v1, Lcom/p1/mobile/putong/data/AuthData;->expiresIn:I

    .line 210
    .line 211
    if-eq p0, v2, :cond_b

    .line 212
    .line 213
    iget-object p0, v1, Lcom/p1/mobile/putong/data/AuthData;->tokenType:Ljava/lang/String;

    .line 214
    .line 215
    if-eqz p0, :cond_b

    .line 216
    .line 217
    iget-object p0, v1, Lcom/p1/mobile/putong/data/AuthData;->userId:Ljava/lang/String;

    .line 218
    .line 219
    if-eqz p0, :cond_b

    .line 220
    .line 221
    return-object v1

    .line 222
    :cond_b
    return-object v0
.end method

.method public t(Lcom/p1/mobile/putong/data/AuthData;)Landroid/util/Pair;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/AuthData;",
            ")",
            "Landroid/util/Pair<",
            "Landroid/content/SharedPreferences$Editor;",
            "Landroid/content/SharedPreferences$Editor;",
            ">;"
        }
    .end annotation

    .line 1
    const-string v0, "save t: "

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/AuthData;->clone()Lcom/p1/mobile/putong/data/AuthData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v1, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    :try_start_0
    invoke-static {}, Ll/ja5;->z()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v3

    .line 14
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    if-nez v4, :cond_0

    .line 19
    .line 20
    const/16 v4, 0x8

    .line 21
    .line 22
    invoke-virtual {v3, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-static {v1, v3}, Ll/gxd0;->p(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    iput-object v1, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception v0

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    const-string v1, "[putong-common][account]"

    .line 36
    .line 37
    new-instance v3, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 52
    .line 53
    .line 54
    goto :goto_2

    .line 55
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 56
    .line 57
    .line 58
    :goto_2
    sget-object v0, Ll/gxd0;->p:Ll/jxd0;

    .line 59
    .line 60
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 61
    .line 62
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    :try_start_1
    new-instance v0, Landroid/util/Pair;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/ixd0;->d()Landroid/content/SharedPreferences;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    iget-object v3, p0, Ll/ixd0;->a:Ljava/lang/String;

    .line 76
    .line 77
    sget-object v4, Lcom/p1/mobile/putong/data/AuthData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {v4, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 80
    .line 81
    .line 82
    move-result-object v4

    .line 83
    invoke-static {v4, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    invoke-virtual {p0}, Ll/ixd0;->e()Landroid/content/SharedPreferences;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-interface {v3}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 96
    .line 97
    .line 98
    move-result-object v3

    .line 99
    iget-object v4, p0, Ll/ixd0;->b:Ljava/lang/String;

    .line 100
    .line 101
    sget-object v5, Lcom/p1/mobile/putong/data/AuthData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 102
    .line 103
    invoke-virtual {v5, p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->serialize(Ljava/lang/Object;)[B

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-static {p1, v2}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-interface {v3, v4, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-direct {v0, v1, p1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 116
    .line 117
    .line 118
    return-object v0

    .line 119
    :catch_0
    move-exception p1

    .line 120
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 121
    .line 122
    .line 123
    new-instance p1, Landroid/util/Pair;

    .line 124
    .line 125
    invoke-virtual {p0}, Ll/ixd0;->d()Landroid/content/SharedPreferences;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    iget-object v1, p0, Ll/ixd0;->a:Ljava/lang/String;

    .line 134
    .line 135
    const-string v2, ""

    .line 136
    .line 137
    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {p0}, Ll/ixd0;->e()Landroid/content/SharedPreferences;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 146
    .line 147
    .line 148
    move-result-object v1

    .line 149
    iget-object p0, p0, Ll/ixd0;->b:Ljava/lang/String;

    .line 150
    .line 151
    invoke-interface {v1, p0, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-direct {p1, v0, p0}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    return-object p1
.end method

.method public final u(Ljava/lang/String;)I
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    :goto_0
    aget-char v0, p0, p1

    .line 7
    .line 8
    const/16 v1, 0x20

    .line 9
    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    add-int/lit8 p1, p1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    array-length v0, p0

    .line 16
    :goto_1
    add-int/lit8 v2, v0, -0x1

    .line 17
    .line 18
    aget-char v2, p0, v2

    .line 19
    .line 20
    if-ne v2, v1, :cond_1

    .line 21
    .line 22
    add-int/lit8 v0, v0, -0x1

    .line 23
    .line 24
    goto :goto_1

    .line 25
    :cond_1
    new-instance v1, Ljava/lang/String;

    .line 26
    .line 27
    sub-int/2addr v0, p1

    .line 28
    invoke-direct {v1, p0, p1, v0}, Ljava/lang/String;-><init>([CII)V

    .line 29
    .line 30
    .line 31
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public final v(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 p1, 0x0

    .line 6
    :goto_0
    aget-char v0, p0, p1

    .line 7
    .line 8
    const/16 v1, 0x20

    .line 9
    .line 10
    if-eq v0, v1, :cond_3

    .line 11
    .line 12
    const/16 v2, 0x22

    .line 13
    .line 14
    if-ne v0, v2, :cond_0

    .line 15
    .line 16
    goto :goto_3

    .line 17
    :cond_0
    array-length v0, p0

    .line 18
    :goto_1
    add-int/lit8 v3, v0, -0x1

    .line 19
    .line 20
    aget-char v3, p0, v3

    .line 21
    .line 22
    if-eq v3, v1, :cond_2

    .line 23
    .line 24
    if-ne v3, v2, :cond_1

    .line 25
    .line 26
    goto :goto_2

    .line 27
    :cond_1
    new-instance v1, Ljava/lang/String;

    .line 28
    .line 29
    sub-int/2addr v0, p1

    .line 30
    invoke-direct {v1, p0, p1, v0}, Ljava/lang/String;-><init>([CII)V

    .line 31
    .line 32
    .line 33
    return-object v1

    .line 34
    :cond_2
    :goto_2
    add-int/lit8 v0, v0, -0x1

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_3
    :goto_3
    add-int/lit8 p1, p1, 0x1

    .line 38
    .line 39
    goto :goto_0
.end method
