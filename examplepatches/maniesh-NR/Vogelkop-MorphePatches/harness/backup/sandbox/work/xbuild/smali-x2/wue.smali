.class public final Lwue;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lu82;


# instance fields
.field public final a:Lh7f;

.field public final b:Ltw2;

.field public c:La53;

.field public d:Z

.field public e:Z


# direct methods
.method public constructor <init>(Ltw2;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lh7f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lwue;->a:Lh7f;

    iput-object p1, p0, Lwue;->b:Ltw2;

    return-void
.end method


# virtual methods
.method public final a(Lrw8;)V
    .registers 3

    iget-object v0, p0, Lwue;->a:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_35

    iget-object v0, p0, Lwue;->c:La53;

    if-nez v0, :cond_26

    const/4 p1, 0x0

    iput-boolean p1, p0, Lwue;->e:Z

    iget-boolean p1, p0, Lwue;->d:Z

    if-nez p1, :cond_35

    const/4 p1, 0x1

    iput-boolean p1, p0, Lwue;->d:Z

    new-instance p1, Lfv2;

    const/4 v0, 0x7

    invoke-direct {p1, p0, v0}, Lfv2;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lwue;->b:Ltw2;

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lxqe;

    invoke-virtual {p0, p1}, Lxqe;->n(Ljava/lang/Runnable;)V

    return-void

    :cond_26
    iget-object p0, v0, La53;->a:Lwue;

    iget-object p0, p0, Lwue;->b:Ltw2;

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lxqe;

    invoke-virtual {p0}, Lxqe;->a()Ljava/util/List;

    move-result-object p0

    invoke-virtual {p1, p0}, Lrw8;->a(Ljava/util/List;)V

    :cond_35
    return-void
.end method

.method public final b(Lrw8;)V
    .registers 3

    iget-object v0, p0, Lwue;->a:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_28

    invoke-virtual {v0}, Lh7f;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_28

    iget-boolean p1, p0, Lwue;->d:Z

    if-eqz p1, :cond_16

    const/4 p1, 0x1

    iput-boolean p1, p0, Lwue;->e:Z

    return-void

    :cond_16
    iget-object p1, p0, Lwue;->c:La53;

    if-eqz p1, :cond_28

    iget-object v0, p0, Lwue;->b:Ltw2;

    iget-object v0, v0, Ltw2;->b:Ljava/lang/Object;

    check-cast v0, Lxqe;

    iget-object v0, v0, Lxqe;->b:Lh7f;

    invoke-virtual {v0, p1}, Lh7f;->c(Ljava/lang/Object;)Z

    const/4 p1, 0x0

    iput-object p1, p0, Lwue;->c:La53;

    :cond_28
    return-void
.end method
