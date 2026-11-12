.class public final Lbxo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lbxo;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lbxo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lbxo;->a:Lbxo;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.analytics.PostBody"

    const/4 v3, 0x6

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "sdkVer"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "sdkSession"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "app"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "device"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "user"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "events"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lbxo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 5

    sget-object p0, Lexo;->g:[Lkotlinx/serialization/KSerializer;

    const/4 v0, 0x5

    aget-object p0, p0, v0

    const/4 v1, 0x6

    new-array v1, v1, [Lkotlinx/serialization/KSerializer;

    sget-object v2, Lxhk;->a:Lxhk;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v3, 0x1

    aput-object v2, v1, v3

    sget-object v2, Lmto;->a:Lmto;

    const/4 v3, 0x2

    aput-object v2, v1, v3

    sget-object v2, Lpyo;->a:Lpyo;

    const/4 v3, 0x3

    aput-object v2, v1, v3

    sget-object v2, Ltwo;->a:Ltwo;

    const/4 v3, 0x4

    aput-object v2, v1, v3

    aput-object p0, v1, v0

    return-object v1
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 15

    sget-object p0, Lbxo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object p1

    sget-object v0, Lexo;->g:[Lkotlinx/serialization/KSerializer;

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

    :goto_13
    if-eqz v4, :cond_64

    invoke-interface {p1, p0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v5

    packed-switch v5, :pswitch_data_6e

    invoke-static {v5}, Lt3p;->d(I)V

    return-object v3

    :pswitch_20
    const/4 v5, 0x5

    aget-object v12, v0, v5

    invoke-interface {p1, p0, v5, v12}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Ljava/util/List;

    or-int/lit8 v6, v6, 0x20

    goto :goto_13

    :pswitch_2d
    sget-object v5, Ltwo;->a:Ltwo;

    const/4 v11, 0x4

    invoke-interface {p1, p0, v11, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Lwwo;

    or-int/lit8 v6, v6, 0x10

    goto :goto_13

    :pswitch_3a
    sget-object v5, Lpyo;->a:Lpyo;

    const/4 v10, 0x3

    invoke-interface {p1, p0, v10, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Ljzo;

    or-int/lit8 v6, v6, 0x8

    goto :goto_13

    :pswitch_47
    sget-object v5, Lmto;->a:Lmto;

    const/4 v9, 0x2

    invoke-interface {p1, p0, v9, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Lhuo;

    or-int/lit8 v6, v6, 0x4

    goto :goto_13

    :pswitch_54
    invoke-interface {p1, p0, v1}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v8

    or-int/lit8 v6, v6, 0x2

    goto :goto_13

    :pswitch_5b
    invoke-interface {p1, p0, v2}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v7

    or-int/lit8 v6, v6, 0x1

    goto :goto_13

    :pswitch_62
    move v4, v2

    goto :goto_13

    :cond_64
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v5, Lexo;

    invoke-direct/range {v5 .. v12}, Lexo;-><init>(ILjava/lang/String;Ljava/lang/String;Lhuo;Ljzo;Lwwo;Ljava/util/List;)V

    return-object v5

    nop

    :pswitch_data_6e
    .packed-switch -0x1
        :pswitch_62
        :pswitch_5b
        :pswitch_54
        :pswitch_47
        :pswitch_3a
        :pswitch_2d
        :pswitch_20
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lbxo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 7

    check-cast p2, Lexo;

    sget-object p0, Lbxo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lexo;->g:[Lkotlinx/serialization/KSerializer;

    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_1a

    iget-object v1, p2, Lexo;->a:Ljava/lang/String;

    const-string v2, "2.14.0"

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_20

    :cond_1a
    iget-object v1, p2, Lexo;->a:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-interface {p1, p0, v2, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_20
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_32

    iget-object v1, p2, Lexo;->b:Ljava/lang/String;

    invoke-static {}, Lfcp;->f()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    :cond_32
    iget-object v1, p2, Lexo;->b:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-interface {p1, p0, v2, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_38
    sget-object v1, Lmto;->a:Lmto;

    iget-object v2, p2, Lexo;->c:Lhuo;

    const/4 v3, 0x2

    invoke-interface {p1, p0, v3, v1, v2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v1, Lpyo;->a:Lpyo;

    iget-object v2, p2, Lexo;->d:Ljzo;

    const/4 v3, 0x3

    invoke-interface {p1, p0, v3, v1, v2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v1, Ltwo;->a:Ltwo;

    iget-object v2, p2, Lexo;->e:Lwwo;

    const/4 v3, 0x4

    invoke-interface {p1, p0, v3, v1, v2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    const/4 v1, 0x5

    aget-object v0, v0, v1

    iget-object p2, p2, Lexo;->f:Ljava/util/List;

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
