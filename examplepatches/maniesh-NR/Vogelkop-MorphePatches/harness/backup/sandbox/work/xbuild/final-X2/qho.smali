.class public final Lqho;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lqho;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lqho;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lqho;->a:Lqho;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.data.AdData.BidExt"

    const/16 v3, 0xd

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "mtype"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "deeplink"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "fallback"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "omid"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "templateconfig"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "adload"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "advisible"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "adviewable"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "clicktrackers"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "privacy"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "adchoice"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "rwdd"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "refreshinterval"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lqho;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 18

    sget-object v0, Lsho;->n:[Lkotlinx/serialization/KSerializer;

    sget-object v1, Lecb;->a:Lecb;

    sget-object v2, Lxhk;->a:Lxhk;

    sget-object v3, Lyho;->a:Lyho;

    invoke-static {v3}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v3

    sget-object v4, Lgio;->a:Lgio;

    invoke-static {v4}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v4

    const/4 v5, 0x5

    aget-object v6, v0, v5

    invoke-static {v6}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v6

    const/4 v7, 0x6

    aget-object v8, v0, v7

    invoke-static {v8}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v8

    const/4 v9, 0x7

    aget-object v10, v0, v9

    invoke-static {v10}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v10

    const/16 v11, 0x8

    aget-object v0, v0, v11

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    invoke-static {v2}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v12

    invoke-static {v2}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v13

    sget-object v14, Lcio;->a:Lcio;

    invoke-static {v14}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v14

    invoke-static {v1}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v15

    move/from16 p0, v5

    const/16 v5, 0xd

    new-array v5, v5, [Lkotlinx/serialization/KSerializer;

    const/16 v16, 0x0

    aput-object v1, v5, v16

    const/4 v1, 0x1

    aput-object v2, v5, v1

    const/4 v1, 0x2

    aput-object v2, v5, v1

    const/4 v1, 0x3

    aput-object v3, v5, v1

    const/4 v1, 0x4

    aput-object v4, v5, v1

    aput-object v6, v5, p0

    aput-object v8, v5, v7

    aput-object v10, v5, v9

    aput-object v0, v5, v11

    const/16 v0, 0x9

    aput-object v12, v5, v0

    const/16 v0, 0xa

    aput-object v13, v5, v0

    const/16 v0, 0xb

    aput-object v14, v5, v0

    const/16 v0, 0xc

    aput-object v15, v5, v0

    return-object v5
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 24

    sget-object v0, Lqho;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Lsho;->n:[Lkotlinx/serialization/KSerializer;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move v6, v3

    move v8, v4

    move v9, v8

    move-object v10, v5

    move-object v11, v10

    move-object v12, v11

    move-object v13, v12

    move-object v14, v13

    move-object v15, v14

    move-object/from16 v16, v15

    move-object/from16 v17, v16

    move-object/from16 v18, v17

    move-object/from16 v19, v18

    move-object/from16 v20, v19

    move-object/from16 v21, v20

    :goto_22
    if-eqz v6, :cond_d9

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v7

    packed-switch v7, :pswitch_data_e2

    invoke-static {v7}, Lt3p;->d(I)V

    return-object v5

    :pswitch_2f
    sget-object v7, Lecb;->a:Lecb;

    const/16 v5, 0xc

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v21, v5

    check-cast v21, Ljava/lang/Integer;

    or-int/lit16 v8, v8, 0x1000

    :goto_3d
    const/4 v5, 0x0

    goto :goto_22

    :pswitch_3f
    sget-object v5, Lcio;->a:Lcio;

    const/16 v7, 0xb

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v20, v5

    check-cast v20, Leio;

    or-int/lit16 v8, v8, 0x800

    goto :goto_3d

    :pswitch_4e
    sget-object v5, Lxhk;->a:Lxhk;

    const/16 v7, 0xa

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v19, v5

    check-cast v19, Ljava/lang/String;

    or-int/lit16 v8, v8, 0x400

    goto :goto_3d

    :pswitch_5d
    sget-object v5, Lxhk;->a:Lxhk;

    const/16 v7, 0x9

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v18, v5

    check-cast v18, Ljava/lang/String;

    or-int/lit16 v8, v8, 0x200

    goto :goto_3d

    :pswitch_6c
    const/16 v5, 0x8

    aget-object v7, v2, v5

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v17, v5

    check-cast v17, Ljava/util/List;

    or-int/lit16 v8, v8, 0x100

    goto :goto_3d

    :pswitch_7b
    const/4 v5, 0x7

    aget-object v7, v2, v5

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v16, v5

    check-cast v16, Ljava/util/List;

    or-int/lit16 v8, v8, 0x80

    goto :goto_3d

    :pswitch_89
    const/4 v5, 0x6

    aget-object v7, v2, v5

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Ljava/util/List;

    or-int/lit8 v8, v8, 0x40

    goto :goto_3d

    :pswitch_96
    const/4 v5, 0x5

    aget-object v7, v2, v5

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Ljava/util/List;

    or-int/lit8 v8, v8, 0x20

    goto :goto_3d

    :pswitch_a3
    sget-object v5, Lgio;->a:Lgio;

    const/4 v7, 0x4

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Liio;

    or-int/lit8 v8, v8, 0x10

    goto :goto_3d

    :pswitch_b0
    sget-object v5, Lyho;->a:Lyho;

    const/4 v7, 0x3

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Laio;

    or-int/lit8 v8, v8, 0x8

    goto :goto_3d

    :pswitch_bd
    const/4 v5, 0x2

    invoke-interface {v1, v0, v5}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v11

    or-int/lit8 v8, v8, 0x4

    goto/16 :goto_3d

    :pswitch_c6
    invoke-interface {v1, v0, v3}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v10

    or-int/lit8 v8, v8, 0x2

    goto/16 :goto_3d

    :pswitch_ce
    invoke-interface {v1, v0, v4}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v9

    or-int/lit8 v8, v8, 0x1

    goto/16 :goto_3d

    :pswitch_d6
    move v6, v4

    goto/16 :goto_22

    :cond_d9
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v7, Lsho;

    invoke-direct/range {v7 .. v21}, Lsho;-><init>(IILjava/lang/String;Ljava/lang/String;Laio;Liio;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Leio;Ljava/lang/Integer;)V

    return-object v7

    :pswitch_data_e2
    .packed-switch -0x1
        :pswitch_d6
        :pswitch_ce
        :pswitch_c6
        :pswitch_bd
        :pswitch_b0
        :pswitch_a3
        :pswitch_96
        :pswitch_89
        :pswitch_7b
        :pswitch_6c
        :pswitch_5d
        :pswitch_4e
        :pswitch_3f
        :pswitch_2f
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lqho;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 19

    move-object/from16 v0, p2

    check-cast v0, Lsho;

    sget-object v1, Lqho;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v2, p1

    invoke-interface {v2, v1}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object v2

    sget-object v3, Lsho;->n:[Lkotlinx/serialization/KSerializer;

    iget v4, v0, Lsho;->a:I

    iget-object v5, v0, Lsho;->m:Ljava/lang/Integer;

    iget-object v6, v0, Lsho;->l:Leio;

    iget-object v7, v0, Lsho;->k:Ljava/lang/String;

    iget-object v8, v0, Lsho;->j:Ljava/lang/String;

    iget-object v9, v0, Lsho;->i:Ljava/util/List;

    iget-object v10, v0, Lsho;->h:Ljava/util/List;

    iget-object v11, v0, Lsho;->g:Ljava/util/List;

    iget-object v12, v0, Lsho;->f:Ljava/util/List;

    iget-object v13, v0, Lsho;->e:Liio;

    iget-object v14, v0, Lsho;->d:Laio;

    iget-object v15, v0, Lsho;->c:Ljava/lang/String;

    iget-object v0, v0, Lsho;->b:Ljava/lang/String;

    move-object/from16 p0, v3

    const/4 v3, 0x0

    invoke-interface {v2, v3, v4, v1}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    invoke-interface {v2}, Lph5;->E()Z

    move-result v3

    const-string v4, ""

    if-nez v3, :cond_3c

    invoke-static {v0, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_40

    :cond_3c
    const/4 v3, 0x1

    invoke-interface {v2, v1, v3, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_40
    invoke-interface {v2}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_4c

    invoke-static {v15, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_50

    :cond_4c
    const/4 v0, 0x2

    invoke-interface {v2, v1, v0, v15}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_50
    invoke-interface {v2}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_58

    if-eqz v14, :cond_5e

    :cond_58
    sget-object v0, Lyho;->a:Lyho;

    const/4 v3, 0x3

    invoke-interface {v2, v1, v3, v0, v14}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_5e
    invoke-interface {v2}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_66

    if-eqz v13, :cond_6c

    :cond_66
    sget-object v0, Lgio;->a:Lgio;

    const/4 v3, 0x4

    invoke-interface {v2, v1, v3, v0, v13}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_6c
    invoke-interface {v2}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_74

    if-eqz v12, :cond_7a

    :cond_74
    const/4 v0, 0x5

    aget-object v3, p0, v0

    invoke-interface {v2, v1, v0, v3, v12}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_7a
    invoke-interface {v2}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_82

    if-eqz v11, :cond_88

    :cond_82
    const/4 v0, 0x6

    aget-object v3, p0, v0

    invoke-interface {v2, v1, v0, v3, v11}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_88
    invoke-interface {v2}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_90

    if-eqz v10, :cond_96

    :cond_90
    const/4 v0, 0x7

    aget-object v3, p0, v0

    invoke-interface {v2, v1, v0, v3, v10}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_96
    invoke-interface {v2}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_9e

    if-eqz v9, :cond_a5

    :cond_9e
    const/16 v0, 0x8

    aget-object v3, p0, v0

    invoke-interface {v2, v1, v0, v3, v9}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_a5
    invoke-interface {v2}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_ad

    if-eqz v8, :cond_b4

    :cond_ad
    sget-object v0, Lxhk;->a:Lxhk;

    const/16 v3, 0x9

    invoke-interface {v2, v1, v3, v0, v8}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_b4
    invoke-interface {v2}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_bc

    if-eqz v7, :cond_c3

    :cond_bc
    sget-object v0, Lxhk;->a:Lxhk;

    const/16 v3, 0xa

    invoke-interface {v2, v1, v3, v0, v7}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_c3
    invoke-interface {v2}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_cb

    if-eqz v6, :cond_d2

    :cond_cb
    sget-object v0, Lcio;->a:Lcio;

    const/16 v3, 0xb

    invoke-interface {v2, v1, v3, v0, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_d2
    invoke-interface {v2}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_da

    if-eqz v5, :cond_e1

    :cond_da
    sget-object v0, Lecb;->a:Lecb;

    const/16 v3, 0xc

    invoke-interface {v2, v1, v3, v0, v5}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_e1
    invoke-interface {v2, v1}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
