.class public Lcom/ss/bytertc/engine/SubChannelInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private channelName:Ljava/lang/String;

.field private volumeScale:D


# direct methods
.method public constructor <init>(Ljava/lang/String;D)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/SubChannelInfo;->channelName:Ljava/lang/String;

    .line 5
    .line 6
    iput-wide p2, p0, Lcom/ss/bytertc/engine/SubChannelInfo;->volumeScale:D

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getChannelName()Ljava/lang/String;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/SubChannelInfo;->channelName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVolumeScale()D
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/SubChannelInfo;->volumeScale:D

    .line 2
    .line 3
    return-wide v0
.end method
