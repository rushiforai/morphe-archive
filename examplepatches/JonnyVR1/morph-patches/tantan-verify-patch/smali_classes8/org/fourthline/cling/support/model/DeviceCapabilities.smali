.class public Lorg/fourthline/cling/support/model/DeviceCapabilities;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private playMedia:[Lorg/fourthline/cling/support/model/StorageMedium;

.field private recMedia:[Lorg/fourthline/cling/support/model/StorageMedium;

.field private recQualityModes:[Lorg/fourthline/cling/support/model/RecordQualityMode;


# direct methods
.method public constructor <init>(Ljava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lorg/fourthline/cling/model/action/ActionArgumentValue;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "PlayMedia"

    .line 2
    .line 3
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 8
    .line 9
    invoke-virtual {v0}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Ljava/lang/String;

    .line 14
    .line 15
    invoke-static {v0}, Lorg/fourthline/cling/support/model/StorageMedium;->valueOfCommaSeparatedList(Ljava/lang/String;)[Lorg/fourthline/cling/support/model/StorageMedium;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "RecMedia"

    .line 20
    .line 21
    invoke-interface {p1, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 26
    .line 27
    invoke-virtual {v1}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    check-cast v1, Ljava/lang/String;

    .line 32
    .line 33
    invoke-static {v1}, Lorg/fourthline/cling/support/model/StorageMedium;->valueOfCommaSeparatedList(Ljava/lang/String;)[Lorg/fourthline/cling/support/model/StorageMedium;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const-string v2, "RecQualityModes"

    .line 38
    .line 39
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lorg/fourthline/cling/model/action/ActionArgumentValue;

    .line 44
    .line 45
    invoke-virtual {p1}, Lorg/fourthline/cling/model/VariableValue;->getValue()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p1}, Lorg/fourthline/cling/support/model/RecordQualityMode;->valueOfCommaSeparatedList(Ljava/lang/String;)[Lorg/fourthline/cling/support/model/RecordQualityMode;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-direct {p0, v0, v1, p1}, Lorg/fourthline/cling/support/model/DeviceCapabilities;-><init>([Lorg/fourthline/cling/support/model/StorageMedium;[Lorg/fourthline/cling/support/model/StorageMedium;[Lorg/fourthline/cling/support/model/RecordQualityMode;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method

.method public constructor <init>([Lorg/fourthline/cling/support/model/StorageMedium;)V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/StorageMedium;

    filled-new-array {v0}, [Lorg/fourthline/cling/support/model/StorageMedium;

    move-result-object v0

    iput-object v0, p0, Lorg/fourthline/cling/support/model/DeviceCapabilities;->recMedia:[Lorg/fourthline/cling/support/model/StorageMedium;

    .line 61
    sget-object v0, Lorg/fourthline/cling/support/model/RecordQualityMode;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/RecordQualityMode;

    filled-new-array {v0}, [Lorg/fourthline/cling/support/model/RecordQualityMode;

    move-result-object v0

    iput-object v0, p0, Lorg/fourthline/cling/support/model/DeviceCapabilities;->recQualityModes:[Lorg/fourthline/cling/support/model/RecordQualityMode;

    .line 62
    iput-object p1, p0, Lorg/fourthline/cling/support/model/DeviceCapabilities;->playMedia:[Lorg/fourthline/cling/support/model/StorageMedium;

    return-void
.end method

.method public constructor <init>([Lorg/fourthline/cling/support/model/StorageMedium;[Lorg/fourthline/cling/support/model/StorageMedium;[Lorg/fourthline/cling/support/model/RecordQualityMode;)V
    .locals 1

    .line 63
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    sget-object v0, Lorg/fourthline/cling/support/model/StorageMedium;->NOT_IMPLEMENTED:Lorg/fourthline/cling/support/model/StorageMedium;

    filled-new-array {v0}, [Lorg/fourthline/cling/support/model/StorageMedium;

    move-result-object v0

    iput-object v0, p0, Lorg/fourthline/cling/support/model/DeviceCapabilities;->recMedia:[Lorg/fourthline/cling/support/model/StorageMedium;

    .line 65
    sget-object v0, Lorg/fourthline/cling/support/model/RecordQualityMode;->EP:Lorg/fourthline/cling/support/model/RecordQualityMode;

    .line 66
    iput-object p1, p0, Lorg/fourthline/cling/support/model/DeviceCapabilities;->playMedia:[Lorg/fourthline/cling/support/model/StorageMedium;

    .line 67
    iput-object p2, p0, Lorg/fourthline/cling/support/model/DeviceCapabilities;->recMedia:[Lorg/fourthline/cling/support/model/StorageMedium;

    .line 68
    iput-object p3, p0, Lorg/fourthline/cling/support/model/DeviceCapabilities;->recQualityModes:[Lorg/fourthline/cling/support/model/RecordQualityMode;

    return-void
.end method


# virtual methods
.method public getPlayMedia()[Lorg/fourthline/cling/support/model/StorageMedium;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/DeviceCapabilities;->playMedia:[Lorg/fourthline/cling/support/model/StorageMedium;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPlayMediaString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/DeviceCapabilities;->playMedia:[Lorg/fourthline/cling/support/model/StorageMedium;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/fourthline/cling/model/ModelUtil;->toCommaSeparatedList([Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRecMedia()[Lorg/fourthline/cling/support/model/StorageMedium;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/DeviceCapabilities;->recMedia:[Lorg/fourthline/cling/support/model/StorageMedium;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecMediaString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/DeviceCapabilities;->recMedia:[Lorg/fourthline/cling/support/model/StorageMedium;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/fourthline/cling/model/ModelUtil;->toCommaSeparatedList([Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getRecQualityModes()[Lorg/fourthline/cling/support/model/RecordQualityMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/DeviceCapabilities;->recQualityModes:[Lorg/fourthline/cling/support/model/RecordQualityMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRecQualityModesString()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/support/model/DeviceCapabilities;->recQualityModes:[Lorg/fourthline/cling/support/model/RecordQualityMode;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/fourthline/cling/model/ModelUtil;->toCommaSeparatedList([Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
