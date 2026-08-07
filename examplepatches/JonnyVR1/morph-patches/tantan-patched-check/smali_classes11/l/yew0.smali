.class public final Ll/yew0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/util/concurrent/Executor;

.field public final c:Ll/hct0;

.field public final d:Ll/hew0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/concurrent/Executor;Ll/hct0;Ll/hew0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yew0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yew0;->b:Ljava/util/concurrent/Executor;

    .line 7
    .line 8
    iput-object p3, p0, Ll/yew0;->c:Ll/hct0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/yew0;->d:Ll/hew0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final synthetic a(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yew0;->c:Ll/hct0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/hct0;->zza(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic b(Ljava/lang/String;Ll/cew0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yew0;->a:Landroid/content/Context;

    .line 2
    .line 3
    const/16 v1, 0xe

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/qdw0;->a(Landroid/content/Context;I)Ll/rdw0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Ll/rdw0;->zzh()Ll/rdw0;

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Ll/yew0;->c:Ll/hct0;

    .line 13
    .line 14
    invoke-virtual {v1, p1}, Ll/hct0;->zza(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    invoke-interface {v0, p1}, Ll/rdw0;->S(Z)Ll/rdw0;

    .line 19
    .line 20
    .line 21
    if-nez p2, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Ll/yew0;->d:Ll/hew0;

    .line 24
    .line 25
    invoke-interface {v0}, Ll/rdw0;->zzl()Ll/vdw0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    invoke-virtual {p0, p1}, Ll/hew0;->b(Ll/vdw0;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    invoke-virtual {p2, v0}, Ll/cew0;->a(Ll/rdw0;)Ll/cew0;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2}, Ll/cew0;->g()V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public final c(Ljava/lang/String;Ll/cew0;)V
    .locals 2
    .param p2    # Ll/cew0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {}, Ll/hew0;->a()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Ll/ris0;->d:Ll/kis0;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/kis0;->e()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/Boolean;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object v0, p0, Ll/yew0;->b:Ljava/util/concurrent/Executor;

    .line 23
    .line 24
    new-instance v1, Ll/xew0;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1, p2}, Ll/xew0;-><init>(Ll/yew0;Ljava/lang/String;Ll/cew0;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    :goto_0
    iget-object p2, p0, Ll/yew0;->b:Ljava/util/concurrent/Executor;

    .line 34
    .line 35
    new-instance v0, Ll/wew0;

    .line 36
    .line 37
    invoke-direct {v0, p0, p1}, Ll/wew0;-><init>(Ll/yew0;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    invoke-interface {p2, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public final d(Ljava/util/List;)V
    .locals 2

    .line 1
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/String;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-virtual {p0, v0, v1}, Ll/yew0;->c(Ljava/lang/String;Ll/cew0;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    return-void
.end method
