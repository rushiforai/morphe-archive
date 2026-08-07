.class public Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;
.super Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;
.source "SourceFile"


# instance fields
.field public final users:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/businessdata/meet/AbsMeetListData;-><init>()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/businessdata/meet/MeetFeedNearbyItemData;->users:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method
