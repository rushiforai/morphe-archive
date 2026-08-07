.class public final Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygonOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;",
        ">;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygonOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->j()Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$b;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/gmj;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllGeometries(Ljava/lang/Iterable;)Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;",
            ">;)",
            "Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->a(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addGeometries(ILcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;)Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->b(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;ILcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;)V

    return-object p0
.end method

.method public addGeometries(ILcom/p1/mobile/android/geocoding/Geocoding$Geometry;)Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->c(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;ILcom/p1/mobile/android/geocoding/Geocoding$Geometry;)V

    return-object p0
.end method

.method public addGeometries(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;)Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->d(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;)V

    return-object p0
.end method

.method public addGeometries(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->e(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearGeometries()Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->f(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getGeometries(I)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->getGeometries(I)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getGeometriesCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->getGeometriesCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getGeometriesList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->getGeometriesList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public removeGeometries(I)Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->g(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGeometries(ILcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;)Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->h(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;ILcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;)V

    return-object p0
.end method

.method public setGeometries(ILcom/p1/mobile/android/geocoding/Geocoding$Geometry;)Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->i(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;ILcom/p1/mobile/android/geocoding/Geocoding$Geometry;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
