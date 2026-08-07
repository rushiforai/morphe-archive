.class public Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;
.super Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;
.source "SourceFile"


# static fields
.field public static final TYPE_BG_STYLE_BLUE:Ljava/lang/String; = "blue"

.field public static final TYPE_BG_STYLE_ORANGE:Ljava/lang/String; = "orange"

.field public static final TYPE_IMAGE_STYLE_DYNAMIC:Ljava/lang/String; = "dynamic"

.field public static final TYPE_IMAGE_STYLE_STATIC:Ljava/lang/String; = "static"

.field public static final TYPE_MULTI_AVATAR:I = 0x0

.field public static final TYPE_SINGLE_AVATAR:I = 0x1


# instance fields
.field private bgStyle:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "bgStyle"
    .end annotation
.end field

.field private goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "goAction"
    .end annotation
.end field

.field private hasRedSpot:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "hasRedSpot"
    .end annotation
.end field

.field private headSculptureList:Ljava/util/ArrayList;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "headSculptureList"
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private imageStyle:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "imageStyle"
    .end annotation
.end field

.field private jumpBackToMessage:Z
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "jumpBackToMessage"
    .end annotation
.end field

.field private label:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "label"
    .end annotation
.end field

.field private subTitle:Ljava/lang/String;
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "subTitle"
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

.field private type:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "type"
    .end annotation
.end field

.field private unreadShowNumber:I
    .annotation runtime Lcom/google/gson/annotations/SerializedName;
        value = "unreadShowNumber"
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/apibean/BaseLiveBean;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getBgStyle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->bgStyle:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGoAction()Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHasRedSpot()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->hasRedSpot:Z

    .line 2
    .line 3
    return p0
.end method

.method public getHeadSculptureList()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->headSculptureList:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method public getImageStyle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->imageStyle:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLabel()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->label:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSubTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->subTitle:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTitle()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->title:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTrackData()Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->type:I

    .line 2
    .line 3
    return p0
.end method

.method public getUnreadShowNumber()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->unreadShowNumber:I

    .line 2
    .line 3
    return p0
.end method

.method public isJumpBackToMessage()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->jumpBackToMessage:Z

    .line 2
    .line 3
    return p0
.end method

.method public setBgStyle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->bgStyle:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setGoAction(Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->goAction:Lcom/p1/mobile/putong/live/base/apibean/LiveGoAction;

    .line 2
    .line 3
    return-void
.end method

.method public setHasRedSpot(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->hasRedSpot:Z

    .line 2
    .line 3
    return-void
.end method

.method public setHeadSculptureList(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->headSculptureList:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-void
.end method

.method public setImageStyle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->imageStyle:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setJumpBackToMessage(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->jumpBackToMessage:Z

    .line 2
    .line 3
    return-void
.end method

.method public setLabel(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->label:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setSubTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->subTitle:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTitle(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->title:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setTrackData(Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->trackData:Lcom/p1/mobile/putong/live/base/apibean/LiveCardTrackData;

    .line 2
    .line 3
    return-void
.end method

.method public setType(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->type:I

    .line 2
    .line 3
    return-void
.end method

.method public setUnreadShowNumber(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/virtualVoice/entry/LiveVoiceInternalEntryBean;->unreadShowNumber:I

    .line 2
    .line 3
    return-void
.end method
