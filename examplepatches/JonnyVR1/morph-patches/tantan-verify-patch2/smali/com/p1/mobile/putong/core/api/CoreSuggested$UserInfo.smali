.class public Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable;
.implements Ll/jk4;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/api/CoreSuggested;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UserInfo"
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final VIRTUAL_CARD:Ljava/lang/String; = "VirtualCard"


# instance fields
.field public active:Lcom/p1/mobile/putong/core/data/Active;

.field public autoAvatarIndex:I

.field public canGreet:Z

.field public canUndo:Z

.field public cardExtInfo:Ljava/lang/String;

.field public cardId:Ljava/lang/String;

.field public cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

.field public checkPointTime:J

.field public cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

.field public compliment:Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;

.field public controlCardInfo:Lcom/p1/mobile/putong/core/data/ControlCardInfo;

.field public coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

.field public coreMomentInfoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public creditScore:Lcom/p1/mobile/putong/core/data/CreditScoreData;

.field public descriptionContent:Ljava/lang/String;

.field public descriptionId:Ljava/lang/String;

.field public disableUndo:Z

.field public dynamicLabelList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/DynamicLable;",
            ">;"
        }
    .end annotation
.end field

.field public extensionObject:Ljava/lang/Object;

.field public extraInfo:Ljava/lang/String;

.field public fourSelectOneAdCardData:Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;

.field public friendSenseExamLikeCnt:I

.field public from:Ljava/lang/String;

.field public hasDescTagShow:Z

.field public hasLikeMe:Z

.field public hasLikeMeFrom:Ljava/lang/String;

.field public hasLikeMeSlideCardBottom:Z

.field public hasLikeMeSlideCardReward:Z

.field public hasLikeMeSlideCardTop:Z

.field public hasMoment:Z

.field public hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

.field public id:Ljava/lang/String;

.field public idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

.field public impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

.field public intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

.field public intlLiveCardPartDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

.field public isCoreMomentCard:Z

.field public isCoreMomentThemeCard:Z

.field public isExportCard:Z

.field public isIntlLikeLimitInsert:Z

.field public isLikeMe:Z

.field public isPinLike:Z

.field public isShowFakePhotoFeedback:Z

.field public isThemeCard:Z

.field public isUndo:Z

.field public isUserCardPush:Z

.field public jumpSwipe:Z

.field public letter:Ljava/lang/String;

.field public likeIdentifiersList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public literaturesComments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LiteraturesComments;",
            ">;"
        }
    .end annotation
.end field

.field public liveLivingCardDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

.field public liveRoomInfo:Ljava/lang/String;

.field public localRelationship:Lcom/p1/mobile/putong/data/Relationship;

.field public meetAgain:Z

.field public myTabTask:Lcom/p1/mobile/putong/core/data/MyTabTask;

.field public newUser:Z

.field public operationUrl:Ljava/lang/String;

.field public orderMsg:Ljava/lang/String;

.field public payCardStyle:Ljava/lang/String;

.field public picksGuideUser:Z

.field public preSwipedDirection:Lcom/p1/mobile/putong/core/data/SwipeDirection;

.field public profileContext:Ll/fr90;

.field public profileLikeCommentId:Ljava/lang/String;

.field public profileLikesComments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ProfileLikesComment;",
            ">;"
        }
    .end annotation
.end field

.field public quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

.field public quickChatPartyInvitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

.field private recommendMessage:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;"
        }
    .end annotation
.end field

.field public renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

.field private renderUser:Lcom/p1/mobile/putong/data/User;
    .annotation runtime Lcom/google/gson/annotations/Expose;
    .end annotation
.end field

.field public samesCardData:Lcom/p1/mobile/putong/core/data/SamesCardData;

.field public selectionUser:Z

.field public sendPinLike:Z

.field public suggestReasons:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/putong/core/data/SuggestReason;",
            ">;"
        }
    .end annotation
