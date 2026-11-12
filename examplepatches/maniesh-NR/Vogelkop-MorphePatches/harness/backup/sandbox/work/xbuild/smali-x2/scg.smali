.class public final synthetic Lscg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lscg;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lscg;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lscg;->a:Lscg;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.android.startup.fragments.personalization.PersonalizationOnboardingSnapshot"

    const/4 v3, 0x4

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "viewedWallpaperIds"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "selectedWallpaperId"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "interests"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "wallpapersSource"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lscg;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 4

    sget-object p0, Lxcg;->e:[Ll4c;

    const/4 v0, 0x4

    new-array v0, v0, [Lkotlinx/serialization/KSerializer;

    const/4 v1, 0x0

    aget-object v2, p0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1

    sget-object v1, Lxhk;->a:Lxhk;

    invoke-static {v1}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const/4 v1, 0x2

    aget-object v2, p0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x3

    aget-object p0, p0, v1

    invoke-interface {p0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p0

    aput-object p0, v0, v1

    return-object v0
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 14

    sget-object p0, Lscg;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object p1

    sget-object v0, Lxcg;->e:[Ll4c;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move v4, v1

    move v6, v2

    move-object v7, v3

    move-object v8, v7

    move-object v9, v8

    move-object v10, v9

    :goto_11
    if-eqz v4, :cond_6c

    invoke-interface {p1, p0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v5

    const/4 v11, -0x1

    if-eq v5, v11, :cond_6a

    if-eqz v5, :cond_58

    if-eq v5, v1, :cond_4c

    const/4 v11, 0x2

    if-eq v5, v11, :cond_3a

    const/4 v10, 0x3

    if-ne v5, v10, :cond_36

    aget-object v5, v0, v10

    invoke-interface {v5}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkotlinx/serialization/KSerializer;

    invoke-interface {p1, p0, v10, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v10, v5

    check-cast v10, Lhff;

    or-int/lit8 v6, v6, 0x8

    goto :goto_11

    :cond_36
    invoke-static {v5}, Lt3p;->d(I)V

    return-object v3

    :cond_3a
    aget-object v5, v0, v11

    invoke-interface {v5}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkotlinx/serialization/KSerializer;

    invoke-interface {p1, p0, v11, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Ljava/util/List;

    or-int/lit8 v6, v6, 0x4

    goto :goto_11

    :cond_4c
    sget-object v5, Lxhk;->a:Lxhk;

    invoke-interface {p1, p0, v1, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v8, v5

    check-cast v8, Ljava/lang/String;

    or-int/lit8 v6, v6, 0x2

    goto :goto_11

    :cond_58
    aget-object v5, v0, v2

    invoke-interface {v5}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lkotlinx/serialization/KSerializer;

    invoke-interface {p1, p0, v2, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    move-object v7, v5

    check-cast v7, Ljava/util/List;

    or-int/lit8 v6, v6, 0x1

    goto :goto_11

    :cond_6a
    move v4, v2

    goto :goto_11

    :cond_6c
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance v5, Lxcg;

    invoke-direct/range {v5 .. v10}, Lxcg;-><init>(ILjava/util/List;Ljava/lang/String;Ljava/util/List;Lhff;)V

    return-object v5
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lscg;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 7

    check-cast p2, Lxcg;

    sget-object p0, Lscg;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lxcg;->e:[Ll4c;

    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_1a

    iget-object v1, p2, Lxcg;->a:Ljava/util/List;

    sget-object v2, Ll08;->a:Ll08;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_28

    :cond_1a
    const/4 v1, 0x0

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    iget-object v3, p2, Lxcg;->a:Ljava/util/List;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_28
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_32

    iget-object v1, p2, Lxcg;->b:Ljava/lang/String;

    if-eqz v1, :cond_3a

    :cond_32
    sget-object v1, Lxhk;->a:Lxhk;

    iget-object v2, p2, Lxcg;->b:Ljava/lang/String;

    const/4 v3, 0x1

    invoke-interface {p1, p0, v3, v1, v2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_3a
    invoke-interface {p1}, Lph5;->E()Z

    move-result v1

    if-nez v1, :cond_4a

    iget-object v1, p2, Lxcg;->c:Ljava/util/List;

    sget-object v2, Ll08;->a:Ll08;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_58

    :cond_4a
    const/4 v1, 0x2

    aget-object v2, v0, v1

    invoke-interface {v2}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lkotlinx/serialization/KSerializer;

    iget-object v3, p2, Lxcg;->c:Ljava/util/List;

    invoke-interface {p1, p0, v1, v2, v3}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_58
    const/4 v1, 0x3

    aget-object v0, v0, v1

    invoke-interface {v0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lkotlinx/serialization/KSerializer;

    iget-object p2, p2, Lxcg;->d:Lhff;

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
