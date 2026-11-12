.class public final Ly4p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Ly4p;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Ly4p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ly4p;->a:Ly4p;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.data.NativeAdm.Link"

    const/4 v3, 0x3

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "url"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "fallback"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "clicktrackers"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Ly4p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 6

    sget-object p0, La5p;->d:[Lkotlinx/serialization/KSerializer;

    sget-object v0, Lxhk;->a:Lxhk;

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    const/4 v2, 0x2

    aget-object p0, p0, v2

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    const/4 v3, 0x3

    new-array v3, v3, [Lkotlinx/serialization/KSerializer;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const/4 v0, 0x1

    aput-object v1, v3, v0

    aput-object p0, v3, v2

    return-object v3
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 13

    sget-object p0, Ly4p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object p1

    sget-object v0, La5p;->d:[Lkotlinx/serialization/KSerializer;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move v4, v1

    move v5, v2

    move-object v6, v3

    move-object v7, v6

    move-object v8, v7

    :goto_10
    if-eqz v4, :cond_43

    invoke-interface {p1, p0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v9

    const/4 v10, -0x1

    if-eq v9, v10, :cond_41

    if-eqz v9, :cond_3a

    if-eq v9, v1, :cond_2f

    const/4 v8, 0x2

    if-ne v9, v8, :cond_2b

    aget-object v9, v0, v8

    invoke-interface {p1, p0, v8, v9}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/util/List;

    or-int/lit8 v5, v5, 0x4

    goto :goto_10

    :cond_2b
    invoke-static {v9}, Lt3p;->d(I)V

    return-object v3

    :cond_2f
    sget-object v7, Lxhk;->a:Lxhk;

    invoke-interface {p1, p0, v1, v7}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    or-int/lit8 v5, v5, 0x2

    goto :goto_10

    :cond_3a
    invoke-interface {p1, p0, v2}, Loh5;->o(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Ljava/lang/String;

    move-result-object v6

    or-int/lit8 v5, v5, 0x1

    goto :goto_10

    :cond_41
    move v4, v2

    goto :goto_10

    :cond_43
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance p0, La5p;

    invoke-direct {p0, v5, v6, v7, v8}, La5p;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-object p0
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Ly4p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 7

    check-cast p2, La5p;

    sget-object p0, Ly4p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, La5p;->d:[Lkotlinx/serialization/KSerializer;

    iget-object v1, p2, La5p;->a:Ljava/lang/String;

    iget-object v2, p2, La5p;->c:Ljava/util/List;

    iget-object p2, p2, La5p;->b:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-interface {p1, p0, v3, v1}, Lph5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILjava/lang/String;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_1c

    if-eqz p2, :cond_22

    :cond_1c
    sget-object v1, Lxhk;->a:Lxhk;

    const/4 v3, 0x1

    invoke-interface {p1, p0, v3, v1, p2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_22
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_2a

    if-eqz v2, :cond_30

    :cond_2a
    const/4 p2, 0x2

    aget-object v0, v0, p2

    invoke-interface {p1, p0, p2, v0, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_30
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
