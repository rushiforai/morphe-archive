.class public final Lnvo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lnvo;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lnvo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lnvo;->a:Lnvo;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.data.BidRequestObject"

    const/16 v3, 0x9

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "id"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "imp"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "app"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "device"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "user"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "at"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "source"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "regs"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ext"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lnvo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 6

    sget-object p0, Lrxo;->j:[Lkotlinx/serialization/KSerializer;

    const/4 v0, 0x1

    aget-object p0, p0, v0

    sget-object v1, Luvo;->a:Luvo;

    invoke-static {v1}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    const/16 v2, 0x9

    new-array v2, v2, [Lkotlinx/serialization/KSerializer;

    sget-object v3, Lxhk;->a:Lxhk;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    aput-object p0, v2, v0

    sget-object p0, Lmto;->a:Lmto;

    const/4 v0, 0x2

    aput-object p0, v2, v0

    sget-object p0, Lpyo;->a:Lpyo;

    const/4 v0, 0x3

    aput-object p0, v2, v0

    sget-object p0, Ltwo;->a:Ltwo;

    const/4 v0, 0x4

    aput-object p0, v2, v0

    sget-object p0, Lecb;->a:Lecb;

    const/4 v0, 0x5

    aput-object p0, v2, v0

    sget-object p0, Ljwo;->a:Ljwo;

    const/4 v0, 0x6

    aput-object p0, v2, v0

    sget-object p0, Lewo;->a:Lewo;

    const/4 v0, 0x7

    aput-object p0, v2, v0

    const/16 p0, 0x8

    aput-object v1, v2, p0

    return-object v2
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 20

    sget-object v0, Lnvo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Lrxo;->j:[Lkotlinx/serialization/KSerializer;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move v6, v3

    move v8, v4

    move v14, v8

    move-object v9, v5

    move-object v10, v9

    move-object v11, v10

    move-object v12, v11

    move-object v13, v12

    move-object v15, v13

    move-object/from16 v16, v15

    move-object/from16 v17, v16

    :goto_1a
    if-eqz v6, :cond_96

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v7

    packed-switch v7, :pswitch_data_a0

    invoke-static {v7}, Lt3p;->d(I)V

    return-object v5

    :pswitch_27
    sget-object v7, Luvo;->a:Luvo;

    const/16 v5, 0x8

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v17, v5

    check-cast v17, Lzvo;

    or-int/lit16 v8, v8, 0x100

    :goto_35
    const/4 v5, 0x0

    goto :goto_1a

    :pswitch_37
    sget-object v5, Lewo;->a:Lewo;

    const/4 v7, 0x7

    invoke-interface {v1, v0, v7, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v16, v5

    check-cast v16, Lhwo;

    or-int/lit16 v8, v8, 0x80

    goto :goto_35

    :pswitch_45
    sget-object v5, Ljwo;->a:Ljwo;

    const/4 v7, 0x6

    invoke-interface {v1, v0, v7, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Lmwo;

    or-int/lit8 v8, v8, 0x40

    goto :goto_35

    :pswitch_52
    const/4 v5, 0x5

    invoke-interface {v1, v0, v5}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v14

    or-int/lit8 v8, v8, 0x20

    goto :goto_35

    :pswitch_5a
    sget-object v5, Ltwo;->a:Ltwo;

    const/4 v7, 0x4

    invoke-interface {v1, v0, v7, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Lwwo;

    or-int/lit8 v8, v8, 0x10

    goto :goto_35

    :pswitch_67
    sget-object v5, Lpyo;->a:Lpyo;

    const/4 v7, 0x3

    invoke-interface {v1, v0, v7, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Ljzo;

    or-int/lit8 v8, v8, 0x8

    goto :goto_35

    :pswitch_74
    sget-object v5, Lmto;->a:Lmto;

    const/4 v7, 0x2

    invoke-interface {v1, v0, v7, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Lhuo;

    or-int/lit8 v8, v8, 0x4

    goto :goto_35

    :pswitch_81
    aget-object v5, v2, v3

    invoke-interface {v1, v0, v3, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Ljava/util/List;

    or-int/lit8 v8, v8, 0x2

    goto :goto_35

    :pswitch_8d
    invoke-interface {v1, v0, v4}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v9

    or-int/lit8 v8, v8, 0x1

    goto :goto_35

    :pswitch_94
    move v6, v4

    goto :goto_1a

    :cond_96
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v7, Lrxo;

    invoke-direct/range {v7 .. v17}, Lrxo;-><init>(ILjava/lang/String;Ljava/util/List;Lhuo;Ljzo;Lwwo;ILmwo;Lhwo;Lzvo;)V

    return-object v7

    nop

    :pswitch_data_a0
    .packed-switch -0x1
        :pswitch_94
        :pswitch_8d
        :pswitch_81
        :pswitch_74
        :pswitch_67
        :pswitch_5a
        :pswitch_52
        :pswitch_45
        :pswitch_37
        :pswitch_27
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lnvo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 8

    check-cast p2, Lrxo;

    sget-object p0, Lnvo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lrxo;->j:[Lkotlinx/serialization/KSerializer;

    iget-object v1, p2, Lrxo;->a:Ljava/lang/String;

    iget v2, p2, Lrxo;->f:I

    const/4 v3, 0x0

    invoke-interface {p1, p0, v3, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    const/4 v1, 0x1

    aget-object v0, v0, v1

    iget-object v3, p2, Lrxo;->b:Ljava/util/List;

    invoke-interface {p1, p0, v1, v0, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v0, Lmto;->a:Lmto;

    iget-object v3, p2, Lrxo;->c:Lhuo;

    const/4 v4, 0x2

    invoke-interface {p1, p0, v4, v0, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v0, Lpyo;->a:Lpyo;

    iget-object v3, p2, Lrxo;->d:Ljzo;

    const/4 v4, 0x3

    invoke-interface {p1, p0, v4, v0, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v0, Ltwo;->a:Ltwo;

    iget-object v3, p2, Lrxo;->e:Lwwo;

    const/4 v4, 0x4

    invoke-interface {p1, p0, v4, v0, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_3a

    if-eq v2, v1, :cond_3e

    :cond_3a
    const/4 v0, 0x5

    invoke-interface {p1, v0, v2, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_3e
    sget-object v0, Ljwo;->a:Ljwo;

    iget-object v1, p2, Lrxo;->g:Lmwo;

    const/4 v2, 0x6

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v0, Lewo;->a:Lewo;

    iget-object v1, p2, Lrxo;->h:Lhwo;

    const/4 v2, 0x7

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v0, Luvo;->a:Luvo;

    iget-object p2, p2, Lrxo;->i:Lzvo;

    const/16 v1, 0x8

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
