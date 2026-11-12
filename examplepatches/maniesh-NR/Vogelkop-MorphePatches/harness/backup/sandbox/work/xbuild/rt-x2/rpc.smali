.class public final Lrpc;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lh2j;
.end annotation


# static fields
.field public static final Companion:Lqpc;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final j:[Ll4c;


# instance fields
.field public final a:J

.field public final b:J

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Lboc;

.field public final f:Ljava/lang/String;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    new-instance v0, Lqpc;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lrpc;->Companion:Lqpc;

    sget-object v0, Lf7c;->b:Lf7c;

    new-instance v1, Lfza;

    const/16 v2, 0x16

    invoke-direct {v1, v2}, Lfza;-><init>(B)V

    invoke-static {v0, v1}, Lz4c;->a(Lf7c;Lkotlin/jvm/functions/Function0;)Ll4c;

    move-result-object v0

    const/16 v1, 0x9

    new-array v1, v1, [Ll4c;

    const/4 v2, 0x0

    const/4 v3, 0x0

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object v3, v1, v2

    const/4 v2, 0x2

    aput-object v3, v1, v2

    const/4 v2, 0x3

    aput-object v3, v1, v2

    const/4 v2, 0x4

    aput-object v0, v1, v2

    const/4 v0, 0x5

    aput-object v3, v1, v0

    const/4 v0, 0x6

    aput-object v3, v1, v0

    const/4 v0, 0x7

    aput-object v3, v1, v0

    const/16 v0, 0x8

    aput-object v3, v1, v0

    sput-object v1, Lrpc;->j:[Ll4c;

    return-void
.end method

.method public synthetic constructor <init>(IJJLjava/lang/String;Ljava/lang/String;Lboc;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 16

    and-int/lit8 v0, p1, 0x7

    const/4 v1, 0x0

    const/4 v2, 0x7

    if-ne v2, v0, :cond_46

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Lrpc;->a:J

    iput-wide p4, p0, Lrpc;->b:J

    iput-object p6, p0, Lrpc;->c:Ljava/lang/String;

    and-int/lit8 p2, p1, 0x8

    if-nez p2, :cond_16

    iput-object v1, p0, Lrpc;->d:Ljava/lang/String;

    goto :goto_18

    :cond_16
    iput-object p7, p0, Lrpc;->d:Ljava/lang/String;

    :goto_18
    and-int/lit8 p2, p1, 0x10

    if-nez p2, :cond_1f

    iput-object v1, p0, Lrpc;->e:Lboc;

    goto :goto_21

    :cond_1f
    iput-object p8, p0, Lrpc;->e:Lboc;

    :goto_21
    and-int/lit8 p2, p1, 0x20

    if-nez p2, :cond_28

    iput-object v1, p0, Lrpc;->f:Ljava/lang/String;

    goto :goto_2a

    :cond_28
    iput-object p9, p0, Lrpc;->f:Ljava/lang/String;

    :goto_2a
    and-int/lit8 p2, p1, 0x40

    if-nez p2, :cond_31

    iput-object v1, p0, Lrpc;->g:Ljava/lang/String;

    goto :goto_33

    :cond_31
    iput-object p10, p0, Lrpc;->g:Ljava/lang/String;

    :goto_33
    and-int/lit16 p2, p1, 0x80

    if-nez p2, :cond_3a

    iput-object v1, p0, Lrpc;->h:Ljava/lang/String;

    goto :goto_3c

    :cond_3a
    iput-object p11, p0, Lrpc;->h:Ljava/lang/String;

    :goto_3c
    and-int/lit16 p1, p1, 0x100

    if-nez p1, :cond_43

    iput-object v1, p0, Lrpc;->i:Ljava/lang/String;

    return-void

    :cond_43
    iput-object p12, p0, Lrpc;->i:Ljava/lang/String;

    return-void

    :cond_46
    sget-object p0, Lppc;->a:Lppc;

    invoke-virtual {p0}, Lppc;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

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
    instance-of v1, p1, Lrpc;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lrpc;

    iget-wide v3, p0, Lrpc;->a:J

    iget-wide v5, p1, Lrpc;->a:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_15

    return v2

    :cond_15
    iget-wide v3, p0, Lrpc;->b:J

    iget-wide v5, p1, Lrpc;->b:J

    cmp-long v1, v3, v5

    if-eqz v1, :cond_1e

    return v2

    :cond_1e
    iget-object v1, p0, Lrpc;->c:Ljava/lang/String;

    iget-object v3, p1, Lrpc;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_29

    return v2

    :cond_29
    iget-object v1, p0, Lrpc;->d:Ljava/lang/String;

    iget-object v3, p1, Lrpc;->d:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_34

    return v2

    :cond_34
    iget-object v1, p0, Lrpc;->e:Lboc;

    iget-object v3, p1, Lrpc;->e:Lboc;

    if-eq v1, v3, :cond_3b

    return v2

    :cond_3b
    iget-object v1, p0, Lrpc;->f:Ljava/lang/String;

    iget-object v3, p1, Lrpc;->f:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_46

    return v2

    :cond_46
    iget-object v1, p0, Lrpc;->g:Ljava/lang/String;

    iget-object v3, p1, Lrpc;->g:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_51

    return v2

    :cond_51
    iget-object v1, p0, Lrpc;->h:Ljava/lang/String;

    iget-object v3, p1, Lrpc;->h:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5c

    return v2

    :cond_5c
    iget-object p0, p0, Lrpc;->i:Ljava/lang/String;

    iget-object p1, p1, Lrpc;->i:Ljava/lang/String;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_67

    return v2

    :cond_67
    return v0
.end method

.method public final hashCode()I
    .registers 5

    iget-wide v0, p0, Lrpc;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-wide v2, p0, Lrpc;->b:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-object v2, p0, Lrpc;->c:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    const/4 v2, 0x0

    iget-object v3, p0, Lrpc;->d:Ljava/lang/String;

    if-nez v3, :cond_1c

    move v3, v2

    goto :goto_20

    :cond_1c
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_20
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lrpc;->e:Lboc;

    if-nez v3, :cond_28

    move v3, v2

    goto :goto_2c

    :cond_28
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v3

    :goto_2c
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lrpc;->f:Ljava/lang/String;

    if-nez v3, :cond_34

    move v3, v2

    goto :goto_38

    :cond_34
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_38
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lrpc;->g:Ljava/lang/String;

    if-nez v3, :cond_40

    move v3, v2

    goto :goto_44

    :cond_40
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_44
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object v3, p0, Lrpc;->h:Ljava/lang/String;

    if-nez v3, :cond_4c

    move v3, v2

    goto :goto_50

    :cond_4c
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    :goto_50
    add-int/2addr v0, v3

    mul-int/2addr v0, v1

    iget-object p0, p0, Lrpc;->i:Ljava/lang/String;

    if-eqz p0, :cond_5a

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v2

    :cond_5a
    add-int/2addr v0, v2

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
