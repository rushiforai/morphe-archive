.class public final synthetic Llpc;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Llpc;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Llpc;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Llpc;->a:Llpc;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.android.live_score.data.network.model.LiveScoreTeamWithCountry"

    const/4 v3, 0x7

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "team_id"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "name"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "short_name"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "gender"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "logo_url"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "country"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "continent"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Llpc;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 10

    sget-object p0, Lnpc;->h:[Ll4c;

    sget-object v0, Lxhk;->a:Lxhk;

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    const/4 v2, 0x3

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

    const/4 v6, 0x7

    new-array v6, v6, [Lkotlinx/serialization/KSerializer;

    sget-object v7, Lh1d;->a:Lh1d;

    const/4 v8, 0x0

    aput-object v7, v6, v8

    const/4 v7, 0x1

    aput-object v0, v6, v7

    const/4 v0, 0x2

    aput-object v1, v6, v0

    aput-object p0, v6, v2

    const/4 p0, 0x4

    aput-object v3, v6, p0

    const/4 p0, 0x5

    aput-object v4, v6, p0

    const/4 p0, 0x6

    aput-object v5, v6, p0

    return-object v6
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 20

    sget-object v0, Llpc;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Lnpc;->h:[Ll4c;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    const/4 v7, 0x0

    move v9, v4

    move-wide v10, v5

    move-object v12, v7

    move-object v13, v12

    move-object v14, v13

    move-object v15, v14

    move-object/from16 v16, v15

    move-object/from16 v17, v16

    move v5, v3

    :goto_1a
    if-eqz v5, :cond_80

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v6

    packed-switch v6, :pswitch_data_8a

    invoke-static {v6}, Lt3p;->d(I)V

    return-object v7

    :pswitch_27
    const/4 v6, 0x6

    sget-object v8, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v17, v6

    check-cast v17, Ljava/lang/String;

    or-int/lit8 v9, v9, 0x40

    goto :goto_1a

    :pswitch_35
    const/4 v6, 0x5

    sget-object v8, Lxhk;->a:Lxhk;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object/from16 v16, v6

    check-cast v16, Ljava/lang/String;

    or-int/lit8 v9, v9, 0x20

    goto :goto_1a

    :pswitch_43
    sget-object v6, Lxhk;->a:Lxhk;

    const/4 v8, 0x4

    invoke-interface {v1, v0, v8, v6}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object v15, v6

    check-cast v15, Ljava/lang/String;

    or-int/lit8 v9, v9, 0x10

    goto :goto_1a

    :pswitch_50
    const/4 v6, 0x3

    aget-object v8, v2, v6

    invoke-interface {v8}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1, v0, v6, v8}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object v14, v6

    check-cast v14, Lboc;

    or-int/lit8 v9, v9, 0x8

    goto :goto_1a

    :pswitch_63
    sget-object v6, Lxhk;->a:Lxhk;

    const/4 v8, 0x2

    invoke-interface {v1, v0, v8, v6}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    move-object v13, v6

    check-cast v13, Ljava/lang/String;

    or-int/lit8 v9, v9, 0x4

    goto :goto_1a

    :pswitch_70
    invoke-interface {v1, v0, v3}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v12

    or-int/lit8 v9, v9, 0x2

    goto :goto_1a

    :pswitch_77
    invoke-interface {v1, v0, v4}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v10

    or-int/lit8 v9, v9, 0x1

    goto :goto_1a

    :pswitch_7e
    move v5, v4

    goto :goto_1a

    :cond_80
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v8, Lnpc;

    invoke-direct/range {v8 .. v17}, Lnpc;-><init>(IJLjava/lang/String;Ljava/lang/String;Lboc;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-object v8

    nop

    :pswitch_data_8a
    .packed-switch -0x1
        :pswitch_7e
        :pswitch_77
        :pswitch_70
        :pswitch_63
        :pswitch_50
        :pswitch_43
        :pswitch_35
        :pswitch_27
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Llpc;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 12

    check-cast p2, Lnpc;

    sget-object p0, Llpc;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lnpc;->h:[Ll4c;

    iget-wide v1, p2, Lnpc;->a:J

    iget-object v3, p2, Lnpc;->g:Ljava/lang/String;

    iget-object v4, p2, Lnpc;->f:Ljava/lang/String;

    iget-object v5, p2, Lnpc;->e:Ljava/lang/String;

    iget-object v6, p2, Lnpc;->d:Lboc;

    iget-object v7, p2, Lnpc;->c:Ljava/lang/String;

    const/4 v8, 0x0

    invoke-interface {p1, p0, v8, v1, v2}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    const/4 v1, 0x1

    iget-object p2, p2, Lnpc;->b:Ljava/lang/String;

    invoke-interface {p1, p0, v1, p2}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_28

    if-eqz v7, :cond_2e

    :cond_28
    sget-object p2, Lxhk;->a:Lxhk;

    const/4 v1, 0x2

    invoke-interface {p1, p0, v1, p2, v7}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_2e
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_36

    if-eqz v6, :cond_42

    :cond_36
    const/4 p2, 0x3

    aget-object v0, v0, p2

    invoke-interface {v0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    invoke-interface {p1, p0, p2, v0, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_42
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_4a

    if-eqz v5, :cond_50

    :cond_4a
    sget-object p2, Lxhk;->a:Lxhk;

    const/4 v0, 0x4

    invoke-interface {p1, p0, v0, p2, v5}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_50
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_58

    if-eqz v4, :cond_5e

    :cond_58
    sget-object p2, Lxhk;->a:Lxhk;

    const/4 v0, 0x5

    invoke-interface {p1, p0, v0, p2, v4}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_5e
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_66

    if-eqz v3, :cond_6c

    :cond_66
    sget-object p2, Lxhk;->a:Lxhk;

    const/4 v0, 0x6

    invoke-interface {p1, p0, v0, p2, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_6c
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
