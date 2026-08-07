.class public final Lcom/p1/mobile/android/geocoding/BoundingBox;
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
        "\u0000<\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0010\u0007\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000e\n\u0000\u0008\u0080\u0008\u0018\u00002\u00020\u0001B\u0007\u0008\u0016\u00a2\u0006\u0002\u0010\u0002B\u0015\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0006J\u000e\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\u0000J\"\u0010\n\u001a\u00020\u000b2\u000c\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000e2\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000eJ\t\u0010\u0011\u001a\u00020\u0004H\u00c6\u0003J\t\u0010\u0012\u001a\u00020\u0004H\u00c6\u0003J\u0016\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u000f2\u0006\u0010\u0016\u001a\u00020\u000fJ\u001d\u0010\u0017\u001a\u00020\u00002\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u00042\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0004H\u00c6\u0001J\u0013\u0010\u0018\u001a\u00020\u00142\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u0001H\u00d6\u0003J\t\u0010\u001a\u001a\u00020\u001bH\u00d6\u0001J\u0008\u0010\u001c\u001a\u00020\u001dH\u0016R\u0011\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u0011\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\u0008\u00a8\u0006\u001e"
    }
    d2 = {
        "Lcom/p1/mobile/android/geocoding/BoundingBox;",
        "",
        "()V",
        "max",
        "Lcom/p1/mobile/android/geocoding/Point;",
        "min",
        "(Lcom/p1/mobile/android/geocoding/Point;Lcom/p1/mobile/android/geocoding/Point;)V",
        "getMax",
        "()Lcom/p1/mobile/android/geocoding/Point;",
        "getMin",
        "accept",
        "",
        "box",
        "latitude",
        "",
        "",
        "longitude",
        "component1",
        "component2",
        "contains",
        "",
        "lat",
        "lon",
        "copy",
        "equals",
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
.field private final max:Lcom/p1/mobile/android/geocoding/Point;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final min:Lcom/p1/mobile/android/geocoding/Point;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/android/geocoding/Point;

    .line 2
    .line 3
    sget-object v1, Lkotlin/jvm/internal/FloatCompanionObject;->INSTANCE:Lkotlin/jvm/internal/FloatCompanionObject;

    .line 4
    .line 5
    invoke-virtual {v1}, Lkotlin/jvm/internal/FloatCompanionObject;->a()F

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    invoke-virtual {v1}, Lkotlin/jvm/internal/FloatCompanionObject;->a()F

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    invoke-direct {v0, v2, v3}, Lcom/p1/mobile/android/geocoding/Point;-><init>(FF)V

    .line 14
    .line 15
    .line 16
    new-instance v2, Lcom/p1/mobile/android/geocoding/Point;

    .line 17
    .line 18
    invoke-virtual {v1}, Lkotlin/jvm/internal/FloatCompanionObject;->b()F

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {v1}, Lkotlin/jvm/internal/FloatCompanionObject;->b()F

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-direct {v2, v3, v1}, Lcom/p1/mobile/android/geocoding/Point;-><init>(FF)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, v0, v2}, Lcom/p1/mobile/android/geocoding/BoundingBox;-><init>(Lcom/p1/mobile/android/geocoding/Point;Lcom/p1/mobile/android/geocoding/Point;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Lcom/p1/mobile/android/geocoding/Point;Lcom/p1/mobile/android/geocoding/Point;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/android/geocoding/Point;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/android/geocoding/Point;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    iput-object p2, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    return-void
.end method

.method public static synthetic copy$default(Lcom/p1/mobile/android/geocoding/BoundingBox;Lcom/p1/mobile/android/geocoding/Point;Lcom/p1/mobile/android/geocoding/Point;ILjava/lang/Object;)Lcom/p1/mobile/android/geocoding/BoundingBox;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    iget-object p2, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    :cond_1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/android/geocoding/BoundingBox;->copy(Lcom/p1/mobile/android/geocoding/Point;Lcom/p1/mobile/android/geocoding/Point;)Lcom/p1/mobile/android/geocoding/BoundingBox;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final accept(Lcom/p1/mobile/android/geocoding/BoundingBox;)V
    .locals 3
    .param p1    # Lcom/p1/mobile/android/geocoding/BoundingBox;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 106
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    .line 107
    invoke-virtual {v0}, Lcom/p1/mobile/android/geocoding/Point;->getLatitude()F

    move-result v1

    iget-object v2, p1, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    invoke-virtual {v2}, Lcom/p1/mobile/android/geocoding/Point;->getLatitude()F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/geocoding/Point;->setLatitude(F)V

    .line 108
    invoke-virtual {v0}, Lcom/p1/mobile/android/geocoding/Point;->getLongitude()F

    move-result v1

    iget-object v2, p1, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    invoke-virtual {v2}, Lcom/p1/mobile/android/geocoding/Point;->getLongitude()F

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/geocoding/Point;->setLongitude(F)V

    .line 109
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    .line 110
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Point;->getLatitude()F

    move-result v0

    iget-object v1, p1, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    invoke-virtual {v1}, Lcom/p1/mobile/android/geocoding/Point;->getLatitude()F

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/geocoding/Point;->setLatitude(F)V

    .line 111
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Point;->getLongitude()F

    move-result v0

    iget-object p1, p1, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Point;->getLongitude()F

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/geocoding/Point;->setLongitude(F)V

    return-void
.end method

.method public final accept(Ljava/util/List;Ljava/util/List;)V
    .locals 3
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    check-cast p1, Ljava/lang/Iterable;

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ljava/lang/Number;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/Number;->floatValue()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iget-object v1, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    .line 30
    .line 31
    invoke-virtual {v1}, Lcom/p1/mobile/android/geocoding/Point;->getLatitude()F

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    invoke-static {v2, v0}, Ljava/lang/Math;->max(FF)F

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {v1, v2}, Lcom/p1/mobile/android/geocoding/Point;->setLatitude(F)V

    .line 40
    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/android/geocoding/Point;->getLatitude()F

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-virtual {v1, v0}, Lcom/p1/mobile/android/geocoding/Point;->setLatitude(F)V

    .line 53
    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    check-cast p2, Ljava/lang/Iterable;

    .line 57
    .line 58
    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-eqz p2, :cond_1

    .line 67
    .line 68
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    check-cast p2, Ljava/lang/Number;

    .line 73
    .line 74
    invoke-virtual {p2}, Ljava/lang/Number;->floatValue()F

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/p1/mobile/android/geocoding/Point;->getLongitude()F

    .line 81
    .line 82
    .line 83
    move-result v1

    .line 84
    invoke-static {v1, p2}, Ljava/lang/Math;->max(FF)F

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/geocoding/Point;->setLongitude(F)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/p1/mobile/android/geocoding/Point;->getLongitude()F

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    invoke-static {v1, p2}, Ljava/lang/Math;->min(FF)F

    .line 98
    .line 99
    .line 100
    move-result p2

    .line 101
    invoke-virtual {v0, p2}, Lcom/p1/mobile/android/geocoding/Point;->setLongitude(F)V

    .line 102
    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_1
    return-void
.end method

.method public final component1()Lcom/p1/mobile/android/geocoding/Point;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    return-object p0
.end method

.method public final component2()Lcom/p1/mobile/android/geocoding/Point;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    return-object p0
.end method

.method public final contains(FF)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/android/geocoding/Point;->getLatitude()F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    cmpg-float v0, p1, v0

    .line 8
    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/p1/mobile/android/geocoding/Point;->getLongitude()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    cmpg-float v0, p2, v0

    .line 18
    .line 19
    if-gtz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/p1/mobile/android/geocoding/Point;->getLatitude()F

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    cmpl-float p1, p1, v0

    .line 28
    .line 29
    if-ltz p1, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Point;->getLongitude()F

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    cmpl-float p0, p2, p0

    .line 38
    .line 39
    if-ltz p0, :cond_0

    .line 40
    .line 41
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_0
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public final copy(Lcom/p1/mobile/android/geocoding/Point;Lcom/p1/mobile/android/geocoding/Point;)Lcom/p1/mobile/android/geocoding/BoundingBox;
    .locals 0
    .param p1    # Lcom/p1/mobile/android/geocoding/Point;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/p1/mobile/android/geocoding/Point;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p0, Lcom/p1/mobile/android/geocoding/BoundingBox;

    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/geocoding/BoundingBox;-><init>(Lcom/p1/mobile/android/geocoding/Point;Lcom/p1/mobile/android/geocoding/Point;)V

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 2
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    if-eq p0, p1, :cond_1

    instance-of v0, p1, Lcom/p1/mobile/android/geocoding/BoundingBox;

    if-eqz v0, :cond_0

    check-cast p1, Lcom/p1/mobile/android/geocoding/BoundingBox;

    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    iget-object v1, p1, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    iget-object p1, p1, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public final getMax()Lcom/p1/mobile/android/geocoding/Point;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    .line 2
    .line 3
    return-object p0
.end method

.method public final getMin()Lcom/p1/mobile/android/geocoding/Point;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 2

    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :cond_1
    add-int/2addr v0, v1

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "BoundingBox(max="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->max:Lcom/p1/mobile/android/geocoding/Point;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", min="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/BoundingBox;->min:Lcom/p1/mobile/android/geocoding/Point;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const/16 p0, 0x29

    .line 24
    .line 25
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method
