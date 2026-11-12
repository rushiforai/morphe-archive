.class public final Lypn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lzpn;


# instance fields
.field public final a:Llon;

.field public final b:Ljava/lang/String;

.field public final c:D


# direct methods
.method public constructor <init>(Llon;Ljava/lang/String;D)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lypn;->a:Llon;

    iput-object p2, p0, Lypn;->b:Ljava/lang/String;

    iput-wide p3, p0, Lypn;->c:D

    return-void
.end method


# virtual methods
.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    if-eq p0, p1, :cond_24

    instance-of v0, p1, Lypn;

    if-eqz v0, :cond_22

    check-cast p1, Lypn;

    iget-object v0, p0, Lypn;->a:Llon;

    iget-object v1, p1, Lypn;->a:Llon;

    if-ne v0, v1, :cond_22

    iget-object v0, p0, Lypn;->b:Ljava/lang/String;

    iget-object v1, p1, Lypn;->b:Ljava/lang/String;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    iget-wide v0, p0, Lypn;->c:D

    iget-wide p0, p1, Lypn;->c:D

    invoke-static {v0, v1, p0, p1}, Ljava/lang/Double;->compare(DD)I

    move-result p0

    if-eqz p0, :cond_24

    :cond_22
    const/4 p0, 0x0

    return p0

    :cond_24
    const/4 p0, 0x1

    return p0
.end method

.method public final hashCode()I
    .registers 4

    iget-object v0, p0, Lypn;->a:Llon;

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    const/16 v1, 0x1f

    mul-int/2addr v0, v1

    iget-object v2, p0, Lypn;->b:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lz1m;->f(IILjava/lang/String;)I

    move-result v0

    iget-wide v1, p0, Lypn;->c:D

    invoke-static {v1, v2}, Ljava/lang/Double;->hashCode(D)I

    move-result p0

    add-int/2addr p0, v0

    return p0
.end method

.method public final toString()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method
