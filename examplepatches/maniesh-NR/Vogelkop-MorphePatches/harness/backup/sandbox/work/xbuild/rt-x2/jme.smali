.class public final synthetic Ljme;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Ljme;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ljme;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ljme;->a:Ljme;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.android.live_score.football.data.network.model.NetworkFootballEvent.LiveScoreEventTime"

    const/16 v3, 0xa

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "start"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "first_half"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "first_half_extended"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "second_half"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "second_half_extended"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "first_half_extra"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "first_half_extra_extended"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "second_half_extra"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "second_half_extra_extended"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "current"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Ljme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 12

    sget-object p0, Lh1d;->a:Lh1d;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    sget-object v0, Lecb;->a:Lecb;

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v3

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v4

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v5

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v6

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v7

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v8

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    const/16 v9, 0xa

    new-array v9, v9, [Lkotlinx/serialization/KSerializer;

    const/4 v10, 0x0

    aput-object p0, v9, v10

    const/4 p0, 0x1

    aput-object v1, v9, p0

    const/4 p0, 0x2

    aput-object v2, v9, p0

    const/4 p0, 0x3

    aput-object v3, v9, p0

    const/4 p0, 0x4

    aput-object v4, v9, p0

    const/4 p0, 0x5

    aput-object v5, v9, p0

    const/4 p0, 0x6

    aput-object v6, v9, p0

    const/4 p0, 0x7

    aput-object v7, v9, p0

    const/16 p0, 0x8

    aput-object v8, v9, p0

    const/16 p0, 0x9

    aput-object v0, v9, p0

    return-object v9
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 20

    sget-object v0, Ljme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    move v5, v2

    move v7, v3

    move-object v8, v4

    move-object v9, v8

    move-object v10, v9

    move-object v11, v10

    move-object v12, v11

    move-object v13, v12

    move-object v14, v13

    move-object v15, v14

    move-object/from16 v16, v15

    move-object/from16 v17, v16

    :goto_19
    if-eqz v5, :cond_ae

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v6

    packed-switch v6, :pswitch_data_b8

    invoke-static {v6}, Lt3p;->d(I)V

    return-object v4

    :pswitch_26
    const/16 v6, 0x9

    sget-object v4, Lecb;->a:Lecb;

    invoke-interface {v1, v0, v6, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v17, v4

    check-cast v17, Ljava/lang/Integer;

    or-int/lit16 v7, v7, 0x200

    :goto_34
    const/4 v4, 0x0

    goto :goto_19

    :pswitch_36
    sget-object v4, Lecb;->a:Lecb;

    const/16 v6, 0x8

    invoke-interface {v1, v0, v6, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v16, v4

    check-cast v16, Ljava/lang/Integer;

    or-int/lit16 v7, v7, 0x100

    goto :goto_34

    :pswitch_45
    const/4 v4, 0x7

    sget-object v6, Lecb;->a:Lecb;

    invoke-interface {v1, v0, v4, v6}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v15, v4

    check-cast v15, Ljava/lang/Integer;

    or-int/lit16 v7, v7, 0x80

    goto :goto_34

    :pswitch_52
    const/4 v4, 0x6

    sget-object v6, Lecb;->a:Lecb;

    invoke-interface {v1, v0, v4, v6}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v14, v4

    check-cast v14, Ljava/lang/Integer;

    or-int/lit8 v7, v7, 0x40

    goto :goto_34

    :pswitch_5f
    const/4 v4, 0x5

    sget-object v6, Lecb;->a:Lecb;

    invoke-interface {v1, v0, v4, v6}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Ljava/lang/Integer;

    or-int/lit8 v7, v7, 0x20

    goto :goto_34

    :pswitch_6c
    sget-object v4, Lecb;->a:Lecb;

    const/4 v6, 0x4

    invoke-interface {v1, v0, v6, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Ljava/lang/Integer;

    or-int/lit8 v7, v7, 0x10

    goto :goto_34

    :pswitch_79
    const/4 v4, 0x3

    sget-object v6, Lecb;->a:Lecb;

    invoke-interface {v1, v0, v4, v6}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Ljava/lang/Integer;

    or-int/lit8 v7, v7, 0x8

    goto :goto_34

    :pswitch_86
    sget-object v4, Lecb;->a:Lecb;

    const/4 v6, 0x2

    invoke-interface {v1, v0, v6, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Ljava/lang/Integer;

    or-int/lit8 v7, v7, 0x4

    goto :goto_34

    :pswitch_93
    sget-object v4, Lecb;->a:Lecb;

    invoke-interface {v1, v0, v2, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Ljava/lang/Integer;

    or-int/lit8 v7, v7, 0x2

    goto :goto_34

    :pswitch_9f
    sget-object v4, Lh1d;->a:Lh1d;

    invoke-interface {v1, v0, v3, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Ljava/lang/Long;

    or-int/lit8 v7, v7, 0x1

    goto :goto_34

    :pswitch_ab
    move v5, v3

    goto/16 :goto_19

    :cond_ae
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v6, Llme;

    invoke-direct/range {v6 .. v17}, Llme;-><init>(ILjava/lang/Long;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/Integer;)V

    return-object v6

    nop

    :pswitch_data_b8
    .packed-switch -0x1
        :pswitch_ab
        :pswitch_9f
        :pswitch_93
        :pswitch_86
        :pswitch_79
        :pswitch_6c
        :pswitch_5f
        :pswitch_52
        :pswitch_45
        :pswitch_36
        :pswitch_26
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Ljme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 6

    check-cast p2, Llme;

    sget-object p0, Ljme;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_12

    iget-object v0, p2, Llme;->a:Ljava/lang/Long;

    if-eqz v0, :cond_1a

    :cond_12
    sget-object v0, Lh1d;->a:Lh1d;

    iget-object v1, p2, Llme;->a:Ljava/lang/Long;

    const/4 v2, 0x0

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_1a
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_24

    iget-object v0, p2, Llme;->b:Ljava/lang/Integer;

    if-eqz v0, :cond_2c

    :cond_24
    sget-object v0, Lecb;->a:Lecb;

    iget-object v1, p2, Llme;->b:Ljava/lang/Integer;

    const/4 v2, 0x1

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_2c
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_36

    iget-object v0, p2, Llme;->c:Ljava/lang/Integer;

    if-eqz v0, :cond_3e

    :cond_36
    sget-object v0, Lecb;->a:Lecb;

    iget-object v1, p2, Llme;->c:Ljava/lang/Integer;

    const/4 v2, 0x2

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_3e
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_48

    iget-object v0, p2, Llme;->d:Ljava/lang/Integer;

    if-eqz v0, :cond_50

    :cond_48
    sget-object v0, Lecb;->a:Lecb;

    iget-object v1, p2, Llme;->d:Ljava/lang/Integer;

    const/4 v2, 0x3

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_50
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_5a

    iget-object v0, p2, Llme;->e:Ljava/lang/Integer;

    if-eqz v0, :cond_62

    :cond_5a
    sget-object v0, Lecb;->a:Lecb;

    iget-object v1, p2, Llme;->e:Ljava/lang/Integer;

    const/4 v2, 0x4

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_62
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_6c

    iget-object v0, p2, Llme;->f:Ljava/lang/Integer;

    if-eqz v0, :cond_74

    :cond_6c
    sget-object v0, Lecb;->a:Lecb;

    iget-object v1, p2, Llme;->f:Ljava/lang/Integer;

    const/4 v2, 0x5

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_74
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_7e

    iget-object v0, p2, Llme;->g:Ljava/lang/Integer;

    if-eqz v0, :cond_86

    :cond_7e
    sget-object v0, Lecb;->a:Lecb;

    iget-object v1, p2, Llme;->g:Ljava/lang/Integer;

    const/4 v2, 0x6

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_86
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_90

    iget-object v0, p2, Llme;->h:Ljava/lang/Integer;

    if-eqz v0, :cond_98

    :cond_90
    sget-object v0, Lecb;->a:Lecb;

    iget-object v1, p2, Llme;->h:Ljava/lang/Integer;

    const/4 v2, 0x7

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_98
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_a2

    iget-object v0, p2, Llme;->i:Ljava/lang/Integer;

    if-eqz v0, :cond_ab

    :cond_a2
    sget-object v0, Lecb;->a:Lecb;

    iget-object v1, p2, Llme;->i:Ljava/lang/Integer;

    const/16 v2, 0x8

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_ab
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_b5

    iget-object v0, p2, Llme;->j:Ljava/lang/Integer;

    if-eqz v0, :cond_be

    :cond_b5
    sget-object v0, Lecb;->a:Lecb;

    iget-object p2, p2, Llme;->j:Ljava/lang/Integer;

    const/16 v1, 0x9

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_be
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
