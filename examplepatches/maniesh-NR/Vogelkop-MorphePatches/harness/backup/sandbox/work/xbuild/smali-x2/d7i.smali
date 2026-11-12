.class public final Ld7i;
.super Li7i;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final INSTANCE:Ld7i;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final synthetic b:Ll4c;


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Ld7i;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Ld7i;->INSTANCE:Ld7i;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lgzh;

    const/16 v2, 0xa

    invoke-direct {v1, v2}, Lgzh;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    sput-object v0, Ld7i;->b:Ll4c;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 3

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of p0, p1, Ld7i;

    if-nez p0, :cond_a

    const/4 p0, 0x0

    return p0

    :cond_a
    return v0
.end method

.method public final hashCode()I
    .registers 1

    const p0, -0x60f72502

    return p0
.end method

.method public final serializer()Lkotlinx/serialization/KSerializer;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlinx/serialization/KSerializer;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    sget-object p0, Ld7i;->b:Ll4c;

    invoke-interface {p0}, Ll4c;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lkotlinx/serialization/KSerializer;

    return-object p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, "Rewards"

    return-object p0
.end method
