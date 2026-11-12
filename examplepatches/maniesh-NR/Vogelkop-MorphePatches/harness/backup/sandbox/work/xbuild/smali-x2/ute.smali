.class public final Lute;
.super Loh4;
.source "SourceFile"


# instance fields
.field public final b:Landroid/content/Context;

.field public final synthetic c:Lwte;


# direct methods
.method public constructor <init>(Lwte;Landroid/content/Context;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lute;->c:Lwte;

    iput-object p2, p0, Lute;->b:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 3

    iget-object v0, p0, Lute;->c:Lwte;

    iget-object v1, v0, Lwte;->n:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_10

    invoke-virtual {v0}, Lwte;->a()Z

    move-result v1

    if-nez v1, :cond_13

    :cond_10
    invoke-virtual {v0}, Lwte;->b()V

    :cond_13
    invoke-virtual {p0}, Lute;->e()V

    return-void
.end method

.method public final d(Ljava/lang/Object;)V
    .registers 4

    check-cast p1, Ll1c;

    if-nez p1, :cond_5

    return-void

    :cond_5
    iget-object v0, p1, Ll1c;->c:Ll0c;

    iget-object v1, p0, Lute;->c:Lwte;

    iput-object v0, v1, Lwte;->u:Ll0c;

    new-instance v0, Lx77;

    iget-object p0, p0, Lute;->b:Landroid/content/Context;

    invoke-direct {v0, p0, p1}, Lx77;-><init>(Landroid/content/Context;Ll1c;)V

    iput-object v0, v1, Lwte;->t:Lx77;

    invoke-virtual {v1}, Lwte;->b()V

    return-void
.end method

.method public final e()V
    .registers 2

    iget-object v0, p0, Lute;->c:Lwte;

    iget-object v0, v0, Lwte;->c:Lfqe;

    invoke-virtual {v0, p0}, Lfqe;->a(Lq8j;)V

    return-void
.end method
