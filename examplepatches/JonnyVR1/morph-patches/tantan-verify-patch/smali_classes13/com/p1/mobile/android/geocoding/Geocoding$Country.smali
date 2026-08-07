.class public final Lcom/p1/mobile/android/geocoding/Geocoding$Country;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/geocoding/Geocoding$CountryOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/geocoding/Geocoding;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Country"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Country;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;",
        ">;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$CountryOrBuilder;"
    }
.end annotation


# static fields
.field public static final AREA_FIELD_NUMBER:I = 0x6

.field public static final CONTINENT_FIELD_NUMBER:I = 0x8

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final ISO3_FIELD_NUMBER:I = 0x3

.field public static final ISONUMERIC_FIELD_NUMBER:I = 0x4

.field public static final ISO_FIELD_NUMBER:I = 0x2

.field public static final LOCALES_FIELD_NUMBER:I = 0x9

.field public static final NAME_FIELD_NUMBER:I = 0x5

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/android/geocoding/Geocoding$Country;",
            ">;"
        }
    .end annotation
.end field

.field public static final POPULATION_FIELD_NUMBER:I = 0x7


# instance fields
.field private area_:F

.field private bitField0_:I

.field private continent_:Ljava/lang/String;

.field private id_:I

.field private iso3_:Ljava/lang/String;

.field private isoNumeric_:I

.field private iso_:Ljava/lang/String;

.field private locales_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private name_:Ljava/lang/String;

