.class public final Llg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkri;
.implements Lw6f;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Lq6e;

.field public c:Ll6e;

.field public d:Leri;


# direct methods
.method public constructor <init>(Lq6e;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Llg;->a:Ljava/util/ArrayList;

    iput-object p1, p0, Llg;->b:Lq6e;

    invoke-virtual {p1, p0}, Lq6e;->a(Lkri;)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lkg;

    iget-object p0, p0, Llg;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lkg;

    iget-object p0, p0, Llg;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Lq6e;)V
    .registers 5

    iget-object v0, p0, Llg;->d:Leri;

    const/4 v1, 0x0

    if-eqz v0, :cond_d

    iget-object v2, p0, Llg;->c:Ll6e;

    if-eqz v2, :cond_d

    invoke-virtual {p1, v0}, Lq6e;->f(Leri;)Ll6e;

    move-result-object v1

    :cond_d
    const/4 p1, 0x0

    invoke-virtual {p0, v1, p1, p1}, Llg;->f(Leri;ZZ)Z

    invoke-virtual {p0, p1}, Llg;->c(Z)V

    return-void
.end method

.method public final b()Leri;
    .registers 1

    iget-object p0, p0, Llg;->d:Leri;

    if-eqz p0, :cond_5

    return-object p0

    :cond_5
    sget-object p0, Leri;->a:Lcri;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lcri;->b:Lbri;

    return-object p0
.end method

.method public final c(Z)V
    .registers 7

    iget-object v0, p0, Llg;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_7
    if-ge v2, v1, :cond_19

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lkg;

    invoke-virtual {p0}, Llg;->b()Leri;

    move-result-object v4

    invoke-interface {v3, v4, p1}, Lkg;->q(Leri;Z)V

    goto :goto_7

    :cond_19
    return-void
.end method

.method public final e(J)Z
    .registers 4

    iget-object v0, p0, Llg;->b:Lq6e;

    invoke-virtual {v0, p1, p2}, Lq6e;->c(J)Ll6e;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2, p2}, Llg;->f(Leri;ZZ)Z

    move-result v0

    if-eqz v0, :cond_12

    iput-object p1, p0, Llg;->c:Ll6e;

    invoke-virtual {p0, p2}, Llg;->c(Z)V

    :cond_12
    return v0
.end method

.method public final f(Leri;ZZ)Z
    .registers 5

    if-nez p1, :cond_8

    iget-object p1, p0, Llg;->b:Lq6e;

    invoke-virtual {p1}, Lq6e;->b()Leri;

    move-result-object p1

    :cond_8
    iget-object v0, p0, Llg;->d:Leri;

    invoke-static {v0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_12

    const/4 p0, 0x0

    return p0

    :cond_12
    iput-object p1, p0, Llg;->d:Leri;

    if-eqz p3, :cond_19

    invoke-virtual {p0, p2}, Llg;->c(Z)V

    :cond_19
    const/4 p0, 0x1

    return p0
.end method
