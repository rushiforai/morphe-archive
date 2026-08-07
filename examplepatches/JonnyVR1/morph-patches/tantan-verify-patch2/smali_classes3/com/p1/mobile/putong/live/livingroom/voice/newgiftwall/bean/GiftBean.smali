.class public Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/GiftBean;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseListItemBean;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public bgImage:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bgImage"
    .end annotation
.end field

.field public canGift:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "canGift"
    .end annotation
.end field

.field public icon:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "icon"
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "id"
    .end annotation
.end field

.field public isOwned:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "isOwned"
    .end annotation
.end field

.field public isPacketGift:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "isPacketGift"
    .end annotation
.end field

.field public label:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "label"
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "name"
    .end annotation
.end field

.field public price:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "price"
    .end annotation
.end field

.field public receivedCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "receivedCount"
    .end annotation
.end field

.field public tips:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "tips"
    .end annotation
.end field

.field public top1ContributorUser:Lcom/p1/mobile/putong/live/livingroom/voice/newgiftwall/bean/UserBean;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "top1ContributorUser"
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
