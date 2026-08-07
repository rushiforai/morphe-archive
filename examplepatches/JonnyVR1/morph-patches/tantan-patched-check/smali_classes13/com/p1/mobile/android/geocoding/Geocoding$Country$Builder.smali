.class public final Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/geocoding/Geocoding$CountryOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/geocoding/Geocoding$Country;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Country;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;",
        ">;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$CountryOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->z()Lcom/p1/mobile/android/geocoding/Geocoding$Country;

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
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllLocales(Ljava/lang/Iterable;)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;"
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
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->a(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addLocales(Ljava/lang/String;)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->b(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addLocalesBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->c(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearArea()Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->d(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearContinent()Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->e(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearId()Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->f(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearIso()Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->g(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearIso3()Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->h(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearIsoNumeric()Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->i(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLocales()Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->j(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearName()Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->k(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPopulation()Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->l(Lcom/p1/mobile/android/geocoding/Geocoding$Country;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getArea()F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getArea()F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getContinent()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getContinent()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getContinentBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getContinentBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getId()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getIso()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getIso()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIso3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getIso3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIso3Bytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getIso3Bytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIsoBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getIsoBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIsoNumeric()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getIsoNumeric()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getLocales(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getLocales(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLocalesBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getLocalesBytes(I)Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getLocalesCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getLocalesCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
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
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getLocalesList()Ljava/util/List;

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

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getNameBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPopulation()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->getPopulation()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public setArea(F)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->m(Lcom/p1/mobile/android/geocoding/Geocoding$Country;F)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setContinent(Ljava/lang/String;)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->n(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setContinentBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->o(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setId(I)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->p(Lcom/p1/mobile/android/geocoding/Geocoding$Country;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIso(Ljava/lang/String;)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->q(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIso3(Ljava/lang/String;)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->r(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIso3Bytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->s(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIsoBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->t(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIsoNumeric(I)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->u(Lcom/p1/mobile/android/geocoding/Geocoding$Country;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLocales(ILjava/lang/String;)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->v(Lcom/p1/mobile/android/geocoding/Geocoding$Country;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setName(Ljava/lang/String;)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->w(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setNameBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->x(Lcom/p1/mobile/android/geocoding/Geocoding$Country;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPopulation(J)Lcom/p1/mobile/android/geocoding/Geocoding$Country$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Country;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/android/geocoding/Geocoding$Country;->y(Lcom/p1/mobile/android/geocoding/Geocoding$Country;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
