.class public Ll/hi2;
.super Ll/ixl;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ll/hxl;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/ixl;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/hi2;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic f(Ll/hi2;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hi2;->k(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic g(Ll/hi2;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/hi2;->n(Z)V

    return-void
.end method

.method public static synthetic h(Ll/hi2;IILl/gxl;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Ll/hi2;->l(IILl/gxl;)V

    return-void
.end method

.method public static synthetic i(Ll/hi2;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/hi2;->m(ILjava/lang/String;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ei2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/ei2;-><init>(Ll/hi2;Ljava/lang/Throwable;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/nsw;->a(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public b(IILl/gxl;)V
    .locals 1

    .line 1
    new-instance v0, Ll/gi2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, Ll/gi2;-><init>(Ll/hi2;IILl/gxl;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/nsw;->a(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public c(ILjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Ll/fi2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, Ll/fi2;-><init>(Ll/hi2;ILjava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/nsw;->a(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d(Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/di2;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/di2;-><init>(Ll/hi2;Z)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/nsw;->a(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hi2;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public j(Ll/hxl;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hi2;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic k(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hi2;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/hxl;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ll/hxl;->c(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic l(IILl/gxl;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hi2;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/hxl;

    .line 18
    .line 19
    invoke-interface {v0, p1, p2, p3}, Ll/hxl;->d(IILl/gxl;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic m(ILjava/lang/String;)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hi2;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/hxl;

    .line 18
    .line 19
    invoke-interface {v0, p1, p2}, Ll/hxl;->a(ILjava/lang/String;)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method

.method public final synthetic n(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/hi2;->a:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/hxl;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ll/hxl;->b(Z)V

    .line 20
    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-void
.end method
