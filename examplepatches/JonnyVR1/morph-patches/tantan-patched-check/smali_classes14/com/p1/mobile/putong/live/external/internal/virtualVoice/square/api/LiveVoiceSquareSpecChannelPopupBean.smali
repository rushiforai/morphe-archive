.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;
    }
.end annotation


# instance fields
.field private buttonText:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "buttonText"
    .end annotation
.end field

.field private goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "goAction"
    .end annotation
.end field

.field private icon:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "icon"
    .end annotation
.end field

.field private subtitle:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "subtitle"
    .end annotation
.end field

.field private title:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "title"
    .end annotation
.end field

.field private trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "trackData"
    .end annotation
.end field

.field private type:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "type"
    .end annotation
.end field

.field private userInfo:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "userInfo"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->icon:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getButtonText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->buttonText:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGoAction()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->icon:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubtitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->subtitle:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->title:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserInfo()Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->userInfo:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;

    .line 2
    .line 3
    return-object p0
.end method

.method public setButtonText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->buttonText:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setGoAction(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    return-void
.end method

.method public setIcon(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->icon:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSubtitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->subtitle:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->title:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTrackData(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setUserInfo(Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean;->userInfo:Lcom/p1/mobile/putong/live/external/internal/virtualVoice/square/api/LiveVoiceSquareSpecChannelPopupBean$UserInfoBean;

    .line 2
    .line 3
    return-void
.end method
