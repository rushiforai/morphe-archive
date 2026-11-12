.class public final Lyxe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbz;


# instance fields
.field public final a:Lxd3;

.field public final b:Lnn7;

.field public c:I


# direct methods
.method public constructor <init>(Lxd3;Lnn7;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyxe;->a:Lxd3;

    iput-object p2, p0, Lyxe;->b:Lnn7;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final b()Ls50;
    .registers 1

    iget-object p0, p0, Lyxe;->a:Lxd3;

    iget-object p0, p0, Lxd3;->a:Lueg;

    invoke-virtual {p0}, Lueg;->b()Ls50;

    move-result-object p0

    return-object p0
.end method

.method public final c()I
    .registers 1

    iget-object p0, p0, Lyxe;->a:Lxd3;

    iget-object p0, p0, Lxd3;->a:Lueg;

    invoke-virtual {p0}, Lueg;->c()I

    move-result p0

    return p0
.end method

.method public final d(Laz;)Lyz;
    .registers 6

    iget-object v0, p0, Lyxe;->a:Lxd3;

    iget-object v0, v0, Lxd3;->a:Lueg;

    invoke-virtual {v0, p1}, Lueg;->d(Laz;)Lyz;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_c

    return-object v1

    :cond_c
    invoke-interface {p1}, Laz;->e()Z

    move-result v2

    if-nez v2, :cond_20

    new-instance v2, Low3;

    const/4 v3, 0x4

    invoke-direct {v2, p0, p1, v3}, Low3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p1, p0, Lyxe;->b:Lnn7;

    invoke-virtual {p1, v0, v2}, Lnn7;->k(Lyz;Lesk;)Z

    move-result p1

    if-eqz p1, :cond_21

    :cond_20
    return-object v0

    :cond_21
    iget p1, p0, Lyxe;->c:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lyxe;->c:I

    return-object v1
.end method

.method public final e(Lzy;Laz;)V
    .registers 5

    invoke-interface {p2}, Laz;->e()Z

    move-result v0

    iget-object v1, p0, Lyxe;->a:Lxd3;

    if-eqz v0, :cond_c

    invoke-virtual {v1, p1, p2}, Lxd3;->e(Lzy;Laz;)V

    return-void

    :cond_c
    new-instance v0, Lmhb;

    invoke-direct {v0, p0, p1, p2}, Lmhb;-><init>(Lyxe;Lzy;Laz;)V

    invoke-virtual {v1, v0, p2}, Lxd3;->e(Lzy;Laz;)V

    return-void
.end method

.method public final g(Ldl;)V
    .registers 2

    iget-object p0, p0, Lyxe;->a:Lxd3;

    invoke-virtual {p0, p1}, Lxd3;->g(Ldl;)V

    return-void
.end method

.method public final i()I
    .registers 3

    iget v0, p0, Lyxe;->c:I

    const/4 v1, 0x0

    iput v1, p0, Lyxe;->c:I

    return v0
.end method
