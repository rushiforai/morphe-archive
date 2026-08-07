.class public Ll/mum;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile a:Ll/mum;

.field public static b:Z

.field public static c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

.field public static d:Z


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b()Z
    .locals 1

    .line 1
    sget-boolean v0, Ll/mum;->d:Z

    .line 2
    .line 3
    return v0
.end method

.method public static d()Ll/mum;
    .locals 2

    .line 1
    sget-boolean v0, Ll/mum;->b:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    sget-object v0, Ll/mum;->a:Ll/mum;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-class v0, Ll/mum;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    sget-object v1, Ll/mum;->a:Ll/mum;

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    new-instance v1, Ll/mum;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/mum;-><init>()V

    .line 19
    .line 20
    .line 21
    sput-object v1, Ll/mum;->a:Ll/mum;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v1

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    :goto_0
    monitor-exit v0

    .line 27
    goto :goto_2

    .line 28
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw v1

    .line 30
    :cond_1
    :goto_2
    sget-object v0, Ll/mum;->a:Ll/mum;

    .line 31
    .line 32
    return-object v0

    .line 33
    :cond_2
    const-string v0, "Injecter::Init::Invoke init(context) first!"

    .line 34
    .line 35
    invoke-static {v0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    return-object v0
.end method

.method public static declared-synchronized e(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    .line 1
    const-class v0, Ll/mum;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Ll/zpd;

    .line 5
    .line 6
    const-string v2, "Injecter::"

    .line 7
    .line 8
    invoke-direct {v1, v2}, Ll/zpd;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sput-object v1, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 12
    .line 13
    invoke-static {p0, p1}, Ll/d1w;->b(Landroid/content/Context;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x1

    .line 17
    sput-boolean p0, Ll/mum;->b:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    monitor-exit v0

    .line 20
    return p0

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw p0
.end method


# virtual methods
.method public a(Ljava/lang/String;)Lcom/tantanapp/android/injecter/facade/Postcard;
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Ll/mum;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {p1}, Ll/jsi0;->b(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ll/jsi0;->b(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    new-instance v0, Lcom/tantanapp/android/injecter/facade/Postcard;

    .line 18
    .line 19
    invoke-direct {v0, p1, p0}, Lcom/tantanapp/android/injecter/facade/Postcard;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-object v0

    .line 23
    :cond_0
    new-instance p0, Lcom/tantanapp/android/injecter/exception/HandlerException;

    .line 24
    .line 25
    const-string p1, "Injecter::Parameter is invalid!"

    .line 26
    .line 27
    invoke-direct {p0, p1}, Lcom/tantanapp/android/injecter/exception/HandlerException;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    throw p0
.end method

.method public final c(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    invoke-static {p1}, Ll/jsi0;->b(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_1

    .line 6
    .line 7
    const-string p0, "/"

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    :try_start_0
    invoke-virtual {p1, p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p1, v0, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/jsi0;->b(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    new-instance p0, Lcom/tantanapp/android/injecter/exception/HandlerException;

    .line 32
    .line 33
    const-string p1, "Injecter::Extract the default group failed! There\'s nothing between 2 \'/\'!"

    .line 34
    .line 35
    invoke-direct {p0, p1}, Lcom/tantanapp/android/injecter/exception/HandlerException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 39
    :catch_0
    move-exception p0

    .line 40
    sget-object p1, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 41
    .line 42
    new-instance v0, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v1, "Failed to extract default group! "

    .line 45
    .line 46
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    const-string v0, "Injecter::"

    .line 61
    .line 62
    invoke-interface {p1, v0, p0}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->warning(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    return-object p0

    .line 67
    :cond_1
    new-instance p0, Lcom/tantanapp/android/injecter/exception/HandlerException;

    .line 68
    .line 69
    const-string p1, "Injecter::Extract the default group failed, the path must be start with \'/\' and contain more than 2 \'/\'!"

    .line 70
    .line 71
    invoke-direct {p0, p1}, Lcom/tantanapp/android/injecter/exception/HandlerException;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    throw p0
.end method

.method public f(Lcom/tantanapp/android/injecter/facade/Postcard;)Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/tantanapp/android/injecter/facade/Postcard;",
            ")TT;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object p0

    .line 5
    :cond_0
    :try_start_0
    invoke-static {p1}, Ll/d1w;->a(Lcom/tantanapp/android/injecter/facade/Postcard;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/tantanapp/android/injecter/facade/Postcard;->getProvider()Lcom/tantanapp/android/injecter/facade/template/IProvider;

    .line 9
    .line 10
    .line 11
    move-result-object p0
    :try_end_0
    .catch Lcom/tantanapp/android/injecter/exception/NoRouteFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 12
    return-object p0

    .line 13
    :catch_0
    move-exception p1

    .line 14
    sget-object v0, Ll/mum;->c:Lcom/tantanapp/android/injecter/facade/template/ILogger;

    .line 15
    .line 16
    const-string v1, "Injecter::"

    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-interface {v0, v1, p1}, Lcom/tantanapp/android/injecter/facade/template/ILogger;->warning(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    return-object p0
.end method

.method public g(Ljava/lang/Object;)V
    .locals 1

    .line 1
    new-instance p0, Lcom/tantanapp/android/injecter/core/AutowiredServiceImpl;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/tantanapp/android/injecter/core/AutowiredServiceImpl;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    invoke-interface {p0, v0}, Lcom/tantanapp/android/injecter/facade/template/IProvider;->init(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p0, p1}, Lcom/tantanapp/android/injecter/facade/service/AutowiredService;->autowire(Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
