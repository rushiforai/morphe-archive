.class public final Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/geocoding/Geocoding$GeometryOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;",
        ">;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$GeometryOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->n()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

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
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearMultiPolygon()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->a(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPacked()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->b(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPolygon()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->c(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRing()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->d(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getMultiPolygon()Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->getMultiPolygon()Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPackedCase()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$PackedCase;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->getPackedCase()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$PackedCase;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPolygon()Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->getPolygon()Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getRing()Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->getRing()Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public mergeMultiPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->e(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergePolygon(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->f(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeRing(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->g(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMultiPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->h(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;)V

    return-object p0
.end method

.method public setMultiPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->i(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->j(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;)V

    return-object p0
.end method

.method public setPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->k(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRing(Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->l(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;)V

    return-object p0
.end method

.method public setRing(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->m(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