.end field

.field public topLikeRelationship:Lcom/p1/mobile/putong/data/Relationship;

.field public trackMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

.field public userCardPushReason:I

.field public userCardPushTag:Ljava/lang/String;

.field public userCardPushType:I

.field public userMedia:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public userState:Lcom/p1/mobile/putong/data/BubbleInfo;

.field public ussTags:Lcom/p1/mobile/putong/data/UssTags;

.field public virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->CREATOR:Landroid/os/Parcelable$Creator;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 3

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    .line 113
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->checkPointTime:J

    const/4 v0, 0x0

    .line 114
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasDescTagShow:Z

    .line 115
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isCoreMomentThemeCard:Z

    .line 116
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isCoreMomentCard:Z

    .line 117
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->disableUndo:Z

    .line 118
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isPinLike:Z

    .line 119
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->sendPinLike:Z

    const/4 v1, 0x0

    .line 120
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderUser:Lcom/p1/mobile/putong/data/User;

    const/4 v2, -0x1

    .line 121
    iput v2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->autoAvatarIndex:I

    .line 122
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->jumpSwipe:Z

    .line 123
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->creditScore:Lcom/p1/mobile/putong/core/data/CreditScoreData;

    .line 124
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isIntlLikeLimitInsert:Z

    .line 125
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->myTabTask:Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 126
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->UNKNOWN:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 127
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->trackMap:Ljava/util/Map;

    .line 128
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasMoment:Z

    .line 129
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isShowFakePhotoFeedback:Z

    .line 130
    invoke-static {}, Ll/pzi0;->o()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->checkPointTime:J

    return-void
.end method

