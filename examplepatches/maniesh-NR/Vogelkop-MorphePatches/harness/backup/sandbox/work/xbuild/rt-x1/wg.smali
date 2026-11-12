.class public final Lwg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public final synthetic a:Lxg;


# direct methods
.method public constructor <init>(Lxg;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwg;->a:Lxg;

    return-void
.end method


# virtual methods
.method public final H(Lb2l;Lb2l;I)V
    .registers 6

    iget-object p0, p0, Lwg;->a:Lxg;

    iget-object p0, p0, Lxg;->b:Ljava/lang/Iterable;

    check-cast p0, Lh7f;

    if-eqz p1, :cond_1f

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p3

    :goto_c
    invoke-virtual {p3}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1f

    invoke-virtual {p3}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La2l;

    move-object v1, p1

    check-cast v1, Ld7l;

    invoke-virtual {v1, v0}, Ld7l;->s0(La2l;)V

    goto :goto_c

    :cond_1f
    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_23
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_39

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, La2l;

    move-object p3, p2

    check-cast p3, Ld7l;

    invoke-virtual {p3, p1}, Ld7l;->e0(La2l;)V

    invoke-interface {p1, p3}, La2l;->G(Lb2l;)V

    goto :goto_23

    :cond_39
    return-void
.end method
