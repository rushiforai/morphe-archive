.class public final Le0d;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public final b:Ljava/lang/String;

.field public final c:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;J[B)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p2, p0, Le0d;->a:J

    iput-object p1, p0, Le0d;->b:Ljava/lang/String;

    iput-object p4, p0, Le0d;->c:[B

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    if-eq p0, p1, :cond_26

    instance-of v0, p1, Le0d;

    if-eqz v0, :cond_24

    check-cast p1, Le0d;

    iget-wide v0, p0, Le0d;->a:J

    iget-wide v2, p1, Le0d;->a:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_24

    iget-object v0, p0, Le0d;->b:Ljava/lang/String;

    iget-object v1, p1, Le0d;->b:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_24

    iget-object p0, p0, Le0d;->c:[B

    iget-object p1, p1, Le0d;->c:[B

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_26

    :cond_24
    const/4 p0, 0x0

    return p0

    :cond_26
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-wide v0, p0, Le0d;->a:J

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Le0d;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-object p0, p0, Le0d;->c:[B

    if-nez p0, :cond_15

    const/4 p0, 0x0

    goto :goto_19

    :cond_15
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([B)I

    move-result p0

    :goto_19
    add-int/2addr v0, p0

    return v0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
