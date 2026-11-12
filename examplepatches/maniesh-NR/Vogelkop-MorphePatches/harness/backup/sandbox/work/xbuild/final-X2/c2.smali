.class public abstract Lc2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll2;


# instance fields
.field public final b:Ljava/lang/String;

.field public final c:Ls15;


# direct methods
.method public constructor <init>(Ljava/lang/Integer;Ljava/lang/String;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_2c

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    const/16 v1, 0x8

    if-gt v1, v0, :cond_25

    const/16 v2, 0x101

    if-ge v0, v2, :cond_25

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    rem-int/2addr v0, v1

    if-nez v0, :cond_25

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    goto :goto_2c

    :cond_25
    const-string p0, "Failed requirement."

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :cond_2c
    :goto_2c
    iput-object p2, p0, Lc2;->b:Ljava/lang/String;

    const-class p1, Ljava/math/BigInteger;

    invoke-static {p1}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object p1

    iput-object p1, p0, Lc2;->c:Ls15;

    return-void
.end method


# virtual methods
.method public final a()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final b(Ljava/lang/String;)Lz1;
    .registers 5

    const/16 v0, 0x40

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p1, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lz1;

    invoke-static {p1}, Ly4h;->i(Ljava/lang/String;)[B

    move-result-object p1

    instance-of p0, p0, Lk2;

    if-eqz p0, :cond_20

    new-instance p0, Ljava/math/BigInteger;

    const/4 v2, 0x1

    invoke-direct {p0, v2, p1}, Ljava/math/BigInteger;-><init>(I[B)V

    goto :goto_25

    :cond_20
    new-instance p0, Ljava/math/BigInteger;

    invoke-direct {p0, p1}, Ljava/math/BigInteger;-><init>([B)V

    :goto_25
    invoke-direct {v1, p0, v0}, Lz1;-><init>(Ljava/lang/Object;I)V

    return-object v1
.end method

.method public final c(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, Ljava/math/BigInteger;

    invoke-virtual {p0, p1}, Lc2;->f(Ljava/math/BigInteger;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final d()Ls15;
    .registers 1

    iget-object p0, p0, Lc2;->c:Ls15;

    return-object p0
.end method

.method public final bridge synthetic e(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, Ljava/math/BigInteger;

    invoke-virtual {p0, p1}, Lc2;->f(Ljava/math/BigInteger;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final f(Ljava/math/BigInteger;)Ljava/lang/String;
    .registers 8

    instance-of v0, p0, Lg2;

    const/4 v1, 0x0

    if-nez v0, :cond_13

    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    move-result v0

    if-gez v0, :cond_13

    const-string p0, "Cannot encode negative number "

    const-string v0, " as unsigned int"

    invoke-static {p1, v0, p0}, Lj9h;->t(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1

    :cond_13
    invoke-virtual {p1}, Ljava/math/BigInteger;->signum()I

    move-result v0

    const/4 v2, 0x0

    if-gez v0, :cond_1c

    const/4 v0, -0x1

    goto :goto_1d

    :cond_1c
    move v0, v2

    :goto_1d
    instance-of p0, p0, Lk2;

    invoke-virtual {p1}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object p1

    array-length v3, p1

    const/16 v4, 0x20

    rsub-int/lit8 v3, v3, 0x20

    const-string v5, "Failed requirement."

    if-nez p0, :cond_32

    if-gez v3, :cond_32

    invoke-static {v5}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1

    :cond_32
    if-eqz v3, :cond_60

    if-gez v3, :cond_53

    :goto_36
    array-length p0, p1

    sub-int/2addr p0, v4

    if-ge v2, p0, :cond_41

    aget-byte p0, p1, v2

    if-ne p0, v0, :cond_41

    add-int/lit8 v2, v2, 0x1

    goto :goto_36

    :cond_41
    if-eqz v2, :cond_4c

    array-length p0, p1

    array-length v0, p1

    invoke-static {p0, v0}, Ly72;->a(II)V

    invoke-static {p1, v2, p0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p1

    :cond_4c
    array-length p0, p1

    if-eq p0, v4, :cond_60

    invoke-static {v5}, Lqp2;->o(Ljava/lang/String;)V

    return-object v1

    :cond_53
    new-array p0, v3, [B

    :goto_55
    if-ge v2, v3, :cond_5c

    aput-byte v0, p0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_55

    :cond_5c
    invoke-static {p0, p1}, Lb82;->k([B[B)[B

    move-result-object p1

    :cond_60
    invoke-static {p1}, Lnaa;->g([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getName()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lc2;->b:Ljava/lang/String;

    return-object p0
.end method
