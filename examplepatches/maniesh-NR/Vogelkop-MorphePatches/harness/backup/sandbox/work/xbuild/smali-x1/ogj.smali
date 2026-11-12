.class public final Logj;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lngj;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:J


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lngj;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Logj;->Companion:Lngj;

    return-void
.end method

.method public synthetic constructor <init>(IJLjava/lang/String;)V
    .registers 7

    and-int/lit8 v0, p1, 0x3

    const/4 v1, 0x3

    if-ne v1, v0, :cond_d

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p4, p0, Logj;->a:Ljava/lang/String;

    iput-wide p2, p0, Logj;->b:J

    return-void

    :cond_d
    sget-object p0, Lmgj;->a:Lmgj;

    invoke-virtual {p0}, Lmgj;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(Ljava/lang/String;J)V
    .registers 4

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput-object p1, p0, Logj;->a:Ljava/lang/String;

    .line 26
    iput-wide p2, p0, Logj;->b:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Logj;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Logj;

    iget-object v1, p0, Logj;->a:Ljava/lang/String;

    iget-object v3, p1, Logj;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-wide v3, p0, Logj;->b:J

    iget-wide p0, p1, Logj;->b:J

    cmp-long p0, v3, p0

    if-eqz p0, :cond_20

    return v2

    :cond_20
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Logj;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Logj;->b:J

    invoke-static {v1, v2}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
