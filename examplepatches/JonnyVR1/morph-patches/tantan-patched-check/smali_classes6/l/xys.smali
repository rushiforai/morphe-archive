.class public Ll/xys;
.super Ll/a4s;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xys$a;
    }
.end annotation


# instance fields
.field private backgroundImage:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "backgroundImage"
    .end annotation
.end field

.field private giftImage:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "giftImage"
    .end annotation
.end field

.field private goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "goAction"
    .end annotation
.end field

.field public isFromLongLink:Z

.field private receiveUser:Ll/xys$a;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "receiveUser"
    .end annotation
.end field

.field private sendUser:Ll/xys$a;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "sendUser"
    .end annotation
.end field

.field private subTitle:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "subTitle"
    .end annotation
.end field

.field private tabId:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "tabId"
    .end annotation
.end field

.field private timestamp:J
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "timestamp"
    .end annotation
.end field

.field private titleImage:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "titleImage"
    .end annotation
.end field

.field private trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "trackData"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/a4s;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/xys;->isFromLongLink:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xys;->backgroundImage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xys;->giftImage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xys;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Ll/xys$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xys;->receiveUser:Ll/xys$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Ll/xys$a;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xys;->sendUser:Ll/xys$a;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xys;->subTitle:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xys;->tabId:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public h()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/xys;->timestamp:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xys;->titleImage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public j()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xys;->trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-object p0
.end method
