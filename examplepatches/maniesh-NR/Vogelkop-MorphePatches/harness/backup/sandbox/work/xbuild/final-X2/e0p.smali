.class public final Le0p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Le0p;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Le0p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Le0p;->a:Le0p;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.data.ImpObject"

    const/16 v3, 0xd

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "id"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "banner"

    const/4 v3, 0x1

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "video"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "native"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "displaymanager"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "displaymanagerver"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "instl"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "tagid"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "clickbrowser"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "secure"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "rwdd"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "exp"

    invoke-virtual {v1, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ext"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Le0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 7

    sget-object p0, Lg0p;->a:Lg0p;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    sget-object v0, Lw0p;->a:Lw0p;

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    sget-object v1, Lt0p;->a:Lt0p;

    invoke-static {v1}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    sget-object v2, Lq0p;->a:Lq0p;

    invoke-static {v2}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/16 v3, 0xd

    new-array v3, v3, [Lkotlinx/serialization/KSerializer;

    sget-object v4, Lxhk;->a:Lxhk;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/4 v5, 0x1

    aput-object p0, v3, v5

    const/4 p0, 0x2

    aput-object v0, v3, p0

    const/4 p0, 0x3

    aput-object v1, v3, p0

    const/4 p0, 0x4

    aput-object v4, v3, p0

    const/4 p0, 0x5

    aput-object v4, v3, p0

    sget-object p0, Lecb;->a:Lecb;

    const/4 v0, 0x6

    aput-object p0, v3, v0

    const/4 v0, 0x7

    aput-object v4, v3, v0

    const/16 v0, 0x8

    aput-object p0, v3, v0

    const/16 v0, 0x9

    aput-object p0, v3, v0

    const/16 v0, 0xa

    aput-object p0, v3, v0

    const/16 v0, 0xb

    aput-object p0, v3, v0

    const/16 p0, 0xc

    aput-object v2, v3, p0

    return-object v3
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 23

    sget-object v0, Le0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    move-object/from16 v1, p1

    invoke-interface {v1, v0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    move v5, v2

    move v7, v3

    move v14, v7

    move/from16 v16, v14

    move/from16 v17, v16

    move/from16 v18, v17

    move/from16 v19, v18

    move-object v8, v4

    move-object v9, v8

    move-object v10, v9

    move-object v11, v10

    move-object v12, v11

    move-object v13, v12

    move-object v15, v13

    move-object/from16 v20, v15

    :goto_1f
    if-eqz v5, :cond_b0

    invoke-interface {v1, v0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v6

    packed-switch v6, :pswitch_data_ba

    invoke-static {v6}, Lt3p;->d(I)V

    return-object v4

    :pswitch_2c
    sget-object v6, Lq0p;->a:Lq0p;

    const/16 v4, 0xc

    invoke-interface {v1, v0, v4, v6}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v20, v4

    check-cast v20, Ls0p;

    or-int/lit16 v7, v7, 0x1000

    :goto_3a
    const/4 v4, 0x0

    goto :goto_1f

    :pswitch_3c
    const/16 v4, 0xb

    invoke-interface {v1, v0, v4}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v19

    or-int/lit16 v7, v7, 0x800

    goto :goto_3a

    :pswitch_45
    const/16 v4, 0xa

    invoke-interface {v1, v0, v4}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v18

    or-int/lit16 v7, v7, 0x400

    goto :goto_3a

    :pswitch_4e
    const/16 v4, 0x9

    invoke-interface {v1, v0, v4}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v17

    or-int/lit16 v7, v7, 0x200

    goto :goto_3a

    :pswitch_57
    const/16 v4, 0x8

    invoke-interface {v1, v0, v4}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v16

    or-int/lit16 v7, v7, 0x100

    goto :goto_3a

    :pswitch_60
    const/4 v4, 0x7

    invoke-interface {v1, v0, v4}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v15

    or-int/lit16 v7, v7, 0x80

    goto :goto_3a

    :pswitch_68
    const/4 v4, 0x6

    invoke-interface {v1, v0, v4}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v14

    or-int/lit8 v7, v7, 0x40

    goto :goto_3a

    :pswitch_70
    const/4 v4, 0x5

    invoke-interface {v1, v0, v4}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v13

    or-int/lit8 v7, v7, 0x20

    goto :goto_3a

    :pswitch_78
    const/4 v4, 0x4

    invoke-interface {v1, v0, v4}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v12

    or-int/lit8 v7, v7, 0x10

    goto :goto_3a

    :pswitch_80
    sget-object v4, Lt0p;->a:Lt0p;

    const/4 v6, 0x3

    invoke-interface {v1, v0, v6, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Lv0p;

    or-int/lit8 v7, v7, 0x8

    goto :goto_3a

    :pswitch_8d
    sget-object v4, Lw0p;->a:Lw0p;

    const/4 v6, 0x2

    invoke-interface {v1, v0, v6, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Ly0p;

    or-int/lit8 v7, v7, 0x4

    goto :goto_3a

    :pswitch_9a
    sget-object v4, Lg0p;->a:Lg0p;

    invoke-interface {v1, v0, v2, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Lk0p;

    or-int/lit8 v7, v7, 0x2

    goto :goto_3a

    :pswitch_a6
    invoke-interface {v1, v0, v3}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v8

    or-int/lit8 v7, v7, 0x1

    goto :goto_3a

    :pswitch_ad
    move v5, v3

    goto/16 :goto_1f

    :cond_b0
    invoke-interface {v1, v0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v6, Lj1p;

    invoke-direct/range {v6 .. v20}, Lj1p;-><init>(ILjava/lang/String;Lk0p;Ly0p;Lv0p;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IIIILs0p;)V

    return-object v6

    nop

    :pswitch_data_ba
    .packed-switch -0x1
        :pswitch_ad
        :pswitch_a6
        :pswitch_9a
        :pswitch_8d
        :pswitch_80
        :pswitch_78
        :pswitch_70
        :pswitch_68
        :pswitch_60
        :pswitch_57
        :pswitch_4e
        :pswitch_45
        :pswitch_3c
        :pswitch_2c
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Le0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 13

    check-cast p2, Lj1p;

    sget-object p0, Le0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    iget-object v0, p2, Lj1p;->a:Ljava/lang/String;

    iget v1, p2, Lj1p;->l:I

    iget v2, p2, Lj1p;->j:I

    iget v3, p2, Lj1p;->i:I

    iget-object v4, p2, Lj1p;->f:Ljava/lang/String;

    iget-object v5, p2, Lj1p;->e:Ljava/lang/String;

    iget-object v6, p2, Lj1p;->d:Lv0p;

    iget-object v7, p2, Lj1p;->c:Ly0p;

    iget-object v8, p2, Lj1p;->b:Lk0p;

    const/4 v9, 0x0

    invoke-interface {p1, p0, v9, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    const/4 v9, 0x1

    if-nez v0, :cond_27

    if-eqz v8, :cond_2c

    :cond_27
    sget-object v0, Lg0p;->a:Lg0p;

    invoke-interface {p1, p0, v9, v0, v8}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_2c
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_34

    if-eqz v7, :cond_3a

    :cond_34
    sget-object v0, Lw0p;->a:Lw0p;

    const/4 v8, 0x2

    invoke-interface {p1, p0, v8, v0, v7}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_3a
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_42

    if-eqz v6, :cond_48

    :cond_42
    sget-object v0, Lt0p;->a:Lt0p;

    const/4 v7, 0x3

    invoke-interface {p1, p0, v7, v0, v6}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_48
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_56

    const-string v0, "Opera"

    invoke-static {v5, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5a

    :cond_56
    const/4 v0, 0x4

    invoke-interface {p1, p0, v0, v5}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_5a
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_68

    const-string v0, "2.14.0"

    invoke-static {v4, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6c

    :cond_68
    const/4 v0, 0x5

    invoke-interface {p1, p0, v0, v4}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_6c
    iget v0, p2, Lj1p;->g:I

    const/4 v4, 0x6

    invoke-interface {p1, v4, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget-object v0, p2, Lj1p;->h:Ljava/lang/String;

    const/4 v4, 0x7

    invoke-interface {p1, p0, v4, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_80

    if-eq v3, v9, :cond_85

    :cond_80
    const/16 v0, 0x8

    invoke-interface {p1, v0, v3, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_85
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_8d

    if-eq v2, v9, :cond_92

    :cond_8d
    const/16 v0, 0x9

    invoke-interface {p1, v0, v2, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_92
    iget v0, p2, Lj1p;->k:I

    const/16 v2, 0xa

    invoke-interface {p1, v2, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_a3

    const/16 v0, 0xe10

    if-eq v1, v0, :cond_a8

    :cond_a3
    const/16 v0, 0xb

    invoke-interface {p1, v0, v1, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    :cond_a8
    sget-object v0, Lq0p;->a:Lq0p;

    iget-object p2, p2, Lj1p;->m:Ls0p;

    const/16 v1, 0xc

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
