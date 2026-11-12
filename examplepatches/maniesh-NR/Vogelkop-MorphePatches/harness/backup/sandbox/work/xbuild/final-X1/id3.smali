.class public final Lid3;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lhd3;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:D

.field public final e:D

.field public final f:I

.field public final g:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lhd3;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lid3;->Companion:Lhd3;

    return-void
.end method

.method public synthetic constructor <init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;DDILjava/lang/String;)V
    .registers 14

    and-int/lit8 v0, p1, 0x3b

    const/4 v1, 0x0

    const/16 v2, 0x3b

    if-ne v2, v0, :cond_27

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lid3;->a:Ljava/lang/String;

    iput-object p3, p0, Lid3;->b:Ljava/lang/String;

    and-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_15

    iput-object v1, p0, Lid3;->c:Ljava/lang/String;

    goto :goto_17

    :cond_15
    iput-object p4, p0, Lid3;->c:Ljava/lang/String;

    :goto_17
    iput-wide p5, p0, Lid3;->d:D

    iput-wide p7, p0, Lid3;->e:D

    iput p9, p0, Lid3;->f:I

    and-int/lit8 p1, p1, 0x40

    if-nez p1, :cond_24

    iput-object v1, p0, Lid3;->g:Ljava/lang/String;

    return-void

    :cond_24
    iput-object p10, p0, Lid3;->g:Ljava/lang/String;

    return-void

    :cond_27
    sget-object p0, Lgd3;->a:Lgd3;

    invoke-virtual {p0}, Lgd3;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-static {p1, v2, p0}, Lx7d;->I(IILkotlinx/serialization/descriptors/SerialDescriptor;)V

    throw v1
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 9

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lid3;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lid3;

    iget-object v1, p0, Lid3;->a:Ljava/lang/String;

    iget-object v3, p1, Lid3;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lid3;->b:Ljava/lang/String;

    iget-object v3, p1, Lid3;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lid3;->c:Ljava/lang/String;

    iget-object v3, p1, Lid3;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-wide v3, p0, Lid3;->d:D

    iget-wide v5, p1, Lid3;->d:D

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_38

    return v2

    :cond_38
    iget-wide v3, p0, Lid3;->e:D

    iget-wide v5, p1, Lid3;->e:D

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Double;->compare(DD)I

    move-result v1

    if-eqz v1, :cond_43

    return v2

    :cond_43
    iget v1, p0, Lid3;->f:I

    iget v3, p1, Lid3;->f:I

    if-eq v1, v3, :cond_4a

    return v2

    :cond_4a
    iget-object p0, p0, Lid3;->g:Ljava/lang/String;

    iget-object p1, p1, Lid3;->g:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_55

    return v2

    :cond_55
    return v0
.end method

.method public final hashCode()I
    .registers 7

    iget-object v0, p0, Lid3;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lid3;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Lid3;->c:Ljava/lang/String;

    if-nez v3, :cond_16

    move v3, v2

    goto :goto_1a

    :cond_16
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1a
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-wide v3, p0, Lid3;->d:D

    invoke-static {v3, v4}, Ljava/lang/Double;->hashCode(D)I

    move-result v3

    add-int/2addr v3, v0

    mul-int/2addr v3, v1

    iget-wide v4, p0, Lid3;->e:D

    invoke-static {v4, v5}, Ljava/lang/Double;->hashCode(D)I

    move-result v0

    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget v3, p0, Lid3;->f:I

    invoke-static {v3, v0, v1}, Lrfp;->c(III)I

    move-result v0

    iget-object p0, p0, Lid3;->g:Ljava/lang/String;

    if-eqz p0, :cond_3a

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_3a
    add-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
