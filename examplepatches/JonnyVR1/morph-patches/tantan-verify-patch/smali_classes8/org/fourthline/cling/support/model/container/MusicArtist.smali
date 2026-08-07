.class public Lorg/fourthline/cling/support/model/container/MusicArtist;
.super Lorg/fourthline/cling/support/model/container/PersonContainer;
.source "SourceFile"


# static fields
.field public static final CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 2
    .line 3
    const-string v1, "object.container.person.musicArtist"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/fourthline/cling/support/model/DIDLObject$Class;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/fourthline/cling/support/model/container/MusicArtist;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lorg/fourthline/cling/support/model/container/PersonContainer;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lorg/fourthline/cling/support/model/container/MusicArtist;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->setClazz(Lorg/fourthline/cling/support/model/DIDLObject$Class;)Lorg/fourthline/cling/support/model/DIDLObject;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .line 12
    invoke-direct/range {p0 .. p5}, Lorg/fourthline/cling/support/model/container/PersonContainer;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 13
    sget-object p1, Lorg/fourthline/cling/support/model/container/MusicArtist;->CLASS:Lorg/fourthline/cling/support/model/DIDLObject$Class;

    invoke-virtual {p0, p1}, Lorg/fourthline/cling/support/model/DIDLObject;->setClazz(Lorg/fourthline/cling/support/model/DIDLObject$Class;)Lorg/fourthline/cling/support/model/DIDLObject;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lorg/fourthline/cling/support/model/container/Container;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0

    .line 11
    invoke-virtual {p2}, Lorg/fourthline/cling/support/model/DIDLObject;->getId()Ljava/lang/String;

    move-result-object p2

    invoke-direct/range {p0 .. p5}, Lorg/fourthline/cling/support/model/container/MusicArtist;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;)V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/container/Container;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Lorg/fourthline/cling/support/model/container/PersonContainer;-><init>(Lorg/fourthline/cling/support/model/container/Container;)V

    return-void
.end method


# virtual methods
.method public getArtistDiscographyURI()Ljava/net/URI;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$ARTIST_DISCO_URI;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->getFirstPropertyValue(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/net/URI;

    .line 8
    .line 9
    return-object p0
.end method

.method public getFirstGenre()Ljava/lang/String;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$GENRE;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->getFirstPropertyValue(Ljava/lang/Class;)Ljava/lang/Object;

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

.method public getGenres()[Ljava/lang/String;
    .locals 1

    .line 1
    const-class v0, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$GENRE;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->getPropertyValues(Ljava/lang/Class;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    new-array v0, v0, [Ljava/lang/String;

    .line 12
    .line 13
    invoke-interface {p0, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, [Ljava/lang/String;

    .line 18
    .line 19
    return-object p0
.end method

.method public setArtistDiscographyURI(Ljava/net/URI;)Lorg/fourthline/cling/support/model/container/MusicArtist;
    .locals 1

    .line 1
    new-instance v0, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$ARTIST_DISCO_URI;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$ARTIST_DISCO_URI;-><init>(Ljava/net/URI;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->replaceFirstProperty(Lorg/fourthline/cling/support/model/DIDLObject$Property;)Lorg/fourthline/cling/support/model/DIDLObject;

    .line 7
    .line 8
    .line 9
    return-object p0
.end method

.method public setGenres([Ljava/lang/String;)Lorg/fourthline/cling/support/model/container/MusicArtist;
    .locals 4

    .line 1
    const-class v0, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$GENRE;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/fourthline/cling/support/model/DIDLObject;->removeProperties(Ljava/lang/Class;)Lorg/fourthline/cling/support/model/DIDLObject;

    .line 4
    .line 5
    .line 6
    array-length v0, p1

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    aget-object v2, p1, v1

    .line 11
    .line 12
    new-instance v3, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$GENRE;

    .line 13
    .line 14
    invoke-direct {v3, v2}, Lorg/fourthline/cling/support/model/DIDLObject$Property$UPNP$GENRE;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, v3}, Lorg/fourthline/cling/support/model/DIDLObject;->addProperty(Lorg/fourthline/cling/support/model/DIDLObject$Property;)Lorg/fourthline/cling/support/model/DIDLObject;

    .line 18
    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-object p0
.end method
