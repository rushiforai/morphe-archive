.class public final Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/android/geocoding/Geocoding$RingOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/android/geocoding/Geocoding$Ring;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Ring;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;",
        ">;",
        "Lcom/p1/mobile/android/geocoding/Geocoding$RingOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->i()Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

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
    invoke-direct {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllLatitude(Ljava/lang/Iterable;)Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/lang/Float;",
            ">;)",
            "Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;"
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
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->a(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addAllLongitude(Ljava/lang/Iterable;)Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/lang/Float;",
            ">;)",
            "Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;"
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
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->b(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addLatitude(F)Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->c(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;F)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addLongitude(F)Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->d(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;F)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLatitude()Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->e(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearLongitude()Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->f(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getLatitude(I)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLatitude(I)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getLatitudeCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLatitudeCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
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
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLatitudeList()Ljava/util/List;

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

.method public getLongitude(I)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLongitude(I)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getLongitudeCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLongitudeCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
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
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->getLongitudeList()Ljava/util/List;

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

.method public setLatitude(IF)Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->g(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;IF)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setLongitude(IF)Lcom/p1/mobile/android/geocoding/Geocoding$Ring$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/android/geocoding/Geocoding$Ring;->h(Lcom/p1/mobile/android/geocoding/Geocoding$Ring;IF)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
