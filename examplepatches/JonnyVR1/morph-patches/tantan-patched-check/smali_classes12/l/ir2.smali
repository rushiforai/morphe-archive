.class public abstract Ll/ir2;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/ze2;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field protected static k:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/ref/WeakReference<",
            "Ll/ir2;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field protected a:Lcom/immomo/medialog/api/Constant$HttpMethod;

.field protected b:Ljava/lang/String;

.field protected c:Ll/b2d0;

.field protected d:Ll/fvl;

.field protected e:Z

.field protected f:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected g:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field protected h:[Ll/n1j;

.field private i:Ljava/lang/String;

.field private j:Ll/rt0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/ir2;->k:Ljava/util/HashMap;

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
    sget-object v0, Lcom/immomo/medialog/api/Constant$HttpMethod;->POST:Lcom/immomo/medialog/api/Constant$HttpMethod;

    .line 5
    .line 6
    iput-object v0, p0, Ll/ir2;->a:Lcom/immomo/medialog/api/Constant$HttpMethod;

    .line 7
    .line 8
    const-string v0, ""

    .line 9
    .line 10
    iput-object v0, p0, Ll/ir2;->b:Ljava/lang/String;

    .line 11
    .line 12
    new-instance v0, Lcom/immomo/medialog/api/ParamsMap;

    .line 13
    .line 14
    invoke-direct {v0}, Lcom/immomo/medialog/api/ParamsMap;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Ll/ir2;->f:Ljava/util/Map;

    .line 18
    .line 19
    new-instance v0, Lcom/immomo/medialog/api/ParamsMap;

    .line 20
    .line 21
    invoke-direct {v0}, Lcom/immomo/medialog/api/ParamsMap;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/ir2;->g:Ljava/util/Map;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Ll/ir2;->i:Ljava/lang/String;

    .line 35
    .line 36
    return-void
.end method

.method public static m(I)Z
    .locals 1

    .line 1
    const/16 v0, 0xc8

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0

    .line 10
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method


# virtual methods
.method public declared-synchronized a()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    sget-object v0, Ll/ir2;->k:Ljava/util/HashMap;

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    if-ne v0, p0, :cond_0

    .line 25
    .line 26
    sget-object v0, Ll/ir2;->k:Ljava/util/HashMap;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :goto_0
    monitor-exit p0

    .line 43
    return-void

    .line 44
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    throw v0
.end method

.method public b()Ll/fvl;
    .locals 7

    .line 1
    iget-object v0, p0, Ll/ir2;->d:Ll/fvl;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Ll/i650;

    .line 6
    .line 7
    iget-object v2, p0, Ll/ir2;->b:Ljava/lang/String;

    .line 8
    .line 9
    iget-object v3, p0, Ll/ir2;->g:Ljava/util/Map;

    .line 10
    .line 11
    iget-object v4, p0, Ll/ir2;->f:Ljava/util/Map;

    .line 12
    .line 13
    iget-object v5, p0, Ll/ir2;->h:[Ll/n1j;

    .line 14
    .line 15
    iget-object v6, p0, Ll/ir2;->j:Ll/rt0;

    .line 16
    .line 17
    invoke-direct/range {v1 .. v6}, Ll/i650;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;[Ll/n1j;Ll/rt0;)V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Ll/ir2;->d:Ll/fvl;

    .line 21
    .line 22
    return-object v1

    .line 23
    :cond_0
    const-string p0, "one instance do execute more than once"

    .line 24
    .line 25
    invoke-static {p0}, Ll/gig0;->a(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public c()Ll/fvl$a;
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ir2;->e:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/ir2;->l()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/ir2;->a:Lcom/immomo/medialog/api/Constant$HttpMethod;

    .line 8
    .line 9
    sget-object v1, Lcom/immomo/medialog/api/Constant$HttpMethod;->POST:Lcom/immomo/medialog/api/Constant$HttpMethod;

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/ir2;->b()Ll/fvl;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {v0}, Ll/fvl;->a()Ll/fvl$a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Ll/ir2;->b()Ll/fvl;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-interface {v0}, Ll/fvl;->b()Ll/fvl$a;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    :goto_0
    invoke-virtual {p0}, Ll/ir2;->f()V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public d()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ir2;->e:Z

    .line 3
    .line 4
    new-instance v0, Ll/ir2$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/ir2$a;-><init>(Ll/ir2;)V

    .line 7
    .line 8
    .line 9
    sget-object p0, Lcom/immomo/medialog/thread/ThreadType;->High:Lcom/immomo/medialog/thread/ThreadType;

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/jg00;->a(Lcom/immomo/medialog/thread/ThreadType;Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public e()Ll/c3d0;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/c3d0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ir2;->c()Ll/fvl$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0, v0}, Ll/ir2;->k(Ll/fvl$a;)Ll/c3d0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/ir2;->p(Ll/c3d0;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Ll/ir2;->f()V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public f()V
    .locals 2

    .line 1
    sget-object v0, Ll/ir2;->k:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 16
    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-ne v0, p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/ir2;->a()V

    .line 26
    .line 27
    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    iput-boolean v0, p0, Ll/ir2;->e:Z

    .line 30
    .line 31
    return-void
.end method

.method public g(Ll/b2d0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/b2d0<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/ir2;->c:Ll/b2d0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ir2;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h()Ll/c3d0;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/c3d0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ir2;->e()Ll/c3d0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public i()Lcom/immomo/medialog/api/Constant$HttpMethod;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ir2;->a:Lcom/immomo/medialog/api/Constant$HttpMethod;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract j()Ljava/lang/String;
.end method

.method public k(Ll/fvl$a;)Ll/c3d0;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fvl$a;",
            ")",
            "Ll/c3d0<",
            "TT;>;"
        }
    .end annotation

    .line 1
    const-string v0, "ec"

    .line 2
    .line 3
    new-instance v1, Ll/c3d0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/c3d0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ll/fvl$a;->d()Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1}, Ll/fvl$a;->b()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {v1, p0}, Ll/c3d0;->h(I)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ll/fvl$a;->c()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v1, p0}, Ll/c3d0;->i(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-object v1

    .line 29
    :cond_0
    invoke-virtual {p1}, Ll/fvl$a;->a()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    const-string v3, "\u670d\u52a1\u5668\u6570\u636e\u5f02\u5e38"

    .line 38
    .line 39
    const/4 v4, -0x3

    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    invoke-virtual {v1, v4}, Ll/c3d0;->h(I)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, v3}, Ll/c3d0;->i(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-object v1

    .line 49
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Ll/fvl$a;->a()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {v1, v2}, Ll/c3d0;->g(Ljava/lang/String;)Ll/c3d0;

    .line 54
    .line 55
    .line 56
    new-instance v2, Lorg/json/JSONObject;

    .line 57
    .line 58
    invoke-virtual {p1}, Ll/fvl$a;->a()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-direct {v2, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_2

    .line 70
    .line 71
    invoke-virtual {v2, v0}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    invoke-virtual {v1, p1}, Ll/c3d0;->h(I)V

    .line 76
    .line 77
    .line 78
    const-string p1, "em"

    .line 79
    .line 80
    const-string v0, ""

    .line 81
    .line 82
    invoke-virtual {v2, p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    invoke-virtual {v1, p1}, Ll/c3d0;->i(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    const/4 p1, 0x0

    .line 90
    invoke-virtual {v1, p1}, Ll/c3d0;->f(Ljava/lang/Object;)V

    .line 91
    .line 92
    .line 93
    return-object v1

    .line 94
    :catch_0
    move-exception p1

    .line 95
    goto :goto_0

    .line 96
    :cond_2
    invoke-virtual {v1, v4}, Ll/c3d0;->h(I)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v3}, Ll/c3d0;->i(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    .line 101
    .line 102
    return-object v1

    .line 103
    :goto_0
    invoke-virtual {v1, v4}, Ll/c3d0;->h(I)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v1, v3}, Ll/c3d0;->i(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p0, Ll/ir2;->i:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-static {p0, p1}, Ll/tzv;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-object v1
.end method

.method public l()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/ir2;->j()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Ll/ir2;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ir2;->i()Lcom/immomo/medialog/api/Constant$HttpMethod;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Ll/ir2;->a:Lcom/immomo/medialog/api/Constant$HttpMethod;

    .line 12
    .line 13
    return-void
.end method

.method public n(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ir2;->c:Ll/b2d0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/b2d0;->onError(ILjava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ir2;->c:Ll/b2d0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/b2d0;->onFinish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public p(Ll/c3d0;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/c3d0<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/ir2;->i:Ljava/lang/String;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v2, ", perform response, ec:"

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Ll/c3d0;->c()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-static {v0, v1}, Ll/tzv;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/ir2;->c:Ll/b2d0;

    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    new-instance v0, Ll/ir2$b;

    .line 36
    .line 37
    invoke-direct {v0, p0, p1}, Ll/ir2$b;-><init>(Ll/ir2;Ll/c3d0;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Ll/msw;->a(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public q(ILl/ze2;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITT;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ir2;->c:Ll/b2d0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/b2d0;->onSuccess(ILl/ze2;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public r(Ll/rt0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ir2;->j:Ll/rt0;

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Http<"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ">, url:"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Ll/ir2;->b:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method
