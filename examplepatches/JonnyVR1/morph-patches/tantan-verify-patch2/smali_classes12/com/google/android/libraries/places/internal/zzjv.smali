.class public final Lcom/google/android/libraries/places/internal/zzjv;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final zza:Lcom/google/android/libraries/places/internal/zznx;


# direct methods
.method static constructor <clinit>()V
    .locals 41

    .line 1
    const-string v26, "viewport"

    .line 2
    .line 3
    const-string v27, "websiteUri"

    .line 4
    .line 5
    const-string v1, "iconMaskBaseUri"

    .line 6
    .line 7
    const-string v2, "id"

    .line 8
    .line 9
    const-string v3, "internationalPhoneNumber"

    .line 10
    .line 11
    const-string v4, "location"

    .line 12
    .line 13
    const-string v5, "photos"

    .line 14
    .line 15
    const-string v6, "plusCode"

    .line 16
    .line 17
    const-string v7, "priceLevel"

    .line 18
    .line 19
    const-string v8, "primaryType"

    .line 20
    .line 21
    const-string v9, "primaryTypeDisplayName"

    .line 22
    .line 23
    const-string v10, "rating"

    .line 24
    .line 25
    const-string v11, "regularOpeningHours"

    .line 26
    .line 27
    const-string v12, "regularSecondaryOpeningHours"

    .line 28
    .line 29
    const-string v13, "reservable"

    .line 30
    .line 31
    const-string v14, "reviews"

    .line 32
    .line 33
    const-string v15, "servesBeer"

    .line 34
    .line 35
    const-string v16, "servesBreakfast"

    .line 36
    .line 37
    const-string v17, "servesBrunch"

    .line 38
    .line 39
    const-string v18, "servesDinner"

    .line 40
    .line 41
    const-string v19, "servesLunch"

    .line 42
    .line 43
    const-string v20, "servesVegetarianFood"

    .line 44
    .line 45
    const-string v21, "servesWine"

    .line 46
    .line 47
    const-string v22, "takeout"

    .line 48
    .line 49
    const-string v23, "types"

    .line 50
    .line 51
    const-string v24, "userRatingCount"

    .line 52
    .line 53
    const-string v25, "utcOffsetMinutes"

    .line 54
    .line 55
    filled-new-array/range {v1 .. v27}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v40

    .line 59
    const-string v38, "formattedAddress"

    .line 60
    .line 61
    const-string v39, "iconBackgroundColor"

    .line 62
    .line 63
    const-string v28, "accessibilityOptions"

    .line 64
    .line 65
    const-string v29, "addressComponents"

    .line 66
    .line 67
    const-string v30, "attributions"

    .line 68
    .line 69
    const-string v31, "businessStatus"

    .line 70
    .line 71
    const-string v32, "curbsidePickup"

    .line 72
    .line 73
    const-string v33, "currentOpeningHours"

    .line 74
    .line 75
    const-string v34, "delivery"

    .line 76
    .line 77
    const-string v35, "dineIn"

    .line 78
    .line 79
    const-string v36, "displayName"

    .line 80
    .line 81
    const-string v37, "editorialSummary"

    .line 82
    .line 83
    invoke-static/range {v28 .. v40}, Lcom/google/android/libraries/places/internal/zznx;->zzo(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;[Ljava/lang/Object;)Lcom/google/android/libraries/places/internal/zznx;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    sput-object v0, Lcom/google/android/libraries/places/internal/zzjv;->zza:Lcom/google/android/libraries/places/internal/zznx;

    .line 88
    .line 89
    return-void
.end method

.method public static zza(Ljava/util/List;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "attributions"

    .line 7
    .line 8
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzjv;->zzc(Ljava/util/List;Z)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public static zzb(Ljava/util/List;)Ljava/lang/String;
    .locals 1

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "attributions"

    .line 7
    .line 8
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    invoke-static {v0, p0}, Lcom/google/android/libraries/places/internal/zzjv;->zzc(Ljava/util/List;Z)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method private static zzc(Ljava/util/List;Z)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string p0, ""

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    check-cast v1, Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p1, :cond_1

    .line 32
    .line 33
    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "places."

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :cond_1
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    const-string p0, ","

    .line 48
    .line 49
    invoke-static {p0}, Lcom/google/android/libraries/places/internal/zzmh;->zzc(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzmh;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, v0}, Lcom/google/android/libraries/places/internal/zzmh;->zzf(Ljava/lang/Iterable;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    return-object p0
.end method
