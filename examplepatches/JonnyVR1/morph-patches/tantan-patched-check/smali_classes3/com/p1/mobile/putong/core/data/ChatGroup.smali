.class public Lcom/p1/mobile/putong/core/data/ChatGroup;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/DbObject<",
        "Lcom/p1/mobile/putong/core/data/ChatGroup;",
        ">;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static final ADMINLIMIT:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final ADMINUSERIDS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final ANNOUNCEMENT:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final AVATARS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final CATEGORY_BACKGROUNDCOLOR:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final CATEGORY_HIDDEN:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final CATEGORY_ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final CATEGORY_NAME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final CATEGORY_TEXTCOLOR:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final CREATORUSERID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static DB_ADAPTER:Ll/vzf0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final DESCRIPTION:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final DURATION:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final EXPIREDTIME:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUPAPPLY_CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUPAPPLY_GROUPID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUPAPPLY_ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUPAPPLY_REASON:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUPAPPLY_STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Lcom/p1/mobile/putong/core/data/GroupApplyStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUPAPPLY_UPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUPAPPLY_USERID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUPTOPIC_ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUPTOPIC_MEDIAS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final GROUPTOPIC_OWNER:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUPTOPIC_VALUE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final GROUPTYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Lcom/p1/mobile/putong/core/data/ChatGroupType;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final INMODERATION_DESCRIPTION:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final INMODERATION_NAME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final INMODERATION_NICKNAME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final JOINCONDITION:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Lcom/p1/mobile/putong/core/data/JoinCondition;",
            ">;"
        }
    .end annotation
.end field

.field public static final JOINREMAINEDTIME:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALCONID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALMEMBERSLOADED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final MEMBERCOUNT:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final MEMBERIDS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final MEMBERLIMIT:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final MEMBERSTATISTICS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final NAME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final ONLINECOUNT:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final OWNERUSERID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final PERMISSIONS_CANCHANGEJOINCONDITION:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final PERMISSIONS_CANSHARETOTANTAN:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final PERMISSIONS_CANSHARETOWECHAT:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final PUBLICID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final PUNISHMENT_SENDMESSAGE_ACTIVE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final PUNISHMENT_SENDMESSAGE_UNTIL:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final PUNISHMENT_SENDREDPACKET_ACTIVE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final SHARETOKEN:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final SILENCE_DURATION:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final SILENCE_ENABLE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final SILENCE_UNTIL:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final SOURCE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Lcom/p1/mobile/putong/core/data/ChatGroupStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static final TAGS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupTag;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final TOKEN:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE:Ljava/lang/String; = "chatgroup"

.field public static final UPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final UPGRADED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/core/data/ChatGroup;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public adminLimit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x55
    .end annotation
.end field

.field public adminUserIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public announcement:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public avatars:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Picture;",
            ">;"
        }
    .end annotation
.end field

.field public category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x44
    .end annotation
.end field

.field public createdTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public creatorUserId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation
.end field

.field public description:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x45
    .end annotation
.end field

.field public duration:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x52
    .end annotation
.end field

.field public expiredTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4c
    .end annotation
.end field

.field public groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x47
    .end annotation
.end field

.field public groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x50
    .end annotation
.end field

.field public groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public inModeration:Lcom/p1/mobile/putong/core/data/InModeration;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x57
    .end annotation
.end field

.field public joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x53
    .end annotation
.end field

.field public joinRemainedTime:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4d
    .end annotation
.end field

.field public localConId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation
.end field

.field public localMembersLoaded:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x42
    .end annotation
.end field

.field public memberCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public memberIds:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public memberLimit:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public memberStatistics:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;",
            ">;"
        }
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public onlineCount:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x54
    .end annotation
.end field

.field public ownerUserId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
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

.field public permissions:Lcom/p1/mobile/putong/core/data/Permissions;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x56
    .end annotation
.end field

.field public publicId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x43
    .end annotation
.end field

.field public punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x49
    .end annotation
.end field

.field private requestUrl:Ljava/lang/String;

.field public shareToken:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x58
    .end annotation
.end field

.field public silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x48
    .end annotation
.end field

.field public source:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4e
    .end annotation
.end field

.field public status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public tags:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x46
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/data/ChatGroupTag;",
            ">;"
        }
    .end annotation
.end field

.field public token:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4f
    .end annotation
.end field

.field public updatedTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation
.end field

