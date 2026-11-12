.class public final Lowo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lowo;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lowo;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lowo;->a:Lowo;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.data.BidRequestObject.SourceExt"

    const/4 v3, 0x7

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "omidpn"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "omidpv"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "mediationid"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "mediationsdkv"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "mediationasdkv"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "bidtokenmedid"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "bidtype"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lowo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 8

    sget-object p0, Lxhk;->a:Lxhk;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v3

    sget-object v4, Lecb;->a:Lecb;

    invoke-static {v4}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v4

    const/4 v5, 0x7

    new-array v5, v5, [Lkotlinx/serialization/KSerializer;

    const/4 v6, 0x0

    aput-object p0, v5, v6

    const/4 v6, 0x1

    aput-object p0, v5, v6

    const/4 p0, 0x2

    aput-object v0, v5, p0

    const/4 p0, 0x3

    aput-object v1, v5, p0

    const/4 p0, 0x4

    aput-object v2, v5, p0

    const/4 p0, 0x5

    aput-object v3, v5, p0

    const/4 p0, 0x6

    aput-object v4, v5, p0

    return-object v5
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 15

    sget-object p0, Lowo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    move v3, v0

    move v5, v1

    move-object v6, v2

    move-object v7, v6

    move-object v8, v7

    move-object v9, v8

    move-object v10, v9

    move-object v11, v10

    move-object v12, v11

    :goto_12
    if-eqz v3, :cond_70

    invoke-interface {p1, p0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v4

    packed-switch v4, :pswitch_data_7a

    invoke-static {v4}, Lt3p;->d(I)V

    return-object v2

    :pswitch_1f
    sget-object v4, Lecb;->a:Lecb;

    const/4 v12, 0x6

    invoke-interface {p1, p0, v12, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v12, v4

    check-cast v12, Ljava/lang/Integer;

    or-int/lit8 v5, v5, 0x40

    goto :goto_12

    :pswitch_2c
    sget-object v4, Lxhk;->a:Lxhk;

    const/4 v11, 0x5

    invoke-interface {p1, p0, v11, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v11, v4

    check-cast v11, Ljava/lang/String;

    or-int/lit8 v5, v5, 0x20

    goto :goto_12

    :pswitch_39
    sget-object v4, Lxhk;->a:Lxhk;

    const/4 v10, 0x4

    invoke-interface {p1, p0, v10, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Ljava/lang/String;

    or-int/lit8 v5, v5, 0x10

    goto :goto_12

    :pswitch_46
    sget-object v4, Lxhk;->a:Lxhk;

    const/4 v9, 0x3

    invoke-interface {p1, p0, v9, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Ljava/lang/String;

    or-int/lit8 v5, v5, 0x8

    goto :goto_12

    :pswitch_53
    sget-object v4, Lxhk;->a:Lxhk;

    const/4 v8, 0x2

    invoke-interface {p1, p0, v8, v4}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Ljava/lang/String;

    or-int/lit8 v5, v5, 0x4

    goto :goto_12

    :pswitch_60
    invoke-interface {p1, p0, v0}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v7

    or-int/lit8 v5, v5, 0x2

    goto :goto_12

    :pswitch_67
    invoke-interface {p1, p0, v1}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v6

    or-int/lit8 v5, v5, 0x1

    goto :goto_12

    :pswitch_6e
    move v3, v1

    goto :goto_12

    :cond_70
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v4, Lqwo;

    invoke-direct/range {v4 .. v12}, Lqwo;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V

    return-object v4

    nop

    :pswitch_data_7a
    .packed-switch -0x1
        :pswitch_6e
        :pswitch_67
        :pswitch_60
        :pswitch_53
        :pswitch_46
        :pswitch_39
        :pswitch_2c
        :pswitch_1f
    .end packed-switch
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lowo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 7

    check-cast p2, Lqwo;

    sget-object p0, Lowo;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_18

    iget-object v0, p2, Lqwo;->a:Ljava/lang/String;

    const-string v1, "Opera"

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1e

    :cond_18
    iget-object v0, p2, Lqwo;->a:Ljava/lang/String;

    const/4 v1, 0x0

    invoke-interface {p1, p0, v1, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_1e
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_2e

    iget-object v0, p2, Lqwo;->b:Ljava/lang/String;

    sget-object v1, Lrxo;->k:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_34

    :cond_2e
    iget-object v0, p2, Lqwo;->b:Ljava/lang/String;

    const/4 v1, 0x1

    invoke-interface {p1, p0, v1, v0}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    :cond_34
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4d

    iget-object v0, p2, Lqwo;->c:Ljava/lang/String;

    sget-object v2, Lfcp;->c:Lc30;

    if-eqz v2, :cond_46

    sget-object v2, Lkn;->a:[Lkn;

    const-string v2, "admob"

    goto :goto_47

    :cond_46
    move-object v2, v1

    :goto_47
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_55

    :cond_4d
    sget-object v0, Lxhk;->a:Lxhk;

    iget-object v2, p2, Lqwo;->c:Ljava/lang/String;

    const/4 v3, 0x2

    invoke-interface {p1, p0, v3, v0, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_55
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_6b

    iget-object v0, p2, Lqwo;->d:Ljava/lang/String;

    sget-object v2, Lfcp;->c:Lc30;

    if-eqz v2, :cond_64

    iget-object v2, v2, Lc30;->b:Ljava/lang/String;

    goto :goto_65

    :cond_64
    move-object v2, v1

    :goto_65
    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_73

    :cond_6b
    sget-object v0, Lxhk;->a:Lxhk;

    iget-object v2, p2, Lqwo;->d:Ljava/lang/String;

    const/4 v3, 0x3

    invoke-interface {p1, p0, v3, v0, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_73
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_87

    iget-object v0, p2, Lqwo;->e:Ljava/lang/String;

    sget-object v2, Lfcp;->c:Lc30;

    if-eqz v2, :cond_81

    const-string v1, "2.14.0.0"

    :cond_81
    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_8f

    :cond_87
    sget-object v0, Lxhk;->a:Lxhk;

    iget-object v1, p2, Lqwo;->e:Ljava/lang/String;

    const/4 v2, 0x4

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_8f
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_99

    iget-object v0, p2, Lqwo;->f:Ljava/lang/String;

    if-eqz v0, :cond_a1

    :cond_99
    sget-object v0, Lxhk;->a:Lxhk;

    iget-object v1, p2, Lqwo;->f:Ljava/lang/String;

    const/4 v2, 0x5

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_a1
    sget-object v0, Lecb;->a:Lecb;

    iget-object p2, p2, Lqwo;->g:Ljava/lang/Integer;

    const/4 v1, 0x6

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
