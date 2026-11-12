.class public final synthetic Lhme;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lhme;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lhme;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lhme;->a:Lhme;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.android.live_score.football.data.network.model.NetworkFootballEvent"

    const/16 v3, 0x13

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "event_id"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "sport"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "tournament_association_id"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "tournament_stage_id"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "tournament_season_id"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "live_details"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "name"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "leg"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "total_legs"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "status"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "status_description"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "status_description_en"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "finish_type"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "series_winner_team_id"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "home_team"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "away_team"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "planned_start_timestamp"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "time"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "tournament"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lhme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 16

    sget-object p0, Lmme;->t:[Ll4c;

    sget-object v0, Lh1d;->a:Lh1d;

    const/4 v1, 0x1

    aget-object v2, p0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-static {v2}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    sget-object v3, Lxhk;->a:Lxhk;

    sget-object v4, Lecb;->a:Lecb;

    invoke-static {v4}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v5

    invoke-static {v4}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v4

    const/16 v6, 0x9

    aget-object v7, p0, v6

    invoke-interface {v7}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lkotlinx/serialization/KSerializer;

    invoke-static {v7}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v7

    invoke-static {v3}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v8

    invoke-static {v3}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v9

    const/16 v10, 0xc

    aget-object p0, p0, v10

    invoke-interface {p0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/KSerializer;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v11

    sget-object v12, Lppc;->a:Lppc;

    invoke-static {v12}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v12

    const/16 v13, 0x13

    new-array v13, v13, [Lkotlinx/serialization/KSerializer;

    const/4 v14, 0x0

    aput-object v0, v13, v14

    aput-object v2, v13, v1

    const/4 v1, 0x2

    aput-object v0, v13, v1

    const/4 v1, 0x3

    aput-object v0, v13, v1

    const/4 v1, 0x4

    aput-object v0, v13, v1

    sget-object v1, Lrn3;->a:Lrn3;

    const/4 v2, 0x5

    aput-object v1, v13, v2

    const/4 v1, 0x6

    aput-object v3, v13, v1

    const/4 v1, 0x7

    aput-object v5, v13, v1

    const/16 v1, 0x8

    aput-object v4, v13, v1

    aput-object v7, v13, v6

    const/16 v1, 0xa

    aput-object v8, v13, v1

    const/16 v1, 0xb

    aput-object v9, v13, v1

    aput-object p0, v13, v10

    const/16 p0, 0xd

    aput-object v11, v13, p0

    sget-object p0, Llne;->a:Llne;

    const/16 v1, 0xe

    aput-object p0, v13, v1

    const/16 v1, 0xf

    aput-object p0, v13, v1

    const/16 p0, 0x10

    aput-object v0, v13, p0

    sget-object p0, Ljme;->a:Ljme;

    const/16 v0, 0x11

    aput-object p0, v13, v0

    const/16 p0, 0x12

    aput-object v12, v13, p0

    return-object v13
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 36

    sget-object v0, Lhme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Lmme;->t:[Ll4c;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    move v9, v4

    move/from16 v19, v9

    move-wide v10, v5

    move-wide v13, v10

    move-wide v15, v13

    move-wide/from16 v17, v15

    move-wide/from16 v30, v17

    move-object v12, v7

    move-object/from16 v20, v12

    move-object/from16 v21, v20

    move-object/from16 v22, v21

    move-object/from16 v23, v22

    move-object/from16 v24, v23

    move-object/from16 v25, v24

    move-object/from16 v26, v25

    move-object/from16 v27, v26

    move-object/from16 v28, v27

    move-object/from16 v29, v28

    move-object/from16 v32, v29

    move-object/from16 v33, v32

    move v5, v3

    :goto_33
    if-eqz v5, :cond_14b

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v6

    packed-switch v6, :pswitch_data_154

    invoke-static {v6}, Lt3p;->d(I)V

    return-object v7

    :pswitch_40
    const/16 v6, 0x12

    sget-object v8, Lppc;->a:Lppc;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v33, v6

    check-cast v33, Lrpc;

    const/high16 v6, 0x40000

    :goto_4e
    or-int/2addr v9, v6

    goto :goto_33

    :pswitch_50
    const/16 v6, 0x11

    sget-object v8, Ljme;->a:Ljme;

    invoke-interface {v1, v0, v6, v8}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v32, v6

    check-cast v32, Llme;

    const/high16 v6, 0x20000

    goto :goto_4e

    :pswitch_5f
    const/16 v6, 0x10

    invoke-interface {v1, v0, v6}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v30

    const/high16 v6, 0x10000

    goto :goto_4e

    :pswitch_68
    const/16 v6, 0xf

    sget-object v8, Llne;->a:Llne;

    invoke-interface {v1, v0, v6, v8}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v29, v6

    check-cast v29, Lnne;

    const v6, 0x8000

    goto :goto_4e

    :pswitch_78
    const/16 v6, 0xe

    sget-object v8, Llne;->a:Llne;

    invoke-interface {v1, v0, v6, v8}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v28, v6

    check-cast v28, Lnne;

    or-int/lit16 v9, v9, 0x4000

    goto :goto_33

    :pswitch_87
    const/16 v6, 0xd

    sget-object v8, Lh1d;->a:Lh1d;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v27, v6

    check-cast v27, Ljava/lang/Long;

    or-int/lit16 v9, v9, 0x2000

    goto :goto_33

    :pswitch_96
    const/16 v6, 0xc

    aget-object v8, v2, v6

    invoke-interface {v8}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v26, v6

    check-cast v26, Lene;

    or-int/lit16 v9, v9, 0x1000

    goto :goto_33

    :pswitch_ab
    const/16 v6, 0xb

    sget-object v8, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v25, v6

    check-cast v25, Ljava/lang/String;

    or-int/lit16 v9, v9, 0x800

    goto/16 :goto_33

    :pswitch_bb
    const/16 v6, 0xa

    sget-object v8, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v24, v6

    check-cast v24, Ljava/lang/String;

    or-int/lit16 v9, v9, 0x400

    goto/16 :goto_33

    :pswitch_cb
    const/16 v6, 0x9

    aget-object v8, v2, v6

    invoke-interface {v8}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v23, v6

    check-cast v23, Ljnc;

    or-int/lit16 v9, v9, 0x200

    goto/16 :goto_33

    :pswitch_e1
    sget-object v6, Lecb;->a:Lecb;

    const/16 v8, 0x8

    invoke-interface {v1, v0, v8, v6}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v22, v6

    check-cast v22, Ljava/lang/Integer;

    or-int/lit16 v9, v9, 0x100

    goto/16 :goto_33

    :pswitch_f1
    const/4 v6, 0x7

    sget-object v8, Lecb;->a:Lecb;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v21, v6

    check-cast v21, Ljava/lang/Integer;

    or-int/lit16 v9, v9, 0x80

    goto/16 :goto_33

    :pswitch_100
    const/4 v6, 0x6

    invoke-interface {v1, v0, v6}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v20

    or-int/lit8 v9, v9, 0x40

    goto/16 :goto_33

    :pswitch_109
    const/4 v6, 0x5

    invoke-interface {v1, v0, v6}, Loh5;->C(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v19

    or-int/lit8 v9, v9, 0x20

    goto/16 :goto_33

    :pswitch_112
    const/4 v6, 0x4

    invoke-interface {v1, v0, v6}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v17

    or-int/lit8 v9, v9, 0x10

    goto/16 :goto_33

    :pswitch_11b
    const/4 v6, 0x3

    invoke-interface {v1, v0, v6}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v15

    or-int/lit8 v9, v9, 0x8

    goto/16 :goto_33

    :pswitch_124
    const/4 v6, 0x2

    invoke-interface {v1, v0, v6}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v13

    or-int/lit8 v9, v9, 0x4

    goto/16 :goto_33

    :pswitch_12d
    aget-object v6, v2, v3

    invoke-interface {v6}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v3, v6}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object v12, v6

    check-cast v12, Lcpc;

    or-int/lit8 v9, v9, 0x2

    goto/16 :goto_33

    :pswitch_140
    invoke-interface {v1, v0, v4}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v10

    or-int/lit8 v9, v9, 0x1

    goto/16 :goto_33

    :pswitch_148
    move v5, v4

    goto/16 :goto_33

    :cond_14b
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v8, Lmme;

    invoke-direct/range {v8 .. v33}, Lmme;-><init>(IJLcpc;JJJZLjava/lang/String;Ljava/lang/Integer;Ljava/lang/Integer;Ljnc;Ljava/lang/String;Ljava/lang/String;Lene;Ljava/lang/Long;Lnne;Lnne;JLlme;Lrpc;)V

    return-object v8

    :pswitch_data_154
    .packed-switch -0x1
        :pswitch_148
        :pswitch_140
        :pswitch_12d
        :pswitch_124
        :pswitch_11b
        :pswitch_112
        :pswitch_109
        :pswitch_100
        :pswitch_f1
        :pswitch_e1
        :pswitch_cb
        :pswitch_bb
        :pswitch_ab
        :pswitch_96
        :pswitch_87
        :pswitch_78
        :pswitch_68
        :pswitch_5f
        :pswitch_50
        :pswitch_40
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lhme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 16

    check-cast p2, Lmme;

    sget-object p0, Lhme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lmme;->t:[Ll4c;

    iget-wide v1, p2, Lmme;->a:J

    iget-object v3, p2, Lmme;->s:Lrpc;

    iget-object v4, p2, Lmme;->n:Ljava/lang/Long;

    iget-object v5, p2, Lmme;->m:Lene;

    iget-object v6, p2, Lmme;->l:Ljava/lang/String;

    iget-object v7, p2, Lmme;->k:Ljava/lang/String;

    iget-object v8, p2, Lmme;->j:Ljnc;

    iget-object v9, p2, Lmme;->i:Ljava/lang/Integer;

    iget-object v10, p2, Lmme;->h:Ljava/lang/Integer;

    iget-object v11, p2, Lmme;->b:Lcpc;

    const/4 v12, 0x0

    invoke-interface {p1, p0, v12, v1, v2}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_2a

    if-eqz v11, :cond_36

    :cond_2a
    const/4 v1, 0x1

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-interface {p1, p0, v1, v2, v11}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_36
    const/4 v1, 0x2

    iget-wide v11, p2, Lmme;->c:J

    invoke-interface {p1, p0, v1, v11, v12}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    const/4 v1, 0x3

    iget-wide v11, p2, Lmme;->d:J

    invoke-interface {p1, p0, v1, v11, v12}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    const/4 v1, 0x4

    iget-wide v11, p2, Lmme;->e:J

    invoke-interface {p1, p0, v1, v11, v12}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    const/4 v1, 0x5

    iget-boolean v2, p2, Lmme;->f:Z

    invoke-interface {p1, p0, v1, v2}, Lph5;->y(Lkotlinx/serialization/descriptors/SerialDescriptor;IZ)V

    const/4 v1, 0x6

    iget-object v2, p2, Lmme;->g:Ljava/lang/String;

    invoke-interface {p1, p0, v1, v2}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_5c

    if-eqz v10, :cond_62

    :cond_5c
    sget-object v1, Lecb;->a:Lecb;

    const/4 v2, 0x7

    invoke-interface {p1, p0, v2, v1, v10}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_62
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_6a

    if-eqz v9, :cond_71

    :cond_6a
    sget-object v1, Lecb;->a:Lecb;

    const/16 v2, 0x8

    invoke-interface {p1, p0, v2, v1, v9}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_71
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_79

    if-eqz v8, :cond_86

    :cond_79
    const/16 v1, 0x9

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    invoke-interface {p1, p0, v1, v2, v8}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_86
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_8e

    if-eqz v7, :cond_95

    :cond_8e
    sget-object v1, Lxhk;->a:Lxhk;

    const/16 v2, 0xa

    invoke-interface {p1, p0, v2, v1, v7}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_95
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_9d

    if-eqz v6, :cond_a4

    :cond_9d
    sget-object v1, Lxhk;->a:Lxhk;

    const/16 v2, 0xb

    invoke-interface {p1, p0, v2, v1, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_a4
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_ac

    if-eqz v5, :cond_b9

    :cond_ac
    const/16 v1, 0xc

    aget-object v0, v0, v1

    invoke-interface {v0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-interface {p1, p0, v1, v0, v5}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_b9
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_c1

    if-eqz v4, :cond_c8

    :cond_c1
    sget-object v0, Lh1d;->a:Lh1d;

    const/16 v1, 0xd

    invoke-interface {p1, p0, v1, v0, v4}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_c8
    sget-object v0, Llne;->a:Llne;

    iget-object v1, p2, Lmme;->o:Lnne;

    const/16 v2, 0xe

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    const/16 v1, 0xf

    iget-object v2, p2, Lmme;->p:Lnne;

    invoke-interface {p1, p0, v1, v0, v2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    const/16 v0, 0x10

    iget-wide v1, p2, Lmme;->q:J

    invoke-interface {p1, p0, v0, v1, v2}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    sget-object v0, Ljme;->a:Ljme;

    iget-object p2, p2, Lmme;->r:Llme;

    const/16 v1, 0x11

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_f0

    if-eqz v3, :cond_f7

    :cond_f0
    sget-object p2, Lppc;->a:Lppc;

    const/16 v0, 0x12

    invoke-interface {p1, p0, v0, p2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_f7
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
