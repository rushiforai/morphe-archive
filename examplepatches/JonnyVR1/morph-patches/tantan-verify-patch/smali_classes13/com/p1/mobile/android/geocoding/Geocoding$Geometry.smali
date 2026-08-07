.class public final Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/geocoding/Geocoding$GeometryOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/geocoding/Geocoding;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Geometry"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$PackedCase;,
        Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;",
        ">;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$GeometryOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

.field public static final MULTIPOLYGON_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;",
            ">;"
        }
    .end annotation
.end field

.field public static final POLYGON_FIELD_NUMBER:I = 0x2

.field public static final RING_FIELD_NUMBER:I = 0x1


# instance fields
.field private packedCase_:I

.field private packed_:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->clearMultiPolygon()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->clearPacked()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->clearPolygon()V

    return-void
.end method

.method private clearMultiPolygon()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private clearPacked()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 6
    .line 7
    return-void
.end method

.method private clearPolygon()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private clearRing()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->clearRing()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->mergeMultiPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->mergePolygon(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->mergeRing(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->setMultiPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->setMultiPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->setPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->setPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->setRing(Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->setRing(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V

    return-void
.end method

.method private mergeMultiPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->getDefaultInstance()Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-eq v0, v2, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->newBuilder(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 36
    .line 37
    :goto_0
    iput v1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 38
    .line 39
    return-void
.end method

.method private mergePolygon(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->getDefaultInstance()Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-eq v0, v2, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->newBuilder(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 36
    .line 37
    :goto_0
    iput v1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 38
    .line 39
    return-void
.end method

.method private mergeRing(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getDefaultInstance()Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    if-eq v0, v2, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->newBuilder(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 36
    .line 37
    :goto_0
    iput v1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 38
    .line 39
    return-void
.end method

.method public static bridge synthetic n()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->getParserForType()Ll/ng60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method private setMultiPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 p1, 0x3

    .line 8
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 9
    .line 10
    return-void
.end method

.method private setMultiPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;)V
    .locals 0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    const/4 p1, 0x3

    .line 13
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    return-void
.end method

.method private setPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 p1, 0x2

    .line 8
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 9
    .line 10
    return-void
.end method

.method private setPolygon(Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;)V
    .locals 0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    const/4 p1, 0x2

    .line 13
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    return-void
.end method

.method private setRing(Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 9
    .line 10
    return-void
.end method

.method private setRing(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V
    .locals 0

    .line 11
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    const/4 p1, 0x1

    .line 13
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 6

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    const/4 v1, 0x3

    .line 11
    const/4 v2, 0x0

    .line 12
    const/4 v3, 0x0

    .line 13
    const/4 v4, 0x1

    .line 14
    packed-switch p1, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/l710;->a()V

    .line 18
    .line 19
    .line 20
    return-object v2

    .line 21
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->PARSER:Ll/ng60;

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    const-class p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 26
    .line 27
    monitor-enter p0

    .line 28
    :try_start_0
    sget-object p1, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->PARSER:Ll/ng60;

    .line 29
    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 33
    .line 34
    sget-object p2, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 35
    .line 36
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 37
    .line 38
    .line 39
    sput-object p1, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->PARSER:Ll/ng60;

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception p1

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    :goto_0
    monitor-exit p0

    .line 45
    goto :goto_2

    .line 46
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    throw p1

    .line 48
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->PARSER:Ll/ng60;

    .line 49
    .line 50
    return-object p0

    .line 51
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 52
    .line 53
    check-cast p3, Lcom/google/protobuf/h;

    .line 54
    .line 55
    :cond_2
    :goto_3
    if-nez v3, :cond_d

    .line 56
    .line 57
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-eqz p1, :cond_3

    .line 62
    .line 63
    const/16 v5, 0xa

    .line 64
    .line 65
    if-eq p1, v5, :cond_a

    .line 66
    .line 67
    const/16 v5, 0x12

    .line 68
    .line 69
    if-eq p1, v5, :cond_7

    .line 70
    .line 71
    const/16 v5, 0x1a

    .line 72
    .line 73
    if-eq p1, v5, :cond_4

    .line 74
    .line 75
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-nez p1, :cond_2

    .line 80
    .line 81
    :cond_3
    move v3, v4

    .line 82
    goto :goto_3

    .line 83
    :catch_0
    move-exception p1

    .line 84
    goto/16 :goto_7

    .line 85
    .line 86
    :catch_1
    move-exception p1

    .line 87
    goto/16 :goto_8

    .line 88
    .line 89
    :cond_4
    iget p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 90
    .line 91
    if-ne p1, v1, :cond_5

    .line 92
    .line 93
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 94
    .line 95
    check-cast p1, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon$Builder;

    .line 102
    .line 103
    goto :goto_4

    .line 104
    :cond_5
    move-object p1, v2

    .line 105
    :goto_4
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->parser()Ll/ng60;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    invoke-virtual {p2, v5, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 110
    .line 111
    .line 112
    move-result-object v5

    .line 113
    iput-object v5, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 114
    .line 115
    if-eqz p1, :cond_6

    .line 116
    .line 117
    check-cast v5, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 118
    .line 119
    invoke-virtual {p1, v5}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 127
    .line 128
    :cond_6
    iput v1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_7
    iget p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 132
    .line 133
    if-ne p1, v0, :cond_8

    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 136
    .line 137
    check-cast p1, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 138
    .line 139
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    check-cast p1, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon$Builder;

    .line 144
    .line 145
    goto :goto_5

    .line 146
    :cond_8
    move-object p1, v2

    .line 147
    :goto_5
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->parser()Ll/ng60;

    .line 148
    .line 149
    .line 150
    move-result-object v5

    .line 151
    invoke-virtual {p2, v5, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 152
    .line 153
    .line 154
    move-result-object v5

    .line 155
    iput-object v5, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 156
    .line 157
    if-eqz p1, :cond_9

    .line 158
    .line 159
    check-cast v5, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 160
    .line 161
    invoke-virtual {p1, v5}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 162
    .line 163
    .line 164
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 169
    .line 170
    :cond_9
    iput v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_a
    iget p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 174
    .line 175
    if-ne p1, v4, :cond_b

    .line 176
    .line 177
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 178
    .line 179
    check-cast p1, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 180
    .line 181
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    check-cast p1, Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;

    .line 186
    .line 187
    goto :goto_6

    .line 188
    :cond_b
    move-object p1, v2

    .line 189
    :goto_6
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->parser()Ll/ng60;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    invoke-virtual {p2, v5, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    iput-object v5, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 198
    .line 199
    if-eqz p1, :cond_c

    .line 200
    .line 201
    check-cast v5, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 202
    .line 203
    invoke-virtual {p1, v5}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 204
    .line 205
    .line 206
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 211
    .line 212
    :cond_c
    iput v4, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 213
    .line 214
    goto/16 :goto_3

    .line 215
    .line 216
    :catchall_1
    move-exception p0

    .line 217
    throw p0

    .line 218
    :goto_7
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 219
    .line 220
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 232
    .line 233
    .line 234
    return-object v2

    .line 235
    :goto_8
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 240
    .line 241
    .line 242
    return-object v2

    .line 243
    :cond_d
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 244
    .line 245
    return-object p0

    .line 246
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 247
    .line 248
    check-cast p3, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 249
    .line 250
    sget-object p1, Lcom/p1/mobile/android/geocoding/Geocoding$1;->$SwitchMap$com$p1$mobile$android$geocoding$Geocoding$Geometry$PackedCase:[I

    .line 251
    .line 252
    invoke-virtual {p3}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->getPackedCase()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$PackedCase;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 257
    .line 258
    .line 259
    move-result v2

    .line 260
    aget p1, p1, v2

    .line 261
    .line 262
    if-eq p1, v4, :cond_14

    .line 263
    .line 264
    if-eq p1, v0, :cond_12

    .line 265
    .line 266
    if-eq p1, v1, :cond_10

    .line 267
    .line 268
    const/4 v0, 0x4

    .line 269
    if-eq p1, v0, :cond_e

    .line 270
    .line 271
    goto :goto_9

    .line 272
    :cond_e
    iget p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 273
    .line 274
    if-eqz p1, :cond_f

    .line 275
    .line 276
    move v3, v4

    .line 277
    :cond_f
    invoke-interface {p2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->c(Z)V

    .line 278
    .line 279
    .line 280
    goto :goto_9

    .line 281
    :cond_10
    iget p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 282
    .line 283
    if-ne p1, v1, :cond_11

    .line 284
    .line 285
    move v3, v4

    .line 286
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 287
    .line 288
    iget-object v0, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 289
    .line 290
    invoke-interface {p2, v3, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 295
    .line 296
    goto :goto_9

    .line 297
    :cond_12
    iget p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 298
    .line 299
    if-ne p1, v0, :cond_13

    .line 300
    .line 301
    move v3, v4

    .line 302
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 303
    .line 304
    iget-object v0, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 305
    .line 306
    invoke-interface {p2, v3, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 311
    .line 312
    goto :goto_9

    .line 313
    :cond_14
    iget p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 314
    .line 315
    if-ne p1, v4, :cond_15

    .line 316
    .line 317
    move v3, v4

    .line 318
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 319
    .line 320
    iget-object v0, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 321
    .line 322
    invoke-interface {p2, v3, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->k(ZLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    move-result-object p1

    .line 326
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 327
    .line 328
    :goto_9
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 329
    .line 330
    if-ne p2, p1, :cond_16

    .line 331
    .line 332
    iget p1, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 333
    .line 334
    if-eqz p1, :cond_16

    .line 335
    .line 336
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 337
    .line 338
    :cond_16
    return-object p0

    .line 339
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;

    .line 340
    .line 341
    invoke-direct {p0, v2}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$Builder;-><init>(Ll/gmj;)V

    .line 342
    .line 343
    .line 344
    return-object p0

    .line 345
    :pswitch_5
    return-object v2

    .line 346
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 347
    .line 348
    return-object p0

    .line 349
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;

    .line 350
    .line 351
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;-><init>()V

    .line 352
    .line 353
    .line 354
    return-object p0

    .line 355
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public getMultiPolygon()Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;->getDefaultInstance()Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getPackedCase()Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$PackedCase;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$PackedCase;->forNumber(I)Lcom/p1/mobile/android/geocoding/Geocoding$Geometry$PackedCase;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPolygon()Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;->getDefaultInstance()Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getRing()Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 2

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getDefaultInstance()Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getSerializedSize()I
    .locals 3

    .line 1
    iget v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne v0, v1, :cond_1

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 15
    .line 16
    invoke-static {v1, v0}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 v0, 0x0

    .line 22
    :goto_0
    iget v1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 23
    .line 24
    const/4 v2, 0x2

    .line 25
    if-ne v1, v2, :cond_2

    .line 26
    .line 27
    iget-object v1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v1, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 30
    .line 31
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    add-int/2addr v0, v1

    .line 36
    :cond_2
    iget v1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 37
    .line 38
    const/4 v2, 0x3

    .line 39
    if-ne v1, v2, :cond_3

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast v1, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 44
    .line 45
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    add-int/2addr v0, v1

    .line 50
    :cond_3
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 51
    .line 52
    return v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 9
    .line 10
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 14
    .line 15
    const/4 v1, 0x2

    .line 16
    if-ne v0, v1, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Polygon;

    .line 21
    .line 22
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packedCase_:I

    .line 26
    .line 27
    const/4 v1, 0x3

    .line 28
    if-ne v0, v1, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Geometry;->packed_:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$MultiPolygon;

    .line 33
    .line 34
    invoke-virtual {p1, v1, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    return-void
.end method
