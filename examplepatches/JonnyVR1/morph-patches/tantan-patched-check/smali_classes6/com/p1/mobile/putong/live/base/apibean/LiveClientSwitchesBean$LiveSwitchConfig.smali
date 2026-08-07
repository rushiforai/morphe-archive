.class public Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LiveSwitchConfig"
.end annotation


# instance fields
.field public chatHallDemotionLimit:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "chatHallDemotionLimit"
    .end annotation
.end field

.field public delExpireLogEnable:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$ExpireLogEnable;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "delExpireLogEnable"
    .end annotation
.end field

.field public frequency:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "frequency"
    .end annotation
.end field

.field public liveLogOn:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "liveLogOn"
    .end annotation
.end field

.field public logFileMaxSize:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "logFileMaxSize"
    .end annotation
.end field

.field public logWriteWindowTime:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "logWriteWindowTime"
    .end annotation
.end field

.field public openMutliCallLog:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "openMutliCallLog"
    .end annotation
.end field

.field public openPkLog:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "openPkLog"
    .end annotation
.end field

.field public pullRtcFailOverCnt:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "pullRtcFailOverCnt"
    .end annotation
.end field

.field public quickChatLogOn:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "quickChatLogOn"
    .end annotation
.end field

.field public unitIntervalMaxRow:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "unitIntervalMaxRow"
    .end annotation
.end field

.field public uploadMaxInterval:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "uploadMaxInterval"
    .end annotation
.end field

.field public url:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "url"
    .end annotation
.end field

.field public voiceChatCount:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "voiceChatCount"
    .end annotation
.end field

.field public voiceChatLength:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "voiceChatLength"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$ExpireLogEnable;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$ExpireLogEnable;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$LiveSwitchConfig;->delExpireLogEnable:Lcom/p1/mobile/putong/live/base/apibean/LiveClientSwitchesBean$ExpireLogEnable;

    .line 10
    .line 11
    return-void
.end method
