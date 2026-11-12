.class public final Loyo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Loyo;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Loyo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Loyo;->a:Loyo;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.analytics.AdClickCoordinateEvent"

    const/4 v3, 0x6

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "reqId"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "placementId"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "crId"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "adFormat"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "adType"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "clickCoord"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Loyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 7

    sget-object p0, Lizo;->m:[Lkotlinx/serialization/KSerializer;

    const/4 v0, 0x3

    aget-object v1, p0, v0

    const/4 v2, 0x4

    aget-object p0, p0, v2

    const/4 v3, 0x6

    new-array v3, v3, [Lkotlinx/serialization/KSerializer;

    sget-object v4, Lxhk;->a:Lxhk;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const/4 v5, 0x2

    aput-object v4, v3, v5

    aput-object v1, v3, v0

    aput-object p0, v3, v2

    sget-object p0, Lrjp;->a:Lrjp;

    const/4 v0, 0x5

    aput-object p0, v3, v0

    return-object v3
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 15

    sget-object p0, Loyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object p1

    sget-object v0, Lizo;->m:[Lkotlinx/serialization/KSerializer;

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
    if-eqz v4, :cond_5f

    invoke-interface {p1, p0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v5

    packed-switch v5, :pswitch_data_68

    invoke-static {v5}, Lt3p;->d(I)V

    return-object v3

    :pswitch_20
    sget-object v5, Lrjp;->a:Lrjp;

    const/4 v12, 0x5

    invoke-interface {p1, p0, v12, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Lwjp;

    or-int/lit8 v6, v6, 0x20

    goto :goto_13

    :pswitch_2d
    const/4 v5, 0x4

    aget-object v11, v0, v5

    invoke-interface {p1, p0, v5, v11}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Lfuo;

    or-int/lit8 v6, v6, 0x10

    goto :goto_13

    :pswitch_3a
    const/4 v5, 0x3

    aget-object v10, v0, v5

    invoke-interface {p1, p0, v5, v10}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Lsm;

    or-int/lit8 v6, v6, 0x8

    goto :goto_13

    :pswitch_47
    const/4 v5, 0x2

    invoke-interface {p1, p0, v5}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v9

    or-int/lit8 v6, v6, 0x4

    goto :goto_13

    :pswitch_4f
    invoke-interface {p1, p0, v1}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v8

    or-int/lit8 v6, v6, 0x2

    goto :goto_13

    :pswitch_56
    invoke-interface {p1, p0, v2}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v7

    or-int/lit8 v6, v6, 0x1

    goto :goto_13

    :pswitch_5d
    move v4, v2

    goto :goto_13

    :cond_5f
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v5, Lizo;

    invoke-direct/range {v5 .. v12}, Lizo;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lsm;Lfuo;Lwjp;)V

    return-object v5

    :pswitch_data_68
    .packed-switch -0x1
        :pswitch_5d
        :pswitch_56
        :pswitch_4f
        :pswitch_47
        :pswitch_3a
        :pswitch_2d
        :pswitch_20
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Loyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 7

    check-cast p2, Lizo;

    sget-object p0, Loyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lizo;->m:[Lkotlinx/serialization/KSerializer;

    iget-object v1, p2, Lizo;->g:Ljava/lang/String;

    const/4 v2, 0x0

    invoke-interface {p1, p0, v2, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v1, p2, Lizo;->h:Ljava/lang/String;

    const/4 v2, 0x1

    invoke-interface {p1, p0, v2, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v1, p2, Lizo;->i:Ljava/lang/String;

    const/4 v2, 0x2

    invoke-interface {p1, p0, v2, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    const/4 v1, 0x3

    aget-object v2, v0, v1

    iget-object v3, p2, Lizo;->j:Lsm;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    const/4 v1, 0x4

    aget-object v0, v0, v1

    iget-object v2, p2, Lizo;->k:Lfuo;

    invoke-interface {p1, p0, v1, v0, v2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v0, Lrjp;->a:Lrjp;

    iget-object p2, p2, Lizo;->l:Lwjp;

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
