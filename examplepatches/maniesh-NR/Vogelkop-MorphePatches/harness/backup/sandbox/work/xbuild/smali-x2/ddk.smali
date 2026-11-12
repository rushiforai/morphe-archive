.class public final synthetic Lddk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lddk;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lddk;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lddk;->a:Lddk;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.android.ntp.Storage.Data"

    const/4 v3, 0x2

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "response"

    const/4 v2, 0x0

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "lastUpdated"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lddk;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 4

    sget-object p0, Lt3f;->a:Lt3f;

    invoke-static {p0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object p0

    sget-object v0, Libb;->a:Libb;

    invoke-static {v0}, Lf03;->B(Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Lkotlinx/serialization/KSerializer;

    const/4 v2, 0x0

    aput-object p0, v1, v2

    const/4 p0, 0x1

    aput-object v0, v1, p0

    return-object v1
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 11

    sget-object p0, Lddk;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Decoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Loh5;

    move-result-object p1

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    move v3, v0

    move v4, v1

    move-object v5, v2

    move-object v6, v5

    :goto_d
    if-eqz v3, :cond_36

    invoke-interface {p1, p0}, Loh5;->p(Lkotlinx/serialization/descriptors/SerialDescriptor;)I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_34

    if-eqz v7, :cond_29

    if-ne v7, v0, :cond_25

    sget-object v6, Libb;->a:Libb;

    invoke-interface {p1, p0, v0, v6}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lebb;

    or-int/lit8 v4, v4, 0x2

    goto :goto_d

    :cond_25
    invoke-static {v7}, Lt3p;->d(I)V

    return-object v2

    :cond_29
    sget-object v5, Lt3f;->a:Lt3f;

    invoke-interface {p1, p0, v1, v5}, Loh5;->m(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lv3f;

    or-int/lit8 v4, v4, 0x1

    goto :goto_d

    :cond_34
    move v3, v1

    goto :goto_d

    :cond_36
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance p0, Lfdk;

    invoke-direct {p0, v4, v5, v6}, Lfdk;-><init>(ILv3f;Lebb;)V

    return-object p0
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lddk;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 6

    check-cast p2, Lfdk;

    sget-object p0, Lddk;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    sget-object v0, Lt3f;->a:Lt3f;

    iget-object v1, p2, Lfdk;->a:Lv3f;

    const/4 v2, 0x0

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    sget-object v0, Libb;->a:Libb;

    iget-object p2, p2, Lfdk;->b:Lebb;

    const/4 v1, 0x1

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->j(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