.field public upgraded:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x51
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$1;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatGroup$1;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$2;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatGroup$2;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 14
    .line 15
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$3;

    .line 16
    .line 17
    const-string v1, "_id"

    .line 18
    .line 19
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$3;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 23
    .line 24
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$4;

    .line 25
    .line 26
    const-string v1, "id_c"

    .line 27
    .line 28
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$4;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$5;

    .line 34
    .line 35
    const-string v1, "name_c"

    .line 36
    .line 37
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$5;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->NAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 41
    .line 42
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$6;

    .line 43
    .line 44
    const-string v1, "avatars_c"

    .line 45
    .line 46
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$6;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->AVATARS:Lcom/tantanapp/common/data/orm/Column;

    .line 50
    .line 51
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$7;

    .line 52
    .line 53
    const-string v1, "announcement_c"

    .line 54
    .line 55
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$7;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ANNOUNCEMENT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 59
    .line 60
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$8;

    .line 61
    .line 62
    const-string v1, "status_c"

    .line 63
    .line 64
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 65
    .line 66
    const-string v3, "str_status_c"

    .line 67
    .line 68
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ChatGroup$8;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 69
    .line 70
    .line 71
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 72
    .line 73
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$9;

    .line 74
    .line 75
    const-string v1, "localConId_c"

    .line 76
    .line 77
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$9;-><init>(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->LOCALCONID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 81
    .line 82
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$10;

    .line 83
    .line 84
    const-string v1, "ownerUserId_c"

    .line 85
    .line 86
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$10;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->OWNERUSERID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 90
    .line 91
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$11;

    .line 92
    .line 93
    const-string v1, "adminUserIds_c"

    .line 94
    .line 95
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$11;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ADMINUSERIDS:Lcom/tantanapp/common/data/orm/Column;

    .line 99
    .line 100
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$12;

    .line 101
    .line 102
    const-string v1, "creatorUserId_c"

    .line 103
    .line 104
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$12;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->CREATORUSERID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 108
    .line 109
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$13;

    .line 110
    .line 111
    const-string v1, "groupType_c"

    .line 112
    .line 113
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGroupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 114
    .line 115
    const-string v3, "str_groupType_c"

    .line 116
    .line 117
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ChatGroup$13;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 118
    .line 119
    .line 120
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->GROUPTYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 121
    .line 122
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$14;

    .line 123
    .line 124
    const-string v1, "memberIds_c"

    .line 125
    .line 126
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$14;-><init>(Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->MEMBERIDS:Lcom/tantanapp/common/data/orm/Column;

    .line 130
    .line 131
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$15;

    .line 132
    .line 133
    const-string v1, "memberCount_c"

    .line 134
    .line 135
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$15;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->MEMBERCOUNT:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 139
    .line 140
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$16;

    .line 141
    .line 142
    const-string v1, "memberLimit_c"

    .line 143
    .line 144
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$16;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->MEMBERLIMIT:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 148
    .line 149
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$17;

    .line 150
    .line 151
    const-string v1, "memberStatistics_c"

    .line 152
    .line 153
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$17;-><init>(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->MEMBERSTATISTICS:Lcom/tantanapp/common/data/orm/Column;

    .line 157
    .line 158
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$18;

    .line 159
    .line 160
    const-string v1, "createdTime_c"

    .line 161
    .line 162
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$18;-><init>(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 166
    .line 167
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$19;

    .line 168
    .line 169
    const-string v1, "updatedTime_c"

    .line 170
    .line 171
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$19;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->UPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 175
    .line 176
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$20;

    .line 177
    .line 178
    const-string v1, "localMembersLoaded_c"

    .line 179
    .line 180
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$20;-><init>(Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->LOCALMEMBERSLOADED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 184
    .line 185
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$21;

    .line 186
    .line 187
    const-string v1, "publicId_c"

    .line 188
    .line 189
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$21;-><init>(Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->PUBLICID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 193
    .line 194
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$22;

    .line 195
    .line 196
    const-string v1, "category_id_c"

    .line 197
    .line 198
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$22;-><init>(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->CATEGORY_ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 202
    .line 203
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$23;

    .line 204
    .line 205
    const-string v1, "category_name_c"

    .line 206
    .line 207
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$23;-><init>(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->CATEGORY_NAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 211
    .line 212
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$24;

    .line 213
    .line 214
    const-string v1, "category_backgroundColor_c"

    .line 215
    .line 216
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$24;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->CATEGORY_BACKGROUNDCOLOR:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 220
    .line 221
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$25;

    .line 222
    .line 223
    const-string v1, "category_textColor_c"

    .line 224
    .line 225
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$25;-><init>(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->CATEGORY_TEXTCOLOR:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 229
    .line 230
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$26;

    .line 231
    .line 232
    const-string v1, "category_hidden_c"

    .line 233
    .line 234
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$26;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->CATEGORY_HIDDEN:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 238
    .line 239
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$27;

    .line 240
    .line 241
    const-string v1, "description_c"

    .line 242
    .line 243
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$27;-><init>(Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->DESCRIPTION:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 247
    .line 248
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$28;

    .line 249
    .line 250
    const-string v1, "tags_c"

    .line 251
    .line 252
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$28;-><init>(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->TAGS:Lcom/tantanapp/common/data/orm/Column;

    .line 256
    .line 257
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$29;

    .line 258
    .line 259
    const-string v1, "groupApply_id_c"

    .line 260
    .line 261
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$29;-><init>(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->GROUPAPPLY_ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 265
    .line 266
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$30;

    .line 267
    .line 268
    const-string v1, "groupApply_userId_c"

    .line 269
    .line 270
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$30;-><init>(Ljava/lang/String;)V

    .line 271
    .line 272
    .line 273
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->GROUPAPPLY_USERID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 274
    .line 275
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$31;

    .line 276
    .line 277
    const-string v1, "groupApply_groupId_c"

    .line 278
    .line 279
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$31;-><init>(Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->GROUPAPPLY_GROUPID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 283
    .line 284
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$32;

    .line 285
    .line 286
    const-string v1, "groupApply_reason_c"

    .line 287
    .line 288
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$32;-><init>(Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->GROUPAPPLY_REASON:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 292
    .line 293
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$33;

    .line 294
    .line 295
    const-string v1, "groupApply_status_c"

    .line 296
    .line 297
    sget-object v2, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 298
    .line 299
    const-string v3, "str_groupApply_status_c"

    .line 300
    .line 301
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ChatGroup$33;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 302
    .line 303
    .line 304
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->GROUPAPPLY_STATUS:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 305
    .line 306
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$34;

    .line 307
    .line 308
    const-string v1, "groupApply_createdTime_c"

    .line 309
    .line 310
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$34;-><init>(Ljava/lang/String;)V

    .line 311
    .line 312
    .line 313
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->GROUPAPPLY_CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 314
    .line 315
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$35;

    .line 316
    .line 317
    const-string v1, "groupApply_updatedTime_c"

    .line 318
    .line 319
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$35;-><init>(Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->GROUPAPPLY_UPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 323
    .line 324
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$36;

    .line 325
    .line 326
    const-string v1, "silence_enable_c"

    .line 327
    .line 328
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$36;-><init>(Ljava/lang/String;)V

    .line 329
    .line 330
    .line 331
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->SILENCE_ENABLE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 332
    .line 333
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$37;

    .line 334
    .line 335
    const-string v1, "silence_duration_c"

    .line 336
    .line 337
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$37;-><init>(Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->SILENCE_DURATION:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 341
    .line 342
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$38;

    .line 343
    .line 344
    const-string v1, "silence_until_c"

    .line 345
    .line 346
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$38;-><init>(Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->SILENCE_UNTIL:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 350
    .line 351
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$39;

    .line 352
    .line 353
    const-string v1, "punishment_sendMessage_active_c"

    .line 354
    .line 355
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$39;-><init>(Ljava/lang/String;)V

    .line 356
    .line 357
    .line 358
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->PUNISHMENT_SENDMESSAGE_ACTIVE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 359
    .line 360
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$40;

    .line 361
    .line 362
    const-string v1, "punishment_sendMessage_until_c"

    .line 363
    .line 364
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$40;-><init>(Ljava/lang/String;)V

    .line 365
    .line 366
    .line 367
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->PUNISHMENT_SENDMESSAGE_UNTIL:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 368
    .line 369
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$41;

    .line 370
    .line 371
    const-string v1, "punishment_sendRedPacket_active_c"

    .line 372
    .line 373
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$41;-><init>(Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->PUNISHMENT_SENDREDPACKET_ACTIVE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 377
    .line 378
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$42;

    .line 379
    .line 380
    const-string v1, "expiredTime_c"

    .line 381
    .line 382
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$42;-><init>(Ljava/lang/String;)V

    .line 383
    .line 384
    .line 385
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->EXPIREDTIME:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 386
    .line 387
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$43;

    .line 388
    .line 389
    const-string v1, "joinRemainedTime_c"

    .line 390
    .line 391
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$43;-><init>(Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->JOINREMAINEDTIME:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 395
    .line 396
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$44;

    .line 397
    .line 398
    const-string v1, "source_c"

    .line 399
    .line 400
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$44;-><init>(Ljava/lang/String;)V

    .line 401
    .line 402
    .line 403
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->SOURCE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 404
    .line 405
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$45;

    .line 406
    .line 407
    const-string v1, "token_c"

    .line 408
    .line 409
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$45;-><init>(Ljava/lang/String;)V

    .line 410
    .line 411
    .line 412
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->TOKEN:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 413
    .line 414
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$46;

    .line 415
    .line 416
    const-string v1, "groupTopic_id_c"

    .line 417
    .line 418
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$46;-><init>(Ljava/lang/String;)V

    .line 419
    .line 420
    .line 421
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->GROUPTOPIC_ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 422
    .line 423
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$47;

    .line 424
    .line 425
    const-string v1, "groupTopic_owner_c"

    .line 426
    .line 427
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$47;-><init>(Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->GROUPTOPIC_OWNER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 431
    .line 432
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$48;

    .line 433
    .line 434
    const-string v1, "groupTopic_value_c"

    .line 435
    .line 436
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$48;-><init>(Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->GROUPTOPIC_VALUE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 440
    .line 441
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$49;

    .line 442
    .line 443
    const-string v1, "groupTopic_medias_c"

    .line 444
    .line 445
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$49;-><init>(Ljava/lang/String;)V

    .line 446
    .line 447
    .line 448
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->GROUPTOPIC_MEDIAS:Lcom/tantanapp/common/data/orm/Column;

    .line 449
    .line 450
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$50;

    .line 451
    .line 452
    const-string v1, "upgraded_c"

    .line 453
    .line 454
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$50;-><init>(Ljava/lang/String;)V

    .line 455
    .line 456
    .line 457
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->UPGRADED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 458
    .line 459
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$51;

    .line 460
    .line 461
    const-string v1, "duration_c"

    .line 462
    .line 463
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$51;-><init>(Ljava/lang/String;)V

    .line 464
    .line 465
    .line 466
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->DURATION:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 467
    .line 468
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$52;

    .line 469
    .line 470
    const/4 v1, 0x0

    .line 471
    sget-object v2, Lcom/p1/mobile/putong/core/data/JoinCondition;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 472
    .line 473
    const-string v3, "joinCondition_c"

    .line 474
    .line 475
    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/core/data/ChatGroup$52;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    .line 476
    .line 477
    .line 478
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->JOINCONDITION:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 479
    .line 480
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$53;

    .line 481
    .line 482
    const-string v1, "onlineCount_c"

    .line 483
    .line 484
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$53;-><init>(Ljava/lang/String;)V

    .line 485
    .line 486
    .line 487
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ONLINECOUNT:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 488
    .line 489
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$54;

    .line 490
    .line 491
    const-string v1, "adminLimit_c"

    .line 492
    .line 493
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$54;-><init>(Ljava/lang/String;)V

    .line 494
    .line 495
    .line 496
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ADMINLIMIT:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 497
    .line 498
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$55;

    .line 499
    .line 500
    const-string v1, "permissions_canShareToWeChat_c"

    .line 501
    .line 502
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$55;-><init>(Ljava/lang/String;)V

    .line 503
    .line 504
    .line 505
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->PERMISSIONS_CANSHARETOWECHAT:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 506
    .line 507
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$56;

    .line 508
    .line 509
    const-string v1, "permissions_canShareToTantan_c"

    .line 510
    .line 511
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$56;-><init>(Ljava/lang/String;)V

    .line 512
    .line 513
    .line 514
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->PERMISSIONS_CANSHARETOTANTAN:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 515
    .line 516
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$57;

    .line 517
    .line 518
    const-string v1, "permissions_canChangeJoinCondition_c"

    .line 519
    .line 520
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$57;-><init>(Ljava/lang/String;)V

    .line 521
    .line 522
    .line 523
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->PERMISSIONS_CANCHANGEJOINCONDITION:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 524
    .line 525
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$58;

    .line 526
    .line 527
    const-string v1, "inModeration_nickName_c"

    .line 528
    .line 529
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$58;-><init>(Ljava/lang/String;)V

    .line 530
    .line 531
    .line 532
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->INMODERATION_NICKNAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 533
    .line 534
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$59;

    .line 535
    .line 536
    const-string v1, "inModeration_name_c"

    .line 537
    .line 538
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$59;-><init>(Ljava/lang/String;)V

    .line 539
    .line 540
    .line 541
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->INMODERATION_NAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 542
    .line 543
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$60;

    .line 544
    .line 545
    const-string v1, "inModeration_description_c"

    .line 546
    .line 547
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$60;-><init>(Ljava/lang/String;)V

    .line 548
    .line 549
    .line 550
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->INMODERATION_DESCRIPTION:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 551
    .line 552
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$61;

    .line 553
    .line 554
    const-string v1, "shareToken_c"

    .line 555
    .line 556
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/core/data/ChatGroup$61;-><init>(Ljava/lang/String;)V

    .line 557
    .line 558
    .line 559
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->SHARETOKEN:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 560
    .line 561
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup$62;

    .line 562
    .line 563
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatGroup$62;-><init>()V

    .line 564
    .line 565
    .line 566
    sput-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->DB_ADAPTER:Ll/vzf0;

    .line 567
    .line 568
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/DbObject;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->parseFieldSet:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/Picture;)Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->clone()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/ChatGroupTag;)Lcom/p1/mobile/putong/core/data/ChatGroupTag;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->clone()Lcom/p1/mobile/putong/core/data/ChatGroupTag;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;)Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->clone()Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/core/data/ChatGroup;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->nullCheck()V

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

    .line 257
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->clone()Lcom/p1/mobile/putong/core/data/ChatGroup;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/core/data/ChatGroup;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;-><init>()V

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    new-instance v2, Ll/qu4;

    .line 23
    .line 24
    invoke-direct {v2}, Ll/qu4;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 32
    .line 33
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 34
    .line 35
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 38
    .line 39
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 40
    .line 41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 42
    .line 43
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 46
    .line 47
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 50
    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    new-instance v2, Ll/ru4;

    .line 54
    .line 55
    invoke-direct {v2}, Ll/ru4;-><init>()V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 63
    .line 64
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 65
    .line 66
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 69
    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 71
    .line 72
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 73
    .line 74
    if-eqz v1, :cond_2

    .line 75
    .line 76
    new-instance v2, Ll/su4;

    .line 77
    .line 78
    invoke-direct {v2}, Ll/su4;-><init>()V

    .line 79
    .line 80
    .line 81
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 86
    .line 87
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 88
    .line 89
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 90
    .line 91
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 92
    .line 93
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 96
    .line 97
    if-eqz v1, :cond_3

    .line 98
    .line 99
    new-instance v2, Ll/tu4;

    .line 100
    .line 101
    invoke-direct {v2}, Ll/tu4;-><init>()V

    .line 102
    .line 103
    .line 104
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 109
    .line 110
    :cond_3
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    .line 111
    .line 112
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    .line 113
    .line 114
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    .line 115
    .line 116
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    .line 117
    .line 118
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    .line 119
    .line 120
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 123
    .line 124
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 125
    .line 126
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 127
    .line 128
    if-eqz v1, :cond_4

    .line 129
    .line 130
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->clone()Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 135
    .line 136
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 137
    .line 138
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 139
    .line 140
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 141
    .line 142
    if-eqz v1, :cond_5

    .line 143
    .line 144
    new-instance v2, Ll/uu4;

    .line 145
    .line 146
    invoke-direct {v2}, Ll/uu4;-><init>()V

    .line 147
    .line 148
    .line 149
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 154
    .line 155
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 156
    .line 157
    if-eqz v1, :cond_6

    .line 158
    .line 159
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/GroupApply;->clone()Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 160
    .line 161
    .line 162
    move-result-object v1

    .line 163
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 164
    .line 165
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 166
    .line 167
    if-eqz v1, :cond_7

    .line 168
    .line 169
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->clone()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 174
    .line 175
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 176
    .line 177
    if-eqz v1, :cond_8

    .line 178
    .line 179
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatPunishment;->clone()Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 184
    .line 185
    :cond_8
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    .line 186
    .line 187
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    .line 188
    .line 189
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    .line 190
    .line 191
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    .line 192
    .line 193
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 194
    .line 195
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 196
    .line 197
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 198
    .line 199
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 200
    .line 201
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 202
    .line 203
    if-eqz v1, :cond_9

    .line 204
    .line 205
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->clone()Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 210
    .line 211
    :cond_9
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    .line 212
    .line 213
    iput-boolean v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    .line 214
    .line 215
    iget-wide v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    .line 216
    .line 217
    iput-wide v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    .line 218
    .line 219
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 220
    .line 221
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 222
    .line 223
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 224
    .line 225
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 226
    .line 227
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 228
    .line 229
    iput v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 230
    .line 231
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 232
    .line 233
    if-eqz v1, :cond_a

    .line 234
    .line 235
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Permissions;->clone()Lcom/p1/mobile/putong/core/data/Permissions;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 240
    .line 241
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 242
    .line 243
    if-eqz v1, :cond_b

    .line 244
    .line 245
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/InModeration;->clone()Lcom/p1/mobile/putong/core/data/InModeration;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    iput-object v1, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 250
    .line 251
    :cond_b
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 252
    .line 253
    iput-object p0, v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 254
    .line 255
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 256
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->clone()Lcom/p1/mobile/putong/core/data/ChatGroup;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

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
    check-cast v1, Lcom/p1/mobile/putong/core/data/ChatGroup;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 24
    .line 25
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_3

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 34
    .line 35
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_3

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 62
    .line 63
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 72
    .line 73
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 82
    .line 83
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 92
    .line 93
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 102
    .line 103
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 112
    .line 113
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

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
    iget p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 122
    .line 123
    iget v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 124
    .line 125
    if-ne p1, v3, :cond_3

    .line 126
    .line 127
    iget p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 128
    .line 129
    iget v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 130
    .line 131
    if-ne p1, v3, :cond_3

    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 134
    .line 135
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 136
    .line 137
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_3

    .line 142
    .line 143
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    .line 144
    .line 145
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    .line 146
    .line 147
    cmpl-double p1, v3, v5

    .line 148
    .line 149
    if-nez p1, :cond_3

    .line 150
    .line 151
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    .line 152
    .line 153
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    .line 154
    .line 155
    cmpl-double p1, v3, v5

    .line 156
    .line 157
    if-nez p1, :cond_3

    .line 158
    .line 159
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    .line 160
    .line 161
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    .line 162
    .line 163
    if-ne p1, v3, :cond_3

    .line 164
    .line 165
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 166
    .line 167
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 168
    .line 169
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    if-eqz p1, :cond_3

    .line 174
    .line 175
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 176
    .line 177
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 178
    .line 179
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    if-eqz p1, :cond_3

    .line 184
    .line 185
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 186
    .line 187
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 188
    .line 189
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result p1

    .line 193
    if-eqz p1, :cond_3

    .line 194
    .line 195
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 196
    .line 197
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 198
    .line 199
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result p1

    .line 203
    if-eqz p1, :cond_3

    .line 204
    .line 205
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 206
    .line 207
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 208
    .line 209
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    move-result p1

    .line 213
    if-eqz p1, :cond_3

    .line 214
    .line 215
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 216
    .line 217
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 218
    .line 219
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    if-eqz p1, :cond_3

    .line 224
    .line 225
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 226
    .line 227
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 228
    .line 229
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result p1

    .line 233
    if-eqz p1, :cond_3

    .line 234
    .line 235
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    .line 236
    .line 237
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    .line 238
    .line 239
    cmp-long p1, v3, v5

    .line 240
    .line 241
    if-nez p1, :cond_3

    .line 242
    .line 243
    iget p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    .line 244
    .line 245
    iget v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    .line 246
    .line 247
    if-ne p1, v3, :cond_3

    .line 248
    .line 249
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 250
    .line 251
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 252
    .line 253
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 254
    .line 255
    .line 256
    move-result p1

    .line 257
    if-eqz p1, :cond_3

    .line 258
    .line 259
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 260
    .line 261
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 262
    .line 263
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result p1

    .line 267
    if-eqz p1, :cond_3

    .line 268
    .line 269
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 270
    .line 271
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 272
    .line 273
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result p1

    .line 277
    if-eqz p1, :cond_3

    .line 278
    .line 279
    iget-boolean p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    .line 280
    .line 281
    iget-boolean v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    .line 282
    .line 283
    if-ne p1, v3, :cond_3

    .line 284
    .line 285
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    .line 286
    .line 287
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    .line 288
    .line 289
    cmp-long p1, v3, v5

    .line 290
    .line 291
    if-nez p1, :cond_3

    .line 292
    .line 293
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 294
    .line 295
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 296
    .line 297
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    if-eqz p1, :cond_3

    .line 302
    .line 303
    iget p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 304
    .line 305
    iget v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 306
    .line 307
    if-ne p1, v3, :cond_3

    .line 308
    .line 309
    iget p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 310
    .line 311
    iget v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 312
    .line 313
    if-ne p1, v3, :cond_3

    .line 314
    .line 315
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 316
    .line 317
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 318
    .line 319
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 320
    .line 321
    .line 322
    move-result p1

    .line 323
    if-eqz p1, :cond_3

    .line 324
    .line 325
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 326
    .line 327
    iget-object v3, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 328
    .line 329
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 330
    .line 331
    .line 332
    move-result p1

    .line 333
    if-eqz p1, :cond_3

    .line 334
    .line 335
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 336
    .line 337
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 338
    .line 339
    invoke-static {p0, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result p0

    .line 343
    if-eqz p0, :cond_3

    .line 344
    .line 345
    return v0

    .line 346
    :cond_3
    return v2
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "chatgroup"

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 10

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_1b

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v1

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
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    goto :goto_1

    .line 34
    :cond_1
    move v1, v2

    .line 35
    :goto_1
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x29

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    goto :goto_2

    .line 47
    :cond_2
    move v1, v2

    .line 48
    :goto_2
    add-int/2addr v0, v1

    .line 49
    mul-int/lit8 v0, v0, 0x29

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 56
    .line 57
    .line 58
    move-result v1

    .line 59
    goto :goto_3

    .line 60
    :cond_3
    move v1, v2

    .line 61
    :goto_3
    add-int/2addr v0, v1

    .line 62
    mul-int/lit8 v0, v0, 0x29

    .line 63
    .line 64
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    goto :goto_4

    .line 73
    :cond_4
    move v1, v2

    .line 74
    :goto_4
    add-int/2addr v0, v1

    .line 75
    mul-int/lit8 v0, v0, 0x29

    .line 76
    .line 77
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 78
    .line 79
    if-eqz v1, :cond_5

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    goto :goto_5

    .line 86
    :cond_5
    move v1, v2

    .line 87
    :goto_5
    add-int/2addr v0, v1

    .line 88
    mul-int/lit8 v0, v0, 0x29

    .line 89
    .line 90
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 91
    .line 92
    if-eqz v1, :cond_6

    .line 93
    .line 94
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    goto :goto_6

    .line 99
    :cond_6
    move v1, v2

    .line 100
    :goto_6
    add-int/2addr v0, v1

    .line 101
    mul-int/lit8 v0, v0, 0x29

    .line 102
    .line 103
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz v1, :cond_7

    .line 106
    .line 107
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    goto :goto_7

    .line 112
    :cond_7
    move v1, v2

    .line 113
    :goto_7
    add-int/2addr v0, v1

    .line 114
    mul-int/lit8 v0, v0, 0x29

    .line 115
    .line 116
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 117
    .line 118
    if-eqz v1, :cond_8

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    goto :goto_8

    .line 125
    :cond_8
    move v1, v2

    .line 126
    :goto_8
    add-int/2addr v0, v1

    .line 127
    mul-int/lit8 v0, v0, 0x29

    .line 128
    .line 129
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 130
    .line 131
    if-eqz v1, :cond_9

    .line 132
    .line 133
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 134
    .line 135
    .line 136
    move-result v1

    .line 137
    goto :goto_9

    .line 138
    :cond_9
    move v1, v2

    .line 139
    :goto_9
    add-int/2addr v0, v1

    .line 140
    mul-int/lit8 v0, v0, 0x29

    .line 141
    .line 142
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 143
    .line 144
    add-int/2addr v0, v1

    .line 145
    mul-int/lit8 v0, v0, 0x29

    .line 146
    .line 147
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 148
    .line 149
    add-int/2addr v0, v1

    .line 150
    mul-int/lit8 v0, v0, 0x29

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 153
    .line 154
    if-eqz v1, :cond_a

    .line 155
    .line 156
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    goto :goto_a

    .line 161
    :cond_a
    move v1, v2

    .line 162
    :goto_a
    add-int/2addr v0, v1

    .line 163
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    .line 164
    .line 165
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 166
    .line 167
    .line 168
    move-result-wide v3

    .line 169
    mul-int/lit8 v0, v0, 0x29

    .line 170
    .line 171
    const/16 v1, 0x20

    .line 172
    .line 173
    ushr-long v5, v3, v1

    .line 174
    .line 175
    xor-long/2addr v3, v5

    .line 176
    long-to-int v3, v3

    .line 177
    add-int/2addr v0, v3

    .line 178
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    .line 179
    .line 180
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 181
    .line 182
    .line 183
    move-result-wide v3

    .line 184
    mul-int/lit8 v0, v0, 0x29

    .line 185
    .line 186
    ushr-long v5, v3, v1

    .line 187
    .line 188
    xor-long/2addr v3, v5

    .line 189
    long-to-int v3, v3

    .line 190
    add-int/2addr v0, v3

    .line 191
    mul-int/lit8 v0, v0, 0x29

    .line 192
    .line 193
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    .line 194
    .line 195
    const/16 v4, 0x4d5

    .line 196
    .line 197
    const/16 v5, 0x4cf

    .line 198
    .line 199
    if-eqz v3, :cond_b

    .line 200
    .line 201
    move v3, v5

    .line 202
    goto :goto_b

    .line 203
    :cond_b
    move v3, v4

    .line 204
    :goto_b
    add-int/2addr v0, v3

    .line 205
    mul-int/lit8 v0, v0, 0x29

    .line 206
    .line 207
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 208
    .line 209
    if-eqz v3, :cond_c

    .line 210
    .line 211
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    goto :goto_c

    .line 216
    :cond_c
    move v3, v2

    .line 217
    :goto_c
    add-int/2addr v0, v3

    .line 218
    mul-int/lit8 v0, v0, 0x29

    .line 219
    .line 220
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 221
    .line 222
    if-eqz v3, :cond_d

    .line 223
    .line 224
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->hashCode()I

    .line 225
    .line 226
    .line 227
    move-result v3

    .line 228
    goto :goto_d

    .line 229
    :cond_d
    move v3, v2

    .line 230
    :goto_d
    add-int/2addr v0, v3

    .line 231
    mul-int/lit8 v0, v0, 0x29

    .line 232
    .line 233
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 234
    .line 235
    if-eqz v3, :cond_e

    .line 236
    .line 237
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 238
    .line 239
    .line 240
    move-result v3

    .line 241
    goto :goto_e

    .line 242
    :cond_e
    move v3, v2

    .line 243
    :goto_e
    add-int/2addr v0, v3

    .line 244
    mul-int/lit8 v0, v0, 0x29

    .line 245
    .line 246
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 247
    .line 248
    if-eqz v3, :cond_f

    .line 249
    .line 250
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 251
    .line 252
    .line 253
    move-result v3

    .line 254
    goto :goto_f

    .line 255
    :cond_f
    move v3, v2

    .line 256
    :goto_f
    add-int/2addr v0, v3

    .line 257
    mul-int/lit8 v0, v0, 0x29

    .line 258
    .line 259
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 260
    .line 261
    if-eqz v3, :cond_10

    .line 262
    .line 263
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/GroupApply;->hashCode()I

    .line 264
    .line 265
    .line 266
    move-result v3

    .line 267
    goto :goto_10

    .line 268
    :cond_10
    move v3, v2

    .line 269
    :goto_10
    add-int/2addr v0, v3

    .line 270
    mul-int/lit8 v0, v0, 0x29

    .line 271
    .line 272
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 273
    .line 274
    if-eqz v3, :cond_11

    .line 275
    .line 276
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->hashCode()I

    .line 277
    .line 278
    .line 279
    move-result v3

    .line 280
    goto :goto_11

    .line 281
    :cond_11
    move v3, v2

    .line 282
    :goto_11
    add-int/2addr v0, v3

    .line 283
    mul-int/lit8 v0, v0, 0x29

    .line 284
    .line 285
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 286
    .line 287
    if-eqz v3, :cond_12

    .line 288
    .line 289
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ChatPunishment;->hashCode()I

    .line 290
    .line 291
    .line 292
    move-result v3

    .line 293
    goto :goto_12

    .line 294
    :cond_12
    move v3, v2

    .line 295
    :goto_12
    add-int/2addr v0, v3

    .line 296
    mul-int/lit8 v0, v0, 0x29

    .line 297
    .line 298
    iget-wide v6, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    .line 299
    .line 300
    ushr-long v8, v6, v1

    .line 301
    .line 302
    xor-long/2addr v6, v8

    .line 303
    long-to-int v3, v6

    .line 304
    add-int/2addr v0, v3

    .line 305
    mul-int/lit8 v0, v0, 0x29

    .line 306
    .line 307
    iget v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    .line 308
    .line 309
    add-int/2addr v0, v3

    .line 310
    mul-int/lit8 v0, v0, 0x29

    .line 311
    .line 312
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 313
    .line 314
    if-eqz v3, :cond_13

    .line 315
    .line 316
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 317
    .line 318
    .line 319
    move-result v3

    .line 320
    goto :goto_13

    .line 321
    :cond_13
    move v3, v2

    .line 322
    :goto_13
    add-int/2addr v0, v3

    .line 323
    mul-int/lit8 v0, v0, 0x29

    .line 324
    .line 325
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 326
    .line 327
    if-eqz v3, :cond_14

    .line 328
    .line 329
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 330
    .line 331
    .line 332
    move-result v3

    .line 333
    goto :goto_14

    .line 334
    :cond_14
    move v3, v2

    .line 335
    :goto_14
    add-int/2addr v0, v3

    .line 336
    mul-int/lit8 v0, v0, 0x29

    .line 337
    .line 338
    iget-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 339
    .line 340
    if-eqz v3, :cond_15

    .line 341
    .line 342
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->hashCode()I

    .line 343
    .line 344
    .line 345
    move-result v3

    .line 346
    goto :goto_15

    .line 347
    :cond_15
    move v3, v2

    .line 348
    :goto_15
    add-int/2addr v0, v3

    .line 349
    mul-int/lit8 v0, v0, 0x29

    .line 350
    .line 351
    iget-boolean v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    .line 352
    .line 353
    if-eqz v3, :cond_16

    .line 354
    .line 355
    move v4, v5

    .line 356
    :cond_16
    add-int/2addr v0, v4

    .line 357
    mul-int/lit8 v0, v0, 0x29

    .line 358
    .line 359
    iget-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    .line 360
    .line 361
    ushr-long v5, v3, v1

    .line 362
    .line 363
    xor-long/2addr v3, v5

    .line 364
    long-to-int v1, v3

    .line 365
    add-int/2addr v0, v1

    .line 366
    mul-int/lit8 v0, v0, 0x29

    .line 367
    .line 368
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 369
    .line 370
    if-eqz v1, :cond_17

    .line 371
    .line 372
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 373
    .line 374
    .line 375
    move-result v1

    .line 376
    goto :goto_16

    .line 377
    :cond_17
    move v1, v2

    .line 378
    :goto_16
    add-int/2addr v0, v1

    .line 379
    mul-int/lit8 v0, v0, 0x29

    .line 380
    .line 381
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 382
    .line 383
    add-int/2addr v0, v1

    .line 384
    mul-int/lit8 v0, v0, 0x29

    .line 385
    .line 386
    iget v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 387
    .line 388
    add-int/2addr v0, v1

    .line 389
    mul-int/lit8 v0, v0, 0x29

    .line 390
    .line 391
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 392
    .line 393
    if-eqz v1, :cond_18

    .line 394
    .line 395
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/Permissions;->hashCode()I

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    goto :goto_17

    .line 400
    :cond_18
    move v1, v2

    .line 401
    :goto_17
    add-int/2addr v0, v1

    .line 402
    mul-int/lit8 v0, v0, 0x29

    .line 403
    .line 404
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 405
    .line 406
    if-eqz v1, :cond_19

    .line 407
    .line 408
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/InModeration;->hashCode()I

    .line 409
    .line 410
    .line 411
    move-result v1

    .line 412
    goto :goto_18

    .line 413
    :cond_19
    move v1, v2

    .line 414
    :goto_18
    add-int/2addr v0, v1

    .line 415
    mul-int/lit8 v0, v0, 0x29

    .line 416
    .line 417
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 418
    .line 419
    if-eqz v1, :cond_1a

    .line 420
    .line 421
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 422
    .line 423
    .line 424
    move-result v2

    .line 425
    :cond_1a
    add-int/2addr v0, v2

    .line 426
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 427
    .line 428
    :cond_1b
    return v0
.end method

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->parseFieldSet:Ljava/util/HashSet;

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

.method public mergeData(Lcom/p1/mobile/putong/core/data/ChatGroup;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/data/ValueObject;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_24

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ChatGroup;->equals(Ljava/lang/Object;)Z

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
    const-string v0, "name"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    const-string v0, "avatars"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 38
    .line 39
    :cond_2
    const-string v0, "announcement"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 50
    .line 51
    :cond_3
    const-string v0, "status"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 62
    .line 63
    :cond_4
    const-string v0, "localConId"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 74
    .line 75
    :cond_5
    const-string v0, "ownerUserId"

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_6

    .line 82
    .line 83
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 84
    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 86
    .line 87
    :cond_6
    const-string v0, "adminUserIds"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_7

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 98
    .line 99
    :cond_7
    const-string v0, "creatorUserId"

    .line 100
    .line 101
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_8

    .line 106
    .line 107
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 108
    .line 109
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 110
    .line 111
    :cond_8
    const-string v0, "type"

    .line 112
    .line 113
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_9

    .line 118
    .line 119
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 122
    .line 123
    :cond_9
    const-string v0, "memberIds"

    .line 124
    .line 125
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-nez v0, :cond_a

    .line 130
    .line 131
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 134
    .line 135
    :cond_a
    const-string v0, "memberCount"

    .line 136
    .line 137
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_b

    .line 142
    .line 143
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 144
    .line 145
    iput v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 146
    .line 147
    :cond_b
    const-string v0, "memberLimit"

    .line 148
    .line 149
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_c

    .line 154
    .line 155
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 156
    .line 157
    iput v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 158
    .line 159
    :cond_c
    const-string v0, "memberStatistics"

    .line 160
    .line 161
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    if-nez v0, :cond_d

    .line 166
    .line 167
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 168
    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 170
    .line 171
    :cond_d
    const-string v0, "createdTime"

    .line 172
    .line 173
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-nez v0, :cond_e

    .line 178
    .line 179
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    .line 180
    .line 181
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    .line 182
    .line 183
    :cond_e
    const-string v0, "updatedTime"

    .line 184
    .line 185
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_f

    .line 190
    .line 191
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    .line 192
    .line 193
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    .line 194
    .line 195
    :cond_f
    const-string v0, "localMembersLoaded"

    .line 196
    .line 197
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    if-nez v0, :cond_10

    .line 202
    .line 203
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    .line 204
    .line 205
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    .line 206
    .line 207
    :cond_10
    const-string v0, "publicId"

    .line 208
    .line 209
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-nez v0, :cond_11

    .line 214
    .line 215
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 216
    .line 217
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 218
    .line 219
    :cond_11
    const-string v0, "category"

    .line 220
    .line 221
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_12

    .line 226
    .line 227
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 228
    .line 229
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 230
    .line 231
    :cond_12
    const-string v0, "description"

    .line 232
    .line 233
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v0, :cond_13

    .line 238
    .line 239
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 240
    .line 241
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 242
    .line 243
    :cond_13
    const-string v0, "tags"

    .line 244
    .line 245
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    if-nez v0, :cond_14

    .line 250
    .line 251
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 252
    .line 253
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 254
    .line 255
    :cond_14
    const-string v0, "silence"

    .line 256
    .line 257
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    if-nez v0, :cond_15

    .line 262
    .line 263
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 264
    .line 265
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 266
    .line 267
    :cond_15
    const-string v0, "punishment"

    .line 268
    .line 269
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-nez v0, :cond_16

    .line 274
    .line 275
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 276
    .line 277
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 278
    .line 279
    :cond_16
    const-string v0, "expiredTime"

    .line 280
    .line 281
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    if-nez v0, :cond_17

    .line 286
    .line 287
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    .line 288
    .line 289
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    .line 290
    .line 291
    :cond_17
    const-string v0, "joinRemainedTime"

    .line 292
    .line 293
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    if-nez v0, :cond_18

    .line 298
    .line 299
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    .line 300
    .line 301
    iput v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    .line 302
    .line 303
    :cond_18
    const-string v0, "source"

    .line 304
    .line 305
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-nez v0, :cond_19

    .line 310
    .line 311
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 312
    .line 313
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 314
    .line 315
    :cond_19
    const-string v0, "token"

    .line 316
    .line 317
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    if-nez v0, :cond_1a

    .line 322
    .line 323
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 324
    .line 325
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 326
    .line 327
    :cond_1a
    const-string v0, "groupTopic"

    .line 328
    .line 329
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 330
    .line 331
    .line 332
    move-result v0

    .line 333
    if-nez v0, :cond_1b

    .line 334
    .line 335
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 336
    .line 337
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 338
    .line 339
    :cond_1b
    const-string v0, "upgraded"

    .line 340
    .line 341
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    if-nez v0, :cond_1c

    .line 346
    .line 347
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    .line 348
    .line 349
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    .line 350
    .line 351
    :cond_1c
    const-string v0, "duration"

    .line 352
    .line 353
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 354
    .line 355
    .line 356
    move-result v0

    .line 357
    if-nez v0, :cond_1d

    .line 358
    .line 359
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    .line 360
    .line 361
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    .line 362
    .line 363
    :cond_1d
    const-string v0, "joinCondition"

    .line 364
    .line 365
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 366
    .line 367
    .line 368
    move-result v0

    .line 369
    if-nez v0, :cond_1e

    .line 370
    .line 371
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 372
    .line 373
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 374
    .line 375
    :cond_1e
    const-string v0, "onlineCount"

    .line 376
    .line 377
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 378
    .line 379
    .line 380
    move-result v0

    .line 381
    if-nez v0, :cond_1f

    .line 382
    .line 383
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 384
    .line 385
    iput v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 386
    .line 387
    :cond_1f
    const-string v0, "adminLimit"

    .line 388
    .line 389
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 390
    .line 391
    .line 392
    move-result v0

    .line 393
    if-nez v0, :cond_20

    .line 394
    .line 395
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 396
    .line 397
    iput v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 398
    .line 399
    :cond_20
    const-string v0, "permissions"

    .line 400
    .line 401
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 402
    .line 403
    .line 404
    move-result v0

    .line 405
    if-nez v0, :cond_21

    .line 406
    .line 407
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 408
    .line 409
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 410
    .line 411
    :cond_21
    const-string v0, "inModeration"

    .line 412
    .line 413
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 414
    .line 415
    .line 416
    move-result v0

    .line 417
    if-nez v0, :cond_22

    .line 418
    .line 419
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 420
    .line 421
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 422
    .line 423
    :cond_22
    const-string v0, "shareToken"

    .line 424
    .line 425
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/data/ChatGroup;->isFieldParsed(Ljava/lang/String;)Z

    .line 426
    .line 427
    .line 428
    move-result v0

    .line 429
    if-nez v0, :cond_23

    .line 430
    .line 431
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 432
    .line 433
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 434
    .line 435
    :cond_23
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->parseFieldSet:Ljava/util/HashSet;

    .line 436
    .line 437
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 438
    .line 439
    .line 440
    :cond_24
    :goto_0
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 441
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ChatGroup;->mergeData(Lcom/p1/mobile/putong/core/data/ChatGroup;)V

    return-void
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 22
    .line 23
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 24
    .line 25
    if-nez v0, :cond_2

    .line 26
    .line 27
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 28
    .line 29
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 30
    .line 31
    if-nez v0, :cond_3

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 40
    .line 41
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 42
    .line 43
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 44
    .line 45
    if-nez v0, :cond_4

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 48
    .line 49
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 50
    .line 51
    if-nez v0, :cond_5

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 54
    .line 55
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 56
    .line 57
    if-nez v0, :cond_6

    .line 58
    .line 59
    new-instance v0, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 65
    .line 66
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 67
    .line 68
    if-nez v0, :cond_7

    .line 69
    .line 70
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 71
    .line 72
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 73
    .line 74
    if-nez v0, :cond_8

    .line 75
    .line 76
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 83
    .line 84
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 85
    .line 86
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 87
    .line 88
    if-nez v0, :cond_9

    .line 89
    .line 90
    new-instance v0, Ljava/util/ArrayList;

    .line 91
    .line 92
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 96
    .line 97
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 98
    .line 99
    if-nez v0, :cond_a

    .line 100
    .line 101
    new-instance v0, Ljava/util/ArrayList;

    .line 102
    .line 103
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 104
    .line 105
    .line 106
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 107
    .line 108
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 109
    .line 110
    if-nez v0, :cond_b

    .line 111
    .line 112
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 113
    .line 114
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 115
    .line 116
    if-nez v0, :cond_c

    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 123
    .line 124
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 125
    .line 126
    if-nez v0, :cond_d

    .line 127
    .line 128
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 129
    .line 130
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 131
    .line 132
    if-nez v0, :cond_e

    .line 133
    .line 134
    new-instance v0, Ljava/util/ArrayList;

    .line 135
    .line 136
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 137
    .line 138
    .line 139
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 140
    .line 141
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 142
    .line 143
    if-nez v0, :cond_f

    .line 144
    .line 145
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GroupApply;->new_()Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 150
    .line 151
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 152
    .line 153
    if-nez v0, :cond_10

    .line 154
    .line 155
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 156
    .line 157
    .line 158
    move-result-object v0

    .line 159
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 160
    .line 161
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 162
    .line 163
    if-nez v0, :cond_11

    .line 164
    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPunishment;->new_()Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 170
    .line 171
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 172
    .line 173
    if-nez v0, :cond_12

    .line 174
    .line 175
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 176
    .line 177
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 178
    .line 179
    if-nez v0, :cond_13

    .line 180
    .line 181
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 182
    .line 183
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 184
    .line 185
    if-nez v0, :cond_14

    .line 186
    .line 187
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 192
    .line 193
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 194
    .line 195
    if-nez v0, :cond_15

    .line 196
    .line 197
    sget-object v0, Lcom/p1/mobile/putong/core/data/JoinCondition;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 198
    .line 199
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    check-cast v0, Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 204
    .line 205
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 206
    .line 207
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 208
    .line 209
    if-nez v0, :cond_16

    .line 210
    .line 211
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Permissions;->new_()Lcom/p1/mobile/putong/core/data/Permissions;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 216
    .line 217
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 218
    .line 219
    if-nez v0, :cond_17

    .line 220
    .line 221
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InModeration;->new_()Lcom/p1/mobile/putong/core/data/InModeration;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 226
    .line 227
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 228
    .line 229
    if-nez v0, :cond_18

    .line 230
    .line 231
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 232
    .line 233
    :cond_18
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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
