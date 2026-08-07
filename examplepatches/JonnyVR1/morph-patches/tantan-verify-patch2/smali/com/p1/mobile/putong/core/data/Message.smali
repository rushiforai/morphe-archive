.class public Lcom/p1/mobile/putong/core/data/Message;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/DbObject<",
        "Lcom/p1/mobile/putong/core/data/Message;",
        ">;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static final ADDITIONALDATA:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/MessageAdditionalData;",
            ">;"
        }
    .end annotation
.end field

.field public static final ANSWEROFMESSAGE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final API_ONLY_ACCESSORY:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/MessageAccessory;",
            ">;"
        }
    .end annotation
.end field

.field public static final CALL:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/CallRecord;",
            ">;"
        }
    .end annotation
.end field

.field public static final CHANNEL:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/MessageChannel;",
            ">;"
        }
    .end annotation
.end field

.field public static final CHATTYPING:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final CID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static DB_ADAPTER:Ll/vzf0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final EXTDATA:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/MessageExtData;",
            ">;"
        }
    .end annotation
.end field

.field public static final FROMCONVTYPE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final GIFTRECORDS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GiftRecord;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final HEARTBEAT_ICEBREAK:Ljava/lang/String; = "heartbeat_icbreak"

.field public static final HEARTBEAT_WAITING_RESPONSE:Ljava/lang/String; = "heartbeat_waiting_response"

.field public static final HOSTID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final INCTEMPINFO:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LETTER:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/Letter;",
            ">;"
        }
    .end annotation
.end field

.field public static final LIKEOFMOMENT:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALANIMATIONKEY:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALAUDIOTEXT:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/AudioText;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALCALLHANDLEDSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/CallHandledStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALCALLSTATUS:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALCALLTYPE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALCREATEDSESSION:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALCREATEDTIME:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALEXTRAINFO:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALFAILTYPE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALGREETINGID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALINMOMENT:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALMYVISITORCOUNT:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALMYVISITORHIDDEN:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/NotificationStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALPRIVATEQUESTIONS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PrivateQuestion;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final LOCALREDPACKETTYPE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALSAFETYREMINDER:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALSENSITIVEWORDREMINDER:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCATION:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/data/MessageLocation;",
            ">;"
        }
    .end annotation
.end field

.field public static final MEDIA:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/MessageType;",
            ">;"
        }
    .end annotation
.end field

.field public static final MOMENT:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final MSGDATA:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final MSGTYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/MessageType;",
            ">;"
        }
    .end annotation
.end field

.field public static final NEEDREAD:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final NOTIFIEDUSERS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final OWNER:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final QUESTION:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final READ:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final RECALLED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final RECALLEDHINT:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final RECALLEDREASON:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final REFERENCEMSGID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final RISKTAGS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final SENTFROM:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/MessageSentFrom;",
            ">;"
        }
    .end annotation
.end field

.field public static final SETTINGS_ANONYMOUS:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/core/data/MessageStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static final STICKER:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final STR_LOCALBUSINESSTYPES:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LocalBusinessType;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "message"

.field public static final VALUE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/Message;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public action:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x54
    .end annotation
.end field

.field private aiChatMessageExtraInfo:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

.field public answerIdOfAnswer:Ljava/lang/String;

.field public answerOfMessage:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x46
    .end annotation
.end field

.field public api_only_otherUser:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public call:Lcom/p1/mobile/putong/core/data/CallRecord;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x48
    .end annotation
.end field

.field public channel:Lcom/p1/mobile/putong/core/data/MessageChannel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5a
    .end annotation
.end field

.field public chatTyping:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4e
    .end annotation
.end field

.field public cid:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public coinSign:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public consumeType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public createdTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public extData:Lcom/p1/mobile/putong/core/data/MessageExtData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x64
    .end annotation
.end field

.field public fromConvType:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x65
    .end annotation
.end field

.field public giftRecords:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x47
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GiftRecord;",
            ">;"
        }
    .end annotation
.end field

.field public hostId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5e
    .end annotation
.end field

.field public incTempInfo:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6f
    .end annotation
.end field

.field public isBottom:Z

.field public isFromKanKan:Z

.field public isNewComment:Z

.field public letter:Lcom/p1/mobile/putong/core/data/Letter;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4d
    .end annotation
.end field

.field public likeOfMoment:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x44
    .end annotation
.end field

.field public liked:Z

.field public likes:I

.field public localAnimationKey:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x45
    .end annotation
.end field

.field public localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x60
    .end annotation
.end field

.field public localBusinessTypes:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x58
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/LocalBusinessType;",
            ">;"
        }
    .end annotation
.end field

.field public localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4b
    .end annotation
.end field

.field public localCallStatus:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4a
    .end annotation
.end field

.field public localCallType:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x49
    .end annotation
.end field

.field public localCreatedSession:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public localCreatedTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public localExtraInfo:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x66
    .end annotation
.end field

.field public localFailType:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4f
    .end annotation
.end field

.field public localGreetingId:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x61
    .end annotation
.end field

.field public localInConversation:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public localInMoment:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public localMyVisitorCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x71
    .end annotation
.end field

.field public localMyVisitorHidden:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x72
    .end annotation
.end field

.field public localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x43
    .end annotation
.end field

.field public localPrivateQuestions:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/PrivateQuestion;",
            ">;"
        }
    .end annotation
.end field

.field public localRedPacketType:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5f
    .end annotation
.end field

.field public localSafetyReminder:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x55
    .end annotation
.end field

.field public localSensitiveWordReminder:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x56
    .end annotation
.end field

.field public location:Lcom/p1/mobile/putong/data/MessageLocation;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public media:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field public messageType:Lcom/p1/mobile/putong/core/data/MessageType;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x53
    .end annotation
.end field

.field public moment:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public momentShowFromType:Ljava/lang/String;

.field public moreSubComments:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public msgData:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x57
    .end annotation
.end field

.field private msgDataOld:Ljava/lang/String;

.field public msgType:Lcom/p1/mobile/putong/core/data/MessageType;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x52
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public needRead:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x63
    .end annotation
.end field

.field public notifiedUsers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public owner:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public parentCommentId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private parseFieldSet:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public question:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public questionCategory:Lcom/p1/mobile/putong/core/data/QuestionCategory;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public read:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x62
    .end annotation
.end field

.field public recalled:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation
.end field

.field public recalledHint:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x51
    .end annotation
.end field

.field public recalledReason:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x50
    .end annotation
.end field

.field public referenceMsgId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5d
    .end annotation
.end field

.field public reminder:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private requestUrl:Ljava/lang/String;

.field public riskTags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x70
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public secondSend:Z

.field public sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public settings:Lcom/p1/mobile/putong/core/data/MessageSetting;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x59
    .end annotation
.end field

.field public status:Lcom/p1/mobile/putong/core/data/MessageStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5c
    .end annotation
.end field

.field public sticker:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public subCommentIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public tempProfileLikeSnapshot:Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

.field public value:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x42
    .end annotation
.end field

