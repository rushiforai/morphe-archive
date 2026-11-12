.class public final synthetic Lwme;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lwme;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lwme;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lwme;->a:Lwme;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.android.live_score.football.data.network.model.NetworkFootballEventEnvelope.Timepoints"

    const/16 v3, 0xa

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "planned_start"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "base_time_1st_half_start"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "base_time_1st_half_end"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "base_time_2nd_half_start"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "base_time_2nd_half_end"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "extra_time_1st_half_start"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "extra_time_1st_half_end"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "extra_time_2nd_half_start"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "extra_time_2nd_half_end"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "end"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lwme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 21

    sget-object v0, Lyme;->k:[Ll4c;

    const/4 v1, 0x0

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/4 v3, 0x1

    aget-object v4, v0, v3

    invoke-interface {v4}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lkotlinx/serialization/KSerializer;

    invoke-static {v4}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v4

    const/4 v5, 0x2

    aget-object v6, v0, v5

    invoke-interface {v6}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkotlinx/serialization/KSerializer;

    invoke-static {v6}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v6

    const/4 v7, 0x3

    aget-object v8, v0, v7

    invoke-interface {v8}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lkotlinx/serialization/KSerializer;

    invoke-static {v8}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v8

    const/4 v9, 0x4

    aget-object v10, v0, v9

    invoke-interface {v10}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lkotlinx/serialization/KSerializer;

    invoke-static {v10}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v10

    const/4 v11, 0x5

    aget-object v12, v0, v11

    invoke-interface {v12}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lkotlinx/serialization/KSerializer;

    invoke-static {v12}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v12

    const/4 v13, 0x6

    aget-object v14, v0, v13

    invoke-interface {v14}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lkotlinx/serialization/KSerializer;

    invoke-static {v14}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v14

    const/4 v15, 0x7

    aget-object v16, v0, v15

    invoke-interface/range {v16 .. v16}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lkotlinx/serialization/KSerializer;

    invoke-static/range {v16 .. v16}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v16

    const/16 v17, 0x8

    aget-object v18, v0, v17

    invoke-interface/range {v18 .. v18}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lkotlinx/serialization/KSerializer;

    invoke-static/range {v18 .. v18}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v18

    const/16 v19, 0x9

    aget-object v0, v0, v19

    invoke-interface {v0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    move/from16 p0, v1

    const/16 v1, 0xa

    new-array v1, v1, [Lkotlinx/serialization/KSerializer;

    aput-object v2, v1, p0

    aput-object v4, v1, v3

    aput-object v6, v1, v5

    aput-object v8, v1, v7

    aput-object v10, v1, v9

    aput-object v12, v1, v11

    aput-object v14, v1, v13

    aput-object v16, v1, v15

    aput-object v18, v1, v17

    aput-object v0, v1, v19

    return-object v1
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 21

    sget-object v0, Lwme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Lyme;->k:[Ll4c;

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
    if-eqz v6, :cond_f3

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v7

    packed-switch v7, :pswitch_data_fc

    invoke-static {v7}, Lt3p;->d(I)V

    return-object v5

    :pswitch_29
    const/16 v7, 0x9

    aget-object v18, v2, v7

    invoke-interface/range {v18 .. v18}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v5, v18

    check-cast v5, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v18, v5

    check-cast v18, Lebb;

    or-int/lit16 v8, v8, 0x200

    :goto_3f
    const/4 v5, 0x0

    goto :goto_1c

    :pswitch_41
    const/16 v5, 0x8

    aget-object v7, v2, v5

    invoke-interface {v7}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v17, v5

    check-cast v17, Lebb;

    or-int/lit16 v8, v8, 0x100

    goto :goto_3f

    :pswitch_56
    const/4 v5, 0x7

    aget-object v7, v2, v5

    invoke-interface {v7}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v16, v5

    check-cast v16, Lebb;

    or-int/lit16 v8, v8, 0x80

    goto :goto_3f

    :pswitch_6a
    const/4 v5, 0x6

    aget-object v7, v2, v5

    invoke-interface {v7}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Lebb;

    or-int/lit8 v8, v8, 0x40

    goto :goto_3f

    :pswitch_7d
    const/4 v5, 0x5

    aget-object v7, v2, v5

    invoke-interface {v7}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Lebb;

    or-int/lit8 v8, v8, 0x20

    goto :goto_3f

    :pswitch_90
    const/4 v5, 0x4

    aget-object v7, v2, v5

    invoke-interface {v7}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Lebb;

    or-int/lit8 v8, v8, 0x10

    goto :goto_3f

    :pswitch_a3
    const/4 v5, 0x3

    aget-object v7, v2, v5

    invoke-interface {v7}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Lebb;

    or-int/lit8 v8, v8, 0x8

    goto :goto_3f

    :pswitch_b6
    const/4 v5, 0x2

    aget-object v7, v2, v5

    invoke-interface {v7}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Lebb;

    or-int/lit8 v8, v8, 0x4

    goto/16 :goto_3f

    :pswitch_ca
    aget-object v5, v2, v3

    invoke-interface {v5}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v3, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Lebb;

    or-int/lit8 v8, v8, 0x2

    goto/16 :goto_3f

    :pswitch_dd
    aget-object v5, v2, v4

    invoke-interface {v5}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v4, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Lebb;

    or-int/lit8 v8, v8, 0x1

    goto/16 :goto_3f

    :pswitch_f0
    move v6, v4

    goto/16 :goto_1c

    :cond_f3
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v7, Lyme;

    invoke-direct/range {v7 .. v18}, Lyme;-><init>(ILebb;Lebb;Lebb;Lebb;Lebb;Lebb;Lebb;Lebb;Lebb;Lebb;)V

    return-object v7

    :pswitch_data_fc
    .packed-switch -0x1
        :pswitch_f0
        :pswitch_dd
        :pswitch_ca
        :pswitch_b6
        :pswitch_a3
        :pswitch_90
        :pswitch_7d
        :pswitch_6a
        :pswitch_56
        :pswitch_41
        :pswitch_29
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lwme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 7

    check-cast p2, Lyme;

    sget-object p0, Lwme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lyme;->k:[Ll4c;

    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_14

    iget-object v1, p2, Lyme;->a:Lebb;

    if-eqz v1, :cond_22

    :cond_14
    const/4 v1, 0x0

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    iget-object v3, p2, Lyme;->a:Lebb;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_22
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_2c

    iget-object v1, p2, Lyme;->b:Lebb;

    if-eqz v1, :cond_3a

    :cond_2c
    const/4 v1, 0x1

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    iget-object v3, p2, Lyme;->b:Lebb;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_3a
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_44

    iget-object v1, p2, Lyme;->c:Lebb;

    if-eqz v1, :cond_52

    :cond_44
    const/4 v1, 0x2

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    iget-object v3, p2, Lyme;->c:Lebb;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_52
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_5c

    iget-object v1, p2, Lyme;->d:Lebb;

    if-eqz v1, :cond_6a

    :cond_5c
    const/4 v1, 0x3

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    iget-object v3, p2, Lyme;->d:Lebb;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_6a
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_74

    iget-object v1, p2, Lyme;->e:Lebb;

    if-eqz v1, :cond_82

    :cond_74
    const/4 v1, 0x4

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    iget-object v3, p2, Lyme;->e:Lebb;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_82
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_8c

    iget-object v1, p2, Lyme;->f:Lebb;

    if-eqz v1, :cond_9a

    :cond_8c
    const/4 v1, 0x5

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    iget-object v3, p2, Lyme;->f:Lebb;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_9a
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_a4

    iget-object v1, p2, Lyme;->g:Lebb;

    if-eqz v1, :cond_b2

    :cond_a4
    const/4 v1, 0x6

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    iget-object v3, p2, Lyme;->g:Lebb;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_b2
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_bc

    iget-object v1, p2, Lyme;->h:Lebb;

    if-eqz v1, :cond_ca

    :cond_bc
    const/4 v1, 0x7

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    iget-object v3, p2, Lyme;->h:Lebb;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_ca
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_d4

    iget-object v1, p2, Lyme;->i:Lebb;

    if-eqz v1, :cond_e3

    :cond_d4
    const/16 v1, 0x8

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    iget-object v3, p2, Lyme;->i:Lebb;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_e3
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_ed

    iget-object v1, p2, Lyme;->j:Lebb;

    if-eqz v1, :cond_fc

    :cond_ed
    const/16 v1, 0x9

    aget-object v0, v0, v1

    invoke-interface {v0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    iget-object p2, p2, Lyme;->j:Lebb;

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_fc
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
