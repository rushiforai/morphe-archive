.class public Ll/eae;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/eae$b;,
        Ll/eae$c;
    }
.end annotation


# static fields
.field private static d:Ll/eae;


# instance fields
.field private final a:Ll/rg50;

.field private b:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Ljava/lang/Object;


# direct methods
.method private constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/eae;->b:Ljava/util/Set;

    .line 10
    .line 11
    new-instance v0, Ljava/lang/Object;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/eae;->c:Ljava/lang/Object;

    .line 17
    .line 18
    new-instance v0, Ll/rg50$b;

    .line 19
    .line 20
    invoke-direct {v0}, Ll/rg50$b;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Ll/x1c;->a()Ll/o6e;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v0, v1}, Ll/rg50$b;->j(Ll/o6e;)Ll/rg50$b;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v1, Ll/eae$c;

    .line 32
    .line 33
    const/4 v2, 0x3

    .line 34
    invoke-direct {v1, v2}, Ll/eae$c;-><init>(I)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/rg50$b;->a(Ll/azm;)Ll/rg50$b;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iput-object v0, p0, Ll/eae;->a:Ll/rg50;

    .line 46
    .line 47
    return-void
.end method

.method public static synthetic a(Ll/eae;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eae;->c:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic b(Ll/eae;)Ljava/util/Set;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/eae;->b:Ljava/util/Set;

    .line 2
    .line 3
    return-object p0
.end method

.method public static d()Ll/eae;
    .locals 1

    .line 1
    sget-object v0, Ll/eae;->d:Ll/eae;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/eae;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/eae;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/eae;->d:Ll/eae;

    .line 11
    .line 12
    :cond_0
    sget-object v0, Ll/eae;->d:Ll/eae;

    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public c(Ljava/lang/String;Ljava/lang/String;Ll/eae$b;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/eae;->c:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/eae;->b:Ljava/util/Set;

    .line 5
    .line 6
    invoke-interface {v1, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    new-instance v0, Ll/x1d0$a;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/x1d0$a;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v1, p0, Ll/eae;->a:Ll/rg50;

    .line 24
    .line 25
    invoke-virtual {v1, v0}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/eae$a;

    .line 30
    .line 31
    invoke-direct {v1, p0, p3, p1, p2}, Ll/eae$a;-><init>(Ll/eae;Ll/eae$b;Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {v0, v1}, Ll/ry3;->h(Ll/w84;)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    throw p0
.end method
