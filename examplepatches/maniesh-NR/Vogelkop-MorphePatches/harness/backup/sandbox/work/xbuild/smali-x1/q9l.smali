.class public final Lq9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lr9l;


# direct methods
.method public constructor <init>(Lr9l;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lq9l;->a:Lr9l;

    return-void
.end method


# virtual methods
.method public final o(Lb2l;IZ)V
    .registers 4

    move-object p2, p1

    check-cast p2, Ld7l;

    iget-object p2, p2, Ld7l;->l:Llqm;

    sget-object p3, Llqm;->l:Llqm;

    if-ne p2, p3, :cond_1c

    invoke-interface {p1}, Lb9l;->T()Lp6l;

    move-result-object p2

    iget-object p0, p0, Lq9l;->a:Lr9l;

    iget-object p0, p0, Lr9l;->t:Lgal;

    iget-object p3, p0, Lgal;->e:Lp6l;

    if-eq p2, p3, :cond_1c

    invoke-interface {p1}, Lb9l;->T()Lp6l;

    move-result-object p1

    invoke-virtual {p0, p1}, Lgal;->g(Lp6l;)V

    :cond_1c
    return-void
.end method

.method public final z()V
    .registers 3

    iget-object p0, p0, Lq9l;->a:Lr9l;

    iget-object v0, p0, Lr9l;->t:Lgal;

    sget-object v1, Lp6l;->a:Lp6l;

    invoke-virtual {v0, v1}, Lgal;->g(Lp6l;)V

    invoke-virtual {p0}, Lr9l;->j()Z

    return-void
.end method
