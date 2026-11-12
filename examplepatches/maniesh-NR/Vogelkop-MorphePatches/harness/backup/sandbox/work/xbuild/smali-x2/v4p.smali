.class public final Lv4p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lv4p;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lv4p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lv4p;->a:Lv4p;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.data.NativeAdm.ImpressionTracker"

    const/4 v3, 0x3

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "event"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "method"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "url"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lv4p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 3

    const/4 p0, 0x3

    new-array p0, p0, [Lkotlinx/serialization/KSerializer;

    sget-object v0, Lecb;->a:Lecb;

    const/4 v1, 0x0

    aput-object v0, p0, v1

    const/4 v1, 0x1

    aput-object v0, p0, v1

    sget-object v0, Lxhk;->a:Lxhk;

    const/4 v1, 0x2

    aput-object v0, p0, v1

    return-object p0
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 12

    sget-object p0, Lv4p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    move v3, v0

    move v4, v1

    move v5, v4

    move v6, v5

    move-object v7, v2

    :goto_e
    if-eqz v3, :cond_39

    invoke-interface {p1, p0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v8

    const/4 v9, -0x1

    if-eq v8, v9, :cond_37

    if-eqz v8, :cond_30

    if-eq v8, v0, :cond_29

    const/4 v7, 0x2

    if-ne v8, v7, :cond_25

    invoke-interface {p1, p0, v7}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v7

    or-int/lit8 v4, v4, 0x4

    goto :goto_e

    :cond_25
    invoke-static {v8}, Lt3p;->d(I)V

    return-object v2

    :cond_29
    invoke-interface {p1, p0, v0}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v6

    or-int/lit8 v4, v4, 0x2

    goto :goto_e

    :cond_30
    invoke-interface {p1, p0, v1}, Loh5;->l(Lkotlinx/serialization/descriptors/SerialDescriptor;I)I

    move-result v5

    or-int/lit8 v4, v4, 0x1

    goto :goto_e

    :cond_37
    move v3, v1

    goto :goto_e

    :cond_39
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance p0, Lx4p;

    invoke-direct {p0, v4, v5, v6, v7}, Lx4p;-><init>(IIILjava/lang/String;)V

    return-object p0
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lv4p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 5

    check-cast p2, Lx4p;

    sget-object p0, Lv4p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    iget v0, p2, Lx4p;->a:I

    const/4 v1, 0x0

    invoke-interface {p1, v1, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget v0, p2, Lx4p;->b:I

    const/4 v1, 0x1

    invoke-interface {p1, v1, v0, p0}, Lph5;->v(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    iget-object p2, p2, Lx4p;->c:Ljava/lang/String;

    const/4 v0, 0x2

    invoke-interface {p1, p0, v0, p2}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
