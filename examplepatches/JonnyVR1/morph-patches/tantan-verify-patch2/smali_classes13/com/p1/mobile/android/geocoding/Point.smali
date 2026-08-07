.class public final Lcom/p1/mobile/android/geocoding/Point;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0007\n\u0002\u0008\u000c\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0080\u0008\u0018\u00002\u00020\u0001B\u0015\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0005J\t\u0010\u000c\u001a\u00020\u0003H\u00c6\u0003J\t\u0010\r\u001a\u00020\u0003H\u00c6\u0003J\u001d\u0010\u000e\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u00032\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0003H\u00c6\u0001J\u0013\u0010\u000f\u001a\u00020\u00102\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u0012\u001a\u00020\u0013H\u00d6\u0001J\t\u0010\u0014\u001a\u00020\u0015H\u00d6\u0001R\u001a\u0010\u0002\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tR\u001a\u0010\u0004\u001a\u00020\u0003X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\n\u0010\u0007\"\u0004\u0008\u000b\u0010\t\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/p1/mobile/android/geocoding/Point;",
        "",
        "latitude",
        "",
        "longitude",
        "(FF)V",
        "getLatitude",
        "()F",
        "setLatitude",
        "(F)V",
        "getLongitude",
        "setLongitude",
        "component1",
        "component2",
        "copy",
        "equals",
        "",
        "other",
        "hashCode",
        "",
        "toString",
        "",
        "geocoding_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x1,
        0xd
    }
.end annotation


# instance fields
.field private latitude:F

.field private longitude:F


# direct methods
.method public constructor <init>(FF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Point;->latitude:F

    .line 5
    .line 6
    iput p2, p0, Lcom/p1/mobile/android/geocoding/Point;->longitude:F

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic copy$default(Lcom/p1/mobile/android/geocoding/Point;FFILjava/lang/Object;)Lcom/p1/mobile/android/geocoding/Point;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    iget p1, p0, Lcom/p1/mobile/android/geocoding/Point;->latitude:F

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget p2, p0, Lcom/p1/mobile/android/geocoding/Point;->longitude:F

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/geocoding/Point;->copy(FF)Lcom/p1/mobile/android/geocoding/Point;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final component1()F
    .locals 0

    iget p0, p0, Lcom/p1/mobile/android/geocoding/Point;->latitude:F

    return p0
.end method

.method public final component2()F
    .locals 0

    iget p0, p0, Lcom/p1/mobile/android/geocoding/Point;->longitude:F

    return p0
.end method

.method public final copy(FF)Lcom/p1/mobile/android/geocoding/Point;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance p0, Lcom/p1/mobile/android/geocoding/Point;

    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/geocoding/Point;-><init>(FF)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lcom/p1/mobile/android/geocoding/Point;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/p1/mobile/android/geocoding/Point;

    iget v0, p0, Lcom/p1/mobile/android/geocoding/Point;->latitude:F

    iget v1, p1, Lcom/p1/mobile/android/geocoding/Point;->latitude:F

    invoke-static {v0, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-nez v0, :cond_0

    iget p0, p0, Lcom/p1/mobile/android/geocoding/Point;->longitude:F

    iget p1, p1, Lcom/p1/mobile/android/geocoding/Point;->longitude:F

    invoke-static {p0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result p0

    if-nez p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public final getLatitude()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/geocoding/Point;->latitude:F

    .line 2
    .line 3
    return p0
.end method

.method public final getLongitude()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/geocoding/Point;->longitude:F

    .line 2
    .line 3
    return p0
.end method

.method public hashCode()I
    .locals 1

    iget v0, p0, Lcom/p1/mobile/android/geocoding/Point;->latitude:F

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget p0, p0, Lcom/p1/mobile/android/geocoding/Point;->longitude:F

    invoke-static {p0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method public final setLatitude(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Point;->latitude:F

    .line 2
    .line 3
    return-void
.end method

.method public final setLongitude(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Point;->longitude:F

    .line 2
    .line 3
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Point(latitude="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lcom/p1/mobile/android/geocoding/Point;->latitude:F

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string v1, ", longitude="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lcom/p1/mobile/android/geocoding/Point;->longitude:F

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    const-string p0, ")"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
