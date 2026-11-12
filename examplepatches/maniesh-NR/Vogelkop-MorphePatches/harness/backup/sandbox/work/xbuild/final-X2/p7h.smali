.class public final Lp7h;
.super Lgtg;
.source "SourceFile"

# interfaces
.implements Ldz;


# instance fields
.field public final d:Ldz;

.field public final e:Lvo;


# direct methods
.method public constructor <init>(Ldz;Lvo;Lr9g;)V
    .registers 4

    invoke-direct {p0, p3}, Lgtg;-><init>(Lr9g;)V

    iput-object p1, p0, Lp7h;->d:Ldz;

    iput-object p2, p0, Lp7h;->e:Lvo;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-object p0, p0, Lp7h;->d:Ldz;

    invoke-interface {p0}, Lbz;->a()Z

    move-result p0

    return p0
.end method

.method public final b()Ls50;
    .registers 1

    iget-object p0, p0, Lp7h;->d:Ldz;

    invoke-interface {p0}, Lbz;->b()Ls50;

    move-result-object p0

    return-object p0
.end method

.method public final c()I
    .registers 1

    iget-object p0, p0, Lp7h;->d:Ldz;

    invoke-interface {p0}, Lbz;->c()I

    move-result p0

    return p0
.end method

.method public final d(Laz;)Lyz;
    .registers 3

    iget-object v0, p0, Lp7h;->d:Ldz;

    invoke-interface {v0, p1}, Lbz;->d(Laz;)Lyz;

    move-result-object p1

    if-nez p1, :cond_a

    const/4 p0, 0x0

    return-object p0

    :cond_a
    invoke-virtual {p0, p1}, Lp7h;->l(Lyz;)V

    return-object p1
.end method

.method public final e(Lzy;Laz;)V
    .registers 4

    const/4 v0, 0x1

    invoke-virtual {p0, p1, p2, v0}, Lp7h;->h(Lzy;Laz;I)V

    return-void
.end method

.method public final f()Z
    .registers 1

    iget-object p0, p0, Lp7h;->d:Ldz;

    invoke-interface {p0}, Ldz;->f()Z

    move-result p0

    return p0
.end method

.method public final h(Lzy;Laz;I)V
    .registers 6

    new-instance v0, Lzxe;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p1, v1}, Lzxe;-><init>(Lbz;Lzy;B)V

    iget-object p0, p0, Lp7h;->d:Ldz;

    invoke-interface {p0, v0, p2, p3}, Ldz;->h(Lzy;Laz;I)V

    return-void
.end method

.method public final k(Ljava/lang/String;)Z
    .registers 3

    iget-object p0, p0, Lp7h;->d:Ldz;

    instance-of v0, p0, Lgtg;

    if-eqz v0, :cond_10

    check-cast p0, Lgtg;

    invoke-virtual {p0, p1}, Lgtg;->k(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final l(Lyz;)V
    .registers 6

    instance-of v0, p1, Laqi;

    iget-object p0, p0, Lp7h;->e:Lvo;

    if-eqz v0, :cond_18

    iget-object v0, p1, Lyz;->n:Luz;

    if-nez v0, :cond_18

    move-object v0, p1

    check-cast v0, Laqi;

    iget v1, p0, Lvo;->f:I

    int-to-long v1, v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v1, v2}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v1

    iput-wide v1, v0, Laqi;->s:J

    :cond_18
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Luz;

    invoke-direct {v0, p0}, Luz;-><init>(Lvo;)V

    iput-object v0, p1, Lyz;->n:Luz;

    return-void
.end method
