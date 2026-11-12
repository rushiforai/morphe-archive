.class public final Ln8e;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ljava/math/BigInteger;Li46;)Lx8e;
    .registers 3

    instance-of v0, p1, Lg46;

    if-eqz v0, :cond_c

    new-instance v0, Lt8e;

    check-cast p1, Lg46;

    invoke-direct {v0, p0, p1}, Lt8e;-><init>(Ljava/math/BigInteger;Lg46;)V

    return-object v0

    :cond_c
    instance-of v0, p1, Lh46;

    if-eqz v0, :cond_18

    new-instance v0, Lw8e;

    check-cast p1, Lh46;

    invoke-direct {v0, p0, p1}, Lw8e;-><init>(Ljava/math/BigInteger;Lh46;)V

    return-object v0

    :cond_18
    instance-of v0, p1, Lf46;

    if-eqz v0, :cond_24

    new-instance v0, Lq8e;

    check-cast p1, Lf46;

    invoke-direct {v0, p0, p1}, Lq8e;-><init>(Ljava/math/BigInteger;Lf46;)V

    return-object v0

    :cond_24
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public final serializer()Lkotlinx/serialization/KSerializer;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/serialization/KSerializer;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object p0, Lx8e;->b:Ll4c;

    invoke-interface {p0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
