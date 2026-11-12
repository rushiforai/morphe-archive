.class public final Lrcp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lrcp;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lrcp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lrcp;->a:Lrcp;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.analytics.AdRequestEvent"

    const/16 v3, 0x9

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "reqId"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "httpCode"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "duration"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "connectionType"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "vpn"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "placementId"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "adTypes"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "crIds"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "reason"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lrcp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 9

    sget-object p0, Lbdp;->p:[Lkotlinx/serialization/KSerializer;

    sget-object v0, Lrn3;->a:Lrn3;

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    const/4 v1, 0x6

    aget-object v2, p0, v1

    const/4 v3, 0x7

    aget-object p0, p0, v3

    const/16 v4, 0x9

    new-array v4, v4, [Lkotlinx/serialization/KSerializer;

    sget-object v5, Lxhk;->a:Lxhk;

    const/4 v6, 0x0

    aput-object v5, v4, v6

    sget-object v6, Lecb;->a:Lecb;

    const/4 v7, 0x1

    aput-object v6, v4, v7

    const/4 v7, 0x2

    aput-object v6, v4, v7

    const/4 v7, 0x3

    aput-object v5, v4, v7

    const/4 v7, 0x4

    aput-object v0, v4, v7

    const/4 v0, 0x5

    aput-object v5, v4, v0

    aput-object v2, v4, v1

    aput-object p0, v4, v3

    const/16 p0, 0x8

    aput-object v6, v4, p0

    return-object v4
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 20

    sget-object v0, Lrcp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Lbdp;->p:[Lkotlinx/serialization/KSerializer;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move v6, v3

    move v8, v4

    move v10, v8

    move v11, v10

    move/from16 v17, v11

    move-object v9, v5

    move-object v12, v9

    move-object v13, v12

    move-object v14, v13

    move-object v15, v14

    move-object/from16 v16, v15

    :goto_1a
    if-eqz v6, :cond_81

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v7

    packed-switch v7, :pswitch_data_8a

    invoke-static {v7}, Lt3p;->d(I)V

    return-object v5

    :pswitch_27
    const/16 v7, 0x8

    invoke-interface {v1, v0, v7}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v17

    or-int/lit16 v8, v8, 0x100

    goto :goto_1a

    :pswitch_30
    const/4 v7, 0x7

    aget-object v5, v2, v7

    invoke-interface {v1, v0, v7, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v16, v5

    check-cast v16, Ljava/util/List;

    or-int/lit16 v8, v8, 0x80

    :goto_3d
    const/4 v5, 0x0

    goto :goto_1a

    :pswitch_3f
    const/4 v5, 0x6

    aget-object v7, v2, v5

    invoke-interface {v1, v0, v5, v7}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Ljava/util/List;

    or-int/lit8 v8, v8, 0x40

    goto :goto_3d

    :pswitch_4c
    const/4 v5, 0x5

    invoke-interface {v1, v0, v5}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v14

    or-int/lit8 v8, v8, 0x20

    goto :goto_3d

    :pswitch_54
    sget-object v5, Lrn3;->a:Lrn3;

    const/4 v7, 0x4

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Ljava/lang/Boolean;

    or-int/lit8 v8, v8, 0x10

    goto :goto_3d

    :pswitch_61
    const/4 v5, 0x3

    invoke-interface {v1, v0, v5}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v12

    or-int/lit8 v8, v8, 0x8

    goto :goto_3d

    :pswitch_69
    const/4 v5, 0x2

    invoke-interface {v1, v0, v5}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v11

    or-int/lit8 v8, v8, 0x4

    goto :goto_3d

    :pswitch_71
    invoke-interface {v1, v0, v3}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v10

    or-int/lit8 v8, v8, 0x2

    goto :goto_3d

    :pswitch_78
    invoke-interface {v1, v0, v4}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v9

    or-int/lit8 v8, v8, 0x1

    goto :goto_3d

    :pswitch_7f
    move v6, v4

    goto :goto_1a

    :cond_81
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v7, Lbdp;

    invoke-direct/range {v7 .. v17}, Lbdp;-><init>(ILjava/lang/String;IILjava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;Ljava/util/List;Ljava/util/List;I)V

    return-object v7

    :pswitch_data_8a
    .packed-switch -0x1
        :pswitch_7f
        :pswitch_78
        :pswitch_71
        :pswitch_69
        :pswitch_61
        :pswitch_54
        :pswitch_4c
        :pswitch_3f
        :pswitch_30
        :pswitch_27
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lrcp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 7

    check-cast p2, Lbdp;

    sget-object p0, Lrcp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lbdp;->p:[Lkotlinx/serialization/KSerializer;

    iget-object v1, p2, Lbdp;->g:Ljava/lang/String;

    iget-object v2, p2, Lbdp;->k:Ljava/lang/Boolean;

    const/4 v3, 0x0

    invoke-interface {p1, p0, v3, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget v1, p2, Lbdp;->h:I

    const/4 v3, 0x1

    invoke-interface {p1, v3, v1, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v1, p2, Lbdp;->i:I

    const/4 v3, 0x2

    invoke-interface {p1, v3, v1, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget-object v1, p2, Lbdp;->j:Ljava/lang/String;

    const/4 v3, 0x3

    invoke-interface {p1, p0, v3, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_2c

    if-eqz v2, :cond_32

    :cond_2c
    sget-object v1, Lrn3;->a:Lrn3;

    const/4 v3, 0x4

    invoke-interface {p1, p0, v3, v1, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_32
    iget-object v1, p2, Lbdp;->l:Ljava/lang/String;

    const/4 v2, 0x5

    invoke-interface {p1, p0, v2, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    const/4 v1, 0x6

    aget-object v2, v0, v1

    iget-object v3, p2, Lbdp;->m:Ljava/util/List;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    const/4 v1, 0x7

    aget-object v0, v0, v1

    iget-object v2, p2, Lbdp;->n:Ljava/util/List;

    invoke-interface {p1, p0, v1, v0, v2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    iget p2, p2, Lbdp;->o:I

    const/16 v0, 0x8

    invoke-interface {p1, v0, p2, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
