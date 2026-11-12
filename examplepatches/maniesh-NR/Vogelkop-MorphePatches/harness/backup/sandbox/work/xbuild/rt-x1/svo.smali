.class public final Lsvo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lsvo;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lsvo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lsvo;->a:Lsvo;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.analytics.AdBpisEvent"

    const/16 v3, 0x9

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "reqId"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "placementId"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "crId"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "adType"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "s"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "dl"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "d"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "hl"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "b"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lsvo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 11

    sget-object p0, Lqxo;->q:[Lkotlinx/serialization/KSerializer;

    sget-object v0, Lxhk;->a:Lxhk;

    const/4 v1, 0x3

    aget-object v2, p0, v1

    sget-object v3, Lecb;->a:Lecb;

    invoke-static {v3}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v3

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v4

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v5

    const/4 v6, 0x7

    aget-object p0, p0, v6

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v7

    const/16 v8, 0x9

    new-array v8, v8, [Lkotlinx/serialization/KSerializer;

    const/4 v9, 0x0

    aput-object v0, v8, v9

    const/4 v9, 0x1

    aput-object v0, v8, v9

    const/4 v9, 0x2

    aput-object v0, v8, v9

    aput-object v2, v8, v1

    const/4 v0, 0x4

    aput-object v3, v8, v0

    const/4 v0, 0x5

    aput-object v4, v8, v0

    const/4 v0, 0x6

    aput-object v5, v8, v0

    aput-object p0, v8, v6

    const/16 p0, 0x8

    aput-object v7, v8, p0

    return-object v8
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 20

    sget-object v0, Lsvo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Lqxo;->q:[Lkotlinx/serialization/KSerializer;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move v6, v3

    move v8, v4

    move-object v9, v5

    move-object v10, v9

    move-object v11, v10

    move-object v12, v11

    move-object v13, v12

    move-object v14, v13

    move-object v15, v14

    move-object/from16 v16, v15

    move-object/from16 v17, v16

    :goto_1a
    if-eqz v6, :cond_91

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v7

    packed-switch v7, :pswitch_data_9a

    invoke-static {v7}, Lt3p;->d(I)V

    return-object v5

    :pswitch_27
    sget-object v7, Lxhk;->a:Lxhk;

    const/16 v5, 0x8

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v17, v5

    check-cast v17, Ljava/lang/String;

    or-int/lit16 v8, v8, 0x100

    :goto_35
    const/4 v5, 0x0

    goto :goto_1a

    :pswitch_37
    const/4 v5, 0x7

    aget-object v7, v2, v5

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v16, v5

    check-cast v16, Ljava/util/List;

    or-int/lit16 v8, v8, 0x80

    goto :goto_35

    :pswitch_45
    sget-object v5, Lxhk;->a:Lxhk;

    const/4 v7, 0x6

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Ljava/lang/String;

    or-int/lit8 v8, v8, 0x40

    goto :goto_35

    :pswitch_52
    sget-object v5, Lxhk;->a:Lxhk;

    const/4 v7, 0x5

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Ljava/lang/String;

    or-int/lit8 v8, v8, 0x20

    goto :goto_35

    :pswitch_5f
    sget-object v5, Lecb;->a:Lecb;

    const/4 v7, 0x4

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Ljava/lang/Integer;

    or-int/lit8 v8, v8, 0x10

    goto :goto_35

    :pswitch_6c
    const/4 v5, 0x3

    aget-object v7, v2, v5

    invoke-interface {v1, v0, v5, v7}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Lfuo;

    or-int/lit8 v8, v8, 0x8

    goto :goto_35

    :pswitch_79
    const/4 v5, 0x2

    invoke-interface {v1, v0, v5}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v11

    or-int/lit8 v8, v8, 0x4

    goto :goto_35

    :pswitch_81
    invoke-interface {v1, v0, v3}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v10

    or-int/lit8 v8, v8, 0x2

    goto :goto_35

    :pswitch_88
    invoke-interface {v1, v0, v4}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v9

    or-int/lit8 v8, v8, 0x1

    goto :goto_35

    :pswitch_8f
    move v6, v4

    goto :goto_1a

    :cond_91
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v7, Lqxo;

    invoke-direct/range {v7 .. v17}, Lqxo;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;Ljava/lang/String;)V

    return-object v7

    :pswitch_data_9a
    .packed-switch -0x1
        :pswitch_8f
        :pswitch_88
        :pswitch_81
        :pswitch_79
        :pswitch_6c
        :pswitch_5f
        :pswitch_52
        :pswitch_45
        :pswitch_37
        :pswitch_27
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lsvo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 12

    check-cast p2, Lqxo;

    sget-object p0, Lsvo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lqxo;->q:[Lkotlinx/serialization/KSerializer;

    iget-object v1, p2, Lqxo;->g:Ljava/lang/String;

    iget-object v2, p2, Lqxo;->p:Ljava/lang/String;

    iget-object v3, p2, Lqxo;->o:Ljava/util/List;

    iget-object v4, p2, Lqxo;->n:Ljava/lang/String;

    iget-object v5, p2, Lqxo;->m:Ljava/lang/String;

    iget-object v6, p2, Lqxo;->l:Ljava/lang/Integer;

    const/4 v7, 0x0

    invoke-interface {p1, p0, v7, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v1, p2, Lqxo;->h:Ljava/lang/String;

    const/4 v7, 0x1

    invoke-interface {p1, p0, v7, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v1, p2, Lqxo;->i:Ljava/lang/String;

    const/4 v7, 0x2

    invoke-interface {p1, p0, v7, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    const/4 v1, 0x3

    aget-object v7, v0, v1

    iget-object v8, p2, Lqxo;->j:Lfuo;

    invoke-interface {p1, p0, v1, v7, v8}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_36

    if-eqz v6, :cond_3c

    :cond_36
    sget-object v1, Lecb;->a:Lecb;

    const/4 v7, 0x4

    invoke-interface {p1, p0, v7, v1, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_3c
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_44

    if-eqz v5, :cond_4a

    :cond_44
    sget-object v1, Lxhk;->a:Lxhk;

    const/4 v6, 0x5

    invoke-interface {p1, p0, v6, v1, v5}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_4a
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_52

    if-eqz v4, :cond_58

    :cond_52
    sget-object v1, Lxhk;->a:Lxhk;

    const/4 v5, 0x6

    invoke-interface {p1, p0, v5, v1, v4}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_58
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_60

    if-eqz v3, :cond_66

    :cond_60
    const/4 v1, 0x7

    aget-object v0, v0, v1

    invoke-interface {p1, p0, v1, v0, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_66
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_7e

    iget-object p2, p2, Lqxo;->k:Ljava/lang/String;

    if-eqz p2, :cond_77

    const/16 v0, 0xff

    invoke-static {v0, p2}, Lpik;->D(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p2

    goto :goto_78

    :cond_77
    const/4 p2, 0x0

    :goto_78
    invoke-static {v2, p2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_85

    :cond_7e
    sget-object p2, Lxhk;->a:Lxhk;

    const/16 v0, 0x8

    invoke-interface {p1, p0, v0, p2, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_85
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
