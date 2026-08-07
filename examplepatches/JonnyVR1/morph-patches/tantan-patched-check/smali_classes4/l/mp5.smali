.class public Ll/mp5;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static volatile d:Ll/mp5;

.field public static final e:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;


# instance fields
.field public final a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/ComplimentFromOther;",
            ">;"
        }
    .end annotation
.end field

.field public final b:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Landroid/util/Pair<",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/ComplimentFromOther;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/mp5;->e:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/mp5;->a:Ljava/util/Map;

    .line 10
    .line 11
    invoke-static {}, Ljava/util/concurrent/ConcurrentHashMap;->newKeySet()Ljava/util/concurrent/ConcurrentHashMap$KeySetView;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Ll/mp5;->b:Ljava/util/Set;

    .line 16
    .line 17
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Ll/mp5;->c:Lrx/subjects/b;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic a(Ll/mp5;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/mp5;->j(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic b(Landroid/util/Pair;)Lcom/p1/mobile/putong/core/data/ComplimentFromOther;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    .line 4
    .line 5
    return-object p0
.end method

.method public static synthetic c(Ll/mp5;Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ComplimentFromOther;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mp5;->k(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ComplimentFromOther;)V

    return-void
.end method

.method public static synthetic d(Ll/mp5;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/mp5;->l(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic e(Ljava/lang/String;Landroid/util/Pair;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/CharSequence;

    .line 4
    .line 5
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static h()Ll/mp5;
    .locals 2

    .line 1
    sget-object v0, Ll/mp5;->d:Ll/mp5;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/mp5;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/mp5;->d:Ll/mp5;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/mp5;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/mp5;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/mp5;->d:Ll/mp5;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

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
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/mp5;->d:Ll/mp5;

    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/String;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lrx/c<",
            "Lcom/p1/mobile/putong/core/data/ComplimentFromOther;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/mp5;->c:Lrx/subjects/b;

    .line 2
    .line 3
    new-instance v0, Ll/kp5;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/kp5;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance p1, Ll/lp5;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/lp5;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public g(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ComplimentFromOther;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mp5;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    .line 8
    .line 9
    sget-object p1, Ll/mp5;->e:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    .line 10
    .line 11
    if-ne p0, p1, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    :cond_0
    return-object p0
.end method

.method public i(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mp5;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final synthetic j(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/mp5;->b:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic k(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/ComplimentFromOther;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mp5;->a:Ljava/util/Map;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    move-object v1, p2

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    sget-object v1, Ll/mp5;->e:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    .line 8
    .line 9
    :goto_0
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/mp5;->c:Lrx/subjects/b;

    .line 13
    .line 14
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final synthetic l(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/mp5;->a:Ljava/util/Map;

    .line 2
    .line 3
    sget-object v0, Ll/mp5;->e:Lcom/p1/mobile/putong/core/data/ComplimentFromOther;

    .line 4
    .line 5
    invoke-interface {p2, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/mp5;->c:Lrx/subjects/b;

    .line 9
    .line 10
    const/4 p2, 0x0

    .line 11
    invoke-static {p1, p2}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public m(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/mp5;->a:Ljava/util/Map;

    .line 9
    .line 10
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget-object v0, p0, Ll/mp5;->b:Ljava/util/Set;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    :goto_0
    return-void

    .line 26
    :cond_2
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 27
    .line 28
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->w0:Ll/x69;

    .line 29
    .line 30
    invoke-virtual {v0, p1}, Ll/x69;->l3(Ljava/lang/String;)Lrx/c;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ll/hp5;

    .line 35
    .line 36
    invoke-direct {v1, p0, p1}, Ll/hp5;-><init>(Ll/mp5;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->doOnTerminate(Ll/x20;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/ip5;

    .line 44
    .line 45
    invoke-direct {v1, p0, p1}, Ll/ip5;-><init>(Ll/mp5;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance v2, Ll/jp5;

    .line 49
    .line 50
    invoke-direct {v2, p0, p1}, Ll/jp5;-><init>(Ll/mp5;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 58
    .line 59
    .line 60
    return-void
.end method
