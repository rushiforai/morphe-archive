.class public abstract Lcom/google/android/libraries/places/api/net/IsOpenRequest;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/libraries/places/internal/zzjt;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static builder(Lcom/google/android/libraries/places/api/model/Place;)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;
    .locals 3
    .param p0    # Lcom/google/android/libraries/places/api/model/Place;
        .annotation build Landroidx/annotation/RecentlyNonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RecentlyNonNull;
    .end annotation

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/api/net/zzu;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/google/android/libraries/places/api/net/zzu;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/api/net/zzu;->setPlace(Lcom/google/android/libraries/places/api/model/Place;)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;

    .line 7
    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v1

    .line 13
    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;->setUtcTimeMillis(J)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public static builder(Lcom/google/android/libraries/places/api/model/Place;J)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;
    .locals 1
    .param p0    # Lcom/google/android/libraries/places/api/model/Place;
        .annotation build Landroidx/annotation/RecentlyNonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RecentlyNonNull;
    .end annotation

    .line 17
    new-instance v0, Lcom/google/android/libraries/places/api/net/zzu;

    invoke-direct {v0}, Lcom/google/android/libraries/places/api/net/zzu;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/api/net/zzu;->setPlace(Lcom/google/android/libraries/places/api/model/Place;)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;

    invoke-virtual {v0, p1, p2}, Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;->setUtcTimeMillis(J)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;

    return-object v0
.end method

.method public static builder(Ljava/lang/String;)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;
    .locals 3
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/RecentlyNonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RecentlyNonNull;
    .end annotation

    .line 18
    new-instance v0, Lcom/google/android/libraries/places/api/net/zzu;

    invoke-direct {v0}, Lcom/google/android/libraries/places/api/net/zzu;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/api/net/zzu;->setPlaceId(Ljava/lang/String;)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;

    .line 19
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;->setUtcTimeMillis(J)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;

    return-object v0
.end method

.method public static builder(Ljava/lang/String;J)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;
    .locals 1
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/RecentlyNonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RecentlyNonNull;
    .end annotation

    .line 20
    new-instance v0, Lcom/google/android/libraries/places/api/net/zzu;

    invoke-direct {v0}, Lcom/google/android/libraries/places/api/net/zzu;-><init>()V

    invoke-virtual {v0, p0}, Lcom/google/android/libraries/places/api/net/zzu;->setPlaceId(Ljava/lang/String;)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;

    .line 21
    invoke-virtual {v0, p1, p2}, Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;->setUtcTimeMillis(J)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;

    return-object v0
.end method

.method public static newInstance(Lcom/google/android/libraries/places/api/model/Place;)Lcom/google/android/libraries/places/api/net/IsOpenRequest;
    .locals 0
    .param p0    # Lcom/google/android/libraries/places/api/model/Place;
        .annotation build Landroidx/annotation/RecentlyNonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RecentlyNonNull;
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/google/android/libraries/places/api/net/IsOpenRequest;->builder(Lcom/google/android/libraries/places/api/model/Place;)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;->build()Lcom/google/android/libraries/places/api/net/IsOpenRequest;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static newInstance(Lcom/google/android/libraries/places/api/model/Place;J)Lcom/google/android/libraries/places/api/net/IsOpenRequest;
    .locals 0
    .param p0    # Lcom/google/android/libraries/places/api/model/Place;
        .annotation build Landroidx/annotation/RecentlyNonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RecentlyNonNull;
    .end annotation

    .line 10
    invoke-static {p0, p1, p2}, Lcom/google/android/libraries/places/api/net/IsOpenRequest;->builder(Lcom/google/android/libraries/places/api/model/Place;J)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;->build()Lcom/google/android/libraries/places/api/net/IsOpenRequest;

    move-result-object p0

    return-object p0
.end method

.method public static newInstance(Ljava/lang/String;)Lcom/google/android/libraries/places/api/net/IsOpenRequest;
    .locals 0
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/RecentlyNonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RecentlyNonNull;
    .end annotation

    .line 11
    invoke-static {p0}, Lcom/google/android/libraries/places/api/net/IsOpenRequest;->builder(Ljava/lang/String;)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;->build()Lcom/google/android/libraries/places/api/net/IsOpenRequest;

    move-result-object p0

    return-object p0
.end method

.method public static newInstance(Ljava/lang/String;J)Lcom/google/android/libraries/places/api/net/IsOpenRequest;
    .locals 0
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/RecentlyNonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RecentlyNonNull;
    .end annotation

    .line 12
    invoke-static {p0, p1, p2}, Lcom/google/android/libraries/places/api/net/IsOpenRequest;->builder(Ljava/lang/String;J)Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/android/libraries/places/api/net/IsOpenRequest$Builder;->build()Lcom/google/android/libraries/places/api/net/IsOpenRequest;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public abstract getCancellationToken()Ll/gg4;
    .annotation build Landroidx/annotation/RecentlyNullable;
    .end annotation
.end method

.method public abstract getPlace()Lcom/google/android/libraries/places/api/model/Place;
    .annotation build Landroidx/annotation/RecentlyNullable;
    .end annotation
.end method

.method public abstract getPlaceId()Ljava/lang/String;
    .annotation build Landroidx/annotation/RecentlyNullable;
    .end annotation
.end method

.method public abstract getUtcTimeMillis()J
.end method
