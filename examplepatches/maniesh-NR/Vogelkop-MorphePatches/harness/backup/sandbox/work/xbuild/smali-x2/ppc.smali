.class public final synthetic Lppc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lppc;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lppc;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lppc;->a:Lppc;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.android.live_score.data.network.model.LiveScoreTournament"

    const/16 v3, 0x9

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "tournament_stage_id"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "tournament_season_id"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "name"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "season"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "gender"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "logo_url"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "flag_url"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "country"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "continent"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lppc;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 11

    sget-object p0, Lrpc;->j:[Ll4c;

    sget-object v0, Lxhk;->a:Lxhk;

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    const/4 v2, 0x4

    aget-object p0, p0, v2

    invoke-interface {p0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/KSerializer;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v3

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v4

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v5

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v6

    const/16 v7, 0x9

    new-array v7, v7, [Lkotlinx/serialization/KSerializer;

    sget-object v8, Lh1d;->a:Lh1d;

    const/4 v9, 0x0

    aput-object v8, v7, v9

    const/4 v9, 0x1

    aput-object v8, v7, v9

    const/4 v8, 0x2

    aput-object v0, v7, v8

    const/4 v0, 0x3

    aput-object v1, v7, v0

    aput-object p0, v7, v2

    const/4 p0, 0x5

    aput-object v3, v7, p0

    const/4 p0, 0x6

    aput-object v4, v7, p0

    const/4 p0, 0x7

    aput-object v5, v7, p0

    const/16 p0, 0x8

    aput-object v6, v7, p0

    return-object v7
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 23

    sget-object v0, Lppc;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Lrpc;->j:[Ll4c;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    move v9, v4

    move-wide v10, v5

    move-wide v12, v10

    move-object v14, v7

    move-object v15, v14

    move-object/from16 v16, v15

    move-object/from16 v17, v16

    move-object/from16 v18, v17

    move-object/from16 v19, v18

    move-object/from16 v20, v19

    move v5, v3

    :goto_1f
    if-eqz v5, :cond_9e

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v6

    packed-switch v6, :pswitch_data_a8

    invoke-static {v6}, Lt3p;->d(I)V

    return-object v7

    :pswitch_2c
    sget-object v6, Lxhk;->a:Lxhk;

    const/16 v8, 0x8

    invoke-interface {v1, v0, v8, v6}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v20, v6

    check-cast v20, Ljava/lang/String;

    or-int/lit16 v9, v9, 0x100

    goto :goto_1f

    :pswitch_3b
    const/4 v6, 0x7

    sget-object v8, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v19, v6

    check-cast v19, Ljava/lang/String;

    or-int/lit16 v9, v9, 0x80

    goto :goto_1f

    :pswitch_49
    const/4 v6, 0x6

    sget-object v8, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v18, v6

    check-cast v18, Ljava/lang/String;

    or-int/lit8 v9, v9, 0x40

    goto :goto_1f

    :pswitch_57
    const/4 v6, 0x5

    sget-object v8, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v17, v6

    check-cast v17, Ljava/lang/String;

    or-int/lit8 v9, v9, 0x20

    goto :goto_1f

    :pswitch_65
    const/4 v6, 0x4

    aget-object v8, v2, v6

    invoke-interface {v8}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v16, v6

    check-cast v16, Lboc;

    or-int/lit8 v9, v9, 0x10

    goto :goto_1f

    :pswitch_79
    const/4 v6, 0x3

    sget-object v8, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object v15, v6

    check-cast v15, Ljava/lang/String;

    or-int/lit8 v9, v9, 0x8

    goto :goto_1f

    :pswitch_86
    const/4 v6, 0x2

    invoke-interface {v1, v0, v6}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v14

    or-int/lit8 v9, v9, 0x4

    goto :goto_1f

    :pswitch_8e
    invoke-interface {v1, v0, v3}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v12

    or-int/lit8 v9, v9, 0x2

    goto :goto_1f

    :pswitch_95
    invoke-interface {v1, v0, v4}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v10

    or-int/lit8 v9, v9, 0x1

    goto :goto_1f

    :pswitch_9c
    move v5, v4

    goto :goto_1f

    :cond_9e
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v8, Lrpc;

    invoke-direct/range {v8 .. v20}, Lrpc;-><init>(IJJLjava/lang/String;Ljava/lang/String;Lboc;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v8

    nop

    :pswitch_data_a8
    .packed-switch -0x1
        :pswitch_9c
        :pswitch_95
        :pswitch_8e
        :pswitch_86
        :pswitch_79
        :pswitch_65
        :pswitch_57
        :pswitch_49
        :pswitch_3b
        :pswitch_2c
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lppc;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 14

    check-cast p2, Lrpc;

    sget-object p0, Lppc;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lrpc;->j:[Ll4c;

    iget-wide v1, p2, Lrpc;->a:J

    iget-object v3, p2, Lrpc;->i:Ljava/lang/String;

    iget-object v4, p2, Lrpc;->h:Ljava/lang/String;

    iget-object v5, p2, Lrpc;->g:Ljava/lang/String;

    iget-object v6, p2, Lrpc;->f:Ljava/lang/String;

    iget-object v7, p2, Lrpc;->e:Lboc;

    iget-object v8, p2, Lrpc;->d:Ljava/lang/String;

    const/4 v9, 0x0

    invoke-interface {p1, p0, v9, v1, v2}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    const/4 v1, 0x1

    iget-wide v9, p2, Lrpc;->b:J

    invoke-interface {p1, p0, v1, v9, v10}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    const/4 v1, 0x2

    iget-object p2, p2, Lrpc;->c:Ljava/lang/String;

    invoke-interface {p1, p0, v1, p2}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_30

    if-eqz v8, :cond_36

    :cond_30
    sget-object p2, Lxhk;->a:Lxhk;

    const/4 v1, 0x3

    invoke-interface {p1, p0, v1, p2, v8}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_36
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_3e

    if-eqz v7, :cond_4a

    :cond_3e
    const/4 p2, 0x4

    aget-object v0, v0, p2

    invoke-interface {v0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-interface {p1, p0, p2, v0, v7}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_4a
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_52

    if-eqz v6, :cond_58

    :cond_52
    sget-object p2, Lxhk;->a:Lxhk;

    const/4 v0, 0x5

    invoke-interface {p1, p0, v0, p2, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_58
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_60

    if-eqz v5, :cond_66

    :cond_60
    sget-object p2, Lxhk;->a:Lxhk;

    const/4 v0, 0x6

    invoke-interface {p1, p0, v0, p2, v5}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_66
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_6e

    if-eqz v4, :cond_74

    :cond_6e
    sget-object p2, Lxhk;->a:Lxhk;

    const/4 v0, 0x7

    invoke-interface {p1, p0, v0, p2, v4}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_74
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_7c

    if-eqz v3, :cond_83

    :cond_7c
    sget-object p2, Lxhk;->a:Lxhk;

    const/16 v0, 0x8

    invoke-interface {p1, p0, v0, p2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_83
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
