.class public Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private dynamicReady:Z

.field private giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

.field private indexOnPage:I

.field private pageIndex:I

.field private remaining:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/CoreGiftInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getIndexOnPage()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->indexOnPage:I

    .line 2
    .line 3
    return p0
.end method

.method public getPageIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->pageIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public getRemaining()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->remaining:I

    .line 2
    .line 3
    return p0
.end method

.method public giftInfo()Lcom/p1/mobile/putong/core/data/CoreGiftInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->giftInfo:Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public isDynamicReady()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->dynamicReady:Z

    .line 2
    .line 3
    return p0
.end method

.method public setDynamicReady(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->dynamicReady:Z

    .line 2
    .line 3
    return-void
.end method

.method public setIndexOnPage(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->indexOnPage:I

    .line 2
    .line 3
    return-void
.end method

.method public setPageIndex(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->pageIndex:I

    .line 2
    .line 3
    return-void
.end method

.method public setRemaining(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/businessdata/GiftInfoTotalData;->remaining:I

    .line 2
    .line 3
    return-void
.end method
