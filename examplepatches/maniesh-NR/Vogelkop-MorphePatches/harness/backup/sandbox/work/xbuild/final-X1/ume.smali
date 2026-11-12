.class public final Lume;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Ltme;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Lrme;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ltme;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lume;->Companion:Ltme;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/String;Ljava/lang/String;Lrme;)V
    .registers 7

    and-int/lit8 v0, p1, 0x1

    const/4 v1, 0x1

    if-ne v1, v0, :cond_24

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lume;->a:Ljava/lang/String;

    and-int/lit8 p2, p1, 0x2

    if-nez p2, :cond_13

    const-string p2, ""

    iput-object p2, p0, Lume;->b:Ljava/lang/String;

    goto :goto_15

    :cond_13
    iput-object p3, p0, Lume;->b:Ljava/lang/String;

    :goto_15
    and-int/lit8 p1, p1, 0x4

    if-nez p1, :cond_21

    new-instance p1, Lrme;

    invoke-direct {p1}, Lrme;-><init>()V

    iput-object p1, p0, Lume;->c:Lrme;

    return-void

    :cond_21
    iput-object p4, p0, Lume;->c:Lrme;

    return-void

    :cond_24
    sget-object p0, Lsme;->a:Lsme;

    invoke-virtual {p0}, Lsme;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lume;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lume;

    iget-object v1, p0, Lume;->a:Ljava/lang/String;

    iget-object v3, p1, Lume;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lume;->b:Ljava/lang/String;

    iget-object v3, p1, Lume;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object p0, p0, Lume;->c:Lrme;

    iget-object p1, p1, Lume;->c:Lrme;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2d

    return v2

    :cond_2d
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lume;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lume;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Lume;->c:Lrme;

    invoke-virtual {p0}, Lrme;->hashCode()I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
