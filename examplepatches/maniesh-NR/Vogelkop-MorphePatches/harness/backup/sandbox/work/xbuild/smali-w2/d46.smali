.class public final synthetic Ld46;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Ld46;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ld46;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ld46;->a:Ld46;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.celopay.model.money.Currency.Custom"

    const/4 v3, 0x5

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "fiat"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "code"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "symbol"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "decimals"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "formatDecimals"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Ld46;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 3

    sget-object p0, Lf46;->f:[Ll4c;

    const/4 v0, 0x5

    new-array v0, v0, [Lkotlinx/serialization/KSerializer;

    const/4 v1, 0x0

    aget-object p0, p0, v1

    invoke-interface {p0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p0

    aput-object p0, v0, v1

    sget-object p0, Lxhk;->a:Lxhk;

    const/4 v1, 0x1

    aput-object p0, v0, v1

    const/4 v1, 0x2

    aput-object p0, v0, v1

    sget-object p0, Lecb;->a:Lecb;

    const/4 v1, 0x3

    aput-object p0, v0, v1

    const/4 v1, 0x4

    aput-object p0, v0, v1

    return-object v0
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 15

    sget-object p0, Ld46;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object p1

    sget-object v0, Lf46;->f:[Ll4c;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move v4, v1

    move v6, v2

    move v10, v6

    move v11, v10

    move-object v7, v3

    move-object v8, v7

    move-object v9, v8

    :goto_12
    if-eqz v4, :cond_5c

    invoke-interface {p1, p0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v5

    const/4 v12, -0x1

    if-eq v5, v12, :cond_5a

    if-eqz v5, :cond_48

    if-eq v5, v1, :cond_41

    const/4 v12, 0x2

    if-eq v5, v12, :cond_3a

    const/4 v12, 0x3

    if-eq v5, v12, :cond_33

    const/4 v11, 0x4

    if-ne v5, v11, :cond_2f

    invoke-interface {p1, p0, v11}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v11

    or-int/lit8 v6, v6, 0x10

    goto :goto_12

    :cond_2f
    invoke-static {v5}, Lt3p;->d(I)V

    return-object v3

    :cond_33
    invoke-interface {p1, p0, v12}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v10

    or-int/lit8 v6, v6, 0x8

    goto :goto_12

    :cond_3a
    invoke-interface {p1, p0, v12}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v9

    or-int/lit8 v6, v6, 0x4

    goto :goto_12

    :cond_41
    invoke-interface {p1, p0, v1}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v8

    or-int/lit8 v6, v6, 0x2

    goto :goto_12

    :cond_48
    aget-object v5, v0, v2

    invoke-interface {v5}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkotlinx/serialization/KSerializer;

    invoke-interface {p1, p0, v2, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v7, v5

    check-cast v7, Lg46;

    or-int/lit8 v6, v6, 0x1

    goto :goto_12

    :cond_5a
    move v4, v2

    goto :goto_12

    :cond_5c
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v5, Lf46;

    invoke-direct/range {v5 .. v11}, Lf46;-><init>(ILg46;Ljava/lang/String;Ljava/lang/String;II)V

    return-object v5
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Ld46;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 9

    check-cast p2, Lf46;

    sget-object p0, Ld46;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lf46;->f:[Ll4c;

    const/4 v1, 0x0

    aget-object v0, v0, v1

    invoke-interface {v0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    iget-object v2, p2, Lf46;->a:Lg46;

    iget v3, p2, Lf46;->e:I

    iget v4, p2, Lf46;->d:I

    iget-object v5, p2, Lf46;->c:Ljava/lang/String;

    iget-object p2, p2, Lf46;->b:Ljava/lang/String;

    invoke-interface {p1, p0, v1, v0, v2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_2e

    iget-object v0, v2, Lg46;->a:Ljava/lang/String;

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    :cond_2e
    const/4 v0, 0x1

    invoke-interface {p1, p0, v0, p2}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_32
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_44

    iget-object p2, v2, Lg46;->d:Ljava/lang/String;

    if-nez p2, :cond_3e

    iget-object p2, v2, Lg46;->a:Ljava/lang/String;

    :cond_3e
    invoke-static {v5, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_48

    :cond_44
    const/4 p2, 0x2

    invoke-interface {p1, p0, p2, v5}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_48
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_52

    iget-byte p2, v2, Lg46;->b:B

    if-eq v4, p2, :cond_56

    :cond_52
    const/4 p2, 0x3

    invoke-interface {p1, p2, v4, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_56
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_60

    iget p2, v2, Lg46;->c:I

    if-eq v3, p2, :cond_64

    :cond_60
    const/4 p2, 0x4

    invoke-interface {p1, p2, v3, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_64
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
