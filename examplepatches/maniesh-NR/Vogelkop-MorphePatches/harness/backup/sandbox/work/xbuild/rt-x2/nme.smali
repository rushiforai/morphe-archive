.class public final synthetic Lnme;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lnme;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lnme;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lnme;->a:Lnme;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.android.live_score.football.data.network.model.NetworkFootballEventEnvelope"

    const/16 v3, 0x9

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "event_id"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "sport"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "tournament_stage_id"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "status"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "status_description_en"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "finish_type"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "home_team"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "away_team"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "timepoints"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lnme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 9

    sget-object p0, Lh1d;->a:Lh1d;

    sget-object v0, Lxhk;->a:Lxhk;

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v3

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v4

    sget-object v5, Lwme;->a:Lwme;

    invoke-static {v5}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v5

    const/16 v6, 0x9

    new-array v6, v6, [Lkotlinx/serialization/KSerializer;

    const/4 v7, 0x0

    aput-object p0, v6, v7

    const/4 p0, 0x1

    aput-object v1, v6, p0

    const/4 p0, 0x2

    aput-object v2, v6, p0

    const/4 p0, 0x3

    aput-object v0, v6, p0

    const/4 p0, 0x4

    aput-object v3, v6, p0

    const/4 p0, 0x5

    aput-object v4, v6, p0

    sget-object p0, Lsme;->a:Lsme;

    const/4 v0, 0x6

    aput-object p0, v6, v0

    const/4 v0, 0x7

    aput-object p0, v6, v0

    const/16 p0, 0x8

    aput-object v5, v6, p0

    return-object v6
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 21

    sget-object v0, Lnme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    move v8, v3

    move-wide v9, v4

    move-object v11, v6

    move-object v12, v11

    move-object v13, v12

    move-object v14, v13

    move-object v15, v14

    move-object/from16 v16, v15

    move-object/from16 v17, v16

    move-object/from16 v18, v17

    move v4, v2

    :goto_1b
    if-eqz v4, :cond_97

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v5

    packed-switch v5, :pswitch_data_a0

    invoke-static {v5}, Lt3p;->d(I)V

    return-object v6

    :pswitch_28
    sget-object v5, Lwme;->a:Lwme;

    const/16 v7, 0x8

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v18, v5

    check-cast v18, Lyme;

    or-int/lit16 v8, v8, 0x100

    goto :goto_1b

    :pswitch_37
    const/4 v5, 0x7

    sget-object v7, Lsme;->a:Lsme;

    invoke-interface {v1, v0, v5, v7}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v17, v5

    check-cast v17, Lume;

    or-int/lit16 v8, v8, 0x80

    goto :goto_1b

    :pswitch_45
    const/4 v5, 0x6

    sget-object v7, Lsme;->a:Lsme;

    invoke-interface {v1, v0, v5, v7}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v16, v5

    check-cast v16, Lume;

    or-int/lit8 v8, v8, 0x40

    goto :goto_1b

    :pswitch_53
    const/4 v5, 0x5

    sget-object v7, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v5, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Ljava/lang/String;

    or-int/lit8 v8, v8, 0x20

    goto :goto_1b

    :pswitch_60
    sget-object v5, Lxhk;->a:Lxhk;

    const/4 v7, 0x4

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Ljava/lang/String;

    or-int/lit8 v8, v8, 0x10

    goto :goto_1b

    :pswitch_6d
    const/4 v5, 0x3

    invoke-interface {v1, v0, v5}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v13

    or-int/lit8 v8, v8, 0x8

    goto :goto_1b

    :pswitch_75
    sget-object v5, Lh1d;->a:Lh1d;

    const/4 v7, 0x2

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Ljava/lang/Long;

    or-int/lit8 v8, v8, 0x4

    goto :goto_1b

    :pswitch_82
    sget-object v5, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v2, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Ljava/lang/String;

    or-int/lit8 v8, v8, 0x2

    goto :goto_1b

    :pswitch_8e
    invoke-interface {v1, v0, v3}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v9

    or-int/lit8 v8, v8, 0x1

    goto :goto_1b

    :pswitch_95
    move v4, v3

    goto :goto_1b

    :cond_97
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v7, Lzme;

    invoke-direct/range {v7 .. v18}, Lzme;-><init>(IJLjava/lang/String;Ljava/lang/Long;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lume;Lume;Lyme;)V

    return-object v7

    :pswitch_data_a0
    .packed-switch -0x1
        :pswitch_95
        :pswitch_8e
        :pswitch_82
        :pswitch_75
        :pswitch_6d
        :pswitch_60
        :pswitch_53
        :pswitch_45
        :pswitch_37
        :pswitch_28
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lnme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 11

    check-cast p2, Lzme;

    sget-object p0, Lnme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    iget-wide v0, p2, Lzme;->a:J

    iget-object v2, p2, Lzme;->i:Lyme;

    iget-object v3, p2, Lzme;->f:Ljava/lang/String;

    iget-object v4, p2, Lzme;->e:Ljava/lang/String;

    iget-object v5, p2, Lzme;->c:Ljava/lang/Long;

    iget-object v6, p2, Lzme;->b:Ljava/lang/String;

    const/4 v7, 0x0

    invoke-interface {p1, p0, v7, v0, v1}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_20

    if-eqz v6, :cond_26

    :cond_20
    sget-object v0, Lxhk;->a:Lxhk;

    const/4 v1, 0x1

    invoke-interface {p1, p0, v1, v0, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_26
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_2e

    if-eqz v5, :cond_34

    :cond_2e
    sget-object v0, Lh1d;->a:Lh1d;

    const/4 v1, 0x2

    invoke-interface {p1, p0, v1, v0, v5}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_34
    const/4 v0, 0x3

    iget-object v1, p2, Lzme;->d:Ljava/lang/String;

    invoke-interface {p1, p0, v0, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_42

    if-eqz v4, :cond_48

    :cond_42
    sget-object v0, Lxhk;->a:Lxhk;

    const/4 v1, 0x4

    invoke-interface {p1, p0, v1, v0, v4}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_48
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_50

    if-eqz v3, :cond_56

    :cond_50
    sget-object v0, Lxhk;->a:Lxhk;

    const/4 v1, 0x5

    invoke-interface {p1, p0, v1, v0, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_56
    sget-object v0, Lsme;->a:Lsme;

    iget-object v1, p2, Lzme;->g:Lume;

    const/4 v3, 0x6

    invoke-interface {p1, p0, v3, v0, v1}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    const/4 v1, 0x7

    iget-object p2, p2, Lzme;->h:Lume;

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_6c

    if-eqz v2, :cond_73

    :cond_6c
    sget-object p2, Lwme;->a:Lwme;

    const/16 v0, 0x8

    invoke-interface {p1, p0, v0, p2, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_73
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
