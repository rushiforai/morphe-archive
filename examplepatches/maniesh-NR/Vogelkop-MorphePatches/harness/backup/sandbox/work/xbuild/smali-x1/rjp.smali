.class public final Lrjp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lrjp;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lrjp;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lrjp;->a:Lrjp;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.analytics.ClickCoordinate"

    const/16 v3, 0xc

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "x0"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "y0"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "x"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "y"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "d"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "r"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "t"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "sw"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "sh"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "e"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ct"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ucd"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lrjp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 7

    sget-object p0, Lxap;->a:Lxap;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    sget-object v1, Lxhk;->a:Lxhk;

    invoke-static {v1}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    const/16 v2, 0xc

    new-array v2, v2, [Lkotlinx/serialization/KSerializer;

    sget-object v3, Lecb;->a:Lecb;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v4, 0x1

    aput-object v3, v2, v4

    const/4 v4, 0x2

    aput-object v3, v2, v4

    const/4 v4, 0x3

    aput-object v3, v2, v4

    sget-object v4, Lh1d;->a:Lh1d;

    const/4 v5, 0x4

    aput-object v4, v2, v5

    const/4 v5, 0x5

    aput-object p0, v2, v5

    const/4 p0, 0x6

    aput-object v0, v2, p0

    const/4 p0, 0x7

    aput-object v3, v2, p0

    const/16 p0, 0x8

    aput-object v3, v2, p0

    const/16 p0, 0x9

    aput-object v1, v2, p0

    sget-object p0, Lrn3;->a:Lrn3;

    const/16 v0, 0xa

    aput-object p0, v2, v0

    const/16 p0, 0xb

    aput-object v4, v2, p0

    return-object v2
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 25

    sget-object v0, Lrjp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    move v8, v3

    move v9, v8

    move v10, v9

    move v11, v10

    move v12, v11

    move/from16 v17, v12

    move/from16 v18, v17

    move/from16 v20, v18

    move-wide v13, v4

    move-wide/from16 v21, v13

    move-object v15, v6

    move-object/from16 v16, v15

    move-object/from16 v19, v16

    move v4, v2

    :goto_21
    if-eqz v4, :cond_a4

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v5

    packed-switch v5, :pswitch_data_ae

    invoke-static {v5}, Lt3p;->d(I)V

    return-object v6

    :pswitch_2e
    const/16 v5, 0xb

    invoke-interface {v1, v0, v5}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v21

    or-int/lit16 v8, v8, 0x800

    goto :goto_21

    :pswitch_37
    const/16 v5, 0xa

    invoke-interface {v1, v0, v5}, Loh5;->C(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z

    move-result v20

    or-int/lit16 v8, v8, 0x400

    goto :goto_21

    :pswitch_40
    sget-object v5, Lxhk;->a:Lxhk;

    const/16 v7, 0x9

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v19, v5

    check-cast v19, Ljava/lang/String;

    or-int/lit16 v8, v8, 0x200

    goto :goto_21

    :pswitch_4f
    const/16 v5, 0x8

    invoke-interface {v1, v0, v5}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v18

    or-int/lit16 v8, v8, 0x100

    goto :goto_21

    :pswitch_58
    const/4 v5, 0x7

    invoke-interface {v1, v0, v5}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v17

    or-int/lit16 v8, v8, 0x80

    goto :goto_21

    :pswitch_60
    sget-object v5, Lxap;->a:Lxap;

    const/4 v7, 0x6

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v16, v5

    check-cast v16, Lzap;

    or-int/lit8 v8, v8, 0x40

    goto :goto_21

    :pswitch_6e
    sget-object v5, Lxap;->a:Lxap;

    const/4 v7, 0x5

    invoke-interface {v1, v0, v7, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Lzap;

    or-int/lit8 v8, v8, 0x20

    goto :goto_21

    :pswitch_7b
    const/4 v5, 0x4

    invoke-interface {v1, v0, v5}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v13

    or-int/lit8 v8, v8, 0x10

    goto :goto_21

    :pswitch_83
    const/4 v5, 0x3

    invoke-interface {v1, v0, v5}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v12

    or-int/lit8 v8, v8, 0x8

    goto :goto_21

    :pswitch_8b
    const/4 v5, 0x2

    invoke-interface {v1, v0, v5}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v11

    or-int/lit8 v8, v8, 0x4

    goto :goto_21

    :pswitch_93
    invoke-interface {v1, v0, v2}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v10

    or-int/lit8 v8, v8, 0x2

    goto :goto_21

    :pswitch_9a
    invoke-interface {v1, v0, v3}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v9

    or-int/lit8 v8, v8, 0x1

    goto :goto_21

    :pswitch_a1
    move v4, v3

    goto/16 :goto_21

    :cond_a4
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v7, Lwjp;

    invoke-direct/range {v7 .. v22}, Lwjp;-><init>(IIIIIJLzap;Lzap;IILjava/lang/String;ZJ)V

    return-object v7

    nop

    :pswitch_data_ae
    .packed-switch -0x1
        :pswitch_a1
        :pswitch_9a
        :pswitch_93
        :pswitch_8b
        :pswitch_83
        :pswitch_7b
        :pswitch_6e
        :pswitch_60
        :pswitch_58
        :pswitch_4f
        :pswitch_40
        :pswitch_37
        :pswitch_2e
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lrjp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 8

    check-cast p2, Lwjp;

    sget-object p0, Lrjp;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    iget v0, p2, Lwjp;->a:I

    iget-object v1, p2, Lwjp;->j:Ljava/lang/String;

    iget-object v2, p2, Lwjp;->g:Lzap;

    const/4 v3, 0x0

    invoke-interface {p1, v3, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Lwjp;->b:I

    const/4 v3, 0x1

    invoke-interface {p1, v3, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Lwjp;->c:I

    const/4 v3, 0x2

    invoke-interface {p1, v3, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Lwjp;->d:I

    const/4 v3, 0x3

    invoke-interface {p1, v3, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget-wide v3, p2, Lwjp;->e:J

    const/4 v0, 0x4

    invoke-interface {p1, p0, v0, v3, v4}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    sget-object v0, Lxap;->a:Lxap;

    iget-object v3, p2, Lwjp;->f:Lzap;

    const/4 v4, 0x5

    invoke-interface {p1, p0, v4, v0, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v3

    if-nez v3, :cond_3a

    if-eqz v2, :cond_3e

    :cond_3a
    const/4 v3, 0x6

    invoke-interface {p1, p0, v3, v0, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_3e
    iget v0, p2, Lwjp;->h:I

    const/4 v2, 0x7

    invoke-interface {p1, v2, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Lwjp;->i:I

    const/16 v2, 0x8

    invoke-interface {p1, v2, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_53

    if-eqz v1, :cond_5a

    :cond_53
    sget-object v0, Lxhk;->a:Lxhk;

    const/16 v2, 0x9

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_5a
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_64

    iget-boolean v0, p2, Lwjp;->k:Z

    if-eqz v0, :cond_6b

    :cond_64
    iget-boolean v0, p2, Lwjp;->k:Z

    const/16 v1, 0xa

    invoke-interface {p1, p0, v1, v0}, Lph5;->y(Lkotlinx/serialization/descriptors/SerialDescriptor;IZ)V

    :cond_6b
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_79

    iget-wide v0, p2, Lwjp;->l:J

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-eqz v0, :cond_80

    :cond_79
    iget-wide v0, p2, Lwjp;->l:J

    const/16 p2, 0xb

    invoke-interface {p1, p0, p2, v0, v1}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    :cond_80
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
