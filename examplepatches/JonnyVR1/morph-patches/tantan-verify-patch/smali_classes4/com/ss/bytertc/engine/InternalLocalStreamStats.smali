.class public Lcom/ss/bytertc/engine/InternalLocalStreamStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioStats:Lcom/ss/bytertc/engine/InternalLocalAudioStats;

.field public isScreen:Z

.field public rxQuality:I

.field public txQuality:I

.field public videoStats:Lcom/ss/bytertc/engine/InternalLocalVideoStats;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lcom/ss/bytertc/engine/InternalLocalAudioStats;Lcom/ss/bytertc/engine/InternalLocalVideoStats;ZII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/InternalLocalStreamStats;->audioStats:Lcom/ss/bytertc/engine/InternalLocalAudioStats;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/InternalLocalStreamStats;->videoStats:Lcom/ss/bytertc/engine/InternalLocalVideoStats;

    .line 7
    .line 8
    iput-boolean p3, p0, Lcom/ss/bytertc/engine/InternalLocalStreamStats;->isScreen:Z

    .line 9
    .line 10
    iput p4, p0, Lcom/ss/bytertc/engine/InternalLocalStreamStats;->txQuality:I

    .line 11
    .line 12
    iput p5, p0, Lcom/ss/bytertc/engine/InternalLocalStreamStats;->rxQuality:I

    .line 13
    .line 14
    return-void
.end method

.method public static create(Lcom/ss/bytertc/engine/InternalLocalAudioStats;Lcom/ss/bytertc/engine/InternalLocalVideoStats;ZII)Lcom/ss/bytertc/engine/InternalLocalStreamStats;
    .locals 6
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/InternalLocalStreamStats;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move v3, p2

    .line 6
    move v4, p3

    .line 7
    move v5, p4

    .line 8
    invoke-direct/range {v0 .. v5}, Lcom/ss/bytertc/engine/InternalLocalStreamStats;-><init>(Lcom/ss/bytertc/engine/InternalLocalAudioStats;Lcom/ss/bytertc/engine/InternalLocalVideoStats;ZII)V

    .line 9
    .line 10
    .line 11
    return-object v0
.end method
