.class public Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;
.super Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData$MeetFeedItemType;
    }
.end annotation


# instance fields
.field public isAllShow:Z

.field public moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

.field public originalMoment:Ljava/lang/Object;

.field public picIndex:I

.field public type:Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData$MeetFeedItemType;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/p1/mobile/putong/data/User;Ljava/lang/Object;Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->picIndex:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->isAllShow:Z

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->moment:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 10
    .line 11
    iput-object p2, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetUserItemData;->user:Lcom/p1/mobile/putong/data/User;

    .line 12
    .line 13
    iput-object p3, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedItemData;->originalMoment:Ljava/lang/Object;

    .line 14
    .line 15
    iput-object p4, p0, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;->item:Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 16
    .line 17
    return-void
.end method
