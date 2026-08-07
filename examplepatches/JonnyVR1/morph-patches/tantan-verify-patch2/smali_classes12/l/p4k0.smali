.class public Ll/p4k0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Ljava/lang/String;

.field private final b:Lcom/immomo/network/bean/UrlType;

.field private final c:Lcom/immomo/network/bean/CheckerStatus;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/immomo/network/bean/CheckerStatus;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/p4k0;->a:Ljava/lang/String;

    .line 5
    .line 6
    invoke-direct {p0, p1}, Ll/p4k0;->c(Ljava/lang/String;)Lcom/immomo/network/bean/UrlType;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ll/p4k0;->b:Lcom/immomo/network/bean/UrlType;

    .line 11
    .line 12
    iput-object p2, p0, Ll/p4k0;->c:Lcom/immomo/network/bean/CheckerStatus;

    .line 13
    .line 14
    return-void
.end method

.method private c(Ljava/lang/String;)Lcom/immomo/network/bean/UrlType;
    .locals 0

    .line 1
    invoke-static {p1}, Ll/rl20;->f(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/immomo/network/bean/UrlType;->IPV6:Lcom/immomo/network/bean/UrlType;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {p1}, Ll/rl20;->d(Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    sget-object p0, Lcom/immomo/network/bean/UrlType;->IPV4:Lcom/immomo/network/bean/UrlType;

    .line 17
    .line 18
    return-object p0

    .line 19
    :cond_1
    sget-object p0, Lcom/immomo/network/bean/UrlType;->UNKNOWN:Lcom/immomo/network/bean/UrlType;

    .line 20
    .line 21
    return-object p0
.end method


# virtual methods
.method public a()I
    .locals 1

    .line 1
    iget-object p0, p0, Ll/p4k0;->c:Lcom/immomo/network/bean/CheckerStatus;

    .line 2
    .line 3
    sget-object v0, Lcom/immomo/network/bean/CheckerStatus;->DISABLED:Lcom/immomo/network/bean/CheckerStatus;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, -0x1

    .line 8
    return p0

    .line 9
    :cond_0
    sget-object v0, Lcom/immomo/network/bean/CheckerStatus;->PARAMS_ILLEGAL:Lcom/immomo/network/bean/CheckerStatus;

    .line 10
    .line 11
    if-ne p0, v0, :cond_1

    .line 12
    .line 13
    const/4 p0, -0x2

    .line 14
    return p0

    .line 15
    :cond_1
    sget-object v0, Lcom/immomo/network/bean/CheckerStatus;->DNS_DISABLED:Lcom/immomo/network/bean/CheckerStatus;

    .line 16
    .line 17
    if-ne p0, v0, :cond_2

    .line 18
    .line 19
    const/16 p0, -0x65

    .line 20
    .line 21
    return p0

    .line 22
    :cond_2
    sget-object v0, Lcom/immomo/network/bean/CheckerStatus;->EXCEPTION:Lcom/immomo/network/bean/CheckerStatus;

    .line 23
    .line 24
    if-ne p0, v0, :cond_3

    .line 25
    .line 26
    const/16 p0, -0x66

    .line 27
    .line 28
    return p0

    .line 29
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0
.end method

.method public b()Lcom/immomo/network/bean/UrlType;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p4k0;->b:Lcom/immomo/network/bean/UrlType;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/p4k0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
