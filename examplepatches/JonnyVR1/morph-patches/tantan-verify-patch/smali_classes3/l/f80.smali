.class public Ll/f80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ner;


# instance fields
.field public a:Ll/pol;

.field public b:Ll/ner;


# direct methods
.method public constructor <init>(Ll/pol;Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/f80;->a:Ll/pol;

    .line 5
    .line 6
    iput-object p2, p0, Ll/f80;->b:Ll/ner;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
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
    iget-object p0, p0, Ll/f80;->b:Ll/ner;

    invoke-interface {p0, p1}, Ll/ner;->creates(Ll/y20;)V

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
    iget-object p0, p0, Ll/f80;->b:Ll/ner;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ll/ner;->creates(Ll/y20;Ll/x20;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public duringCreated(Ll/pcj;)Lrx/c;
    .locals 1
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

    .line 16
    iget-object v0, p0, Ll/f80;->a:Ll/pol;

    iget-object p0, p0, Ll/f80;->b:Ll/ner;

    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lrx/c;

    invoke-interface {v0, p0, p1}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public duringCreated(Ll/pcj;Z)Lrx/c;
    .locals 1
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
    iget-object v0, p0, Ll/f80;->a:Ll/pol;

    .line 2
    .line 3
    iget-object p0, p0, Ll/f80;->b:Ll/ner;

    .line 4
    .line 5
    invoke-interface {p1}, Ll/pcj;->call()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lrx/c;

    .line 10
    .line 11
    invoke-interface {v0, p0, p1, p2}, Ll/pol;->g(Ll/ner;Lrx/c;Z)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public duringCreated(Lrx/c;)Lrx/c;
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

    .line 17
    iget-object v0, p0, Ll/f80;->a:Ll/pol;

    iget-object p0, p0, Ll/f80;->b:Ll/ner;

    invoke-interface {v0, p0, p1}, Ll/pol;->c(Ll/ner;Lrx/c;)Lrx/c;

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
    iget-object p0, p0, Ll/f80;->b:Ll/ner;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ner;->lifecycle()Lrx/c;

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
    iget-object p0, p0, Ll/f80;->b:Ll/ner;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/ner;->lifecycle_()Lcom/p1/mobile/android/app/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
