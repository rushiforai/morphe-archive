.class public final Lwl;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lvl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final g:[Ll4c;


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;

.field public final c:Lyo;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lvl;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lwl;->Companion:Lvl;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Llb;

    const/4 v2, 0x4

    invoke-direct {v1, v2}, Llb;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/4 v1, 0x6

    new-array v1, v1, [Ll4c;

    const/4 v3, 0x0

    const/4 v4, 0x0

    aput-object v4, v1, v3

    const/4 v3, 0x1

    aput-object v4, v1, v3

    const/4 v3, 0x2

    aput-object v0, v1, v3

    const/4 v0, 0x3

    aput-object v4, v1, v0

    aput-object v4, v1, v2

    const/4 v0, 0x5

    aput-object v4, v1, v0

    sput-object v1, Lwl;->g:[Ll4c;

    return-void
.end method

.method public synthetic constructor <init>(IJLjava/lang/String;Lyo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 11

    and-int/lit8 v0, p1, 0x3f

    const/16 v1, 0x3f

    if-ne v1, v0, :cond_16

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Lwl;->a:J

    iput-object p4, p0, Lwl;->b:Ljava/lang/String;

    iput-object p5, p0, Lwl;->c:Lyo;

    iput-object p6, p0, Lwl;->d:Ljava/lang/String;

    iput-object p7, p0, Lwl;->e:Ljava/lang/String;

    iput-object p8, p0, Lwl;->f:Ljava/lang/String;

    return-void

    :cond_16
    sget-object p0, Lul;->a:Lul;

    invoke-virtual {p0}, Lul;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v1, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    const/4 p0, 0x0

    throw p0
.end method

.method public constructor <init>(JLjava/lang/String;Lyo;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 8

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    iput-wide p1, p0, Lwl;->a:J

    .line 35
    iput-object p3, p0, Lwl;->b:Ljava/lang/String;

    .line 36
    iput-object p4, p0, Lwl;->c:Lyo;

    .line 37
    iput-object p5, p0, Lwl;->d:Ljava/lang/String;

    .line 38
    iput-object p6, p0, Lwl;->e:Ljava/lang/String;

    .line 39
    iput-object p7, p0, Lwl;->f:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 9

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lwl;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lwl;

    iget-wide v3, p0, Lwl;->a:J

    iget-wide v5, p1, Lwl;->a:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_15

    return v2

    :cond_15
    iget-object v1, p0, Lwl;->b:Ljava/lang/String;

    iget-object v3, p1, Lwl;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_20

    return v2

    :cond_20
    iget-object v1, p0, Lwl;->c:Lyo;

    iget-object v3, p1, Lwl;->c:Lyo;

    if-eq v1, v3, :cond_27

    return v2

    :cond_27
    iget-object v1, p0, Lwl;->d:Ljava/lang/String;

    iget-object v3, p1, Lwl;->d:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_32

    return v2

    :cond_32
    iget-object v1, p0, Lwl;->e:Ljava/lang/String;

    iget-object v3, p1, Lwl;->e:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3d

    return v2

    :cond_3d
    iget-object p0, p0, Lwl;->f:Ljava/lang/String;

    iget-object p1, p1, Lwl;->f:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_48

    return v2

    :cond_48
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-wide v0, p0, Lwl;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lwl;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lwl;->c:Lyo;

    invoke-virtual {v2}, Ljava/lang/Object;->hashCode()I

    move-result v2

    add-int/2addr v2, v0

    mul-int/2addr v2, v1

    iget-object v0, p0, Lwl;->d:Ljava/lang/String;

    invoke-static {v2, v1, v0}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Lwl;->e:Ljava/lang/String;

    if-nez v3, :cond_24

    move v3, v2

    goto :goto_28

    :cond_24
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_28
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object p0, p0, Lwl;->f:Ljava/lang/String;

    if-eqz p0, :cond_32

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_32
    add-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
