.class public final Lb2p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lb2p;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lb2p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lb2p;->a:Lb2p;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.analytics.AdCloseEvent"

    const/16 v3, 0xb

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

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "vpn"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "duration"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "pn"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "o2rd"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "r2vd"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "v2cd"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lb2p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 7

    sget-object p0, Lx2p;->r:[Lkotlinx/serialization/KSerializer;

    sget-object v0, Lxhk;->a:Lxhk;

    const/4 v1, 0x3

    aget-object p0, p0, v1

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    sget-object v3, Lrn3;->a:Lrn3;

    invoke-static {v3}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v3

    const/16 v4, 0xb

    new-array v4, v4, [Lkotlinx/serialization/KSerializer;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v5, 0x1

    aput-object v0, v4, v5

    const/4 v5, 0x2

    aput-object v0, v4, v5

    aput-object p0, v4, v1

    const/4 p0, 0x4

    aput-object v2, v4, p0

    const/4 p0, 0x5

    aput-object v3, v4, p0

    sget-object p0, Lh1d;->a:Lh1d;

    const/4 v0, 0x6

    aput-object p0, v4, v0

    sget-object v0, Lecb;->a:Lecb;

    const/4 v1, 0x7

    aput-object v0, v4, v1

    const/16 v0, 0x8

    aput-object p0, v4, v0

    const/16 v0, 0x9

    aput-object p0, v4, v0

    const/16 v0, 0xa

    aput-object p0, v4, v0

    return-object v4
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 27

    sget-object v0, Lb2p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Lx2p;->r:[Lkotlinx/serialization/KSerializer;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    const-wide/16 v6, 0x0

    move v9, v4

    move/from16 v18, v9

    move-object v10, v5

    move-object v11, v10

    move-object v12, v11

    move-object v13, v12

    move-object v14, v13

    move-object v15, v14

    move-wide/from16 v16, v6

    move-wide/from16 v19, v16

    move-wide/from16 v21, v19

    move-wide/from16 v23, v21

    move v6, v3

    :goto_21
    if-eqz v6, :cond_98

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v7

    packed-switch v7, :pswitch_data_a2

    invoke-static {v7}, Lt3p;->d(I)V

    return-object v5

    :pswitch_2e
    const/16 v7, 0xa

    invoke-interface {v1, v0, v7}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v23

    or-int/lit16 v9, v9, 0x400

    goto :goto_21

    :pswitch_37
    const/16 v7, 0x9

    invoke-interface {v1, v0, v7}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v21

    or-int/lit16 v9, v9, 0x200

    goto :goto_21

    :pswitch_40
    const/16 v7, 0x8

    invoke-interface {v1, v0, v7}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v19

    or-int/lit16 v9, v9, 0x100

    goto :goto_21

    :pswitch_49
    const/4 v7, 0x7

    invoke-interface {v1, v0, v7}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v18

    or-int/lit16 v9, v9, 0x80

    goto :goto_21

    :pswitch_51
    const/4 v7, 0x6

    invoke-interface {v1, v0, v7}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v16

    or-int/lit8 v9, v9, 0x40

    goto :goto_21

    :pswitch_59
    sget-object v7, Lrn3;->a:Lrn3;

    const/4 v8, 0x5

    invoke-interface {v1, v0, v8, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v7

    move-object v15, v7

    check-cast v15, Ljava/lang/Boolean;

    or-int/lit8 v9, v9, 0x20

    goto :goto_21

    :pswitch_66
    sget-object v7, Lxhk;->a:Lxhk;

    const/4 v8, 0x4

    invoke-interface {v1, v0, v8, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v7

    move-object v14, v7

    check-cast v14, Ljava/lang/String;

    or-int/lit8 v9, v9, 0x10

    goto :goto_21

    :pswitch_73
    const/4 v7, 0x3

    aget-object v8, v2, v7

    invoke-interface {v1, v0, v7, v8}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v7

    move-object v13, v7

    check-cast v13, Lfuo;

    or-int/lit8 v9, v9, 0x8

    goto :goto_21

    :pswitch_80
    const/4 v7, 0x2

    invoke-interface {v1, v0, v7}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v12

    or-int/lit8 v9, v9, 0x4

    goto :goto_21

    :pswitch_88
    invoke-interface {v1, v0, v3}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v11

    or-int/lit8 v9, v9, 0x2

    goto :goto_21

    :pswitch_8f
    invoke-interface {v1, v0, v4}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v10

    or-int/lit8 v9, v9, 0x1

    goto :goto_21

    :pswitch_96
    move v6, v4

    goto :goto_21

    :cond_98
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v8, Lx2p;

    invoke-direct/range {v8 .. v24}, Lx2p;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lfuo;Ljava/lang/String;Ljava/lang/Boolean;JIJJJ)V

    return-object v8

    nop

    :pswitch_data_a2
    .packed-switch -0x1
        :pswitch_96
        :pswitch_8f
        :pswitch_88
        :pswitch_80
        :pswitch_73
        :pswitch_66
        :pswitch_59
        :pswitch_51
        :pswitch_49
        :pswitch_40
        :pswitch_37
        :pswitch_2e
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lb2p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 8

    check-cast p2, Lx2p;

    sget-object p0, Lb2p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lx2p;->r:[Lkotlinx/serialization/KSerializer;

    iget-object v1, p2, Lx2p;->g:Ljava/lang/String;

    iget-object v2, p2, Lx2p;->l:Ljava/lang/Boolean;

    iget-object v3, p2, Lx2p;->k:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-interface {p1, p0, v4, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v1, p2, Lx2p;->h:Ljava/lang/String;

    const/4 v4, 0x1

    invoke-interface {p1, p0, v4, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    iget-object v1, p2, Lx2p;->i:Ljava/lang/String;

    const/4 v4, 0x2

    invoke-interface {p1, p0, v4, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    const/4 v1, 0x3

    aget-object v0, v0, v1

    iget-object v4, p2, Lx2p;->j:Lfuo;

    invoke-interface {p1, p0, v1, v0, v4}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_30

    if-eqz v3, :cond_36

    :cond_30
    sget-object v0, Lxhk;->a:Lxhk;

    const/4 v1, 0x4

    invoke-interface {p1, p0, v1, v0, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_36
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_3e

    if-eqz v2, :cond_44

    :cond_3e
    sget-object v0, Lrn3;->a:Lrn3;

    const/4 v1, 0x5

    invoke-interface {p1, p0, v1, v0, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_44
    iget-wide v0, p2, Lx2p;->m:J

    const/4 v2, 0x6

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    iget v0, p2, Lx2p;->n:I

    const/4 v1, 0x7

    invoke-interface {p1, v1, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget-wide v0, p2, Lx2p;->o:J

    const/16 v2, 0x8

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    iget-wide v0, p2, Lx2p;->p:J

    const/16 v2, 0x9

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    iget-wide v0, p2, Lx2p;->q:J

    const/16 p2, 0xa

    invoke-interface {p1, p0, p2, v0, v1}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