.field public viewHeight:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Message$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Message$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$3;

    .line 16
    .line 17
    const-string v1, "_id"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$3;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$4;

    .line 25
    .line 26
    const-string v1, "id_c"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$4;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$5;

    .line 34
    .line 35
    const-string v1, "localCreatedTime_c"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$5;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALCREATEDTIME:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$6;

    .line 43
    .line 44
    const-string v1, "localCreatedSession_c"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$6;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALCREATEDSESSION:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$7;

    .line 52
    .line 53
    const-string v1, "localInMoment_c"

    .line 54
    .line 55
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$7;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALINMOMENT:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 59
    .line 60
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$8;

    .line 61
    .line 62
    const-string v1, "localInConversation_c"

    .line 63
    .line 64
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$8;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALINCONVERSATION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 68
    .line 69
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$9;

    .line 70
    .line 71
    const-string v1, "createdTime_c"

    .line 72
    .line 73
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$9;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 77
    .line 78
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$10;

    .line 79
    .line 80
    const-string v1, "cid_c"

    .line 81
    .line 82
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$10;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 86
    .line 87
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$11;

    .line 88
    .line 89
    const-string v1, "media_c"

    .line 90
    .line 91
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$11;-><init>(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->MEDIA:Lcom/tantanapp/common/data/orm/Column;

    .line 95
    .line 96
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$12;

    .line 97
    .line 98
    const-string v1, "sticker_c"

    .line 99
    .line 100
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$12;-><init>(Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->STICKER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 104
    .line 105
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$13;

    .line 106
    .line 107
    const-string v1, "question_c"

    .line 108
    .line 109
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$13;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->QUESTION:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 113
    .line 114
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$14;

    .line 115
    .line 116
    const-string v1, "sentFrom_c"

    .line 117
    .line 118
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageSentFrom;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 119
    .line 120
    const-string v3, "str_sentFrom_c"

    .line 121
    .line 122
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/Message$14;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 123
    .line 124
    .line 125
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->SENTFROM:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 126
    .line 127
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$15;

    .line 128
    .line 129
    const-string v1, "moment_c"

    .line 130
    .line 131
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$15;-><init>(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->MOMENT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 135
    .line 136
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$16;

    .line 137
    .line 138
    const-string v1, "answerOfMessage_c"

    .line 139
    .line 140
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$16;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->ANSWEROFMESSAGE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 144
    .line 145
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$17;

    .line 146
    .line 147
    const-string v1, "owner_c"

    .line 148
    .line 149
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$17;-><init>(Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 153
    .line 154
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$18;

    .line 155
    .line 156
    const-string v1, "location_c"

    .line 157
    .line 158
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$18;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCATION:Lcom/tantanapp/common/data/orm/Column;

    .line 162
    .line 163
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$19;

    .line 164
    .line 165
    const-string v1, "recalled_c"

    .line 166
    .line 167
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$19;-><init>(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->RECALLED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 171
    .line 172
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$20;

    .line 173
    .line 174
    const-string v1, "value_c"

    .line 175
    .line 176
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$20;-><init>(Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->VALUE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 180
    .line 181
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$21;

    .line 182
    .line 183
    const-string v1, "localNotificationStatus_c"

    .line 184
    .line 185
    sget-object v2, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 186
    .line 187
    const-string v3, "str_localNotificationStatus_c"

    .line 188
    .line 189
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/Message$21;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 190
    .line 191
    .line 192
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALNOTIFICATIONSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 193
    .line 194
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$22;

    .line 195
    .line 196
    const-string v1, "likeOfMoment_c"

    .line 197
    .line 198
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$22;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LIKEOFMOMENT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 202
    .line 203
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$23;

    .line 204
    .line 205
    const-string v1, "localAnimationKey_c"

    .line 206
    .line 207
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$23;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALANIMATIONKEY:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 211
    .line 212
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$24;

    .line 213
    .line 214
    const-string v1, "api_only_accessory_c"

    .line 215
    .line 216
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$24;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->API_ONLY_ACCESSORY:Lcom/tantanapp/common/data/orm/Column;

    .line 220
    .line 221
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$25;

    .line 222
    .line 223
    const-string v1, "giftRecords_c"

    .line 224
    .line 225
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$25;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->GIFTRECORDS:Lcom/tantanapp/common/data/orm/Column;

    .line 229
    .line 230
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$26;

    .line 231
    .line 232
    const-string v1, "call_c"

    .line 233
    .line 234
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$26;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->CALL:Lcom/tantanapp/common/data/orm/Column;

    .line 238
    .line 239
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$27;

    .line 240
    .line 241
    const-string v1, "localCallType_c"

    .line 242
    .line 243
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$27;-><init>(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALCALLTYPE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 247
    .line 248
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$28;

    .line 249
    .line 250
    const-string v1, "localCallStatus_c"

    .line 251
    .line 252
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$28;-><init>(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALCALLSTATUS:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 256
    .line 257
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$29;

    .line 258
    .line 259
    const-string v1, "localCallHandledStatus_c"

    .line 260
    .line 261
    sget-object v2, Lcom/p1/mobile/putong/core/data/CallHandledStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 262
    .line 263
    const-string v3, "str_localCallHandledStatus_c"

    .line 264
    .line 265
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/Message$29;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 266
    .line 267
    .line 268
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALCALLHANDLEDSTATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 269
    .line 270
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$30;

    .line 271
    .line 272
    const-string v1, "localPrivateQuestions_c"

    .line 273
    .line 274
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$30;-><init>(Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALPRIVATEQUESTIONS:Lcom/tantanapp/common/data/orm/Column;

    .line 278
    .line 279
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$31;

    .line 280
    .line 281
    const-string v1, "letter_c"

    .line 282
    .line 283
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$31;-><init>(Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LETTER:Lcom/tantanapp/common/data/orm/Column;

    .line 287
    .line 288
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$32;

    .line 289
    .line 290
    const-string v1, "chatTyping_c"

    .line 291
    .line 292
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$32;-><init>(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->CHATTYPING:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 296
    .line 297
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$33;

    .line 298
    .line 299
    const-string v1, "localFailType_c"

    .line 300
    .line 301
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$33;-><init>(Ljava/lang/String;)V

    .line 302
    .line 303
    .line 304
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALFAILTYPE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 305
    .line 306
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$34;

    .line 307
    .line 308
    const-string v1, "recalledReason_c"

    .line 309
    .line 310
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$34;-><init>(Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->RECALLEDREASON:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 314
    .line 315
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$35;

    .line 316
    .line 317
    const-string v1, "recalledHint_c"

    .line 318
    .line 319
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$35;-><init>(Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->RECALLEDHINT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 323
    .line 324
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$36;

    .line 325
    .line 326
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 327
    .line 328
    const-string v2, "str_msgType_c"

    .line 329
    .line 330
    const-string v3, "msgType_c"

    .line 331
    .line 332
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/data/Message$36;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 333
    .line 334
    .line 335
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->MSGTYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 336
    .line 337
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$37;

    .line 338
    .line 339
    const-string v2, "str_messageType_c"

    .line 340
    .line 341
    const-string v3, "messageType_c"

    .line 342
    .line 343
    invoke-direct {v0, v2, v3, v1}, Lcom/p1/mobile/putong/core/data/Message$37;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 344
    .line 345
    .line 346
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 347
    .line 348
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$38;

    .line 349
    .line 350
    const-string v1, "additionalData_c"

    .line 351
    .line 352
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$38;-><init>(Ljava/lang/String;)V

    .line 353
    .line 354
    .line 355
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->ADDITIONALDATA:Lcom/tantanapp/common/data/orm/Column;

    .line 356
    .line 357
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$39;

    .line 358
    .line 359
    const-string v1, "localSafetyReminder_c"

    .line 360
    .line 361
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$39;-><init>(Ljava/lang/String;)V

    .line 362
    .line 363
    .line 364
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALSAFETYREMINDER:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 365
    .line 366
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$40;

    .line 367
    .line 368
    const-string v1, "localSensitiveWordReminder_c"

    .line 369
    .line 370
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$40;-><init>(Ljava/lang/String;)V

    .line 371
    .line 372
    .line 373
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALSENSITIVEWORDREMINDER:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 374
    .line 375
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$41;

    .line 376
    .line 377
    const-string v1, "msgData_c"

    .line 378
    .line 379
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$41;-><init>(Ljava/lang/String;)V

    .line 380
    .line 381
    .line 382
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->MSGDATA:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 383
    .line 384
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$42;

    .line 385
    .line 386
    const-string v1, "settings_anonymous_c"

    .line 387
    .line 388
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$42;-><init>(Ljava/lang/String;)V

    .line 389
    .line 390
    .line 391
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->SETTINGS_ANONYMOUS:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 392
    .line 393
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$43;

    .line 394
    .line 395
    const-string v1, "channel_c"

    .line 396
    .line 397
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 398
    .line 399
    const-string v3, "str_channel_c"

    .line 400
    .line 401
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/Message$43;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 402
    .line 403
    .line 404
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->CHANNEL:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 405
    .line 406
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$44;

    .line 407
    .line 408
    const-string v1, "notifiedUsers_c"

    .line 409
    .line 410
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$44;-><init>(Ljava/lang/String;)V

    .line 411
    .line 412
    .line 413
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->NOTIFIEDUSERS:Lcom/tantanapp/common/data/orm/Column;

    .line 414
    .line 415
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$45;

    .line 416
    .line 417
    const-string v1, "status_c"

    .line 418
    .line 419
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 420
    .line 421
    const-string v3, "str_status_c"

    .line 422
    .line 423
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/Message$45;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 424
    .line 425
    .line 426
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 427
    .line 428
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$46;

    .line 429
    .line 430
    const-string v1, "referenceMsgId_c"

    .line 431
    .line 432
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$46;-><init>(Ljava/lang/String;)V

    .line 433
    .line 434
    .line 435
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->REFERENCEMSGID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 436
    .line 437
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$47;

    .line 438
    .line 439
    const-string v1, "hostId_c"

    .line 440
    .line 441
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$47;-><init>(Ljava/lang/String;)V

    .line 442
    .line 443
    .line 444
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->HOSTID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 445
    .line 446
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$48;

    .line 447
    .line 448
    const-string v1, "localRedPacketType_c"

    .line 449
    .line 450
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$48;-><init>(Ljava/lang/String;)V

    .line 451
    .line 452
    .line 453
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALREDPACKETTYPE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 454
    .line 455
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$49;

    .line 456
    .line 457
    const-string v1, "localAudioText_c"

    .line 458
    .line 459
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$49;-><init>(Ljava/lang/String;)V

    .line 460
    .line 461
    .line 462
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALAUDIOTEXT:Lcom/tantanapp/common/data/orm/Column;

    .line 463
    .line 464
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$50;

    .line 465
    .line 466
    const-string v1, "localGreetingId_c"

    .line 467
    .line 468
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$50;-><init>(Ljava/lang/String;)V

    .line 469
    .line 470
    .line 471
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALGREETINGID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 472
    .line 473
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$51;

    .line 474
    .line 475
    const-string v1, "read_c"

    .line 476
    .line 477
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$51;-><init>(Ljava/lang/String;)V

    .line 478
    .line 479
    .line 480
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->READ:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 481
    .line 482
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$52;

    .line 483
    .line 484
    const-string v1, "needRead_c"

    .line 485
    .line 486
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$52;-><init>(Ljava/lang/String;)V

    .line 487
    .line 488
    .line 489
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->NEEDREAD:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 490
    .line 491
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$53;

    .line 492
    .line 493
    const-string v1, "extData_c"

    .line 494
    .line 495
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$53;-><init>(Ljava/lang/String;)V

    .line 496
    .line 497
    .line 498
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->EXTDATA:Lcom/tantanapp/common/data/orm/Column;

    .line 499
    .line 500
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$54;

    .line 501
    .line 502
    const-string v1, "fromConvType_c"

    .line 503
    .line 504
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$54;-><init>(Ljava/lang/String;)V

    .line 505
    .line 506
    .line 507
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->FROMCONVTYPE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 508
    .line 509
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$55;

    .line 510
    .line 511
    const-string v1, "localExtraInfo_c"

    .line 512
    .line 513
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$55;-><init>(Ljava/lang/String;)V

    .line 514
    .line 515
    .line 516
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALEXTRAINFO:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 517
    .line 518
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$56;

    .line 519
    .line 520
    const-string v1, "str_localBusinessTypes_c"

    .line 521
    .line 522
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$56;-><init>(Ljava/lang/String;)V

    .line 523
    .line 524
    .line 525
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->STR_LOCALBUSINESSTYPES:Lcom/tantanapp/common/data/orm/Column;

    .line 526
    .line 527
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$57;

    .line 528
    .line 529
    const-string v1, "incTempInfo_c"

    .line 530
    .line 531
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$57;-><init>(Ljava/lang/String;)V

    .line 532
    .line 533
    .line 534
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->INCTEMPINFO:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 535
    .line 536
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$58;

    .line 537
    .line 538
    const-string v1, "riskTags_c"

    .line 539
    .line 540
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$58;-><init>(Ljava/lang/String;)V

    .line 541
    .line 542
    .line 543
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->RISKTAGS:Lcom/tantanapp/common/data/orm/Column;

    .line 544
    .line 545
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$59;

    .line 546
    .line 547
    const-string v1, "localMyVisitorCount_c"

    .line 548
    .line 549
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$59;-><init>(Ljava/lang/String;)V

    .line 550
    .line 551
    .line 552
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALMYVISITORCOUNT:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 553
    .line 554
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$60;

    .line 555
    .line 556
    const-string v1, "localMyVisitorHidden_c"

    .line 557
    .line 558
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/Message$60;-><init>(Ljava/lang/String;)V

    .line 559
    .line 560
    .line 561
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->LOCALMYVISITORHIDDEN:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 562
    .line 563
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message$61;

    .line 564
    .line 565
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Message$61;-><init>()V

    .line 566
    .line 567
    .line 568
    sput-object v0, Lcom/p1/mobile/putong/core/data/Message;->DB_ADAPTER:Ll/vzf0;

    .line 569
    .line 570
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/DbObject;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/core/data/Message;->viewHeight:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->tempProfileLikeSnapshot:Lcom/p1/mobile/putong/core/data/ProfileLikeSnapshot;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->aiChatMessageExtraInfo:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 11
    .line 12
    const-string v0, ""

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgDataOld:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v0, Ljava/util/HashSet;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->parseFieldSet:Ljava/util/HashSet;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/data/LocalBusinessType;)Lcom/p1/mobile/putong/core/data/LocalBusinessType;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->clone()Lcom/p1/mobile/putong/data/Media;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/data/PrivateQuestion;)Lcom/p1/mobile/putong/core/data/PrivateQuestion;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/PrivateQuestion;->clone()Lcom/p1/mobile/putong/core/data/PrivateQuestion;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/GiftRecord;)Lcom/p1/mobile/putong/core/data/GiftRecord;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GiftRecord;->clone()Lcom/p1/mobile/putong/core/data/GiftRecord;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic f(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic k(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/Message;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Message;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public audio()Lcom/p1/mobile/putong/data/Audio;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Audio;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/p1/mobile/putong/data/Audio;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public beforeApiSerialize()Lcom/p1/mobile/putong/core/data/Message;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->clone()Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->reverseParseComplete()V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public bridge synthetic beforeApiSerialize()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->beforeApiSerialize()Lcom/p1/mobile/putong/core/data/Message;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 441
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->clone()Lcom/p1/mobile/putong/core/data/Message;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/Message;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/Message;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-wide v1, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 7
    .line 8
    iput-wide v1, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 9
    .line 10
    iget-object v1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v1, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 13
    .line 14
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 15
    .line 16
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 17
    .line 18
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 19
    .line 20
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 21
    .line 22
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    .line 23
    .line 24
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    .line 25
    .line 26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 27
    .line 28
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 29
    .line 30
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 31
    .line 32
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 35
    .line 36
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 39
    .line 40
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 43
    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    new-instance v2, Ll/tsy;

    .line 47
    .line 48
    invoke-direct {v2}, Ll/tsy;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 56
    .line 57
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 60
    .line 61
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 62
    .line 63
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->questionCategory:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 66
    .line 67
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->questionCategory:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 68
    .line 69
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 70
    .line 71
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 72
    .line 73
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 74
    .line 75
    if-eqz v1, :cond_1

    .line 76
    .line 77
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageReference;->clone()Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 82
    .line 83
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 86
    .line 87
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 88
    .line 89
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 90
    .line 91
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 92
    .line 93
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 96
    .line 97
    if-eqz v1, :cond_2

    .line 98
    .line 99
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MessageLocation;->clone()Lcom/p1/mobile/putong/data/MessageLocation;

    .line 100
    .line 101
    .line 102
    move-result-object v1

    .line 103
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 104
    .line 105
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 106
    .line 107
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 108
    .line 109
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 110
    .line 111
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 112
    .line 113
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 114
    .line 115
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 116
    .line 117
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 118
    .line 119
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 120
    .line 121
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localAnimationKey:Ljava/lang/String;

    .line 122
    .line 123
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localAnimationKey:Ljava/lang/String;

    .line 124
    .line 125
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->reminder:Ljava/lang/String;

    .line 126
    .line 127
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->reminder:Ljava/lang/String;

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 130
    .line 131
    if-eqz v1, :cond_3

    .line 132
    .line 133
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageAccessory;->clone()Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 138
    .line 139
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->giftRecords:Ljava/util/List;

    .line 140
    .line 141
    if-eqz v1, :cond_4

    .line 142
    .line 143
    new-instance v2, Ll/usy;

    .line 144
    .line 145
    invoke-direct {v2}, Ll/usy;-><init>()V

    .line 146
    .line 147
    .line 148
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->giftRecords:Ljava/util/List;

    .line 153
    .line 154
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 155
    .line 156
    if-eqz v1, :cond_5

    .line 157
    .line 158
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CallRecord;->clone()Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 159
    .line 160
    .line 161
    move-result-object v1

    .line 162
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 163
    .line 164
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallType:Ljava/lang/String;

    .line 165
    .line 166
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCallType:Ljava/lang/String;

    .line 167
    .line 168
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallStatus:I

    .line 169
    .line 170
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCallStatus:I

    .line 171
    .line 172
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 173
    .line 174
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 175
    .line 176
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 177
    .line 178
    if-eqz v1, :cond_6

    .line 179
    .line 180
    new-instance v2, Ll/vsy;

    .line 181
    .line 182
    invoke-direct {v2}, Ll/vsy;-><init>()V

    .line 183
    .line 184
    .line 185
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 190
    .line 191
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 192
    .line 193
    if-eqz v1, :cond_7

    .line 194
    .line 195
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Letter;->clone()Lcom/p1/mobile/putong/core/data/Letter;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 200
    .line 201
    :cond_7
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->chatTyping:Z

    .line 202
    .line 203
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->chatTyping:Z

    .line 204
    .line 205
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 206
    .line 207
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localFailType:I

    .line 208
    .line 209
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 210
    .line 211
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 212
    .line 213
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 214
    .line 215
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 216
    .line 217
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 218
    .line 219
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 220
    .line 221
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 222
    .line 223
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 224
    .line 225
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 226
    .line 227
    if-eqz v1, :cond_8

    .line 228
    .line 229
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->clone()Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 234
    .line 235
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 236
    .line 237
    if-eqz v1, :cond_9

    .line 238
    .line 239
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CommentInfo;->clone()Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 244
    .line 245
    :cond_9
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Message;->likes:I

    .line 246
    .line 247
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Message;->likes:I

    .line 248
    .line 249
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->liked:Z

    .line 250
    .line 251
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->liked:Z

    .line 252
    .line 253
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 254
    .line 255
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 256
    .line 257
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 258
    .line 259
    if-eqz v1, :cond_a

    .line 260
    .line 261
    new-instance v2, Ll/wsy;

    .line 262
    .line 263
    invoke-direct {v2}, Ll/wsy;-><init>()V

    .line 264
    .line 265
    .line 266
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 271
    .line 272
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 273
    .line 274
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 275
    .line 276
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->isBottom:Z

    .line 277
    .line 278
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->isBottom:Z

    .line 279
    .line 280
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    .line 281
    .line 282
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    .line 283
    .line 284
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 285
    .line 286
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 287
    .line 288
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 289
    .line 290
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 291
    .line 292
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 293
    .line 294
    if-eqz v1, :cond_b

    .line 295
    .line 296
    new-instance v2, Ll/xsy;

    .line 297
    .line 298
    invoke-direct {v2}, Ll/xsy;-><init>()V

    .line 299
    .line 300
    .line 301
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 306
    .line 307
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 308
    .line 309
    if-eqz v1, :cond_c

    .line 310
    .line 311
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageSetting;->clone()Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 316
    .line 317
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 318
    .line 319
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 320
    .line 321
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 322
    .line 323
    if-eqz v1, :cond_d

    .line 324
    .line 325
    new-instance v2, Ll/ysy;

    .line 326
    .line 327
    invoke-direct {v2}, Ll/ysy;-><init>()V

    .line 328
    .line 329
    .line 330
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 331
    .line 332
    .line 333
    move-result-object v1

    .line 334
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 335
    .line 336
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 337
    .line 338
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 339
    .line 340
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 341
    .line 342
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 343
    .line 344
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 345
    .line 346
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 347
    .line 348
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 349
    .line 350
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 351
    .line 352
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->isNewComment:Z

    .line 353
    .line 354
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->isNewComment:Z

    .line 355
    .line 356
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 357
    .line 358
    if-eqz v1, :cond_e

    .line 359
    .line 360
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AudioText;->clone()Lcom/p1/mobile/putong/core/data/AudioText;

    .line 361
    .line 362
    .line 363
    move-result-object v1

    .line 364
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 365
    .line 366
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 367
    .line 368
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 369
    .line 370
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->read:Z

    .line 371
    .line 372
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->read:Z

    .line 373
    .line 374
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    .line 375
    .line 376
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    .line 377
    .line 378
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 379
    .line 380
    if-eqz v1, :cond_f

    .line 381
    .line 382
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageExtData;->clone()Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 383
    .line 384
    .line 385
    move-result-object v1

    .line 386
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 387
    .line 388
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    .line 389
    .line 390
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    .line 391
    .line 392
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 393
    .line 394
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 395
    .line 396
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->incTempInfo:Ljava/lang/String;

    .line 397
    .line 398
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->incTempInfo:Ljava/lang/String;

    .line 399
    .line 400
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 401
    .line 402
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 403
    .line 404
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 405
    .line 406
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 407
    .line 408
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 409
    .line 410
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 411
    .line 412
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 413
    .line 414
    if-eqz v1, :cond_10

    .line 415
    .line 416
    new-instance v2, Ll/zsy;

    .line 417
    .line 418
    invoke-direct {v2}, Ll/zsy;-><init>()V

    .line 419
    .line 420
    .line 421
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 422
    .line 423
    .line 424
    move-result-object v1

    .line 425
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 426
    .line 427
    :cond_10
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorCount:I

    .line 428
    .line 429
    iput v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorCount:I

    .line 430
    .line 431
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 432
    .line 433
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 434
    .line 435
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/Message;->secondSend:Z

    .line 436
    .line 437
    iput-boolean p0, v0, Lcom/p1/mobile/putong/core/data/Message;->secondSend:Z

    .line 438
    .line 439
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 440
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->clone()Lcom/p1/mobile/putong/core/data/Message;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/Message;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    return v2

    .line 11
    :cond_1
    move-object v1, p1

    .line 12
    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 13
    .line 14
    invoke-super {p0, p1}, Lcom/tantanapp/common/data/DbObject;->equals(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-nez p1, :cond_2

    .line 19
    .line 20
    return v2

    .line 21
    :cond_2
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    .line 22
    .line 23
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    .line 24
    .line 25
    if-ne p1, v3, :cond_3

    .line 26
    .line 27
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 28
    .line 29
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 30
    .line 31
    if-ne p1, v3, :cond_3

    .line 32
    .line 33
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 34
    .line 35
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 36
    .line 37
    cmpl-double p1, v3, v5

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 44
    .line 45
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    if-eqz p1, :cond_3

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 62
    .line 63
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 64
    .line 65
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_3

    .line 70
    .line 71
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 74
    .line 75
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_3

    .line 80
    .line 81
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 82
    .line 83
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 84
    .line 85
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-eqz p1, :cond_3

    .line 90
    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->questionCategory:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 92
    .line 93
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->questionCategory:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 94
    .line 95
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-eqz p1, :cond_3

    .line 100
    .line 101
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 102
    .line 103
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 104
    .line 105
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_3

    .line 110
    .line 111
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 112
    .line 113
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 114
    .line 115
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    if-eqz p1, :cond_3

    .line 120
    .line 121
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 122
    .line 123
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    move-result p1

    .line 129
    if-eqz p1, :cond_3

    .line 130
    .line 131
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 132
    .line 133
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 134
    .line 135
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-eqz p1, :cond_3

    .line 140
    .line 141
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 142
    .line 143
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 144
    .line 145
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    if-eqz p1, :cond_3

    .line 150
    .line 151
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 152
    .line 153
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 154
    .line 155
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-eqz p1, :cond_3

    .line 160
    .line 161
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 162
    .line 163
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 164
    .line 165
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result p1

    .line 169
    if-eqz p1, :cond_3

    .line 170
    .line 171
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 172
    .line 173
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 174
    .line 175
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    if-eqz p1, :cond_3

    .line 180
    .line 181
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 182
    .line 183
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 184
    .line 185
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result p1

    .line 189
    if-eqz p1, :cond_3

    .line 190
    .line 191
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 192
    .line 193
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 194
    .line 195
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 196
    .line 197
    .line 198
    move-result p1

    .line 199
    if-eqz p1, :cond_3

    .line 200
    .line 201
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localAnimationKey:Ljava/lang/String;

    .line 202
    .line 203
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localAnimationKey:Ljava/lang/String;

    .line 204
    .line 205
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result p1

    .line 209
    if-eqz p1, :cond_3

    .line 210
    .line 211
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->reminder:Ljava/lang/String;

    .line 212
    .line 213
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->reminder:Ljava/lang/String;

    .line 214
    .line 215
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result p1

    .line 219
    if-eqz p1, :cond_3

    .line 220
    .line 221
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 222
    .line 223
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 224
    .line 225
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    if-eqz p1, :cond_3

    .line 230
    .line 231
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->giftRecords:Ljava/util/List;

    .line 232
    .line 233
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->giftRecords:Ljava/util/List;

    .line 234
    .line 235
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result p1

    .line 239
    if-eqz p1, :cond_3

    .line 240
    .line 241
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 242
    .line 243
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 244
    .line 245
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 246
    .line 247
    .line 248
    move-result p1

    .line 249
    if-eqz p1, :cond_3

    .line 250
    .line 251
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallType:Ljava/lang/String;

    .line 252
    .line 253
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localCallType:Ljava/lang/String;

    .line 254
    .line 255
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    if-eqz p1, :cond_3

    .line 260
    .line 261
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallStatus:I

    .line 262
    .line 263
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localCallStatus:I

    .line 264
    .line 265
    if-ne p1, v3, :cond_3

    .line 266
    .line 267
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 268
    .line 269
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 270
    .line 271
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-eqz p1, :cond_3

    .line 276
    .line 277
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 278
    .line 279
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 280
    .line 281
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    if-eqz p1, :cond_3

    .line 286
    .line 287
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 288
    .line 289
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 290
    .line 291
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 292
    .line 293
    .line 294
    move-result p1

    .line 295
    if-eqz p1, :cond_3

    .line 296
    .line 297
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Message;->chatTyping:Z

    .line 298
    .line 299
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Message;->chatTyping:Z

    .line 300
    .line 301
    if-ne p1, v3, :cond_3

    .line 302
    .line 303
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 304
    .line 305
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 306
    .line 307
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result p1

    .line 311
    if-eqz p1, :cond_3

    .line 312
    .line 313
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 314
    .line 315
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 316
    .line 317
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 318
    .line 319
    .line 320
    move-result p1

    .line 321
    if-eqz p1, :cond_3

    .line 322
    .line 323
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 324
    .line 325
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 326
    .line 327
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result p1

    .line 331
    if-eqz p1, :cond_3

    .line 332
    .line 333
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 334
    .line 335
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 336
    .line 337
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 338
    .line 339
    .line 340
    move-result p1

    .line 341
    if-eqz p1, :cond_3

    .line 342
    .line 343
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 344
    .line 345
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 346
    .line 347
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    move-result p1

    .line 351
    if-eqz p1, :cond_3

    .line 352
    .line 353
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 354
    .line 355
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 356
    .line 357
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 358
    .line 359
    .line 360
    move-result p1

    .line 361
    if-eqz p1, :cond_3

    .line 362
    .line 363
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Message;->likes:I

    .line 364
    .line 365
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Message;->likes:I

    .line 366
    .line 367
    if-ne p1, v3, :cond_3

    .line 368
    .line 369
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Message;->liked:Z

    .line 370
    .line 371
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Message;->liked:Z

    .line 372
    .line 373
    if-ne p1, v3, :cond_3

    .line 374
    .line 375
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 376
    .line 377
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 378
    .line 379
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 380
    .line 381
    .line 382
    move-result p1

    .line 383
    if-eqz p1, :cond_3

    .line 384
    .line 385
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 386
    .line 387
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 388
    .line 389
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    move-result p1

    .line 393
    if-eqz p1, :cond_3

    .line 394
    .line 395
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 396
    .line 397
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 398
    .line 399
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 400
    .line 401
    .line 402
    move-result p1

    .line 403
    if-eqz p1, :cond_3

    .line 404
    .line 405
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Message;->isBottom:Z

    .line 406
    .line 407
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Message;->isBottom:Z

    .line 408
    .line 409
    if-ne p1, v3, :cond_3

    .line 410
    .line 411
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    .line 412
    .line 413
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    .line 414
    .line 415
    if-ne p1, v3, :cond_3

    .line 416
    .line 417
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 418
    .line 419
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 420
    .line 421
    if-ne p1, v3, :cond_3

    .line 422
    .line 423
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 424
    .line 425
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 426
    .line 427
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 428
    .line 429
    .line 430
    move-result p1

    .line 431
    if-eqz p1, :cond_3

    .line 432
    .line 433
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 434
    .line 435
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 436
    .line 437
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 438
    .line 439
    .line 440
    move-result p1

    .line 441
    if-eqz p1, :cond_3

    .line 442
    .line 443
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 444
    .line 445
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 446
    .line 447
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 448
    .line 449
    .line 450
    move-result p1

    .line 451
    if-eqz p1, :cond_3

    .line 452
    .line 453
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 454
    .line 455
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 456
    .line 457
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 458
    .line 459
    .line 460
    move-result p1

    .line 461
    if-eqz p1, :cond_3

    .line 462
    .line 463
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 464
    .line 465
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 466
    .line 467
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 468
    .line 469
    .line 470
    move-result p1

    .line 471
    if-eqz p1, :cond_3

    .line 472
    .line 473
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 474
    .line 475
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 476
    .line 477
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 478
    .line 479
    .line 480
    move-result p1

    .line 481
    if-eqz p1, :cond_3

    .line 482
    .line 483
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 484
    .line 485
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 486
    .line 487
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 488
    .line 489
    .line 490
    move-result p1

    .line 491
    if-eqz p1, :cond_3

    .line 492
    .line 493
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 494
    .line 495
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 496
    .line 497
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 498
    .line 499
    .line 500
    move-result p1

    .line 501
    if-eqz p1, :cond_3

    .line 502
    .line 503
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 504
    .line 505
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 506
    .line 507
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 508
    .line 509
    .line 510
    move-result p1

    .line 511
    if-eqz p1, :cond_3

    .line 512
    .line 513
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Message;->isNewComment:Z

    .line 514
    .line 515
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Message;->isNewComment:Z

    .line 516
    .line 517
    if-ne p1, v3, :cond_3

    .line 518
    .line 519
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 520
    .line 521
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 522
    .line 523
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 524
    .line 525
    .line 526
    move-result p1

    .line 527
    if-eqz p1, :cond_3

    .line 528
    .line 529
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 530
    .line 531
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 532
    .line 533
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 534
    .line 535
    .line 536
    move-result p1

    .line 537
    if-eqz p1, :cond_3

    .line 538
    .line 539
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Message;->read:Z

    .line 540
    .line 541
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Message;->read:Z

    .line 542
    .line 543
    if-ne p1, v3, :cond_3

    .line 544
    .line 545
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    .line 546
    .line 547
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    .line 548
    .line 549
    if-ne p1, v3, :cond_3

    .line 550
    .line 551
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 552
    .line 553
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 554
    .line 555
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 556
    .line 557
    .line 558
    move-result p1

    .line 559
    if-eqz p1, :cond_3

    .line 560
    .line 561
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    .line 562
    .line 563
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    .line 564
    .line 565
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 566
    .line 567
    .line 568
    move-result p1

    .line 569
    if-eqz p1, :cond_3

    .line 570
    .line 571
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 572
    .line 573
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 574
    .line 575
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 576
    .line 577
    .line 578
    move-result p1

    .line 579
    if-eqz p1, :cond_3

    .line 580
    .line 581
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->incTempInfo:Ljava/lang/String;

    .line 582
    .line 583
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->incTempInfo:Ljava/lang/String;

    .line 584
    .line 585
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 586
    .line 587
    .line 588
    move-result p1

    .line 589
    if-eqz p1, :cond_3

    .line 590
    .line 591
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 592
    .line 593
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 594
    .line 595
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 596
    .line 597
    .line 598
    move-result p1

    .line 599
    if-eqz p1, :cond_3

    .line 600
    .line 601
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 602
    .line 603
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 604
    .line 605
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 606
    .line 607
    .line 608
    move-result p1

    .line 609
    if-eqz p1, :cond_3

    .line 610
    .line 611
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 612
    .line 613
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 614
    .line 615
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 616
    .line 617
    .line 618
    move-result p1

    .line 619
    if-eqz p1, :cond_3

    .line 620
    .line 621
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 622
    .line 623
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 624
    .line 625
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 626
    .line 627
    .line 628
    move-result p1

    .line 629
    if-eqz p1, :cond_3

    .line 630
    .line 631
    iget p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorCount:I

    .line 632
    .line 633
    iget v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorCount:I

    .line 634
    .line 635
    if-ne p1, v3, :cond_3

    .line 636
    .line 637
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 638
    .line 639
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 640
    .line 641
    if-ne p1, v3, :cond_3

    .line 642
    .line 643
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/Message;->secondSend:Z

    .line 644
    .line 645
    iget-boolean p1, v1, Lcom/p1/mobile/putong/core/data/Message;->secondSend:Z

    .line 646
    .line 647
    if-ne p0, p1, :cond_3

    .line 648
    .line 649
    return v0

    .line 650
    :cond_3
    return v2
.end method

.method public getAiChatMessageExtraInfo()Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->aiChatMessageExtraInfo:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgDataOld:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->aiChatMessageExtraInfo:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_1
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->aiChatMessageExtraInfo:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 43
    .line 44
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 45
    .line 46
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgDataOld:Ljava/lang/String;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception v0

    .line 50
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->aiChatMessageExtraInfo:Lcom/p1/mobile/putong/core/data/AiChatMessageExtraInfo;

    .line 54
    .line 55
    return-object p0
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "message"

    .line 2
    .line 3
    return-object p0
.end method

.method public getHostId()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 13
    .line 14
    return-object p0
.end method

.method public getMomentShowFromType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->momentShowFromType:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-string p0, ""

    .line 6
    .line 7
    :cond_0
    return-object p0
.end method

.method public getOperationTopicInfo()Lcom/p1/mobile/putong/core/data/OperationTopicInfo;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "operation"

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return-object v1

    .line 15
    :cond_0
    :try_start_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/OperationTopicInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/p1/mobile/putong/core/data/OperationTopicInfo;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 24
    .line 25
    return-object p0

    .line 26
    :catch_0
    move-exception p0

    .line 27
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    return-object v1
.end method

.method public hashCode()I
    .locals 8

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_41

    .line 4
    .line 5
    invoke-super {p0}, Lcom/tantanapp/common/data/DbObject;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    mul-int/lit8 v0, v0, 0x29

    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localInMoment:Z

    .line 12
    .line 13
    const/16 v2, 0x4d5

    .line 14
    .line 15
    const/16 v3, 0x4cf

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    move v1, v3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move v1, v2

    .line 22
    :goto_0
    add-int/2addr v0, v1

    .line 23
    mul-int/lit8 v0, v0, 0x29

    .line 24
    .line 25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localInConversation:Z

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    move v1, v3

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v1, v2

    .line 32
    :goto_1
    add-int/2addr v0, v1

    .line 33
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 34
    .line 35
    invoke-static {v4, v5}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 36
    .line 37
    .line 38
    move-result-wide v4

    .line 39
    mul-int/lit8 v0, v0, 0x29

    .line 40
    .line 41
    const/16 v1, 0x20

    .line 42
    .line 43
    ushr-long v6, v4, v1

    .line 44
    .line 45
    xor-long/2addr v4, v6

    .line 46
    long-to-int v1, v4

    .line 47
    add-int/2addr v0, v1

    .line 48
    mul-int/lit8 v0, v0, 0x29

    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 51
    .line 52
    const/4 v4, 0x0

    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    goto :goto_2

    .line 60
    :cond_2
    move v1, v4

    .line 61
    :goto_2
    add-int/2addr v0, v1

    .line 62
    mul-int/lit8 v0, v0, 0x29

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v1, :cond_3

    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    goto :goto_3

    .line 73
    :cond_3
    move v1, v4

    .line 74
    :goto_3
    add-int/2addr v0, v1

    .line 75
    mul-int/lit8 v0, v0, 0x29

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 78
    .line 79
    if-eqz v1, :cond_4

    .line 80
    .line 81
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    goto :goto_4

    .line 86
    :cond_4
    move v1, v4

    .line 87
    :goto_4
    add-int/2addr v0, v1

    .line 88
    mul-int/lit8 v0, v0, 0x29

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 91
    .line 92
    if-eqz v1, :cond_5

    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    goto :goto_5

    .line 99
    :cond_5
    move v1, v4

    .line 100
    :goto_5
    add-int/2addr v0, v1

    .line 101
    mul-int/lit8 v0, v0, 0x29

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz v1, :cond_6

    .line 106
    .line 107
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    goto :goto_6

    .line 112
    :cond_6
    move v1, v4

    .line 113
    :goto_6
    add-int/2addr v0, v1

    .line 114
    mul-int/lit8 v0, v0, 0x29

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->questionCategory:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 117
    .line 118
    if-eqz v1, :cond_7

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    goto :goto_7

    .line 125
    :cond_7
    move v1, v4

    .line 126
    :goto_7
    add-int/2addr v0, v1

    .line 127
    mul-int/lit8 v0, v0, 0x29

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 130
    .line 131
    if-eqz v1, :cond_8

    .line 132
    .line 133
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    goto :goto_8

    .line 138
    :cond_8
    move v1, v4

    .line 139
    :goto_8
    add-int/2addr v0, v1

    .line 140
    mul-int/lit8 v0, v0, 0x29

    .line 141
    .line 142
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 143
    .line 144
    if-eqz v1, :cond_9

    .line 145
    .line 146
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageReference;->hashCode()I

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    goto :goto_9

    .line 151
    :cond_9
    move v1, v4

    .line 152
    :goto_9
    add-int/2addr v0, v1

    .line 153
    mul-int/lit8 v0, v0, 0x29

    .line 154
    .line 155
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 156
    .line 157
    if-eqz v1, :cond_a

    .line 158
    .line 159
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    goto :goto_a

    .line 164
    :cond_a
    move v1, v4

    .line 165
    :goto_a
    add-int/2addr v0, v1

    .line 166
    mul-int/lit8 v0, v0, 0x29

    .line 167
    .line 168
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 169
    .line 170
    if-eqz v1, :cond_b

    .line 171
    .line 172
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    goto :goto_b

    .line 177
    :cond_b
    move v1, v4

    .line 178
    :goto_b
    add-int/2addr v0, v1

    .line 179
    mul-int/lit8 v0, v0, 0x29

    .line 180
    .line 181
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 182
    .line 183
    if-eqz v1, :cond_c

    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    goto :goto_c

    .line 190
    :cond_c
    move v1, v4

    .line 191
    :goto_c
    add-int/2addr v0, v1

    .line 192
    mul-int/lit8 v0, v0, 0x29

    .line 193
    .line 194
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 195
    .line 196
    if-eqz v1, :cond_d

    .line 197
    .line 198
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/MessageLocation;->hashCode()I

    .line 199
    .line 200
    .line 201
    move-result v1

    .line 202
    goto :goto_d

    .line 203
    :cond_d
    move v1, v4

    .line 204
    :goto_d
    add-int/2addr v0, v1

    .line 205
    mul-int/lit8 v0, v0, 0x29

    .line 206
    .line 207
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 208
    .line 209
    if-eqz v1, :cond_e

    .line 210
    .line 211
    invoke-virtual {v1}, Ljava/lang/Boolean;->hashCode()I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    goto :goto_e

    .line 216
    :cond_e
    move v1, v4

    .line 217
    :goto_e
    add-int/2addr v0, v1

    .line 218
    mul-int/lit8 v0, v0, 0x29

    .line 219
    .line 220
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 221
    .line 222
    if-eqz v1, :cond_f

    .line 223
    .line 224
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    goto :goto_f

    .line 229
    :cond_f
    move v1, v4

    .line 230
    :goto_f
    add-int/2addr v0, v1

    .line 231
    mul-int/lit8 v0, v0, 0x29

    .line 232
    .line 233
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 234
    .line 235
    if-eqz v1, :cond_10

    .line 236
    .line 237
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    goto :goto_10

    .line 242
    :cond_10
    move v1, v4

    .line 243
    :goto_10
    add-int/2addr v0, v1

    .line 244
    mul-int/lit8 v0, v0, 0x29

    .line 245
    .line 246
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 247
    .line 248
    if-eqz v1, :cond_11

    .line 249
    .line 250
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    goto :goto_11

    .line 255
    :cond_11
    move v1, v4

    .line 256
    :goto_11
    add-int/2addr v0, v1

    .line 257
    mul-int/lit8 v0, v0, 0x29

    .line 258
    .line 259
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localAnimationKey:Ljava/lang/String;

    .line 260
    .line 261
    if-eqz v1, :cond_12

    .line 262
    .line 263
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    goto :goto_12

    .line 268
    :cond_12
    move v1, v4

    .line 269
    :goto_12
    add-int/2addr v0, v1

    .line 270
    mul-int/lit8 v0, v0, 0x29

    .line 271
    .line 272
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->reminder:Ljava/lang/String;

    .line 273
    .line 274
    if-eqz v1, :cond_13

    .line 275
    .line 276
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    goto :goto_13

    .line 281
    :cond_13
    move v1, v4

    .line 282
    :goto_13
    add-int/2addr v0, v1

    .line 283
    mul-int/lit8 v0, v0, 0x29

    .line 284
    .line 285
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 286
    .line 287
    if-eqz v1, :cond_14

    .line 288
    .line 289
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageAccessory;->hashCode()I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    goto :goto_14

    .line 294
    :cond_14
    move v1, v4

    .line 295
    :goto_14
    add-int/2addr v0, v1

    .line 296
    mul-int/lit8 v0, v0, 0x29

    .line 297
    .line 298
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->giftRecords:Ljava/util/List;

    .line 299
    .line 300
    if-eqz v1, :cond_15

    .line 301
    .line 302
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 303
    .line 304
    .line 305
    move-result v1

    .line 306
    goto :goto_15

    .line 307
    :cond_15
    move v1, v4

    .line 308
    :goto_15
    add-int/2addr v0, v1

    .line 309
    mul-int/lit8 v0, v0, 0x29

    .line 310
    .line 311
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 312
    .line 313
    if-eqz v1, :cond_16

    .line 314
    .line 315
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CallRecord;->hashCode()I

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    goto :goto_16

    .line 320
    :cond_16
    move v1, v4

    .line 321
    :goto_16
    add-int/2addr v0, v1

    .line 322
    mul-int/lit8 v0, v0, 0x29

    .line 323
    .line 324
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallType:Ljava/lang/String;

    .line 325
    .line 326
    if-eqz v1, :cond_17

    .line 327
    .line 328
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    goto :goto_17

    .line 333
    :cond_17
    move v1, v4

    .line 334
    :goto_17
    add-int/2addr v0, v1

    .line 335
    mul-int/lit8 v0, v0, 0x29

    .line 336
    .line 337
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallStatus:I

    .line 338
    .line 339
    add-int/2addr v0, v1

    .line 340
    mul-int/lit8 v0, v0, 0x29

    .line 341
    .line 342
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 343
    .line 344
    if-eqz v1, :cond_18

    .line 345
    .line 346
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 347
    .line 348
    .line 349
    move-result v1

    .line 350
    goto :goto_18

    .line 351
    :cond_18
    move v1, v4

    .line 352
    :goto_18
    add-int/2addr v0, v1

    .line 353
    mul-int/lit8 v0, v0, 0x29

    .line 354
    .line 355
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 356
    .line 357
    if-eqz v1, :cond_19

    .line 358
    .line 359
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 360
    .line 361
    .line 362
    move-result v1

    .line 363
    goto :goto_19

    .line 364
    :cond_19
    move v1, v4

    .line 365
    :goto_19
    add-int/2addr v0, v1

    .line 366
    mul-int/lit8 v0, v0, 0x29

    .line 367
    .line 368
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 369
    .line 370
    if-eqz v1, :cond_1a

    .line 371
    .line 372
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Letter;->hashCode()I

    .line 373
    .line 374
    .line 375
    move-result v1

    .line 376
    goto :goto_1a

    .line 377
    :cond_1a
    move v1, v4

    .line 378
    :goto_1a
    add-int/2addr v0, v1

    .line 379
    mul-int/lit8 v0, v0, 0x29

    .line 380
    .line 381
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->chatTyping:Z

    .line 382
    .line 383
    if-eqz v1, :cond_1b

    .line 384
    .line 385
    move v1, v3

    .line 386
    goto :goto_1b

    .line 387
    :cond_1b
    move v1, v2

    .line 388
    :goto_1b
    add-int/2addr v0, v1

    .line 389
    mul-int/lit8 v0, v0, 0x29

    .line 390
    .line 391
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 392
    .line 393
    if-eqz v1, :cond_1c

    .line 394
    .line 395
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    goto :goto_1c

    .line 400
    :cond_1c
    move v1, v4

    .line 401
    :goto_1c
    add-int/2addr v0, v1

    .line 402
    mul-int/lit8 v0, v0, 0x29

    .line 403
    .line 404
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 405
    .line 406
    if-eqz v1, :cond_1d

    .line 407
    .line 408
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 409
    .line 410
    .line 411
    move-result v1

    .line 412
    goto :goto_1d

    .line 413
    :cond_1d
    move v1, v4

    .line 414
    :goto_1d
    add-int/2addr v0, v1

    .line 415
    mul-int/lit8 v0, v0, 0x29

    .line 416
    .line 417
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 418
    .line 419
    if-eqz v1, :cond_1e

    .line 420
    .line 421
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 422
    .line 423
    .line 424
    move-result v1

    .line 425
    goto :goto_1e

    .line 426
    :cond_1e
    move v1, v4

    .line 427
    :goto_1e
    add-int/2addr v0, v1

    .line 428
    mul-int/lit8 v0, v0, 0x29

    .line 429
    .line 430
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 431
    .line 432
    if-eqz v1, :cond_1f

    .line 433
    .line 434
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 435
    .line 436
    .line 437
    move-result v1

    .line 438
    goto :goto_1f

    .line 439
    :cond_1f
    move v1, v4

    .line 440
    :goto_1f
    add-int/2addr v0, v1

    .line 441
    mul-int/lit8 v0, v0, 0x29

    .line 442
    .line 443
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 444
    .line 445
    if-eqz v1, :cond_20

    .line 446
    .line 447
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->hashCode()I

    .line 448
    .line 449
    .line 450
    move-result v1

    .line 451
    goto :goto_20

    .line 452
    :cond_20
    move v1, v4

    .line 453
    :goto_20
    add-int/2addr v0, v1

    .line 454
    mul-int/lit8 v0, v0, 0x29

    .line 455
    .line 456
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 457
    .line 458
    if-eqz v1, :cond_21

    .line 459
    .line 460
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/CommentInfo;->hashCode()I

    .line 461
    .line 462
    .line 463
    move-result v1

    .line 464
    goto :goto_21

    .line 465
    :cond_21
    move v1, v4

    .line 466
    :goto_21
    add-int/2addr v0, v1

    .line 467
    mul-int/lit8 v0, v0, 0x29

    .line 468
    .line 469
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Message;->likes:I

    .line 470
    .line 471
    add-int/2addr v0, v1

    .line 472
    mul-int/lit8 v0, v0, 0x29

    .line 473
    .line 474
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->liked:Z

    .line 475
    .line 476
    if-eqz v1, :cond_22

    .line 477
    .line 478
    move v1, v3

    .line 479
    goto :goto_22

    .line 480
    :cond_22
    move v1, v2

    .line 481
    :goto_22
    add-int/2addr v0, v1

    .line 482
    mul-int/lit8 v0, v0, 0x29

    .line 483
    .line 484
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 485
    .line 486
    if-eqz v1, :cond_23

    .line 487
    .line 488
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 489
    .line 490
    .line 491
    move-result v1

    .line 492
    goto :goto_23

    .line 493
    :cond_23
    move v1, v4

    .line 494
    :goto_23
    add-int/2addr v0, v1

    .line 495
    mul-int/lit8 v0, v0, 0x29

    .line 496
    .line 497
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 498
    .line 499
    if-eqz v1, :cond_24

    .line 500
    .line 501
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 502
    .line 503
    .line 504
    move-result v1

    .line 505
    goto :goto_24

    .line 506
    :cond_24
    move v1, v4

    .line 507
    :goto_24
    add-int/2addr v0, v1

    .line 508
    mul-int/lit8 v0, v0, 0x29

    .line 509
    .line 510
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 511
    .line 512
    if-eqz v1, :cond_25

    .line 513
    .line 514
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 515
    .line 516
    .line 517
    move-result v1

    .line 518
    goto :goto_25

    .line 519
    :cond_25
    move v1, v4

    .line 520
    :goto_25
    add-int/2addr v0, v1

    .line 521
    mul-int/lit8 v0, v0, 0x29

    .line 522
    .line 523
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->isBottom:Z

    .line 524
    .line 525
    if-eqz v1, :cond_26

    .line 526
    .line 527
    move v1, v3

    .line 528
    goto :goto_26

    .line 529
    :cond_26
    move v1, v2

    .line 530
    :goto_26
    add-int/2addr v0, v1

    .line 531
    mul-int/lit8 v0, v0, 0x29

    .line 532
    .line 533
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localSafetyReminder:Z

    .line 534
    .line 535
    if-eqz v1, :cond_27

    .line 536
    .line 537
    move v1, v3

    .line 538
    goto :goto_27

    .line 539
    :cond_27
    move v1, v2

    .line 540
    :goto_27
    add-int/2addr v0, v1

    .line 541
    mul-int/lit8 v0, v0, 0x29

    .line 542
    .line 543
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localSensitiveWordReminder:Z

    .line 544
    .line 545
    if-eqz v1, :cond_28

    .line 546
    .line 547
    move v1, v3

    .line 548
    goto :goto_28

    .line 549
    :cond_28
    move v1, v2

    .line 550
    :goto_28
    add-int/2addr v0, v1

    .line 551
    mul-int/lit8 v0, v0, 0x29

    .line 552
    .line 553
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 554
    .line 555
    if-eqz v1, :cond_29

    .line 556
    .line 557
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 558
    .line 559
    .line 560
    move-result v1

    .line 561
    goto :goto_29

    .line 562
    :cond_29
    move v1, v4

    .line 563
    :goto_29
    add-int/2addr v0, v1

    .line 564
    mul-int/lit8 v0, v0, 0x29

    .line 565
    .line 566
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 567
    .line 568
    if-eqz v1, :cond_2a

    .line 569
    .line 570
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 571
    .line 572
    .line 573
    move-result v1

    .line 574
    goto :goto_2a

    .line 575
    :cond_2a
    move v1, v4

    .line 576
    :goto_2a
    add-int/2addr v0, v1

    .line 577
    mul-int/lit8 v0, v0, 0x29

    .line 578
    .line 579
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 580
    .line 581
    if-eqz v1, :cond_2b

    .line 582
    .line 583
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageSetting;->hashCode()I

    .line 584
    .line 585
    .line 586
    move-result v1

    .line 587
    goto :goto_2b

    .line 588
    :cond_2b
    move v1, v4

    .line 589
    :goto_2b
    add-int/2addr v0, v1

    .line 590
    mul-int/lit8 v0, v0, 0x29

    .line 591
    .line 592
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 593
    .line 594
    if-eqz v1, :cond_2c

    .line 595
    .line 596
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 597
    .line 598
    .line 599
    move-result v1

    .line 600
    goto :goto_2c

    .line 601
    :cond_2c
    move v1, v4

    .line 602
    :goto_2c
    add-int/2addr v0, v1

    .line 603
    mul-int/lit8 v0, v0, 0x29

    .line 604
    .line 605
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 606
    .line 607
    if-eqz v1, :cond_2d

    .line 608
    .line 609
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 610
    .line 611
    .line 612
    move-result v1

    .line 613
    goto :goto_2d

    .line 614
    :cond_2d
    move v1, v4

    .line 615
    :goto_2d
    add-int/2addr v0, v1

    .line 616
    mul-int/lit8 v0, v0, 0x29

    .line 617
    .line 618
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 619
    .line 620
    if-eqz v1, :cond_2e

    .line 621
    .line 622
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 623
    .line 624
    .line 625
    move-result v1

    .line 626
    goto :goto_2e

    .line 627
    :cond_2e
    move v1, v4

    .line 628
    :goto_2e
    add-int/2addr v0, v1

    .line 629
    mul-int/lit8 v0, v0, 0x29

    .line 630
    .line 631
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 632
    .line 633
    if-eqz v1, :cond_2f

    .line 634
    .line 635
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 636
    .line 637
    .line 638
    move-result v1

    .line 639
    goto :goto_2f

    .line 640
    :cond_2f
    move v1, v4

    .line 641
    :goto_2f
    add-int/2addr v0, v1

    .line 642
    mul-int/lit8 v0, v0, 0x29

    .line 643
    .line 644
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 645
    .line 646
    if-eqz v1, :cond_30

    .line 647
    .line 648
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 649
    .line 650
    .line 651
    move-result v1

    .line 652
    goto :goto_30

    .line 653
    :cond_30
    move v1, v4

    .line 654
    :goto_30
    add-int/2addr v0, v1

    .line 655
    mul-int/lit8 v0, v0, 0x29

    .line 656
    .line 657
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 658
    .line 659
    if-eqz v1, :cond_31

    .line 660
    .line 661
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 662
    .line 663
    .line 664
    move-result v1

    .line 665
    goto :goto_31

    .line 666
    :cond_31
    move v1, v4

    .line 667
    :goto_31
    add-int/2addr v0, v1

    .line 668
    mul-int/lit8 v0, v0, 0x29

    .line 669
    .line 670
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->isNewComment:Z

    .line 671
    .line 672
    if-eqz v1, :cond_32

    .line 673
    .line 674
    move v1, v3

    .line 675
    goto :goto_32

    .line 676
    :cond_32
    move v1, v2

    .line 677
    :goto_32
    add-int/2addr v0, v1

    .line 678
    mul-int/lit8 v0, v0, 0x29

    .line 679
    .line 680
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 681
    .line 682
    if-eqz v1, :cond_33

    .line 683
    .line 684
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/AudioText;->hashCode()I

    .line 685
    .line 686
    .line 687
    move-result v1

    .line 688
    goto :goto_33

    .line 689
    :cond_33
    move v1, v4

    .line 690
    :goto_33
    add-int/2addr v0, v1

    .line 691
    mul-int/lit8 v0, v0, 0x29

    .line 692
    .line 693
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localGreetingId:Ljava/lang/String;

    .line 694
    .line 695
    if-eqz v1, :cond_34

    .line 696
    .line 697
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 698
    .line 699
    .line 700
    move-result v1

    .line 701
    goto :goto_34

    .line 702
    :cond_34
    move v1, v4

    .line 703
    :goto_34
    add-int/2addr v0, v1

    .line 704
    mul-int/lit8 v0, v0, 0x29

    .line 705
    .line 706
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->read:Z

    .line 707
    .line 708
    if-eqz v1, :cond_35

    .line 709
    .line 710
    move v1, v3

    .line 711
    goto :goto_35

    .line 712
    :cond_35
    move v1, v2

    .line 713
    :goto_35
    add-int/2addr v0, v1

    .line 714
    mul-int/lit8 v0, v0, 0x29

    .line 715
    .line 716
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    .line 717
    .line 718
    if-eqz v1, :cond_36

    .line 719
    .line 720
    move v1, v3

    .line 721
    goto :goto_36

    .line 722
    :cond_36
    move v1, v2

    .line 723
    :goto_36
    add-int/2addr v0, v1

    .line 724
    mul-int/lit8 v0, v0, 0x29

    .line 725
    .line 726
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 727
    .line 728
    if-eqz v1, :cond_37

    .line 729
    .line 730
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageExtData;->hashCode()I

    .line 731
    .line 732
    .line 733
    move-result v1

    .line 734
    goto :goto_37

    .line 735
    :cond_37
    move v1, v4

    .line 736
    :goto_37
    add-int/2addr v0, v1

    .line 737
    mul-int/lit8 v0, v0, 0x29

    .line 738
    .line 739
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->fromConvType:Ljava/lang/String;

    .line 740
    .line 741
    if-eqz v1, :cond_38

    .line 742
    .line 743
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 744
    .line 745
    .line 746
    move-result v1

    .line 747
    goto :goto_38

    .line 748
    :cond_38
    move v1, v4

    .line 749
    :goto_38
    add-int/2addr v0, v1

    .line 750
    mul-int/lit8 v0, v0, 0x29

    .line 751
    .line 752
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 753
    .line 754
    if-eqz v1, :cond_39

    .line 755
    .line 756
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 757
    .line 758
    .line 759
    move-result v1

    .line 760
    goto :goto_39

    .line 761
    :cond_39
    move v1, v4

    .line 762
    :goto_39
    add-int/2addr v0, v1

    .line 763
    mul-int/lit8 v0, v0, 0x29

    .line 764
    .line 765
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->incTempInfo:Ljava/lang/String;

    .line 766
    .line 767
    if-eqz v1, :cond_3a

    .line 768
    .line 769
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 770
    .line 771
    .line 772
    move-result v1

    .line 773
    goto :goto_3a

    .line 774
    :cond_3a
    move v1, v4

    .line 775
    :goto_3a
    add-int/2addr v0, v1

    .line 776
    mul-int/lit8 v0, v0, 0x29

    .line 777
    .line 778
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 779
    .line 780
    if-eqz v1, :cond_3b

    .line 781
    .line 782
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 783
    .line 784
    .line 785
    move-result v1

    .line 786
    goto :goto_3b

    .line 787
    :cond_3b
    move v1, v4

    .line 788
    :goto_3b
    add-int/2addr v0, v1

    .line 789
    mul-int/lit8 v0, v0, 0x29

    .line 790
    .line 791
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 792
    .line 793
    if-eqz v1, :cond_3c

    .line 794
    .line 795
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 796
    .line 797
    .line 798
    move-result v1

    .line 799
    goto :goto_3c

    .line 800
    :cond_3c
    move v1, v4

    .line 801
    :goto_3c
    add-int/2addr v0, v1

    .line 802
    mul-int/lit8 v0, v0, 0x29

    .line 803
    .line 804
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 805
    .line 806
    if-eqz v1, :cond_3d

    .line 807
    .line 808
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 809
    .line 810
    .line 811
    move-result v1

    .line 812
    goto :goto_3d

    .line 813
    :cond_3d
    move v1, v4

    .line 814
    :goto_3d
    add-int/2addr v0, v1

    .line 815
    mul-int/lit8 v0, v0, 0x29

    .line 816
    .line 817
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 818
    .line 819
    if-eqz v1, :cond_3e

    .line 820
    .line 821
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 822
    .line 823
    .line 824
    move-result v4

    .line 825
    :cond_3e
    add-int/2addr v0, v4

    .line 826
    mul-int/lit8 v0, v0, 0x29

    .line 827
    .line 828
    iget v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorCount:I

    .line 829
    .line 830
    add-int/2addr v0, v1

    .line 831
    mul-int/lit8 v0, v0, 0x29

    .line 832
    .line 833
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localMyVisitorHidden:Z

    .line 834
    .line 835
    if-eqz v1, :cond_3f

    .line 836
    .line 837
    move v1, v3

    .line 838
    goto :goto_3e

    .line 839
    :cond_3f
    move v1, v2

    .line 840
    :goto_3e
    add-int/2addr v0, v1

    .line 841
    mul-int/lit8 v0, v0, 0x29

    .line 842
    .line 843
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/Message;->secondSend:Z

    .line 844
    .line 845
    if-eqz v1, :cond_40

    .line 846
    .line 847
    move v2, v3

    .line 848
    :cond_40
    add-int/2addr v0, v2

    .line 849
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 850
    .line 851
    :cond_41
    return v0
.end method

.method public isCaller()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 11
    .line 12
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->caller:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public isChildComment()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 2
    .line 3
    const-string v1, "0"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CommentInfo;->parentMessageId:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-nez p0, :cond_2

    .line 40
    .line 41
    :cond_1
    const/4 p0, 0x1

    .line 42
    return p0

    .line 43
    :cond_2
    const/4 p0, 0x0

    .line 44
    return p0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->parseFieldSet:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public isGroupMessage()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 2
    .line 3
    const-string v0, "group"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isLocal()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->status()Lcom/p1/mobile/putong/data/LocalStatus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string v0, "normal"

    .line 6
    .line 7
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    xor-int/lit8 p0, p0, 0x1

    .line 12
    .line 13
    return p0
.end method

.method public isMe()Z
    .locals 1

    .line 1
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public isOtherUser()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    return p0
.end method

.method public mergeData(Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_29

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Message;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :cond_0
    const-string v0, "createdTime"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 24
    .line 25
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 26
    .line 27
    :cond_1
    const-string v0, "otherUser"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 38
    .line 39
    :cond_2
    const-string v0, "media"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 50
    .line 51
    :cond_3
    const-string v0, "sentFrom"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->sentFrom:Lcom/p1/mobile/putong/core/data/MessageSentFrom;

    .line 62
    .line 63
    :cond_4
    const-string v0, "reference"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 74
    .line 75
    :cond_5
    const-string v0, "owner"

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_6

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 86
    .line 87
    :cond_6
    const-string v0, "location"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_7

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 98
    .line 99
    :cond_7
    const-string v0, "recalled"

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_8

    .line 106
    .line 107
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 110
    .line 111
    :cond_8
    const-string v0, "value"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_9

    .line 118
    .line 119
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 122
    .line 123
    :cond_9
    const-string v0, "accessory"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_a

    .line 130
    .line 131
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 134
    .line 135
    :cond_a
    const-string v0, "call"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_b

    .line 142
    .line 143
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 146
    .line 147
    :cond_b
    const-string v0, "localPrivateQuestions"

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_c

    .line 154
    .line 155
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 158
    .line 159
    :cond_c
    const-string v0, "letter"

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_d

    .line 166
    .line 167
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 168
    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 170
    .line 171
    :cond_d
    const-string v0, "recalledReason"

    .line 172
    .line 173
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_e

    .line 178
    .line 179
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 180
    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->recalledReason:Ljava/lang/String;

    .line 182
    .line 183
    :cond_e
    const-string v0, "recalledHint"

    .line 184
    .line 185
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_f

    .line 190
    .line 191
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 192
    .line 193
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->recalledHint:Ljava/lang/String;

    .line 194
    .line 195
    :cond_f
    const-string v0, "msgType"

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_10

    .line 202
    .line 203
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 204
    .line 205
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 206
    .line 207
    :cond_10
    const-string v0, "additionalData"

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-nez v0, :cond_11

    .line 214
    .line 215
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 216
    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 218
    .line 219
    :cond_11
    const-string v0, "commentInfo"

    .line 220
    .line 221
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_12

    .line 226
    .line 227
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 228
    .line 229
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 230
    .line 231
    :cond_12
    const-string v0, "likes"

    .line 232
    .line 233
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v0, :cond_13

    .line 238
    .line 239
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Message;->likes:I

    .line 240
    .line 241
    iput v0, p0, Lcom/p1/mobile/putong/core/data/Message;->likes:I

    .line 242
    .line 243
    :cond_13
    const-string v0, "liked"

    .line 244
    .line 245
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-nez v0, :cond_14

    .line 250
    .line 251
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->liked:Z

    .line 252
    .line 253
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Message;->liked:Z

    .line 254
    .line 255
    :cond_14
    const-string v0, "parentCommentId"

    .line 256
    .line 257
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-nez v0, :cond_15

    .line 262
    .line 263
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 264
    .line 265
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 266
    .line 267
    :cond_15
    const-string v0, "subCommentIds"

    .line 268
    .line 269
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-nez v0, :cond_16

    .line 274
    .line 275
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 276
    .line 277
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 278
    .line 279
    :cond_16
    const-string v0, "moreSubComments"

    .line 280
    .line 281
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-nez v0, :cond_17

    .line 286
    .line 287
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 288
    .line 289
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 290
    .line 291
    :cond_17
    const-string v0, "isBottom"

    .line 292
    .line 293
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    if-nez v0, :cond_18

    .line 298
    .line 299
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->isBottom:Z

    .line 300
    .line 301
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Message;->isBottom:Z

    .line 302
    .line 303
    :cond_18
    const-string v0, "msgData"

    .line 304
    .line 305
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-nez v0, :cond_19

    .line 310
    .line 311
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 312
    .line 313
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 314
    .line 315
    :cond_19
    const-string v0, "settings"

    .line 316
    .line 317
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    if-nez v0, :cond_1a

    .line 322
    .line 323
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 324
    .line 325
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 326
    .line 327
    :cond_1a
    const-string v0, "channel"

    .line 328
    .line 329
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 330
    .line 331
    .line 332
    move-result v0

    .line 333
    if-nez v0, :cond_1b

    .line 334
    .line 335
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 336
    .line 337
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 338
    .line 339
    :cond_1b
    const-string v0, "notifiedUsers"

    .line 340
    .line 341
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    if-nez v0, :cond_1c

    .line 346
    .line 347
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 348
    .line 349
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 350
    .line 351
    :cond_1c
    const-string v0, "status"

    .line 352
    .line 353
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 354
    .line 355
    .line 356
    move-result v0

    .line 357
    if-nez v0, :cond_1d

    .line 358
    .line 359
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 360
    .line 361
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 362
    .line 363
    :cond_1d
    const-string v0, "referenceMsgId"

    .line 364
    .line 365
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 366
    .line 367
    .line 368
    move-result v0

    .line 369
    if-nez v0, :cond_1e

    .line 370
    .line 371
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 372
    .line 373
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 374
    .line 375
    :cond_1e
    const-string v0, "hostId"

    .line 376
    .line 377
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 378
    .line 379
    .line 380
    move-result v0

    .line 381
    if-nez v0, :cond_1f

    .line 382
    .line 383
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 384
    .line 385
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 386
    .line 387
    :cond_1f
    const-string v0, "localRedPacketType"

    .line 388
    .line 389
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 390
    .line 391
    .line 392
    move-result v0

    .line 393
    if-nez v0, :cond_20

    .line 394
    .line 395
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 396
    .line 397
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localRedPacketType:Ljava/lang/String;

    .line 398
    .line 399
    :cond_20
    const-string v0, "isNewComment"

    .line 400
    .line 401
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 402
    .line 403
    .line 404
    move-result v0

    .line 405
    if-nez v0, :cond_21

    .line 406
    .line 407
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->isNewComment:Z

    .line 408
    .line 409
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Message;->isNewComment:Z

    .line 410
    .line 411
    :cond_21
    const-string v0, "needRead"

    .line 412
    .line 413
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 414
    .line 415
    .line 416
    move-result v0

    .line 417
    if-nez v0, :cond_22

    .line 418
    .line 419
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    .line 420
    .line 421
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/Message;->needRead:Z

    .line 422
    .line 423
    :cond_22
    const-string v0, "extData"

    .line 424
    .line 425
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 426
    .line 427
    .line 428
    move-result v0

    .line 429
    if-nez v0, :cond_23

    .line 430
    .line 431
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 432
    .line 433
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 434
    .line 435
    :cond_23
    const-string v0, "consumeType"

    .line 436
    .line 437
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 438
    .line 439
    .line 440
    move-result v0

    .line 441
    if-nez v0, :cond_24

    .line 442
    .line 443
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 444
    .line 445
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 446
    .line 447
    :cond_24
    const-string v0, "coinSign"

    .line 448
    .line 449
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 450
    .line 451
    .line 452
    move-result v0

    .line 453
    if-nez v0, :cond_25

    .line 454
    .line 455
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 456
    .line 457
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 458
    .line 459
    :cond_25
    const-string v0, "action"

    .line 460
    .line 461
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 462
    .line 463
    .line 464
    move-result v0

    .line 465
    if-nez v0, :cond_26

    .line 466
    .line 467
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 468
    .line 469
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 470
    .line 471
    :cond_26
    const-string v0, "riskTags"

    .line 472
    .line 473
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 474
    .line 475
    .line 476
    move-result v0

    .line 477
    if-nez v0, :cond_27

    .line 478
    .line 479
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 480
    .line 481
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 482
    .line 483
    :cond_27
    const-string v0, "secondSend"

    .line 484
    .line 485
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/Message;->isFieldParsed(Ljava/lang/String;)Z

    .line 486
    .line 487
    .line 488
    move-result v0

    .line 489
    if-nez v0, :cond_28

    .line 490
    .line 491
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/Message;->secondSend:Z

    .line 492
    .line 493
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/data/Message;->secondSend:Z

    .line 494
    .line 495
    :cond_28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->parseFieldSet:Ljava/util/HashSet;

    .line 496
    .line 497
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 498
    .line 499
    .line 500
    :cond_29
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 501
    check-cast p1, Lcom/p1/mobile/putong/core/data/Message;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Message;->mergeData(Lcom/p1/mobile/putong/core/data/Message;)V

    return-void
.end method

.method public messageType()Lcom/p1/mobile/putong/core/data/MessageType;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string v1, "default"

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    const-string p0, "moment_comment"

    .line 22
    .line 23
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    const-string p0, "moment_like"

    .line 33
    .line 34
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0

    .line 39
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 40
    .line 41
    if-eqz v0, :cond_4

    .line 42
    .line 43
    const-string p0, "location"

    .line 44
    .line 45
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_5

    .line 53
    .line 54
    const-string p0, "sticker"

    .line 55
    .line 56
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0

    .line 61
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz v0, :cond_6

    .line 64
    .line 65
    const-string p0, "question"

    .line 66
    .line 67
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0

    .line 72
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 73
    .line 74
    if-eqz v0, :cond_a

    .line 75
    .line 76
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_a

    .line 81
    .line 82
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 83
    .line 84
    const/4 v2, 0x0

    .line 85
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 90
    .line 91
    if-eqz v0, :cond_7

    .line 92
    .line 93
    const-string p0, "video"

    .line 94
    .line 95
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    return-object p0

    .line 100
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 101
    .line 102
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 107
    .line 108
    if-eqz v0, :cond_8

    .line 109
    .line 110
    const-string p0, "picture"

    .line 111
    .line 112
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    return-object p0

    .line 117
    :cond_8
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 118
    .line 119
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Audio;

    .line 124
    .line 125
    if-eqz p0, :cond_9

    .line 126
    .line 127
    const-string p0, "audio"

    .line 128
    .line 129
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    return-object p0

    .line 134
    :cond_9
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    return-object p0

    .line 139
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->letter:Lcom/p1/mobile/putong/core/data/Letter;

    .line 140
    .line 141
    if-eqz v0, :cond_b

    .line 142
    .line 143
    const-string p0, "express_heart"

    .line 144
    .line 145
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    return-object p0

    .line 150
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 151
    .line 152
    if-eqz v0, :cond_c

    .line 153
    .line 154
    const-string v1, "unknown_"

    .line 155
    .line 156
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    if-nez v0, :cond_c

    .line 161
    .line 162
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 163
    .line 164
    return-object p0

    .line 165
    :cond_c
    const-string p0, "text"

    .line 166
    .line 167
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    return-object p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 17
    .line 18
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 19
    .line 20
    if-nez v0, :cond_2

    .line 21
    .line 22
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 23
    .line 24
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 25
    .line 26
    if-nez v0, :cond_3

    .line 27
    .line 28
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 29
    .line 30
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 31
    .line 32
    if-nez v0, :cond_4

    .line 33
    .line 34
    sget-object v0, Lcom/p1/mobile/putong/core/data/NotificationStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localNotificationStatus:Lcom/p1/mobile/putong/core/data/NotificationStatus;

    .line 43
    .line 44
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 45
    .line 46
    if-nez v0, :cond_5

    .line 47
    .line 48
    sget-object v0, Lcom/p1/mobile/putong/core/data/CallHandledStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    check-cast v0, Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 55
    .line 56
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallHandledStatus:Lcom/p1/mobile/putong/core/data/CallHandledStatus;

    .line 57
    .line 58
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 59
    .line 60
    if-nez v0, :cond_6

    .line 61
    .line 62
    new-instance v0, Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localPrivateQuestions:Ljava/util/List;

    .line 68
    .line 69
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 70
    .line 71
    if-nez v0, :cond_7

    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CommentInfo;->new_()Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->commentInfo:Lcom/p1/mobile/putong/core/data/CommentInfo;

    .line 78
    .line 79
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 80
    .line 81
    if-nez v0, :cond_8

    .line 82
    .line 83
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->parentCommentId:Ljava/lang/String;

    .line 84
    .line 85
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 86
    .line 87
    if-nez v0, :cond_9

    .line 88
    .line 89
    new-instance v0, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->subCommentIds:Ljava/util/List;

    .line 95
    .line 96
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 97
    .line 98
    if-nez v0, :cond_a

    .line 99
    .line 100
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->moreSubComments:Ljava/lang/String;

    .line 101
    .line 102
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 103
    .line 104
    if-nez v0, :cond_b

    .line 105
    .line 106
    new-instance v0, Ljava/util/ArrayList;

    .line 107
    .line 108
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 109
    .line 110
    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localBusinessTypes:Ljava/util/List;

    .line 112
    .line 113
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 114
    .line 115
    if-nez v0, :cond_c

    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageSetting;->new_()Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->settings:Lcom/p1/mobile/putong/core/data/MessageSetting;

    .line 122
    .line 123
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 124
    .line 125
    if-nez v0, :cond_d

    .line 126
    .line 127
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageChannel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 128
    .line 129
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 134
    .line 135
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 136
    .line 137
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 138
    .line 139
    if-nez v0, :cond_e

    .line 140
    .line 141
    new-instance v0, Ljava/util/ArrayList;

    .line 142
    .line 143
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 144
    .line 145
    .line 146
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->notifiedUsers:Ljava/util/List;

    .line 147
    .line 148
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 149
    .line 150
    if-nez v0, :cond_f

    .line 151
    .line 152
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 153
    .line 154
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 159
    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->status:Lcom/p1/mobile/putong/core/data/MessageStatus;

    .line 161
    .line 162
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 163
    .line 164
    if-nez v0, :cond_10

    .line 165
    .line 166
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 167
    .line 168
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 169
    .line 170
    if-nez v0, :cond_11

    .line 171
    .line 172
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 173
    .line 174
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 175
    .line 176
    if-nez v0, :cond_12

    .line 177
    .line 178
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AudioText;->new_()Lcom/p1/mobile/putong/core/data/AudioText;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localAudioText:Lcom/p1/mobile/putong/core/data/AudioText;

    .line 183
    .line 184
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 185
    .line 186
    if-nez v0, :cond_13

    .line 187
    .line 188
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->consumeType:Ljava/lang/String;

    .line 189
    .line 190
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 191
    .line 192
    if-nez v0, :cond_14

    .line 193
    .line 194
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->coinSign:Ljava/lang/String;

    .line 195
    .line 196
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 197
    .line 198
    if-nez v0, :cond_15

    .line 199
    .line 200
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->action:Ljava/lang/String;

    .line 201
    .line 202
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 203
    .line 204
    if-nez v0, :cond_16

    .line 205
    .line 206
    new-instance v0, Ljava/util/ArrayList;

    .line 207
    .line 208
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 209
    .line 210
    .line 211
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->riskTags:Ljava/util/List;

    .line 212
    .line 213
    :cond_16
    return-void
.end method

.method public onApiParseComplete()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 2
    .line 3
    const-string v1, "group"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 14
    .line 15
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 29
    .line 30
    :goto_0
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 31
    .line 32
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->hostId:Ljava/lang/String;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 38
    .line 39
    sget-object v1, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 40
    .line 41
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Ljava/lang/Integer;

    .line 46
    .line 47
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    iput v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 52
    .line 53
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 54
    .line 55
    .line 56
    move-result-wide v1

    .line 57
    iput-wide v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedTime:J

    .line 58
    .line 59
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 60
    .line 61
    if-eqz v1, :cond_6

    .line 62
    .line 63
    const-string v2, "message"

    .line 64
    .line 65
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 72
    .line 73
    if-eqz v1, :cond_2

    .line 74
    .line 75
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_2
    const-string v1, "moment"

    .line 81
    .line 82
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 89
    .line 90
    if-eqz v1, :cond_4

    .line 91
    .line 92
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 93
    .line 94
    const-string v2, "like"

    .line 95
    .line 96
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 101
    .line 102
    if-eqz v1, :cond_3

    .line 103
    .line 104
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 105
    .line 106
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_3
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 110
    .line 111
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_1

    .line 114
    :cond_4
    const-string v1, "topic"

    .line 115
    .line 116
    iget-object v2, v2, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v1, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-eqz v1, :cond_5

    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 125
    .line 126
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageReference;->topic:Lcom/p1/mobile/putong/core/data/MessageTopic;

    .line 127
    .line 128
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    if-eqz v1, :cond_5

    .line 133
    .line 134
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 135
    .line 136
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageReference;->topic:Lcom/p1/mobile/putong/core/data/MessageTopic;

    .line 137
    .line 138
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageTopic;->toJson()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v1

    .line 142
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->incTempInfo:Ljava/lang/String;

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 146
    .line 147
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 148
    .line 149
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 150
    .line 151
    :goto_1
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 152
    .line 153
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 154
    .line 155
    if-eqz v1, :cond_8

    .line 156
    .line 157
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageAccessory;->type:Ljava/lang/String;

    .line 158
    .line 159
    const-string v2, "question"

    .line 160
    .line 161
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 166
    .line 167
    if-eqz v1, :cond_7

    .line 168
    .line 169
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/MessageAccessory;->id:Ljava/lang/String;

    .line 170
    .line 171
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 172
    .line 173
    goto :goto_2

    .line 174
    :cond_7
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/MessageAccessory;->type:Ljava/lang/String;

    .line 175
    .line 176
    const-string v2, "sticker"

    .line 177
    .line 178
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    if-eqz v1, :cond_8

    .line 183
    .line 184
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 185
    .line 186
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/MessageAccessory;->id:Ljava/lang/String;

    .line 187
    .line 188
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 189
    .line 190
    :cond_8
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 191
    .line 192
    if-eqz v1, :cond_9

    .line 193
    .line 194
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    if-eqz v1, :cond_9

    .line 199
    .line 200
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 201
    .line 202
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 203
    .line 204
    if-eqz v0, :cond_a

    .line 205
    .line 206
    iget v1, v0, Lcom/p1/mobile/putong/core/data/CallRecord;->status:I

    .line 207
    .line 208
    iput v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallStatus:I

    .line 209
    .line 210
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CallRecord;->callType:Ljava/lang/String;

    .line 211
    .line 212
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallType:Ljava/lang/String;

    .line 213
    .line 214
    :cond_a
    return-void
.end method

.method public picture()Lcom/p1/mobile/putong/data/Picture;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Picture;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/p1/mobile/putong/data/Picture;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method

.method public putParsedField(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "v2"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->requestUrl:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    const-string v1, "v3"

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->parseFieldSet:Ljava/util/HashSet;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public reverseParseComplete()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->channel:Lcom/p1/mobile/putong/core/data/MessageChannel;

    .line 10
    .line 11
    const-string v1, "group"

    .line 12
    .line 13
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 24
    .line 25
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_0

    .line 34
    .line 35
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 39
    .line 40
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    :goto_0
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_otherUser:Ljava/lang/String;

    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 51
    .line 52
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageReference;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 56
    .line 57
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 58
    .line 59
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 60
    .line 61
    const-string v1, "message"

    .line 62
    .line 63
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 64
    .line 65
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->answerIdOfAnswer:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz v1, :cond_2

    .line 68
    .line 69
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->answerId:Ljava/lang/String;

    .line 70
    .line 71
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 72
    .line 73
    if-eqz v0, :cond_4

    .line 74
    .line 75
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 76
    .line 77
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageReference;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 85
    .line 86
    const-string v1, "moment"

    .line 87
    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 91
    .line 92
    if-eqz v1, :cond_3

    .line 93
    .line 94
    const-string v1, "like"

    .line 95
    .line 96
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MomentAction;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 101
    .line 102
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->moment:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 107
    .line 108
    const-string v1, "comment"

    .line 109
    .line 110
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/MomentAction;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->action:Lcom/p1/mobile/putong/core/data/MomentAction;

    .line 115
    .line 116
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 117
    .line 118
    if-eqz v0, :cond_5

    .line 119
    .line 120
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 121
    .line 122
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageAccessory;-><init>()V

    .line 123
    .line 124
    .line 125
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 126
    .line 127
    const-string v1, "sticker"

    .line 128
    .line 129
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAccessory;->type:Ljava/lang/String;

    .line 130
    .line 131
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 132
    .line 133
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAccessory;->id:Ljava/lang/String;

    .line 134
    .line 135
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->questionCategory:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 136
    .line 137
    if-eqz v0, :cond_6

    .line 138
    .line 139
    new-instance v0, Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 140
    .line 141
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/MessageAccessory;-><init>()V

    .line 142
    .line 143
    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_accessory:Lcom/p1/mobile/putong/core/data/MessageAccessory;

    .line 145
    .line 146
    const-string v1, "question"

    .line 147
    .line 148
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAccessory;->type:Ljava/lang/String;

    .line 149
    .line 150
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->questionCategory:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 151
    .line 152
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/MessageAccessory;->category:Lcom/p1/mobile/putong/core/data/QuestionCategory;

    .line 153
    .line 154
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->call:Lcom/p1/mobile/putong/core/data/CallRecord;

    .line 155
    .line 156
    if-eqz v0, :cond_7

    .line 157
    .line 158
    iget v1, v0, Lcom/p1/mobile/putong/core/data/CallRecord;->status:I

    .line 159
    .line 160
    iput v1, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallStatus:I

    .line 161
    .line 162
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CallRecord;->callType:Ljava/lang/String;

    .line 163
    .line 164
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->localCallType:Ljava/lang/String;

    .line 165
    .line 166
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-nez v0, :cond_8

    .line 173
    .line 174
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 175
    .line 176
    if-nez v0, :cond_8

    .line 177
    .line 178
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageReference;->new_()Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->api_only_reference:Lcom/p1/mobile/putong/core/data/MessageReference;

    .line 183
    .line 184
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->referenceMsgId:Ljava/lang/String;

    .line 185
    .line 186
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->id:Ljava/lang/String;

    .line 187
    .line 188
    const-string p0, "ref"

    .line 189
    .line 190
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/MessageReference;->type:Ljava/lang/String;

    .line 191
    .line 192
    :cond_8
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public shouldCheckFoulWords()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->answerOfMessage:Ljava/lang/String;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 14
    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public shouldMergeData()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "v2"

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->requestUrl:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p0}, Ll/xi5;->v(Ljava/lang/String;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string v0, "v3"

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_0

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 33
    return p0
.end method

.method public status()Lcom/p1/mobile/putong/data/LocalStatus;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 2
    .line 3
    const-string v1, "tantan_verify_toast"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const-string v1, "normal"

    .line 10
    .line 11
    if-nez v0, :cond_3

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 14
    .line 15
    const-string v2, "live_vip_greet"

    .line 16
    .line 17
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_3

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 24
    .line 25
    const-string v2, "wechat_block_toast"

    .line 26
    .line 27
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 34
    .line 35
    const-string v2, "soul_test_guide"

    .line 36
    .line 37
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_3

    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 44
    .line 45
    const-string v2, "local_real_shot_tips"

    .line 46
    .line 47
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 54
    .line 55
    const-string v2, "local_normal_tips"

    .line 56
    .line 57
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_3

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 64
    .line 65
    const-string v2, "local_greeting_reply"

    .line 66
    .line 67
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_3

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 74
    .line 75
    const-string v2, "local_send_agreematch_notice"

    .line 76
    .line 77
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_3

    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 84
    .line 85
    const-string v2, "local_greeting_agree_match"

    .line 86
    .line 87
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_3

    .line 92
    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 94
    .line 95
    const-string v2, "local_greeting_match_success"

    .line 96
    .line 97
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-nez v0, :cond_3

    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 104
    .line 105
    const-string v2, "moment_notification"

    .line 106
    .line 107
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-nez v0, :cond_3

    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 114
    .line 115
    const-string v2, "local_chat_greeting_tip"

    .line 116
    .line 117
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_3

    .line 122
    .line 123
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 124
    .line 125
    const-string v2, "local_meet_reply"

    .line 126
    .line 127
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-nez v0, :cond_3

    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 134
    .line 135
    const-string v2, "local_greet_send_notice"

    .line 136
    .line 137
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_3

    .line 142
    .line 143
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 144
    .line 145
    const-string v2, "local_greet_receive_match_tip"

    .line 146
    .line 147
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    if-nez v0, :cond_3

    .line 152
    .line 153
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 154
    .line 155
    const-string v2, "heartbeat_notify"

    .line 156
    .line 157
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-nez v0, :cond_3

    .line 162
    .line 163
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 164
    .line 165
    const-string v2, "heartbeat_success"

    .line 166
    .line 167
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    if-nez v0, :cond_3

    .line 172
    .line 173
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 174
    .line 175
    const-string v2, "local_soul_match_tags"

    .line 176
    .line 177
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-nez v0, :cond_3

    .line 182
    .line 183
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 184
    .line 185
    const-string v2, "local_soul_match_like"

    .line 186
    .line 187
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 188
    .line 189
    .line 190
    move-result v0

    .line 191
    if-nez v0, :cond_3

    .line 192
    .line 193
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 194
    .line 195
    const-string v2, "local_break_ice"

    .line 196
    .line 197
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_3

    .line 202
    .line 203
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 204
    .line 205
    const-string v2, "local_soul_match_profile_limit"

    .line 206
    .line 207
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-nez v0, :cond_3

    .line 212
    .line 213
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 214
    .line 215
    const-string v2, "local_chanllenge_tips"

    .line 216
    .line 217
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    if-nez v0, :cond_3

    .line 222
    .line 223
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 224
    .line 225
    const-string v2, "wanwan_tip"

    .line 226
    .line 227
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-nez v0, :cond_3

    .line 232
    .line 233
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 234
    .line 235
    const-string v2, "local_push_switch"

    .line 236
    .line 237
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    if-nez v0, :cond_3

    .line 242
    .line 243
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 244
    .line 245
    const-string v2, "local_love_buzz_break_ice"

    .line 246
    .line 247
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    if-nez v0, :cond_3

    .line 252
    .line 253
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 254
    .line 255
    const-string v2, "local_chat_assistant_question_new"

    .line 256
    .line 257
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-nez v0, :cond_3

    .line 262
    .line 263
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 264
    .line 265
    const-string v2, "chat_assistant_question"

    .line 266
    .line 267
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    if-nez v0, :cond_3

    .line 272
    .line 273
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 274
    .line 275
    const-string v2, "local_birthday_tip"

    .line 276
    .line 277
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 278
    .line 279
    .line 280
    move-result v0

    .line 281
    if-nez v0, :cond_3

    .line 282
    .line 283
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 284
    .line 285
    const-string v2, "local_platinum_pin_guide"

    .line 286
    .line 287
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    if-nez v0, :cond_3

    .line 292
    .line 293
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 294
    .line 295
    const-string v2, "local_wechat_notify_guide"

    .line 296
    .line 297
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    if-nez v0, :cond_3

    .line 302
    .line 303
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 304
    .line 305
    const-string v2, "local_pic_cert_guide"

    .line 306
    .line 307
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    if-nez v0, :cond_3

    .line 312
    .line 313
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 314
    .line 315
    const-string v2, "local_blindbox_guide"

    .line 316
    .line 317
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    if-nez v0, :cond_3

    .line 322
    .line 323
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 324
    .line 325
    const-string v2, "local_visitor_hide_footprint"

    .line 326
    .line 327
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 328
    .line 329
    .line 330
    move-result v0

    .line 331
    if-nez v0, :cond_3

    .line 332
    .line 333
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 334
    .line 335
    const-string v2, "local_intl_prompt_message_type"

    .line 336
    .line 337
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 338
    .line 339
    .line 340
    move-result v0

    .line 341
    if-nez v0, :cond_3

    .line 342
    .line 343
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 344
    .line 345
    const-string v2, "local_ux_questionnaire"

    .line 346
    .line 347
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 348
    .line 349
    .line 350
    move-result v0

    .line 351
    if-nez v0, :cond_3

    .line 352
    .line 353
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 354
    .line 355
    const-string v2, "local_ux_questionnaire_tip"

    .line 356
    .line 357
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 358
    .line 359
    .line 360
    move-result v0

    .line 361
    if-nez v0, :cond_3

    .line 362
    .line 363
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 364
    .line 365
    const-string v2, "local_intl_read_receipts_guide"

    .line 366
    .line 367
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 368
    .line 369
    .line 370
    move-result v0

    .line 371
    if-nez v0, :cond_3

    .line 372
    .line 373
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 374
    .line 375
    const-string v2, "local_o_diamond_visitor_guide"

    .line 376
    .line 377
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 378
    .line 379
    .line 380
    move-result v0

    .line 381
    if-eqz v0, :cond_0

    .line 382
    .line 383
    goto :goto_0

    .line 384
    :cond_0
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 385
    .line 386
    const-string v2, "fake_id_"

    .line 387
    .line 388
    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 389
    .line 390
    .line 391
    move-result v0

    .line 392
    if-eqz v0, :cond_2

    .line 393
    .line 394
    iget p0, p0, Lcom/p1/mobile/putong/core/data/Message;->localCreatedSession:I

    .line 395
    .line 396
    sget-object v0, Lcom/p1/mobile/android/app/App;->i:Ll/vxd0;

    .line 397
    .line 398
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    check-cast v0, Ljava/lang/Integer;

    .line 403
    .line 404
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 405
    .line 406
    .line 407
    move-result v0

    .line 408
    if-ne p0, v0, :cond_1

    .line 409
    .line 410
    const-string p0, "sending"

    .line 411
    .line 412
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LocalStatus;

    .line 413
    .line 414
    .line 415
    move-result-object p0

    .line 416
    return-object p0

    .line 417
    :cond_1
    const-string p0, "failed"

    .line 418
    .line 419
    invoke-static {p0}, Lcom/p1/mobile/putong/data/LocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LocalStatus;

    .line 420
    .line 421
    .line 422
    move-result-object p0

    .line 423
    return-object p0

    .line 424
    :cond_2
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LocalStatus;

    .line 425
    .line 426
    .line 427
    move-result-object p0

    .line 428
    return-object p0

    .line 429
    :cond_3
    :goto_0
    invoke-static {v1}, Lcom/p1/mobile/putong/data/LocalStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LocalStatus;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    return-object p0
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/Message;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public video()Lcom/p1/mobile/putong/data/Video;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 19
    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/p1/mobile/putong/data/Video;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method
