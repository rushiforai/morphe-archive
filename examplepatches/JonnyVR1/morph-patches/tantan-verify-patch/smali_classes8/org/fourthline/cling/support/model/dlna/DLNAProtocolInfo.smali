.class public Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;
.super Lorg/fourthline/cling/support/model/ProtocolInfo;
.source "SourceFile"


# instance fields
.field protected final attributes:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;",
            "Lorg/fourthline/cling/support/model/dlna/DLNAAttribute;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/model/types/InvalidValueException;
        }
    .end annotation

    .line 47
    invoke-direct {p0, p1}, Lorg/fourthline/cling/support/model/ProtocolInfo;-><init>(Ljava/lang/String;)V

    .line 48
    new-instance p1, Ljava/util/EnumMap;

    const-class v0, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;

    invoke-direct {p1, v0}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->attributes:Ljava/util/Map;

    .line 49
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->parseAdditionalInfo()V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/Protocol;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 50
    invoke-direct {p0, p1, p2, p3, p4}, Lorg/fourthline/cling/support/model/ProtocolInfo;-><init>(Lorg/fourthline/cling/support/model/Protocol;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    new-instance p1, Ljava/util/EnumMap;

    const-class p2, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;

    invoke-direct {p1, p2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->attributes:Ljava/util/Map;

    .line 52
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->parseAdditionalInfo()V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/Protocol;Ljava/lang/String;Ljava/lang/String;Ljava/util/EnumMap;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/fourthline/cling/support/model/Protocol;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/EnumMap<",
            "Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;",
            "Lorg/fourthline/cling/support/model/dlna/DLNAAttribute;",
            ">;)V"
        }
    .end annotation

    .line 53
    const-string v0, ""

    invoke-direct {p0, p1, p2, p3, v0}, Lorg/fourthline/cling/support/model/ProtocolInfo;-><init>(Lorg/fourthline/cling/support/model/Protocol;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    new-instance p1, Ljava/util/EnumMap;

    const-class p2, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;

    invoke-direct {p1, p2}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->attributes:Ljava/util/Map;

    .line 55
    invoke-interface {p1, p4}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 56
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->getAttributesString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/fourthline/cling/support/model/ProtocolInfo;->additionalInfo:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/ProtocolInfo;)V
    .locals 3

    .line 57
    invoke-virtual {p1}, Lorg/fourthline/cling/support/model/ProtocolInfo;->getProtocol()Lorg/fourthline/cling/support/model/Protocol;

    move-result-object v0

    .line 58
    invoke-virtual {p1}, Lorg/fourthline/cling/support/model/ProtocolInfo;->getNetwork()Ljava/lang/String;

    move-result-object v1

    .line 59
    invoke-virtual {p1}, Lorg/fourthline/cling/support/model/ProtocolInfo;->getContentFormat()Ljava/lang/String;

    move-result-object v2

    .line 60
    invoke-virtual {p1}, Lorg/fourthline/cling/support/model/ProtocolInfo;->getAdditionalInfo()Ljava/lang/String;

    move-result-object p1

    .line 61
    invoke-direct {p0, v0, v1, v2, p1}, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;-><init>(Lorg/fourthline/cling/support/model/Protocol;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/dlna/DLNAProfiles;)V
    .locals 3

    .line 43
    invoke-virtual {p1}, Lorg/fourthline/cling/support/model/dlna/DLNAProfiles;->getContentFormat()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/seamless/util/MimeType;->valueOf(Ljava/lang/String;)Lorg/seamless/util/MimeType;

    move-result-object v0

    invoke-direct {p0, v0}, Lorg/fourthline/cling/support/model/ProtocolInfo;-><init>(Lorg/seamless/util/MimeType;)V

    .line 44
    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->attributes:Ljava/util/Map;

    .line 45
    sget-object v1, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;->DLNA_ORG_PN:Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;

    new-instance v2, Lorg/fourthline/cling/support/model/dlna/DLNAProfileAttribute;

    invoke-direct {v2, p1}, Lorg/fourthline/cling/support/model/dlna/DLNAProfileAttribute;-><init>(Lorg/fourthline/cling/support/model/dlna/DLNAProfiles;)V

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->getAttributesString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lorg/fourthline/cling/support/model/ProtocolInfo;->additionalInfo:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/support/model/dlna/DLNAProfiles;Ljava/util/EnumMap;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/fourthline/cling/support/model/dlna/DLNAProfiles;",
            "Ljava/util/EnumMap<",
            "Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;",
            "Lorg/fourthline/cling/support/model/dlna/DLNAAttribute;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lorg/fourthline/cling/support/model/dlna/DLNAProfiles;->getContentFormat()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lorg/seamless/util/MimeType;->valueOf(Ljava/lang/String;)Lorg/seamless/util/MimeType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {p0, v0}, Lorg/fourthline/cling/support/model/ProtocolInfo;-><init>(Lorg/seamless/util/MimeType;)V

    .line 10
    .line 11
    .line 12
    new-instance v0, Ljava/util/EnumMap;

    .line 13
    .line 14
    const-class v1, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->attributes:Ljava/util/Map;

    .line 20
    .line 21
    invoke-interface {v0, p2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 22
    .line 23
    .line 24
    sget-object p2, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;->DLNA_ORG_PN:Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;

    .line 25
    .line 26
    new-instance v1, Lorg/fourthline/cling/support/model/dlna/DLNAProfileAttribute;

    .line 27
    .line 28
    invoke-direct {v1, p1}, Lorg/fourthline/cling/support/model/dlna/DLNAProfileAttribute;-><init>(Lorg/fourthline/cling/support/model/dlna/DLNAProfiles;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {v0, p2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->getAttributesString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iput-object p1, p0, Lorg/fourthline/cling/support/model/ProtocolInfo;->additionalInfo:Ljava/lang/String;

    .line 39
    .line 40
    return-void
.end method

.method public constructor <init>(Lorg/seamless/util/MimeType;)V
    .locals 1

    .line 41
    invoke-direct {p0, p1}, Lorg/fourthline/cling/support/model/ProtocolInfo;-><init>(Lorg/seamless/util/MimeType;)V

    .line 42
    new-instance p1, Ljava/util/EnumMap;

    const-class v0, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;

    invoke-direct {p1, v0}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object p1, p0, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->attributes:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public contains(Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->attributes:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getAttribute(Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;)Lorg/fourthline/cling/support/model/dlna/DLNAAttribute;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->attributes:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute;

    .line 8
    .line 9
    return-object p0
.end method

.method public getAttributes()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;",
            "Lorg/fourthline/cling/support/model/dlna/DLNAAttribute;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->attributes:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAttributesString()Ljava/lang/String;
    .locals 8

    .line 1
    invoke-static {}, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;->values()[Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    const-string v2, ""

    .line 7
    .line 8
    const/4 v3, 0x0

    .line 9
    move-object v4, v2

    .line 10
    :goto_0
    if-ge v3, v1, :cond_3

    .line 11
    .line 12
    aget-object v5, v0, v3

    .line 13
    .line 14
    iget-object v6, p0, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->attributes:Ljava/util/Map;

    .line 15
    .line 16
    invoke-interface {v6, v5}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v6

    .line 20
    if-eqz v6, :cond_0

    .line 21
    .line 22
    iget-object v6, p0, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->attributes:Ljava/util/Map;

    .line 23
    .line 24
    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v6

    .line 28
    check-cast v6, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute;

    .line 29
    .line 30
    invoke-virtual {v6}, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute;->getString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    const/4 v6, 0x0

    .line 36
    :goto_1
    if-eqz v6, :cond_2

    .line 37
    .line 38
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    if-eqz v7, :cond_2

    .line 43
    .line 44
    new-instance v7, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    if-nez v4, :cond_1

    .line 57
    .line 58
    move-object v4, v2

    .line 59
    goto :goto_2

    .line 60
    :cond_1
    const-string v4, ";"

    .line 61
    .line 62
    :goto_2
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v5}, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;->getAttributeName()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string v4, "="

    .line 73
    .line 74
    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_3
    return-object v4
.end method

.method public parseAdditionalInfo()V
    .locals 7

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/support/model/ProtocolInfo;->additionalInfo:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const-string v1, ";"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    array-length v1, v0

    .line 12
    const/4 v2, 0x0

    .line 13
    move v3, v2

    .line 14
    :goto_0
    if-ge v3, v1, :cond_1

    .line 15
    .line 16
    aget-object v4, v0, v3

    .line 17
    .line 18
    const-string v5, "="

    .line 19
    .line 20
    invoke-virtual {v4, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    array-length v5, v4

    .line 25
    const/4 v6, 0x2

    .line 26
    if-ne v5, v6, :cond_0

    .line 27
    .line 28
    aget-object v5, v4, v2

    .line 29
    .line 30
    invoke-static {v5}, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;->valueOfAttributeName(Ljava/lang/String;)Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    if-eqz v5, :cond_0

    .line 35
    .line 36
    const/4 v6, 0x1

    .line 37
    aget-object v4, v4, v6

    .line 38
    .line 39
    invoke-virtual {p0}, Lorg/fourthline/cling/support/model/ProtocolInfo;->getContentFormat()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    invoke-static {v5, v4, v6}, Lorg/fourthline/cling/support/model/dlna/DLNAAttribute;->newInstance(Lorg/fourthline/cling/support/model/dlna/DLNAAttribute$Type;Ljava/lang/String;Ljava/lang/String;)Lorg/fourthline/cling/support/model/dlna/DLNAAttribute;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    iget-object v6, p0, Lorg/fourthline/cling/support/model/dlna/DLNAProtocolInfo;->attributes:Ljava/util/Map;

    .line 48
    .line 49
    invoke-interface {v6, v5, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    return-void
.end method
