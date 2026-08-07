.class public Ll/v3f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/v3f$d;,
        Ll/v3f$c;,
        Ll/v3f$e;,
        Ll/v3f$b;
    }
.end annotation


# static fields
.field private static final g:Ll/w3f;


# instance fields
.field private final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/v3f$b<",
            "**>;>;"
        }
    .end annotation
.end field

.field private final b:Ll/qsw;

.field private final c:Ljava/util/concurrent/ExecutorService;

.field private final d:Z

.field private final e:Ll/wzv;

.field private f:Ll/cu6;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/cu6<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/w3f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/w3f;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/v3f;->g:Ll/w3f;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 32
    sget-object v0, Ll/v3f;->g:Ll/w3f;

    invoke-direct {p0, v0}, Ll/v3f;-><init>(Ll/w3f;)V

    return-void
.end method

.method public constructor <init>(Ll/w3f;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ll/w3f;->b()Ll/wzv;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/v3f;->e:Ll/wzv;

    .line 9
    .line 10
    new-instance v0, Ljava/util/HashMap;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/v3f;->a:Ljava/util/Map;

    .line 16
    .line 17
    invoke-virtual {p1}, Ll/w3f;->c()Ll/qsw;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/v3f;->b:Ll/qsw;

    .line 22
    .line 23
    iget-boolean v0, p1, Ll/w3f;->a:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Ll/v3f;->d:Z

    .line 26
    .line 27
    iget-object p1, p1, Ll/w3f;->b:Ljava/util/concurrent/ExecutorService;

    .line 28
    .line 29
    iput-object p1, p0, Ll/v3f;->c:Ljava/util/concurrent/ExecutorService;

    .line 30
    .line 31
    return-void
.end method

.method public static bridge synthetic a(Ll/v3f;)Ll/cu6;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v3f;->f:Ll/cu6;

    return-object p0
.end method

.method public static bridge synthetic b(Ll/v3f;)Ljava/util/concurrent/ExecutorService;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v3f;->c:Ljava/util/concurrent/ExecutorService;

    return-object p0
.end method

.method public static bridge synthetic c(Ll/v3f;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/v3f;->d:Z

    return p0
.end method

.method public static bridge synthetic d(Ll/v3f;)Ll/wzv;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v3f;->e:Ll/wzv;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/v3f;)Ll/qsw;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v3f;->b:Ll/qsw;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/v3f;)Z
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/v3f;->g()Z

    move-result p0

    return p0
.end method

.method private g()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/v3f;->b:Ll/qsw;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    invoke-interface {p0}, Ll/qsw;->a()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method


# virtual methods
.method public declared-synchronized h(Ljava/lang/String;)Ll/v3f$d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "O:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")",
            "Ll/v3f$d<",
            "TT;TO;>;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/v3f;->a:Ljava/util/Map;

    .line 3
    .line 4
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/v3f;->a:Ljava/util/Map;

    .line 11
    .line 12
    new-instance v1, Ll/v3f$d;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Ll/v3f$d;-><init>(Ll/v3f;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/v3f;->a:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ll/v3f$d;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return-object p1

    .line 33
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw p1
.end method

.method public declared-synchronized i(Ljava/lang/String;)Ll/v3f$c;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<O:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")",
            "Ll/v3f$c<",
            "TO;>;"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/v3f;->a:Ljava/util/Map;

    .line 3
    .line 4
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/v3f;->a:Ljava/util/Map;

    .line 11
    .line 12
    new-instance v1, Ll/v3f$c;

    .line 13
    .line 14
    invoke-direct {v1, p0, p1}, Ll/v3f$c;-><init>(Ll/v3f;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/v3f;->a:Ljava/util/Map;

    .line 24
    .line 25
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ll/v3f$c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return-object p1

    .line 33
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    throw p1
.end method

.method public j(Ll/cu6;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<O:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/cu6<",
            "TO;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/v3f;->f:Ll/cu6;

    .line 2
    .line 3
    return-void
.end method
