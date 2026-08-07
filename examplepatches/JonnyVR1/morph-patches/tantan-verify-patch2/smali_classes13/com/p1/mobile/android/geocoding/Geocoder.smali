.class public final Lcom/p1/mobile/android/geocoding/Geocoder;
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
        "\u0000d\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0007\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\u0018\u00002\u00020\u0001B\u000f\u0008\u0016\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0002\u0010\u0004B\u0017\u0008\u0016\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0002\u0010\u0008J\u0018\u0010\u001d\u001a\u0004\u0018\u00010\u000e2\u0006\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020\u001fJ\u001c\u0010!\u001a\u00020\"*\u00020\u00142\u0006\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020\u001fH\u0002J\u001c\u0010!\u001a\u00020\"*\u00020\u00172\u0006\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020\u001fH\u0002J\u001c\u0010!\u001a\u00020\"*\u00020\u00192\u0006\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020\u001fH\u0002J\u001c\u0010!\u001a\u00020\"*\u00020\u001b2\u0006\u0010\u001e\u001a\u00020\u001f2\u0006\u0010 \u001a\u00020\u001fH\u0002R\u001a\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u0001\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001a\u0010\u000c\u001a\u000e\u0012\u0004\u0012\u00020\r\u0012\u0004\u0012\u00020\u000e0\nX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u0010X\u0082.\u00a2\u0006\u0004\n\u0002\u0010\u0012R\u0018\u0010\u0013\u001a\u00020\u000b*\u00020\u00148BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u0016R\u0018\u0010\u0013\u001a\u00020\u000b*\u00020\u00178BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u0018R\u0018\u0010\u0013\u001a\u00020\u000b*\u00020\u00198BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u001aR\u0018\u0010\u0013\u001a\u00020\u000b*\u00020\u001b8BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u001c\u00a8\u0006#"
    }
    d2 = {
        "Lcom/p1/mobile/android/geocoding/Geocoder;",
        "",
        "context",
        "Landroid/content/Context;",
        "(Landroid/content/Context;)V",
        "info",
        "Ljava/io/InputStream;",
        "shapes",
        "(Ljava/io/InputStream;Ljava/io/InputStream;)V",
        "boxes",
        "",
        "Lcom/p1/mobile/android/geocoding/BoundingBox;",
        "countries",
        "",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Country;",
        "features",
        "",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Feature;",
        "[Lcom/p1/mobile/android/geocoding/Geocoding$Feature;",
        "bounding",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;",
        "getBounding",
        "(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)Lcom/p1/mobile/android/geocoding/BoundingBox;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;",
        "(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)Lcom/p1/mobile/android/geocoding/BoundingBox;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;",
        "(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)Lcom/p1/mobile/android/geocoding/BoundingBox;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Ring;",
        "(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)Lcom/p1/mobile/android/geocoding/BoundingBox;",
        "getCountry",
        "lat",
        "",
        "lon",
        "contains",
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
.field private final boxes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Object;",
            "Lcom/p1/mobile/android/geocoding/BoundingBox;",
            ">;"
        }
    .end annotation
.end field

.field private final countries:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Lcom/p1/mobile/android/geocoding/Geocoding$Country;",
            ">;"
        }
    .end annotation
.end field

