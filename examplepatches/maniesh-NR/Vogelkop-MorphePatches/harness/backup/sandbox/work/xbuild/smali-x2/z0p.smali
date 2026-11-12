.class public final Lz0p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lz0p;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lz0p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lz0p;->a:Lz0p;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.analytics.SDKInitializeEvent"

    const/4 v3, 0x7

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "status"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "duration"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "reason"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "medId"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "medSdkVer"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "medACN"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "medAVer"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lz0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 7

    sget-object p0, Lxhk;->a:Lxhk;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    const/4 v3, 0x7

    new-array v3, v3, [Lkotlinx/serialization/KSerializer;

    sget-object v4, Lecb;->a:Lecb;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const/4 v5, 0x2

    aput-object v4, v3, v5

    const/4 v4, 0x3

    aput-object v0, v3, v4

    const/4 v0, 0x4

    aput-object v1, v3, v0

    const/4 v0, 0x5

    aput-object v2, v3, v0

    const/4 v0, 0x6

    aput-object p0, v3, v0

    return-object v3
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 15

    sget-object p0, Lz0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    move v3, v0

    move v6, v1

    move v7, v6

    move v9, v7

    move v11, v9

    move-object v5, v2

    move-object v8, v5

    move-object v10, v8

    move-object v12, v10

    :goto_12
    if-eqz v3, :cond_6b

    invoke-interface {p1, p0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v4

    packed-switch v4, :pswitch_data_74

    invoke-static {v4}, Lt3p;->d(I)V

    return-object v2

    :pswitch_1f
    sget-object v4, Lxhk;->a:Lxhk;

    const/4 v12, 0x6

    invoke-interface {p1, p0, v12, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Ljava/lang/String;

    or-int/lit8 v6, v6, 0x40

    goto :goto_12

    :pswitch_2c
    sget-object v4, Lxhk;->a:Lxhk;

    const/4 v10, 0x5

    invoke-interface {p1, p0, v10, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Ljava/lang/String;

    or-int/lit8 v6, v6, 0x20

    goto :goto_12

    :pswitch_39
    sget-object v4, Lxhk;->a:Lxhk;

    const/4 v8, 0x4

    invoke-interface {p1, p0, v8, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Ljava/lang/String;

    or-int/lit8 v6, v6, 0x10

    goto :goto_12

    :pswitch_46
    sget-object v4, Lxhk;->a:Lxhk;

    const/4 v5, 0x3

    invoke-interface {p1, p0, v5, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Ljava/lang/String;

    or-int/lit8 v6, v6, 0x8

    goto :goto_12

    :pswitch_53
    const/4 v4, 0x2

    invoke-interface {p1, p0, v4}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v11

    or-int/lit8 v6, v6, 0x4

    goto :goto_12

    :pswitch_5b
    invoke-interface {p1, p0, v0}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v9

    or-int/lit8 v6, v6, 0x2

    goto :goto_12

    :pswitch_62
    invoke-interface {p1, p0, v1}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v7

    or-int/lit8 v6, v6, 0x1

    goto :goto_12

    :pswitch_69
    move v3, v1

    goto :goto_12

    :cond_6b
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v4, Lc1p;

    invoke-direct/range {v4 .. v12}, Lc1p;-><init>(Ljava/lang/String;IILjava/lang/String;ILjava/lang/String;ILjava/lang/String;)V

    return-object v4

    :pswitch_data_74
    .packed-switch -0x1
        :pswitch_69
        :pswitch_62
        :pswitch_5b
        :pswitch_53
        :pswitch_46
        :pswitch_39
        :pswitch_2c
        :pswitch_1f
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lz0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 7

    check-cast p2, Lc1p;

    sget-object p0, Lz0p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    iget v0, p2, Lc1p;->g:I

    const/4 v1, 0x0

    invoke-interface {p1, v1, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Lc1p;->h:I

    const/4 v1, 0x1

    invoke-interface {p1, v1, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Lc1p;->i:I

    const/4 v1, 0x2

    invoke-interface {p1, v1, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_33

    iget-object v0, p2, Lc1p;->j:Ljava/lang/String;

    sget-object v2, Lfcp;->c:Lc30;

    if-eqz v2, :cond_2c

    sget-object v2, Lkn;->a:[Lkn;

    const-string v2, "admob"

    goto :goto_2d

    :cond_2c
    move-object v2, v1

    :goto_2d
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3b

    :cond_33
    sget-object v0, Lxhk;->a:Lxhk;

    iget-object v2, p2, Lc1p;->j:Ljava/lang/String;

    const/4 v3, 0x3

    invoke-interface {p1, p0, v3, v0, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_3b
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_51

    iget-object v0, p2, Lc1p;->k:Ljava/lang/String;

    sget-object v2, Lfcp;->c:Lc30;

    if-eqz v2, :cond_4a

    iget-object v2, v2, Lc30;->b:Ljava/lang/String;

    goto :goto_4b

    :cond_4a
    move-object v2, v1

    :goto_4b
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_59

    :cond_51
    sget-object v0, Lxhk;->a:Lxhk;

    iget-object v2, p2, Lc1p;->k:Ljava/lang/String;

    const/4 v3, 0x4

    invoke-interface {p1, p0, v3, v0, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_59
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_73

    iget-object v0, p2, Lc1p;->l:Ljava/lang/String;

    sget-object v2, Lfcp;->c:Lc30;

    if-eqz v2, :cond_6c

    const-class v2, Lcom/opera/ads/mediation/admob/OperaMediationAdapter;

    invoke-virtual {v2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v2

    goto :goto_6d

    :cond_6c
    move-object v2, v1

    :goto_6d
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_7b

    :cond_73
    sget-object v0, Lxhk;->a:Lxhk;

    iget-object v2, p2, Lc1p;->l:Ljava/lang/String;

    const/4 v3, 0x5

    invoke-interface {p1, p0, v3, v0, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_7b
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_8f

    iget-object v0, p2, Lc1p;->m:Ljava/lang/String;

    sget-object v2, Lfcp;->c:Lc30;

    if-eqz v2, :cond_89

    const-string v1, "2.14.0.0"

    :cond_89
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_97

    :cond_8f
    sget-object v0, Lxhk;->a:Lxhk;

    iget-object p2, p2, Lc1p;->m:Ljava/lang/String;

    const/4 v1, 0x6

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_97
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
