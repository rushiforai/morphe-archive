.class public Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseListItemBean;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public disableFilterRepeat:Z

.field public disableReplaceStopped:Z

.field private display:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "display"
    .end annotation
.end field

.field public infinitePull:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "infinitePull"
    .end annotation
.end field

.field private isDefault:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "isDefault"
    .end annotation
.end field

.field private name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "name"
    .end annotation
.end field

.field private pageId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pageId"
    .end annotation
.end field

.field public requestName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "reqSource"
    .end annotation
.end field

.field private tabId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "tabId"
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
.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPageId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->pageId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRequestName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->requestName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTabId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->tabId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isDefault()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->isDefault:Z

    .line 2
    .line 3
    return p0
.end method

.method public isDisplay()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->display:Z

    .line 2
    .line 3
    return p0
.end method

.method public isInfinitePull()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->infinitePull:Z

    .line 2
    .line 3
    return p0
.end method

.method public setDefault(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->isDefault:Z

    .line 2
    .line 3
    return-void
.end method

.method public setDisplay(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->display:Z

    .line 2
    .line 3
    return-void
.end method

.method public setInfinitePull(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->infinitePull:Z

    .line 2
    .line 3
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->disableReplaceStopped:Z

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->disableFilterRepeat:Z

    .line 6
    .line 7
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPageId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->pageId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRequestName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->requestName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTabId(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/api/LiveSquareTabBean;->tabId:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
