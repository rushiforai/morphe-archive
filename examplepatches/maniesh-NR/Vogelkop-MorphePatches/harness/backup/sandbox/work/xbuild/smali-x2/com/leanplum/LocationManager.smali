.class public interface abstract Lcom/leanplum/LocationManager;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract setRegionsData(Ljava/util/Map;Ljava/util/Set;Ljava/util/Set;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation
.end method

.method public abstract updateGeofencing()V
.end method

.method public abstract updateUserLocation()V
.end method
