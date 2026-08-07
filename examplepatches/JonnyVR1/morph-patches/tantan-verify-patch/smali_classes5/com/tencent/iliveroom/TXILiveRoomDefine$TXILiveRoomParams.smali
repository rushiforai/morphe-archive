.class public Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/iliveroom/TXILiveRoomDefine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TXILiveRoomParams"
.end annotation


# instance fields
.field public privateMap:I

.field public privateMapKey:[B

.field public roomName:Ljava/lang/String;

.field public roomRole:I

.field public roomScenario:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->privateMap:I

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomScenario:I

    .line 9
    .line 10
    iput v0, p0, Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomParams;->roomRole:I

    .line 11
    .line 12
    return-void
.end method
