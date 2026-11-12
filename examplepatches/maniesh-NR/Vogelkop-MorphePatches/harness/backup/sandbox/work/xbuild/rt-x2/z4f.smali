.class public final Lz4f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final b:[B

.field public static final c:[B


# instance fields
.field public final a:Lvx;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    const-string v1, "v11"

    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    sput-object v1, Lz4f;->b:[B

    const-string v1, "v10"

    invoke-virtual {v1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Lz4f;->c:[B

    return-void
.end method

.method public constructor <init>(Lvx;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lz4f;->a:Lvx;

    return-void
.end method


# virtual methods
.method public final a([B)[B
    .registers 8

    new-instance v0, Lkotlin/ranges/IntRange;

    sget-object v1, Lz4f;->b:[B

    array-length v2, v1

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    const/4 v4, 0x0

    invoke-direct {v0, v4, v2, v3}, Lkotlin/ranges/a;-><init>(III)V

    invoke-static {p1, v0}, Le82;->z([BLkotlin/ranges/IntRange;)[B

    move-result-object v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->equals([B[B)Z

    move-result v0

    const/4 v2, 0x0

    if-eqz v0, :cond_30

    array-length v0, v1

    iget-object p0, p0, Lz4f;->a:Lvx;

    invoke-virtual {p0}, Lvx;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lc36;

    array-length v1, p1

    invoke-static {v0, v1}, Ldjh;->j(II)Lkotlin/ranges/IntRange;

    move-result-object v0

    invoke-static {p1, v0}, Le82;->z([BLkotlin/ranges/IntRange;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Lc36;->b([B)[B

    move-result-object p0

    if-nez p0, :cond_2f

    return-object v2

    :cond_2f
    return-object p0

    :cond_30
    array-length p0, p1

    if-nez p0, :cond_36

    new-array p0, v4, [B

    return-object p0

    :cond_36
    new-instance p0, Lkotlin/ranges/IntRange;

    sget-object v0, Lz4f;->c:[B

    array-length v1, v0

    sub-int/2addr v1, v3

    invoke-direct {p0, v4, v1, v3}, Lkotlin/ranges/a;-><init>(III)V

    invoke-static {p1, p0}, Le82;->z([BLkotlin/ranges/IntRange;)[B

    move-result-object p0

    invoke-static {p0, v0}, Ljava/util/Arrays;->equals([B[B)Z

    move-result p0

    if-nez p0, :cond_4a

    return-object p1

    :cond_4a
    array-length p0, v0

    array-length v0, p1

    invoke-static {p0, v0}, Ldjh;->j(II)Lkotlin/ranges/IntRange;

    move-result-object p0

    invoke-static {p1, p0}, Le82;->z([BLkotlin/ranges/IntRange;)[B

    move-result-object p0

    sget-object p1, Lq36;->a:Ljava/security/SecureRandom;

    sget-object p1, Lm36;->a:[Lm36;

    sget-object p1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    const-string v0, "saltysalt"

    invoke-virtual {v0, p1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    const/16 v0, 0x80

    invoke-static {v0}, Lq36;->a(I)Z

    move-result v1

    if-eqz v1, :cond_7e

    new-instance v1, Ljavax/crypto/spec/PBEKeySpec;

    const/4 v5, 0x7

    new-array v5, v5, [C

    fill-array-data v5, :array_a2

    invoke-direct {v1, v5, p1, v3, v0}, Ljavax/crypto/spec/PBEKeySpec;-><init>([C[BII)V

    :try_start_73
    const-string p1, "PBKDF2withHmacSHA1"

    invoke-static {p1}, Ljavax/crypto/SecretKeyFactory;->getInstance(Ljava/lang/String;)Ljavax/crypto/SecretKeyFactory;

    move-result-object p1

    invoke-virtual {p1, v1}, Ljavax/crypto/SecretKeyFactory;->generateSecret(Ljava/security/spec/KeySpec;)Ljavax/crypto/SecretKey;

    move-result-object p1
    :try_end_7d
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_7d} :catch_7e

    goto :goto_7f

    :catch_7e
    :cond_7e
    move-object p1, v2

    :goto_7f
    if-eqz p1, :cond_a1

    const/16 v0, 0x10

    new-array v1, v0, [B

    :goto_85
    if-ge v4, v0, :cond_8e

    const/16 v3, 0x20

    aput-byte v3, v1, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_85

    :cond_8e
    const-string v0, "AES/CBC/PKCS5Padding"

    invoke-static {v0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v0

    :try_start_94
    new-instance v3, Ljavax/crypto/spec/IvParameterSpec;

    invoke-direct {v3, v1}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    const/4 v1, 0x2

    invoke-virtual {v0, v1, p1, v3}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    invoke-virtual {v0, p0}, Ljavax/crypto/Cipher;->doFinal([B)[B

    move-result-object v2
    :try_end_a1
    .catch Ljava/lang/Exception; {:try_start_94 .. :try_end_a1} :catch_a1

    :catch_a1
    :cond_a1
    return-object v2

    :array_a2
    .array-data 2
        0x70s
        0x65s
        0x61s
        0x6es
        0x75s
        0x74s
        0x73s
    .end array-data
.end method
