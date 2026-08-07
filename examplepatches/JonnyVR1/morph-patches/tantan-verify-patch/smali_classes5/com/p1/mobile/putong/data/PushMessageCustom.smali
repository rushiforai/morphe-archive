.class public Lcom/p1/mobile/putong/data/PushMessageCustom;
.super Lcom/tantanapp/common/data/ValueObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/data/PushMessageCustom;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/PushMessageCustom;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "pushmessagecustom"


# instance fields
.field public USSBusiness:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x84
    .end annotation
.end field

.field public USSIds:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x85
    .end annotation
.end field

.field public USSInsert:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x81
    .end annotation
.end field

.field public USSOption:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x87
    .end annotation
.end field

.field public USSPage:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x83
    .end annotation
.end field

.field public USSToast:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x82
    .end annotation
.end field

.field public USSVerify:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x86
    .end annotation
.end field

.field public action:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3
    .end annotation
.end field

.field public added:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xac
    .end annotation
.end field

.field public age:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8
    .end annotation
.end field

.field public alertId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa5
    .end annotation
.end field

.field public anchorCallId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb4
    .end annotation
.end field

.field public anchorId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7b
    .end annotation
.end field

.field public appId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x91
    .end annotation
.end field

.field public avatar:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5b
    .end annotation
.end field

.field public avatarState:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x76
    .end annotation
.end field

.field public avatars:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x89
    .end annotation
.end field

.field public bellNotShowStayTime:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x59
    .end annotation
.end field

.field public bellShowStayTime:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x58
    .end annotation
.end field

.field public bellType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x97
    .end annotation
.end field

.field public bgImg:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa9
    .end annotation
.end field

.field public big_pic_url:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7
    .end annotation
.end field

.field public birthday:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public biz:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x70
    .end annotation
.end field

.field public broadcastID:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4e
    .end annotation
.end field

.field public businessType:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x21
    .end annotation
.end field

.field public buttonText:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x15
    .end annotation
.end field

.field public buzzToken:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8c
    .end annotation
.end field

.field public callback:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x22
    .end annotation
.end field

.field public callee:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x27
    .end annotation
.end field

.field public calleeDeviceId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x29
    .end annotation
.end field

.field public calleeToken:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2d
    .end annotation
.end field

.field public calleeTokenV2:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb7
    .end annotation
.end field

.field public caller:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x26
    .end annotation
.end field

.field public callerDeviceId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x28
    .end annotation
.end field

.field public callerToken:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2c
    .end annotation
.end field

.field public callerTokenV2:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb6
    .end annotation
.end field

.field public canShowNotification:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb1
    .end annotation
.end field

.field public canUserStartLive:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2f
    .end annotation
.end field

.field public category:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public cell:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9a
    .end annotation
.end field

.field public channel:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8b
    .end annotation
.end field

.field public channelKey:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x94
    .end annotation
.end field

.field public channelName:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2b
    .end annotation
.end field

.field public channelNameV2:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb5
    .end annotation
.end field

.field public channelToken:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x93
    .end annotation
.end field

.field public city:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5c
    .end annotation
.end field

.field public content:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x47
    .end annotation
.end field

.field public contractId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4d
    .end annotation
.end field

.field public conversationId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x79
    .end annotation
.end field

.field public countDownSeconds:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5f
    .end annotation
.end field

.field public couponDesc:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4a
    .end annotation
.end field

.field public couponId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x49
    .end annotation
.end field

.field public createdTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2e
    .end annotation
.end field

.field public creationData:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6d
    .end annotation
.end field

.field public currencySymbol:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public dates:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x13
    .end annotation
.end field

.field public distance:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5d
    .end annotation
.end field

.field public duration:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation
.end field

.field public emoji:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbf
    .end annotation
.end field

.field public endDate:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6c
    .end annotation
.end field

.field public eventName:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x18
    .end annotation
.end field

.field public expire:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1
    .end annotation
.end field

.field public ext:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public extTabId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x11
    .end annotation
.end field

.field public extra:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x52
    .end annotation
.end field

.field public extraPrivileges:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8d
    .end annotation
.end field

.field public extremePickShowId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xab
    .end annotation
.end field

.field public fitReason:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xba
    .end annotation
.end field

.field public friendPurpose:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbb
    .end annotation
.end field

.field public frozenDuration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x96
    .end annotation
.end field

.field public fullScreen:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2
    .end annotation
.end field

.field public gender:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5
    .end annotation
.end field

.field public gid:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9e
    .end annotation
.end field

.field public giftId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6
    .end annotation
.end field

.field public greetID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x68
    .end annotation
.end field

.field public groupId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x69
    .end annotation
.end field

.field public honorGiftCardDetail:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb0
    .end annotation
.end field

.field public id:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x25
    .end annotation
.end field

.field public image:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x48
    .end annotation
.end field

.field public inflow:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x30
    .end annotation
.end field

.field public initialDuration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8f
    .end annotation
.end field

.field public insidePool:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9c
    .end annotation
.end field

.field public intent:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9f
    .end annotation
.end field

.field public isGreet:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x56
    .end annotation
.end field

.field public isPassive:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x80
    .end annotation
.end field

.field public itemId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x32
    .end annotation
.end field

.field public lastActiveTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x74
    .end annotation
.end field

.field public letter:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public likedCount:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x42
    .end annotation
.end field

.field public likedPopuserCount:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x43
    .end annotation
.end field

.field public link:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x51
    .end annotation
.end field

.field public liveId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xd
    .end annotation
.end field

.field public liveMode:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8a
    .end annotation
.end field

.field public liveTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7a
    .end annotation
.end field

.field public localNotificationCategory:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb2
    .end annotation
.end field

.field public localNotificationImportance:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb3
    .end annotation
.end field

.field public mandatory:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x66
    .end annotation
.end field

.field public maskMode:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x61
    .end annotation
.end field

.field public matchTopic:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public matched:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xaf
    .end annotation
.end field

.field public memojiDuration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa7
    .end annotation
.end field

.field public merchandiseId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4b
    .end annotation
.end field

.field public messageID:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x55
    .end annotation
.end field

.field public mode:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9d
    .end annotation
.end field

.field public msgId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7c
    .end annotation
.end field

.field public msgSingleUpdateIgnoreConvStatus:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbe
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9
    .end annotation
.end field

.field public needReact:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa3
    .end annotation
.end field

.field public newToast:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa8
    .end annotation
.end field

.field public nickname:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xf
    .end annotation
.end field

.field public noRecommended:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7f
    .end annotation
.end field

.field public openingRemark:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public orderId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public origin:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x31
    .end annotation
.end field

.field public otherID:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x54
    .end annotation
.end field

.field public otherUserID:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x17
    .end annotation
.end field

.field public otherUserId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x72
    .end annotation
.end field

.field public otherUserName:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x75
    .end annotation
.end field

.field public otherUsers:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa6
    .end annotation
.end field

.field public partyId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4f
    .end annotation
.end field

.field public platform:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4c
    .end annotation
.end field

.field public poolID:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public popChange:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x44
    .end annotation
.end field

.field public popupsDisplay:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x8e
    .end annotation
.end field

.field public price:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public privileges:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public productType:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public prolongCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x90
    .end annotation
.end field

.field public provider:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x20
    .end annotation
.end field

.field public pullStreamUrl:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1f
    .end annotation
.end field

.field public pushChannel:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xaa
    .end annotation
.end field

.field public queryOtherUserToken:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1e
    .end annotation
.end field

.field public queryToken:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x16
    .end annotation
.end field

.field public questionIdSelected:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x9b
    .end annotation
.end field

.field public quickchatType:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1d
    .end annotation
.end field

.field public radioType:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x63
    .end annotation
.end field

.field public reaction:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa4
    .end annotation
.end field

.field public readUntilId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public receiveUserID:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x62
    .end annotation
.end field

.field public recommendText:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x14
    .end annotation
.end field

.field public resolutionHeight:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x98
    .end annotation
.end field

.field public resolutionWidth:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x99
    .end annotation
.end field

.field public roomId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xe
    .end annotation
.end field

.field public rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x65
    .end annotation
.end field

.field public rtcChannel:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1b
    .end annotation
.end field

.field public rtcChannelWaitingTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1c
    .end annotation
.end field

.field public rtcProvider:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb8
    .end annotation
.end field

.field public rtcToken:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x1a
    .end annotation
.end field

.field public ruleKey:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa0
    .end annotation
.end field

.field public scene:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x67
    .end annotation
.end field

.field public schema:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7d
    .end annotation
.end field

.field public score:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x50
    .end annotation
.end field

.field public selectedQuestion:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa1
    .end annotation
.end field

.field public source:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x23
    .end annotation
.end field

.field public stage:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6f
    .end annotation
.end field

.field public startDate:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6b
    .end annotation
.end field

.field public state:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x78
    .end annotation
.end field

.field public stateID:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6e
    .end annotation
.end field

.field public subSource:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x24
    .end annotation
.end field

.field public subTitle:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x77
    .end annotation
.end field

.field public tabId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x10
    .end annotation
.end field

.field public tag1:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa
    .end annotation
.end field

.field public tag2:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb
    .end annotation
.end field

.field public tag3:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xc
    .end annotation
.end field

.field public tagID:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbd
    .end annotation
.end field

.field public taskId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x12
    .end annotation
.end field

.field public testGroupName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x88
    .end annotation
