.class public Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/iliveroom/TXILiveRoomDefine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TXILiveConfig"
.end annotation


# instance fields
.field public sdkAppId:J

.field public userId:J


# direct methods
.method public constructor <init>(JJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveConfig;->sdkAppId:J

    .line 5
    .line 6
    iput-wide p3, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveConfig;->userId:J

    .line 7
    .line 8
    return-void
.end method
