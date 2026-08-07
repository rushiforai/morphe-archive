.class public Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;
.super Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;
.source "SourceFile"


# instance fields
.field public isAllShow:Z

.field public moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

.field public picIndex:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;->picIndex:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;->isAllShow:Z

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;->moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 11
    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    iput-object p2, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getCoreMomentInfo()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;->moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCoreMomentInfo(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedUserItemData;->moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 2
    .line 3
    return-void
.end method
