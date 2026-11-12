.class public final Li8l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lj8l;


# direct methods
.method public constructor <init>(Lj8l;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Li8l;->a:Lj8l;

    return-void
.end method


# virtual methods
.method public final L(Lb2l;Z)V
    .registers 6

    move-object p2, p1

    check-cast p2, Ld7l;

    iget-object p2, p2, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->m()Z

    move-result p2

    if-eqz p2, :cond_2e

    iget-object p0, p0, Li8l;->a:Lj8l;

    iget-object p0, p0, Lj8l;->a:Lc8l;

    move-object p2, p1

    check-cast p2, Ld7l;

    iget-object p2, p2, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->getId()I

    move-result p2

    invoke-interface {p1}, Lb9l;->T()Lp6l;

    move-result-object p1

    invoke-virtual {p0, p1}, Lc8l;->c(Lp6l;)Lmcj;

    move-result-object p1

    iget-object v0, p1, Lmcj;->b:Ljava/lang/Object;

    check-cast v0, Lo7l;

    new-instance v1, Ld7k;

    const/16 v2, 0x15

    invoke-direct {v1, p0, p1, v2}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v0, p2, v1}, Lo7l;->k(ILd7k;)V

    :cond_2e
    return-void
.end method
