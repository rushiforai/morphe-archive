.class public final Lw0p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lw0p;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lw0p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lw0p;->a:Lw0p;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.data.ImpObject.Video"

    const/16 v3, 0xd

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "mimes"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "protocols"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "w"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "h"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "placement"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "linearity"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "skip"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "playbackmethod"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "playbackend"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "delivery"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "pos"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "api"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "companiontype"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lw0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 15

    sget-object p0, Ly0p;->n:[Lkotlinx/serialization/KSerializer;

    const/4 v0, 0x0

    aget-object v1, p0, v0

    const/4 v2, 0x1

    aget-object v3, p0, v2

    sget-object v4, Lecb;->a:Lecb;

    const/4 v5, 0x7

    aget-object v6, p0, v5

    const/16 v7, 0x9

    aget-object v8, p0, v7

    invoke-static {v4}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v9

    const/16 v10, 0xb

    aget-object v11, p0, v10

    const/16 v12, 0xc

    aget-object p0, p0, v12

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    const/16 v13, 0xd

    new-array v13, v13, [Lkotlinx/serialization/KSerializer;

    aput-object v1, v13, v0

    aput-object v3, v13, v2

    const/4 v0, 0x2

    aput-object v4, v13, v0

    const/4 v0, 0x3

    aput-object v4, v13, v0

    const/4 v0, 0x4

    aput-object v4, v13, v0

    const/4 v0, 0x5

    aput-object v4, v13, v0

    const/4 v0, 0x6

    aput-object v4, v13, v0

    aput-object v6, v13, v5

    const/16 v0, 0x8

    aput-object v4, v13, v0

    aput-object v8, v13, v7

    const/16 v0, 0xa

    aput-object v9, v13, v0

    aput-object v11, v13, v10

    aput-object p0, v13, v12

    return-object v13
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 24

    sget-object v0, Lw0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    sget-object v2, Ly0p;->n:[Lkotlinx/serialization/KSerializer;

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    move v6, v3

    move v8, v4

    move v11, v8

    move v12, v11

    move v13, v12

    move v14, v13

    move v15, v14

    move/from16 v17, v15

    move-object v9, v5

    move-object v10, v9

    move-object/from16 v16, v10

    move-object/from16 v18, v16

    move-object/from16 v19, v18

    move-object/from16 v20, v19

    move-object/from16 v21, v20

    :goto_22
    if-eqz v6, :cond_c7

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v7

    packed-switch v7, :pswitch_data_d0

    invoke-static {v7}, Lt3p;->d(I)V

    return-object v5

    :pswitch_2f
    const/16 v7, 0xc

    aget-object v5, v2, v7

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v21, v5

    check-cast v21, Ljava/util/List;

    or-int/lit16 v8, v8, 0x1000

    :goto_3d
    const/4 v5, 0x0

    goto :goto_22

    :pswitch_3f
    const/16 v5, 0xb

    aget-object v7, v2, v5

    invoke-interface {v1, v0, v5, v7}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v20, v5

    check-cast v20, Ljava/util/List;

    or-int/lit16 v8, v8, 0x800

    goto :goto_3d

    :pswitch_4e
    sget-object v5, Lecb;->a:Lecb;

    const/16 v7, 0xa

    invoke-interface {v1, v0, v7, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v19, v5

    check-cast v19, Ljava/lang/Integer;

    or-int/lit16 v8, v8, 0x400

    goto :goto_3d

    :pswitch_5d
    const/16 v5, 0x9

    aget-object v7, v2, v5

    invoke-interface {v1, v0, v5, v7}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v18, v5

    check-cast v18, Ljava/util/List;

    or-int/lit16 v8, v8, 0x200

    goto :goto_3d

    :pswitch_6c
    const/16 v5, 0x8

    invoke-interface {v1, v0, v5}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v17

    or-int/lit16 v8, v8, 0x100

    goto :goto_3d

    :pswitch_75
    const/4 v5, 0x7

    aget-object v7, v2, v5

    invoke-interface {v1, v0, v5, v7}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object/from16 v16, v5

    check-cast v16, Ljava/util/List;

    or-int/lit16 v8, v8, 0x80

    goto :goto_3d

    :pswitch_83
    const/4 v5, 0x6

    invoke-interface {v1, v0, v5}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v15

    or-int/lit8 v8, v8, 0x40

    goto :goto_3d

    :pswitch_8b
    const/4 v5, 0x5

    invoke-interface {v1, v0, v5}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v14

    or-int/lit8 v8, v8, 0x20

    goto :goto_3d

    :pswitch_93
    const/4 v5, 0x4

    invoke-interface {v1, v0, v5}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v13

    or-int/lit8 v8, v8, 0x10

    goto :goto_3d

    :pswitch_9b
    const/4 v5, 0x3

    invoke-interface {v1, v0, v5}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v12

    or-int/lit8 v8, v8, 0x8

    goto :goto_3d

    :pswitch_a3
    const/4 v5, 0x2

    invoke-interface {v1, v0, v5}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v11

    or-int/lit8 v8, v8, 0x4

    goto :goto_3d

    :pswitch_ab
    aget-object v5, v2, v3

    invoke-interface {v1, v0, v3, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Ljava/util/List;

    or-int/lit8 v8, v8, 0x2

    goto :goto_3d

    :pswitch_b7
    aget-object v5, v2, v4

    invoke-interface {v1, v0, v4, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Ljava/util/List;

    or-int/lit8 v8, v8, 0x1

    goto/16 :goto_3d

    :pswitch_c4
    move v6, v4

    goto/16 :goto_22

    :cond_c7
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v7, Ly0p;

    invoke-direct/range {v7 .. v21}, Ly0p;-><init>(ILjava/util/List;Ljava/util/List;IIIIILjava/util/List;ILjava/util/List;Ljava/lang/Integer;Ljava/util/List;Ljava/util/List;)V

    return-object v7

    :pswitch_data_d0
    .packed-switch -0x1
        :pswitch_c4
        :pswitch_b7
        :pswitch_ab
        :pswitch_a3
        :pswitch_9b
        :pswitch_93
        :pswitch_8b
        :pswitch_83
        :pswitch_75
        :pswitch_6c
        :pswitch_5d
        :pswitch_4e
        :pswitch_3f
        :pswitch_2f
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lw0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 11

    check-cast p2, Ly0p;

    sget-object p0, Lw0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Ly0p;->n:[Lkotlinx/serialization/KSerializer;

    const/4 v1, 0x0

    aget-object v2, v0, v1

    iget-object v3, p2, Ly0p;->a:Ljava/util/List;

    iget-object v4, p2, Ly0p;->j:Ljava/util/List;

    iget v5, p2, Ly0p;->i:I

    iget v6, p2, Ly0p;->f:I

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    const/4 v1, 0x1

    aget-object v2, v0, v1

    iget-object v3, p2, Ly0p;->b:Ljava/util/List;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    iget v2, p2, Ly0p;->c:I

    const/4 v3, 0x2

    invoke-interface {p1, v3, v2, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v2, p2, Ly0p;->d:I

    const/4 v7, 0x3

    invoke-interface {p1, v7, v2, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v2, p2, Ly0p;->e:I

    const/4 v7, 0x4

    invoke-interface {p1, v7, v2, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v2

    if-nez v2, :cond_3a

    if-eq v6, v1, :cond_3e

    :cond_3a
    const/4 v2, 0x5

    invoke-interface {p1, v2, v6, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_3e
    iget v2, p2, Ly0p;->g:I

    const/4 v6, 0x6

    invoke-interface {p1, v6, v2, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 v2, 0x7

    aget-object v6, v0, v2

    iget-object v7, p2, Ly0p;->h:Ljava/util/List;

    invoke-interface {p1, p0, v2, v6, v7}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v2

    if-nez v2, :cond_54

    if-eq v5, v1, :cond_59

    :cond_54
    const/16 v1, 0x8

    invoke-interface {p1, v1, v5, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_59
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_6d

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-static {v4, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_74

    :cond_6d
    const/16 v1, 0x9

    aget-object v2, v0, v1

    invoke-interface {p1, p0, v1, v2, v4}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_74
    sget-object v1, Lecb;->a:Lecb;

    iget-object v2, p2, Ly0p;->k:Ljava/lang/Integer;

    const/16 v3, 0xa

    invoke-interface {p1, p0, v3, v1, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    const/16 v1, 0xb

    aget-object v2, v0, v1

    iget-object v3, p2, Ly0p;->l:Ljava/util/List;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    const/16 v1, 0xc

    aget-object v0, v0, v1

    iget-object p2, p2, Ly0p;->m:Ljava/util/List;

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
