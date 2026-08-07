.class public Lorg/fourthline/cling/model/types/NamedDeviceType;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private deviceType:Lorg/fourthline/cling/model/types/DeviceType;

.field private udn:Lorg/fourthline/cling/model/types/UDN;


# direct methods
.method public constructor <init>(Lorg/fourthline/cling/model/types/UDN;Lorg/fourthline/cling/model/types/DeviceType;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/fourthline/cling/model/types/NamedDeviceType;->udn:Lorg/fourthline/cling/model/types/UDN;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/fourthline/cling/model/types/NamedDeviceType;->deviceType:Lorg/fourthline/cling/model/types/DeviceType;

    .line 7
    .line 8
    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lorg/fourthline/cling/model/types/NamedDeviceType;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/fourthline/cling/model/types/InvalidValueException;
        }
    .end annotation

    .line 1
    const-string v0, "::"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    array-length v1, v0

    .line 8
    const/4 v2, 0x2

    .line 9
    if-ne v1, v2, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    :try_start_0
    aget-object v1, v0, p0

    .line 13
    .line 14
    invoke-static {v1}, Lorg/fourthline/cling/model/types/UDN;->valueOf(Ljava/lang/String;)Lorg/fourthline/cling/model/types/UDN;

    .line 15
    .line 16
    .line 17
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    const/4 v1, 0x1

    .line 19
    aget-object v0, v0, v1

    .line 20
    .line 21
    invoke-static {v0}, Lorg/fourthline/cling/model/types/DeviceType;->valueOf(Ljava/lang/String;)Lorg/fourthline/cling/model/types/DeviceType;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    new-instance v1, Lorg/fourthline/cling/model/types/NamedDeviceType;

    .line 26
    .line 27
    invoke-direct {v1, p0, v0}, Lorg/fourthline/cling/model/types/NamedDeviceType;-><init>(Lorg/fourthline/cling/model/types/UDN;Lorg/fourthline/cling/model/types/DeviceType;)V

    .line 28
    .line 29
    .line 30
    return-object v1

    .line 31
    :catch_0
    new-instance v1, Lorg/fourthline/cling/model/types/InvalidValueException;

    .line 32
    .line 33
    aget-object p0, v0, p0

    .line 34
    .line 35
    new-instance v0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    const-string v2, "Can\'t parse UDN: "

    .line 38
    .line 39
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-direct {v1, p0}, Lorg/fourthline/cling/model/types/InvalidValueException;-><init>(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    throw v1

    .line 53
    :cond_0
    new-instance v0, Lorg/fourthline/cling/model/types/InvalidValueException;

    .line 54
    .line 55
    const-string v1, "Can\'t parse UDN::DeviceType from: "

    .line 56
    .line 57
    invoke-virtual {v1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-direct {v0, p0}, Lorg/fourthline/cling/model/types/InvalidValueException;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    throw v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_4

    .line 7
    .line 8
    instance-of v2, p1, Lorg/fourthline/cling/model/types/NamedDeviceType;

    .line 9
    .line 10
    if-nez v2, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    check-cast p1, Lorg/fourthline/cling/model/types/NamedDeviceType;

    .line 14
    .line 15
    iget-object v2, p0, Lorg/fourthline/cling/model/types/NamedDeviceType;->deviceType:Lorg/fourthline/cling/model/types/DeviceType;

    .line 16
    .line 17
    iget-object v3, p1, Lorg/fourthline/cling/model/types/NamedDeviceType;->deviceType:Lorg/fourthline/cling/model/types/DeviceType;

    .line 18
    .line 19
    invoke-virtual {v2, v3}, Lorg/fourthline/cling/model/types/DeviceType;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_2

    .line 24
    .line 25
    return v1

    .line 26
    :cond_2
    iget-object p0, p0, Lorg/fourthline/cling/model/types/NamedDeviceType;->udn:Lorg/fourthline/cling/model/types/UDN;

    .line 27
    .line 28
    iget-object p1, p1, Lorg/fourthline/cling/model/types/NamedDeviceType;->udn:Lorg/fourthline/cling/model/types/UDN;

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lorg/fourthline/cling/model/types/UDN;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_3

    .line 35
    .line 36
    return v1

    .line 37
    :cond_3
    return v0

    .line 38
    :cond_4
    :goto_0
    return v1
.end method

.method public getDeviceType()Lorg/fourthline/cling/model/types/DeviceType;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/types/NamedDeviceType;->deviceType:Lorg/fourthline/cling/model/types/DeviceType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUdn()Lorg/fourthline/cling/model/types/UDN;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/fourthline/cling/model/types/NamedDeviceType;->udn:Lorg/fourthline/cling/model/types/UDN;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/fourthline/cling/model/types/NamedDeviceType;->udn:Lorg/fourthline/cling/model/types/UDN;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/fourthline/cling/model/types/UDN;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x1f

    .line 8
    .line 9
    iget-object p0, p0, Lorg/fourthline/cling/model/types/NamedDeviceType;->deviceType:Lorg/fourthline/cling/model/types/DeviceType;

    .line 10
    .line 11
    invoke-virtual {p0}, Lorg/fourthline/cling/model/types/DeviceType;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/2addr v0, p0

    .line 16
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lorg/fourthline/cling/model/types/NamedDeviceType;->getUdn()Lorg/fourthline/cling/model/types/UDN;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v1}, Lorg/fourthline/cling/model/types/UDN;->toString()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "::"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lorg/fourthline/cling/model/types/NamedDeviceType;->getDeviceType()Lorg/fourthline/cling/model/types/DeviceType;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0}, Lorg/fourthline/cling/model/types/DeviceType;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    return-object p0
.end method
