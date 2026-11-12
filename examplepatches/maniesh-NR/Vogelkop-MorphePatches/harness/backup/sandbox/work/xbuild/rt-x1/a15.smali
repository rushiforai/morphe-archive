.class public final La15;
.super Llze;
.source "SourceFile"


# instance fields
.field public final synthetic c:Lbre;

.field public final synthetic d:Lc15;


# direct methods
.method public constructor <init>(Lc15;Lc15;Lbre;)V
    .registers 4

    iput-object p3, p0, La15;->c:Lbre;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, La15;->d:Lc15;

    invoke-direct {p0, p2}, Llze;-><init>(Lt7j;)V

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;)V
    .registers 5

    check-cast p1, Lz05;

    iget-object p1, p0, La15;->d:Lc15;

    invoke-static {p1}, Lc15;->e(Lc15;)Lq8j;

    move-result-object v0

    iget-object v1, p1, Lc15;->j:Lta7;

    if-ne v0, p0, :cond_21

    invoke-static {p1}, Lc15;->f(Lc15;)V

    invoke-virtual {v1}, Lta7;->t()Lbre;

    move-result-object v0

    iget-object p0, p0, La15;->c:Lbre;

    invoke-virtual {p0, v0}, Lbre;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    invoke-virtual {v1}, Lta7;->u()Z

    move-result v0

    if-eqz v0, :cond_22

    :cond_21
    return-void

    :cond_22
    invoke-virtual {v1}, Lta7;->n()Ljava/util/List;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v1, v0, p0, v2}, Lta7;->y(Ljava/util/List;Lbre;Z)V

    invoke-virtual {p1}, Lt7j;->c()V

    return-void
.end method
