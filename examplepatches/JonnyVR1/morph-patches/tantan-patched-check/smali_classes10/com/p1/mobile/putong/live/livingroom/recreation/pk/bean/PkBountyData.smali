.class public Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private anchor:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

.field private anchorResource:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

.field private anchorWinIndicator:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

.field private other:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/base/data/BLivePk;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 5
    .line 6
    new-instance v1, Ll/ts70;

    .line 7
    .line 8
    invoke-direct {v1, p2}, Ll/ts70;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 16
    .line 17
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 18
    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePk;->players:Ljava/util/List;

    .line 20
    .line 21
    new-instance v0, Ll/us70;

    .line 22
    .line 23
    invoke-direct {v0, p2}, Ll/us70;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 31
    .line 32
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->other:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->winIndicator:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 39
    .line 40
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->anchorWinIndicator:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 41
    .line 42
    new-instance p1, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string p2, "anchorWinIndicator:"

    .line 45
    .line 46
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->anchorWinIndicator:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 50
    .line 51
    invoke-virtual {p2}, Lcom/google/protobuf/nano/MessageNano;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string p2, "LivePkConstant"

    .line 63
    .line 64
    invoke-static {p2, p1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 68
    .line 69
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->liveAnimation:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 70
    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->anchorResource:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method


# virtual methods
.method public getAnchorBounty()D
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "anchor bountyAmount:"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 16
    .line 17
    iget-wide v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->bountyAmount:D

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "LivePkConstant"

    .line 27
    .line 28
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 32
    .line 33
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->bountyAmount:D

    .line 34
    .line 35
    return-wide v0
.end method

.method public getAnchorResource()Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->anchorResource:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyResource;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnchorWinIndicator()Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->anchorWinIndicator:Lcom/p1/mobile/putong/live/base/data/BLivePkBountyWinIndicator;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherBounty()D
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->other:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v1, "other bountyAmount:"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->other:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 16
    .line 17
    iget-wide v1, v1, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->bountyAmount:D

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "LivePkConstant"

    .line 27
    .line 28
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/recreation/pk/bean/PkBountyData;->other:Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;

    .line 32
    .line 33
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLivePkOwner;->bountyAmount:D

    .line 34
    .line 35
    return-wide v0
.end method