.method public constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, -0x1

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->checkPointTime:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasDescTagShow:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isCoreMomentThemeCard:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isCoreMomentCard:Z

    .line 14
    .line 15
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->disableUndo:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isPinLike:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->sendPinLike:Z

    .line 20
    .line 21
    const/4 v1, 0x0

    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderUser:Lcom/p1/mobile/putong/data/User;

    .line 23
    .line 24
    const/4 v2, -0x1

    .line 25
    iput v2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->autoAvatarIndex:I

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->jumpSwipe:Z

    .line 28
    .line 29
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->creditScore:Lcom/p1/mobile/putong/core/data/CreditScoreData;

    .line 30
    .line 31
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isIntlLikeLimitInsert:Z

    .line 32
    .line 33
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->myTabTask:Lcom/p1/mobile/putong/core/data/MyTabTask;

    .line 34
    .line 35
    sget-object v1, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->UNKNOWN:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 38
    .line 39
    new-instance v1, Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->trackMap:Ljava/util/Map;

    .line 45
    .line 46
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasMoment:Z

    .line 47
    .line 48
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isShowFakePhotoFeedback:Z

    .line 49
    .line 50
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->letter:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    const/4 v2, 0x1

    .line 67
    if-eqz v1, :cond_0

    .line 68
    .line 69
    move v1, v2

    .line 70
    goto :goto_0

    .line 71
    :cond_0
    move v1, v0

    .line 72
    :goto_0
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isUndo:Z

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-eqz v1, :cond_1

    .line 79
    .line 80
    move v0, v2

    .line 81
    :cond_1
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->canUndo:Z

    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->orderMsg:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardId:Ljava/lang/String;

    .line 94
    .line 95
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardExtInfo:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-static {p1}, Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;->valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 110
    .line 111
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->recommendMessage:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public clone()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isUndo:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isUndo:Z

    .line 13
    .line 14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->canUndo:Z

    .line 15
    .line 16
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->canUndo:Z

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->preSwipedDirection:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->preSwipedDirection:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->letter:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->letter:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->orderMsg:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->orderMsg:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardId:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardId:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardExtInfo:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardExtInfo:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->suggestReasons:Ljava/util/ArrayList;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->suggestReasons:Ljava/util/ArrayList;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 53
    .line 54
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasMoment:Z

    .line 55
    .line 56
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasMoment:Z

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userMedia:Ljava/util/List;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userMedia:Ljava/util/List;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->descriptionContent:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->descriptionContent:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->descriptionId:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->descriptionId:Ljava/lang/String;

    .line 69
    .line 70
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isThemeCard:Z

    .line 71
    .line 72
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isThemeCard:Z

    .line 73
    .line 74
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMe:Z

    .line 75
    .line 76
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMe:Z

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 79
    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 81
    .line 82
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->picksGuideUser:Z

    .line 83
    .line 84
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->picksGuideUser:Z

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->literaturesComments:Ljava/util/List;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->literaturesComments:Ljava/util/List;

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->liveLivingCardDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 91
    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->liveLivingCardDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlLiveCardPartDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 95
    .line 96
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlLiveCardPartDataWrapper:Lcom/p1/mobile/putong/core/data/LiveLivingCardDataWrapper;

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->recommendMessage:Ljava/util/List;

    .line 99
    .line 100
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->recommendMessage:Ljava/util/List;

    .line 101
    .line 102
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->active:Lcom/p1/mobile/putong/core/data/Active;

    .line 103
    .line 104
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->active:Lcom/p1/mobile/putong/core/data/Active;

    .line 105
    .line 106
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->canGreet:Z

    .line 107
    .line 108
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->canGreet:Z

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 111
    .line 112
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->impressSignalCardWrapper:Lcom/p1/mobile/putong/core/data/ImpressSignalCardWrapper;

    .line 113
    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->likeIdentifiersList:Ljava/util/List;

    .line 115
    .line 116
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->likeIdentifiersList:Ljava/util/List;

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->samesCardData:Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 119
    .line 120
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->samesCardData:Lcom/p1/mobile/putong/core/data/SamesCardData;

    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 123
    .line 124
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->intlInsertCardData:Lcom/p1/mobile/putong/core/data/IntlInsertCardData;

    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 127
    .line 128
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extraInfo:Ljava/lang/String;

    .line 131
    .line 132
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->extraInfo:Ljava/lang/String;

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->controlCardInfo:Lcom/p1/mobile/putong/core/data/ControlCardInfo;

    .line 135
    .line 136
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->controlCardInfo:Lcom/p1/mobile/putong/core/data/ControlCardInfo;

    .line 137
    .line 138
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasDescTagShow:Z

    .line 139
    .line 140
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasDescTagShow:Z

    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderUser:Lcom/p1/mobile/putong/data/User;

    .line 143
    .line 144
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderUser:Lcom/p1/mobile/putong/data/User;

    .line 145
    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 147
    .line 148
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 149
    .line 150
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isCoreMomentThemeCard:Z

    .line 151
    .line 152
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isCoreMomentThemeCard:Z

    .line 153
    .line 154
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isCoreMomentCard:Z

    .line 155
    .line 156
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isCoreMomentCard:Z

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->compliment:Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;

    .line 159
    .line 160
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->compliment:Lcom/p1/mobile/putong/core/data/SuggestedComplimentItem;

    .line 161
    .line 162
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->disableUndo:Z

    .line 163
    .line 164
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->disableUndo:Z

    .line 165
    .line 166
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->newUser:Z

    .line 167
    .line 168
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->newUser:Z

    .line 169
    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatPartyInvitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    .line 171
    .line 172
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatPartyInvitation:Lcom/p1/mobile/putong/core/data/QuickChatPartyInvitation;

    .line 173
    .line 174
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isPinLike:Z

    .line 175
    .line 176
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isPinLike:Z

    .line 177
    .line 178
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->sendPinLike:Z

    .line 179
    .line 180
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->sendPinLike:Z

    .line 181
    .line 182
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->topLikeRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 183
    .line 184
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->topLikeRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 185
    .line 186
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->meetAgain:Z

    .line 187
    .line 188
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->meetAgain:Z

    .line 189
    .line 190
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->payCardStyle:Ljava/lang/String;

    .line 191
    .line 192
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->payCardStyle:Ljava/lang/String;

    .line 193
    .line 194
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 195
    .line 196
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cityCData:Lcom/p1/mobile/putong/core/data/CityCData;

    .line 197
    .line 198
    iget v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->friendSenseExamLikeCnt:I

    .line 199
    .line 200
    iput v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->friendSenseExamLikeCnt:I

    .line 201
    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->operationUrl:Ljava/lang/String;

    .line 203
    .line 204
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->operationUrl:Ljava/lang/String;

    .line 205
    .line 206
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->fourSelectOneAdCardData:Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;

    .line 207
    .line 208
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->fourSelectOneAdCardData:Lcom/p1/mobile/putong/core/data/FourSelectOneAdCardData;

    .line 209
    .line 210
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->dynamicLabelList:Ljava/util/List;

    .line 211
    .line 212
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->dynamicLabelList:Ljava/util/List;

    .line 213
    .line 214
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->selectionUser:Z

    .line 215
    .line 216
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->selectionUser:Z

    .line 217
    .line 218
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMeSlideCardTop:Z

    .line 219
    .line 220
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMeSlideCardTop:Z

    .line 221
    .line 222
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 223
    .line 224
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->idealInfo:Lcom/p1/mobile/putong/core/data/IdealInfo;

    .line 225
    .line 226
    iget v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->autoAvatarIndex:I

    .line 227
    .line 228
    iput v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->autoAvatarIndex:I

    .line 229
    .line 230
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->jumpSwipe:Z

    .line 231
    .line 232
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->jumpSwipe:Z

    .line 233
    .line 234
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isIntlLikeLimitInsert:Z

    .line 235
    .line 236
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isIntlLikeLimitInsert:Z

    .line 237
    .line 238
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->creditScore:Lcom/p1/mobile/putong/core/data/CreditScoreData;

    .line 239
    .line 240
    if-eqz v1, :cond_0

    .line 241
    .line 242
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CreditScoreData;->clone()Lcom/p1/mobile/putong/core/data/CreditScoreData;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->creditScore:Lcom/p1/mobile/putong/core/data/CreditScoreData;

    .line 247
    .line 248
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->from:Ljava/lang/String;

    .line 249
    .line 250
    iput-object v1, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->from:Ljava/lang/String;

    .line 251
    .line 252
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 253
    .line 254
    if-eqz p0, :cond_1

    .line 255
    .line 256
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/UserActivityInfo;->clone()Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    iput-object p0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 261
    .line 262
    :cond_1
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 263
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->clone()Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;

    move-result-object p0

    return-object p0
