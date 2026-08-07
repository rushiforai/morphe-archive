.class Lcom/p1/mobile/putong/data/VipSearchSettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/VipSearchSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/VipSearchSettings;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/MessageNanoAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/VipSearchSettings;)I
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLongitude:Ljava/lang/Double;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLatitude:Ljava/lang/Double;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    invoke-static {v1, v2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 31
    .line 32
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 33
    check-cast p1, Lcom/p1/mobile/putong/data/VipSearchSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VipSearchSettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/VipSearchSettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VipSearchSettings;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    new-instance v0, Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/VipSearchSettings;-><init>()V

    .line 10
    .line 11
    .line 12
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_3

    .line 17
    .line 18
    const/16 v2, 0x9

    .line 19
    .line 20
    if-eq v1, v2, :cond_2

    .line 21
    .line 22
    const/16 v2, 0x11

    .line 23
    .line 24
    if-eq v1, v2, :cond_1

    .line 25
    .line 26
    iget-object p1, v0, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLongitude:Ljava/lang/Double;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLongitude:Ljava/lang/Double;

    .line 31
    .line 32
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLatitude:Ljava/lang/Double;

    .line 33
    .line 34
    if-nez p1, :cond_5

    .line 35
    .line 36
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLatitude:Ljava/lang/Double;

    .line 37
    .line 38
    return-object v0

    .line 39
    :cond_1
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 40
    .line 41
    .line 42
    move-result-wide v1

    .line 43
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLatitude:Ljava/lang/Double;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_2
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 51
    .line 52
    .line 53
    move-result-wide v1

    .line 54
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLongitude:Ljava/lang/Double;

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_3
    iget-object p1, v0, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLongitude:Ljava/lang/Double;

    .line 62
    .line 63
    if-nez p1, :cond_4

    .line 64
    .line 65
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLongitude:Ljava/lang/Double;

    .line 66
    .line 67
    :cond_4
    iget-object p1, v0, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLatitude:Ljava/lang/Double;

    .line 68
    .line 69
    if-nez p1, :cond_5

    .line 70
    .line 71
    iput-object p0, v0, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLatitude:Ljava/lang/Double;

    .line 72
    .line 73
    :cond_5
    return-object v0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 74
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VipSearchSettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VipSearchSettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/VipSearchSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLongitude:Ljava/lang/Double;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-virtual {p2, v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VipSearchSettings;->momentRoamingLatitude:Ljava/lang/Double;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 p1, 0x2

    .line 18
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 19
    .line 20
    .line 21
    move-result-wide v0

    .line 22
    invoke-virtual {p2, p1, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 26
    check-cast p1, Lcom/p1/mobile/putong/data/VipSearchSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/VipSearchSettings$1;->serialize(Lcom/p1/mobile/putong/data/VipSearchSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