.end field

.field public text:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x71
    .end annotation
.end field

.field public timestamp:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xa2
    .end annotation
.end field

.field public title:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x46
    .end annotation
.end field

.field public topicId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x60
    .end annotation
.end field

.field public total:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xae
    .end annotation
.end field

.field public totalDuration:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x95
    .end annotation
.end field

.field public traceId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x53
    .end annotation
.end field

.field public tracker:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x57
    .end annotation
.end field

.field public triggeredUserId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x7e
    .end annotation
.end field

.field public type:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x73
    .end annotation
.end field

.field public unread:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xad
    .end annotation
.end field

.field public url:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4
    .end annotation
.end field

.field public userId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public userMatched:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x19
    .end annotation
.end field

.field public userName:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x45
    .end annotation
.end field

.field public vendor:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x92
    .end annotation
.end field

.field public videoChatId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xb9
    .end annotation
.end field

.field public videoPartnerFinderId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6a
    .end annotation
.end field

.field public voicePartnerFinderId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5a
    .end annotation
.end field

.field public voiceStatus:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x2a
    .end annotation
.end field

.field public zodiac:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5e
    .end annotation
.end field

.field public zodiacFitPercent:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0xbc
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/PushMessageCustom$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/PushMessageCustom$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/PushMessageCustom$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/PushMessageCustom$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/ValueObject;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static new_()Lcom/p1/mobile/putong/data/PushMessageCustom;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/PushMessageCustom;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/PushMessageCustom;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 768
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/PushMessageCustom;->clone()Lcom/p1/mobile/putong/data/PushMessageCustom;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/PushMessageCustom;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/PushMessageCustom;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    .line 9
    .line 10
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fullScreen:Z

    .line 11
    .line 12
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fullScreen:Z

    .line 13
    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->action:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->action:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->url:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->url:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gender:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gender:Ljava/lang/String;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->big_pic_url:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->big_pic_url:Ljava/lang/String;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    .line 45
    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    .line 47
    .line 48
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    .line 51
    .line 52
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 55
    .line 56
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    .line 59
    .line 60
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    .line 61
    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    .line 63
    .line 64
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    .line 67
    .line 68
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extTabId:Ljava/lang/String;

    .line 71
    .line 72
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extTabId:Ljava/lang/String;

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->taskId:Ljava/lang/String;

    .line 75
    .line 76
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->taskId:Ljava/lang/String;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->dates:Ljava/lang/String;

    .line 79
    .line 80
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->dates:Ljava/lang/String;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->recommendText:Ljava/lang/String;

    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->recommendText:Ljava/lang/String;

    .line 85
    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryToken:Ljava/lang/String;

    .line 91
    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryToken:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserID:Ljava/lang/String;

    .line 95
    .line 96
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserID:Ljava/lang/String;

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->eventName:Ljava/lang/String;

    .line 99
    .line 100
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->eventName:Ljava/lang/String;

    .line 101
    .line 102
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userMatched:Z

    .line 103
    .line 104
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userMatched:Z

    .line 105
    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcToken:Ljava/lang/String;

    .line 107
    .line 108
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcToken:Ljava/lang/String;

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannel:Ljava/lang/String;

    .line 111
    .line 112
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannel:Ljava/lang/String;

    .line 113
    .line 114
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannelWaitingTime:J

    .line 115
    .line 116
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannelWaitingTime:J

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->quickchatType:Ljava/lang/String;

    .line 119
    .line 120
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->quickchatType:Ljava/lang/String;

    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryOtherUserToken:Ljava/lang/String;

    .line 123
    .line 124
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryOtherUserToken:Ljava/lang/String;

    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pullStreamUrl:Ljava/lang/String;

    .line 127
    .line 128
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pullStreamUrl:Ljava/lang/String;

    .line 129
    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->provider:Ljava/lang/String;

    .line 131
    .line 132
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->provider:Ljava/lang/String;

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    .line 135
    .line 136
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callback:Ljava/lang/String;

    .line 139
    .line 140
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callback:Ljava/lang/String;

    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 143
    .line 144
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 145
    .line 146
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subSource:Ljava/lang/String;

    .line 147
    .line 148
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subSource:Ljava/lang/String;

    .line 149
    .line 150
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    .line 151
    .line 152
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    .line 153
    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    .line 155
    .line 156
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    .line 157
    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    .line 159
    .line 160
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    .line 161
    .line 162
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerDeviceId:Ljava/lang/String;

    .line 163
    .line 164
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerDeviceId:Ljava/lang/String;

    .line 165
    .line 166
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    .line 167
    .line 168
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    .line 169
    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->voiceStatus:Ljava/lang/String;

    .line 171
    .line 172
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->voiceStatus:Ljava/lang/String;

    .line 173
    .line 174
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelName:Ljava/lang/String;

    .line 175
    .line 176
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelName:Ljava/lang/String;

    .line 177
    .line 178
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerToken:Ljava/lang/String;

    .line 179
    .line 180
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerToken:Ljava/lang/String;

    .line 181
    .line 182
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeToken:Ljava/lang/String;

    .line 183
    .line 184
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeToken:Ljava/lang/String;

    .line 185
    .line 186
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->createdTime:D

    .line 187
    .line 188
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->createdTime:D

    .line 189
    .line 190
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->canUserStartLive:Ljava/lang/Boolean;

    .line 191
    .line 192
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->canUserStartLive:Ljava/lang/Boolean;

    .line 193
    .line 194
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->inflow:J

    .line 195
    .line 196
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->inflow:J

    .line 197
    .line 198
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->origin:Ljava/lang/String;

    .line 199
    .line 200
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->origin:Ljava/lang/String;

    .line 201
    .line 202
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->itemId:Ljava/lang/String;

    .line 203
    .line 204
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->itemId:Ljava/lang/String;

    .line 205
    .line 206
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->orderId:Ljava/lang/String;

    .line 207
    .line 208
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->orderId:Ljava/lang/String;

    .line 209
    .line 210
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->privileges:Ljava/lang/String;

    .line 211
    .line 212
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->privileges:Ljava/lang/String;

    .line 213
    .line 214
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->matchTopic:Ljava/lang/String;

    .line 215
    .line 216
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->matchTopic:Ljava/lang/String;

    .line 217
    .line 218
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 219
    .line 220
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 221
    .line 222
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->readUntilId:Ljava/lang/String;

    .line 223
    .line 224
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->readUntilId:Ljava/lang/String;

    .line 225
    .line 226
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->letter:Ljava/lang/String;

    .line 227
    .line 228
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->letter:Ljava/lang/String;

    .line 229
    .line 230
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->openingRemark:Ljava/lang/String;

    .line 231
    .line 232
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->openingRemark:Ljava/lang/String;

    .line 233
    .line 234
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->poolID:Ljava/lang/String;

    .line 235
    .line 236
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->poolID:Ljava/lang/String;

    .line 237
    .line 238
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->birthday:J

    .line 239
    .line 240
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->birthday:J

    .line 241
    .line 242
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->productType:Ljava/lang/String;

    .line 243
    .line 244
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->productType:Ljava/lang/String;

    .line 245
    .line 246
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 247
    .line 248
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 249
    .line 250
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->currencySymbol:Ljava/lang/String;

    .line 251
    .line 252
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->currencySymbol:Ljava/lang/String;

    .line 253
    .line 254
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->price:Ljava/lang/String;

    .line 255
    .line 256
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->price:Ljava/lang/String;

    .line 257
    .line 258
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ext:Ljava/lang/String;

    .line 259
    .line 260
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ext:Ljava/lang/String;

    .line 261
    .line 262
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->duration:J

    .line 263
    .line 264
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->duration:J

    .line 265
    .line 266
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedCount:Ljava/lang/String;

    .line 267
    .line 268
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedCount:Ljava/lang/String;

    .line 269
    .line 270
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedPopuserCount:Ljava/lang/String;

    .line 271
    .line 272
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedPopuserCount:Ljava/lang/String;

    .line 273
    .line 274
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->popChange:Ljava/lang/String;

    .line 275
    .line 276
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->popChange:Ljava/lang/String;

    .line 277
    .line 278
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userName:Ljava/lang/String;

    .line 279
    .line 280
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userName:Ljava/lang/String;

    .line 281
    .line 282
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 283
    .line 284
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 285
    .line 286
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 287
    .line 288
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 289
    .line 290
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 291
    .line 292
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 293
    .line 294
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponId:Ljava/lang/String;

    .line 295
    .line 296
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponId:Ljava/lang/String;

    .line 297
    .line 298
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponDesc:Ljava/lang/String;

    .line 299
    .line 300
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponDesc:Ljava/lang/String;

    .line 301
    .line 302
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->merchandiseId:Ljava/lang/String;

    .line 303
    .line 304
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->merchandiseId:Ljava/lang/String;

    .line 305
    .line 306
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->platform:Ljava/lang/String;

    .line 307
    .line 308
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->platform:Ljava/lang/String;

    .line 309
    .line 310
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->contractId:Ljava/lang/String;

    .line 311
    .line 312
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->contractId:Ljava/lang/String;

    .line 313
    .line 314
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->broadcastID:Ljava/lang/String;

    .line 315
    .line 316
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->broadcastID:Ljava/lang/String;

    .line 317
    .line 318
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->partyId:Ljava/lang/String;

    .line 319
    .line 320
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->partyId:Ljava/lang/String;

    .line 321
    .line 322
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->score:Ljava/lang/String;

    .line 323
    .line 324
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->score:Ljava/lang/String;

    .line 325
    .line 326
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->link:Ljava/lang/String;

    .line 327
    .line 328
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->link:Ljava/lang/String;

    .line 329
    .line 330
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 331
    .line 332
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 333
    .line 334
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->traceId:Ljava/lang/String;

    .line 335
    .line 336
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->traceId:Ljava/lang/String;

    .line 337
    .line 338
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    .line 339
    .line 340
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    .line 341
    .line 342
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->messageID:Ljava/lang/String;

    .line 343
    .line 344
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->messageID:Ljava/lang/String;

    .line 345
    .line 346
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->isGreet:Z

    .line 347
    .line 348
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->isGreet:Z

    .line 349
    .line 350
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 351
    .line 352
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 353
    .line 354
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellShowStayTime:I

    .line 355
    .line 356
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellShowStayTime:I

    .line 357
    .line 358
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellNotShowStayTime:I

    .line 359
    .line 360
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellNotShowStayTime:I

    .line 361
    .line 362
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->voicePartnerFinderId:Ljava/lang/String;

    .line 363
    .line 364
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->voicePartnerFinderId:Ljava/lang/String;

    .line 365
    .line 366
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatar:Ljava/lang/String;

    .line 367
    .line 368
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatar:Ljava/lang/String;

    .line 369
    .line 370
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->city:Ljava/lang/String;

    .line 371
    .line 372
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->city:Ljava/lang/String;

    .line 373
    .line 374
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->distance:J

    .line 375
    .line 376
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->distance:J

    .line 377
    .line 378
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiac:Ljava/lang/String;

    .line 379
    .line 380
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiac:Ljava/lang/String;

    .line 381
    .line 382
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->countDownSeconds:J

    .line 383
    .line 384
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->countDownSeconds:J

    .line 385
    .line 386
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->topicId:Ljava/lang/String;

    .line 387
    .line 388
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->topicId:Ljava/lang/String;

    .line 389
    .line 390
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->maskMode:Z

    .line 391
    .line 392
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->maskMode:Z

    .line 393
    .line 394
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->receiveUserID:Ljava/lang/String;

    .line 395
    .line 396
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->receiveUserID:Ljava/lang/String;

    .line 397
    .line 398
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->radioType:Ljava/lang/String;

    .line 399
    .line 400
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->radioType:Ljava/lang/String;

    .line 401
    .line 402
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 403
    .line 404
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 405
    .line 406
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mandatory:Z

    .line 407
    .line 408
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mandatory:Z

    .line 409
    .line 410
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    .line 411
    .line 412
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    .line 413
    .line 414
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    .line 415
    .line 416
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    .line 417
    .line 418
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    .line 419
    .line 420
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    .line 421
    .line 422
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoPartnerFinderId:Ljava/lang/String;

    .line 423
    .line 424
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoPartnerFinderId:Ljava/lang/String;

    .line 425
    .line 426
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->startDate:Ljava/lang/String;

    .line 427
    .line 428
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->startDate:Ljava/lang/String;

    .line 429
    .line 430
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->endDate:Ljava/lang/String;

    .line 431
    .line 432
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->endDate:Ljava/lang/String;

    .line 433
    .line 434
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->creationData:Ljava/lang/String;

    .line 435
    .line 436
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->creationData:Ljava/lang/String;

    .line 437
    .line 438
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->stateID:Ljava/lang/String;

    .line 439
    .line 440
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->stateID:Ljava/lang/String;

    .line 441
    .line 442
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->stage:Ljava/lang/String;

    .line 443
    .line 444
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->stage:Ljava/lang/String;

    .line 445
    .line 446
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->biz:Ljava/lang/String;

    .line 447
    .line 448
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->biz:Ljava/lang/String;

    .line 449
    .line 450
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->text:Ljava/lang/String;

    .line 451
    .line 452
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->text:Ljava/lang/String;

    .line 453
    .line 454
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserId:Ljava/lang/String;

    .line 455
    .line 456
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserId:Ljava/lang/String;

    .line 457
    .line 458
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    .line 459
    .line 460
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    .line 461
    .line 462
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->lastActiveTime:J

    .line 463
    .line 464
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->lastActiveTime:J

    .line 465
    .line 466
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserName:Ljava/lang/String;

    .line 467
    .line 468
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserName:Ljava/lang/String;

    .line 469
    .line 470
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    .line 471
    .line 472
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    .line 473
    .line 474
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 475
    .line 476
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 477
    .line 478
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 479
    .line 480
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 481
    .line 482
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    .line 483
    .line 484
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    .line 485
    .line 486
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    .line 487
    .line 488
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    .line 489
    .line 490
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    .line 491
    .line 492
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    .line 493
    .line 494
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    .line 495
    .line 496
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    .line 497
    .line 498
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    .line 499
    .line 500
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    .line 501
    .line 502
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 503
    .line 504
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 505
    .line 506
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->noRecommended:Z

    .line 507
    .line 508
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->noRecommended:Z

    .line 509
    .line 510
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->isPassive:Z

    .line 511
    .line 512
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->isPassive:Z

    .line 513
    .line 514
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    .line 515
    .line 516
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    .line 517
    .line 518
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    .line 519
    .line 520
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    .line 521
    .line 522
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    .line 523
    .line 524
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    .line 525
    .line 526
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    .line 527
    .line 528
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    .line 529
    .line 530
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    .line 531
    .line 532
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    .line 533
    .line 534
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    .line 535
    .line 536
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    .line 537
    .line 538
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    .line 539
    .line 540
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    .line 541
    .line 542
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 543
    .line 544
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 545
    .line 546
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    .line 547
    .line 548
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    .line 549
    .line 550
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 551
    .line 552
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 553
    .line 554
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    .line 555
    .line 556
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    .line 557
    .line 558
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    .line 559
    .line 560
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    .line 561
    .line 562
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extraPrivileges:I

    .line 563
    .line 564
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extraPrivileges:I

    .line 565
    .line 566
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->popupsDisplay:Z

    .line 567
    .line 568
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->popupsDisplay:Z

    .line 569
    .line 570
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->initialDuration:I

    .line 571
    .line 572
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->initialDuration:I

    .line 573
    .line 574
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->prolongCount:I

    .line 575
    .line 576
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->prolongCount:I

    .line 577
    .line 578
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    .line 579
    .line 580
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    .line 581
    .line 582
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->vendor:I

    .line 583
    .line 584
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->vendor:I

    .line 585
    .line 586
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    .line 587
    .line 588
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    .line 589
    .line 590
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    .line 591
    .line 592
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    .line 593
    .line 594
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->totalDuration:I

    .line 595
    .line 596
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->totalDuration:I

    .line 597
    .line 598
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->frozenDuration:I

    .line 599
    .line 600
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->frozenDuration:I

    .line 601
    .line 602
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    .line 603
    .line 604
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    .line 605
    .line 606
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionHeight:I

    .line 607
    .line 608
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionHeight:I

    .line 609
    .line 610
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionWidth:I

    .line 611
    .line 612
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionWidth:I

    .line 613
    .line 614
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    .line 615
    .line 616
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    .line 617
    .line 618
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    .line 619
    .line 620
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    .line 621
    .line 622
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->insidePool:Z

    .line 623
    .line 624
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->insidePool:Z

    .line 625
    .line 626
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    .line 627
    .line 628
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    .line 629
    .line 630
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    .line 631
    .line 632
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    .line 633
    .line 634
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    .line 635
    .line 636
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    .line 637
    .line 638
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    .line 639
    .line 640
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    .line 641
    .line 642
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    .line 643
    .line 644
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    .line 645
    .line 646
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    .line 647
    .line 648
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    .line 649
    .line 650
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->needReact:Z

    .line 651
    .line 652
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->needReact:Z

    .line 653
    .line 654
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    .line 655
    .line 656
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    .line 657
    .line 658
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    .line 659
    .line 660
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    .line 661
    .line 662
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    .line 663
    .line 664
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    .line 665
    .line 666
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->memojiDuration:I

    .line 667
    .line 668
    iput v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->memojiDuration:I

    .line 669
    .line 670
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->newToast:Z

    .line 671
    .line 672
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->newToast:Z

    .line 673
    .line 674
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    .line 675
    .line 676
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    .line 677
    .line 678
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    .line 679
    .line 680
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    .line 681
    .line 682
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    .line 683
    .line 684
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    .line 685
    .line 686
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    .line 687
    .line 688
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    .line 689
    .line 690
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    .line 691
    .line 692
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    .line 693
    .line 694
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    .line 695
    .line 696
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    .line 697
    .line 698
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->matched:Z

    .line 699
    .line 700
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->matched:Z

    .line 701
    .line 702
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    .line 703
    .line 704
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    .line 705
    .line 706
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->canShowNotification:Ljava/lang/Boolean;

    .line 707
    .line 708
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->canShowNotification:Ljava/lang/Boolean;

    .line 709
    .line 710
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    .line 711
    .line 712
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    .line 713
    .line 714
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    .line 715
    .line 716
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    .line 717
    .line 718
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    .line 719
    .line 720
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    .line 721
    .line 722
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    .line 723
    .line 724
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    .line 725
    .line 726
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    .line 727
    .line 728
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    .line 729
    .line 730
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    .line 731
    .line 732
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    .line 733
    .line 734
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    .line 735
    .line 736
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    .line 737
    .line 738
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    .line 739
    .line 740
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    .line 741
    .line 742
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    .line 743
    .line 744
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    .line 745
    .line 746
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    .line 747
    .line 748
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    .line 749
    .line 750
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    .line 751
    .line 752
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    .line 753
    .line 754
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    .line 755
    .line 756
    iput-object v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    .line 757
    .line 758
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgSingleUpdateIgnoreConvStatus:Z

    .line 759
    .line 760
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgSingleUpdateIgnoreConvStatus:Z

    .line 761
    .line 762
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    .line 763
    .line 764
    iput-object p0, v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    .line 765
    .line 766
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 767
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/PushMessageCustom;->clone()Lcom/p1/mobile/putong/data/PushMessageCustom;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 1
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 2
    :cond_1
    check-cast p1, Lcom/p1/mobile/putong/data/PushMessageCustom;

    .line 3
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    iget-wide v5, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    cmpl-double v1, v3, v5

    if-nez v1, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fullScreen:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->fullScreen:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->action:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->action:Ljava/lang/String;

    .line 4
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->url:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->url:Ljava/lang/String;

    .line 5
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gender:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->gender:Ljava/lang/String;

    .line 6
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    .line 7
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->big_pic_url:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->big_pic_url:Ljava/lang/String;

    .line 8
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    .line 9
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    .line 10
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    .line 11
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    .line 12
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    .line 13
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    .line 14
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    .line 15
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    .line 16
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    .line 17
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extTabId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extTabId:Ljava/lang/String;

    .line 18
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->taskId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->taskId:Ljava/lang/String;

    .line 19
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->dates:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->dates:Ljava/lang/String;

    .line 20
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->recommendText:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->recommendText:Ljava/lang/String;

    .line 21
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    .line 22
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryToken:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryToken:Ljava/lang/String;

    .line 23
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserID:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserID:Ljava/lang/String;

    .line 24
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->eventName:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->eventName:Ljava/lang/String;

    .line 25
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userMatched:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userMatched:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcToken:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcToken:Ljava/lang/String;

    .line 26
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannel:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannel:Ljava/lang/String;

    .line 27
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannelWaitingTime:J

    iget-wide v5, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannelWaitingTime:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->quickchatType:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->quickchatType:Ljava/lang/String;

    .line 28
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryOtherUserToken:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryOtherUserToken:Ljava/lang/String;

    .line 29
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pullStreamUrl:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->pullStreamUrl:Ljava/lang/String;

    .line 30
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->provider:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->provider:Ljava/lang/String;

    .line 31
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    .line 32
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callback:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callback:Ljava/lang/String;

    .line 33
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    .line 34
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subSource:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->subSource:Ljava/lang/String;

    .line 35
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    .line 36
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    .line 37
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    .line 38
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerDeviceId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerDeviceId:Ljava/lang/String;

    .line 39
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    .line 40
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->voiceStatus:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->voiceStatus:Ljava/lang/String;

    .line 41
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelName:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelName:Ljava/lang/String;

    .line 42
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerToken:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerToken:Ljava/lang/String;

    .line 43
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeToken:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeToken:Ljava/lang/String;

    .line 44
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->createdTime:D

    iget-wide v5, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->createdTime:D

    cmpl-double v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->canUserStartLive:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->canUserStartLive:Ljava/lang/Boolean;

    .line 45
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->inflow:J

    iget-wide v5, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->inflow:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->origin:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->origin:Ljava/lang/String;

    .line 46
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->itemId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->itemId:Ljava/lang/String;

    .line 47
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->orderId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->orderId:Ljava/lang/String;

    .line 48
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->privileges:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->privileges:Ljava/lang/String;

    .line 49
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->matchTopic:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->matchTopic:Ljava/lang/String;

    .line 50
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    .line 51
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->readUntilId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->readUntilId:Ljava/lang/String;

    .line 52
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->letter:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->letter:Ljava/lang/String;

    .line 53
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->openingRemark:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->openingRemark:Ljava/lang/String;

    .line 54
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->poolID:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->poolID:Ljava/lang/String;

    .line 55
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->birthday:J

    iget-wide v5, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->birthday:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->productType:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->productType:Ljava/lang/String;

    .line 56
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    .line 57
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->currencySymbol:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->currencySymbol:Ljava/lang/String;

    .line 58
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->price:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->price:Ljava/lang/String;

    .line 59
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ext:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->ext:Ljava/lang/String;

    .line 60
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->duration:J

    iget-wide v5, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->duration:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedCount:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedCount:Ljava/lang/String;

    .line 61
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedPopuserCount:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedPopuserCount:Ljava/lang/String;

    .line 62
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->popChange:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->popChange:Ljava/lang/String;

    .line 63
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userName:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->userName:Ljava/lang/String;

    .line 64
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    .line 65
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    .line 66
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    .line 67
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponId:Ljava/lang/String;

    .line 68
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponDesc:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponDesc:Ljava/lang/String;

    .line 69
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->merchandiseId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->merchandiseId:Ljava/lang/String;

    .line 70
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->platform:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->platform:Ljava/lang/String;

    .line 71
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->contractId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->contractId:Ljava/lang/String;

    .line 72
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->broadcastID:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->broadcastID:Ljava/lang/String;

    .line 73
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->partyId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->partyId:Ljava/lang/String;

    .line 74
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->score:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->score:Ljava/lang/String;

    .line 75
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->link:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->link:Ljava/lang/String;

    .line 76
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    .line 77
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->traceId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->traceId:Ljava/lang/String;

    .line 78
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    .line 79
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->messageID:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->messageID:Ljava/lang/String;

    .line 80
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->isGreet:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->isGreet:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    .line 81
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellShowStayTime:I

    iget v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellShowStayTime:I

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellNotShowStayTime:I

    iget v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellNotShowStayTime:I

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->voicePartnerFinderId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->voicePartnerFinderId:Ljava/lang/String;

    .line 82
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatar:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatar:Ljava/lang/String;

    .line 83
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->city:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->city:Ljava/lang/String;

    .line 84
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->distance:J

    iget-wide v5, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->distance:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiac:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiac:Ljava/lang/String;

    .line 85
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->countDownSeconds:J

    iget-wide v5, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->countDownSeconds:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->topicId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->topicId:Ljava/lang/String;

    .line 86
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->maskMode:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->maskMode:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->receiveUserID:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->receiveUserID:Ljava/lang/String;

    .line 87
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->radioType:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->radioType:Ljava/lang/String;

    .line 88
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 89
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mandatory:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->mandatory:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    .line 90
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    .line 91
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    .line 92
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoPartnerFinderId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoPartnerFinderId:Ljava/lang/String;

    .line 93
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->startDate:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->startDate:Ljava/lang/String;

    .line 94
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->endDate:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->endDate:Ljava/lang/String;

    .line 95
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->creationData:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->creationData:Ljava/lang/String;

    .line 96
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->stateID:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->stateID:Ljava/lang/String;

    .line 97
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->stage:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->stage:Ljava/lang/String;

    .line 98
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->biz:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->biz:Ljava/lang/String;

    .line 99
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->text:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->text:Ljava/lang/String;

    .line 100
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserId:Ljava/lang/String;

    .line 101
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    .line 102
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-wide v3, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->lastActiveTime:J

    iget-wide v5, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->lastActiveTime:J

    cmp-long v1, v3, v5

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserName:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserName:Ljava/lang/String;

    .line 103
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    .line 104
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 105
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 106
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    .line 107
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    .line 108
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    .line 109
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    .line 110
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    .line 111
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 112
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->noRecommended:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->noRecommended:Z

    if-ne v1, v3, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->isPassive:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->isPassive:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    .line 113
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    .line 114
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    .line 115
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    .line 116
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    .line 117
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    .line 118
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    .line 119
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 120
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    .line 121
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 122
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    .line 123
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    .line 124
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extraPrivileges:I

    iget v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extraPrivileges:I

    if-ne v1, v3, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->popupsDisplay:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->popupsDisplay:Z

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->initialDuration:I

    iget v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->initialDuration:I

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->prolongCount:I

    iget v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->prolongCount:I

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    .line 125
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->vendor:I

    iget v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->vendor:I

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    .line 126
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    .line 127
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->totalDuration:I

    iget v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->totalDuration:I

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->frozenDuration:I

    iget v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->frozenDuration:I

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    .line 128
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionHeight:I

    iget v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionHeight:I

    if-ne v1, v3, :cond_2

    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionWidth:I

    iget v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionWidth:I

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    .line 129
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    .line 130
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->insidePool:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->insidePool:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    .line 131
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    .line 132
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    .line 133
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    .line 134
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    .line 135
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    .line 136
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->needReact:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->needReact:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    .line 137
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    .line 138
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    .line 139
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->memojiDuration:I

    iget v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->memojiDuration:I

    if-ne v1, v3, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->newToast:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->newToast:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    .line 140
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    .line 141
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    .line 142
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    .line 143
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    .line 144
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    .line 145
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->matched:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->matched:Z

    if-ne v1, v3, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    .line 146
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->canShowNotification:Ljava/lang/Boolean;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->canShowNotification:Ljava/lang/Boolean;

    .line 147
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    .line 148
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    .line 149
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    .line 150
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    .line 151
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    .line 152
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    .line 153
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    .line 154
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    .line 155
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    .line 156
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    .line 157
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    .line 158
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    iget-object v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    .line 159
    invoke-static {v1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgSingleUpdateIgnoreConvStatus:Z

    iget-boolean v3, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgSingleUpdateIgnoreConvStatus:Z

    if-ne v1, v3, :cond_2

    iget-object p0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    iget-object p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    .line 160
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "pushmessagecustom"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 10

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    if-nez v0, :cond_aa

    .line 2
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->expire:D

    invoke-static {v1, v2}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v1

    mul-int/lit8 v0, v0, 0x29

    const/16 v3, 0x20

    ushr-long v4, v1, v3

    xor-long/2addr v1, v4

    long-to-int v1, v1

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 3
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fullScreen:Z

    const/16 v2, 0x4d5

    const/16 v4, 0x4cf

    if-eqz v1, :cond_0

    move v1, v4

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->action:Ljava/lang/String;

    const/4 v5, 0x0

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_1

    :cond_1
    move v1, v5

    :goto_1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->url:Ljava/lang/String;

    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_2

    :cond_2
    move v1, v5

    :goto_2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gender:Ljava/lang/String;

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_3

    :cond_3
    move v1, v5

    :goto_3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    if-eqz v1, :cond_4

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_4

    :cond_4
    move v1, v5

    :goto_4
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->big_pic_url:Ljava/lang/String;

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_5

    :cond_5
    move v1, v5

    :goto_5
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    if-eqz v1, :cond_6

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_6

    :cond_6
    move v1, v5

    :goto_6
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    if-eqz v1, :cond_7

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_7

    :cond_7
    move v1, v5

    :goto_7
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    if-eqz v1, :cond_8

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_8

    :cond_8
    move v1, v5

    :goto_8
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    if-eqz v1, :cond_9

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_9

    :cond_9
    move v1, v5

    :goto_9
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    if-eqz v1, :cond_a

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_a

    :cond_a
    move v1, v5

    :goto_a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveId:Ljava/lang/String;

    if-eqz v1, :cond_b

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_b

    :cond_b
    move v1, v5

    :goto_b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 15
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->roomId:Ljava/lang/String;

    if-eqz v1, :cond_c

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_c

    :cond_c
    move v1, v5

    :goto_c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    if-eqz v1, :cond_d

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_d

    :cond_d
    move v1, v5

    :goto_d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tabId:Ljava/lang/String;

    if-eqz v1, :cond_e

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_e

    :cond_e
    move v1, v5

    :goto_e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extTabId:Ljava/lang/String;

    if-eqz v1, :cond_f

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_f

    :cond_f
    move v1, v5

    :goto_f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->taskId:Ljava/lang/String;

    if-eqz v1, :cond_10

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_10

    :cond_10
    move v1, v5

    :goto_10
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->dates:Ljava/lang/String;

    if-eqz v1, :cond_11

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_11

    :cond_11
    move v1, v5

    :goto_11
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->recommendText:Ljava/lang/String;

    if-eqz v1, :cond_12

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_12

    :cond_12
    move v1, v5

    :goto_12
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buttonText:Ljava/lang/String;

    if-eqz v1, :cond_13

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_13

    :cond_13
    move v1, v5

    :goto_13
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 23
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryToken:Ljava/lang/String;

    if-eqz v1, :cond_14

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_14

    :cond_14
    move v1, v5

    :goto_14
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserID:Ljava/lang/String;

    if-eqz v1, :cond_15

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_15

    :cond_15
    move v1, v5

    :goto_15
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 25
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->eventName:Ljava/lang/String;

    if-eqz v1, :cond_16

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_16

    :cond_16
    move v1, v5

    :goto_16
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userMatched:Z

    if-eqz v1, :cond_17

    move v1, v4

    goto :goto_17

    :cond_17
    move v1, v2

    :goto_17
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 27
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcToken:Ljava/lang/String;

    if-eqz v1, :cond_18

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_18

    :cond_18
    move v1, v5

    :goto_18
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannel:Ljava/lang/String;

    if-eqz v1, :cond_19

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_19

    :cond_19
    move v1, v5

    :goto_19
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 29
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcChannelWaitingTime:J

    ushr-long v8, v6, v3

    xor-long/2addr v6, v8

    long-to-int v1, v6

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->quickchatType:Ljava/lang/String;

    if-eqz v1, :cond_1a

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_1a

    :cond_1a
    move v1, v5

    :goto_1a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->queryOtherUserToken:Ljava/lang/String;

    if-eqz v1, :cond_1b

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_1b

    :cond_1b
    move v1, v5

    :goto_1b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pullStreamUrl:Ljava/lang/String;

    if-eqz v1, :cond_1c

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_1c

    :cond_1c
    move v1, v5

    :goto_1c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 33
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->provider:Ljava/lang/String;

    if-eqz v1, :cond_1d

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_1d

    :cond_1d
    move v1, v5

    :goto_1d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->businessType:Ljava/lang/String;

    if-eqz v1, :cond_1e

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_1e

    :cond_1e
    move v1, v5

    :goto_1e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callback:Ljava/lang/String;

    if-eqz v1, :cond_1f

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_1f

    :cond_1f
    move v1, v5

    :goto_1f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->source:Ljava/lang/String;

    if-eqz v1, :cond_20

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_20

    :cond_20
    move v1, v5

    :goto_20
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subSource:Ljava/lang/String;

    if-eqz v1, :cond_21

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_21

    :cond_21
    move v1, v5

    :goto_21
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->id:Ljava/lang/String;

    if-eqz v1, :cond_22

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_22

    :cond_22
    move v1, v5

    :goto_22
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 39
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    if-eqz v1, :cond_23

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_23

    :cond_23
    move v1, v5

    :goto_23
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 40
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callee:Ljava/lang/String;

    if-eqz v1, :cond_24

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_24

    :cond_24
    move v1, v5

    :goto_24
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerDeviceId:Ljava/lang/String;

    if-eqz v1, :cond_25

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_25

    :cond_25
    move v1, v5

    :goto_25
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    if-eqz v1, :cond_26

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_26

    :cond_26
    move v1, v5

    :goto_26
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 43
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->voiceStatus:Ljava/lang/String;

    if-eqz v1, :cond_27

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_27

    :cond_27
    move v1, v5

    :goto_27
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelName:Ljava/lang/String;

    if-eqz v1, :cond_28

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_28

    :cond_28
    move v1, v5

    :goto_28
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerToken:Ljava/lang/String;

    if-eqz v1, :cond_29

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_29

    :cond_29
    move v1, v5

    :goto_29
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 46
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeToken:Ljava/lang/String;

    if-eqz v1, :cond_2a

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_2a

    :cond_2a
    move v1, v5

    :goto_2a
    add-int/2addr v0, v1

    .line 47
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->createdTime:D

    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    move-result-wide v6

    mul-int/lit8 v0, v0, 0x29

    ushr-long v8, v6, v3

    xor-long/2addr v6, v8

    long-to-int v1, v6

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 48
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->canUserStartLive:Ljava/lang/Boolean;

    if-eqz v1, :cond_2b

    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    move-result v1

    goto :goto_2b

    :cond_2b
    move v1, v5

    :goto_2b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 49
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->inflow:J

    ushr-long v8, v6, v3

    xor-long/2addr v6, v8

    long-to-int v1, v6

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->origin:Ljava/lang/String;

    if-eqz v1, :cond_2c

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_2c

    :cond_2c
    move v1, v5

    :goto_2c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->itemId:Ljava/lang/String;

    if-eqz v1, :cond_2d

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_2d

    :cond_2d
    move v1, v5

    :goto_2d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 52
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->orderId:Ljava/lang/String;

    if-eqz v1, :cond_2e

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_2e

    :cond_2e
    move v1, v5

    :goto_2e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->privileges:Ljava/lang/String;

    if-eqz v1, :cond_2f

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_2f

    :cond_2f
    move v1, v5

    :goto_2f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->matchTopic:Ljava/lang/String;

    if-eqz v1, :cond_30

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_30

    :cond_30
    move v1, v5

    :goto_30
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userId:Ljava/lang/String;

    if-eqz v1, :cond_31

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_31

    :cond_31
    move v1, v5

    :goto_31
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 56
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->readUntilId:Ljava/lang/String;

    if-eqz v1, :cond_32

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_32

    :cond_32
    move v1, v5

    :goto_32
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->letter:Ljava/lang/String;

    if-eqz v1, :cond_33

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_33

    :cond_33
    move v1, v5

    :goto_33
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->openingRemark:Ljava/lang/String;

    if-eqz v1, :cond_34

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_34

    :cond_34
    move v1, v5

    :goto_34
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->poolID:Ljava/lang/String;

    if-eqz v1, :cond_35

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_35

    :cond_35
    move v1, v5

    :goto_35
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 60
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->birthday:J

    ushr-long v8, v6, v3

    xor-long/2addr v6, v8

    long-to-int v1, v6

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->productType:Ljava/lang/String;

    if-eqz v1, :cond_36

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_36

    :cond_36
    move v1, v5

    :goto_36
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 62
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->category:Ljava/lang/String;

    if-eqz v1, :cond_37

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_37

    :cond_37
    move v1, v5

    :goto_37
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 63
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->currencySymbol:Ljava/lang/String;

    if-eqz v1, :cond_38

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_38

    :cond_38
    move v1, v5

    :goto_38
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->price:Ljava/lang/String;

    if-eqz v1, :cond_39

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_39

    :cond_39
    move v1, v5

    :goto_39
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ext:Ljava/lang/String;

    if-eqz v1, :cond_3a

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_3a

    :cond_3a
    move v1, v5

    :goto_3a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 66
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->duration:J

    ushr-long v8, v6, v3

    xor-long/2addr v6, v8

    long-to-int v1, v6

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 67
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedCount:Ljava/lang/String;

    if-eqz v1, :cond_3b

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_3b

    :cond_3b
    move v1, v5

    :goto_3b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->likedPopuserCount:Ljava/lang/String;

    if-eqz v1, :cond_3c

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_3c

    :cond_3c
    move v1, v5

    :goto_3c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->popChange:Ljava/lang/String;

    if-eqz v1, :cond_3d

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_3d

    :cond_3d
    move v1, v5

    :goto_3d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 70
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->userName:Ljava/lang/String;

    if-eqz v1, :cond_3e

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_3e

    :cond_3e
    move v1, v5

    :goto_3e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 71
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->title:Ljava/lang/String;

    if-eqz v1, :cond_3f

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_3f

    :cond_3f
    move v1, v5

    :goto_3f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->content:Ljava/lang/String;

    if-eqz v1, :cond_40

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_40

    :cond_40
    move v1, v5

    :goto_40
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->image:Ljava/lang/String;

    if-eqz v1, :cond_41

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_41

    :cond_41
    move v1, v5

    :goto_41
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 74
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponId:Ljava/lang/String;

    if-eqz v1, :cond_42

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_42

    :cond_42
    move v1, v5

    :goto_42
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 75
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->couponDesc:Ljava/lang/String;

    if-eqz v1, :cond_43

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_43

    :cond_43
    move v1, v5

    :goto_43
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 76
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->merchandiseId:Ljava/lang/String;

    if-eqz v1, :cond_44

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_44

    :cond_44
    move v1, v5

    :goto_44
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->platform:Ljava/lang/String;

    if-eqz v1, :cond_45

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_45

    :cond_45
    move v1, v5

    :goto_45
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->contractId:Ljava/lang/String;

    if-eqz v1, :cond_46

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_46

    :cond_46
    move v1, v5

    :goto_46
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 79
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->broadcastID:Ljava/lang/String;

    if-eqz v1, :cond_47

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_47

    :cond_47
    move v1, v5

    :goto_47
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 80
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->partyId:Ljava/lang/String;

    if-eqz v1, :cond_48

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_48

    :cond_48
    move v1, v5

    :goto_48
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 81
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->score:Ljava/lang/String;

    if-eqz v1, :cond_49

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_49

    :cond_49
    move v1, v5

    :goto_49
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->link:Ljava/lang/String;

    if-eqz v1, :cond_4a

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_4a

    :cond_4a
    move v1, v5

    :goto_4a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 83
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extra:Ljava/lang/String;

    if-eqz v1, :cond_4b

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_4b

    :cond_4b
    move v1, v5

    :goto_4b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 84
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->traceId:Ljava/lang/String;

    if-eqz v1, :cond_4c

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_4c

    :cond_4c
    move v1, v5

    :goto_4c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherID:Ljava/lang/String;

    if-eqz v1, :cond_4d

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_4d

    :cond_4d
    move v1, v5

    :goto_4d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 86
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->messageID:Ljava/lang/String;

    if-eqz v1, :cond_4e

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_4e

    :cond_4e
    move v1, v5

    :goto_4e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 87
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->isGreet:Z

    if-eqz v1, :cond_4f

    move v1, v4

    goto :goto_4f

    :cond_4f
    move v1, v2

    :goto_4f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 88
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tracker:Ljava/lang/String;

    if-eqz v1, :cond_50

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_50

    :cond_50
    move v1, v5

    :goto_50
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 89
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellShowStayTime:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 90
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellNotShowStayTime:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->voicePartnerFinderId:Ljava/lang/String;

    if-eqz v1, :cond_51

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_51

    :cond_51
    move v1, v5

    :goto_51
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 92
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatar:Ljava/lang/String;

    if-eqz v1, :cond_52

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_52

    :cond_52
    move v1, v5

    :goto_52
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 93
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->city:Ljava/lang/String;

    if-eqz v1, :cond_53

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_53

    :cond_53
    move v1, v5

    :goto_53
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 94
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->distance:J

    ushr-long v8, v6, v3

    xor-long/2addr v6, v8

    long-to-int v1, v6

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiac:Ljava/lang/String;

    if-eqz v1, :cond_54

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_54

    :cond_54
    move v1, v5

    :goto_54
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 96
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->countDownSeconds:J

    ushr-long v8, v6, v3

    xor-long/2addr v6, v8

    long-to-int v1, v6

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 97
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->topicId:Ljava/lang/String;

    if-eqz v1, :cond_55

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_55

    :cond_55
    move v1, v5

    :goto_55
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 98
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->maskMode:Z

    if-eqz v1, :cond_56

    move v1, v4

    goto :goto_56

    :cond_56
    move v1, v2

    :goto_56
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->receiveUserID:Ljava/lang/String;

    if-eqz v1, :cond_57

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_57

    :cond_57
    move v1, v5

    :goto_57
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 100
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->radioType:Ljava/lang/String;

    if-eqz v1, :cond_58

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_58

    :cond_58
    move v1, v5

    :goto_58
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 101
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rsStateReceiverToSender:Lcom/p1/mobile/putong/data/RelationshipStatus;

    if-eqz v1, :cond_59

    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    move-result v1

    goto :goto_59

    :cond_59
    move v1, v5

    :goto_59
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 102
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mandatory:Z

    if-eqz v1, :cond_5a

    move v1, v4

    goto :goto_5a

    :cond_5a
    move v1, v2

    :goto_5a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    if-eqz v1, :cond_5b

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_5b

    :cond_5b
    move v1, v5

    :goto_5b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 104
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    if-eqz v1, :cond_5c

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_5c

    :cond_5c
    move v1, v5

    :goto_5c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 105
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    if-eqz v1, :cond_5d

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_5d

    :cond_5d
    move v1, v5

    :goto_5d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 106
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoPartnerFinderId:Ljava/lang/String;

    if-eqz v1, :cond_5e

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_5e

    :cond_5e
    move v1, v5

    :goto_5e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 107
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->startDate:Ljava/lang/String;

    if-eqz v1, :cond_5f

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_5f

    :cond_5f
    move v1, v5

    :goto_5f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 108
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->endDate:Ljava/lang/String;

    if-eqz v1, :cond_60

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_60

    :cond_60
    move v1, v5

    :goto_60
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->creationData:Ljava/lang/String;

    if-eqz v1, :cond_61

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_61

    :cond_61
    move v1, v5

    :goto_61
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->stateID:Ljava/lang/String;

    if-eqz v1, :cond_62

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_62

    :cond_62
    move v1, v5

    :goto_62
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 111
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->stage:Ljava/lang/String;

    if-eqz v1, :cond_63

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_63

    :cond_63
    move v1, v5

    :goto_63
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 112
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->biz:Ljava/lang/String;

    if-eqz v1, :cond_64

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_64

    :cond_64
    move v1, v5

    :goto_64
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->text:Ljava/lang/String;

    if-eqz v1, :cond_65

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_65

    :cond_65
    move v1, v5

    :goto_65
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 114
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserId:Ljava/lang/String;

    if-eqz v1, :cond_66

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_66

    :cond_66
    move v1, v5

    :goto_66
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 115
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->type:Ljava/lang/String;

    if-eqz v1, :cond_67

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_67

    :cond_67
    move v1, v5

    :goto_67
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 116
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->lastActiveTime:J

    ushr-long v8, v6, v3

    xor-long/2addr v6, v8

    long-to-int v1, v6

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUserName:Ljava/lang/String;

    if-eqz v1, :cond_68

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_68

    :cond_68
    move v1, v5

    :goto_68
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    if-eqz v1, :cond_69

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_69

    :cond_69
    move v1, v5

    :goto_69
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 119
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    if-eqz v1, :cond_6a

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_6a

    :cond_6a
    move v1, v5

    :goto_6a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 120
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    if-eqz v1, :cond_6b

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_6b

    :cond_6b
    move v1, v5

    :goto_6b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    if-eqz v1, :cond_6c

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_6c

    :cond_6c
    move v1, v5

    :goto_6c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    if-eqz v1, :cond_6d

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_6d

    :cond_6d
    move v1, v5

    :goto_6d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 123
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    if-eqz v1, :cond_6e

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_6e

    :cond_6e
    move v1, v5

    :goto_6e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    if-eqz v1, :cond_6f

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_6f

    :cond_6f
    move v1, v5

    :goto_6f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    if-eqz v1, :cond_70

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_70

    :cond_70
    move v1, v5

    :goto_70
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    if-eqz v1, :cond_71

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_71

    :cond_71
    move v1, v5

    :goto_71
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 127
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->noRecommended:Z

    if-eqz v1, :cond_72

    move v1, v4

    goto :goto_72

    :cond_72
    move v1, v2

    :goto_72
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 128
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->isPassive:Z

    if-eqz v1, :cond_73

    move v1, v4

    goto :goto_73

    :cond_73
    move v1, v2

    :goto_73
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    if-eqz v1, :cond_74

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_74

    :cond_74
    move v1, v5

    :goto_74
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 130
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    if-eqz v1, :cond_75

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_75

    :cond_75
    move v1, v5

    :goto_75
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    if-eqz v1, :cond_76

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_76

    :cond_76
    move v1, v5

    :goto_76
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 132
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    if-eqz v1, :cond_77

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_77

    :cond_77
    move v1, v5

    :goto_77
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 133
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    if-eqz v1, :cond_78

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_78

    :cond_78
    move v1, v5

    :goto_78
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    if-eqz v1, :cond_79

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_79

    :cond_79
    move v1, v5

    :goto_79
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 135
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    if-eqz v1, :cond_7a

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_7a

    :cond_7a
    move v1, v5

    :goto_7a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 136
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    if-eqz v1, :cond_7b

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_7b

    :cond_7b
    move v1, v5

    :goto_7b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 137
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    if-eqz v1, :cond_7c

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_7c

    :cond_7c
    move v1, v5

    :goto_7c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    if-eqz v1, :cond_7d

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_7d

    :cond_7d
    move v1, v5

    :goto_7d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 139
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    if-eqz v1, :cond_7e

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_7e

    :cond_7e
    move v1, v5

    :goto_7e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 140
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    if-eqz v1, :cond_7f

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_7f

    :cond_7f
    move v1, v5

    :goto_7f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 141
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extraPrivileges:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 142
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->popupsDisplay:Z

    if-eqz v1, :cond_80

    move v1, v4

    goto :goto_80

    :cond_80
    move v1, v2

    :goto_80
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 143
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->initialDuration:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 144
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->prolongCount:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 145
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    if-eqz v1, :cond_81

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_81

    :cond_81
    move v1, v5

    :goto_81
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 146
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->vendor:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 147
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    if-eqz v1, :cond_82

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_82

    :cond_82
    move v1, v5

    :goto_82
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 148
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    if-eqz v1, :cond_83

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_83

    :cond_83
    move v1, v5

    :goto_83
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 149
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->totalDuration:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 150
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->frozenDuration:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    if-eqz v1, :cond_84

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_84

    :cond_84
    move v1, v5

    :goto_84
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 152
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionHeight:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 153
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->resolutionWidth:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 154
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    if-eqz v1, :cond_85

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_85

    :cond_85
    move v1, v5

    :goto_85
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    if-eqz v1, :cond_86

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_86

    :cond_86
    move v1, v5

    :goto_86
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 156
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->insidePool:Z

    if-eqz v1, :cond_87

    move v1, v4

    goto :goto_87

    :cond_87
    move v1, v2

    :goto_87
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 157
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    if-eqz v1, :cond_88

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_88

    :cond_88
    move v1, v5

    :goto_88
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 158
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    if-eqz v1, :cond_89

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_89

    :cond_89
    move v1, v5

    :goto_89
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 159
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    if-eqz v1, :cond_8a

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_8a

    :cond_8a
    move v1, v5

    :goto_8a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 160
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    if-eqz v1, :cond_8b

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_8b

    :cond_8b
    move v1, v5

    :goto_8b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 161
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    if-eqz v1, :cond_8c

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_8c

    :cond_8c
    move v1, v5

    :goto_8c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 162
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    if-eqz v1, :cond_8d

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_8d

    :cond_8d
    move v1, v5

    :goto_8d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 163
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->needReact:Z

    if-eqz v1, :cond_8e

    move v1, v4

    goto :goto_8e

    :cond_8e
    move v1, v2

    :goto_8e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 164
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    if-eqz v1, :cond_8f

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_8f

    :cond_8f
    move v1, v5

    :goto_8f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 165
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    if-eqz v1, :cond_90

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_90

    :cond_90
    move v1, v5

    :goto_90
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 166
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    if-eqz v1, :cond_91

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_91

    :cond_91
    move v1, v5

    :goto_91
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 167
    iget v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->memojiDuration:I

    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 168
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->newToast:Z

    if-eqz v1, :cond_92

    move v1, v4

    goto :goto_92

    :cond_92
    move v1, v2

    :goto_92
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 169
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    if-eqz v1, :cond_93

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_93

    :cond_93
    move v1, v5

    :goto_93
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 170
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    if-eqz v1, :cond_94

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_94

    :cond_94
    move v1, v5

    :goto_94
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 171
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    if-eqz v1, :cond_95

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_95

    :cond_95
    move v1, v5

    :goto_95
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 172
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    if-eqz v1, :cond_96

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_96

    :cond_96
    move v1, v5

    :goto_96
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 173
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    if-eqz v1, :cond_97

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_97

    :cond_97
    move v1, v5

    :goto_97
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 174
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    if-eqz v1, :cond_98

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_98

    :cond_98
    move v1, v5

    :goto_98
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 175
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->matched:Z

    if-eqz v1, :cond_99

    move v1, v4

    goto :goto_99

    :cond_99
    move v1, v2

    :goto_99
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 176
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    if-eqz v1, :cond_9a

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_9a

    :cond_9a
    move v1, v5

    :goto_9a
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 177
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->canShowNotification:Ljava/lang/Boolean;

    if-eqz v1, :cond_9b

    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    move-result v1

    goto :goto_9b

    :cond_9b
    move v1, v5

    :goto_9b
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 178
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    if-eqz v1, :cond_9c

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_9c

    :cond_9c
    move v1, v5

    :goto_9c
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 179
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    if-eqz v1, :cond_9d

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_9d

    :cond_9d
    move v1, v5

    :goto_9d
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 180
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    if-eqz v1, :cond_9e

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_9e

    :cond_9e
    move v1, v5

    :goto_9e
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 181
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    if-eqz v1, :cond_9f

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_9f

    :cond_9f
    move v1, v5

    :goto_9f
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 182
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    if-eqz v1, :cond_a0

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_a0

    :cond_a0
    move v1, v5

    :goto_a0
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 183
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    if-eqz v1, :cond_a1

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_a1

    :cond_a1
    move v1, v5

    :goto_a1
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 184
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    if-eqz v1, :cond_a2

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_a2

    :cond_a2
    move v1, v5

    :goto_a2
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 185
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    if-eqz v1, :cond_a3

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_a3

    :cond_a3
    move v1, v5

    :goto_a3
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 186
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    if-eqz v1, :cond_a4

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_a4

    :cond_a4
    move v1, v5

    :goto_a4
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 187
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    if-eqz v1, :cond_a5

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_a5

    :cond_a5
    move v1, v5

    :goto_a5
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 188
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    if-eqz v1, :cond_a6

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_a6

    :cond_a6
    move v1, v5

    :goto_a6
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 189
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    if-eqz v1, :cond_a7

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    goto :goto_a7

    :cond_a7
    move v1, v5

    :goto_a7
    add-int/2addr v0, v1

    mul-int/lit8 v0, v0, 0x29

    .line 190
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgSingleUpdateIgnoreConvStatus:Z

    if-eqz v1, :cond_a8

    move v2, v4

    :cond_a8
    add-int/2addr v0, v2

    mul-int/lit8 v0, v0, 0x29

    .line 191
    iget-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    if-eqz v1, :cond_a9

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v5

    :cond_a9
    add-int/2addr v0, v5

    .line 192
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    :cond_aa
    return v0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, ""

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->giftId:Ljava/lang/String;

    .line 8
    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->age:Ljava/lang/String;

    .line 14
    .line 15
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    .line 16
    .line 17
    if-nez v0, :cond_2

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->name:Ljava/lang/String;

    .line 20
    .line 21
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    .line 22
    .line 23
    if-nez v0, :cond_3

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag1:Ljava/lang/String;

    .line 26
    .line 27
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    .line 28
    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag2:Ljava/lang/String;

    .line 32
    .line 33
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    .line 34
    .line 35
    if-nez v0, :cond_5

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tag3:Ljava/lang/String;

    .line 38
    .line 39
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    .line 40
    .line 41
    if-nez v0, :cond_6

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->nickname:Ljava/lang/String;

    .line 44
    .line 45
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    .line 46
    .line 47
    if-nez v0, :cond_7

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    .line 50
    .line 51
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    .line 52
    .line 53
    if-nez v0, :cond_8

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->greetID:Ljava/lang/String;

    .line 56
    .line 57
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    .line 58
    .line 59
    if-nez v0, :cond_9

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->groupId:Ljava/lang/String;

    .line 62
    .line 63
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    .line 64
    .line 65
    if-nez v0, :cond_a

    .line 66
    .line 67
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatarState:Ljava/lang/String;

    .line 68
    .line 69
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 70
    .line 71
    if-nez v0, :cond_b

    .line 72
    .line 73
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->subTitle:Ljava/lang/String;

    .line 74
    .line 75
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 76
    .line 77
    if-nez v0, :cond_c

    .line 78
    .line 79
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->state:Ljava/lang/String;

    .line 80
    .line 81
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    .line 82
    .line 83
    if-nez v0, :cond_d

    .line 84
    .line 85
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->conversationId:Ljava/lang/String;

    .line 86
    .line 87
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    .line 88
    .line 89
    if-nez v0, :cond_e

    .line 90
    .line 91
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveTitle:Ljava/lang/String;

    .line 92
    .line 93
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    .line 94
    .line 95
    if-nez v0, :cond_f

    .line 96
    .line 97
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorId:Ljava/lang/String;

    .line 98
    .line 99
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    .line 100
    .line 101
    if-nez v0, :cond_10

    .line 102
    .line 103
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->msgId:Ljava/lang/String;

    .line 104
    .line 105
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    .line 106
    .line 107
    if-nez v0, :cond_11

    .line 108
    .line 109
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->schema:Ljava/lang/String;

    .line 110
    .line 111
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 112
    .line 113
    if-nez v0, :cond_12

    .line 114
    .line 115
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->triggeredUserId:Ljava/lang/String;

    .line 116
    .line 117
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    .line 118
    .line 119
    if-nez v0, :cond_13

    .line 120
    .line 121
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSInsert:Ljava/lang/String;

    .line 122
    .line 123
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    .line 124
    .line 125
    if-nez v0, :cond_14

    .line 126
    .line 127
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSToast:Ljava/lang/String;

    .line 128
    .line 129
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    .line 130
    .line 131
    if-nez v0, :cond_15

    .line 132
    .line 133
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSPage:Ljava/lang/String;

    .line 134
    .line 135
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    .line 136
    .line 137
    if-nez v0, :cond_16

    .line 138
    .line 139
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSBusiness:Ljava/lang/String;

    .line 140
    .line 141
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    .line 142
    .line 143
    if-nez v0, :cond_17

    .line 144
    .line 145
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSIds:Ljava/lang/String;

    .line 146
    .line 147
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    .line 148
    .line 149
    if-nez v0, :cond_18

    .line 150
    .line 151
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSVerify:Ljava/lang/String;

    .line 152
    .line 153
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    .line 154
    .line 155
    if-nez v0, :cond_19

    .line 156
    .line 157
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->USSOption:Ljava/lang/String;

    .line 158
    .line 159
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 160
    .line 161
    if-nez v0, :cond_1a

    .line 162
    .line 163
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->testGroupName:Ljava/lang/String;

    .line 164
    .line 165
    :cond_1a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    .line 166
    .line 167
    if-nez v0, :cond_1b

    .line 168
    .line 169
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->avatars:Ljava/lang/String;

    .line 170
    .line 171
    :cond_1b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 172
    .line 173
    if-nez v0, :cond_1c

    .line 174
    .line 175
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->liveMode:Ljava/lang/String;

    .line 176
    .line 177
    :cond_1c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    .line 178
    .line 179
    if-nez v0, :cond_1d

    .line 180
    .line 181
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channel:Ljava/lang/String;

    .line 182
    .line 183
    :cond_1d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    .line 184
    .line 185
    if-nez v0, :cond_1e

    .line 186
    .line 187
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->buzzToken:Ljava/lang/String;

    .line 188
    .line 189
    :cond_1e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    .line 190
    .line 191
    if-nez v0, :cond_1f

    .line 192
    .line 193
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->appId:Ljava/lang/String;

    .line 194
    .line 195
    :cond_1f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    .line 196
    .line 197
    if-nez v0, :cond_20

    .line 198
    .line 199
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelToken:Ljava/lang/String;

    .line 200
    .line 201
    :cond_20
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    .line 202
    .line 203
    if-nez v0, :cond_21

    .line 204
    .line 205
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelKey:Ljava/lang/String;

    .line 206
    .line 207
    :cond_21
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    .line 208
    .line 209
    if-nez v0, :cond_22

    .line 210
    .line 211
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bellType:Ljava/lang/String;

    .line 212
    .line 213
    :cond_22
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    .line 214
    .line 215
    if-nez v0, :cond_23

    .line 216
    .line 217
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->cell:Ljava/lang/String;

    .line 218
    .line 219
    :cond_23
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    .line 220
    .line 221
    if-nez v0, :cond_24

    .line 222
    .line 223
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->questionIdSelected:Ljava/lang/String;

    .line 224
    .line 225
    :cond_24
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    .line 226
    .line 227
    if-nez v0, :cond_25

    .line 228
    .line 229
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->mode:Ljava/lang/String;

    .line 230
    .line 231
    :cond_25
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    .line 232
    .line 233
    if-nez v0, :cond_26

    .line 234
    .line 235
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->gid:Ljava/lang/String;

    .line 236
    .line 237
    :cond_26
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    .line 238
    .line 239
    if-nez v0, :cond_27

    .line 240
    .line 241
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->intent:Ljava/lang/String;

    .line 242
    .line 243
    :cond_27
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    .line 244
    .line 245
    if-nez v0, :cond_28

    .line 246
    .line 247
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->ruleKey:Ljava/lang/String;

    .line 248
    .line 249
    :cond_28
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    .line 250
    .line 251
    if-nez v0, :cond_29

    .line 252
    .line 253
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->selectedQuestion:Ljava/lang/String;

    .line 254
    .line 255
    :cond_29
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    .line 256
    .line 257
    if-nez v0, :cond_2a

    .line 258
    .line 259
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->timestamp:Ljava/lang/String;

    .line 260
    .line 261
    :cond_2a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    .line 262
    .line 263
    if-nez v0, :cond_2b

    .line 264
    .line 265
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->reaction:Ljava/lang/String;

    .line 266
    .line 267
    :cond_2b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    .line 268
    .line 269
    if-nez v0, :cond_2c

    .line 270
    .line 271
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->alertId:Ljava/lang/String;

    .line 272
    .line 273
    :cond_2c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    .line 274
    .line 275
    if-nez v0, :cond_2d

    .line 276
    .line 277
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->otherUsers:Ljava/lang/String;

    .line 278
    .line 279
    :cond_2d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    .line 280
    .line 281
    if-nez v0, :cond_2e

    .line 282
    .line 283
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->bgImg:Ljava/lang/String;

    .line 284
    .line 285
    :cond_2e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    .line 286
    .line 287
    if-nez v0, :cond_2f

    .line 288
    .line 289
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->pushChannel:Ljava/lang/String;

    .line 290
    .line 291
    :cond_2f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    .line 292
    .line 293
    if-nez v0, :cond_30

    .line 294
    .line 295
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->extremePickShowId:Ljava/lang/String;

    .line 296
    .line 297
    :cond_30
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    .line 298
    .line 299
    if-nez v0, :cond_31

    .line 300
    .line 301
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->added:Ljava/lang/String;

    .line 302
    .line 303
    :cond_31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    .line 304
    .line 305
    if-nez v0, :cond_32

    .line 306
    .line 307
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->unread:Ljava/lang/String;

    .line 308
    .line 309
    :cond_32
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    .line 310
    .line 311
    if-nez v0, :cond_33

    .line 312
    .line 313
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->total:Ljava/lang/String;

    .line 314
    .line 315
    :cond_33
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    .line 316
    .line 317
    if-nez v0, :cond_34

    .line 318
    .line 319
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->honorGiftCardDetail:Ljava/lang/String;

    .line 320
    .line 321
    :cond_34
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    .line 322
    .line 323
    if-nez v0, :cond_35

    .line 324
    .line 325
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationCategory:Ljava/lang/String;

    .line 326
    .line 327
    :cond_35
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    .line 328
    .line 329
    if-nez v0, :cond_36

    .line 330
    .line 331
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->localNotificationImportance:Ljava/lang/String;

    .line 332
    .line 333
    :cond_36
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    .line 334
    .line 335
    if-nez v0, :cond_37

    .line 336
    .line 337
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->anchorCallId:Ljava/lang/String;

    .line 338
    .line 339
    :cond_37
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    .line 340
    .line 341
    if-nez v0, :cond_38

    .line 342
    .line 343
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->channelNameV2:Ljava/lang/String;

    .line 344
    .line 345
    :cond_38
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    .line 346
    .line 347
    if-nez v0, :cond_39

    .line 348
    .line 349
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->callerTokenV2:Ljava/lang/String;

    .line 350
    .line 351
    :cond_39
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    .line 352
    .line 353
    if-nez v0, :cond_3a

    .line 354
    .line 355
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeTokenV2:Ljava/lang/String;

    .line 356
    .line 357
    :cond_3a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    .line 358
    .line 359
    if-nez v0, :cond_3b

    .line 360
    .line 361
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->rtcProvider:Ljava/lang/String;

    .line 362
    .line 363
    :cond_3b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    .line 364
    .line 365
    if-nez v0, :cond_3c

    .line 366
    .line 367
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->videoChatId:Ljava/lang/String;

    .line 368
    .line 369
    :cond_3c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    .line 370
    .line 371
    if-nez v0, :cond_3d

    .line 372
    .line 373
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->fitReason:Ljava/lang/String;

    .line 374
    .line 375
    :cond_3d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    .line 376
    .line 377
    if-nez v0, :cond_3e

    .line 378
    .line 379
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->friendPurpose:Ljava/lang/String;

    .line 380
    .line 381
    :cond_3e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    .line 382
    .line 383
    if-nez v0, :cond_3f

    .line 384
    .line 385
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->zodiacFitPercent:Ljava/lang/String;

    .line 386
    .line 387
    :cond_3f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    .line 388
    .line 389
    if-nez v0, :cond_40

    .line 390
    .line 391
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->tagID:Ljava/lang/String;

    .line 392
    .line 393
    :cond_40
    iget-object v0, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    .line 394
    .line 395
    if-nez v0, :cond_41

    .line 396
    .line 397
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PushMessageCustom;->emoji:Ljava/lang/String;

    .line 398
    .line 399
    :cond_41
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/PushMessageCustom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
