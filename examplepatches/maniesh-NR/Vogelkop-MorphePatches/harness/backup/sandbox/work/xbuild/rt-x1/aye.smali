.class public final Laye;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lbz;


# instance fields
.field public final a:Lyxe;

.field public b:Z


# direct methods
.method public constructor <init>(Lyxe;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Laye;->a:Lyxe;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public final b()Ls50;
    .registers 2

    iget-boolean v0, p0, Laye;->b:Z

    if-eqz v0, :cond_7

    sget-object p0, Ls50;->g:Ls50;

    return-object p0

    :cond_7
    iget-object p0, p0, Laye;->a:Lyxe;

    iget-object p0, p0, Lyxe;->a:Lxd3;

    invoke-virtual {p0}, Lxd3;->b()Ls50;

    move-result-object p0

    return-object p0
.end method

.method public final c()I
    .registers 1

    iget-object p0, p0, Laye;->a:Lyxe;

    iget-object p0, p0, Lyxe;->a:Lxd3;

    invoke-virtual {p0}, Lxd3;->c()I

    move-result p0

    return p0
.end method

.method public final d(Laz;)Lyz;
    .registers 4

    iget-object v0, p0, Laye;->a:Lyxe;

    invoke-virtual {v0, p1}, Lyxe;->d(Laz;)Lyz;

    move-result-object p1

    const/4 v0, 0x0

    if-nez p1, :cond_a

    return-object v0

    :cond_a
    invoke-virtual {p1}, Lyz;->q()Z

    move-result v1

    if-eqz v1, :cond_14

    const/4 p1, 0x1

    iput-boolean p1, p0, Laye;->b:Z

    return-object v0

    :cond_14
    const/4 v0, 0x0

    iput-boolean v0, p0, Laye;->b:Z

    return-object p1
.end method

.method public final e(Lzy;Laz;)V
    .registers 5

    new-instance v0, Lzxe;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, v1}, Lzxe;-><init>(Lbz;Lzy;B)V

    iget-object p0, p0, Laye;->a:Lyxe;

    invoke-virtual {p0, v0, p2}, Lyxe;->e(Lzy;Laz;)V

    return-void
.end method

.method public final g(Ldl;)V
    .registers 2

    iget-object p0, p0, Laye;->a:Lyxe;

    invoke-virtual {p0, p1}, Lyxe;->g(Ldl;)V

    return-void
.end method

.method public final i()I
    .registers 3

    iget-object p0, p0, Laye;->a:Lyxe;

    iget v0, p0, Lyxe;->c:I

    const/4 v1, 0x0

    iput v1, p0, Lyxe;->c:I

    return v0
.end method
