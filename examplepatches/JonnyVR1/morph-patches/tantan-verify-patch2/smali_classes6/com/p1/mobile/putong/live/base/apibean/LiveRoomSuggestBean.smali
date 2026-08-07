.class public Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final liveQuitPopup:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

.field private final suggestedLives:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
            ">;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->liveQuitPopup:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 5
    .line 6
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->suggestedLives:Ljava/util/List;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getLiveQuitPopup()Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->liveQuitPopup:Lcom/p1/mobile/putong/live/base/data/BLiveQuitPopup;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSuggestedLives()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveRoomSuggestBean;->suggestedLives:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method
