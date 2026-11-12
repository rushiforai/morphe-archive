.class public final Layj;
.super Ly7h;
.source "SourceFile"


# instance fields
.field public final d:Lixh;

.field public final e:Lixh;

.field public final f:Lixh;

.field public final g:Lumj;

.field public final h:Z


# direct methods
.method public constructor <init>(Lixh;Lixh;Lixh;Lumj;Z)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Layj;->d:Lixh;

    iput-object p2, p0, Layj;->e:Lixh;

    iput-object p3, p0, Layj;->f:Lixh;

    iput-object p4, p0, Layj;->g:Lumj;

    iput-boolean p5, p0, Layj;->h:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_34

    instance-of v0, p1, Layj;

    if-eqz v0, :cond_32

    check-cast p1, Layj;

    iget-object v0, p0, Layj;->d:Lixh;

    iget-object v1, p1, Layj;->d:Lixh;

    invoke-virtual {v0, v1}, Lixh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Layj;->e:Lixh;

    iget-object v1, p1, Layj;->e:Lixh;

    invoke-virtual {v0, v1}, Lixh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Layj;->f:Lixh;

    iget-object v1, p1, Layj;->f:Lixh;

    invoke-virtual {v0, v1}, Lixh;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Layj;->g:Lumj;

    iget-object v1, p1, Layj;->g:Lumj;

    if-ne v0, v1, :cond_32

    iget-boolean p0, p0, Layj;->h:Z

    iget-boolean p1, p1, Layj;->h:Z

    if-eq p0, p1, :cond_34

    :cond_32
    const/4 p0, 0x0

    return p0

    :cond_34
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Layj;->d:Lixh;

    iget v0, v0, Lixh;->d:F

    invoke-static {v0}, Ljava/lang/Float;->hashCode(F)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Layj;->e:Lixh;

    iget v2, v2, Lixh;->d:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget-object v2, p0, Layj;->f:Lixh;

    iget v2, v2, Lixh;->d:F

    invoke-static {v2, v0, v1}, Lsko;->d(FII)I

    move-result v0

    iget-object v2, p0, Layj;->g:Lumj;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-boolean p0, p0, Layj;->h:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v2

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
