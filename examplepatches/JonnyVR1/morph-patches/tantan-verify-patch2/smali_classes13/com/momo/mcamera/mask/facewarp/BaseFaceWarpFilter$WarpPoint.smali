.class Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WarpPoint"
.end annotation


# instance fields
.field dstPoints:[F

.field srcPoints:[F


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    check-cast p1, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->srcPoints:[F

    .line 22
    .line 23
    iget-object v3, p1, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->srcPoints:[F

    .line 24
    .line 25
    invoke-static {v2, v3}, Ljava/util/Arrays;->equals([F[F)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_2

    .line 30
    .line 31
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->dstPoints:[F

    .line 32
    .line 33
    iget-object p1, p1, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->dstPoints:[F

    .line 34
    .line 35
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([F[F)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    return v0

    .line 42
    :cond_2
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->srcPoints:[F

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object p0, p0, Lcom/momo/mcamera/mask/facewarp/BaseFaceWarpFilter$WarpPoint;->dstPoints:[F

    .line 10
    .line 11
    invoke-static {p0}, Ljava/util/Arrays;->hashCode([F)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/2addr v0, p0

    .line 16
    return v0
.end method
