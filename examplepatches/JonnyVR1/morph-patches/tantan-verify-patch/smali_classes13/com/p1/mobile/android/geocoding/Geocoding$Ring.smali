.class public final Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/geocoding/Geocoding$RingOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/geocoding/Geocoding;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Ring"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Ring;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;",
        ">;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$RingOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

.field public static final LATITUDE_FIELD_NUMBER:I = 0x1

.field public static final LONGITUDE_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/android/geocoding/Geocoding$Ring;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private latitude_:Lcom/google/protobuf/l$e;

.field private longitude_:Lcom/google/protobuf/l$e;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

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
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyFloatList()Lcom/google/protobuf/l$e;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 9
    .line 10
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyFloatList()Lcom/google/protobuf/l$e;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->addAllLatitude(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllLatitude(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->ensureLatitudeIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addAllLongitude(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/lang/Float;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->ensureLongitudeIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addLatitude(F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->ensureLatitudeIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Lcom/google/protobuf/l$e;->M(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addLongitude(F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->ensureLongitudeIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Lcom/google/protobuf/l$e;->M(F)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->addAllLongitude(Ljava/lang/Iterable;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->addLatitude(F)V

    return-void
.end method

.method private clearLatitude()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyFloatList()Lcom/google/protobuf/l$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 6
    .line 7
    return-void
.end method

.method private clearLongitude()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyFloatList()Lcom/google/protobuf/l$e;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 6
    .line 7
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->addLongitude(F)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->clearLatitude()V

    return-void
.end method

.method private ensureLatitudeIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$e;)Lcom/google/protobuf/l$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private ensureLongitudeIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$e;)Lcom/google/protobuf/l$e;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->clearLongitude()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;IF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->setLatitude(IF)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;IF)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->setLongitude(IF)V

    return-void
.end method

.method public static bridge synthetic i()Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    return-object v0
.end method

.method public static newBuilder()Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/android/geocoding/Geocoding$Ring;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

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

.method private setLatitude(IF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->ensureLatitudeIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2}, Lcom/google/protobuf/l$e;->setFloat(IF)F

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private setLongitude(IF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->ensureLongitudeIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 5
    .line 6
    invoke-interface {p0, p1, p2}, Lcom/google/protobuf/l$e;->setFloat(IF)F

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

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
    const/4 v0, 0x0

    .line 10
    packed-switch p1, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/l710;->a()V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->PARSER:Ll/ng60;

    .line 18
    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    const-class p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 22
    .line 23
    monitor-enter p0

    .line 24
    :try_start_0
    sget-object p1, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->PARSER:Ll/ng60;

    .line 25
    .line 26
    if-nez p1, :cond_0

    .line 27
    .line 28
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 29
    .line 30
    sget-object p2, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 31
    .line 32
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 33
    .line 34
    .line 35
    sput-object p1, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->PARSER:Ll/ng60;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    :goto_0
    monitor-exit p0

    .line 41
    goto :goto_2

    .line 42
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    throw p1

    .line 44
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->PARSER:Ll/ng60;

    .line 45
    .line 46
    return-object p0

    .line 47
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 48
    .line 49
    check-cast p3, Lcom/google/protobuf/h;

    .line 50
    .line 51
    const/4 p1, 0x0

    .line 52
    :cond_2
    :goto_3
    if-nez p1, :cond_e

    .line 53
    .line 54
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 55
    .line 56
    .line 57
    move-result p3

    .line 58
    const/4 v1, 0x1

    .line 59
    if-eqz p3, :cond_3

    .line 60
    .line 61
    const/16 v2, 0xa

    .line 62
    .line 63
    if-eq p3, v2, :cond_b

    .line 64
    .line 65
    const/16 v2, 0xd

    .line 66
    .line 67
    if-eq p3, v2, :cond_9

    .line 68
    .line 69
    const/16 v2, 0x12

    .line 70
    .line 71
    if-eq p3, v2, :cond_6

    .line 72
    .line 73
    const/16 v2, 0x15

    .line 74
    .line 75
    if-eq p3, v2, :cond_4

    .line 76
    .line 77
    invoke-virtual {p2, p3}, Lcom/google/protobuf/e;->R(I)Z

    .line 78
    .line 79
    .line 80
    move-result p3

    .line 81
    if-nez p3, :cond_2

    .line 82
    .line 83
    :cond_3
    move p1, v1

    .line 84
    goto :goto_3

    .line 85
    :catch_0
    move-exception p1

    .line 86
    goto/16 :goto_6

    .line 87
    .line 88
    :catch_1
    move-exception p1

    .line 89
    goto/16 :goto_7

    .line 90
    .line 91
    :cond_4
    iget-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 92
    .line 93
    invoke-interface {p3}, Lcom/google/protobuf/l$h;->q()Z

    .line 94
    .line 95
    .line 96
    move-result p3

    .line 97
    if-nez p3, :cond_5

    .line 98
    .line 99
    iget-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 100
    .line 101
    invoke-static {p3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$e;)Lcom/google/protobuf/l$e;

    .line 102
    .line 103
    .line 104
    move-result-object p3

    .line 105
    iput-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 106
    .line 107
    :cond_5
    iget-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 108
    .line 109
    invoke-virtual {p2}, Lcom/google/protobuf/e;->s()F

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    invoke-interface {p3, v1}, Lcom/google/protobuf/l$e;->M(F)V

    .line 114
    .line 115
    .line 116
    goto :goto_3

    .line 117
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->C()I

    .line 118
    .line 119
    .line 120
    move-result p3

    .line 121
    invoke-virtual {p2, p3}, Lcom/google/protobuf/e;->l(I)I

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    iget-object v2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 126
    .line 127
    invoke-interface {v2}, Lcom/google/protobuf/l$h;->q()Z

    .line 128
    .line 129
    .line 130
    move-result v2

    .line 131
    if-nez v2, :cond_7

    .line 132
    .line 133
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    if-lez v2, :cond_7

    .line 138
    .line 139
    iget-object v2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 140
    .line 141
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    iget-object v3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 146
    .line 147
    div-int/lit8 p3, p3, 0x4

    .line 148
    .line 149
    add-int/2addr v2, p3

    .line 150
    invoke-interface {v3, v2}, Lcom/google/protobuf/l$e;->d(I)Lcom/google/protobuf/l$e;

    .line 151
    .line 152
    .line 153
    move-result-object p3

    .line 154
    iput-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 155
    .line 156
    :cond_7
    :goto_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 157
    .line 158
    .line 159
    move-result p3

    .line 160
    if-lez p3, :cond_8

    .line 161
    .line 162
    iget-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 163
    .line 164
    invoke-virtual {p2}, Lcom/google/protobuf/e;->s()F

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    invoke-interface {p3, v2}, Lcom/google/protobuf/l$e;->M(F)V

    .line 169
    .line 170
    .line 171
    goto :goto_4

    .line 172
    :cond_8
    invoke-virtual {p2, v1}, Lcom/google/protobuf/e;->k(I)V

    .line 173
    .line 174
    .line 175
    goto :goto_3

    .line 176
    :cond_9
    iget-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 177
    .line 178
    invoke-interface {p3}, Lcom/google/protobuf/l$h;->q()Z

    .line 179
    .line 180
    .line 181
    move-result p3

    .line 182
    if-nez p3, :cond_a

    .line 183
    .line 184
    iget-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 185
    .line 186
    invoke-static {p3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$e;)Lcom/google/protobuf/l$e;

    .line 187
    .line 188
    .line 189
    move-result-object p3

    .line 190
    iput-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 191
    .line 192
    :cond_a
    iget-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 193
    .line 194
    invoke-virtual {p2}, Lcom/google/protobuf/e;->s()F

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    invoke-interface {p3, v1}, Lcom/google/protobuf/l$e;->M(F)V

    .line 199
    .line 200
    .line 201
    goto/16 :goto_3

    .line 202
    .line 203
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->C()I

    .line 204
    .line 205
    .line 206
    move-result p3

    .line 207
    invoke-virtual {p2, p3}, Lcom/google/protobuf/e;->l(I)I

    .line 208
    .line 209
    .line 210
    move-result v1

    .line 211
    iget-object v2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 212
    .line 213
    invoke-interface {v2}, Lcom/google/protobuf/l$h;->q()Z

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    if-nez v2, :cond_c

    .line 218
    .line 219
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 220
    .line 221
    .line 222
    move-result v2

    .line 223
    if-lez v2, :cond_c

    .line 224
    .line 225
    iget-object v2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 226
    .line 227
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 228
    .line 229
    .line 230
    move-result v2

    .line 231
    iget-object v3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 232
    .line 233
    div-int/lit8 p3, p3, 0x4

    .line 234
    .line 235
    add-int/2addr v2, p3

    .line 236
    invoke-interface {v3, v2}, Lcom/google/protobuf/l$e;->d(I)Lcom/google/protobuf/l$e;

    .line 237
    .line 238
    .line 239
    move-result-object p3

    .line 240
    iput-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 241
    .line 242
    :cond_c
    :goto_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->d()I

    .line 243
    .line 244
    .line 245
    move-result p3

    .line 246
    if-lez p3, :cond_d

    .line 247
    .line 248
    iget-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 249
    .line 250
    invoke-virtual {p2}, Lcom/google/protobuf/e;->s()F

    .line 251
    .line 252
    .line 253
    move-result v2

    .line 254
    invoke-interface {p3, v2}, Lcom/google/protobuf/l$e;->M(F)V

    .line 255
    .line 256
    .line 257
    goto :goto_5

    .line 258
    :cond_d
    invoke-virtual {p2, v1}, Lcom/google/protobuf/e;->k(I)V
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 259
    .line 260
    .line 261
    goto/16 :goto_3

    .line 262
    .line 263
    :catchall_1
    move-exception p0

    .line 264
    throw p0

    .line 265
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 266
    .line 267
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 275
    .line 276
    .line 277
    move-result-object p0

    .line 278
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 279
    .line 280
    .line 281
    return-object v0

    .line 282
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 287
    .line 288
    .line 289
    return-object v0

    .line 290
    :cond_e
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 291
    .line 292
    return-object p0

    .line 293
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 294
    .line 295
    check-cast p3, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 296
    .line 297
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 298
    .line 299
    iget-object v0, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 300
    .line 301
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->b(Lcom/google/protobuf/l$e;Lcom/google/protobuf/l$e;)Lcom/google/protobuf/l$e;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 306
    .line 307
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 308
    .line 309
    iget-object p3, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 310
    .line 311
    invoke-interface {p2, p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->b(Lcom/google/protobuf/l$e;Lcom/google/protobuf/l$e;)Lcom/google/protobuf/l$e;

    .line 312
    .line 313
    .line 314
    move-result-object p1

    .line 315
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 316
    .line 317
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 318
    .line 319
    return-object p0

    .line 320
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;

    .line 321
    .line 322
    invoke-direct {p0, v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;-><init>(Ll/gmj;)V

    .line 323
    .line 324
    .line 325
    return-object p0

    .line 326
    :pswitch_5
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 327
    .line 328
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->n()V

    .line 329
    .line 330
    .line 331
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 332
    .line 333
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 334
    .line 335
    .line 336
    return-object v0

    .line 337
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 338
    .line 339
    return-object p0

    .line 340
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 341
    .line 342
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;-><init>()V

    .line 343
    .line 344
    .line 345
    return-object p0

    .line 346
    nop

    .line 347
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

.method public getLatitude(I)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/google/protobuf/l$e;->getFloat(I)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLatitudeCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLatitudeList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLongitude(I)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/google/protobuf/l$e;->getFloat(I)F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLongitudeCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLongitudeList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSerializedSize()I
    .locals 2

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
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLatitudeList()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    mul-int/lit8 v0, v0, 0x4

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLatitudeList()Ljava/util/List;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    add-int/2addr v0, v1

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLongitudeList()Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    mul-int/lit8 v1, v1, 0x4

    .line 35
    .line 36
    add-int/2addr v0, v1

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLongitudeList()Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    add-int/2addr v0, v1

    .line 46
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 47
    .line 48
    return v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getSerializedSize()I

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    move v1, v0

    .line 6
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 7
    .line 8
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-ge v1, v2, :cond_0

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->latitude_:Lcom/google/protobuf/l$e;

    .line 15
    .line 16
    invoke-interface {v2, v1}, Lcom/google/protobuf/l$e;->getFloat(I)F

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v3, 0x1

    .line 21
    invoke-virtual {p1, v3, v2}, Lcom/google/protobuf/CodedOutputStream;->o0(IF)V

    .line 22
    .line 23
    .line 24
    add-int/lit8 v1, v1, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-ge v0, v1, :cond_1

    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->longitude_:Lcom/google/protobuf/l$e;

    .line 36
    .line 37
    invoke-interface {v1, v0}, Lcom/google/protobuf/l$e;->getFloat(I)F

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/4 v2, 0x2

    .line 42
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->o0(IF)V

    .line 43
    .line 44
    .line 45
    add-int/lit8 v0, v0, 0x1

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    return-void
.end method
