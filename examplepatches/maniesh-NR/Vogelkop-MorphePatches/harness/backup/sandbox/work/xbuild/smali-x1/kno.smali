.class public final Lkno;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlinx/serialization/KSerializer;


# static fields
.field public static final a:Lkno;

.field public static final b:Lcyg;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lkno;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lkno;->a:Lkno;

    sget-object v0, Lxxg;->j:Lxxg;

    const-string v1, "com.opera.ads.internal.util.JsonObjectAsString"

    invoke-static {v1, v0}, Lxug;->a(Ljava/lang/String;Lxxg;)Lcyg;

    move-result-object v0

    sput-object v0, Lkno;->b:Lcyg;

    return-void
.end method


# virtual methods
.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 3

    instance-of p0, p1, Lmng;

    if-eqz p0, :cond_8

    move-object p0, p1

    check-cast p0, Lmng;

    goto :goto_9

    :cond_8
    const/4 p0, 0x0

    :goto_9
    if-eqz p0, :cond_11

    invoke-interface {p0}, Lmng;->d()Lrpb;

    move-result-object p0

    if-nez p0, :cond_13

    :cond_11
    sget-object p0, Lrpb;->d:Lqpb;

    :cond_13
    invoke-interface {p1}, Lkotlinx/serialization/encoding/Decoder;->B()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Lkotlinx/serialization/json/c;->Companion:Lkotlinx/serialization/json/JsonObject$Companion;

    invoke-virtual {v0}, Lkotlinx/serialization/json/JsonObject$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/json/c;

    return-object p0
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lkno;->b:Lcyg;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 4

    check-cast p2, Lkotlinx/serialization/json/c;

    instance-of p0, p1, Lwqb;

    if-eqz p0, :cond_a

    move-object p0, p1

    check-cast p0, Lwqb;

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    if-eqz p0, :cond_13

    invoke-interface {p0}, Lwqb;->d()Lrpb;

    move-result-object p0

    if-nez p0, :cond_15

    :cond_13
    sget-object p0, Lrpb;->d:Lqpb;

    :cond_15
    sget-object v0, Lkotlinx/serialization/json/c;->Companion:Lkotlinx/serialization/json/JsonObject$Companion;

    invoke-virtual {v0}, Lkotlinx/serialization/json/JsonObject$Companion;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v0

    invoke-virtual {p0, p2, v0}, Lrpb;->b(Ljava/lang/Object;Lkotlinx/serialization/KSerializer;)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->G(Ljava/lang/String;)V

    return-void
.end method
