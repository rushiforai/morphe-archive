.class public Ll/iq0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/iq0$b;
    }
.end annotation


# instance fields
.field public final a:Ll/by3;

.field public final b:Ll/hsb;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/hsb<",
            "Ll/by3;",
            "Ll/db5;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Ll/hsb$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/hsb$b<",
            "Ll/by3;",
            ">;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/LinkedHashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashSet<",
            "Ll/by3;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/by3;Ll/hsb;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/by3;",
            "Ll/hsb<",
            "Ll/by3;",
            "Ll/db5;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/iq0;->a:Ll/by3;

    .line 5
    .line 6
    iput-object p2, p0, Ll/iq0;->b:Ll/hsb;

    .line 7
    .line 8
    new-instance p1, Ljava/util/LinkedHashSet;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/iq0;->d:Ljava/util/LinkedHashSet;

    .line 14
    .line 15
    new-instance p1, Ll/iq0$a;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Ll/iq0$a;-><init>(Ll/iq0;)V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/iq0;->c:Ll/hsb$b;

    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public a(ILl/fb5;)Ll/fb5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ll/fb5<",
            "Ll/db5;",
            ">;)",
            "Ll/fb5<",
            "Ll/db5;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/iq0;->b:Ll/hsb;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/iq0;->e(I)Ll/iq0$b;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object p0, p0, Ll/iq0;->c:Ll/hsb$b;

    .line 8
    .line 9
    invoke-interface {v0, p1, p2, p0}, Ll/hsb;->f(Ljava/lang/Object;Ll/fb5;Ll/hsb$b;)Ll/fb5;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public b(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iq0;->b:Ll/hsb;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/iq0;->e(I)Ll/iq0$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Ll/mpy;->contains(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public c(I)Ll/fb5;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ll/fb5<",
            "Ll/db5;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/iq0;->b:Ll/hsb;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/iq0;->e(I)Ll/iq0$b;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {v0, p0}, Ll/mpy;->get(Ljava/lang/Object;)Ll/fb5;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public d()Ll/fb5;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/fb5<",
            "Ll/db5;",
            ">;"
        }
    .end annotation

    .line 1
    :cond_0
    invoke-virtual {p0}, Ll/iq0;->g()Ll/by3;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_1
    iget-object v1, p0, Ll/iq0;->b:Ll/hsb;

    .line 10
    .line 11
    invoke-interface {v1, v0}, Ll/hsb;->e(Ljava/lang/Object;)Ll/fb5;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-object v0
.end method

.method public final e(I)Ll/iq0$b;
    .locals 1

    .line 1
    new-instance v0, Ll/iq0$b;

    .line 2
    .line 3
    iget-object p0, p0, Ll/iq0;->a:Ll/by3;

    .line 4
    .line 5
    invoke-direct {v0, p0, p1}, Ll/iq0$b;-><init>(Ll/by3;I)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public declared-synchronized f(Ll/by3;Z)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    iget-object v0, p0, Ll/iq0;->d:Ljava/util/LinkedHashSet;

    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    :try_start_0
    invoke-virtual {v0, p1}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    goto :goto_0

    .line 10
    :catchall_0
    move-exception p1

    .line 11
    goto :goto_1

    .line 12
    :cond_0
    invoke-virtual {v0, p1}, Ljava/util/AbstractCollection;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    :goto_0
    monitor-exit p0

    .line 16
    return-void

    .line 17
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    throw p1
.end method

.method public final declared-synchronized g()Ll/by3;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/iq0;->d:Ljava/util/LinkedHashSet;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Ll/by3;

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    .line 22
    .line 23
    goto :goto_0

    .line 24
    :catchall_0
    move-exception v0

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    const/4 v1, 0x0

    .line 27
    :goto_0
    monitor-exit p0

    .line 28
    return-object v1

    .line 29
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw v0
.end method
