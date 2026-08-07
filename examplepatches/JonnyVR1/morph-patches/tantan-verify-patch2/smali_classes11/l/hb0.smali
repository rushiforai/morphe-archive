.class public Ll/hb0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/g6c;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public final a:Ll/g6c;

.field public final b:[B

.field public final c:[B

.field public d:Ljavax/crypto/CipherInputStream;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/g6c;[B[B)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hb0;->a:Ll/g6c;

    .line 5
    .line 6
    iput-object p2, p0, Ll/hb0;->b:[B

    .line 7
    .line 8
    iput-object p3, p0, Ll/hb0;->c:[B

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hb0;->a:Ll/g6c;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/g6c;->a()Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hb0;->d:Ljavax/crypto/CipherInputStream;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Ll/hb0;->d:Ljavax/crypto/CipherInputStream;

    .line 7
    .line 8
    iget-object p0, p0, Ll/hb0;->a:Ll/g6c;

    .line 9
    .line 10
    invoke-interface {p0}, Ll/g6c;->close()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public final d()Landroid/net/Uri;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/hb0;->a:Ll/g6c;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/g6c;->d()Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final e(Ll/pgj0;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/hb0;->a:Ll/g6c;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/g6c;->e(Ll/pgj0;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j()Ljavax/crypto/Cipher;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljavax/crypto/NoSuchPaddingException;,
            Ljava/security/NoSuchAlgorithmException;
        }
    .end annotation

    .line 1
    const-string p0, "AES/CBC/PKCS7Padding"

    .line 2
    .line 3
    invoke-static {p0}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final n(Lcom/google/android/exoplayer2/upstream/a;)J
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    :try_start_0
    invoke-virtual {p0}, Ll/hb0;->j()Ljavax/crypto/Cipher;

    .line 4
    .line 5
    .line 6
    move-result-object v2
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljavax/crypto/NoSuchPaddingException; {:try_start_0 .. :try_end_0} :catch_2

    .line 7
    new-instance v3, Ljavax/crypto/spec/SecretKeySpec;

    .line 8
    .line 9
    iget-object v4, p0, Ll/hb0;->b:[B

    .line 10
    .line 11
    const-string v5, "AES"

    .line 12
    .line 13
    invoke-direct {v3, v4, v5}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    new-instance v4, Ljavax/crypto/spec/IvParameterSpec;

    .line 17
    .line 18
    iget-object v5, p0, Ll/hb0;->c:[B

    .line 19
    .line 20
    invoke-direct {v4, v5}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    .line 21
    .line 22
    .line 23
    const/4 v5, 0x2

    .line 24
    :try_start_1
    invoke-virtual {v2, v5, v3, v4}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V
    :try_end_1
    .catch Ljava/security/InvalidKeyException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/security/InvalidAlgorithmParameterException; {:try_start_1 .. :try_end_1} :catch_0

    .line 25
    .line 26
    .line 27
    new-instance v0, Ll/j6c;

    .line 28
    .line 29
    iget-object v1, p0, Ll/hb0;->a:Ll/g6c;

    .line 30
    .line 31
    invoke-direct {v0, v1, p1}, Ll/j6c;-><init>(Ll/g6c;Lcom/google/android/exoplayer2/upstream/a;)V

    .line 32
    .line 33
    .line 34
    new-instance p1, Ljavax/crypto/CipherInputStream;

    .line 35
    .line 36
    invoke-direct {p1, v0, v2}, Ljavax/crypto/CipherInputStream;-><init>(Ljava/io/InputStream;Ljavax/crypto/Cipher;)V

    .line 37
    .line 38
    .line 39
    iput-object p1, p0, Ll/hb0;->d:Ljavax/crypto/CipherInputStream;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/j6c;->m()V

    .line 42
    .line 43
    .line 44
    const-wide/16 p0, -0x1

    .line 45
    .line 46
    return-wide p0

    .line 47
    :catch_0
    move-exception p0

    .line 48
    goto :goto_0

    .line 49
    :catch_1
    move-exception p0

    .line 50
    :goto_0
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    return-wide v0

    .line 54
    :catch_2
    move-exception p0

    .line 55
    goto :goto_1

    .line 56
    :catch_3
    move-exception p0

    .line 57
    :goto_1
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    return-wide v0
.end method

.method public final read([BII)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/hb0;->d:Ljavax/crypto/CipherInputStream;

    .line 2
    .line 3
    invoke-static {v0}, Ll/w11;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ll/hb0;->d:Ljavax/crypto/CipherInputStream;

    .line 7
    .line 8
    invoke-virtual {p0, p1, p2, p3}, Ljavax/crypto/CipherInputStream;->read([BII)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-gez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, -0x1

    .line 15
    :cond_0
    return p0
.end method
