.class public final Ll/l0x0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/Integer;

.field public b:Ljava/lang/Integer;

.field public c:Ljava/lang/Integer;

.field public d:Ll/m0x0;


# direct methods
.method public synthetic constructor <init>(Ll/k0x0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/l0x0;->a:Ljava/lang/Integer;

    .line 6
    .line 7
    iput-object p1, p0, Ll/l0x0;->b:Ljava/lang/Integer;

    .line 8
    .line 9
    iput-object p1, p0, Ll/l0x0;->c:Ljava/lang/Integer;

    .line 10
    .line 11
    sget-object p1, Ll/m0x0;->d:Ll/m0x0;

    .line 12
    .line 13
    iput-object p1, p0, Ll/l0x0;->d:Ll/m0x0;

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public final a(I)Ll/l0x0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    const/16 p1, 0xc

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/l0x0;->b:Ljava/lang/Integer;

    .line 8
    .line 9
    return-object p0
.end method

.method public final b(I)Ll/l0x0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    if-eq p1, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0x18

    .line 6
    .line 7
    if-eq p1, v0, :cond_1

    .line 8
    .line 9
    const/16 v0, 0x20

    .line 10
    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance p0, Ljava/security/InvalidAlgorithmParameterException;

    .line 15
    .line 16
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v0, "Invalid key size %d; only 16-byte, 24-byte and 32-byte AES keys are supported"

    .line 25
    .line 26
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-direct {p0, p1}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    throw p0

    .line 34
    :cond_1
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Ll/l0x0;->a:Ljava/lang/Integer;

    .line 39
    .line 40
    return-object p0
.end method

.method public final c(I)Ll/l0x0;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    const/16 p1, 0x10

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, Ll/l0x0;->c:Ljava/lang/Integer;

    .line 8
    .line 9
    return-object p0
.end method

.method public final d(Ll/m0x0;)Ll/l0x0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/l0x0;->d:Ll/m0x0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final e()Ll/o0x0;
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/l0x0;->a:Ljava/lang/Integer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    iget-object v2, p0, Ll/l0x0;->d:Ll/m0x0;

    .line 7
    .line 8
    if-eqz v2, :cond_2

    .line 9
    .line 10
    iget-object v2, p0, Ll/l0x0;->b:Ljava/lang/Integer;

    .line 11
    .line 12
    if-eqz v2, :cond_1

    .line 13
    .line 14
    iget-object v2, p0, Ll/l0x0;->c:Ljava/lang/Integer;

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    new-instance v3, Ll/o0x0;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    iget-object v0, p0, Ll/l0x0;->b:Ljava/lang/Integer;

    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/l0x0;->c:Ljava/lang/Integer;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    .line 33
    .line 34
    iget-object v7, p0, Ll/l0x0;->d:Ll/m0x0;

    .line 35
    .line 36
    const/4 v8, 0x0

    .line 37
    const/16 v5, 0xc

    .line 38
    .line 39
    const/16 v6, 0x10

    .line 40
    .line 41
    invoke-direct/range {v3 .. v8}, Ll/o0x0;-><init>(IIILl/m0x0;Ll/n0x0;)V

    .line 42
    .line 43
    .line 44
    return-object v3

    .line 45
    :cond_0
    const-string p0, "Tag size is not set"

    .line 46
    .line 47
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    return-object v1

    .line 51
    :cond_1
    const-string p0, "IV size is not set"

    .line 52
    .line 53
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    return-object v1

    .line 57
    :cond_2
    const-string p0, "Variant is not set"

    .line 58
    .line 59
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return-object v1

    .line 63
    :cond_3
    const-string p0, "Key size is not set"

    .line 64
    .line 65
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-object v1
.end method
