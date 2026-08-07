.class public Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public emojiResult:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/voicelivemessage/VoiceMicEmoji$EmojiPlayResult;",
            ">;"
        }
    .end annotation
.end field

.field public emojiType:Ljava/lang/String;

.field public grade:J

.field public isMaskMode:Z

.field public mid:Ljava/lang/String;

.field public userId:Ljava/lang/String;

.field public userIdentity:Ljava/lang/String;

.field public userImage:Ljava/lang/String;

.field public userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

.field public userName:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 13
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userName:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userName:Ljava/lang/String;

    .line 7
    .line 8
    iput-wide p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->grade:J

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 0

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 20
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userName:Ljava/lang/String;

    .line 21
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 16
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userName:Ljava/lang/String;

    .line 17
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userImage:Ljava/lang/String;

    return-void
.end method