.field private features:[Lcom/p1/mobile/android/geocoding/Geocoding$Feature;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 116
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    const-string v1, "geocoding/countries"

    invoke-virtual {v0, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    const-string v1, "geocoding/shapes"

    invoke-virtual {p1, v1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoder;-><init>(Ljava/io/InputStream;Ljava/io/InputStream;)V

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/io/InputStream;)V
    .locals 3
    .param p1    # Ljava/io/InputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/io/InputStream;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoder;->countries:Ljava/util/Map;

    .line 16
    .line 17
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 18
    .line 19
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoder;->boxes:Ljava/util/Map;

    .line 23
    .line 24
    :goto_0
    :try_start_0
    invoke-virtual {p1}, Ljava/io/InputStream;->available()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-lez v0, :cond_0

    .line 29
    .line 30
    invoke-static {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget-object v1, p0, Lcom/p1/mobile/android/geocoding/Geocoder;->countries:Ljava/util/Map;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getId()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-interface {v1, v2, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_3

    .line 50
    :cond_0
    sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 51
    .line 52
    const/4 v0, 0x0

    .line 53
    invoke-static {p1, v0}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    :try_start_1
    new-instance p1, Ljava/util/ArrayList;

    .line 57
    .line 58
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 59
    .line 60
    .line 61
    :goto_1
    invoke-virtual {p2}, Ljava/io/InputStream;->available()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-lez v1, :cond_1

    .line 66
    .line 67
    invoke-static {p2}, Lcom/p1/mobile/android/geocoding/Geocoding$Feature;->parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/android/geocoding/Geocoding$Feature;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 72
    .line 73
    .line 74
    goto :goto_1

    .line 75
    :catchall_1
    move-exception p0

    .line 76
    goto :goto_2

    .line 77
    :cond_1
    const/4 v1, 0x0

    .line 78
    new-array v1, v1, [Lcom/p1/mobile/android/geocoding/Geocoding$Feature;

    .line 79
    .line 80
    invoke-interface {p1, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    if-eqz p1, :cond_2

    .line 85
    .line 86
    check-cast p1, [Lcom/p1/mobile/android/geocoding/Geocoding$Feature;

    .line 87
    .line 88
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoder;->features:[Lcom/p1/mobile/android/geocoding/Geocoding$Feature;

    .line 89
    .line 90
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 91
    .line 92
    invoke-static {p2, v0}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_2
    :try_start_2
    new-instance p0, Lkotlin/TypeCastException;

    .line 97
    .line 98
    const-string p1, "null cannot be cast to non-null type kotlin.Array<T>"

    .line 99
    .line 100
    invoke-direct {p0, p1}, Lkotlin/TypeCastException;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 104
    :goto_2
    :try_start_3
    throw p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 105
    :catchall_2
    move-exception p1

    .line 106
    invoke-static {p2, p0}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    throw p1

    .line 110
    :goto_3
    :try_start_4
    throw p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 111
    :catchall_3
    move-exception p2

    .line 112
    invoke-static {p1, p0}, Lkotlin/io/CloseableKt;->a(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    .line 113
    .line 114
    .line 115
    throw p2
.end method

.method private final contains(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;FF)Z
    .locals 2
    .param p1    # Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->getPackedCase()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$PackedCase;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v1, Lcom/p1/mobile/android/geocoding/Geocoder$WhenMappings;->$EnumSwitchMapping$0:[I

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    aget v0, v1, v0

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    if-eq v0, v1, :cond_2

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->getRing()Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/android/geocoding/Geocoder;->contains(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;FF)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->getPolygon()Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/android/geocoding/Geocoder;->contains(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;FF)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0

    .line 46
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->getMultiPolygon()Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/android/geocoding/Geocoder;->contains(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;FF)Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    return p0
.end method

.method private final contains(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;FF)Z
    .locals 1
    .param p1    # Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 58
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoder;->getBounding(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)Lcom/p1/mobile/android/geocoding/BoundingBox;

    move-result-object v0

    invoke-virtual {v0, p2, p3}, Lcom/p1/mobile/android/geocoding/BoundingBox;->contains(FF)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 59
    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->getGeometriesList()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 60
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, v0, p2, p3}, Lcom/p1/mobile/android/geocoding/Geocoder;->contains(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;FF)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method private final contains(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;FF)Z
    .locals 2
    .param p1    # Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->getRing()Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, v0, p2, p3}, Lcom/p1/mobile/android/geocoding/Geocoder;->contains(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;FF)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->getHoles()Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/android/geocoding/Geocoder;->contains(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;FF)Z

    move-result p0

    goto :goto_0

    :cond_0
    move p0, v1

    :goto_0
    if-nez p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v1
.end method

.method private final contains(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;FF)Z
    .locals 0
    .param p1    # Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 62
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoder;->getBounding(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)Lcom/p1/mobile/android/geocoding/BoundingBox;

    move-result-object p0

    invoke-virtual {p0, p2, p3}, Lcom/p1/mobile/android/geocoding/BoundingBox;->contains(FF)Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-static {p1, p2, p3}, Lcom/p1/mobile/android/geocoding/GeocoderKt;->pnpoly(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;FF)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method private final getBounding(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)Lcom/p1/mobile/android/geocoding/BoundingBox;
    .locals 2
    .param p1    # Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->getPackedCase()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$PackedCase;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    sget-object v1, Lcom/p1/mobile/android/geocoding/Geocoder$WhenMappings;->$EnumSwitchMapping$1:[I

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    aget v0, v1, v0

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    if-eq v0, v1, :cond_2

    .line 18
    .line 19
    const/4 v1, 0x2

    .line 20
    if-eq v0, v1, :cond_1

    .line 21
    .line 22
    :goto_0
    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->getRing()Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoder;->getBounding(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)Lcom/p1/mobile/android/geocoding/BoundingBox;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0

    .line 34
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->getPolygon()Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    .line 40
    .line 41
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoder;->getBounding(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)Lcom/p1/mobile/android/geocoding/BoundingBox;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0

    .line 46
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->getMultiPolygon()Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 51
    .line 52
    .line 53
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoder;->getBounding(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)Lcom/p1/mobile/android/geocoding/BoundingBox;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method

.method private final getBounding(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)Lcom/p1/mobile/android/geocoding/BoundingBox;
    .locals 3
    .param p1    # Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 58
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoder;->boxes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/android/geocoding/BoundingBox;

    if-nez v0, :cond_1

    .line 59
    new-instance v0, Lcom/p1/mobile/android/geocoding/BoundingBox;

    invoke-direct {v0}, Lcom/p1/mobile/android/geocoding/BoundingBox;-><init>()V

    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->getGeometriesList()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v1, Ljava/lang/Iterable;

    .line 61
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 62
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, v2}, Lcom/p1/mobile/android/geocoding/Geocoder;->getBounding(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)Lcom/p1/mobile/android/geocoding/BoundingBox;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/p1/mobile/android/geocoding/BoundingBox;->accept(Lcom/p1/mobile/android/geocoding/BoundingBox;)V

    goto :goto_0

    .line 63
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoder;->boxes:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object v0
.end method

.method private final getBounding(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)Lcom/p1/mobile/android/geocoding/BoundingBox;
    .locals 0
    .param p1    # Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->getRing()Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoder;->getBounding(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)Lcom/p1/mobile/android/geocoding/BoundingBox;

    move-result-object p0

    return-object p0
.end method

.method private final getBounding(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)Lcom/p1/mobile/android/geocoding/BoundingBox;
    .locals 3
    .param p1    # Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 65
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoder;->boxes:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/android/geocoding/BoundingBox;

    if-nez v0, :cond_0

    .line 66
    new-instance v0, Lcom/p1/mobile/android/geocoding/BoundingBox;

    invoke-direct {v0}, Lcom/p1/mobile/android/geocoding/BoundingBox;-><init>()V

    .line 67
    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLatitudeList()Ljava/util/List;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLongitudeList()Ljava/util/List;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/geocoding/BoundingBox;->accept(Ljava/util/List;Ljava/util/List;)V

    .line 68
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoder;->boxes:Ljava/util/Map;

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    return-object v0
.end method


# virtual methods
.method public final getCountry(FF)Lcom/p1/mobile/android/geocoding/Geocoding$Country;
    .locals 7
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoder;->countries:Ljava/util/Map;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/android/geocoding/Geocoder;->features:[Lcom/p1/mobile/android/geocoding/Geocoding$Feature;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    const-string v2, "features"

    .line 8
    .line 9
    invoke-static {v2}, Lkotlin/jvm/internal/Intrinsics;->r(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    array-length v2, v1

    .line 13
    const/4 v3, 0x0

    .line 14
    :goto_0
    const/4 v4, 0x0

    .line 15
    if-ge v3, v2, :cond_2

    .line 16
    .line 17
    aget-object v5, v1, v3

    .line 18
    .line 19
    invoke-virtual {v5}, Lcom/p1/mobile/android/geocoding/Geocoding$Feature;->getGeometry()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 24
    .line 25
    .line 26
    invoke-direct {p0, v6, p1, p2}, Lcom/p1/mobile/android/geocoding/Geocoder;->contains(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;FF)Z

    .line 27
    .line 28
    .line 29
    move-result v6

    .line 30
    if-eqz v6, :cond_1

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    move-object v5, v4

    .line 37
    :goto_1
    if-eqz v5, :cond_3

    .line 38
    .line 39
    invoke-virtual {v5}, Lcom/p1/mobile/android/geocoding/Geocoding$Feature;->getCountry()I

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    :cond_3
    invoke-interface {v0, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 52
    .line 53
    return-object p0
.end method
