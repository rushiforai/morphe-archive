.class public final Lc36;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:[I

.field public static d:Z


# instance fields
.field public final a:Lb59;

.field public final b:Lii;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    const/16 v0, 0xc0

    const/16 v1, 0x80

    const/16 v2, 0x100

    filled-new-array {v2, v0, v1}, [I

    move-result-object v0

    sput-object v0, Lc36;->c:[I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lumi;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lii;

    const/16 v1, 0x8

    invoke-direct {v0, v1}, Lii;-><init>(B)V

    iput-object v0, p0, Lc36;->b:Lii;

    const/4 v0, 0x0

    new-array v0, v0, [Lbg1;

    const-string v1, "c"

    invoke-static {p1, p2, v1, v0}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lc36;->a:Lb59;

    return-void
.end method

.method public static varargs a([[B)[B
    .registers 8

    array-length v0, p0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_8

    aget-object p0, p0, v2

    return-object p0

    :cond_8
    array-length v0, p0

    move v1, v2

    move v3, v1

    :goto_b
    if-ge v1, v0, :cond_14

    aget-object v4, p0, v1

    array-length v4, v4

    add-int/2addr v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_b

    :cond_14
    new-array v0, v3, [B

    array-length v1, p0

    move v3, v2

    move v4, v3

    :goto_19
    if-ge v3, v1, :cond_26

    aget-object v5, p0, v3

    array-length v6, v5

    invoke-static {v5, v2, v0, v4, v6}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    array-length v5, v5

    add-int/2addr v4, v5

    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    :cond_26
    return-object v0
.end method

.method public static f([BLz26;Ljava/util/concurrent/atomic/AtomicBoolean;)Lb36;
    .registers 11

    if-eqz p0, :cond_7

    invoke-static {p0}, Ly26;->b([B)Ly26;

    move-result-object v0

    goto :goto_9

    :cond_7
    sget-object v0, Ly26;->c:Ly26;

    :goto_9
    const/4 v1, 0x0

    if-eqz v0, :cond_38

    const/4 v2, 0x1

    if-eqz p0, :cond_11

    move v3, v2

    goto :goto_12

    :cond_11
    const/4 v3, 0x0

    :goto_12
    iget-object v4, p1, Lz26;->b:Ljava/lang/Object;

    monitor-enter v4

    :try_start_15
    new-instance v5, Lge5;

    const/16 v6, 0x8

    invoke-direct {v5, p1, v0, v6}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    :try_end_1c
    .catchall {:try_start_15 .. :try_end_1c} :catchall_8b

    :try_start_1c
    iget-object p1, p1, Lz26;->a:Ljava/security/KeyStore;

    iget-object v6, v0, Ly26;->a:Ljava/lang/String;

    invoke-virtual {p1, v6, v1}, Ljava/security/KeyStore;->getKey(Ljava/lang/String;[C)Ljava/security/Key;

    move-result-object p1
    :try_end_24
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1c .. :try_end_24} :catch_25
    .catch Ljava/lang/NullPointerException; {:try_start_1c .. :try_end_24} :catch_25
    .catch Landroid/os/ParcelFormatException; {:try_start_1c .. :try_end_24} :catch_25
    .catch Ljava/security/UnrecoverableEntryException; {:try_start_1c .. :try_end_24} :catch_25
    .catch Ljava/security/KeyStoreException; {:try_start_1c .. :try_end_24} :catch_34
    .catchall {:try_start_1c .. :try_end_24} :catchall_8b

    goto :goto_26

    :catch_25
    move-object p1, v1

    :goto_26
    :try_start_26
    instance-of v6, p1, Ljavax/crypto/SecretKey;

    if-eqz v6, :cond_2d

    check-cast p1, Ljavax/crypto/SecretKey;

    goto :goto_35

    :cond_2d
    if-nez v3, :cond_34

    invoke-virtual {v5}, Lge5;->l()Ljavax/crypto/SecretKey;

    move-result-object p1
    :try_end_33
    .catch Ljava/security/KeyStoreException; {:try_start_26 .. :try_end_33} :catch_34
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_26 .. :try_end_33} :catch_34
    .catchall {:try_start_26 .. :try_end_33} :catchall_8b

    goto :goto_35

    :catch_34
    :cond_34
    move-object p1, v1

    :goto_35
    :try_start_35
    monitor-exit v4
    :try_end_36
    .catchall {:try_start_35 .. :try_end_36} :catchall_8b

    if-nez p1, :cond_39

    :cond_38
    return-object v1

    :cond_39
    :try_start_39
    const-string v3, "AES/GCM/NoPadding"

    invoke-static {v3}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v3

    if-nez p0, :cond_5e

    invoke-virtual {v3, v2, p1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    new-instance p0, Lro9;

    iget-object p1, v0, Ly26;->b:[B

    invoke-virtual {v3}, Ljavax/crypto/Cipher;->getParameters()Ljava/security/AlgorithmParameters;

    move-result-object v0

    const-class v4, Ljavax/crypto/spec/GCMParameterSpec;

    invoke-virtual {v0, v4}, Ljava/security/AlgorithmParameters;->getParameterSpec(Ljava/lang/Class;)Ljava/security/spec/AlgorithmParameterSpec;

    move-result-object v0

    check-cast v0, Ljavax/crypto/spec/GCMParameterSpec;

    invoke-virtual {v0}, Ljavax/crypto/spec/GCMParameterSpec;->getTLen()I

    move-result v0

    const/16 v4, 0xb

    invoke-direct {p0, v3, p1, v0, v4}, Lro9;-><init>(Ljava/lang/Object;Ljava/io/Serializable;IB)V

    goto :goto_83

    :cond_5e
    iget-object v0, v0, Ly26;->b:[B

    array-length v0, v0

    add-int/lit8 v4, v0, 0x2

    array-length v5, p0

    if-gt v4, v5, :cond_88

    add-int/lit8 v5, v0, 0x1

    aget-byte v0, p0, v0

    and-int/lit16 v0, v0, 0xff

    aget-byte v5, p0, v5

    and-int/lit16 v5, v5, 0xff

    add-int v6, v4, v0

    array-length v7, p0

    if-gt v6, v7, :cond_88

    new-instance v7, Ljavax/crypto/spec/GCMParameterSpec;

    invoke-direct {v7, v5, p0, v4, v0}, Ljavax/crypto/spec/GCMParameterSpec;-><init>(I[BII)V

    const/4 p0, 0x2

    invoke-virtual {v3, p0, p1, v7}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    new-instance p0, Lbp;

    invoke-direct {p0, v3, v6}, Lbp;-><init>(Ljava/lang/Object;I)V
    :try_end_83
    .catch Landroid/security/keystore/UserNotAuthenticatedException; {:try_start_39 .. :try_end_83} :catch_85
    .catch Landroid/security/keystore/KeyPermanentlyInvalidatedException; {:try_start_39 .. :try_end_83} :catch_88
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_39 .. :try_end_83} :catch_88
    .catch Ljava/security/InvalidKeyException; {:try_start_39 .. :try_end_83} :catch_88
    .catch Ljava/security/spec/InvalidParameterSpecException; {:try_start_39 .. :try_end_83} :catch_88
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_39 .. :try_end_83} :catch_88
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_39 .. :try_end_83} :catch_88
    .catch Ljava/security/ProviderException; {:try_start_39 .. :try_end_83} :catch_88

    :goto_83
    move-object v1, p0

    goto :goto_88

    :catch_85
    invoke-virtual {p2, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    :catch_88
    :cond_88
    :goto_88
    return-object v1

    :goto_89
    :try_start_89
    monitor-exit v4
    :try_end_8a
    .catchall {:try_start_89 .. :try_end_8a} :catchall_8b

    throw p0

    :catchall_8b
    move-exception p0

    goto :goto_89
.end method


# virtual methods
.method public final b([B)[B
    .registers 3

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    invoke-virtual {p0, p1, v0}, Lc36;->c([BLjava/util/concurrent/atomic/AtomicBoolean;)[B

    move-result-object p0

    return-object p0
.end method

.method public final c([BLjava/util/concurrent/atomic/AtomicBoolean;)[B
    .registers 16

    array-length v0, p1

    if-nez v0, :cond_4

    return-object p1

    :cond_4
    const/16 v0, 0x17

    invoke-static {p1, v0}, Ly26;->a([BB)Z

    move-result v0

    const/4 v1, 0x0

    iget-object v2, p0, Lc36;->b:Lii;

    if-nez v0, :cond_a2

    const/16 v0, 0x29

    invoke-static {p1, v0}, Ly26;->a([BB)Z

    move-result v0

    if-nez v0, :cond_a2

    const/16 p2, 0x12

    invoke-static {p1, p2}, Ly26;->a([BB)Z

    move-result p2

    const/4 v0, 0x0

    if-eqz p2, :cond_89

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lz26;

    if-nez p2, :cond_2c

    move-object v3, p1

    :cond_29
    :goto_29
    move-object p0, v1

    goto/16 :goto_b1

    :cond_2c
    const-string v2, "RSA/ECB/PKCS1Padding"

    invoke-static {p1}, Ly26;->b([B)Ly26;

    move-result-object v3

    if-eqz v3, :cond_87

    :try_start_34
    iget-object p2, p2, Lz26;->a:Ljava/security/KeyStore;

    iget-object v4, v3, Ly26;->a:Ljava/lang/String;

    invoke-virtual {p2, v4, v1}, Ljava/security/KeyStore;->getEntry(Ljava/lang/String;Ljava/security/KeyStore$ProtectionParameter;)Ljava/security/KeyStore$Entry;

    move-result-object p2
    :try_end_3c
    .catchall {:try_start_34 .. :try_end_3c} :catchall_87

    instance-of v4, p2, Ljava/security/KeyStore$PrivateKeyEntry;

    if-eqz v4, :cond_87

    new-instance v4, Ljava/security/KeyPair;

    check-cast p2, Ljava/security/KeyStore$PrivateKeyEntry;

    invoke-virtual {p2}, Ljava/security/KeyStore$PrivateKeyEntry;->getCertificate()Ljava/security/cert/Certificate;

    move-result-object v5

    invoke-virtual {v5}, Ljava/security/cert/Certificate;->getPublicKey()Ljava/security/PublicKey;

    move-result-object v5

    invoke-virtual {p2}, Ljava/security/KeyStore$PrivateKeyEntry;->getPrivateKey()Ljava/security/PrivateKey;

    move-result-object p2

    invoke-direct {v4, v5, p2}, Ljava/security/KeyPair;-><init>(Ljava/security/PublicKey;Ljava/security/PrivateKey;)V

    :try_start_53
    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object p2

    invoke-virtual {v4}, Ljava/security/KeyPair;->getPrivate()Ljava/security/PrivateKey;

    move-result-object v5

    const/4 v6, 0x2

    invoke-virtual {p2, v6, v5}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    invoke-static {v2}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v2

    invoke-virtual {v4}, Ljava/security/KeyPair;->getPublic()Ljava/security/PublicKey;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v2, v5, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;)V

    const-string v9, "cnssk_jbmr2"

    iget-object v10, v3, Ly26;->b:[B

    new-instance v11, Lbp;

    invoke-direct {v11, p2, v6}, Lbp;-><init>(Ljava/lang/Object;I)V

    new-instance v12, Lro9;

    new-array p2, v0, [B

    const/16 v3, 0xb

    invoke-direct {v12, v2, p2, v0, v3}, Lro9;-><init>(Ljava/lang/Object;Ljava/io/Serializable;IB)V
    :try_end_7d
    .catchall {:try_start_53 .. :try_end_7d} :catchall_87

    move-object v7, p0

    move-object v8, p1

    :try_start_7f
    invoke-virtual/range {v7 .. v12}, Lc36;->e([BLjava/lang/String;[BLb36;Lb36;)Lb36;

    move-result-object p0
    :try_end_83
    .catchall {:try_start_7f .. :try_end_83} :catchall_85

    move-object v3, v8

    goto :goto_b1

    :catchall_85
    move-object v3, v8

    goto :goto_ab

    :catchall_87
    :cond_87
    move-object v3, p1

    goto :goto_ab

    :cond_89
    move-object v2, p0

    move-object v3, p1

    invoke-static {v3, v0}, Ly26;->a([BB)Z

    move-result p0

    if-eqz p0, :cond_29

    new-instance v6, La36;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    sget-object p0, Ly26;->f:Ly26;

    const-string v4, "cnssk"

    iget-object v5, p0, Ly26;->b:[B

    move-object v7, v6

    invoke-virtual/range {v2 .. v7}, Lc36;->e([BLjava/lang/String;[BLb36;Lb36;)Lb36;

    move-result-object p0

    goto :goto_b1

    :cond_a2
    move-object v3, p1

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz26;

    if-nez p0, :cond_ad

    :goto_ab
    goto/16 :goto_29

    :cond_ad
    invoke-static {v3, p0, p2}, Lc36;->f([BLz26;Ljava/util/concurrent/atomic/AtomicBoolean;)Lb36;

    move-result-object p0

    :goto_b1
    if-nez p0, :cond_b4

    return-object v1

    :cond_b4
    invoke-interface {p0, v3}, Lb36;->r([B)[B

    move-result-object p0

    return-object p0
.end method

.method public final d([B)[B
    .registers 10

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    array-length v1, p1

    if-nez v1, :cond_9

    return-object p1

    :cond_9
    iget-object v1, p0, Lc36;->b:Lii;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lz26;

    const/4 v3, 0x0

    if-eqz v1, :cond_19

    invoke-static {v3, v1, v0}, Lc36;->f([BLz26;Ljava/util/concurrent/atomic/AtomicBoolean;)Lb36;

    move-result-object v0

    goto :goto_1a

    :cond_19
    move-object v0, v3

    :goto_1a
    if-nez v0, :cond_2d

    new-instance v6, La36;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    sget-object v0, Ly26;->f:Ly26;

    const-string v4, "cnssk"

    iget-object v5, v0, Ly26;->b:[B

    move-object v7, v6

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lc36;->e([BLjava/lang/String;[BLb36;Lb36;)Lb36;

    move-result-object v0

    :cond_2d
    if-nez v0, :cond_30

    return-object v3

    :cond_30
    invoke-interface {v0, p1}, Lb36;->r([B)[B

    move-result-object p0

    return-object p0
.end method

.method public final e([BLjava/lang/String;[BLb36;Lb36;)Lb36;
    .registers 11

    sget-boolean v0, Lc36;->d:Z

    const/4 v1, 0x0

    if-nez v0, :cond_b0

    iget-object p0, p0, Lc36;->a:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    invoke-interface {v0, p2, v1}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    const-string v3, "AES"

    const/4 v4, 0x0

    if-eqz v2, :cond_56

    if-eqz p1, :cond_1d

    return-object v1

    :cond_1d
    :try_start_1d
    invoke-static {v3}, Ljavax/crypto/KeyGenerator;->getInstance(Ljava/lang/String;)Ljavax/crypto/KeyGenerator;

    move-result-object p4
    :try_end_21
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1d .. :try_end_21} :catch_55

    move v0, v4

    :goto_22
    const/4 v2, 0x3

    if-ge v0, v2, :cond_34

    sget-object v2, Lc36;->c:[I

    aget v2, v2, v0

    :try_start_29
    invoke-virtual {p4, v2}, Ljavax/crypto/KeyGenerator;->init(I)V

    invoke-virtual {p4}, Ljavax/crypto/KeyGenerator;->generateKey()Ljavax/crypto/SecretKey;

    move-result-object p4
    :try_end_30
    .catch Ljava/security/InvalidParameterException; {:try_start_29 .. :try_end_30} :catch_31

    goto :goto_35

    :catch_31
    add-int/lit8 v0, v0, 0x1

    goto :goto_22

    :cond_34
    move-object p4, v1

    :goto_35
    if-eqz p4, :cond_b0

    invoke-interface {p4}, Ljava/security/Key;->getEncoded()[B

    move-result-object v0

    invoke-interface {p5, v0}, Lb36;->r([B)[B

    move-result-object p5

    if-eqz p5, :cond_b0

    invoke-static {p5, v4}, Landroid/util/Base64;->encodeToString([BI)Ljava/lang/String;

    move-result-object p5

    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_b0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-static {p0, p2, p5}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_65

    :catch_55
    return-object v1

    :cond_56
    invoke-static {v0, v4}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B

    move-result-object p0

    invoke-interface {p4, p0}, Lb36;->r([B)[B

    move-result-object p0

    if-eqz p0, :cond_b0

    new-instance p4, Ljavax/crypto/spec/SecretKeySpec;

    invoke-direct {p4, p0, v3}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    :goto_65
    :try_start_65
    const-string p0, "AES/CBC/PKCS5Padding"

    invoke-static {p0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object p0

    if-nez p1, :cond_8a

    const/16 p1, 0x10

    new-array p1, p1, [B

    new-instance p2, Ljava/security/SecureRandom;

    invoke-direct {p2}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {p2, p1}, Ljava/security/SecureRandom;->nextBytes([B)V

    new-instance p2, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {p2, p1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    const/4 p1, 0x1

    invoke-virtual {p0, p1, p4, p2}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    new-instance p1, Lro9;

    const/16 p2, 0xb

    invoke-direct {p1, p0, p3, v4, p2}, Lro9;-><init>(Ljava/lang/Object;Ljava/io/Serializable;IB)V

    return-object p1

    :cond_8a
    array-length p2, p3

    add-int/lit8 p3, p2, 0x2

    array-length p5, p1

    if-gt p3, p5, :cond_b0

    add-int/lit8 p5, p2, 0x1

    aget-byte p2, p1, p2

    and-int/lit16 p2, p2, 0xff

    aget-byte p5, p1, p5

    and-int/lit16 p5, p5, 0xff

    if-nez p5, :cond_b0

    add-int p5, p3, p2

    array-length v0, p1

    if-gt p5, v0, :cond_b0

    new-instance v0, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v0, p1, p3, p2}, Ljavax/crypto/spec/IvParameterSpec;-><init>([BII)V

    const/4 p1, 0x2

    invoke-virtual {p0, p1, p4, v0}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    new-instance p1, Lbp;

    invoke-direct {p1, p0, p5}, Lbp;-><init>(Ljava/lang/Object;I)V
    :try_end_af
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_65 .. :try_end_af} :catch_b0
    .catch Ljava/security/InvalidKeyException; {:try_start_65 .. :try_end_af} :catch_b0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_65 .. :try_end_af} :catch_b0
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_65 .. :try_end_af} :catch_b0

    return-object p1

    :catch_b0
    :cond_b0
    return-object v1
.end method
