.class public Lcom/leanplum/internal/AESCrypt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/leanplum/internal/AESCrypt$EncryptionType;
    }
.end annotation


# static fields
.field private static final APP_ID_KEY_PREFIX:Ljava/lang/String; = "Lq3fz"

.field private static final APP_ID_KEY_SUFFIX:Ljava/lang/String; = "bLti2"


# instance fields
.field private final appId:Ljava/lang/String;

.field private final token:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/leanplum/internal/AESCrypt;->appId:Ljava/lang/String;

    iput-object p2, p0, Lcom/leanplum/internal/AESCrypt;->token:Ljava/lang/String;

    return-void
.end method

.method private appIdKeyPassword()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lcom/leanplum/internal/AESCrypt;->APP_ID_KEY_PREFIX:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lcom/leanplum/internal/AESCrypt;->appId:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Lcom/leanplum/internal/AESCrypt;->APP_ID_KEY_SUFFIX:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static decryptInternal(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    const-string v0, "Invalid ciphertext: "

    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_4
    invoke-static {p1}, Lcom/leanplum/internal/AESCrypt;->parseCiphertextInternal(Ljava/lang/String;)[B

    move-result-object v3

    if-nez v3, :cond_1c

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-array p1, v2, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v1

    :cond_1c
    const/4 p1, 0x2

    invoke-static {p1, p0, v3}, Lcom/leanplum/internal/AESCrypt;->performCryptOperation(ILjava/lang/String;[B)[B

    move-result-object p0

    if-eqz p0, :cond_43

    new-instance p1, Ljava/lang/String;

    const-string v0, "UTF-8"

    invoke-direct {p1, p0, v0}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_2a
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_2a} :catch_2b

    return-object p1

    :catch_2b
    move-exception p0

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Could not encode UTF8 string.\n"

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/leanplum/internal/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-array p1, v2, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_43
    return-object v1
.end method

.method public static encryptInternal(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    :try_start_0
    const-string v0, "UTF-8"

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    const/4 v1, 0x1

    invoke-static {v1, p0, v0}, Lcom/leanplum/internal/AESCrypt;->performCryptOperation(ILjava/lang/String;[B)[B

    move-result-object p0

    invoke-static {p0}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object p0
    :try_end_f
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_f} :catch_10

    return-object p0

    :catch_10
    move-exception p0

    const-string v0, "Unable to encrypt "

    invoke-static {v0, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p1, p0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method private static parseCiphertextInternal(Ljava/lang/String;)[B
    .registers 5

    const/4 v0, 0x0

    if-nez p0, :cond_4

    return-object v0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x2

    if-ge v1, v2, :cond_10

    return-object v0

    :cond_10
    :try_start_10
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p0

    const-string v1, "\\s*,\\s*"

    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    array-length v1, p0

    new-array v1, v1, [B

    const/4 v2, 0x0

    :goto_28
    array-length v3, p0

    if-ge v2, v3, :cond_36

    aget-object v3, p0, v2

    invoke-static {v3}, Ljava/lang/Byte;->parseByte(Ljava/lang/String;)B

    move-result v3

    aput-byte v3, v1, v2
    :try_end_33
    .catch Ljava/lang/NumberFormatException; {:try_start_10 .. :try_end_33} :catch_37

    add-int/lit8 v2, v2, 0x1

    goto :goto_28

    :cond_36
    return-object v1

    :catch_37
    return-object v0
.end method

.method private static performCryptOperation(ILjava/lang/String;[B)[B
    .registers 8

    const-string v0, "UTF-8"

    :try_start_2
    const-string v1, "L3@nP1Vm"

    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v1

    const-string v2, "__l3anplum__iv__"

    invoke-virtual {v2, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object v0

    new-instance v2, Ljavax/crypto/spec/PBEKeySpec;

    invoke-virtual {p1}, Ljava/lang/String;->toCharArray()[C

    move-result-object p1

    const/16 v3, 0x3e8

    const/16 v4, 0x100

    invoke-direct {v2, p1, v1, v3, v4}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C[BII)V

    const-string p1, "PBEWithMD5And128BitAES-CBC-OpenSSL"

    invoke-static {p1}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object p1

    invoke-interface {p1}, Ljava/security/Key;->getEncoded()[B

    move-result-object p1

    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    const-string v2, "AES"

    invoke-direct {v1, p1, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    const-string p1, "AES/CBC/PKCS5Padding"

    invoke-static {p1}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object p1

    new-instance v2, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v2, v0}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    invoke-virtual {p1, p0, v1, v2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    invoke-virtual {p1, p2}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object p0
    :try_end_42
    .catch Ljava/security/InvalidKeyException; {:try_start_2 .. :try_end_42} :catch_43
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_2 .. :try_end_42} :catch_43
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_2 .. :try_end_42} :catch_43
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_2 .. :try_end_42} :catch_43
    .catch Ljavax/crypto/IllegalBlockSizeException; {:try_start_2 .. :try_end_42} :catch_43
    .catch Ljavax/crypto/BadPaddingException; {:try_start_2 .. :try_end_42} :catch_43
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_2 .. :try_end_42} :catch_43
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_2 .. :try_end_42} :catch_43

    return-object p0

    :catch_43
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public decodePreference(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    const/4 v0, 0x0

    invoke-interface {p1, p2, v0}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_d

    invoke-virtual {p0, p1}, Lcom/leanplum/internal/AESCrypt;->decrypt(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_e

    :cond_d
    return-object p3

    :cond_e
    return-object p0
.end method

.method public decrypt(Ljava/lang/String;)Ljava/lang/String;
    .registers 7

    invoke-static {p1}, Lcom/leanplum/internal/AESCrypt$EncryptionType;->parseCipherText(Ljava/lang/String;)Landroid/util/Pair;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-nez v0, :cond_14

    const-string p0, "Got null encryptionSpec for encrypted: "

    invoke-static {p0, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_76

    :cond_14
    sget-object v3, Lcom/leanplum/internal/AESCrypt$1;->$SwitchMap$com$leanplum$internal$AESCrypt$EncryptionType:[I

    iget-object v4, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v4, Lcom/leanplum/internal/AESCrypt$EncryptionType;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    aget v3, v3, v4

    const/4 v4, 0x1

    if-eq v3, v4, :cond_45

    const/4 v4, 0x2

    if-ne v3, v4, :cond_76

    iget-object v3, p0, Lcom/leanplum/internal/AESCrypt;->appId:Ljava/lang/String;

    if-eqz v3, :cond_3d

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3d

    invoke-direct {p0}, Lcom/leanplum/internal/AESCrypt;->appIdKeyPassword()Ljava/lang/String;

    move-result-object p0

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/leanplum/internal/AESCrypt;->decryptInternal(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_76

    :cond_3d
    const-string p0, "Decrypt called with null appId."

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_76

    :cond_45
    iget-object v3, p0, Lcom/leanplum/internal/AESCrypt;->token:Ljava/lang/String;

    if-eqz v3, :cond_6f

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_6f

    iget-object p0, p0, Lcom/leanplum/internal/AESCrypt;->token:Ljava/lang/String;

    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-static {p0, v0}, Lcom/leanplum/internal/AESCrypt;->decryptInternal(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_6d

    invoke-static {p0}, Lcom/leanplum/internal/AESCrypt;->parseCiphertextInternal(Ljava/lang/String;)[B

    move-result-object v0

    if-eqz v0, :cond_6d

    const-string p1, "Discarding legacy value that appears to be an encrypted value: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v2

    :cond_6d
    move-object v2, p0

    goto :goto_76

    :cond_6f
    const-string p0, "Decrypt called with null token."

    new-array v0, v1, [Ljava/lang/Object;

    invoke-static {p0, v0}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_76
    :goto_76
    if-nez v2, :cond_83

    const-string p0, "Unable to decrypt "

    invoke-static {p0, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-array p1, v1, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    :cond_83
    return-object v2
.end method

.method public encrypt(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    :cond_4
    iget-object v1, p0, Lcom/leanplum/internal/AESCrypt;->appId:Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v1, :cond_4f

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4f

    invoke-direct {p0}, Lcom/leanplum/internal/AESCrypt;->appIdKeyPassword()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0, p1}, Lcom/leanplum/internal/AESCrypt;->encryptInternal(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_21

    const-string p0, "Failed to encrypt."

    new-array p1, v2, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0

    :cond_21
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_43

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_43

    const-string p1, "["

    invoke-virtual {p0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_43

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v0, Lcom/leanplum/internal/AESCrypt$EncryptionType;->APP_ID_KEY:Lcom/leanplum/internal/AESCrypt$EncryptionType;

    iget-object v0, v0, Lcom/leanplum/internal/AESCrypt$EncryptionType;->prefix:Ljava/lang/String;

    invoke-static {p1, v0, p0}, Lz1m;->l(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_43
    const-string p1, "Invalid ciphertext: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    new-array p1, v2, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->d(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0

    :cond_4f
    const-string p0, "Encrypt called with null appId."

    new-array p1, v2, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-object v0
.end method
