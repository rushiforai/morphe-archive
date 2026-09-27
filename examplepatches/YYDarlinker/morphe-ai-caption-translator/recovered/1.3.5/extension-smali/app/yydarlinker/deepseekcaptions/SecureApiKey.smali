.class final Lapp/yydarlinker/deepseekcaptions/SecureApiKey;
.super Ljava/lang/Object;
.source "SecureApiKey.java"


# static fields
.field private static final ALIAS:Ljava/lang/String; = "yydarlinker.deepseek.caption.api.key.v1"

.field private static final ANDROID_KEY_STORE:Ljava/lang/String; = "AndroidKeyStore"

.field private static final STORE:Ljava/lang/String; = "deepseek_caption_secret"

.field private static final VALUE:Ljava/lang/String; = "api_key_ciphertext"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 25
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static bindLegacyOrigin(Landroid/content/Context;)V
    .registers 5

    .line 85
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 86
    :try_start_3
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->valueKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_58

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->valueKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_origin"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_58

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->valueKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "_origin"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->origin(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {v1, v2, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 87
    :cond_58
    monitor-exit v0

    return-void

    :catchall_5a
    move-exception p0

    monitor-exit v0
    :try_end_5c
    .catchall {:try_start_3 .. :try_end_5c} :catchall_5a

    throw p0
.end method

.method static clear(Landroid/content/Context;)V
    .registers 3

    .line 95
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p0, v1}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->clear(Landroid/content/Context;Ljava/lang/String;)V

    monitor-exit v0

    return-void

    :catchall_c
    move-exception p0

    monitor-exit v0
    :try_end_e
    .catchall {:try_start_3 .. :try_end_e} :catchall_c

    throw p0
.end method

.method static clear(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    .line 99
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 100
    :try_start_3
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->valueKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {p0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p1}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->valueKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "_origin"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 101
    monitor-exit v0

    return-void

    :catchall_31
    move-exception p0

    monitor-exit v0
    :try_end_33
    .catchall {:try_start_3 .. :try_end_33} :catchall_31

    throw p0
.end method

.method private static getOrCreateKey()Ljavax/crypto/SecretKey;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 109
    const-string v0, "AndroidKeyStore"

    invoke-static {v0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v1

    const/4 v2, 0x0

    .line 110
    invoke-virtual {v1, v2}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 111
    const-string v3, "yydarlinker.deepseek.caption.api.key.v1"

    invoke-virtual {v1, v3, v2}, Ljava/security/KeyStore;->getKey(Ljava/lang/String;[C)Ljava/security/Key;

    move-result-object v1

    check-cast v1, Ljavax/crypto/SecretKey;

    if-eqz v1, :cond_15

    return-object v1

    .line 114
    :cond_15
    const-string v1, "AES"

    invoke-static {v1, v0}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object v0

    .line 115
    new-instance v1, Landroid/security/keystore/KeyGenParameterSpec$Builder;

    const/4 v2, 0x3

    invoke-direct {v1, v3, v2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;-><init>(Ljava/lang/String;I)V

    const-string v2, "GCM"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    .line 119
    invoke-virtual {v1, v2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setBlockModes([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object v1

    const-string v2, "NoPadding"

    filled-new-array {v2}, [Ljava/lang/String;

    move-result-object v2

    .line 120
    invoke-virtual {v1, v2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setEncryptionPaddings([Ljava/lang/String;)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object v1

    const/4 v2, 0x1

    .line 121
    invoke-virtual {v1, v2}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->setRandomizedEncryptionRequired(Z)Landroid/security/keystore/KeyGenParameterSpec$Builder;

    move-result-object v1

    .line 122
    invoke-virtual {v1}, Landroid/security/keystore/KeyGenParameterSpec$Builder;->build()Landroid/security/keystore/KeyGenParameterSpec;

    move-result-object v1

    .line 123
    invoke-virtual {v0, v1}, Ljavax/crypto/KeyGenerator;->init(Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 124
    invoke-virtual {v0}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object v0

    return-object v0
.end method

.method static hasKey(Landroid/content/Context;)Z
    .registers 1

    .line 90
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->load(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method static hasSavedValue(Landroid/content/Context;)Z
    .registers 4

    .line 88
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    :try_start_3
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->valueKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_19

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->originMatches(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_19

    const/4 p0, 0x1

    goto :goto_1a

    :cond_19
    const/4 p0, 0x0

    :goto_1a
    monitor-exit v0

    return p0

    :catchall_1c
    move-exception p0

    monitor-exit v0
    :try_end_1e
    .catchall {:try_start_3 .. :try_end_1e} :catchall_1c

    throw p0
.end method

.method static load(Landroid/content/Context;)Ljava/lang/String;
    .registers 7

    .line 48
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 49
    :try_start_3
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->originMatches(Landroid/content/Context;)Z

    move-result v1

    if-nez v1, :cond_d

    const-string p0, ""

    monitor-exit v0

    return-object p0

    .line 50
    :cond_d
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->valueKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    const-string v2, ""

    invoke-interface {v1, p0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_8e

    .line 51
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1
    :try_end_21
    .catchall {:try_start_3 .. :try_end_21} :catchall_92

    if-eqz v1, :cond_24

    goto :goto_8e

    :cond_24
    const/4 v1, 0x0

    .line 53
    :try_start_25
    invoke-static {p0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    .line 54
    invoke-static {p0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    const/16 v2, 0xc

    if-lt v1, v2, :cond_86

    const/16 v2, 0x20

    if-gt v1, v2, :cond_86

    .line 56
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    if-gt v2, v1, :cond_42

    goto :goto_86

    .line 57
    :cond_42
    new-array v1, v1, [B

    .line 58
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 59
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v2

    new-array v2, v2, [B

    .line 60
    invoke-virtual {p0, v2}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 62
    const-string p0, "AndroidKeyStore"

    invoke-static {p0}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object p0

    const/4 v3, 0x0

    .line 63
    invoke-virtual {p0, v3}, Ljava/security/KeyStore;->load(Ljava/security/KeyStore$LoadStoreParameter;)V

    .line 64
    const-string v4, "yydarlinker.deepseek.caption.api.key.v1"

    invoke-virtual {p0, v4, v3}, Ljava/security/KeyStore;->getKey(Ljava/lang/String;[C)Ljava/security/Key;

    move-result-object p0

    check-cast p0, Ljavax/crypto/SecretKey;

    if-nez p0, :cond_68

    .line 65
    const-string p0, ""
    :try_end_66
    .catchall {:try_start_25 .. :try_end_66} :catchall_8a

    :try_start_66
    monitor-exit v0
    :try_end_67
    .catchall {:try_start_66 .. :try_end_67} :catchall_92

    return-object p0

    .line 67
    :cond_68
    :try_start_68
    const-string v3, "AES/GCM/NoPadding"

    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v3

    .line 68
    new-instance v4, Ljavax/crypto/spec/GCMParameterSpec;

    const/16 v5, 0x80

    invoke-direct {v4, v5, v1}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[B)V

    const/4 v1, 0x2

    invoke-virtual {v3, v1, p0, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 69
    new-instance p0, Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v1

    sget-object v2, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {p0, v1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_84
    .catchall {:try_start_68 .. :try_end_84} :catchall_8a

    :try_start_84
    monitor-exit v0
    :try_end_85
    .catchall {:try_start_84 .. :try_end_85} :catchall_92

    return-object p0

    .line 56
    :cond_86
    :goto_86
    :try_start_86
    const-string p0, ""
    :try_end_88
    .catchall {:try_start_86 .. :try_end_88} :catchall_8a

    :try_start_88
    monitor-exit v0

    return-object p0

    .line 71
    :catchall_8a
    const-string p0, ""

    monitor-exit v0

    return-object p0

    .line 51
    :cond_8e
    :goto_8e
    const-string p0, ""

    monitor-exit v0

    return-object p0

    :catchall_92
    move-exception p0

    .line 73
    monitor-exit v0
    :try_end_94
    .catchall {:try_start_88 .. :try_end_94} :catchall_92

    throw p0
.end method

.method private static origin(Landroid/content/Context;)Ljava/lang/String;
    .registers 4

    .line 81
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->values(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    const-string v0, "base_url"

    const-string v1, "https://api.deepseek.com"

    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/net/URI;->getRawAuthority()Ljava/lang/String;

    move-result-object p0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static originMatches(Landroid/content/Context;)Z
    .registers 4

    .line 84
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->valueKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_origin"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_32

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->origin(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_30

    goto :goto_32

    :cond_30
    const/4 p0, 0x0

    return p0

    :cond_32
    :goto_32
    const/4 p0, 0x1

    return p0
.end method

.method private static prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 105
    const-string v0, "deepseek_caption_secret"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0
.end method

.method static save(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 28
    sget-object v0, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    if-eqz p1, :cond_7d

    .line 29
    :try_start_5
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_7d

    .line 32
    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->getOrCreateKey()Ljavax/crypto/SecretKey;

    move-result-object v1

    .line 33
    const-string v2, "AES/GCM/NoPadding"

    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v2

    const/4 v3, 0x1

    .line 34
    invoke-virtual {v2, v3, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    .line 35
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {v2, p1}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p1

    .line 36
    invoke-virtual {v2}, Ljavax/crypto/Cipher;->getIV()[B

    move-result-object v1

    .line 38
    array-length v2, v1

    add-int/2addr v2, v3

    array-length v3, p1

    add-int/2addr v2, v3

    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 39
    array-length v3, v1

    int-to-byte v3, v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    .line 40
    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 41
    invoke-virtual {v2, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 42
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p1

    const/4 v1, 0x2

    invoke-static {p1, v1}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p1

    .line 43
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->prefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->valueKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->valueKey(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "_origin"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->origin(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, v1, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 44
    monitor-exit v0

    return-void

    .line 30
    :cond_7d
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "API Key \u4e0d\u80fd\u4e3a\u7a7a"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :catchall_85
    move-exception p0

    .line 44
    monitor-exit v0
    :try_end_87
    .catchall {:try_start_5 .. :try_end_87} :catchall_85

    throw p0
.end method

.method private static valueKey(Landroid/content/Context;)Ljava/lang/String;
    .registers 1

    .line 77
    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/ApiProfiles;->active(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lapp/yydarlinker/deepseekcaptions/SecureApiKey;->valueKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static valueKey(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 78
    const-string v0, "default"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const-string p0, "api_key_ciphertext"

    return-object p0

    :cond_b
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "api_key_ciphertext_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
