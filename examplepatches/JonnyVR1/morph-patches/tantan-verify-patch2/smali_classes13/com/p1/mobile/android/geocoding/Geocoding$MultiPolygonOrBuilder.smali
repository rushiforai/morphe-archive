.class public interface abstract Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygonOrBuilder;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/lfz;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/geocoding/Geocoding;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "MultiPolygonOrBuilder"
.end annotation


# virtual methods
.method public abstract synthetic getDefaultInstanceForType()Lcom/google/protobuf/q;
.end method

.method public abstract getGeometries(I)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
.end method

.method public abstract getGeometriesCount()I
.end method

.method public abstract getGeometriesList()Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;",
            ">;"
        }
    .end annotation
.end method

.method public abstract synthetic isInitialized()Z
.end method
