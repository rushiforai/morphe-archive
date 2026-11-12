.class public final Lvv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlinx/serialization/KSerializer;


# static fields
.field public static final a:Lvv;

.field public static final b:Lcyg;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lvv;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lvv;->a:Lvv;

    const-string v0, "Address"

    sget-object v1, Lxxg;->j:Lxxg;

    invoke-static {v0, v1}, Lxug;->a(Ljava/lang/String;Lxxg;)Lcyg;

    move-result-object v0

    sput-object v0, Lvv;->b:Lcyg;

    return-void
.end method


# virtual methods
.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 2

    sget-object p0, Lwv;->Companion:Luv;

    invoke-interface {p1}, Lkotlinx/serialization/encoding/Decoder;->B()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Luv;->b(Ljava/lang/String;)Lwv;

    move-result-object p0

    return-object p0
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lvv;->b:Lcyg;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 3

    check-cast p2, Lwv;

    invoke-virtual {p2}, Lle3;->a()Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->G(Ljava/lang/String;)V

    return-void
.end method
