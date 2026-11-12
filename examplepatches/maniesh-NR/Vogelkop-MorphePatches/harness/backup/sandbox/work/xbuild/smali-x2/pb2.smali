.class public final Lpb2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/util/List;

.field public final c:Ljava/lang/String;

.field public final d:Ljava/lang/String;

.field public final e:Ljava/util/List;

.field public final f:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;J)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpb2;->a:Ljava/lang/String;

    iput-object p2, p0, Lpb2;->b:Ljava/util/List;

    iput-object p3, p0, Lpb2;->c:Ljava/lang/String;

    iput-object p4, p0, Lpb2;->d:Ljava/lang/String;

    iput-object p5, p0, Lpb2;->e:Ljava/util/List;

    iput-wide p6, p0, Lpb2;->f:J

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 7

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    instance-of v1, p1, Lpb2;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    return v2

    :cond_a
    check-cast p1, Lpb2;

    iget-object v1, p0, Lpb2;->a:Ljava/lang/String;

    iget-object v3, p1, Lpb2;->a:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    return v2

    :cond_17
    iget-object v1, p0, Lpb2;->b:Ljava/util/List;

    iget-object v3, p1, Lpb2;->b:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    return v2

    :cond_22
    iget-object v1, p0, Lpb2;->c:Ljava/lang/String;

    iget-object v3, p1, Lpb2;->c:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2d

    return v2

    :cond_2d
    iget-object v1, p0, Lpb2;->d:Ljava/lang/String;

    iget-object v3, p1, Lpb2;->d:Ljava/lang/String;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    return v2

    :cond_38
    iget-object v1, p0, Lpb2;->e:Ljava/util/List;

    iget-object v3, p1, Lpb2;->e:Ljava/util/List;

    invoke-static {v1, v3}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_43

    return v2

    :cond_43
    iget-wide v3, p0, Lpb2;->f:J

    iget-wide p0, p1, Lpb2;->f:J

    cmp-long p0, v3, p0

    if-eqz p0, :cond_4c

    return v2

    :cond_4c
    return v0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lpb2;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lpb2;->b:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-object v2, p0, Lpb2;->c:Ljava/lang/String;

    if-nez v2, :cond_15

    const/4 v2, 0x0

    goto :goto_19

    :cond_15
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    :goto_19
    add-int/2addr v0, v2

    mul-int/2addr v0, v1

    iget-object v2, p0, Lpb2;->d:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object v2, p0, Lpb2;->e:Ljava/util/List;

    invoke-static {v0, v1, v2}, Lrfp;->f(IILjava/util/List;)I

    move-result v0

    iget-wide v1, p0, Lpb2;->f:J

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
