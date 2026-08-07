.class public Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ExtInfo"
.end annotation


# instance fields
.field public applyCallId:Ljava/lang/String;

.field public atUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

.field public auctionId:Ljava/lang/String;

.field public buttonScene:Ljava/lang/String;

.field public buttonSchema:Ljava/lang/String;

.field public buttonUserId:Ljava/lang/String;

.field public buttonUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveAtUserInfo;

.field public callInviteId:Ljava/lang/String;

.field public followTrackName:Ljava/lang/String;

.field public followType:Ljava/lang/String;

.field public followUserId:Ljava/lang/String;

.field public gameId:Ljava/lang/String;

.field public isImportantMsg:Z

.field public isSystemReplaceMessage:Z

.field public isVoiceCallApplyMessage:Z

.field public liveId:Ljava/lang/String;

.field public messageUserId:Ljava/lang/String;

.field public msgName:Ljava/lang/String;

.field public roomId:Ljava/lang/String;

.field public scheme:Ljava/lang/String;

.field public toUserId:Ljava/lang/String;

.field public virtualAvatarNoticeMsg:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$VoiceVirtualAvatarInitNoticeMessage;

.field public voiceChatApplyId:Ljava/lang/String;

.field public voiceChatApplyUserId:Ljava/lang/String;

.field public voiceChatApplyUserName:Ljava/lang/String;

.field public voiceFollowSource:I

.field public voiceGiftItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveVoiceActiveGiftMessage$VoiceGiftItem;",
            ">;"
        }
    .end annotation
.end field

.field public voteRecordId:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->voiceFollowSource:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->isSystemReplaceMessage:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->isVoiceCallApplyMessage:Z

    .line 11
    .line 12
    const-string v0, ""

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->messageUserId:Ljava/lang/String;

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->isImportantMsg:Z

    .line 18
    .line 19
    return-void
.end method
