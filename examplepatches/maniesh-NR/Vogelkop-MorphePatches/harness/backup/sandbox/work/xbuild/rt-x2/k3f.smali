.class public final synthetic Lk3f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Liv9;


# static fields
.field public static final a:Lk3f;

.field private static final descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lk3f;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lk3f;->a:Lk3f;

    new-instance v1, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;

    const-string v2, "com.opera.android.ntp.NtpConfiguration"

    const/4 v3, 0x2

    invoke-direct {v1, v2, v0, v3}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;-><init>(Ljava/lang/String;Liv9;I)V

    const-string v0, "paid"

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    const-string v0, "oao"

    invoke-virtual {v1, v0, v2}, Lkotlinx/serialization/internal/PluginGeneratedSerialDescriptor;->k(Ljava/lang/String;Z)V

    sput-object v1, Lk3f;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-void
.end method


# virtual methods
.method public final childSerializers()[Lkotlinx/serialization/KSerializer;
    .registers 3

    const/4 p0, 0x2

    new-array p0, p0, [Lkotlinx/serialization/KSerializer;

    sget-object v0, Lh3f;->a:Lh3f;

    const/4 v1, 0x0

    aput-object v0, p0, v1

    const/4 v1, 0x1

    aput-object v0, p0, v1

    return-object p0
.end method

.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 11

    sget-object p0, Lk3f;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

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

    sget-object v6, Lh3f;->a:Lh3f;

    invoke-interface {p1, p0, v0, v6}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lj3f;

    or-int/lit8 v4, v4, 0x2

    goto :goto_d

    :cond_25
    invoke-static {v7}, Lt3p;->d(I)V

    return-object v2

    :cond_29
    sget-object v5, Lh3f;->a:Lh3f;

    invoke-interface {p1, p0, v1, v5}, Loh5;->z(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lj3f;

    or-int/lit8 v4, v4, 0x1

    goto :goto_d

    :cond_34
    move v3, v1

    goto :goto_d

    :cond_36
    invoke-interface {p1, p0}, Loh5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    new-instance p0, Lm3f;

    invoke-direct {p0, v4, v5, v6}, Lm3f;-><init>(ILj3f;Lj3f;)V

    return-object p0
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lk3f;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 6

    check-cast p2, Lm3f;

    sget-object p0, Lk3f;->descriptor:Lkotlinx/serialization/descriptors/SerialDescriptor;

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->b(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lph5;

    move-result-object p1

    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_1d

    iget-object v0, p2, Lm3f;->a:Lj3f;

    new-instance v1, Lj3f;

    sget-object v2, Ll08;->a:Ll08;

    invoke-direct {v1, v2}, Lj3f;-><init>(Ll08;)V

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_25

    :cond_1d
    sget-object v0, Lh3f;->a:Lh3f;

    iget-object v1, p2, Lm3f;->a:Lj3f;

    const/4 v2, 0x0

    invoke-interface {p1, p0, v2, v0, v1}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_25
    invoke-interface {p1}, Lph5;->E()Z

    move-result v0

    if-nez v0, :cond_3a

    iget-object v0, p2, Lm3f;->b:Lj3f;

    new-instance v1, Lj3f;

    sget-object v2, Ll08;->a:Ll08;

    invoke-direct {v1, v2}, Lj3f;-><init>(Ll08;)V

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_42

    :cond_3a
    sget-object v0, Lh3f;->a:Lh3f;

    iget-object p2, p2, Lm3f;->b:Lj3f;

    const/4 v1, 0x1

    invoke-interface {p1, p0, v1, v0, p2}, Lph5;->f(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/KSerializer;Ljava/lang/Object;)V

    :cond_42
    invoke-interface {p1, p0}, Lph5;->c(Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    return-void
.end method
