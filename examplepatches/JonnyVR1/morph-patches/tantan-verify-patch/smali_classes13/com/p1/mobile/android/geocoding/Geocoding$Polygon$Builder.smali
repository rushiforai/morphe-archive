.class public final Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/geocoding/Geocoding$PolygonOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;",
        ">;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$PolygonOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->i()Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

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
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearHoles()Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->a(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearRing()Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->b(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getHoles()Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->getHoles()Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

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
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->getRing()Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasHoles()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->hasHoles()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasRing()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->hasRing()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeHoles(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->c(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeRing(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->d(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setHoles(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;)Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->e(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;)V

    return-object p0
.end method

.method public setHoles(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->f(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setRing(Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;)Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->g(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;)V

    return-object p0
.end method

.method public setRing(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->h(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
