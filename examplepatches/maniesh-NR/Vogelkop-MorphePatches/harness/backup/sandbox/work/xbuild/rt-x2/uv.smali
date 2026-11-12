.class public final Luv;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ljava/lang/String;)Lwv;
    .registers 4

    new-instance v0, Lwv;

    new-instance v1, Ljava/math/BigInteger;

    const/16 v2, 0x10

    invoke-direct {v1, p0, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    invoke-direct {v0, v1}, Lwv;-><init>(Ljava/math/BigInteger;)V

    return-object v0
.end method

.method public static b(Ljava/lang/String;)Lwv;
    .registers 4

    new-instance v0, Lwv;

    new-instance v1, Ljava/math/BigInteger;

    invoke-static {p0}, Lk1g;->N(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 v2, 0x10

    invoke-direct {v1, p0, v2}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    invoke-direct {v0, v1}, Lwv;-><init>(Ljava/math/BigInteger;)V

    return-object v0
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

    sget-object p0, Lvv;->a:Lvv;

    return-object p0
.end method