.end method

.method public debugRecommendMessage()V
    .locals 0

    return-void
.end method

.method public describeContents()I
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public getPreBackOperation()I
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->preSwipedDirection:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 2
    .line 3
    if-eqz p0, :cond_3

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/api/CoreSuggested$d;->a:[I

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    aget p0, v0, p0

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    const/4 v1, 0x1

    .line 15
    if-eq p0, v1, :cond_2

    .line 16
    .line 17
    if-eq p0, v0, :cond_1

    .line 18
    .line 19
    const/4 v0, 0x3

    .line 20
    if-eq p0, v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return v1

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return p0

    .line 26
    :cond_2
    return v0

    .line 27
    :cond_3
    :goto_0
    const/4 p0, -0x1

    .line 28
    return p0
.end method

.method public getRecommendMessage()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/RecommendMessage;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->recommendMessage:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRenderUser()Lcom/p1/mobile/putong/data/User;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderUser:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-object p0
.end method

.method public isHasMoment()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasMoment:Z

    .line 2
    .line 3
    return p0
.end method

.method public isHuman()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 8
    .line 9
    const-string v1, "human"

    .line 10
    .line 11
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    return v0
.end method

.method public isImpressSignal()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->ImpressSignalCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public isInitiateQuickChat()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->OnlineMatchBroadcastCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 16
    .line 17
    iget p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    if-ne p0, v0, :cond_0

    .line 21
    .line 22
    return v0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public isLivingCard()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveLivingCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 13
    .line 14
    if-eq p0, v0, :cond_1

    .line 15
    .line 16
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->LiveVoiceCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 17
    .line 18
    if-ne p0, v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    return v1

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_2
    return v1
.end method

.method public isMomentInfoCard()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 11
    .line 12
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CardInfos;->momentId:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-static {v0}, Ll/wj90;->c(Lcom/p1/mobile/putong/data/User;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->ui()Z

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    const/4 v2, 0x1

    .line 57
    if-eqz v0, :cond_0

    .line 58
    .line 59
    return v2

    .line 60
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->coreMomentInfo:Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 61
    .line 62
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 63
    .line 64
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-eqz p0, :cond_1

    .line 69
    .line 70
    return v1

    .line 71
    :cond_1
    return v2

    .line 72
    :cond_2
    return v1
.end method

.method public isNativeAdViewCard()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->NativeAdViewCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public isNewSpecialLike()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isOffsetUpRightBottom()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->U6:Ljava/util/Set;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isShowFakePhotoFeedback:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    return v1

    .line 21
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Wc(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    return v1

    .line 36
    :cond_1
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public isOffsetUpRightBottomValue()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->U6:Ljava/util/Set;

    .line 6
    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isShowFakePhotoFeedback:Z

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    return v1

    .line 21
    :cond_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Wc(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    return v1

    .line 36
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isShowCertificationGuidanceItem()Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    return v1

    .line 43
    :cond_2
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {v0, p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Ae(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    if-eqz p0, :cond_3

    .line 56
    .line 57
    return v1

    .line 58
    :cond_3
    const/4 p0, 0x0

    .line 59
    return p0
.end method

.method public isOnlineMatchChatBoot()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->OnlineMatchChatBootCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 4
    .line 5
    if-ne p0, v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public isPassiveQucikAudio()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->QuickAudioBroadcastCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 16
    .line 17
    iget p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 18
    .line 19
    const/4 v0, 0x2

    .line 20
    if-ne p0, v0, :cond_0

    .line 21
    .line 22
    const/4 p0, 0x1

    .line 23
    return p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public isPassiveQuickChat()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->OnlineMatchBroadcastCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    sget-object v1, Lcom/p1/mobile/putong/core/data/VirtualCardType;->QuickAudioBroadcastCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 8
    .line 9
    if-ne v0, v1, :cond_1

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->quickChatCardWrapper:Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;

    .line 20
    .line 21
    iget p0, p0, Lcom/p1/mobile/putong/core/data/QuickChatCardWrapper;->cardType:I

    .line 22
    .line 23
    const/4 v0, 0x2

    .line 24
    if-ne p0, v0, :cond_1

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public isQuickChatPartyInvitationCard()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->virtualCardType:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 2
    .line 3
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->AudioQuickChatPartyInvitationCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 4
    .line 5
    if-eq p0, v0, :cond_1

    .line 6
    .line 7
    sget-object v0, Lcom/p1/mobile/putong/core/data/VirtualCardType;->TextQuickChatPartyInvitationCard:Lcom/p1/mobile/putong/core/data/VirtualCardType;

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0
.end method

.method public isRepeatUser()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 10
    .line 11
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/UssTags;->repeatedUser:Z

    .line 12
    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public isShowCertificationGuidanceItem()Z
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isShowOnlyLookingAuthentication()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->Je()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    return v2

    .line 24
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->m0:Lcom/p1/mobile/putong/core/api/CoreSuggested;

    .line 27
    .line 28
    iget-object v3, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->K1:Ll/byd0;

    .line 29
    .line 30
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/CoreSuggested;->L1:Ll/wyd0;

    .line 31
    .line 32
    invoke-static {}, Ll/pzi0;->o()J

    .line 33
    .line 34
    .line 35
    move-result-wide v4

    .line 36
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v6

    .line 40
    check-cast v6, Ljava/lang/Long;

    .line 41
    .line 42
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 43
    .line 44
    .line 45
    move-result-wide v6

    .line 46
    invoke-static {v4, v5, v6, v7}, Ll/pzi0;->C(JJ)Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_2

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Ljava/lang/CharSequence;

    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_1

    .line 65
    .line 66
    return v2

    .line 67
    :cond_1
    return v1

    .line 68
    :cond_2
    invoke-static {}, Ll/pzi0;->o()J

    .line 69
    .line 70
    .line 71
    move-result-wide v4

    .line 72
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-virtual {v3, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 80
    .line 81
    invoke-virtual {v0, p0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    return v2

    .line 85
    :cond_3
    return v1
.end method

.method public isShowOnlyLookingAuthentication()Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const/4 v0, 0x0

    .line 12
    if-eqz p0, :cond_2

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 15
    .line 16
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_2

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 23
    .line 24
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 25
    .line 26
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-nez v1, :cond_2

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 33
    .line 34
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 41
    .line 42
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 43
    .line 44
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_2

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    check-cast v1, Lcom/p1/mobile/putong/data/SettingGroups;

    .line 59
    .line 60
    iget-object v1, v1, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 61
    .line 62
    iget-boolean v1, v1, Lcom/p1/mobile/putong/data/SvipSearch;->realUser:Z

    .line 63
    .line 64
    if-eqz v1, :cond_2

    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    if-eqz p0, :cond_2

    .line 71
    .line 72
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-nez p0, :cond_2

    .line 85
    .line 86
    const-string p0, "unknown_"

    .line 87
    .line 88
    invoke-static {p0}, Lcom/p1/mobile/putong/data/StudentVerificationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 93
    .line 94
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 95
    .line 96
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    move-result v2

    .line 104
    if-eqz v2, :cond_0

    .line 105
    .line 106
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 107
    .line 108
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    if-eqz v1, :cond_0

    .line 113
    .line 114
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 115
    .line 116
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 117
    .line 118
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/api/d0;->k4()Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 123
    .line 124
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 125
    .line 126
    :cond_0
    const-string v1, "verified"

    .line 127
    .line 128
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-nez v1, :cond_2

    .line 133
    .line 134
    const-string v1, "pending"

    .line 135
    .line 136
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    if-eqz p0, :cond_1

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_1
    const/4 p0, 0x1

    .line 144
    return p0

    .line 145
    :cond_2
    :goto_0
    return v0
.end method

.method public isSpecialLike()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isSpecialLikeShowStyle()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isUserLikeMe()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMe:Z

    .line 2
    .line 3
    return p0
.end method

.method public isVirtualCard()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    const-string v0, "VirtualCard"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public resetPreAction()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->preSwipedDirection:Lcom/p1/mobile/putong/core/data/SwipeDirection;

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isUndo:Z

    .line 6
    .line 7
    return-void
.end method

.method public setRenderUser(Lcom/p1/mobile/putong/data/User;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderUser:Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    return-void
.end method

.method public setUserLikeMe(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMe:Z

    .line 2
    .line 3
    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 1
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->letter:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isUndo:Z

    .line 12
    .line 13
    int-to-byte p2, p2

    .line 14
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 15
    .line 16
    .line 17
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->canUndo:Z

    .line 18
    .line 19
    int-to-byte p2, p2

    .line 20
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 21
    .line 22
    .line 23
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->orderMsg:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardId:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p2, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardExtInfo:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->renderFrom:Lcom/p1/mobile/putong/core/data/CardInfoRenderFrom;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p1, p0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
