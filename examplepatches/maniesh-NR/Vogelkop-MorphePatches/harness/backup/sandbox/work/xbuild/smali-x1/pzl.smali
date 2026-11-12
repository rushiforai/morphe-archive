.class public final synthetic Lpzl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lpzl;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lpzl;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lpzl;->a:Lpzl;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.celopay.model.blockchain.Transaction"

    const/4 v3, 0x7

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "net"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "from"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "to"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "money"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "encodedData"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "decodedData"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "nonce"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lpzl;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 4

    sget-object p0, Lyzl;->h:[Ll4c;

    const/4 v0, 0x7

    new-array v0, v0, [Lkotlinx/serialization/KSerializer;

    const/4 v1, 0x0

    aget-object v2, p0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1

    sget-object v1, Lvv;->a:Lvv;

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v2, 0x2

    invoke-static {v1}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    aput-object v1, v0, v2

    const/4 v1, 0x3

    sget-object v2, Lu8e;->a:Lu8e;

    aput-object v2, v0, v1

    const/4 v1, 0x4

    sget-object v2, Lxhk;->a:Lxhk;

    aput-object v2, v0, v1

    const/4 v1, 0x5

    aget-object p0, p0, v1

    invoke-interface {p0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/KSerializer;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    aput-object p0, v0, v1

    sget-object p0, Lne3;->a:Lne3;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    const/4 v1, 0x6

    aput-object p0, v0, v1

    return-object v0
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 16

    sget-object p0, Lpzl;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object p1

    sget-object v0, Lyzl;->h:[Ll4c;

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

    move-object v12, v11

    move-object v13, v12

    :goto_14
    if-eqz v4, :cond_83

    invoke-interface {p1, p0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v5

    packed-switch v5, :pswitch_data_8c

    invoke-static {v5}, Lt3p;->d(I)V

    return-object v3

    :pswitch_21
    const/4 v5, 0x6

    sget-object v13, Lne3;->a:Lne3;

    invoke-interface {p1, p0, v5, v13}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Ljava/math/BigInteger;

    or-int/lit8 v6, v6, 0x40

    goto :goto_14

    :pswitch_2e
    const/4 v5, 0x5

    aget-object v12, v0, v5

    invoke-interface {v12}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lkotlinx/serialization/KSerializer;

    invoke-interface {p1, p0, v5, v12}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Lrzl;

    or-int/lit8 v6, v6, 0x20

    goto :goto_14

    :pswitch_41
    const/4 v5, 0x4

    invoke-interface {p1, p0, v5}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v11

    or-int/lit8 v6, v6, 0x10

    goto :goto_14

    :pswitch_49
    const/4 v5, 0x3

    sget-object v10, Lu8e;->a:Lu8e;

    invoke-interface {p1, p0, v5, v10}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Lw8e;

    or-int/lit8 v6, v6, 0x8

    goto :goto_14

    :pswitch_56
    sget-object v5, Lvv;->a:Lvv;

    const/4 v9, 0x2

    invoke-interface {p1, p0, v9, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Lwv;

    or-int/lit8 v6, v6, 0x4

    goto :goto_14

    :pswitch_63
    sget-object v5, Lvv;->a:Lvv;

    invoke-interface {p1, p0, v1, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v8, v5

    check-cast v8, Lwv;

    or-int/lit8 v6, v6, 0x2

    goto :goto_14

    :pswitch_6f
    aget-object v5, v0, v2

    invoke-interface {v5}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkotlinx/serialization/KSerializer;

    invoke-interface {p1, p0, v2, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v7, v5

    check-cast v7, Lnle;

    or-int/lit8 v6, v6, 0x1

    goto :goto_14

    :pswitch_81
    move v4, v2

    goto :goto_14

    :cond_83
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v5, Lyzl;

    invoke-direct/range {v5 .. v13}, Lyzl;-><init>(ILnle;Lwv;Lwv;Lw8e;Ljava/lang/String;Lrzl;Ljava/math/BigInteger;)V

    return-object v5

    :pswitch_data_8c
    .packed-switch -0x1
        :pswitch_81
        :pswitch_6f
        :pswitch_63
        :pswitch_56
        :pswitch_49
        :pswitch_41
        :pswitch_2e
        :pswitch_21
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lpzl;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 8

    check-cast p2, Lyzl;

    sget-object p0, Lpzl;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lyzl;->h:[Ll4c;

    const/4 v1, 0x0

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    iget-object v3, p2, Lyzl;->a:Lnle;

    iget-object v4, p2, Lyzl;->g:Ljava/math/BigInteger;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v1, Lvv;->a:Lvv;

    iget-object v2, p2, Lyzl;->b:Lwv;

    const/4 v3, 0x1

    invoke-interface {p1, p0, v3, v1, v2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    const/4 v2, 0x2

    iget-object v3, p2, Lyzl;->c:Lwv;

    invoke-interface {p1, p0, v2, v1, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v1, Lu8e;->a:Lu8e;

    iget-object v2, p2, Lyzl;->d:Lw8e;

    const/4 v3, 0x3

    invoke-interface {p1, p0, v3, v1, v2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    const/4 v1, 0x4

    iget-object v2, p2, Lyzl;->e:Ljava/lang/String;

    invoke-interface {p1, p0, v1, v2}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    const/4 v1, 0x5

    aget-object v0, v0, v1

    invoke-interface {v0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    iget-object p2, p2, Lyzl;->f:Lrzl;

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_4c

    if-eqz v4, :cond_52

    :cond_4c
    sget-object p2, Lne3;->a:Lne3;

    const/4 v0, 0x6

    invoke-interface {p1, p0, v0, p2, v4}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_52
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
