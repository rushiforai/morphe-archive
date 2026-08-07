.class public Lcom/ss/bytertc/engine/InternalRemoteStreamStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioStats:Lcom/ss/bytertc/engine/InternalRemoteAudioStats;

.field public isScreen:Z

.field public rxQuality:I

.field public txQuality:I

.field public uid:Ljava/lang/String;

.field public videoStats:Lcom/ss/bytertc/engine/InternalRemoteVideoStats;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/ss/bytertc/engine/InternalRemoteAudioStats;Lcom/ss/bytertc/engine/InternalRemoteVideoStats;ZII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;->uid:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;->audioStats:Lcom/ss/bytertc/engine/InternalRemoteAudioStats;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;->videoStats:Lcom/ss/bytertc/engine/InternalRemoteVideoStats;

    .line 9
    .line 10
    iput-boolean p4, p0, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;->isScreen:Z

    .line 11
    .line 12
    iput p5, p0, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;->txQuality:I

    .line 13
    .line 14
    iput p6, p0, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;->rxQuality:I

    .line 15
    .line 16
    return-void
.end method

.method public static create(Ljava/lang/String;Lcom/ss/bytertc/engine/InternalRemoteAudioStats;Lcom/ss/bytertc/engine/InternalRemoteVideoStats;ZII)Lcom/ss/bytertc/engine/InternalRemoteStreamStats;
    .locals 7
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    move v6, p5

    .line 9
    invoke-direct/range {v0 .. v6}, Lcom/ss/bytertc/engine/InternalRemoteStreamStats;-><init>(Ljava/lang/String;Lcom/ss/bytertc/engine/InternalRemoteAudioStats;Lcom/ss/bytertc/engine/InternalRemoteVideoStats;ZII)V

    .line 10
    .line 11
    .line 12
    return-object v0
.end method
