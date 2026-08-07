.class public abstract Ll/ldk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ner;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/greet/c;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/greet/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ldk;->a:Lcom/p1/mobile/putong/core/ui/greet/c;

    .line 5
    .line 6
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/ui/greet/c;->j0(Ll/ldk;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/ui/greet/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ldk;->a:Lcom/p1/mobile/putong/core/ui/greet/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()V
    .locals 0

    .line 1
    return-void
.end method

.method public c()V
    .locals 0

    .line 1
    return-void
.end method

.method public creates(Ll/y20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/os/Bundle;",
            ">;)V"
        }
    .end annotation

    .line 7
    iget-object p0, p0, Ll/ldk;->a:Lcom/p1/mobile/putong/core/ui/greet/c;

    invoke-virtual {p0, p1}, Ll/ar2;->creates(Ll/y20;)V

    return-void
.end method

.method public creates(Ll/y20;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Landroid/os/Bundle;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ldk;->a:Lcom/p1/mobile/putong/core/ui/greet/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ar2;->creates(Ll/y20;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public duringCreated(Ll/pcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 8
    iget-object p0, p0, Ll/ldk;->a:Lcom/p1/mobile/putong/core/ui/greet/c;

    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Ll/pcj;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public duringCreated(Ll/pcj;Z)Lrx/c;
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
    iget-object p0, p0, Ll/ldk;->a:Lcom/p1/mobile/putong/core/ui/greet/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ar2;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public duringCreated(Lrx/c;)Lrx/c;
    .locals 0
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

    .line 9
    iget-object p0, p0, Ll/ldk;->a:Lcom/p1/mobile/putong/core/ui/greet/c;

    invoke-virtual {p0, p1}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public lifecycle()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/p1/mobile/android/app/c;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ldk;->a:Lcom/p1/mobile/putong/core/ui/greet/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public lifecycle_()Lcom/p1/mobile/android/app/c;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ldk;->a:Lcom/p1/mobile/putong/core/ui/greet/c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ar2;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
