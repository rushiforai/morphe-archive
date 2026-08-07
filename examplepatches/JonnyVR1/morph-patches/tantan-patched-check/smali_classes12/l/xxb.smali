.class public Ll/xxb;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:[B

.field private b:[B

.field private c:Ljava/security/interfaces/RSAPublicKey;

.field protected d:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Ll/xxb;->d:Z

    .line 6
    .line 7
    :try_start_0
    invoke-static {p1}, Ll/uic0;->b(Ljava/lang/String;)Ljava/security/interfaces/RSAPublicKey;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ll/xxb;->c:Ljava/security/interfaces/RSAPublicKey;

    .line 12
    .line 13
    const/16 p1, 0x10

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ll/xxb;->d(I)[B

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/xxb;->a:[B

    .line 20
    .line 21
    iget-object v0, p0, Ll/xxb;->c:Ljava/security/interfaces/RSAPublicKey;

    .line 22
    .line 23
    invoke-static {v0, p1}, Ll/uic0;->a(Ljava/security/interfaces/RSAPublicKey;[B)[B

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, p0, Ll/xxb;->b:[B

    .line 28
    .line 29
    iput-boolean p2, p0, Ll/xxb;->d:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    .line 31
    return-void

    .line 32
    :catch_0
    const-string p0, "fail to init crypto manager"

    .line 33
    .line 34
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    throw p0
.end method

.method private d(I)[B
    .locals 0

    .line 1
    new-instance p0, Ljava/security/SecureRandom;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/security/SecureRandom;-><init>()V

    .line 4
    .line 5
    .line 6
    new-array p1, p1, [B

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/security/SecureRandom;->nextBytes([B)V

    .line 9
    .line 10
    .line 11
    return-object p1
.end method


# virtual methods
.method public a([B)[B
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/xxb;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/xxb;->a:[B

    .line 6
    .line 7
    invoke-static {p1, p0}, Ll/f;->a([B[B)[B

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0

    .line 12
    :cond_0
    return-object p1
.end method

.method public b()[B
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxb;->b:[B

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/xxb;->d:Z

    .line 2
    .line 3
    return p0
.end method
