.class public final Ll/y0x0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/lang/Integer;

.field public b:Ll/z0x0;


# direct methods
.method public synthetic constructor <init>(Ll/x0x0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iput-object p1, p0, Ll/y0x0;->a:Ljava/lang/Integer;

    .line 6
    .line 7
    sget-object p1, Ll/z0x0;->d:Ll/z0x0;

    .line 8
    .line 9
    iput-object p1, p0, Ll/y0x0;->b:Ll/z0x0;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public final a(I)Ll/y0x0;
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
    const/16 v0, 0x20

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance p0, Ljava/security/InvalidAlgorithmParameterException;

    .line 11
    .line 12
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    const-string v0, "Invalid key size %d; only 16-byte and 32-byte AES keys are supported"

    .line 21
    .line 22
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-direct {p0, p1}, Ljava/security/InvalidAlgorithmParameterException;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    throw p0

    .line 30
    :cond_1
    :goto_0
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Ll/y0x0;->a:Ljava/lang/Integer;

    .line 35
    .line 36
    return-object p0
.end method

.method public final b(Ll/z0x0;)Ll/y0x0;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/y0x0;->b:Ll/z0x0;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()Ll/b1x0;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/y0x0;->a:Ljava/lang/Integer;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    iget-object v2, p0, Ll/y0x0;->b:Ll/z0x0;

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    new-instance v2, Ll/b1x0;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iget-object p0, p0, Ll/y0x0;->b:Ll/z0x0;

    .line 17
    .line 18
    invoke-direct {v2, v0, p0, v1}, Ll/b1x0;-><init>(ILl/z0x0;Ll/a1x0;)V

    .line 19
    .line 20
    .line 21
    return-object v2

    .line 22
    :cond_0
    const-string p0, "Variant is not set"

    .line 23
    .line 24
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-object v1

    .line 28
    :cond_1
    const-string p0, "Key size is not set"

    .line 29
    .line 30
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-object v1
.end method
