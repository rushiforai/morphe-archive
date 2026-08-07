.class public final Ll/iyw0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/jww0;


# instance fields
.field public final a:Ll/sxw0;

.field public final b:Ll/oax0;

.field public final c:Ll/oax0;


# direct methods
.method public synthetic constructor <init>(Ll/sxw0;Ll/hyw0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iyw0;->a:Ll/sxw0;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/sxw0;->f()Z

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    invoke-static {}, Ll/b6x0;->a()Ll/b6x0;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    invoke-virtual {p2}, Ll/b6x0;->b()Ll/pax0;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-static {p1}, Ll/u5x0;->a(Ll/sxw0;)Ll/yax0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const-string v0, "encrypt"

    .line 25
    .line 26
    const-string v1, "aead"

    .line 27
    .line 28
    invoke-interface {p2, p1, v1, v0}, Ll/pax0;->a(Ll/yax0;Ljava/lang/String;Ljava/lang/String;)Ll/oax0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Ll/iyw0;->b:Ll/oax0;

    .line 33
    .line 34
    const-string v0, "decrypt"

    .line 35
    .line 36
    invoke-interface {p2, p1, v1, v0}, Ll/pax0;->a(Ll/yax0;Ljava/lang/String;Ljava/lang/String;)Ll/oax0;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    :goto_0
    iput-object p1, p0, Ll/iyw0;->c:Ll/oax0;

    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    sget-object p1, Ll/u5x0;->a:Ll/oax0;

    .line 44
    .line 45
    iput-object p1, p0, Ll/iyw0;->b:Ll/oax0;

    .line 46
    .line 47
    goto :goto_0
.end method


# virtual methods
.method public final a([B[B)[B
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/GeneralSecurityException;
        }
    .end annotation

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x5

    .line 3
    if-le v0, v1, :cond_0

    .line 4
    .line 5
    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    invoke-static {p1, v1, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Ll/iyw0;->a:Ll/sxw0;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Ll/sxw0;->e([B)Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    :catch_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Ll/oxw0;

    .line 34
    .line 35
    :try_start_0
    invoke-virtual {v2}, Ll/oxw0;->e()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Ll/jww0;

    .line 40
    .line 41
    invoke-interface {v3, v0, p2}, Ll/jww0;->a([B[B)[B

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v2}, Ll/oxw0;->a()I

    .line 46
    .line 47
    .line 48
    array-length p0, v0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    return-object v3

    .line 50
    :cond_0
    iget-object p0, p0, Ll/iyw0;->a:Ll/sxw0;

    .line 51
    .line 52
    sget-object v0, Ll/oww0;->a:[B

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ll/sxw0;->e([B)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    :catch_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_1

    .line 67
    .line 68
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    check-cast v0, Ll/oxw0;

    .line 73
    .line 74
    :try_start_1
    invoke-virtual {v0}, Ll/oxw0;->e()Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Ll/jww0;

    .line 79
    .line 80
    invoke-interface {v1, p1, p2}, Ll/jww0;->a([B[B)[B

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {v0}, Ll/oxw0;->a()I
    :try_end_1
    .catch Ljava/security/GeneralSecurityException; {:try_start_1 .. :try_end_1} :catch_1

    .line 85
    .line 86
    .line 87
    return-object v1

    .line 88
    :cond_1
    const-string p0, "decryption failed"

    .line 89
    .line 90
    invoke-static {p0}, Ll/phw0;->a(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    const/4 p0, 0x0

    .line 94
    return-object p0
.end method
