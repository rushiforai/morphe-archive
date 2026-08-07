.class public abstract Ll/y8s;
.super Ll/i6t;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        "V::",
        "Ll/iam;",
        ">",
        "Ll/i6t<",
        "TD;TV;>;"
    }
.end annotation


# instance fields
.field public final i:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "+TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ll/y8s;->i:Lrx/subjects/b;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic J3(Ll/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p0, Ll/y8s;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    check-cast p0, Ll/y8s;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/y8s;->P3()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic K3(Ll/uwl;)V
    .locals 1

    .line 1
    instance-of v0, p0, Ll/y8s;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    :try_start_0
    check-cast p0, Ll/y8s;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/y8s;->O3()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public static synthetic L3(Lrx/c;)Lrx/c;
    .locals 0

    .line 1
    return-object p0
.end method


# virtual methods
.method public M3(Ll/pcj;Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/cyr;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Ll/y8s;->i:Lrx/subjects/b;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lrx/c;->takeUntil(Lrx/c;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public N3(Lrx/c;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/x8s;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/x8s;-><init>(Lrx/c;)V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, v0, p1}, Ll/y8s;->M3(Ll/pcj;Z)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public O3()V
    .locals 2
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object v0, p0, Ll/y8s;->i:Lrx/subjects/b;

    .line 2
    .line 3
    sget-object v1, Ll/uxj0;->a:Ll/uxj0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    new-instance v0, Ll/v8s;

    .line 18
    .line 19
    invoke-direct {v0}, Ll/v8s;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public P3()V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/l6t;->b:Ljava/util/HashMap;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance v0, Ll/w8s;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/w8s;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public R3()V
    .locals 0

    .line 1
    return-void
.end method
