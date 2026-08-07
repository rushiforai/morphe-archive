.class public Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public fractionLost:D

.field public rtt:I

.field public rxNetQuality:I

.field public totalBandwidth:I

.field public txNetQuality:I

.field public uid:Ljava/lang/String;


# direct methods
.method public constructor <init>(DIIII)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->uid:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p1, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->fractionLost:D

    .line 9
    .line 10
    iput p3, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->rtt:I

    .line 11
    .line 12
    iput p4, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->totalBandwidth:I

    .line 13
    .line 14
    iput p5, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->txNetQuality:I

    .line 15
    .line 16
    iput p6, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->rxNetQuality:I

    .line 17
    .line 18
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;DIIII)V
    .locals 0

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->uid:Ljava/lang/String;

    .line 21
    iput-wide p2, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->fractionLost:D

    .line 22
    iput p4, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->rtt:I

    .line 23
    iput p5, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->totalBandwidth:I

    .line 24
    iput p6, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->txNetQuality:I

    .line 25
    iput p7, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->rxNetQuality:I

    return-void
.end method

.method private static create(Ljava/lang/String;DIIII)Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;
    .locals 8
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-wide v2, p1

    .line 5
    move v4, p3

    .line 6
    move v5, p4

    .line 7
    move v6, p5

    .line 8
    move v7, p6

    .line 9
    invoke-direct/range {v0 .. v7}, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;-><init>(Ljava/lang/String;DIIII)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "uid="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->uid:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ",fractionLost="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-wide v1, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->fractionLost:D

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, ",rtt="

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget v1, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->rtt:I

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    const-string v1, ",totalBandwidth="

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    iget v1, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->totalBandwidth:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ",txNetQuality="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->txNetQuality:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ",rxNetQuality="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget p0, p0, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->rxNetQuality:I

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    return-object p0
.end method
