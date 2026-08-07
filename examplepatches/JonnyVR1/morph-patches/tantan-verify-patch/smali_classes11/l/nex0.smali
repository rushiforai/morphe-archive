.class public final Ll/nex0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pfx0;


# static fields
.field public static final d:Ljava/lang/ThreadLocal;


# instance fields
.field public final a:Ljavax/crypto/spec/SecretKeySpec;

.field public final b:I

.field public final c:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/mex0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/mex0;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/nex0;->d:Ljava/lang/ThreadLocal;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>([BI)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    invoke-static {v0}, Ll/s4x0;->a(I)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    array-length v0, p1

    .line 13
    invoke-static {v0}, Ll/ufx0;->a(I)V

    .line 14
    .line 15
    .line 16
    new-instance v0, Ljavax/crypto/spec/SecretKeySpec;

    .line 17
    .line 18
    const-string v2, "AES"

    .line 19
    .line 20
    invoke-direct {v0, p1, v2}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/nex0;->a:Ljavax/crypto/spec/SecretKeySpec;

    .line 24
    .line 25
    sget-object p1, Ll/nex0;->d:Ljava/lang/ThreadLocal;

    .line 26
    .line 27
    invoke-virtual {p1}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Ljavax/crypto/Cipher;

    .line 32
    .line 33
    invoke-virtual {p1}, Ljavax/crypto/Cipher;->getBlockSize()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    iput p1, p0, Ll/nex0;->c:I

    .line 38
    .line 39
    if-gt p2, p1, :cond_0

    .line 40
    .line 41
    iput p2, p0, Ll/nex0;->b:I

    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    const-string p0, "invalid IV size"

    .line 45
    .line 46
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    throw v1

    .line 50
    :cond_1
    const-string p0, "Can not use AES-CTR in FIPS-mode, as BoringCrypto module is not available."

    .line 51
    .line 52
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    throw v1
.end method


# virtual methods
.method public final zza([B)[B
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    iget v1, p0, Ll/nex0;->b:I

    .line 3
    .line 4
    const/4 v2, 0x0

    .line 5
    if-lt v0, v1, :cond_1

    .line 6
    .line 7
    new-array v3, v1, [B

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-static {p1, v4, v3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 11
    .line 12
    .line 13
    iget v7, p0, Ll/nex0;->b:I

    .line 14
    .line 15
    sub-int v8, v0, v7

    .line 16
    .line 17
    new-array v9, v8, [B

    .line 18
    .line 19
    sget-object v0, Ll/nex0;->d:Ljava/lang/ThreadLocal;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v5, v0

    .line 26
    check-cast v5, Ljavax/crypto/Cipher;

    .line 27
    .line 28
    iget v0, p0, Ll/nex0;->c:I

    .line 29
    .line 30
    iget v1, p0, Ll/nex0;->b:I

    .line 31
    .line 32
    new-array v0, v0, [B

    .line 33
    .line 34
    invoke-static {v3, v4, v0, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    .line 36
    .line 37
    new-instance v1, Ljavax/crypto/spec/IvParameterSpec;

    .line 38
    .line 39
    invoke-direct {v1, v0}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x2

    .line 43
    iget-object p0, p0, Ll/nex0;->a:Ljavax/crypto/spec/SecretKeySpec;

    .line 44
    .line 45
    invoke-virtual {v5, v0, p0, v1}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    .line 46
    .line 47
    .line 48
    const/4 v10, 0x0

    .line 49
    move-object v6, p1

    .line 50
    invoke-virtual/range {v5 .. v10}, Ljavax/crypto/Cipher;->doFinal([BII[BI)I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    if-ne p0, v8, :cond_0

    .line 55
    .line 56
    return-object v9

    .line 57
    :cond_0
    const-string p0, "stored output\'s length does not match input\'s length"

    .line 58
    .line 59
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-object v2

    .line 63
    :cond_1
    const-string p0, "ciphertext too short"

    .line 64
    .line 65
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-object v2
.end method
