.class public final Lifp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lifp;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lifp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lifp;->a:Lifp;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.analytics.AdVisibleEvent"

    const/16 v3, 0xa

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

    const-string v0, "connectionType"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "vpn"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ecpm"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "pn"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "o2rd"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "r2vd"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lifp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 11

    sget-object p0, Lwfp;->q:[Lkotlinx/serialization/KSerializer;

    sget-object v0, Lxhk;->a:Lxhk;

    const/4 v1, 0x3

    aget-object p0, p0, v1

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    sget-object v3, Lrn3;->a:Lrn3;

    invoke-static {v3}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v3

    sget-object v4, Loe7;->a:Loe7;

    invoke-static {v4}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v4

    sget-object v5, Lecb;->a:Lecb;

    invoke-static {v5}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v5

    sget-object v6, Lh1d;->a:Lh1d;

    invoke-static {v6}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v7

    invoke-static {v6}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v6

    const/16 v8, 0xa

    new-array v8, v8, [Lkotlinx/serialization/KSerializer;

    const/4 v9, 0x0

    aput-object v0, v8, v9

    const/4 v9, 0x1

    aput-object v0, v8, v9

    const/4 v9, 0x2

    aput-object v0, v8, v9

    aput-object p0, v8, v1

    const/4 p0, 0x4

    aput-object v2, v8, p0

    const/4 p0, 0x5

    aput-object v3, v8, p0

    const/4 p0, 0x6

    aput-object v4, v8, p0

    const/4 p0, 0x7

    aput-object v5, v8, p0

    const/16 p0, 0x8

    aput-object v7, v8, p0

    const/16 p0, 0x9

    aput-object v6, v8, p0

    return-object v8
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 21

    sget-object v0, Lifp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Lwfp;->q:[Lkotlinx/serialization/KSerializer;

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

    move-object/from16 v18, v17

    :goto_1c
    if-eqz v6, :cond_a3

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v7

    packed-switch v7, :pswitch_data_ac

    invoke-static {v7}, Lt3p;->d(I)V

    return-object v5

    :pswitch_29
    sget-object v7, Lh1d;->a:Lh1d;

    const/16 v5, 0x9

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v18, v5

    check-cast v18, Ljava/lang/Long;

    or-int/lit16 v8, v8, 0x200

    :goto_37
    const/4 v5, 0x0

    goto :goto_1c

    :pswitch_39
    sget-object v5, Lh1d;->a:Lh1d;

    const/16 v7, 0x8

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v17, v5

    check-cast v17, Ljava/lang/Long;

    or-int/lit16 v8, v8, 0x100

    goto :goto_37

    :pswitch_48
    sget-object v5, Lecb;->a:Lecb;

    const/4 v7, 0x7

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v16, v5

    check-cast v16, Ljava/lang/Integer;

    or-int/lit16 v8, v8, 0x80

    goto :goto_37

    :pswitch_56
    sget-object v5, Loe7;->a:Loe7;

    const/4 v7, 0x6

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Ljava/lang/Double;

    or-int/lit8 v8, v8, 0x40

    goto :goto_37

    :pswitch_63
    sget-object v5, Lrn3;->a:Lrn3;

    const/4 v7, 0x5

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Ljava/lang/Boolean;

    or-int/lit8 v8, v8, 0x20

    goto :goto_37

    :pswitch_70
    sget-object v5, Lxhk;->a:Lxhk;

    const/4 v7, 0x4

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Ljava/lang/String;

    or-int/lit8 v8, v8, 0x10

    goto :goto_37

    :pswitch_7d
    const/4 v5, 0x3

    aget-object v7, v2, v5

    invoke-interface {v1, v0, v5, v7}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Lfuo;

    or-int/lit8 v8, v8, 0x8

    goto :goto_37

    :pswitch_8a
    const/4 v5, 0x2

    invoke-interface {v1, v0, v5}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v11

    or-int/lit8 v8, v8, 0x4

    goto :goto_37

    :pswitch_92
    invoke-interface {v1, v0, v3}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v10

    or-int/lit8 v8, v8, 0x2

    goto :goto_37

    :pswitch_99
    invoke-interface {v1, v0, v4}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v9

    or-int/lit8 v8, v8, 0x1

    goto :goto_37

    :pswitch_a0
    move v6, v4

    goto/16 :goto_1c

    :cond_a3
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v7, Lwfp;

    invoke-direct/range {v7 .. v18}, Lwfp;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/Double;Ljava/lang/Integer;Ljava/lang/Long;Ljava/lang/Long;)V

    return-object v7

    :pswitch_data_ac
    .packed-switch -0x1
        :pswitch_a0
        :pswitch_99
        :pswitch_92
        :pswitch_8a
        :pswitch_7d
        :pswitch_70
        :pswitch_63
        :pswitch_56
        :pswitch_48
        :pswitch_39
        :pswitch_29
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lifp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 12

    check-cast p2, Lwfp;

    sget-object p0, Lifp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lwfp;->q:[Lkotlinx/serialization/KSerializer;

    iget-object v1, p2, Lwfp;->g:Ljava/lang/String;

    iget-object v2, p2, Lwfp;->p:Ljava/lang/Long;

    iget-object v3, p2, Lwfp;->o:Ljava/lang/Long;

    iget-object v4, p2, Lwfp;->n:Ljava/lang/Integer;

    iget-object v5, p2, Lwfp;->m:Ljava/lang/Double;

    iget-object v6, p2, Lwfp;->l:Ljava/lang/Boolean;

    iget-object v7, p2, Lwfp;->k:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-interface {p1, p0, v8, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v1, p2, Lwfp;->h:Ljava/lang/String;

    const/4 v8, 0x1

    invoke-interface {p1, p0, v8, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v1, p2, Lwfp;->i:Ljava/lang/String;

    const/4 v8, 0x2

    invoke-interface {p1, p0, v8, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    const/4 v1, 0x3

    aget-object v0, v0, v1

    iget-object p2, p2, Lwfp;->j:Lfuo;

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_38

    if-eqz v7, :cond_3e

    :cond_38
    sget-object p2, Lxhk;->a:Lxhk;

    const/4 v0, 0x4

    invoke-interface {p1, p0, v0, p2, v7}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_3e
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_46

    if-eqz v6, :cond_4c

    :cond_46
    sget-object p2, Lrn3;->a:Lrn3;

    const/4 v0, 0x5

    invoke-interface {p1, p0, v0, p2, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_4c
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_54

    if-eqz v5, :cond_5a

    :cond_54
    sget-object p2, Loe7;->a:Loe7;

    const/4 v0, 0x6

    invoke-interface {p1, p0, v0, p2, v5}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_5a
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_62

    if-eqz v4, :cond_68

    :cond_62
    sget-object p2, Lecb;->a:Lecb;

    const/4 v0, 0x7

    invoke-interface {p1, p0, v0, p2, v4}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_68
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_70

    if-eqz v3, :cond_77

    :cond_70
    sget-object p2, Lh1d;->a:Lh1d;

    const/16 v0, 0x8

    invoke-interface {p1, p0, v0, p2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_77
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_7f

    if-eqz v2, :cond_86

    :cond_7f
    sget-object p2, Lh1d;->a:Lh1d;

    const/16 v0, 0x9

    invoke-interface {p1, p0, v0, p2, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_86
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
