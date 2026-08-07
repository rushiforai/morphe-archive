.class public Ll/gm80$b;
.super Ll/pud;
.source "SourceFile"

# interfaces
.implements Ll/i0d0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/gm80;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/pud<",
        "Ll/fb5<",
        "Ll/db5;",
        ">;",
        "Ll/fb5<",
        "Ll/db5;",
        ">;>;",
        "Ll/i0d0;"
    }
.end annotation


# instance fields
.field public c:Z

.field public d:Ll/fb5;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/fb5<",
            "Ll/db5;",
            ">;"
        }
    .end annotation
.end field

.field public final synthetic e:Ll/gm80;


# direct methods
.method public constructor <init>(Ll/gm80;Ll/gm80$a;Ll/h0d0;Ll/yk90;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/gm80$b;->e:Ll/gm80;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ll/pud;-><init>(Ll/z06;)V

    .line 4
    .line 5
    .line 6
    const/4 p2, 0x0

    .line 7
    iput-boolean p2, p0, Ll/gm80$b;->c:Z

    .line 8
    .line 9
    const/4 p2, 0x0

    .line 10
    iput-object p2, p0, Ll/gm80$b;->d:Ll/fb5;

    .line 11
    .line 12
    invoke-interface {p3, p0}, Ll/h0d0;->c(Ll/i0d0;)V

    .line 13
    .line 14
    .line 15
    new-instance p2, Ll/gm80$b$a;

    .line 16
    .line 17
    invoke-direct {p2, p0, p1}, Ll/gm80$b$a;-><init>(Ll/gm80$b;Ll/gm80;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p4, p2}, Ll/yk90;->q(Ll/zk90;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public synthetic constructor <init>(Ll/gm80;Ll/gm80$a;Ll/h0d0;Ll/yk90;Ll/hm80;)V
    .locals 0

    .line 24
    invoke-direct {p0, p1, p2, p3, p4}, Ll/gm80$b;-><init>(Ll/gm80;Ll/gm80$a;Ll/h0d0;Ll/yk90;)V

    return-void
.end method

.method public static bridge synthetic p(Ll/gm80$b;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/gm80$b;->q()Z

    move-result p0

    return p0
.end method


# virtual methods
.method public f()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gm80$b;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0}, Ll/z06;->a()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public g(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gm80$b;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p0, p1}, Ll/z06;->onFailure(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public bridge synthetic h(Ljava/lang/Object;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/gm80$b;->r(Ll/fb5;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final q()Z
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/gm80$b;->c:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    monitor-exit p0

    .line 8
    return v0

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/gm80$b;->d:Ll/fb5;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    iput-object v1, p0, Ll/gm80$b;->d:Ll/fb5;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    iput-boolean v1, p0, Ll/gm80$b;->c:Z

    .line 18
    .line 19
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 21
    .line 22
    .line 23
    return v1

    .line 24
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    throw v0
.end method

.method public r(Ll/fb5;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, Ll/ji2;->e(I)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0, p1}, Ll/gm80$b;->s(Ll/fb5;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/gm80$b;->t()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final s(Ll/fb5;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "Ll/db5;",
            ">;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/gm80$b;->c:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/gm80$b;->d:Ll/fb5;

    .line 11
    .line 12
    invoke-static {p1}, Ll/fb5;->t(Ll/fb5;)Ll/fb5;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/gm80$b;->d:Ll/fb5;

    .line 17
    .line 18
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p1
.end method

.method public final t()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/gm80$b;->c:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/gm80$b;->d:Ll/fb5;

    .line 11
    .line 12
    invoke-static {v0}, Ll/fb5;->t(Ll/fb5;)Ll/fb5;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    :try_start_1
    invoke-virtual {p0}, Ll/pud;->o()Ll/z06;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const/4 v1, 0x0

    .line 22
    invoke-interface {p0, v0, v1}, Ll/z06;->b(Ljava/lang/Object;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 23
    .line 24
    .line 25
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :catchall_1
    move-exception p0

    .line 30
    invoke-static {v0}, Ll/fb5;->v(Ll/fb5;)V

    .line 31
    .line 32
    .line 33
    throw p0

    .line 34
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    throw v0
.end method
