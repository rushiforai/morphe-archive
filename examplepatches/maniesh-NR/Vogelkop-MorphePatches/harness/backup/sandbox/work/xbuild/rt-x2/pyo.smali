.class public final Lpyo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lpyo;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lpyo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lpyo;->a:Lpyo;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.data.DeviceObject"

    const/16 v3, 0x16

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "ua"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "geo"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "lmt"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ip"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "devicetype"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "make"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "model"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "os"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "osv"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "hwv"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "w"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "h"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ppi"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "pxratio"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "js"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "geofetch"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "language"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "carrier"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "mccmnc"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "connectiontype"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ifa"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ext"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lpyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 8

    sget-object p0, Lxhk;->a:Lxhk;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v3

    const/16 v4, 0x16

    new-array v4, v4, [Lkotlinx/serialization/KSerializer;

    const/4 v5, 0x0

    aput-object p0, v4, v5

    sget-object v5, Lyyo;->a:Lyyo;

    const/4 v6, 0x1

    aput-object v5, v4, v6

    sget-object v5, Lecb;->a:Lecb;

    const/4 v6, 0x2

    aput-object v5, v4, v6

    const/4 v6, 0x3

    aput-object p0, v4, v6

    const/4 v6, 0x4

    aput-object v5, v4, v6

    const/4 v6, 0x5

    aput-object p0, v4, v6

    const/4 v6, 0x6

    aput-object p0, v4, v6

    const/4 v6, 0x7

    aput-object p0, v4, v6

    const/16 v6, 0x8

    aput-object p0, v4, v6

    const/16 v6, 0x9

    aput-object p0, v4, v6

    const/16 p0, 0xa

    aput-object v5, v4, p0

    const/16 p0, 0xb

    aput-object v5, v4, p0

    const/16 p0, 0xc

    aput-object v5, v4, p0

    sget-object p0, Lv89;->a:Lv89;

    const/16 v6, 0xd

    aput-object p0, v4, v6

    const/16 p0, 0xe

    aput-object v5, v4, p0

    const/16 p0, 0xf

    aput-object v5, v4, p0

    const/16 p0, 0x10

    aput-object v0, v4, p0

    const/16 p0, 0x11

    aput-object v1, v4, p0

    const/16 p0, 0x12

    aput-object v2, v4, p0

    const/16 p0, 0x13

    aput-object v5, v4, p0

    const/16 p0, 0x14

    aput-object v3, v4, p0

    sget-object p0, Luyo;->a:Luyo;

    const/16 v0, 0x15

    aput-object p0, v4, v0

    return-object v4
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 32

    sget-object v0, Lpyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    const/4 v5, 0x0

    move/from16 v21, v5

    const/4 v5, 0x1

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v20, 0x0

    const/16 v22, 0x0

    const/16 v23, 0x0

    const/16 v24, 0x0

    const/16 v25, 0x0

    const/16 v26, 0x0

    const/16 v27, 0x0

    const/16 v28, 0x0

    const/16 v29, 0x0

    :goto_2f
    if-eqz v5, :cond_12b

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v6

    const/16 p0, 0x0

    const/4 v3, 0x4

    const/16 v2, 0x8

    const/16 v4, 0x10

    packed-switch v6, :pswitch_data_134

    invoke-static {v6}, Lt3p;->d(I)V

    return-object p0

    :pswitch_43
    sget-object v2, Luyo;->a:Luyo;

    const/16 v3, 0x15

    invoke-interface {v1, v0, v3, v2}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v29, v2

    check-cast v29, Lwyo;

    const/high16 v4, 0x200000

    :goto_51
    move v3, v4

    goto/16 :goto_124

    :pswitch_54
    sget-object v2, Lxhk;->a:Lxhk;

    const/16 v3, 0x14

    invoke-interface {v1, v0, v3, v2}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v28, v2

    check-cast v28, Ljava/lang/String;

    const/high16 v4, 0x100000

    goto :goto_51

    :pswitch_63
    const/16 v2, 0x13

    invoke-interface {v1, v0, v2}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v27

    const/high16 v4, 0x80000

    goto :goto_51

    :pswitch_6c
    sget-object v2, Lxhk;->a:Lxhk;

    const/16 v3, 0x12

    invoke-interface {v1, v0, v3, v2}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v26, v2

    check-cast v26, Ljava/lang/String;

    const/high16 v4, 0x40000

    goto :goto_51

    :pswitch_7b
    sget-object v2, Lxhk;->a:Lxhk;

    const/16 v3, 0x11

    invoke-interface {v1, v0, v3, v2}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v25, v2

    check-cast v25, Ljava/lang/String;

    const/high16 v4, 0x20000

    goto :goto_51

    :pswitch_8a
    sget-object v2, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v4, v2}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v2

    move-object/from16 v24, v2

    check-cast v24, Ljava/lang/String;

    const/high16 v4, 0x10000

    goto :goto_51

    :pswitch_97
    const/16 v2, 0xf

    invoke-interface {v1, v0, v2}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v23

    const v4, 0x8000

    goto :goto_51

    :pswitch_a1
    const/16 v2, 0xe

    invoke-interface {v1, v0, v2}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v22

    const/16 v4, 0x4000

    goto :goto_51

    :pswitch_aa
    const/16 v2, 0xd

    invoke-interface {v1, v0, v2}, Loh5;->u(Lkotlinx/serialization/descriptors/SerialDescriptor;I)F

    move-result v2

    const/16 v4, 0x2000

    move/from16 v21, v2

    goto :goto_51

    :pswitch_b5
    const/16 v2, 0xc

    invoke-interface {v1, v0, v2}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v20

    const/16 v4, 0x1000

    goto :goto_51

    :pswitch_be
    const/16 v2, 0xb

    invoke-interface {v1, v0, v2}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v19

    const/16 v4, 0x800

    goto :goto_51

    :pswitch_c7
    const/16 v2, 0xa

    invoke-interface {v1, v0, v2}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v18

    const/16 v4, 0x400

    goto :goto_51

    :pswitch_d0
    const/16 v2, 0x9

    invoke-interface {v1, v0, v2}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v17

    const/16 v4, 0x200

    goto/16 :goto_51

    :pswitch_da
    invoke-interface {v1, v0, v2}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v16

    const/16 v4, 0x100

    goto/16 :goto_51

    :pswitch_e2
    const/4 v2, 0x7

    invoke-interface {v1, v0, v2}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v15

    const/16 v4, 0x80

    goto/16 :goto_51

    :pswitch_eb
    const/4 v2, 0x6

    invoke-interface {v1, v0, v2}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v14

    const/16 v4, 0x40

    goto/16 :goto_51

    :pswitch_f4
    const/4 v2, 0x5

    invoke-interface {v1, v0, v2}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v13

    const/16 v4, 0x20

    goto/16 :goto_51

    :pswitch_fd
    invoke-interface {v1, v0, v3}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v12

    goto/16 :goto_51

    :pswitch_103
    const/4 v3, 0x3

    invoke-interface {v1, v0, v3}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v11

    :goto_108
    move v3, v2

    goto :goto_124

    :pswitch_10a
    const/4 v2, 0x2

    invoke-interface {v1, v0, v2}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v10

    goto :goto_124

    :pswitch_110
    const/4 v2, 0x2

    sget-object v3, Lyyo;->a:Lyyo;

    const/4 v4, 0x1

    invoke-interface {v1, v0, v4, v3}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Lazo;

    goto :goto_108

    :pswitch_11c
    const/4 v2, 0x0

    const/4 v4, 0x1

    invoke-interface {v1, v0, v2}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v8

    goto/16 :goto_51

    :goto_124
    or-int/2addr v7, v3

    goto/16 :goto_2f

    :pswitch_127
    const/4 v2, 0x0

    move v5, v2

    goto/16 :goto_2f

    :cond_12b
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v6, Ljzo;

    invoke-direct/range {v6 .. v29}, Ljzo;-><init>(ILjava/lang/String;Lazo;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;IIIFIILjava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Lwyo;)V

    return-object v6

    :pswitch_data_134
    .packed-switch -0x1
        :pswitch_127
        :pswitch_11c
        :pswitch_110
        :pswitch_10a
        :pswitch_103
        :pswitch_fd
        :pswitch_f4
        :pswitch_eb
        :pswitch_e2
        :pswitch_da
        :pswitch_d0
        :pswitch_c7
        :pswitch_be
        :pswitch_b5
        :pswitch_aa
        :pswitch_a1
        :pswitch_97
        :pswitch_8a
        :pswitch_7b
        :pswitch_6c
        :pswitch_63
        :pswitch_54
        :pswitch_43
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lpyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 13

    check-cast p2, Ljzo;

    sget-object p0, Lpyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    iget-object v0, p2, Ljzo;->a:Ljava/lang/String;

    iget-object v1, p2, Ljzo;->u:Ljava/lang/String;

    iget-object v2, p2, Ljzo;->s:Ljava/lang/String;

    iget-object v3, p2, Ljzo;->r:Ljava/lang/String;

    iget-object v4, p2, Ljzo;->q:Ljava/lang/String;

    iget v5, p2, Ljzo;->o:I

    iget v6, p2, Ljzo;->e:I

    iget-object v7, p2, Ljzo;->d:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-interface {p1, p0, v8, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    sget-object v0, Lyyo;->a:Lyyo;

    iget-object v8, p2, Ljzo;->b:Lazo;

    const/4 v9, 0x1

    invoke-interface {p1, p0, v9, v0, v8}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    iget v0, p2, Ljzo;->c:I

    const/4 v8, 0x2

    invoke-interface {p1, v8, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_38

    const-string v0, "127.0.0.1"

    invoke-static {v7, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3c

    :cond_38
    const/4 v0, 0x3

    invoke-interface {p1, p0, v0, v7}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_3c
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_44

    if-eq v6, v9, :cond_48

    :cond_44
    const/4 v0, 0x4

    invoke-interface {p1, v0, v6, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_48
    iget-object v0, p2, Ljzo;->f:Ljava/lang/String;

    const/4 v6, 0x5

    invoke-interface {p1, p0, v6, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v0, p2, Ljzo;->g:Ljava/lang/String;

    const/4 v6, 0x6

    invoke-interface {p1, p0, v6, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v0, p2, Ljzo;->h:Ljava/lang/String;

    const/4 v6, 0x7

    invoke-interface {p1, p0, v6, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v0, p2, Ljzo;->i:Ljava/lang/String;

    const/16 v6, 0x8

    invoke-interface {p1, p0, v6, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v0, p2, Ljzo;->j:Ljava/lang/String;

    const/16 v6, 0x9

    invoke-interface {p1, p0, v6, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget v0, p2, Ljzo;->k:I

    const/16 v6, 0xa

    invoke-interface {p1, v6, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Ljzo;->l:I

    const/16 v6, 0xb

    invoke-interface {p1, v6, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Ljzo;->m:I

    const/16 v6, 0xc

    invoke-interface {p1, v6, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Ljzo;->n:F

    const/16 v6, 0xd

    invoke-interface {p1, p0, v6, v0}, Lph5;->u(Lkotlinx/serialization/descriptors/SerialDescriptor;IF)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_8c

    if-eq v5, v9, :cond_91

    :cond_8c
    const/16 v0, 0xe

    invoke-interface {p1, v0, v5, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_91
    iget v0, p2, Ljzo;->p:I

    const/16 v5, 0xf

    invoke-interface {p1, v5, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_a0

    if-eqz v4, :cond_a7

    :cond_a0
    sget-object v0, Lxhk;->a:Lxhk;

    const/16 v5, 0x10

    invoke-interface {p1, p0, v5, v0, v4}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_a7
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_af

    if-eqz v3, :cond_b6

    :cond_af
    sget-object v0, Lxhk;->a:Lxhk;

    const/16 v4, 0x11

    invoke-interface {p1, p0, v4, v0, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_b6
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_be

    if-eqz v2, :cond_c5

    :cond_be
    sget-object v0, Lxhk;->a:Lxhk;

    const/16 v3, 0x12

    invoke-interface {p1, p0, v3, v0, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_c5
    iget v0, p2, Ljzo;->t:I

    const/16 v2, 0x13

    invoke-interface {p1, v2, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_d4

    if-eqz v1, :cond_db

    :cond_d4
    sget-object v0, Lxhk;->a:Lxhk;

    const/16 v2, 0x14

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_db
    sget-object v0, Luyo;->a:Luyo;

    iget-object p2, p2, Ljzo;->v:Lwyo;

    const/16 v1, 0x15

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
