.class public Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/fourthline/cling/model/profile/DeviceDetailsProvider;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;
    }
.end annotation


# instance fields
.field private final defaultDeviceDetails:Lorg/fourthline/cling/model/meta/DeviceDetails;

.field private final headerDetails:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;",
            "Lorg/fourthline/cling/model/meta/DeviceDetails;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/meta/DeviceDetails;)V
    .locals 1

    const/4 v0, 0x0

    .line 17
    invoke-direct {p0, p1, v0}, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider;-><init>(Lorg/fourthline/cling/model/meta/DeviceDetails;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Lorg/fourthline/cling/model/meta/DeviceDetails;Ljava/util/Map;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/fourthline/cling/model/meta/DeviceDetails;",
            "Ljava/util/Map<",
            "Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;",
            "Lorg/fourthline/cling/model/meta/DeviceDetails;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider;->defaultDeviceDetails:Lorg/fourthline/cling/model/meta/DeviceDetails;

    .line 5
    .line 6
    if-eqz p2, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    new-instance p2, Ljava/util/HashMap;

    .line 10
    .line 11
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    :goto_0
    iput-object p2, p0, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider;->headerDetails:Ljava/util/Map;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getDefaultDeviceDetails()Lorg/fourthline/cling/model/meta/DeviceDetails;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider;->defaultDeviceDetails:Lorg/fourthline/cling/model/meta/DeviceDetails;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeaderDetails()Ljava/util/Map;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;",
            "Lorg/fourthline/cling/model/meta/DeviceDetails;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider;->headerDetails:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public provide(Lorg/fourthline/cling/model/profile/RemoteClientInfo;)Lorg/fourthline/cling/model/meta/DeviceDetails;
    .locals 4

    .line 1
    if-eqz p1, :cond_5

    .line 2
    .line 3
    invoke-virtual {p1}, Lorg/fourthline/cling/model/profile/ClientInfo;->getRequestHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lorg/seamless/http/Headers;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    invoke-virtual {p0}, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider;->getHeaderDetails()Ljava/util/Map;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_4

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;

    .line 37
    .line 38
    invoke-virtual {p1}, Lorg/fourthline/cling/model/profile/ClientInfo;->getRequestHeaders()Lorg/fourthline/cling/model/message/UpnpHeaders;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    invoke-virtual {v1}, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;->getHeaderName()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v2, v3}, Lorg/seamless/http/Headers;->get(Ljava/lang/Object;)Ljava/util/List;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    if-nez v2, :cond_2

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 58
    .line 59
    .line 60
    move-result v3

    .line 61
    if-eqz v3, :cond_1

    .line 62
    .line 63
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v3

    .line 67
    check-cast v3, Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {v1, v3}, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider$Key;->isValuePatternMatch(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_3

    .line 74
    .line 75
    invoke-virtual {p0}, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider;->getHeaderDetails()Ljava/util/Map;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-interface {p0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    check-cast p0, Lorg/fourthline/cling/model/meta/DeviceDetails;

    .line 84
    .line 85
    return-object p0

    .line 86
    :cond_4
    invoke-virtual {p0}, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider;->getDefaultDeviceDetails()Lorg/fourthline/cling/model/meta/DeviceDetails;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    return-object p0

    .line 91
    :cond_5
    :goto_1
    invoke-virtual {p0}, Lorg/fourthline/cling/model/profile/HeaderDeviceDetailsProvider;->getDefaultDeviceDetails()Lorg/fourthline/cling/model/meta/DeviceDetails;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    return-object p0
.end method
