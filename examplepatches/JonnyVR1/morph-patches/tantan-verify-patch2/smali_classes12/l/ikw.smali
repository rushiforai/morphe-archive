.class public Ll/ikw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static b:Ll/ikw;


# instance fields
.field private a:Ll/oxl;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b()Ll/ikw;
    .locals 1

    .line 1
    sget-object v0, Ll/ikw;->b:Ll/ikw;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/ikw;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/ikw;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/ikw;->b:Ll/ikw;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/ikw;->b:Ll/ikw;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikw;->a:Ll/oxl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0, p1}, Ll/oxl;->a(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public c(Ljava/lang/String;Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikw;->a:Ll/oxl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return p2

    .line 6
    :cond_0
    invoke-interface {p0, p1, p2}, Ll/oxl;->d(Ljava/lang/String;Z)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public d(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikw;->a:Ll/oxl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-object p2

    .line 6
    :cond_0
    invoke-interface {p0, p1, p2}, Ll/oxl;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public e(Ll/oxl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ikw;->a:Ll/oxl;

    .line 2
    .line 3
    return-void
.end method

.method public f(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikw;->a:Ll/oxl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-interface {p0, p1}, Ll/oxl;->f(Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikw;->a:Ll/oxl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0, p1, p2}, Ll/oxl;->e(Ljava/lang/String;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public h(Ljava/lang/String;Z)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ikw;->a:Ll/oxl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0, p1, p2}, Ll/oxl;->c(Ljava/lang/String;Z)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
