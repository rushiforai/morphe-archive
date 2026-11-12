.class public final Le2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll2;


# instance fields
.field public final b:Ljava/lang/Integer;

.field public final c:Ls15;

.field public final d:Ljava/lang/String;

.field public final e:Z


# direct methods
.method public constructor <init>(Ljava/lang/Integer;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le2;->b:Ljava/lang/Integer;

    if-eqz p1, :cond_16

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x20

    if-le v0, v1, :cond_16

    const-string p0, "Failed requirement."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :cond_16
    const-class v0, [B

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    iput-object v0, p0, Le2;->c:Ls15;

    const-string v0, "bytes"

    if-eqz p1, :cond_2e

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_2e
    iput-object v0, p0, Le2;->d:Ljava/lang/String;

    if-nez p1, :cond_34

    const/4 p1, 0x1

    goto :goto_35

    :cond_34
    const/4 p1, 0x0

    :goto_35
    iput-boolean p1, p0, Le2;->e:Z

    return-void
.end method

.method public static g([B)Ljava/lang/String;
    .registers 3

    invoke-static {p0}, Lnaa;->g([B)Ljava/lang/String;

    move-result-object v0

    array-length p0, p0

    invoke-static {p0}, Le2;->h(I)I

    move-result p0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-gt v1, p0, :cond_16

    const/16 v1, 0x30

    invoke-static {v0, p0, v1}, Lkotlin/text/StringsKt;->R(Ljava/lang/String;IC)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_16
    const-string p0, "Can\'t pad \'"

    const-string v1, "\' as it\'s longer than 64 already."

    invoke-static {p0, v0, v1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lbxl;->d(Ljava/lang/Object;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public static h(I)I
    .registers 3

    const/4 v0, 0x1

    shl-int/2addr p0, v0

    div-int/lit8 v1, p0, 0x40

    rem-int/lit8 p0, p0, 0x40

    if-nez p0, :cond_9

    const/4 v0, 0x0

    :cond_9
    add-int/2addr v1, v0

    shl-int/lit8 v1, v1, 0x6

    return v1
.end method


# virtual methods
.method public final a()Z
    .registers 1

    iget-boolean p0, p0, Le2;->e:Z

    return p0
.end method

.method public final b(Ljava/lang/String;)Lz1;
    .registers 6

    const/4 v0, 0x0

    iget-object p0, p0, Le2;->b:Ljava/lang/Integer;

    if-eqz p0, :cond_2c

    const/16 v1, 0x40

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    move-result v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    new-instance v2, Lz1;

    invoke-static {p1}, Ly4h;->i(Ljava/lang/String;)[B

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    array-length v3, p1

    if-le v3, p0, :cond_28

    array-length v3, p1

    invoke-static {p0, v3}, Ly72;->a(II)V

    invoke-static {p1, v0, p0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p1

    :cond_28
    invoke-direct {v2, p1, v1}, Lz1;-><init>(Ljava/lang/Object;I)V

    return-object v2

    :cond_2c
    sget-object p0, Ll2;->a:Lf2;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lf2;->b:Lk2;

    invoke-virtual {p0, p1}, Lc2;->b(Ljava/lang/String;)Lz1;

    move-result-object p0

    iget v1, p0, Lz1;->b:I

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lz1;->a:Ljava/lang/Object;

    check-cast p0, Ljava/math/BigInteger;

    invoke-virtual {p0}, Ljava/math/BigInteger;->intValue()I

    move-result p0

    invoke-static {p0}, Le2;->h(I)I

    move-result v2

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ly4h;->i(Ljava/lang/String;)[B

    move-result-object p1

    array-length v3, p1

    if-le v3, p0, :cond_64

    array-length v3, p1

    invoke-static {p0, v3}, Ly72;->a(II)V

    invoke-static {p1, v0, p0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p1

    :cond_64
    add-int/2addr v2, v1

    new-instance p0, Lz1;

    invoke-direct {p0, p1, v2}, Lz1;-><init>(Ljava/lang/Object;I)V

    return-object p0
.end method

.method public final c(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, [B

    invoke-virtual {p0, p1}, Le2;->f([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ls15;
    .registers 1

    iget-object p0, p0, Le2;->c:Ls15;

    return-object p0
.end method

.method public final bridge synthetic e(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, [B

    invoke-virtual {p0, p1}, Le2;->f([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Le2;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Le2;

    iget-object p0, p0, Le2;->b:Ljava/lang/Integer;

    iget-object p1, p1, Le2;->b:Ljava/lang/Integer;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_17

    return v2

    :cond_17
    return v0
.end method

.method public final f([B)Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Le2;->b:Ljava/lang/Integer;

    if-eqz p0, :cond_17

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    array-length v0, p1

    if-gt v0, p0, :cond_10

    invoke-static {p1}, Le2;->g([B)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_10
    const-string p0, "Failed requirement."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_17
    sget-object p0, Ll2;->a:Lf2;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lf2;->b:Lk2;

    array-length v0, p1

    invoke-static {v0}, Lmkh;->D(I)Ljava/math/BigInteger;

    move-result-object v0

    invoke-virtual {p0, v0}, Lc2;->f(Ljava/math/BigInteger;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1}, Le2;->g([B)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getName()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Le2;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Le2;->b:Ljava/lang/Integer;

    if-nez p0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Bytes(size="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Le2;->b:Ljava/lang/Integer;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
