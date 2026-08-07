.class public Ll/eb5;
.super Ll/q7;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/q7<",
        "Ll/fb5<",
        "TT;>;>;"
    }
.end annotation


# direct methods
.method public constructor <init>(Ll/wk90;Ll/eve0;Ll/k2d0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/wk90<",
            "Ll/fb5<",
            "TT;>;>;",
            "Ll/eve0;",
            "Ll/k2d0;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Ll/q7;-><init>(Ll/wk90;Ll/eve0;Ll/k2d0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static H(Ll/wk90;Ll/eve0;Ll/k2d0;)Ll/i6c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/wk90<",
            "Ll/fb5<",
            "TT;>;>;",
            "Ll/eve0;",
            "Ll/k2d0;",
            ")",
            "Ll/i6c<",
            "Ll/fb5<",
            "TT;>;>;"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/i9j;->d()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "CloseableProducerToDataSourceAdapter#create"

    .line 8
    .line 9
    invoke-static {v0}, Ll/i9j;->a(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    new-instance v0, Ll/eb5;

    .line 13
    .line 14
    invoke-direct {v0, p0, p1, p2}, Ll/eb5;-><init>(Ll/wk90;Ll/eve0;Ll/k2d0;)V

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/i9j;->d()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Ll/i9j;->b()V

    .line 24
    .line 25
    .line 26
    :cond_1
    return-object v0
.end method


# virtual methods
.method public bridge synthetic F(Ljava/lang/Object;ILl/yk90;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Ll/eb5;->J(Ll/fb5;ILl/yk90;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public G(Ll/fb5;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/fb5;->v(Ll/fb5;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public I()Ll/fb5;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/fb5<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/facebook/datasource/AbstractDataSource;->getResult()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/fb5;

    .line 6
    .line 7
    invoke-static {p0}, Ll/fb5;->t(Ll/fb5;)Ll/fb5;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public J(Ll/fb5;ILl/yk90;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/fb5<",
            "TT;>;I",
            "Ll/yk90;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/fb5;->t(Ll/fb5;)Ll/fb5;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-super {p0, p1, p2, p3}, Ll/q7;->F(Ljava/lang/Object;ILl/yk90;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public bridge synthetic g(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ll/fb5;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/eb5;->G(Ll/fb5;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic getResult()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/eb5;->I()Ll/fb5;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
