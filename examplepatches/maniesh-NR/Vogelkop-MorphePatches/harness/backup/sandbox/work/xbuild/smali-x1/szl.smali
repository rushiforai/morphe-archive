.class public final synthetic Lszl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lszl;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lszl;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lszl;->a:Lszl;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.celopay.model.blockchain.Transaction.Fee"

    const/4 v3, 0x5

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "currency"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "maxPriorityPerGas"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "maxPerGas"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "amount"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "maxMoney"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lszl;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 4

    sget-object p0, Luzl;->f:[Ll4c;

    const/4 v0, 0x5

    new-array v0, v0, [Lkotlinx/serialization/KSerializer;

    const/4 v1, 0x0

    aget-object p0, p0, v1

    invoke-interface {p0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p0

    aput-object p0, v0, v1

    sget-object p0, Lne3;->a:Lne3;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v1, 0x2

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    aput-object p0, v0, v1

    const/4 p0, 0x4

    sget-object v1, Lu8e;->a:Lu8e;

    aput-object v1, v0, p0

    return-object v0
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 15

    sget-object p0, Lszl;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object p1

    sget-object v0, Luzl;->f:[Ll4c;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move v4, v1

    move v6, v2

    move-object v7, v3

    move-object v8, v7

    move-object v9, v8

    move-object v10, v9

    move-object v11, v10

    :goto_12
    if-eqz v4, :cond_70

    invoke-interface {p1, p0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v5

    const/4 v12, -0x1

    if-eq v5, v12, :cond_6e

    if-eqz v5, :cond_5c

    if-eq v5, v1, :cond_50

    const/4 v12, 0x2

    if-eq v5, v12, :cond_44

    const/4 v12, 0x3

    if-eq v5, v12, :cond_38

    const/4 v11, 0x4

    if-ne v5, v11, :cond_34

    sget-object v5, Lu8e;->a:Lu8e;

    invoke-interface {p1, p0, v11, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Lw8e;

    or-int/lit8 v6, v6, 0x10

    goto :goto_12

    :cond_34
    invoke-static {v5}, Lt3p;->d(I)V

    return-object v3

    :cond_38
    sget-object v5, Lne3;->a:Lne3;

    invoke-interface {p1, p0, v12, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Ljava/math/BigInteger;

    or-int/lit8 v6, v6, 0x8

    goto :goto_12

    :cond_44
    sget-object v5, Lne3;->a:Lne3;

    invoke-interface {p1, p0, v12, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Ljava/math/BigInteger;

    or-int/lit8 v6, v6, 0x4

    goto :goto_12

    :cond_50
    sget-object v5, Lne3;->a:Lne3;

    invoke-interface {p1, p0, v1, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v8, v5

    check-cast v8, Ljava/math/BigInteger;

    or-int/lit8 v6, v6, 0x2

    goto :goto_12

    :cond_5c
    aget-object v5, v0, v2

    invoke-interface {v5}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkotlinx/serialization/KSerializer;

    invoke-interface {p1, p0, v2, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v7, v5

    check-cast v7, Lh46;

    or-int/lit8 v6, v6, 0x1

    goto :goto_12

    :cond_6e
    move v4, v2

    goto :goto_12

    :cond_70
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v5, Luzl;

    invoke-direct/range {v5 .. v11}, Luzl;-><init>(ILh46;Ljava/math/BigInteger;Ljava/math/BigInteger;Ljava/math/BigInteger;Lw8e;)V

    return-object v5
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lszl;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 9

    check-cast p2, Luzl;

    sget-object p0, Lszl;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Luzl;->f:[Ll4c;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    iget-object v2, p2, Luzl;->a:Lh46;

    iget-object v3, p2, Luzl;->e:Lw8e;

    iget-object v4, p2, Luzl;->d:Ljava/math/BigInteger;

    iget-object v5, p2, Luzl;->c:Ljava/math/BigInteger;

    iget-object p2, p2, Luzl;->b:Ljava/math/BigInteger;

    invoke-interface {p1, p0, v1, v0, v2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_28

    if-eqz p2, :cond_2e

    :cond_28
    sget-object v0, Lne3;->a:Lne3;

    const/4 v1, 0x1

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_2e
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_36

    if-eqz v5, :cond_3c

    :cond_36
    sget-object p2, Lne3;->a:Lne3;

    const/4 v0, 0x2

    invoke-interface {p1, p0, v0, p2, v5}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_3c
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_44

    if-eqz v4, :cond_4a

    :cond_44
    sget-object p2, Lne3;->a:Lne3;

    const/4 v0, 0x3

    invoke-interface {p1, p0, v0, p2, v4}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_4a
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_6a

    new-instance p2, Lw8e;

    if-eqz v5, :cond_5b

    if-eqz v4, :cond_5b

    invoke-virtual {v5, v4}, Ljava/math/BigInteger;->multiply(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    goto :goto_5d

    :cond_5b
    sget-object v0, Lpe3;->a:Ljava/math/BigInteger;

    :goto_5d
    invoke-virtual {v2, v0}, Lh46;->j(Ljava/math/BigInteger;)Ljava/math/BigInteger;

    move-result-object v0

    invoke-direct {p2, v0, v2}, Lw8e;-><init>(Ljava/math/BigInteger;Lh46;)V

    invoke-static {v3, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_70

    :cond_6a
    sget-object p2, Lu8e;->a:Lu8e;

    const/4 v0, 0x4

    invoke-interface {p1, p0, v0, p2, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_70
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
