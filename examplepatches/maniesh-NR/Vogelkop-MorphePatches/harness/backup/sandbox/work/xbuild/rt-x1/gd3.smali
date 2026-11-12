.class public final synthetic Lgd3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lgd3;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lgd3;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lgd3;->a:Lgd3;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.android.live_score.data.network.BettingModel.Odd"

    const/4 v3, 0x7

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "id"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "name"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "handicap_spread"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "value"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "old_value"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "delta"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "jump_url"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lgd3;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 5

    sget-object p0, Lxhk;->a:Lxhk;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    const/4 v2, 0x7

    new-array v2, v2, [Lkotlinx/serialization/KSerializer;

    const/4 v3, 0x0

    aput-object p0, v2, v3

    const/4 v3, 0x1

    aput-object p0, v2, v3

    const/4 p0, 0x2

    aput-object v0, v2, p0

    sget-object p0, Loe7;->a:Loe7;

    const/4 v0, 0x3

    aput-object p0, v2, v0

    const/4 v0, 0x4

    aput-object p0, v2, v0

    sget-object p0, Lecb;->a:Lecb;

    const/4 v0, 0x5

    aput-object p0, v2, v0

    const/4 p0, 0x6

    aput-object v1, v2, p0

    return-object v2
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 20

    sget-object v0, Lgd3;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    move v8, v3

    move/from16 v16, v8

    move-object v9, v4

    move-object v10, v9

    move-object v11, v10

    move-object/from16 v17, v11

    move-wide v12, v5

    move-wide v14, v12

    move v5, v2

    :goto_18
    if-eqz v5, :cond_68

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v6

    packed-switch v6, :pswitch_data_72

    invoke-static {v6}, Lt3p;->d(I)V

    return-object v4

    :pswitch_25
    const/4 v6, 0x6

    sget-object v7, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v6, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v17, v6

    check-cast v17, Ljava/lang/String;

    or-int/lit8 v8, v8, 0x40

    goto :goto_18

    :pswitch_33
    const/4 v6, 0x5

    invoke-interface {v1, v0, v6}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v16

    or-int/lit8 v8, v8, 0x20

    goto :goto_18

    :pswitch_3b
    const/4 v6, 0x4

    invoke-interface {v1, v0, v6}, Loh5;->E(Lkotlinx/serialization/descriptors/SerialDescriptor;I)D

    move-result-wide v14

    or-int/lit8 v8, v8, 0x10

    goto :goto_18

    :pswitch_43
    const/4 v6, 0x3

    invoke-interface {v1, v0, v6}, Loh5;->E(Lkotlinx/serialization/descriptors/SerialDescriptor;I)D

    move-result-wide v12

    or-int/lit8 v8, v8, 0x8

    goto :goto_18

    :pswitch_4b
    sget-object v6, Lxhk;->a:Lxhk;

    const/4 v7, 0x2

    invoke-interface {v1, v0, v7, v6}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object v11, v6

    check-cast v11, Ljava/lang/String;

    or-int/lit8 v8, v8, 0x4

    goto :goto_18

    :pswitch_58
    invoke-interface {v1, v0, v2}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v10

    or-int/lit8 v8, v8, 0x2

    goto :goto_18

    :pswitch_5f
    invoke-interface {v1, v0, v3}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v9

    or-int/lit8 v8, v8, 0x1

    goto :goto_18

    :pswitch_66
    move v5, v3

    goto :goto_18

    :cond_68
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v7, Lid3;

    invoke-direct/range {v7 .. v17}, Lid3;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;DDILjava/lang/String;)V

    return-object v7

    nop

    :pswitch_data_72
    .packed-switch -0x1
        :pswitch_66
        :pswitch_5f
        :pswitch_58
        :pswitch_4b
        :pswitch_43
        :pswitch_3b
        :pswitch_33
        :pswitch_25
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lgd3;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 7

    check-cast p2, Lid3;

    sget-object p0, Lgd3;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    iget-object v0, p2, Lid3;->a:Ljava/lang/String;

    iget-object v1, p2, Lid3;->g:Ljava/lang/String;

    iget-object v2, p2, Lid3;->c:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-interface {p1, p0, v3, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    const/4 v0, 0x1

    iget-object v3, p2, Lid3;->b:Ljava/lang/String;

    invoke-interface {p1, p0, v0, v3}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_20

    if-eqz v2, :cond_26

    :cond_20
    sget-object v0, Lxhk;->a:Lxhk;

    const/4 v3, 0x2

    invoke-interface {p1, p0, v3, v0, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_26
    const/4 v0, 0x3

    iget-wide v2, p2, Lid3;->d:D

    invoke-interface {p1, p0, v0, v2, v3}, Lph5;->D(Lkotlinx/serialization/descriptors/SerialDescriptor;ID)V

    const/4 v0, 0x4

    iget-wide v2, p2, Lid3;->e:D

    invoke-interface {p1, p0, v0, v2, v3}, Lph5;->D(Lkotlinx/serialization/descriptors/SerialDescriptor;ID)V

    const/4 v0, 0x5

    iget p2, p2, Lid3;->f:I

    invoke-interface {p1, v0, p2, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_40

    if-eqz v1, :cond_46

    :cond_40
    sget-object p2, Lxhk;->a:Lxhk;

    const/4 v0, 0x6

    invoke-interface {p1, p0, v0, p2, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_46
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
