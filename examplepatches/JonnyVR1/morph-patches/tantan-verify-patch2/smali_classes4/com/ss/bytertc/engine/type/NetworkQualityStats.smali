.class public Lcom/ss/bytertc/engine/type/NetworkQualityStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public fractionLost:D

.field public rtt:I

.field public rxQuality:I

.field public totalBandwidth:I

.field public txQuality:I

.field public uid:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->uid:Ljava/lang/String;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->uid:Ljava/lang/String;

    .line 7
    .line 8
    iget-wide v0, p1, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->fractionLost:D

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->fractionLost:D

    .line 11
    .line 12
    iget v0, p1, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->rtt:I

    .line 13
    .line 14
    iput v0, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->rtt:I

    .line 15
    .line 16
    iget v0, p1, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->totalBandwidth:I

    .line 17
    .line 18
    iput v0, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->totalBandwidth:I

    .line 19
    .line 20
    iget v0, p1, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->txNetQuality:I

    .line 21
    .line 22
    iput v0, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->txQuality:I

    .line 23
    .line 24
    iget p1, p1, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->rxNetQuality:I

    .line 25
    .line 26
    iput p1, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->rxQuality:I

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;DIIII)V
    .locals 0

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->uid:Ljava/lang/String;

    .line 31
    iput-wide p2, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->fractionLost:D

    .line 32
    iput p4, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->rtt:I

    .line 33
    iput p5, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->totalBandwidth:I

    .line 34
    iput p6, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->txQuality:I

    .line 35
    iput p7, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->rxQuality:I

    return-void
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
    iget-object v1, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->uid:Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->fractionLost:D

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
    iget v1, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->rtt:I

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
    iget v1, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->totalBandwidth:I

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v1, ",txQuality="

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v1, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->txQuality:I

    .line 49
    .line 50
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ",rxQuality="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget p0, p0, Lcom/ss/bytertc/engine/type/NetworkQualityStats;->rxQuality:I

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
