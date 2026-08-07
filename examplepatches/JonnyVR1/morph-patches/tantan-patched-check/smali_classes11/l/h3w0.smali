.class public final Ll/h3w0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y3w0;


# instance fields
.field public a:Ll/p5u0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


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


# virtual methods
.method public final bridge synthetic a(Ll/z3w0;Ll/x3w0;Ljava/lang/Object;)Ll/hpr;
    .locals 0
    .param p3    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 p3, 0x0

    .line 2
    invoke-virtual {p0, p1, p2, p3}, Ll/h3w0;->c(Ll/z3w0;Ll/x3w0;Ll/p5u0;)Ll/hpr;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public final declared-synchronized b()Ll/p5u0;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/h3w0;->a:Ll/p5u0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-object v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public final declared-synchronized c(Ll/z3w0;Ll/x3w0;Ll/p5u0;)Ll/hpr;
    .locals 0
    .param p3    # Ll/p5u0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    monitor-enter p0

    .line 2
    if-eqz p3, :cond_0

    .line 3
    .line 4
    :try_start_0
    iput-object p3, p0, Ll/h3w0;->a:Ll/p5u0;

    .line 5
    .line 6
    goto :goto_0

    .line 7
    :catchall_0
    move-exception p1

    .line 8
    goto :goto_1

    .line 9
    :cond_0
    iget-object p1, p1, Ll/z3w0;->b:Ll/w3w0;

    .line 10
    .line 11
    invoke-interface {p2, p1}, Ll/x3w0;->a(Ll/w3w0;)Ll/o5u0;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p1}, Ll/o5u0;->zzh()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ll/p5u0;

    .line 20
    .line 21
    iput-object p1, p0, Ll/h3w0;->a:Ll/p5u0;

    .line 22
    .line 23
    :goto_0
    iget-object p1, p0, Ll/h3w0;->a:Ll/p5u0;

    .line 24
    .line 25
    invoke-interface {p1}, Ll/p5u0;->zzb()Ll/z0u0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p1}, Ll/z0u0;->j()Ll/hpr;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p1, p2}, Ll/z0u0;->i(Ll/hpr;)Ll/hpr;

    .line 34
    .line 35
    .line 36
    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    monitor-exit p0

    .line 38
    return-object p1

    .line 39
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    throw p1
.end method

.method public final bridge synthetic zzd()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/h3w0;->b()Ll/p5u0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
