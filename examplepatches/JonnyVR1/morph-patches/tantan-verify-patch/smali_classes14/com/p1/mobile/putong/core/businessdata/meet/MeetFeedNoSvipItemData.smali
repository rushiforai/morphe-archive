.class public Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNoSvipItemData;
.super Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;
.source "SourceFile"


# instance fields
.field public feedList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/businessdata/meet/IMeetListData;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNoSvipItemData;->feedList:Ljava/util/List;

    .line 5
    .line 6
    return-void
.end method
