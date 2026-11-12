.class public final Luyo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Luyo;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Luyo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Luyo;->a:Luyo;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.data.DeviceObject.DeviceExt"

    const/16 v3, 0xb

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "ifa_type"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "osvi"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "gmsavail"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "battlevel"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "battstatus"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "vollevel"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "mute"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "sdavail"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "sbt"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "osbdt"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "romf"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Luyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 4

    const/16 p0, 0xb

    new-array p0, p0, [Lkotlinx/serialization/KSerializer;

    sget-object v0, Lxhk;->a:Lxhk;

    const/4 v1, 0x0

    aput-object v0, p0, v1

    sget-object v1, Lecb;->a:Lecb;

    const/4 v2, 0x1

    aput-object v1, p0, v2

    const/4 v2, 0x2

    aput-object v1, p0, v2

    const/4 v2, 0x3

    aput-object v1, p0, v2

    const/4 v2, 0x4

    aput-object v1, p0, v2

    const/4 v2, 0x5

    aput-object v1, p0, v2

    const/4 v2, 0x6

    aput-object v1, p0, v2

    const/4 v2, 0x7

    aput-object v1, p0, v2

    sget-object v1, Lh1d;->a:Lh1d;

    const/16 v2, 0x8

    aput-object v1, p0, v2

    const/16 v2, 0x9

    aput-object v1, p0, v2

    const/16 v1, 0xa

    aput-object v0, p0, v1

    return-object p0
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 24

    sget-object v0, Luyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    const-wide/16 v5, 0x0

    move v8, v3

    move v10, v8

    move v11, v10

    move v12, v11

    move v13, v12

    move v14, v13

    move v15, v14

    move/from16 v16, v15

    move-object v9, v4

    move-object/from16 v21, v9

    move-wide/from16 v17, v5

    move-wide/from16 v19, v17

    move v5, v2

    :goto_1e
    if-eqz v5, :cond_86

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v6

    packed-switch v6, :pswitch_data_90

    invoke-static {v6}, Lt3p;->d(I)V

    return-object v4

    :pswitch_2b
    const/16 v6, 0xa

    invoke-interface {v1, v0, v6}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v21

    or-int/lit16 v8, v8, 0x400

    goto :goto_1e

    :pswitch_34
    const/16 v6, 0x9

    invoke-interface {v1, v0, v6}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v19

    or-int/lit16 v8, v8, 0x200

    goto :goto_1e

    :pswitch_3d
    const/16 v6, 0x8

    invoke-interface {v1, v0, v6}, Loh5;->g(Lkotlinx/serialization/descriptors/SerialDescriptor;I)J

    move-result-wide v17

    or-int/lit16 v8, v8, 0x100

    goto :goto_1e

    :pswitch_46
    const/4 v6, 0x7

    invoke-interface {v1, v0, v6}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v16

    or-int/lit16 v8, v8, 0x80

    goto :goto_1e

    :pswitch_4e
    const/4 v6, 0x6

    invoke-interface {v1, v0, v6}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v15

    or-int/lit8 v8, v8, 0x40

    goto :goto_1e

    :pswitch_56
    const/4 v6, 0x5

    invoke-interface {v1, v0, v6}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v14

    or-int/lit8 v8, v8, 0x20

    goto :goto_1e

    :pswitch_5e
    const/4 v6, 0x4

    invoke-interface {v1, v0, v6}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v13

    or-int/lit8 v8, v8, 0x10

    goto :goto_1e

    :pswitch_66
    const/4 v6, 0x3

    invoke-interface {v1, v0, v6}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v12

    or-int/lit8 v8, v8, 0x8

    goto :goto_1e

    :pswitch_6e
    const/4 v6, 0x2

    invoke-interface {v1, v0, v6}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v11

    or-int/lit8 v8, v8, 0x4

    goto :goto_1e

    :pswitch_76
    invoke-interface {v1, v0, v2}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v10

    or-int/lit8 v8, v8, 0x2

    goto :goto_1e

    :pswitch_7d
    invoke-interface {v1, v0, v3}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v9

    or-int/lit8 v8, v8, 0x1

    goto :goto_1e

    :pswitch_84
    move v5, v3

    goto :goto_1e

    :cond_86
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v7, Lwyo;

    invoke-direct/range {v7 .. v21}, Lwyo;-><init>(ILjava/lang/String;IIIIIIIJJLjava/lang/String;)V

    return-object v7

    nop

    :pswitch_data_90
    .packed-switch -0x1
        :pswitch_84
        :pswitch_7d
        :pswitch_76
        :pswitch_6e
        :pswitch_66
        :pswitch_5e
        :pswitch_56
        :pswitch_4e
        :pswitch_46
        :pswitch_3d
        :pswitch_34
        :pswitch_2b
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Luyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 6

    check-cast p2, Lwyo;

    sget-object p0, Luyo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_18

    iget-object v0, p2, Lwyo;->a:Ljava/lang/String;

    const-string v1, "aaid"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    :cond_18
    iget-object v0, p2, Lwyo;->a:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-interface {p1, p0, v1, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_1e
    iget v0, p2, Lwyo;->b:I

    const/4 v1, 0x1

    invoke-interface {p1, v1, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Lwyo;->c:I

    const/4 v1, 0x2

    invoke-interface {p1, v1, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Lwyo;->d:I

    const/4 v1, 0x3

    invoke-interface {p1, v1, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Lwyo;->e:I

    const/4 v1, 0x4

    invoke-interface {p1, v1, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Lwyo;->f:I

    const/4 v1, 0x5

    invoke-interface {p1, v1, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Lwyo;->g:I

    const/4 v1, 0x6

    invoke-interface {p1, v1, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Lwyo;->h:I

    const/4 v1, 0x7

    invoke-interface {p1, v1, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget-wide v0, p2, Lwyo;->i:J

    const/16 v2, 0x8

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    iget-wide v0, p2, Lwyo;->j:J

    const/16 v2, 0x9

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->F(Lkotlinx/serialization/descriptors/SerialDescriptor;IJ)V

    iget-object p2, p2, Lwyo;->k:Ljava/lang/String;

    const/16 v0, 0xa

    invoke-interface {p1, p0, v0, p2}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
