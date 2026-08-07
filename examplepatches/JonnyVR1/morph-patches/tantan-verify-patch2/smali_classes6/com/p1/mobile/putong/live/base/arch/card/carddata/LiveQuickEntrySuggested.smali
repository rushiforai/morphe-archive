.class public Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseListItemBean;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "goAction"
    .end annotation
.end field

.field private liveId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "liveId"
    .end annotation
.end field

.field private trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "trackData"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseListItemBean;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getGoAction()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;->liveId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;->trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-object p0
.end method

.method public setGoAction(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    return-void
.end method

.method public setLiveId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;->liveId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTrackData(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/arch/card/carddata/LiveQuickEntrySuggested;->trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-void
.end method