.field private population_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

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
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 19
    .line 20
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->addAllLocales(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllLocales(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->ensureLocalesIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addLocales(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->ensureLocalesIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private addLocalesBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->ensureLocalesIsMutable()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->addLocales(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->addLocalesBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private clearArea()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->area_:F

    .line 3
    .line 4
    return-void
.end method

.method private clearContinent()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getDefaultInstance()Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getContinent()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->id_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearIso()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getDefaultInstance()Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getIso()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIso3()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getDefaultInstance()Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getIso3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIsoNumeric()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->isoNumeric_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearLocales()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getDefaultInstance()Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPopulation()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->population_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->clearArea()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->clearContinent()V

    return-void
.end method

.method private ensureLocalesIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->clearId()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->clearIso()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/android/geocoding/Geocoding$Country;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->clearIso3()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->clearIsoNumeric()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->clearLocales()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->clearName()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->clearPopulation()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/android/geocoding/Geocoding$Country;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->setArea(F)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->setContinent(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->setContinentBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/android/geocoding/Geocoding$Country;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->setId(I)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/android/geocoding/Geocoding$Country;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Country;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/android/geocoding/Geocoding$Country;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Country;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/android/geocoding/Geocoding$Country;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Country;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/android/geocoding/Geocoding$Country;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Country;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/android/geocoding/Geocoding$Country;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/android/geocoding/Geocoding$Country;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/android/geocoding/Geocoding$Country;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

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

.method public static bridge synthetic q(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->setIso(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->setIso3(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->setIso3Bytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setArea(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->area_:F

    .line 2
    .line 3
    return-void
.end method

.method private setContinent(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setContinentBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setId(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->id_:I

    .line 2
    .line 3
    return-void
.end method

.method private setIso(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIso3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIso3Bytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIsoBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIsoNumeric(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->isoNumeric_:I

    .line 2
    .line 3
    return-void
.end method

.method private setLocales(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->ensureLocalesIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setNameBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPopulation(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->population_:J

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->setIsoBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/android/geocoding/Geocoding$Country;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->setIsoNumeric(I)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/android/geocoding/Geocoding$Country;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->setLocales(ILjava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->setName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->setNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/android/geocoding/Geocoding$Country;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->setPopulation(J)V

    return-void
.end method

.method public static bridge synthetic z()Lcom/p1/mobile/android/geocoding/Geocoding$Country;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

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
    const/4 v1, 0x0

    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    packed-switch p1, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/l710;->a()V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->PARSER:Ll/ng60;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    monitor-exit p0

    .line 44
    goto :goto_2

    .line 45
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw p1

    .line 47
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->PARSER:Ll/ng60;

    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 51
    .line 52
    check-cast p3, Lcom/google/protobuf/h;

    .line 53
    .line 54
    :cond_2
    :goto_3
    if-nez v0, :cond_e

    .line 55
    .line 56
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    const/16 p3, 0x8

    .line 63
    .line 64
    if-eq p1, p3, :cond_d

    .line 65
    .line 66
    const/16 p3, 0x12

    .line 67
    .line 68
    if-eq p1, p3, :cond_c

    .line 69
    .line 70
    const/16 p3, 0x1a

    .line 71
    .line 72
    if-eq p1, p3, :cond_b

    .line 73
    .line 74
    const/16 p3, 0x20

    .line 75
    .line 76
    if-eq p1, p3, :cond_a

    .line 77
    .line 78
    const/16 p3, 0x2a

    .line 79
    .line 80
    if-eq p1, p3, :cond_9

    .line 81
    .line 82
    const/16 p3, 0x35

    .line 83
    .line 84
    if-eq p1, p3, :cond_8

    .line 85
    .line 86
    const/16 p3, 0x38

    .line 87
    .line 88
    if-eq p1, p3, :cond_7

    .line 89
    .line 90
    const/16 p3, 0x42

    .line 91
    .line 92
    if-eq p1, p3, :cond_6

    .line 93
    .line 94
    const/16 p3, 0x4a

    .line 95
    .line 96
    if-eq p1, p3, :cond_4

    .line 97
    .line 98
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_2

    .line 103
    .line 104
    :cond_3
    move v0, v2

    .line 105
    goto :goto_3

    .line 106
    :catch_0
    move-exception v0

    .line 107
    move-object p1, v0

    .line 108
    goto :goto_4

    .line 109
    :catch_1
    move-exception v0

    .line 110
    move-object p1, v0

    .line 111
    goto :goto_5

    .line 112
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iget-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 117
    .line 118
    invoke-interface {p3}, Lcom/google/protobuf/l$h;->q()Z

    .line 119
    .line 120
    .line 121
    move-result p3

    .line 122
    if-nez p3, :cond_5

    .line 123
    .line 124
    iget-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 125
    .line 126
    invoke-static {p3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 127
    .line 128
    .line 129
    move-result-object p3

    .line 130
    iput-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 131
    .line 132
    :cond_5
    iget-object p3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 133
    .line 134
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    goto :goto_3

    .line 138
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 146
    .line 147
    .line 148
    move-result-wide v3

    .line 149
    iput-wide v3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->population_:J

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->s()F

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->area_:F

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->isoNumeric_:I

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 185
    .line 186
    goto/16 :goto_3

    .line 187
    .line 188
    :cond_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->u()I

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->id_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 193
    .line 194
    goto/16 :goto_3

    .line 195
    .line 196
    :catchall_1
    move-exception v0

    .line 197
    move-object p0, v0

    .line 198
    throw p0

    .line 199
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 200
    .line 201
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 213
    .line 214
    .line 215
    return-object v1

    .line 216
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 221
    .line 222
    .line 223
    return-object v1

    .line 224
    :cond_e
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 225
    .line 226
    return-object p0

    .line 227
    :pswitch_3
    move-object v3, p2

    .line 228
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 229
    .line 230
    check-cast p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 231
    .line 232
    iget p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->id_:I

    .line 233
    .line 234
    if-eqz p1, :cond_f

    .line 235
    .line 236
    move p2, v2

    .line 237
    goto :goto_6

    .line 238
    :cond_f
    move p2, v0

    .line 239
    :goto_6
    iget v1, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->id_:I

    .line 240
    .line 241
    if-eqz v1, :cond_10

    .line 242
    .line 243
    move v4, v2

    .line 244
    goto :goto_7

    .line 245
    :cond_10
    move v4, v0

    .line 246
    :goto_7
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 247
    .line 248
    .line 249
    move-result p1

    .line 250
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->id_:I

    .line 251
    .line 252
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 253
    .line 254
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 255
    .line 256
    .line 257
    move-result p1

    .line 258
    xor-int/2addr p1, v2

    .line 259
    iget-object p2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 260
    .line 261
    iget-object v1, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 262
    .line 263
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    xor-int/2addr v1, v2

    .line 268
    iget-object v4, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 269
    .line 270
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 275
    .line 276
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 277
    .line 278
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 279
    .line 280
    .line 281
    move-result p1

    .line 282
    xor-int/2addr p1, v2

    .line 283
    iget-object p2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 284
    .line 285
    iget-object v1, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 286
    .line 287
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    xor-int/2addr v1, v2

    .line 292
    iget-object v4, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 293
    .line 294
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 299
    .line 300
    iget p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->isoNumeric_:I

    .line 301
    .line 302
    if-eqz p1, :cond_11

    .line 303
    .line 304
    move p2, v2

    .line 305
    goto :goto_8

    .line 306
    :cond_11
    move p2, v0

    .line 307
    :goto_8
    iget v1, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->isoNumeric_:I

    .line 308
    .line 309
    if-eqz v1, :cond_12

    .line 310
    .line 311
    move v4, v2

    .line 312
    goto :goto_9

    .line 313
    :cond_12
    move v4, v0

    .line 314
    :goto_9
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 315
    .line 316
    .line 317
    move-result p1

    .line 318
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->isoNumeric_:I

    .line 319
    .line 320
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 321
    .line 322
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 323
    .line 324
    .line 325
    move-result p1

    .line 326
    xor-int/2addr p1, v2

    .line 327
    iget-object p2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 328
    .line 329
    iget-object v1, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 330
    .line 331
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 332
    .line 333
    .line 334
    move-result v1

    .line 335
    xor-int/2addr v1, v2

    .line 336
    iget-object v4, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 337
    .line 338
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object p1

    .line 342
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 343
    .line 344
    iget p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->area_:F

    .line 345
    .line 346
    const/4 p2, 0x0

    .line 347
    cmpl-float v1, p1, p2

    .line 348
    .line 349
    if-eqz v1, :cond_13

    .line 350
    .line 351
    move v1, v2

    .line 352
    goto :goto_a

    .line 353
    :cond_13
    move v1, v0

    .line 354
    :goto_a
    iget v4, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->area_:F

    .line 355
    .line 356
    cmpl-float p2, v4, p2

    .line 357
    .line 358
    if-eqz p2, :cond_14

    .line 359
    .line 360
    move p2, v2

    .line 361
    goto :goto_b

    .line 362
    :cond_14
    move p2, v0

    .line 363
    :goto_b
    invoke-interface {v3, v1, p1, p2, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->p(ZFZF)F

    .line 364
    .line 365
    .line 366
    move-result p1

    .line 367
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->area_:F

    .line 368
    .line 369
    iget-wide v5, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->population_:J

    .line 370
    .line 371
    const-wide/16 p1, 0x0

    .line 372
    .line 373
    cmp-long v1, v5, p1

    .line 374
    .line 375
    if-eqz v1, :cond_15

    .line 376
    .line 377
    move v4, v2

    .line 378
    goto :goto_c

    .line 379
    :cond_15
    move v4, v0

    .line 380
    :goto_c
    iget-wide v8, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->population_:J

    .line 381
    .line 382
    cmp-long p1, v8, p1

    .line 383
    .line 384
    if-eqz p1, :cond_16

    .line 385
    .line 386
    move v7, v2

    .line 387
    goto :goto_d

    .line 388
    :cond_16
    move v7, v0

    .line 389
    :goto_d
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 390
    .line 391
    .line 392
    move-result-wide p1

    .line 393
    iput-wide p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->population_:J

    .line 394
    .line 395
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 396
    .line 397
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 398
    .line 399
    .line 400
    move-result p1

    .line 401
    xor-int/2addr p1, v2

    .line 402
    iget-object p2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 403
    .line 404
    iget-object v0, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 405
    .line 406
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 407
    .line 408
    .line 409
    move-result v0

    .line 410
    xor-int/2addr v0, v2

    .line 411
    iget-object v1, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 412
    .line 413
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object p1

    .line 417
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 418
    .line 419
    iget-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 420
    .line 421
    iget-object p2, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 422
    .line 423
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 424
    .line 425
    .line 426
    move-result-object p1

    .line 427
    iput-object p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 428
    .line 429
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 430
    .line 431
    if-ne v3, p1, :cond_17

    .line 432
    .line 433
    iget p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->bitField0_:I

    .line 434
    .line 435
    iget p2, p3, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->bitField0_:I

    .line 436
    .line 437
    or-int/2addr p1, p2

    .line 438
    iput p1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->bitField0_:I

    .line 439
    .line 440
    :cond_17
    return-object p0

    .line 441
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;

    .line 442
    .line 443
    invoke-direct {p0, v1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;-><init>(Ll/gmj;)V

    .line 444
    .line 445
    .line 446
    return-object p0

    .line 447
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 448
    .line 449
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 450
    .line 451
    .line 452
    return-object v1

    .line 453
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->DEFAULT_INSTANCE:Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 454
    .line 455
    return-object p0

    .line 456
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 457
    .line 458
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;-><init>()V

    .line 459
    .line 460
    .line 461
    return-object p0

    .line 462
    nop

    .line 463
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

.method public getArea()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->area_:F

    .line 2
    .line 3
    return p0
.end method

.method public getContinent()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getContinentBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->id_:I

    .line 2
    .line 3
    return p0
.end method

.method public getIso()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIso3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIso3Bytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getIsoBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getIsoNumeric()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->isoNumeric_:I

    .line 2
    .line 3
    return p0
.end method

.method public getLocales(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public getLocalesBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getLocalesCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

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

.method public getLocalesList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPopulation()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->population_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSerializedSize()I
    .locals 6

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
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->id_:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    move v0, v1

    .line 19
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_2

    .line 26
    .line 27
    const/4 v2, 0x2

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getIso()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    add-int/2addr v0, v2

    .line 37
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_3

    .line 44
    .line 45
    const/4 v2, 0x3

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getIso3()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    add-int/2addr v0, v2

    .line 55
    :cond_3
    iget v2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->isoNumeric_:I

    .line 56
    .line 57
    if-eqz v2, :cond_4

    .line 58
    .line 59
    const/4 v3, 0x4

    .line 60
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->t(II)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    add-int/2addr v0, v2

    .line 65
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-nez v2, :cond_5

    .line 72
    .line 73
    const/4 v2, 0x5

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getName()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v3

    .line 78
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v2

    .line 82
    add-int/2addr v0, v2

    .line 83
    :cond_5
    iget v2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->area_:F

    .line 84
    .line 85
    const/4 v3, 0x0

    .line 86
    cmpl-float v3, v2, v3

    .line 87
    .line 88
    if-eqz v3, :cond_6

    .line 89
    .line 90
    const/4 v3, 0x6

    .line 91
    invoke-static {v3, v2}, Lcom/google/protobuf/CodedOutputStream;->q(IF)I

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    add-int/2addr v0, v2

    .line 96
    :cond_6
    iget-wide v2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->population_:J

    .line 97
    .line 98
    const-wide/16 v4, 0x0

    .line 99
    .line 100
    cmp-long v4, v2, v4

    .line 101
    .line 102
    if-eqz v4, :cond_7

    .line 103
    .line 104
    const/4 v4, 0x7

    .line 105
    invoke-static {v4, v2, v3}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    add-int/2addr v0, v2

    .line 110
    :cond_7
    iget-object v2, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 111
    .line 112
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-nez v2, :cond_8

    .line 117
    .line 118
    const/16 v2, 0x8

    .line 119
    .line 120
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getContinent()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    add-int/2addr v0, v2

    .line 129
    :cond_8
    move v2, v1

    .line 130
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 131
    .line 132
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 133
    .line 134
    .line 135
    move-result v3

    .line 136
    if-ge v1, v3, :cond_9

    .line 137
    .line 138
    iget-object v3, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 139
    .line 140
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    check-cast v3, Ljava/lang/String;

    .line 145
    .line 146
    invoke-static {v3}, Lcom/google/protobuf/CodedOutputStream;->L(Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    add-int/2addr v2, v3

    .line 151
    add-int/lit8 v1, v1, 0x1

    .line 152
    .line 153
    goto :goto_1

    .line 154
    :cond_9
    add-int/2addr v0, v2

    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getLocalesList()Ljava/util/List;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    add-int/2addr v0, v1

    .line 164
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 165
    .line 166
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
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->id_:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso_:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getIso()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->iso3_:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    const/4 v0, 0x3

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getIso3()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_2
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->isoNumeric_:I

    .line 42
    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    const/4 v1, 0x4

    .line 46
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->s0(II)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->name_:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_4

    .line 56
    .line 57
    const/4 v0, 0x5

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getName()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_4
    iget v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->area_:F

    .line 66
    .line 67
    const/4 v1, 0x0

    .line 68
    cmpl-float v1, v0, v1

    .line 69
    .line 70
    if-eqz v1, :cond_5

    .line 71
    .line 72
    const/4 v1, 0x6

    .line 73
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->o0(IF)V

    .line 74
    .line 75
    .line 76
    :cond_5
    iget-wide v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->population_:J

    .line 77
    .line 78
    const-wide/16 v2, 0x0

    .line 79
    .line 80
    cmp-long v2, v0, v2

    .line 81
    .line 82
    if-eqz v2, :cond_6

    .line 83
    .line 84
    const/4 v2, 0x7

    .line 85
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 86
    .line 87
    .line 88
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->continent_:Ljava/lang/String;

    .line 89
    .line 90
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-nez v0, :cond_7

    .line 95
    .line 96
    const/16 v0, 0x8

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getContinent()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :cond_7
    const/4 v0, 0x0

    .line 106
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 107
    .line 108
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-ge v0, v1, :cond_8

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->locales_:Lcom/google/protobuf/l$h;

    .line 115
    .line 116
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    check-cast v1, Ljava/lang/String;

    .line 121
    .line 122
    const/16 v2, 0x9

    .line 123
    .line 124
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 125
    .line 126
    .line 127
    add-int/lit8 v0, v0, 0x1

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_8
    return-void
.end method
