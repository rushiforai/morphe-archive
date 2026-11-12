.class public final Lb2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll2;


# instance fields
.field public final b:Ll2;

.field public final c:Ljava/lang/Integer;

.field public final d:Ls15;

.field public final e:Z

.field public final f:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll2;Ljava/lang/Integer;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lb2;->b:Ll2;

    iput-object p2, p0, Lb2;->c:Ljava/lang/Integer;

    const-class v0, Ljava/util/List;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    iput-object v0, p0, Lb2;->d:Ls15;

    if-nez p2, :cond_13

    const/4 p2, 0x1

    goto :goto_14

    :cond_13
    const/4 p2, 0x0

    :goto_14
    iput-boolean p2, p0, Lb2;->e:Z

    invoke-interface {p1}, Ll2;->getName()Ljava/lang/String;

    move-result-object p1

    const-string p2, "[]"

    invoke-static {p1, p2}, Lsko;->u(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lb2;->f:Ljava/lang/String;

    return-void
.end method

.method public static g(Lb2;Ljava/lang/String;I)Lz1;
    .registers 3

    invoke-virtual {p0, p2}, Lb2;->f(I)Lj2;

    move-result-object p0

    invoke-virtual {p0, p1}, Lj2;->b(Ljava/lang/String;)Lz1;

    move-result-object p0

    new-instance p1, Lz1;

    iget-object p2, p0, Lz1;->a:Ljava/lang/Object;

    check-cast p2, Ljava/util/List;

    iget p0, p0, Lz1;->b:I

    invoke-direct {p1, p2, p0}, Lz1;-><init>(Ljava/lang/Object;I)V

    return-object p1
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-boolean p0, p0, Lb2;->e:Z

    return p0
.end method

.method public final b(Ljava/lang/String;)Lz1;
    .registers 4

    iget-object v0, p0, Lb2;->c:Ljava/lang/Integer;

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-static {p0, p1, v0}, Lb2;->g(Lb2;Ljava/lang/String;I)Lz1;

    move-result-object p0

    return-object p0

    :cond_d
    sget-object v0, Ll2;->a:Lf2;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lf2;->b:Lk2;

    invoke-virtual {v0, p1}, Lc2;->b(Ljava/lang/String;)Lz1;

    move-result-object v0

    iget v1, v0, Lz1;->b:I

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    iget-object v0, v0, Lz1;->a:Ljava/lang/Object;

    check-cast v0, Ljava/math/BigInteger;

    invoke-virtual {v0}, Ljava/math/BigInteger;->intValue()I

    move-result v0

    invoke-static {p0, p1, v0}, Lb2;->g(Lb2;Ljava/lang/String;I)Lz1;

    move-result-object p0

    iget p1, p0, Lz1;->b:I

    add-int/2addr p1, v1

    iget-object p0, p0, Lz1;->a:Ljava/lang/Object;

    new-instance v0, Lz1;

    invoke-direct {v0, p0, p1}, Lz1;-><init>(Ljava/lang/Object;I)V

    return-object v0
.end method

.method public final c(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lb2;->h(Ljava/util/List;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ls15;
    .registers 1

    iget-object p0, p0, Lb2;->d:Ls15;

    return-object p0
.end method

.method public final bridge synthetic e(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lb2;->h(Ljava/util/List;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lb2;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lb2;

    iget-object v1, p0, Lb2;->b:Ll2;

    iget-object v3, p1, Lb2;->b:Ll2;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object p0, p0, Lb2;->c:Ljava/lang/Integer;

    iget-object p1, p1, Lb2;->c:Ljava/lang/Integer;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_22

    return v2

    :cond_22
    return v0
.end method

.method public final f(I)Lj2;
    .registers 5

    new-instance v0, Lehc;

    invoke-direct {v0, p1}, Lehc;-><init>(I)V

    const/4 v1, 0x0

    :goto_6
    if-ge v1, p1, :cond_10

    iget-object v2, p0, Lb2;->b:Ll2;

    invoke-virtual {v0, v2}, Lehc;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_10
    invoke-static {v0}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object p0

    new-instance p1, Lj2;

    invoke-direct {p1, p0}, Lj2;-><init>(Ljava/util/List;)V

    return-object p1
.end method

.method public final getName()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lb2;->f:Ljava/lang/String;

    return-object p0
.end method

.method public final h(Ljava/util/List;)Ljava/lang/String;
    .registers 4

    iget-object v0, p0, Lb2;->c:Ljava/lang/Integer;

    if-nez v0, :cond_28

    sget-object v0, Ll2;->a:Lf2;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lf2;->b:Lk2;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-static {v1}, Lmkh;->D(I)Ljava/math/BigInteger;

    move-result-object v1

    invoke-virtual {v0, v1}, Lc2;->f(Ljava/math/BigInteger;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {p0, v1}, Lb2;->f(I)Lj2;

    move-result-object p0

    invoke-virtual {p0, p1}, Lj2;->f(Ljava/util/List;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_28
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v1, v0, :cond_3f

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p0, v0}, Lb2;->f(I)Lj2;

    move-result-object p0

    invoke-virtual {p0, p1}, Lj2;->f(Ljava/util/List;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_3f
    const-string p0, "Failed requirement."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final hashCode()I
    .registers 2

    iget-object v0, p0, Lb2;->b:Ll2;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lb2;->c:Ljava/lang/Integer;

    if-nez p0, :cond_e

    const/4 p0, 0x0

    goto :goto_12

    :cond_e
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    :goto_12
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Array(itemType="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lb2;->b:Ll2;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", size="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lb2;->c:Ljava/lang/Integer;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
