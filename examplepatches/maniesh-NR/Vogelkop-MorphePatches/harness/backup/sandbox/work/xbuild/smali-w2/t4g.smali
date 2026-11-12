.class public final Lt4g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/String;

.field public final c:J

.field public final d:Z


# direct methods
.method public constructor <init>(JLjava/lang/String;Ljava/lang/String;Z)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lt4g;->a:Ljava/lang/String;

    iput-object p4, p0, Lt4g;->b:Ljava/lang/String;

    iput-wide p1, p0, Lt4g;->c:J

    iput-boolean p5, p0, Lt4g;->d:Z

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_2c

    instance-of v0, p1, Lt4g;

    if-eqz v0, :cond_2a

    check-cast p1, Lt4g;

    iget-object v0, p0, Lt4g;->a:Ljava/lang/String;

    iget-object v1, p1, Lt4g;->a:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-object v0, p0, Lt4g;->b:Ljava/lang/String;

    iget-object v1, p1, Lt4g;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2a

    iget-wide v0, p0, Lt4g;->c:J

    iget-wide v2, p1, Lt4g;->c:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_2a

    iget-boolean p0, p0, Lt4g;->d:Z

    iget-boolean p1, p1, Lt4g;->d:Z

    if-eq p0, p1, :cond_2c

    :cond_2a
    const/4 p0, 0x0

    return p0

    :cond_2c
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 5

    iget-object v0, p0, Lt4g;->a:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lt4g;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-wide v2, p0, Lt4g;->c:J

    invoke-static {v0, v1, v2, v3}, Lz1m;->e(IIJ)I

    move-result v0

    iget-boolean p0, p0, Lt4g;->d:Z

    invoke-static {p0}, Ljava/lang/Boolean;->hashCode(Z)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
