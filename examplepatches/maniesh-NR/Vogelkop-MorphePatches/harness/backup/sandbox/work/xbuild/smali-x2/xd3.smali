.class public final Lxd3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbz;


# instance fields
.field public final a:Lueg;


# direct methods
.method public constructor <init>(Lueg;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxd3;->a:Lueg;

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

    iget-object p0, p0, Lxd3;->a:Lueg;

    invoke-virtual {p0}, Lueg;->b()Ls50;

    move-result-object p0

    return-object p0
.end method

.method public final c()I
    .registers 1

    iget-object p0, p0, Lxd3;->a:Lueg;

    invoke-virtual {p0}, Lueg;->c()I

    move-result p0

    return p0
.end method

.method public final d(Laz;)Lyz;
    .registers 2

    iget-object p0, p0, Lxd3;->a:Lueg;

    invoke-virtual {p0, p1}, Lueg;->d(Laz;)Lyz;

    move-result-object p0

    return-object p0
.end method

.method public final e(Lzy;Laz;)V
    .registers 4

    new-instance v0, Lwd3;

    invoke-direct {v0, p1}, Lwd3;-><init>(Lzy;)V

    iget-object p0, p0, Lxd3;->a:Lueg;

    invoke-virtual {p0, v0, p2}, Lueg;->e(Lzy;Laz;)V

    return-void
.end method

.method public final g(Ldl;)V
    .registers 2

    iget-object p0, p0, Lxd3;->a:Lueg;

    invoke-virtual {p0, p1}, Lgtg;->g(Ldl;)V

    return-void
.end method

.method public final i()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
