.class public final Lz3p;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lz3p;

.field public static final synthetic b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lz3p;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lz3p;->a:Lz3p;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.ads.internal.data.NativeAdm.AdMarkup"

    const/4 v3, 0x5

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "link"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "ver"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "assets"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "eventtrackers"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "imptrackers"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lz3p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 10

    sget-object p0, Lc4p;->u:[Lkotlinx/serialization/KSerializer;

    sget-object v0, Lxhk;->a:Lxhk;

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    const/4 v1, 0x2

    aget-object v2, p0, v1

    invoke-static {v2}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v2

    const/4 v3, 0x3

    aget-object v4, p0, v3

    invoke-static {v4}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v4

    const/4 v5, 0x4

    aget-object p0, p0, v5

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    const/4 v6, 0x5

    new-array v6, v6, [Lkotlinx/serialization/KSerializer;

    sget-object v7, Ly4p;->a:Ly4p;

    const/4 v8, 0x0

    aput-object v7, v6, v8

    const/4 v7, 0x1

    aput-object v0, v6, v7

    aput-object v2, v6, v1

    aput-object v4, v6, v3

    aput-object p0, v6, v5

    return-object v6
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 15

    sget-object p0, Lz3p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object p1

    sget-object v0, Lc4p;->u:[Lkotlinx/serialization/KSerializer;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move v4, v1

    move v6, v2

    move-object v7, v3

    move-object v8, v7

    move-object v9, v8

    move-object v10, v9

    move-object v11, v10

    :goto_12
    if-eqz v4, :cond_6a

    invoke-interface {p1, p0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v5

    const/4 v12, -0x1

    if-eq v5, v12, :cond_68

    if-eqz v5, :cond_5c

    if-eq v5, v1, :cond_50

    const/4 v12, 0x2

    if-eq v5, v12, :cond_44

    const/4 v12, 0x3

    if-eq v5, v12, :cond_38

    const/4 v11, 0x4

    if-ne v5, v11, :cond_34

    aget-object v5, v0, v11

    invoke-interface {p1, p0, v11, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Ljava/util/List;

    or-int/lit8 v6, v6, 0x10

    goto :goto_12

    :cond_34
    invoke-static {v5}, Lt3p;->d(I)V

    return-object v3

    :cond_38
    aget-object v5, v0, v12

    invoke-interface {p1, p0, v12, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Ljava/util/List;

    or-int/lit8 v6, v6, 0x8

    goto :goto_12

    :cond_44
    aget-object v5, v0, v12

    invoke-interface {p1, p0, v12, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Ljava/util/List;

    or-int/lit8 v6, v6, 0x4

    goto :goto_12

    :cond_50
    sget-object v5, Lxhk;->a:Lxhk;

    invoke-interface {p1, p0, v1, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v8, v5

    check-cast v8, Ljava/lang/String;

    or-int/lit8 v6, v6, 0x2

    goto :goto_12

    :cond_5c
    sget-object v5, Ly4p;->a:Ly4p;

    invoke-interface {p1, p0, v2, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v7, v5

    check-cast v7, La5p;

    or-int/lit8 v6, v6, 0x1

    goto :goto_12

    :cond_68
    move v4, v2

    goto :goto_12

    :cond_6a
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v5, Lc4p;

    invoke-direct/range {v5 .. v11}, Lc4p;-><init>(ILa5p;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V

    return-object v5
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lz3p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 10

    check-cast p2, Lc4p;

    sget-object p0, Lz3p;->b:Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lc4p;->u:[Lkotlinx/serialization/KSerializer;

    sget-object v1, Ly4p;->a:Ly4p;

    iget-object v2, p2, Lc4p;->a:La5p;

    iget-object v3, p2, Lc4p;->e:Ljava/util/List;

    iget-object v4, p2, Lc4p;->d:Ljava/util/List;

    iget-object v5, p2, Lc4p;->c:Ljava/util/List;

    iget-object p2, p2, Lc4p;->b:Ljava/lang/String;

    const/4 v6, 0x0

    invoke-interface {p1, p0, v6, v1, v2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_22

    if-eqz p2, :cond_28

    :cond_22
    sget-object v1, Lxhk;->a:Lxhk;

    const/4 v2, 0x1

    invoke-interface {p1, p0, v2, v1, p2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_28
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_30

    if-eqz v5, :cond_36

    :cond_30
    const/4 p2, 0x2

    aget-object v1, v0, p2

    invoke-interface {p1, p0, p2, v1, v5}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_36
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_3e

    if-eqz v4, :cond_44

    :cond_3e
    const/4 p2, 0x3

    aget-object v1, v0, p2

    invoke-interface {p1, p0, p2, v1, v4}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_44
    invoke-interface {p1}, Lph5;->E()Z

    move-result p2

    if-nez p2, :cond_4c

    if-eqz v3, :cond_52

    :cond_4c
    const/4 p2, 0x4

    aget-object v0, v0, p2

    invoke-interface {p1, p0, p2, v0, v3}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_52
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method

.method public final typeParametersSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 1

    sget-object p0, Lo0g;->c:[Lkotlinx/serialization/KSerializer;

    return-object p0
.end method
