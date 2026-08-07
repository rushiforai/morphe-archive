.class public final Ll/rex0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jww0;


# instance fields
.field public final a:Ll/d4x0;

.field public final b:[B


# direct methods
.method public constructor <init>([BLl/wfx0;)V
    .locals 2
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
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v0, Ll/d4x0;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-direct {v0, p1, v1}, Ll/d4x0;-><init>([BZ)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/rex0;->a:Ll/d4x0;

    .line 18
    .line 19
    invoke-virtual {p2}, Ll/wfx0;->c()[B

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Ll/rex0;->b:[B

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    const-string p0, "Can not use AES-GCM in FIPS-mode, as BoringCrypto module is not available."

    .line 27
    .line 28
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    throw p0
.end method

.method public static b(Ll/a0x0;)Ll/jww0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/a0x0;->b()Ll/o0x0;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/a0x0;->b()Ll/o0x0;

    .line 5
    .line 6
    .line 7
    new-instance v0, Ll/rex0;

    .line 8
    .line 9
    invoke-virtual {p0}, Ll/a0x0;->d()Ll/xfx0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {}, Ll/www0;->a()Ll/ayw0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v1, v2}, Ll/xfx0;->d(Ll/ayw0;)[B

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p0}, Ll/a0x0;->c()Ll/wfx0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-direct {v0, v1, p0}, Ll/rex0;-><init>([BLl/wfx0;)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public final a([B[B)[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rex0;->b:[B

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/16 v2, 0xc

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    invoke-static {p1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Ll/rex0;->a:Ll/d4x0;

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1, p2}, Ll/d4x0;->a([B[B[B)[B

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0

    .line 19
    :cond_0
    invoke-static {v0, p1}, Ll/u7x0;->b([B[B)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/rex0;->b:[B

    .line 26
    .line 27
    array-length v1, p1

    .line 28
    array-length v0, v0

    .line 29
    invoke-static {p1, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object p0, p0, Ll/rex0;->a:Ll/d4x0;

    .line 38
    .line 39
    invoke-virtual {p0, v0, p1, p2}, Ll/d4x0;->a([B[B[B)[B

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    return-object p0

    .line 44
    :cond_1
    const-string p0, "Decryption failed (OutputPrefix mismatch)."

    .line 45
    .line 46
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method
