.class public final Lu3p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lu3p;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lu3p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lu3p;->a:Lu3p;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.PostBody"

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

    const-string v0, "source"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lu3p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 3

    const/4 p0, 0x6

    new-array p0, p0, [Lkotlinx/serialization/KSerializer;

    sget-object v0, Lxhk;->a:Lxhk;

    const/4 v1, 0x0

    aput-object v0, p0, v1

    const/4 v1, 0x1

    aput-object v0, p0, v1

    sget-object v0, Lmto;->a:Lmto;

    const/4 v1, 0x2

    aput-object v0, p0, v1

    sget-object v0, Lpyo;->a:Lpyo;

    const/4 v1, 0x3

    aput-object v0, p0, v1

    sget-object v0, Ltwo;->a:Ltwo;

    const/4 v1, 0x4

    aput-object v0, p0, v1

    sget-object v0, Ljwo;->a:Ljwo;

    const/4 v1, 0x5

    aput-object v0, p0, v1

    return-object p0
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 14

    sget-object p0, Lu3p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    move v3, v0

    move v5, v1

    move-object v6, v2

    move-object v7, v6

    move-object v8, v7

    move-object v9, v8

    move-object v10, v9

    move-object v11, v10

    :goto_11
    if-eqz v3, :cond_62

    invoke-interface {p1, p0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v4

    packed-switch v4, :pswitch_data_6c

    invoke-static {v4}, Lt3p;->d(I)V

    return-object v2

    :pswitch_1e
    sget-object v4, Ljwo;->a:Ljwo;

    const/4 v11, 0x5

    invoke-interface {p1, p0, v11, v4}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Lmwo;

    or-int/lit8 v5, v5, 0x20

    goto :goto_11

    :pswitch_2b
    sget-object v4, Ltwo;->a:Ltwo;

    const/4 v10, 0x4

    invoke-interface {p1, p0, v10, v4}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Lwwo;

    or-int/lit8 v5, v5, 0x10

    goto :goto_11

    :pswitch_38
    sget-object v4, Lpyo;->a:Lpyo;

    const/4 v9, 0x3

    invoke-interface {p1, p0, v9, v4}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Ljzo;

    or-int/lit8 v5, v5, 0x8

    goto :goto_11

    :pswitch_45
    sget-object v4, Lmto;->a:Lmto;

    const/4 v8, 0x2

    invoke-interface {p1, p0, v8, v4}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Lhuo;

    or-int/lit8 v5, v5, 0x4

    goto :goto_11

    :pswitch_52
    invoke-interface {p1, p0, v0}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v7

    or-int/lit8 v5, v5, 0x2

    goto :goto_11

    :pswitch_59
    invoke-interface {p1, p0, v1}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v6

    or-int/lit8 v5, v5, 0x1

    goto :goto_11

    :pswitch_60
    move v3, v1

    goto :goto_11

    :cond_62
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v4, Lp5p;

    invoke-direct/range {v4 .. v11}, Lp5p;-><init>(ILjava/lang/String;Ljava/lang/String;Lhuo;Ljzo;Lwwo;Lmwo;)V

    return-object v4

    nop

    :pswitch_data_6c
    .packed-switch -0x1
        :pswitch_60
        :pswitch_59
        :pswitch_52
        :pswitch_45
        :pswitch_38
        :pswitch_2b
        :pswitch_1e
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lu3p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 6

    check-cast p2, Lp5p;

    sget-object p0, Lu3p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_18

    iget-object v0, p2, Lp5p;->a:Ljava/lang/String;

    const-string v1, "2.14.0"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    :cond_18
    iget-object v0, p2, Lp5p;->a:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-interface {p1, p0, v1, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_1e
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_30

    iget-object v0, p2, Lp5p;->b:Ljava/lang/String;

    invoke-static {}, Lfcp;->f()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_36

    :cond_30
    iget-object v0, p2, Lp5p;->b:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, p0, v1, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_36
    sget-object v0, Lmto;->a:Lmto;

    iget-object v1, p2, Lp5p;->c:Lhuo;

    const/4 v2, 0x2

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v0, Lpyo;->a:Lpyo;

    iget-object v1, p2, Lp5p;->d:Ljzo;

    const/4 v2, 0x3

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v0, Ltwo;->a:Ltwo;

    iget-object v1, p2, Lp5p;->e:Lwwo;

    const/4 v2, 0x4

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v0, Ljwo;->a:Ljwo;

    iget-object p2, p2, Lp5p;->f:Lmwo;

    const/4 v1, 0x5

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
