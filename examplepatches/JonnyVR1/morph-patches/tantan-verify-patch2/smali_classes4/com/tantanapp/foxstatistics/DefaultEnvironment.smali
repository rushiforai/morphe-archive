.class public Lcom/tantanapp/foxstatistics/DefaultEnvironment;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile c:Lcom/tantanapp/foxstatistics/DefaultEnvironment;


# instance fields
.field public a:Landroid/content/Context;

.field public b:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$1;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment$1;-><init>(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->b:Ljava/util/Map;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a:Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->e()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->b:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->a:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static c(Landroid/content/Context;)Lcom/tantanapp/foxstatistics/DefaultEnvironment;
    .locals 2

    .line 1
    sget-object v0, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->c:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->c:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    sput-object v1, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->c:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->c:Lcom/tantanapp/foxstatistics/DefaultEnvironment;

    .line 27
    .line 28
    return-object p0
.end method


# virtual methods
.method public d(Ljava/lang/String;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/foxstatistics/DefaultEnvironment;->b:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final e()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment$a;-><init>(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/r1d0;->c(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public f(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$b;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Lcom/tantanapp/foxstatistics/DefaultEnvironment$b;-><init>(Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/lang/String;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/r1d0;->c(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public g(Ljava/util/HashMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/HashMap;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$d;

    .line 10
    .line 11
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/foxstatistics/DefaultEnvironment$d;-><init>(Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ljava/util/HashMap;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v0}, Ll/r1d0;->c(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public h(Ll/ek2;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    new-instance v0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$c;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Lcom/tantanapp/foxstatistics/DefaultEnvironment$c;-><init>(Lcom/tantanapp/foxstatistics/DefaultEnvironment;Ll/ek2;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/r1d0;->c(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$f;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment$f;-><init>(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/r1d0;->c(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public j()V
    .locals 1

    .line 1
    new-instance v0, Lcom/tantanapp/foxstatistics/DefaultEnvironment$e;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/tantanapp/foxstatistics/DefaultEnvironment$e;-><init>(Lcom/tantanapp/foxstatistics/DefaultEnvironment;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/r1d0;->c(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
