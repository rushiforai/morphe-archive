.class public final Lmho;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lmho;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lmho;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lmho;->a:Lmho;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.data.AdData.BidData"

    const/16 v3, 0x10

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "id"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "impid"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "adm"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "exp"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "cid"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "adid"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "crid"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "w"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "h"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "adomain"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "cat"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ext"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "nurl"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "lurl"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "bundle"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "price"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lmho;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 16

    sget-object p0, Loho;->q:[Lkotlinx/serialization/KSerializer;

    sget-object v0, Lxhk;->a:Lxhk;

    sget-object v1, Lecb;->a:Lecb;

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v3

    invoke-static {v1}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v4

    invoke-static {v1}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v5

    const/16 v6, 0x9

    aget-object v7, p0, v6

    invoke-static {v7}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v7

    const/16 v8, 0xa

    aget-object p0, p0, v8

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v9

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v10

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v11

    sget-object v12, Loe7;->a:Loe7;

    invoke-static {v12}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v12

    const/16 v13, 0x10

    new-array v13, v13, [Lkotlinx/serialization/KSerializer;

    const/4 v14, 0x0

    aput-object v0, v13, v14

    const/4 v14, 0x1

    aput-object v0, v13, v14

    const/4 v14, 0x2

    aput-object v0, v13, v14

    const/4 v14, 0x3

    aput-object v1, v13, v14

    const/4 v1, 0x4

    aput-object v0, v13, v1

    const/4 v0, 0x5

    aput-object v2, v13, v0

    const/4 v0, 0x6

    aput-object v3, v13, v0

    const/4 v0, 0x7

    aput-object v4, v13, v0

    const/16 v0, 0x8

    aput-object v5, v13, v0

    aput-object v7, v13, v6

    aput-object p0, v13, v8

    sget-object p0, Lqho;->a:Lqho;

    const/16 v0, 0xb

    aput-object p0, v13, v0

    const/16 p0, 0xc

    aput-object v9, v13, p0

    const/16 p0, 0xd

    aput-object v10, v13, p0

    const/16 p0, 0xe

    aput-object v11, v13, p0

    const/16 p0, 0xf

    aput-object v12, v13, p0

    return-object v13
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 27

    sget-object v0, Lmho;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Loho;->q:[Lkotlinx/serialization/KSerializer;

    const/4 v3, 0x1

    const/4 v5, 0x0

    move v6, v3

    move-object v8, v5

    move-object v9, v8

    move-object v10, v9

    move-object v12, v10

    move-object v13, v12

    move-object v14, v13

    move-object v15, v14

    move-object/from16 v16, v15

    move-object/from16 v17, v16

    move-object/from16 v18, v17

    move-object/from16 v19, v18

    move-object/from16 v20, v19

    move-object/from16 v21, v20

    move-object/from16 v22, v21

    move-object/from16 v23, v22

    const/4 v7, 0x0

    const/4 v11, 0x0

    :goto_26
    if-eqz v6, :cond_107

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v24

    packed-switch v24, :pswitch_data_110

    invoke-static/range {v24 .. v24}, Lt3p;->d(I)V

    return-object v5

    :pswitch_33
    sget-object v5, Loe7;->a:Loe7;

    const/16 v4, 0xf

    invoke-interface {v1, v0, v4, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v23, v4

    check-cast v23, Ljava/lang/Double;

    const v4, 0x8000

    or-int/2addr v7, v4

    :goto_43
    const/4 v5, 0x0

    goto :goto_26

    :pswitch_45
    sget-object v4, Lxhk;->a:Lxhk;

    const/16 v5, 0xe

    invoke-interface {v1, v0, v5, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v22, v4

    check-cast v22, Ljava/lang/String;

    or-int/lit16 v7, v7, 0x4000

    goto :goto_43

    :pswitch_54
    sget-object v4, Lxhk;->a:Lxhk;

    const/16 v5, 0xd

    invoke-interface {v1, v0, v5, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v21, v4

    check-cast v21, Ljava/lang/String;

    or-int/lit16 v7, v7, 0x2000

    goto :goto_43

    :pswitch_63
    sget-object v4, Lxhk;->a:Lxhk;

    const/16 v5, 0xc

    invoke-interface {v1, v0, v5, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v20, v4

    check-cast v20, Ljava/lang/String;

    or-int/lit16 v7, v7, 0x1000

    goto :goto_43

    :pswitch_72
    sget-object v4, Lqho;->a:Lqho;

    const/16 v5, 0xb

    invoke-interface {v1, v0, v5, v4}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v19, v4

    check-cast v19, Lsho;

    or-int/lit16 v7, v7, 0x800

    goto :goto_43

    :pswitch_81
    const/16 v4, 0xa

    aget-object v5, v2, v4

    invoke-interface {v1, v0, v4, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v18, v4

    check-cast v18, Ljava/util/List;

    or-int/lit16 v7, v7, 0x400

    goto :goto_43

    :pswitch_90
    const/16 v4, 0x9

    aget-object v5, v2, v4

    invoke-interface {v1, v0, v4, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v17, v4

    check-cast v17, Ljava/util/List;

    or-int/lit16 v7, v7, 0x200

    goto :goto_43

    :pswitch_9f
    sget-object v4, Lecb;->a:Lecb;

    const/16 v5, 0x8

    invoke-interface {v1, v0, v5, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v16, v4

    check-cast v16, Ljava/lang/Integer;

    or-int/lit16 v7, v7, 0x100

    goto :goto_43

    :pswitch_ae
    sget-object v4, Lecb;->a:Lecb;

    const/4 v5, 0x7

    invoke-interface {v1, v0, v5, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Ljava/lang/Integer;

    or-int/lit16 v7, v7, 0x80

    goto :goto_43

    :pswitch_bb
    sget-object v4, Lxhk;->a:Lxhk;

    const/4 v5, 0x6

    invoke-interface {v1, v0, v5, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v14, v4

    check-cast v14, Ljava/lang/String;

    or-int/lit8 v7, v7, 0x40

    goto/16 :goto_43

    :pswitch_c9
    sget-object v4, Lxhk;->a:Lxhk;

    const/4 v5, 0x5

    invoke-interface {v1, v0, v5, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Ljava/lang/String;

    or-int/lit8 v7, v7, 0x20

    goto/16 :goto_43

    :pswitch_d7
    const/4 v4, 0x4

    invoke-interface {v1, v0, v4}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v12

    or-int/lit8 v7, v7, 0x10

    goto/16 :goto_43

    :pswitch_e0
    const/4 v4, 0x3

    invoke-interface {v1, v0, v4}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v11

    or-int/lit8 v7, v7, 0x8

    goto/16 :goto_43

    :pswitch_e9
    const/4 v4, 0x2

    invoke-interface {v1, v0, v4}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v10

    or-int/lit8 v7, v7, 0x4

    goto/16 :goto_43

    :pswitch_f2
    invoke-interface {v1, v0, v3}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v9

    or-int/lit8 v7, v7, 0x2

    goto/16 :goto_43

    :pswitch_fa
    const/4 v4, 0x0

    invoke-interface {v1, v0, v4}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v8

    or-int/lit8 v7, v7, 0x1

    goto/16 :goto_43

    :pswitch_103
    const/4 v4, 0x0

    move v6, v4

    goto/16 :goto_26

    :cond_107
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v6, Loho;

    invoke-direct/range {v6 .. v23}, Loho;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/util/List;Ljava/util/List;Lsho;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Double;)V

    return-object v6

    :pswitch_data_110
    .packed-switch -0x1
        :pswitch_103
        :pswitch_fa
        :pswitch_f2
        :pswitch_e9
        :pswitch_e0
        :pswitch_d7
        :pswitch_c9
        :pswitch_bb
        :pswitch_ae
        :pswitch_9f
        :pswitch_90
        :pswitch_81
        :pswitch_72
        :pswitch_63
        :pswitch_54
        :pswitch_45
        :pswitch_33
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lmho;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 16

    check-cast p2, Loho;

    sget-object p0, Lmho;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Loho;->q:[Lkotlinx/serialization/KSerializer;

    iget-object v1, p2, Loho;->a:Ljava/lang/String;

    iget-object v2, p2, Loho;->p:Ljava/lang/Double;

    iget-object v3, p2, Loho;->o:Ljava/lang/String;

    iget-object v4, p2, Loho;->n:Ljava/lang/String;

    iget-object v5, p2, Loho;->m:Ljava/lang/String;

    iget-object v6, p2, Loho;->k:Ljava/util/List;

    iget-object v7, p2, Loho;->j:Ljava/util/List;

    iget-object v8, p2, Loho;->i:Ljava/lang/Integer;

    iget-object v9, p2, Loho;->h:Ljava/lang/Integer;

    iget-object v10, p2, Loho;->g:Ljava/lang/String;

    iget-object v11, p2, Loho;->f:Ljava/lang/String;

    const/4 v12, 0x0

    invoke-interface {p1, p0, v12, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v1, p2, Loho;->b:Ljava/lang/String;

    const/4 v12, 0x1

    invoke-interface {p1, p0, v12, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v1, p2, Loho;->c:Ljava/lang/String;

    const/4 v12, 0x2

    invoke-interface {p1, p0, v12, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget v1, p2, Loho;->d:I

    const/4 v12, 0x3

    invoke-interface {p1, v12, v1, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget-object v1, p2, Loho;->e:Ljava/lang/String;

    const/4 v12, 0x4

    invoke-interface {p1, p0, v12, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_44

    if-eqz v11, :cond_4a

    :cond_44
    sget-object v1, Lxhk;->a:Lxhk;

    const/4 v12, 0x5

    invoke-interface {p1, p0, v12, v1, v11}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_4a
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_52

    if-eqz v10, :cond_58

    :cond_52
    sget-object v1, Lxhk;->a:Lxhk;

    const/4 v11, 0x6

    invoke-interface {p1, p0, v11, v1, v10}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_58
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_66

    if-eqz v9, :cond_66

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eqz v1, :cond_6c

    :cond_66
    sget-object v1, Lecb;->a:Lecb;

    const/4 v10, 0x7

    invoke-interface {p1, p0, v10, v1, v9}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_6c
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_7a

    if-eqz v8, :cond_7a

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v1

    if-eqz v1, :cond_81

    :cond_7a
    sget-object v1, Lecb;->a:Lecb;

    const/16 v9, 0x8

    invoke-interface {p1, p0, v9, v1, v8}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_81
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_89

    if-eqz v7, :cond_90

    :cond_89
    const/16 v1, 0x9

    aget-object v8, v0, v1

    invoke-interface {p1, p0, v1, v8, v7}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_90
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_98

    if-eqz v6, :cond_9f

    :cond_98
    const/16 v1, 0xa

    aget-object v0, v0, v1

    invoke-interface {p1, p0, v1, v0, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_9f
    sget-object v0, Lqho;->a:Lqho;

    iget-object p2, p2, Loho;->l:Lsho;

    const/16 v1, 0xb

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_b0

    if-eqz v5, :cond_b7

    :cond_b0
    sget-object p2, Lxhk;->a:Lxhk;

    const/16 v0, 0xc

    invoke-interface {p1, p0, v0, p2, v5}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_b7
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_bf

    if-eqz v4, :cond_c6

    :cond_bf
    sget-object p2, Lxhk;->a:Lxhk;

    const/16 v0, 0xd

    invoke-interface {p1, p0, v0, p2, v4}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_c6
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_ce

    if-eqz v3, :cond_d5

    :cond_ce
    sget-object p2, Lxhk;->a:Lxhk;

    const/16 v0, 0xe

    invoke-interface {p1, p0, v0, p2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_d5
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_dd

    if-eqz v2, :cond_e4

    :cond_dd
    sget-object p2, Loe7;->a:Loe7;

    const/16 v0, 0xf

    invoke-interface {p1, p0, v0, p2, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_e4
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
