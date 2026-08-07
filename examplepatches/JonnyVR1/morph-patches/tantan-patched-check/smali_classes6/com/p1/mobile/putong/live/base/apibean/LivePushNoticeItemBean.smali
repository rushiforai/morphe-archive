.class public Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseListItemBean;
.source "SourceFile"


# instance fields
.field public anchorAvatar:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "anchorAvatar"
    .end annotation
.end field

.field public anchorId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "anchorId"
    .end annotation
.end field

.field public anchorName:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "anchorName"
    .end annotation
.end field

.field public pushStatus:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pushStatus"
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseListItemBean;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->anchorId:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->pushStatus:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method

.method public static disable(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    .line 2
    .line 3
    const-string v1, "hide"

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public static enable(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;

    .line 2
    .line 3
    const-string v1, "default"

    .line 4
    .line 5
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method


# virtual methods
.method public isPushEnabled()Z
    .locals 1

    .line 1
    const-string v0, "default"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->pushStatus:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public setPushEnabled(Z)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string p1, "default"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p1, "hide"

    .line 7
    .line 8
    :goto_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/apibean/LivePushNoticeItemBean;->pushStatus:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method
