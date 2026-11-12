.class public final Lne3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlinx/serialization/KSerializer;


# static fields
.field public static final a:Lne3;

.field public static final b:Lcyg;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lne3;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lne3;->a:Lne3;

    const-string v0, "BigInt"

    sget-object v1, Lxxg;->j:Lxxg;

    invoke-static {v0, v1}, Lxug;->a(Ljava/lang/String;Lxxg;)Lcyg;

    move-result-object v0

    sput-object v0, Lne3;->b:Lcyg;

    return-void
.end method


# virtual methods
.method public final deserialize(Lkotlinx/serialization/encoding/Decoder;)Ljava/lang/Object;
    .registers 3

    new-instance p0, Ljava/math/BigInteger;

    invoke-interface {p1}, Lkotlinx/serialization/encoding/Decoder;->B()Ljava/lang/String;

    move-result-object p1

    const/16 v0, 0x10

    invoke-direct {p0, p1, v0}, Ljava/math/BigInteger;-><init>(Ljava/lang/String;I)V

    return-object p0
.end method

.method public final getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;
    .registers 1

    sget-object p0, Lne3;->b:Lcyg;

    return-object p0
.end method

.method public final serialize(Lkotlinx/serialization/encoding/Encoder;Ljava/lang/Object;)V
    .registers 3

    check-cast p2, Ljava/math/BigInteger;

    const/16 p0, 0x10

    invoke-virtual {p2, p0}, Ljava/math/BigInteger;->toString(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Lkotlinx/serialization/encoding/Encoder;->G(Ljava/lang/String;)V

    return-void
.end method
