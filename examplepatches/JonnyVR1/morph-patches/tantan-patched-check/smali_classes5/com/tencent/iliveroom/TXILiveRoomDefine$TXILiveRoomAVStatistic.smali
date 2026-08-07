.class public Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/iliveroom/TXILiveRoomDefine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TXILiveRoomAVStatistic"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic$TXUserAVStatistic;
    }
.end annotation


# instance fields
.field public audioCapTotalBytes:J

.field public audioEncTotalBytes:J

.field public userAVStatistics:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic$TXUserAVStatistic;",
            ">;"
        }
    .end annotation
.end field

.field public videoEncFrameTotalCount:J

.field public videoEncTotalBytes:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomAVStatistic;->userAVStatistics:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method
