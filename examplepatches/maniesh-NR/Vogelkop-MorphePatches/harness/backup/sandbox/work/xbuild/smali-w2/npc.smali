.class public final Lnpc;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lmpc;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final h:[Ll4c;


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;

.field public final c:Ljava/lang/String;

.field public final d:Lboc;

.field public final e:Ljava/lang/String;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lmpc;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lnpc;->Companion:Lmpc;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lfza;

    const/16 v2, 0x15

    invoke-direct {v1, v2}, Lfza;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/4 v1, 0x7

    new-array v1, v1, [Ll4c;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object v3, v1, v2

    const/4 v2, 0x3

    aput-object v0, v1, v2

    const/4 v0, 0x4

    aput-object v3, v1, v0

    const/4 v0, 0x5

    aput-object v3, v1, v0

    const/4 v0, 0x6

    aput-object v3, v1, v0

    sput-object v1, Lnpc;->h:[Ll4c;

    return-void
.end method

.method public synthetic constructor <init>(IJLjava/lang/String;Ljava/lang/String;Lboc;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 13

    and-int/lit8 v0, p1, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x3

    if-ne v2, v0, :cond_3b

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Lnpc;->a:J

    iput-object p4, p0, Lnpc;->b:Ljava/lang/String;

    and-int/lit8 p2, p1, 0x4

    if-nez p2, :cond_14

    iput-object v1, p0, Lnpc;->c:Ljava/lang/String;

    goto :goto_16

    :cond_14
    iput-object p5, p0, Lnpc;->c:Ljava/lang/String;

    :goto_16
    and-int/lit8 p2, p1, 0x8

    if-nez p2, :cond_1d

    iput-object v1, p0, Lnpc;->d:Lboc;

    goto :goto_1f

    :cond_1d
    iput-object p6, p0, Lnpc;->d:Lboc;

    :goto_1f
    and-int/lit8 p2, p1, 0x10

    if-nez p2, :cond_26

    iput-object v1, p0, Lnpc;->e:Ljava/lang/String;

    goto :goto_28

    :cond_26
    iput-object p7, p0, Lnpc;->e:Ljava/lang/String;

    :goto_28
    and-int/lit8 p2, p1, 0x20

    if-nez p2, :cond_2f

    iput-object v1, p0, Lnpc;->f:Ljava/lang/String;

    goto :goto_31

    :cond_2f
    iput-object p8, p0, Lnpc;->f:Ljava/lang/String;

    :goto_31
    and-int/lit8 p1, p1, 0x40

    if-nez p1, :cond_38

    iput-object v1, p0, Lnpc;->g:Ljava/lang/String;

    return-void

    :cond_38
    iput-object p9, p0, Lnpc;->g:Ljava/lang/String;

    return-void

    :cond_3b
    sget-object p0, Llpc;->a:Llpc;

    invoke-virtual {p0}, Llpc;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

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
    instance-of v1, p1, Lnpc;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lnpc;

    iget-wide v3, p0, Lnpc;->a:J

    iget-wide v5, p1, Lnpc;->a:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_15

    return v2

    :cond_15
    iget-object v1, p0, Lnpc;->b:Ljava/lang/String;

    iget-object v3, p1, Lnpc;->b:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_20

    return v2

    :cond_20
    iget-object v1, p0, Lnpc;->c:Ljava/lang/String;

    iget-object v3, p1, Lnpc;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2b

    return v2

    :cond_2b
    iget-object v1, p0, Lnpc;->d:Lboc;

    iget-object v3, p1, Lnpc;->d:Lboc;

    if-eq v1, v3, :cond_32

    return v2

    :cond_32
    iget-object v1, p0, Lnpc;->e:Ljava/lang/String;

    iget-object v3, p1, Lnpc;->e:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3d

    return v2

    :cond_3d
    iget-object v1, p0, Lnpc;->f:Ljava/lang/String;

    iget-object v3, p1, Lnpc;->f:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_48

    return v2

    :cond_48
    iget-object p0, p0, Lnpc;->g:Ljava/lang/String;

    iget-object p1, p1, Lnpc;->g:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_53

    return v2

    :cond_53
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-wide v0, p0, Lnpc;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lnpc;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Lnpc;->c:Ljava/lang/String;

    if-nez v3, :cond_16

    move v3, v2

    goto :goto_1a

    :cond_16
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_1a
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lnpc;->d:Lboc;

    if-nez v3, :cond_22

    move v3, v2

    goto :goto_26

    :cond_22
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_26
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lnpc;->e:Ljava/lang/String;

    if-nez v3, :cond_2e

    move v3, v2

    goto :goto_32

    :cond_2e
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_32
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lnpc;->f:Ljava/lang/String;

    if-nez v3, :cond_3a

    move v3, v2

    goto :goto_3e

    :cond_3a
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_3e
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object p0, p0, Lnpc;->g:Ljava/lang/String;

    if-eqz p0, :cond_48

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_48
    add-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
