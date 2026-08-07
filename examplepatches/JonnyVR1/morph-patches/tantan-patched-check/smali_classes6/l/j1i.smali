.class public Ll/j1i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/h1i;


# static fields
.field public static volatile c:Ll/j1i;


# instance fields
.field public a:Ll/h1i;

.field public b:Ll/i1i;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static p(Landroid/content/Context;)Ll/j1i;
    .locals 1

    .line 1
    sget-object p0, Ll/j1i;->c:Ll/j1i;

    .line 2
    .line 3
    if-nez p0, :cond_1

    .line 4
    .line 5
    const-class p0, Ll/j1i;

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    sget-object v0, Ll/j1i;->c:Ll/j1i;

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ll/j1i;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/j1i;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v0, Ll/j1i;->c:Ll/j1i;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit p0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v0

    .line 26
    :cond_1
    :goto_2
    sget-object p0, Ll/j1i;->c:Ll/j1i;

    .line 27
    .line 28
    return-object p0
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j1i;->o()Ll/h1i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/h1i;->a()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j1i;->o()Ll/h1i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/h1i;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public c()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j1i;->o()Ll/h1i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/h1i;->c()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j1i;->o()Ll/h1i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/h1i;->d()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public e()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j1i;->o()Ll/h1i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/h1i;->e()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j1i;->o()Ll/h1i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/h1i;->f()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j1i;->o()Ll/h1i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/h1i;->g()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public h()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j1i;->o()Ll/h1i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/h1i;->h()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j1i;->o()Ll/h1i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/h1i;->i()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public j()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j1i;->o()Ll/h1i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/h1i;->j()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public k(Z)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j1i;->o()Ll/h1i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0, p1}, Ll/h1i;->k(Z)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public l()Ljava/lang/String;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j1i;->o()Ll/h1i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-interface {p0}, Ll/h1i;->l()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public final m()V
    .locals 1

    .line 1
    sget-object v0, Ll/j1i;->c:Ll/j1i;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/j1i;->n()Ll/i1i;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {v0, p0}, Ll/j1i;->q(Ll/h1i;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public n()Ll/i1i;
    .locals 2

    .line 1
    iget-object v0, p0, Ll/j1i;->b:Ll/i1i;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/i1i;

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/feed/FeedModule;->a:Landroid/app/Application;

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ll/i1i;-><init>(Landroid/content/Context;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ll/j1i;->b:Ll/i1i;

    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ll/j1i;->b:Ll/i1i;

    .line 15
    .line 16
    return-object p0
.end method

.method public o()Ll/h1i;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/j1i;->m()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/j1i;->a:Ll/h1i;

    .line 5
    .line 6
    return-object p0
.end method

.method public q(Ll/h1i;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/j1i;->a:Ll/h1i;

    .line 2
    .line 3
    return-void
.end method
