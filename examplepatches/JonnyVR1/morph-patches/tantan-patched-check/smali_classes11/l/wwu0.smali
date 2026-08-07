.class public final Ll/wwu0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/Map;

.field public final synthetic b:Ll/xwu0;


# direct methods
.method public constructor <init>(Ll/xwu0;)V
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    iput-object p1, p0, Ll/wwu0;->b:Ll/xwu0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/wwu0;->a:Ljava/util/Map;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic a(Ll/wwu0;)Ll/wwu0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wwu0;->b:Ll/xwu0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/wwu0;->a:Ljava/util/Map;

    .line 4
    .line 5
    invoke-static {v0}, Ll/xwu0;->c(Ll/xwu0;)Ljava/util/Map;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v1, v0}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    return-object p0
.end method


# virtual methods
.method public final b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wwu0;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;
    .locals 1
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/wwu0;->a:Ljava/util/Map;

    .line 8
    .line 9
    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    :cond_0
    return-object p0
.end method

.method public final d(Ll/q6w0;)Ll/wwu0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/wwu0;->a:Ljava/util/Map;

    .line 2
    .line 3
    const-string v1, "aai"

    .line 4
    .line 5
    iget-object v2, p1, Ll/q6w0;->x:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    sget-object v0, Ll/sgs0;->a7:Ll/dgs0;

    .line 11
    .line 12
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    iget-object p1, p1, Ll/q6w0;->o0:Ljava/lang/String;

    .line 29
    .line 30
    const-string v0, "rid"

    .line 31
    .line 32
    invoke-virtual {p0, v0, p1}, Ll/wwu0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 33
    .line 34
    .line 35
    :cond_0
    return-object p0
.end method

.method public final e(Ll/t6w0;)Ll/wwu0;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wwu0;->a:Ljava/util/Map;

    .line 2
    .line 3
    const-string v1, "gqi"

    .line 4
    .line 5
    iget-object p1, p1, Ll/t6w0;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    return-object p0
.end method

.method public final f()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wwu0;->b:Ll/xwu0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xwu0;->b(Ll/xwu0;)Ll/cxu0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/wwu0;->a:Ljava/util/Map;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/fxu0;->b(Ljava/util/Map;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wwu0;->b:Ll/xwu0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xwu0;->d(Ll/xwu0;)Ljava/util/concurrent/Executor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/uwu0;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/uwu0;-><init>(Ll/wwu0;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final h()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/wwu0;->b:Ll/xwu0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xwu0;->d(Ll/xwu0;)Ljava/util/concurrent/Executor;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/vwu0;

    .line 8
    .line 9
    invoke-direct {v1, p0}, Ll/vwu0;-><init>(Ll/wwu0;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final synthetic i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wwu0;->b:Ll/xwu0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xwu0;->b(Ll/xwu0;)Ll/cxu0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/wwu0;->a:Ljava/util/Map;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/fxu0;->f(Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic j()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/wwu0;->b:Ll/xwu0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xwu0;->b(Ll/xwu0;)Ll/cxu0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Ll/wwu0;->a:Ljava/util/Map;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ll/fxu0;->e(Ljava/util/Map;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
