.class public Lcom/p1/mobile/putong/data/User;
.super Lcom/tantanapp/common/data/DbObject;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;,
        Lcom/p1/mobile/putong/data/User$RelationStatus;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/DbObject<",
        "Lcom/p1/mobile/putong/data/User;",
        ">;",
        "Ljava/lang/Cloneable;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field public static final ABGROUPS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final ABROAD:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/UserAbroad;",
            ">;"
        }
    .end annotation
.end field

.field public static final ACTIVITYUSER_ACTION:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final ACTIVITYUSER_SCORE:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final AGE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static AGE_DEFAULT_SEARCH_MAX:I = 0x32

.field public static AGE_DEFAULT_SEARCH_MIN:I = 0x12

.field public static AGE_MAX:I = 0x64

.field public static AGE_MAX_KOREAN:I = 0x63

.field public static AGE_MIN:I = 0x10

.field public static AGE_MIN_GOOGLEPLAY:I = 0x12

.field public static AGE_MIN_KOREAN:I = 0x13

.field public static final AITAG:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final ANONYMOUSLIKE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/AnonymousLikeInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final BANSTATUS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/BanStatus;",
            ">;"
        }
    .end annotation
.end field

.field public static final CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final CREDIT:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/UserCreditData;",
            ">;"
        }
    .end annotation
.end field

.field public static final DATINGMODE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static DB_ADAPTER:Ll/vzf0; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vzf0<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final DELETED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final DESCRIPTION:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final DIAMONDVIPEXPIRESTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final DISPLAYAUDIT:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final EMPTY:I = 0x2

.field public static final FAKESTATUS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/StatusesItem;",
            ">;"
        }
    .end annotation
.end field

.field public static final FRIENDCOMMENTINFO:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/FriendCommentInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final GENDER:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/Gender;",
            ">;"
        }
    .end annotation
.end field

.field public static final GOPLACETIMESTAMP:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final HIERARCHY:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/LiveUserLevel;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final ID_AI_1V1:Ljava/lang/String; = "-10025"

.field public static final ID_AI_STORY:Ljava/lang/String; = "-10021"

.field public static final ID_CHRISTMAS_SERVICE:Ljava/lang/String; = "-10007"

.field public static final ID_INTL_LIVE_VIP_SERVICE:Ljava/lang/String; = "-11004"

.field public static final ID_LIVE_SERVICE:Ljava/lang/String; = "-11001"

.field public static final ID_LIVE_VIP_SERVICE:Ljava/lang/String; = "-11000"

.field public static final ID_ODIAMOND_SERVICE:Ljava/lang/String; = "-11006"

.field public static final ID_OFFICIAL_CHANNEL:Ljava/lang/String; = "-11005"

.field public static final ID_TEAM_ACCOUNT:Ljava/lang/String; = "-1"

.field public static final ID_TEAM_ACCOUNT_SERVICE:Ljava/lang/String; = "-10040"

.field public static final ID_VERIVICATION_ASSISTANT:Ljava/lang/String; = "-10023"

.field public static final ID_WISDOM_STAR:Ljava/lang/String; = "-10015"

.field public static final INACTIVATED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final ISLORD:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/JsonAdapter<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALDIAMONDPRIVATEMATCHTAGS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final LOCALFOLLOWSHIP:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/Followship;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALLATESTRECEIVEDMESSAGETIME:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALLIKEIDENTIFIERS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final LOCALRELATIONSHIP:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/Relationship;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCALSOULSHIP:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/SoulShip;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCAL_ID_INTL_SEE_LETTER:Ljava/lang/String; = "-770011"

.field public static final LOCATION_DISTANCE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCATION_PASSBY:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/Passby;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCATION_REGION_CITY:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCATION_REGION_COUNTRY:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCATION_REGION_DISTRICT:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCATION_REGION_PROVINCE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final LOCATION_UPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final MASKFOLLOW:I = 0x1

.field public static final MATEPLANADUSER:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final MATEPLANUSER:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final MAX_MEDIA_SIZE:I = 0x9

.field public static final ME:I = 0x4

.field public static final MEMBERSHIPS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Membership;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final MEMBERSHIP_ACTIVE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field private static MEMBERSHIP_DEFAULT_EXPIRE_TIME:I = -0x1

.field public static final MEMBERSHIP_DURATION:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final MEMBERSHIP_EXPIRESTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final MEMBERSHIP_HIDEACTIVITYTIME:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final MEMBERSHIP_HIDEVIP:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final MEMBERSHIP_NAME:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/MembershipType;",
            ">;"
        }
    .end annotation
.end field

.field public static final MEMBERSHIP_VIPBADGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/VIPBadgeType;",
            ">;"
        }
    .end annotation
.end field

.field public static final MINRICHLISTPOSITION:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final NAME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final NAMEREMARK:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final NAMESTATUS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/StatusesItem;",
            ">;"
        }
    .end annotation
.end field

.field public static NAME_MAX:I = 0x32

.field public static NAME_MIN:I = 0x1

.field public static final PEEPERSHIP:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/Membership;",
            ">;"
        }
    .end annotation
.end field

.field public static final PICKSEXPIREDTIMESTAMP:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PICKSSWIPABLE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PICKSTAG:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PICTURES:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final POPLEVEL:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PRIVATEANSWERS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/PrivateAnswer;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PRIVATEANSWERSUPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_ANSWERS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Answer;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_BIZANSWERS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/BizAnswers;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_CONTACTLOOKUPS_BATCHSIZE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_CONTACTLOOKUPS_LOOKUPS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Contact;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_CONTACTLOOKUPS_NEXT:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_ANONYMITY_ID:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_ANONYMITY_IDENTIFIER:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_ABOUTME:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_ADDRESS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_CITY:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_COUNTRY:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_ETHNICITY:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_FACIALFEATURE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_FAMILYBACKGROUND:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_HOBBY:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_IDEAL:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/IdealTag;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_INTEREST:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_INTLFRIENDPURPOSE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_INTLFRIENDPURPOSEV2:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_LANGUAGE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_MBTI:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_PROVINCE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_QUALIFICATION:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_RECENT:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_TICKLE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_TOGETHER:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BASIC_UNIDEAL:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BUSINESS_AVATARCLOSE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BUSINESS_AVATAREXPIRETIME:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BUSINESS_AVATARID:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_BUSINESS_CARDTYPE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_FRIENDSTATUS_ENDTIME:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_FRIENDSTATUS_LABELNAME:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_FRIENDSTATUS_LABELTYPE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_GAME:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/ExtensionGame;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_HEADFRAME_EXPIREDTIME:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_HEADFRAME_URL:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_INTEREST_EMOJI:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_INTEREST_TAGS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_INTEREST_TASTE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_LIVE_VOICEIMGID:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_LIVE_VOICEIMGURL:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_MARRIAGE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_MATE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/ProfileMate;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_MOMENTSWITCH_NOSYNCMOMENT:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_PET:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/PetInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_PHYSICAL_DRINK:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_PHYSICAL_FITNESS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_PHYSICAL_HEIGHT:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_PHYSICAL_HEIGHTIMG:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_PHYSICAL_SMOKE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_PHYSICAL_WEIGHT:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_PROFILECOMPLETION:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/ProfileCompletion;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_TAILFRAME_EXPIREDTIME:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/Double;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_TAILFRAME_URL:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_VOICEAVATARFRAME:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/VoiceAvatarFrame;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_VOICESIGNATURE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/VoiceSignature;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_EXTENSIONS_WEALTH:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/UserWealth;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_FOLLOWSHIPS_COUNTERS_FOLLOWERS:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_FOLLOWSHIPS_COUNTERS_FOLLOWINGS:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_HANGOUTS:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_HOMETOWN:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_JOB:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_MOMENTS_COUNTERS_RECEIVEMOMENTLIKES:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_MOMENTS_COUNTERS_TOTALMOMENTS:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_MOMENTS_COUNTERS_TOTALNORMALMOMENTS:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_MOMENTS_HIDEPUBLICMOMENTS:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_MOOD:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/UserProfileMood;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_MOODMOMENT:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/MoodMoment;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_OCCUPATION:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_ONLYSHOWABOUTMEINSIDE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_RECEIVEDLIKES:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_RECEIVEDLIKESRANK:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_SCENARIOS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_SCHOOL:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_SOCIAL:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Social;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_STUDIES_ACTIVE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_STUDIES_GRADE:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_STUDIES_MAJOR:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_STUDIES_QUALIFICATION:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/QualificationType;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_STUDIES_SCHOOL:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_STUDIES_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_TAGS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final PROFILE_TBH_CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_TBH_FRIENDS:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_TBH_RECEIVEDVOTEDPOLLS:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_TBH_RECEIVEDVOTES:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_WORK_ACTIVE:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_WORK_COMPANY:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_WORK_DEPARTMENT:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_WORK_INDUSTRY:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILE_ZODIAC:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/ProfileZodiac;",
            ">;"
        }
    .end annotation
.end field

.field public static PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/ProtobufAdapter<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final PUBLICID:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final REALNAME:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final RECEIVEDLETTER:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final RECEIVEDLETTERTIMESTAMP:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final REGIONTAG:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final RELATION_OR_FOLLOW:I = 0x0

.field public static final RICHLISTPOSITION:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final RICHLISTTRACKER:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final SENDLETTER:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final SENDLETTERTIMESTAMP:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static SEPARATING_AGE:I = 0x17

.field public static final SETTINGS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/Settings;",
            ">;"
        }
    .end annotation
.end field

.field public static final SIGNUPTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/DoubleColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final SOULSETTINGS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/UserSoulSettings;",
            ">;"
        }
    .end annotation
.end field

.field public static final SOURCE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/p1/mobile/putong/data/tenum/TEnumColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/UserSource;",
            ">;"
        }
    .end annotation
.end field

.field public static final SPECIALEFFECT:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/SpecialEffect;",
            ">;"
        }
    .end annotation
.end field

.field public static final STATE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/UserState;",
            ">;"
        }
    .end annotation
.end field

.field public static final STR_LOCATION_INVISIBLEFIELDS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/LocationInvisibleField;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final STR_PROFILE_EXTENSIONS_BASIC_FRIENDPURPOSE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Purpose;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final STR_PROFILE_EXTENSIONS_FRIENDSTATUS_STATUS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/FriendState;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final STR_PROFILE_EXTENSIONS_PHYSICAL_BLOODTYPE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/BloodType;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final STR_STATUS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/UserStatus;",
            ">;>;"
        }
    .end annotation
.end field

.field public static final TEAM_ACCOUNT:I = 0x3

.field public static final TYPE:Ljava/lang/String; = "user"

.field public static final USERACTIVITYINFO:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/UserActivityInfo;",
            ">;"
        }
    .end annotation
.end field

.field public static final USSTAGS:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/UssTags;",
            ">;"
        }
    .end annotation
.end field

.field public static final USSTRACKER:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERIFICATIONS_AGE_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERIFICATIONS_ANCHOR_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERIFICATIONS_IDCARD_AGE:Lcom/tantanapp/common/data/orm/IntegerColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/IntegerColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERIFICATIONS_IDCARD_FIRST4:Lcom/tantanapp/common/data/orm/StringColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/StringColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERIFICATIONS_IDCARD_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERIFICATIONS_OTHERS_OTHERCTDID_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERIFICATIONS_OTHERS_OTHERDVIPCOMPANY_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERIFICATIONS_OTHERS_OTHERDVIPJOB_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERIFICATIONS_OTHERS_OTHERDVIPMEMBERSHIP_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERIFICATIONS_OTHERS_OTHERDVIPSALARY_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERIFICATIONS_OTHERS_OTHERDVIPSCHOOL_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final VERIFICATIONS_PICVERIFICATIONRESULT_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/BooleanColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public static final VISITPLACE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/VisitPlace;",
            ">;"
        }
    .end annotation
.end field

.field public static final VOICE:Lcom/tantanapp/common/data/orm/Column;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/Column<",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/AudioSignature;",
            ">;"
        }
    .end annotation
.end field

.field public static final _ID:Lcom/tantanapp/common/data/orm/LongColumn;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/tantanapp/common/data/orm/LongColumn<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field private static inp:Ljava/util/regex/Pattern; = null

.field public static newHereDay:I = -0x1

.field private static np:Ljava/util/regex/Pattern;

.field private static tnp:Ljava/util/regex/Pattern;


# instance fields
.field public NO_ASSISTANT_MSG:Ljava/lang/String;

.field public abGroups:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x46
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public abroad:Lcom/p1/mobile/putong/data/UserAbroad;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x58
    .end annotation
.end field

.field public activityUser:Lcom/p1/mobile/putong/data/ActivityUser;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x71
    .end annotation
.end field

.field public age:Ljava/lang/Integer;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x36
    .end annotation
.end field

.field public aiOrderPicture:Z

.field public aiTag:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x62
    .end annotation
.end field

.field public anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6c
    .end annotation
.end field

.field public avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public banStatus:Lcom/p1/mobile/putong/data/BanStatus;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6a
    .end annotation
.end field

.field public broadcast:Lcom/p1/mobile/putong/data/Broadcast;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public createdTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x38
    .end annotation
.end field

.field public credit:Lcom/p1/mobile/putong/data/UserCreditData;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4c
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public datingMode:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x56
    .end annotation
.end field

.field private defaultRiskAuditUser:Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;

.field public deleted:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x76
    .end annotation
.end field

.field public description:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x35
    .end annotation
.end field

.field public diamondVIPExpiresTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x61
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public displayAudit:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5b
    .end annotation
.end field

.field public fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x59
    .end annotation
.end field

.field public fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public finishedStages:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/StepSignupStage;",
            ">;"
        }
    .end annotation
.end field

.field public friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x63
    .end annotation
.end field

.field public gender:Lcom/p1/mobile/putong/data/Gender;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3c
    .end annotation
.end field

.field public goPlaceTimestamp:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4d
    .end annotation
.end field

.field public hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x67
    .end annotation
.end field

.field public ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public inactivated:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6d
    .end annotation
.end field

.field public isLord:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4e
    .end annotation
.end field

.field public liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public liveState:Lcom/p1/mobile/putong/data/UserLiveState;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private liveUserAvatarFrame:Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;

.field public localDiamondPrivateMatchTags:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x6b
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public localFollowship:Lcom/p1/mobile/putong/data/Followship;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x41
    .end annotation
.end field

.field public localLatestReceivedMessageTime:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x66
    .end annotation
.end field

.field public localLetterUnRead:Z

.field public localLikeIdentifiers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x75
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public localRelationship:Lcom/p1/mobile/putong/data/Relationship;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3d
    .end annotation
.end field

.field public localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public localSeeReminderType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public localSoulShip:Lcom/p1/mobile/putong/data/SoulShip;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x68
    .end annotation
.end field

.field public location:Lcom/p1/mobile/putong/data/Location;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x34
    .end annotation
.end field

.field public matePlanAdUser:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x73
    .end annotation
.end field

.field public matePlanUser:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x72
    .end annotation
.end field

.field public medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public membership:Lcom/p1/mobile/putong/data/Membership;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3e
    .end annotation
.end field

.field public memberships:Ljava/util/List;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x42
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Membership;",
            ">;"
        }
    .end annotation
.end field

.field public minRichListPosition:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x64
    .end annotation
.end field

.field public name:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x33
    .end annotation
.end field

.field public nameRemark:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x43
    .end annotation
.end field

.field public nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5a
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

.field public peepership:Lcom/p1/mobile/putong/data/Membership;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x48
    .end annotation
.end field

.field public picksExpiredTimestamp:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x49
    .end annotation
.end field

.field public picksSwipable:Z
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4a
    .end annotation
.end field

.field public picksTag:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4b
    .end annotation
.end field

.field public picksTagType:I

.field public picksTracker:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public pictures:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x37
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Media;",
            ">;"
        }
    .end annotation
.end field

.field private pinyinOfRealName:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public popLevel:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x54
    .end annotation
.end field

.field public popularity:F

.field public privateAnswers:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x47
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/PrivateAnswer;",
            ">;"
        }
    .end annotation
.end field

.field public privateAnswersUpdatedTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x4f
    .end annotation
.end field

.field public profile:Lcom/p1/mobile/putong/data/Profile;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x39
    .end annotation
.end field

.field public publicId:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5d
    .end annotation
.end field

.field public realName:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x40
    .end annotation
.end field

.field public receivedLetter:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x52
    .end annotation
.end field

.field public receivedLetterTimestamp:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x53
    .end annotation
.end field

.field public regionTag:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x74
    .end annotation
.end field

.field private requestUrl:Ljava/lang/String;

.field public richListPosition:I
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5f
    .end annotation
.end field

.field public richListTracker:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x60
    .end annotation
.end field

.field public richListType:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public sendLetter:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x50
    .end annotation
.end field

.field public sendLetterTimestamp:J
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x51
    .end annotation
.end field

.field public settings:Lcom/p1/mobile/putong/data/Settings;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3b
    .end annotation
.end field

.field public signupStage:Lcom/p1/mobile/putong/data/SignupStage;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field public signupTime:D
    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x69
    .end annotation
.end field

.field public soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5e
    .end annotation
.end field

.field public source:Lcom/p1/mobile/putong/data/UserSource;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3f
    .end annotation
.end field

.field public specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x77
    .end annotation
.end field

.field public state:Lcom/p1/mobile/putong/data/UserState;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x44
    .end annotation
.end field

.field public status:Ljava/util/List;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x3a
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/UserStatus;",
            ">;"
        }
    .end annotation
.end field

.field public totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x78
    .end annotation
.end field

.field private userAvatarFrame:Lcom/p1/mobile/putong/data/UserAvatarFrame;

.field public ussTags:Lcom/p1/mobile/putong/data/UssTags;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x57
    .end annotation
.end field

.field public ussTracker:Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x65
    .end annotation
.end field

.field public verifications:Lcom/p1/mobile/putong/data/PicVerification;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x45
    .end annotation
.end field

.field public visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x5c
    .end annotation
.end field

.field public voice:Lcom/p1/mobile/putong/data/AudioSignature;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/tantanapp/common/data/ProtobufIndex;
        index = 0x55
    .end annotation
.end field

.field public voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/User$1;

    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User$1;-><init>()V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 2
    new-instance v0, Lcom/p1/mobile/putong/data/User$2;

    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User$2;-><init>()V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 3
    new-instance v0, Lcom/p1/mobile/putong/data/User$3;

    const-string v1, "_id"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$3;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->_ID:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 4
    new-instance v0, Lcom/p1/mobile/putong/data/User$4;

    const-string v1, "id_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$4;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->ID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 5
    new-instance v0, Lcom/p1/mobile/putong/data/User$5;

    const-string v1, "name_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$5;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->NAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 6
    new-instance v0, Lcom/p1/mobile/putong/data/User$6;

    const-string v1, "location_distance_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$6;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->LOCATION_DISTANCE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 7
    new-instance v0, Lcom/p1/mobile/putong/data/User$7;

    const-string v1, "location_updatedTime_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$7;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->LOCATION_UPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 8
    new-instance v0, Lcom/p1/mobile/putong/data/User$8;

    const-string v1, "location_region_district_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$8;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->LOCATION_REGION_DISTRICT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 9
    new-instance v0, Lcom/p1/mobile/putong/data/User$9;

    const-string v1, "location_region_city_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$9;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->LOCATION_REGION_CITY:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 10
    new-instance v0, Lcom/p1/mobile/putong/data/User$10;

    const-string v1, "location_region_country_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$10;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->LOCATION_REGION_COUNTRY:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 11
    new-instance v0, Lcom/p1/mobile/putong/data/User$11;

    const-string v1, "location_passby_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$11;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->LOCATION_PASSBY:Lcom/tantanapp/common/data/orm/Column;

    .line 12
    new-instance v0, Lcom/p1/mobile/putong/data/User$12;

    const-string v1, "description_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$12;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->DESCRIPTION:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 13
    new-instance v0, Lcom/p1/mobile/putong/data/User$13;

    const-string v1, "age_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$13;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->AGE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 14
    new-instance v0, Lcom/p1/mobile/putong/data/User$14;

    const-string v1, "pictures_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$14;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PICTURES:Lcom/tantanapp/common/data/orm/Column;

    .line 15
    new-instance v0, Lcom/p1/mobile/putong/data/User$15;

    const-string v1, "createdTime_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$15;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 16
    new-instance v0, Lcom/p1/mobile/putong/data/User$16;

    const-string v1, "profile_school_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$16;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_SCHOOL:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 17
    new-instance v0, Lcom/p1/mobile/putong/data/User$17;

    const-string v1, "profile_hangouts_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$17;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_HANGOUTS:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    new-instance v0, Lcom/p1/mobile/putong/data/User$18;

    const-string v1, "profile_hometown_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$18;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_HOMETOWN:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 19
    new-instance v0, Lcom/p1/mobile/putong/data/User$19;

    const-string v1, "profile_receivedLikes_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$19;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_RECEIVEDLIKES:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 20
    new-instance v0, Lcom/p1/mobile/putong/data/User$20;

    const-string v1, "profile_tags_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$20;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_TAGS:Lcom/tantanapp/common/data/orm/Column;

    .line 21
    new-instance v0, Lcom/p1/mobile/putong/data/User$21;

    const-string v1, "profile_job_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$21;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_JOB:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 22
    new-instance v0, Lcom/p1/mobile/putong/data/User$22;

    const-string v1, "profile_contactLookups_batchSize_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$22;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_CONTACTLOOKUPS_BATCHSIZE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 23
    new-instance v0, Lcom/p1/mobile/putong/data/User$23;

    const-string v1, "profile_contactLookups_lookups_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$23;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_CONTACTLOOKUPS_LOOKUPS:Lcom/tantanapp/common/data/orm/Column;

    .line 24
    new-instance v0, Lcom/p1/mobile/putong/data/User$24;

    const-string v1, "profile_contactLookups_next_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$24;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_CONTACTLOOKUPS_NEXT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 25
    new-instance v0, Lcom/p1/mobile/putong/data/User$25;

    const-string v1, "profile_social_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$25;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_SOCIAL:Lcom/tantanapp/common/data/orm/Column;

    .line 26
    new-instance v0, Lcom/p1/mobile/putong/data/User$26;

    const-string v1, "profile_answers_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$26;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_ANSWERS:Lcom/tantanapp/common/data/orm/Column;

    .line 27
    new-instance v0, Lcom/p1/mobile/putong/data/User$27;

    const-string v1, "profile_zodiac_c"

    sget-object v2, Lcom/p1/mobile/putong/data/ProfileZodiac;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    const-string v3, "str_profile_zodiac_c"

    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/data/User$27;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_ZODIAC:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 28
    new-instance v0, Lcom/p1/mobile/putong/data/User$28;

    const-string v1, "profile_occupation_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$28;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_OCCUPATION:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 29
    new-instance v0, Lcom/p1/mobile/putong/data/User$29;

    const-string v1, "settings_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$29;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->SETTINGS:Lcom/tantanapp/common/data/orm/Column;

    .line 30
    new-instance v0, Lcom/p1/mobile/putong/data/User$30;

    const-string v1, "gender_c"

    sget-object v2, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    const-string v3, "str_gender_c"

    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/data/User$30;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->GENDER:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 31
    new-instance v0, Lcom/p1/mobile/putong/data/User$31;

    const-string v1, "profile_work_industry_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$31;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_WORK_INDUSTRY:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 32
    new-instance v0, Lcom/p1/mobile/putong/data/User$32;

    const-string v1, "profile_work_department_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$32;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_WORK_DEPARTMENT:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 33
    new-instance v0, Lcom/p1/mobile/putong/data/User$33;

    const-string v1, "profile_work_company_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$33;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_WORK_COMPANY:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 34
    new-instance v0, Lcom/p1/mobile/putong/data/User$34;

    const-string v1, "profile_work_active_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$34;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_WORK_ACTIVE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 35
    new-instance v0, Lcom/p1/mobile/putong/data/User$35;

    const-string v1, "profile_studies_major_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$35;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_STUDIES_MAJOR:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 36
    new-instance v0, Lcom/p1/mobile/putong/data/User$36;

    const-string v1, "profile_studies_school_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$36;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_STUDIES_SCHOOL:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 37
    new-instance v0, Lcom/p1/mobile/putong/data/User$37;

    const-string v1, "profile_studies_active_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$37;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_STUDIES_ACTIVE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 38
    new-instance v0, Lcom/p1/mobile/putong/data/User$38;

    const-string v1, "profile_scenarios_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$38;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_SCENARIOS:Lcom/tantanapp/common/data/orm/Column;

    .line 39
    new-instance v0, Lcom/p1/mobile/putong/data/User$39;

    const-string v1, "profile_receivedLikesRank_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$39;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_RECEIVEDLIKESRANK:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 40
    new-instance v0, Lcom/p1/mobile/putong/data/User$40;

    const-string v1, "localRelationship_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$40;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->LOCALRELATIONSHIP:Lcom/tantanapp/common/data/orm/Column;

    .line 41
    new-instance v0, Lcom/p1/mobile/putong/data/User$41;

    const-string v1, "membership_name_c"

    sget-object v2, Lcom/p1/mobile/putong/data/MembershipType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    const-string v3, "str_membership_name_c"

    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/data/User$41;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->MEMBERSHIP_NAME:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 42
    new-instance v0, Lcom/p1/mobile/putong/data/User$42;

    const-string v1, "membership_active_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$42;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->MEMBERSHIP_ACTIVE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 43
    new-instance v0, Lcom/p1/mobile/putong/data/User$43;

    const-string v1, "membership_expiresTime_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$43;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->MEMBERSHIP_EXPIRESTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 44
    new-instance v0, Lcom/p1/mobile/putong/data/User$44;

    const-string v1, "source_c"

    sget-object v2, Lcom/p1/mobile/putong/data/UserSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    const-string v3, "str_source_c"

    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/data/User$44;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->SOURCE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 45
    new-instance v0, Lcom/p1/mobile/putong/data/User$45;

    const-string v1, "profile_studies_verified_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$45;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_STUDIES_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 46
    new-instance v0, Lcom/p1/mobile/putong/data/User$46;

    const-string v1, "profile_studies_grade_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$46;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_STUDIES_GRADE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 47
    new-instance v0, Lcom/p1/mobile/putong/data/User$47;

    const-string v1, "profile_tbh_friends_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$47;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_TBH_FRIENDS:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 48
    new-instance v0, Lcom/p1/mobile/putong/data/User$48;

    const-string v1, "profile_tbh_receivedVotes_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$48;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_TBH_RECEIVEDVOTES:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 49
    new-instance v0, Lcom/p1/mobile/putong/data/User$49;

    const-string v1, "profile_tbh_receivedVotedPolls_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$49;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_TBH_RECEIVEDVOTEDPOLLS:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 50
    new-instance v0, Lcom/p1/mobile/putong/data/User$50;

    const-string v1, "profile_tbh_createdTime_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$50;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_TBH_CREATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 51
    new-instance v0, Lcom/p1/mobile/putong/data/User$51;

    const-string v1, "realName_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$51;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->REALNAME:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 52
    new-instance v0, Lcom/p1/mobile/putong/data/User$52;

    const-string v1, "profile_followships_counters_followings_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$52;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_FOLLOWSHIPS_COUNTERS_FOLLOWINGS:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 53
    new-instance v0, Lcom/p1/mobile/putong/data/User$53;

    const-string v1, "profile_followships_counters_followers_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$53;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_FOLLOWSHIPS_COUNTERS_FOLLOWERS:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 54
    new-instance v0, Lcom/p1/mobile/putong/data/User$54;

    const-string v1, "profile_moments_hidePublicMoments_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$54;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_MOMENTS_HIDEPUBLICMOMENTS:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 55
    new-instance v0, Lcom/p1/mobile/putong/data/User$55;

    const-string v1, "profile_moments_counters_totalMoments_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$55;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_MOMENTS_COUNTERS_TOTALMOMENTS:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 56
    new-instance v0, Lcom/p1/mobile/putong/data/User$56;

    const-string v1, "profile_moments_counters_receiveMomentLikes_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$56;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_MOMENTS_COUNTERS_RECEIVEMOMENTLIKES:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 57
    new-instance v0, Lcom/p1/mobile/putong/data/User$57;

    const-string v1, "localFollowship_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$57;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->LOCALFOLLOWSHIP:Lcom/tantanapp/common/data/orm/Column;

    .line 58
    new-instance v0, Lcom/p1/mobile/putong/data/User$58;

    const-string v1, "membership_duration_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$58;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->MEMBERSHIP_DURATION:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 59
    new-instance v0, Lcom/p1/mobile/putong/data/User$59;

    const-string v1, "memberships_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$59;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->MEMBERSHIPS:Lcom/tantanapp/common/data/orm/Column;

    .line 60
    new-instance v0, Lcom/p1/mobile/putong/data/User$60;

    const-string v1, "nameRemark_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$60;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->NAMEREMARK:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 61
    new-instance v0, Lcom/p1/mobile/putong/data/User$61;

    const-string v1, "state_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$61;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->STATE:Lcom/tantanapp/common/data/orm/Column;

    .line 62
    new-instance v0, Lcom/p1/mobile/putong/data/User$62;

    const-string v1, "verifications_picVerificationResult_verified_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$62;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VERIFICATIONS_PICVERIFICATIONRESULT_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 63
    new-instance v0, Lcom/p1/mobile/putong/data/User$63;

    const-string v1, "abGroups_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$63;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->ABGROUPS:Lcom/tantanapp/common/data/orm/Column;

    .line 64
    new-instance v0, Lcom/p1/mobile/putong/data/User$64;

    const-string v1, "privateAnswers_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$64;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PRIVATEANSWERS:Lcom/tantanapp/common/data/orm/Column;

    .line 65
    new-instance v0, Lcom/p1/mobile/putong/data/User$65;

    const-string v1, "peepership_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$65;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PEEPERSHIP:Lcom/tantanapp/common/data/orm/Column;

    .line 66
    new-instance v0, Lcom/p1/mobile/putong/data/User$66;

    const-string v1, "picksExpiredTimestamp_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$66;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PICKSEXPIREDTIMESTAMP:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 67
    new-instance v0, Lcom/p1/mobile/putong/data/User$67;

    const-string v1, "picksSwipable_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$67;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PICKSSWIPABLE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 68
    new-instance v0, Lcom/p1/mobile/putong/data/User$68;

    const-string v1, "picksTag_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$68;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PICKSTAG:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 69
    new-instance v0, Lcom/p1/mobile/putong/data/User$69;

    const-string v1, "credit_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$69;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->CREDIT:Lcom/tantanapp/common/data/orm/Column;

    .line 70
    new-instance v0, Lcom/p1/mobile/putong/data/User$70;

    const-string v1, "goPlaceTimestamp_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$70;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->GOPLACETIMESTAMP:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 71
    new-instance v0, Lcom/p1/mobile/putong/data/User$71;

    const-string v1, "isLord_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$71;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->ISLORD:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 72
    new-instance v0, Lcom/p1/mobile/putong/data/User$72;

    const-string v1, "privateAnswersUpdatedTime_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$72;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PRIVATEANSWERSUPDATEDTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 73
    new-instance v0, Lcom/p1/mobile/putong/data/User$73;

    const-string v1, "sendLetter_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$73;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->SENDLETTER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 74
    new-instance v0, Lcom/p1/mobile/putong/data/User$74;

    const-string v1, "sendLetterTimestamp_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$74;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->SENDLETTERTIMESTAMP:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 75
    new-instance v0, Lcom/p1/mobile/putong/data/User$75;

    const-string v1, "receivedLetter_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$75;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->RECEIVEDLETTER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 76
    new-instance v0, Lcom/p1/mobile/putong/data/User$76;

    const-string v1, "receivedLetterTimestamp_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$76;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->RECEIVEDLETTERTIMESTAMP:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 77
    new-instance v0, Lcom/p1/mobile/putong/data/User$77;

    const-string v1, "popLevel_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$77;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->POPLEVEL:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 78
    new-instance v0, Lcom/p1/mobile/putong/data/User$78;

    const-string v1, "voice_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$78;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VOICE:Lcom/tantanapp/common/data/orm/Column;

    .line 79
    new-instance v0, Lcom/p1/mobile/putong/data/User$79;

    const-string v1, "datingMode_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$79;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->DATINGMODE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 80
    new-instance v0, Lcom/p1/mobile/putong/data/User$80;

    const-string v1, "ussTags_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$80;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->USSTAGS:Lcom/tantanapp/common/data/orm/Column;

    .line 81
    new-instance v0, Lcom/p1/mobile/putong/data/User$81;

    const-string v1, "membership_vipBadgeType_c"

    sget-object v2, Lcom/p1/mobile/putong/data/VIPBadgeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    const-string v3, "str_membership_vipBadgeType_c"

    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/data/User$81;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->MEMBERSHIP_VIPBADGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 82
    new-instance v0, Lcom/p1/mobile/putong/data/User$82;

    const-string v1, "abroad_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$82;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->ABROAD:Lcom/tantanapp/common/data/orm/Column;

    .line 83
    new-instance v0, Lcom/p1/mobile/putong/data/User$83;

    const-string v1, "fakeStatus_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$83;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->FAKESTATUS:Lcom/tantanapp/common/data/orm/Column;

    .line 84
    new-instance v0, Lcom/p1/mobile/putong/data/User$84;

    const-string v1, "nameStatus_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$84;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->NAMESTATUS:Lcom/tantanapp/common/data/orm/Column;

    .line 85
    new-instance v0, Lcom/p1/mobile/putong/data/User$85;

    const-string v1, "displayAudit_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$85;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->DISPLAYAUDIT:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 86
    new-instance v0, Lcom/p1/mobile/putong/data/User$86;

    const-string v1, "visitPlace_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$86;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VISITPLACE:Lcom/tantanapp/common/data/orm/Column;

    .line 87
    new-instance v0, Lcom/p1/mobile/putong/data/User$87;

    const-string v1, "publicId_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$87;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PUBLICID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 88
    new-instance v0, Lcom/p1/mobile/putong/data/User$88;

    const-string v1, "soulSettings_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$88;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->SOULSETTINGS:Lcom/tantanapp/common/data/orm/Column;

    .line 89
    new-instance v0, Lcom/p1/mobile/putong/data/User$89;

    const-string v1, "richListPosition_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$89;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->RICHLISTPOSITION:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 90
    new-instance v0, Lcom/p1/mobile/putong/data/User$90;

    const-string v1, "richListTracker_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$90;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->RICHLISTTRACKER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 91
    new-instance v0, Lcom/p1/mobile/putong/data/User$91;

    const-string v1, "diamondVIPExpiresTime_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$91;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->DIAMONDVIPEXPIRESTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 92
    new-instance v0, Lcom/p1/mobile/putong/data/User$92;

    const-string v1, "aiTag_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$92;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->AITAG:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 93
    new-instance v0, Lcom/p1/mobile/putong/data/User$93;

    const-string v1, "friendCommentInfo_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$93;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->FRIENDCOMMENTINFO:Lcom/tantanapp/common/data/orm/Column;

    .line 94
    new-instance v0, Lcom/p1/mobile/putong/data/User$94;

    const-string v1, "minRichListPosition_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$94;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->MINRICHLISTPOSITION:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 95
    new-instance v0, Lcom/p1/mobile/putong/data/User$95;

    const-string v1, "membership_hideVIP_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$95;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->MEMBERSHIP_HIDEVIP:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 96
    new-instance v0, Lcom/p1/mobile/putong/data/User$96;

    const-string v1, "ussTracker_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$96;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->USSTRACKER:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 97
    new-instance v0, Lcom/p1/mobile/putong/data/User$97;

    const-string v1, "profile_mood_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$97;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_MOOD:Lcom/tantanapp/common/data/orm/Column;

    .line 98
    new-instance v0, Lcom/p1/mobile/putong/data/User$98;

    const-string v1, "verifications_idCard_verified_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$98;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VERIFICATIONS_IDCARD_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 99
    new-instance v0, Lcom/p1/mobile/putong/data/User$99;

    const-string v1, "membership_hideActivityTime_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$99;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->MEMBERSHIP_HIDEACTIVITYTIME:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 100
    new-instance v0, Lcom/p1/mobile/putong/data/User$100;

    const-string v1, "profile_studies_qualification_c"

    sget-object v2, Lcom/p1/mobile/putong/data/QualificationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    const-string v3, "str_profile_studies_qualification_c"

    invoke-direct {v0, v3, v1, v2}, Lcom/p1/mobile/putong/data/User$100;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_STUDIES_QUALIFICATION:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 101
    new-instance v0, Lcom/p1/mobile/putong/data/User$101;

    const-string v1, "profile_extensions_business_cardType_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$101;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BUSINESS_CARDTYPE:Lcom/tantanapp/common/data/orm/Column;

    .line 102
    new-instance v0, Lcom/p1/mobile/putong/data/User$102;

    const-string v1, "profile_moodMoment_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$102;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_MOODMOMENT:Lcom/tantanapp/common/data/orm/Column;

    .line 103
    new-instance v0, Lcom/p1/mobile/putong/data/User$103;

    const-string v1, "profile_bizAnswers_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$103;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_BIZANSWERS:Lcom/tantanapp/common/data/orm/Column;

    .line 104
    new-instance v0, Lcom/p1/mobile/putong/data/User$104;

    const-string v1, "profile_extensions_interest_emoji_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$104;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_INTEREST_EMOJI:Lcom/tantanapp/common/data/orm/Column;

    .line 105
    new-instance v0, Lcom/p1/mobile/putong/data/User$105;

    const-string v1, "verifications_age_verified_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$105;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VERIFICATIONS_AGE_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 106
    new-instance v0, Lcom/p1/mobile/putong/data/User$106;

    const-string v1, "profile_extensions_basic_aboutMe_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$106;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_ABOUTME:Lcom/tantanapp/common/data/orm/Column;

    .line 107
    new-instance v0, Lcom/p1/mobile/putong/data/User$107;

    const-string v1, "verifications_anchor_verified_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$107;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VERIFICATIONS_ANCHOR_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 108
    new-instance v0, Lcom/p1/mobile/putong/data/User$108;

    const-string v1, "profile_extensions_basic_tickle_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$108;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_TICKLE:Lcom/tantanapp/common/data/orm/Column;

    .line 109
    new-instance v0, Lcom/p1/mobile/putong/data/User$109;

    const-string v1, "localLatestReceivedMessageTime_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$109;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->LOCALLATESTRECEIVEDMESSAGETIME:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 110
    new-instance v0, Lcom/p1/mobile/putong/data/User$110;

    const-string v1, "verifications_others_otherDVIPSchool_verified_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$110;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VERIFICATIONS_OTHERS_OTHERDVIPSCHOOL_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 111
    new-instance v0, Lcom/p1/mobile/putong/data/User$111;

    const-string v1, "verifications_others_otherDVIPCompany_verified_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$111;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VERIFICATIONS_OTHERS_OTHERDVIPCOMPANY_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 112
    new-instance v0, Lcom/p1/mobile/putong/data/User$112;

    const-string v1, "verifications_others_otherDVIPJob_verified_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$112;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VERIFICATIONS_OTHERS_OTHERDVIPJOB_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 113
    new-instance v0, Lcom/p1/mobile/putong/data/User$113;

    const-string v1, "verifications_others_otherDVIPSalary_verified_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$113;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VERIFICATIONS_OTHERS_OTHERDVIPSALARY_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 114
    new-instance v0, Lcom/p1/mobile/putong/data/User$114;

    const-string v1, "verifications_others_otherDVIPMembership_verified_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$114;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VERIFICATIONS_OTHERS_OTHERDVIPMEMBERSHIP_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 115
    new-instance v0, Lcom/p1/mobile/putong/data/User$115;

    const-string v1, "hierarchy_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$115;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->HIERARCHY:Lcom/tantanapp/common/data/orm/Column;

    .line 116
    new-instance v0, Lcom/p1/mobile/putong/data/User$116;

    const-string v1, "profile_extensions_basic_hobby_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$116;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_HOBBY:Lcom/tantanapp/common/data/orm/Column;

    .line 117
    new-instance v0, Lcom/p1/mobile/putong/data/User$117;

    const-string v1, "profile_extensions_basic_recent_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$117;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_RECENT:Lcom/tantanapp/common/data/orm/Column;

    .line 118
    new-instance v0, Lcom/p1/mobile/putong/data/User$118;

    const-string v1, "profile_extensions_basic_together_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$118;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_TOGETHER:Lcom/tantanapp/common/data/orm/Column;

    .line 119
    new-instance v0, Lcom/p1/mobile/putong/data/User$119;

    const-string v1, "profile_extensions_anonymity_id_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$119;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_ANONYMITY_ID:Lcom/tantanapp/common/data/orm/Column;

    .line 120
    new-instance v0, Lcom/p1/mobile/putong/data/User$120;

    const-string v1, "profile_extensions_anonymity_identifier_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$120;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_ANONYMITY_IDENTIFIER:Lcom/tantanapp/common/data/orm/Column;

    .line 121
    new-instance v0, Lcom/p1/mobile/putong/data/User$121;

    const-string v1, "localSoulShip_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$121;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->LOCALSOULSHIP:Lcom/tantanapp/common/data/orm/Column;

    .line 122
    new-instance v0, Lcom/p1/mobile/putong/data/User$122;

    const-string v1, "signupTime_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$122;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->SIGNUPTIME:Lcom/tantanapp/common/data/orm/DoubleColumn;

    .line 123
    new-instance v0, Lcom/p1/mobile/putong/data/User$123;

    const-string v1, "profile_extensions_headFrame_url_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$123;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_HEADFRAME_URL:Lcom/tantanapp/common/data/orm/Column;

    .line 124
    new-instance v0, Lcom/p1/mobile/putong/data/User$124;

    const-string v1, "profile_extensions_headFrame_expiredTime_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$124;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_HEADFRAME_EXPIREDTIME:Lcom/tantanapp/common/data/orm/Column;

    .line 125
    new-instance v0, Lcom/p1/mobile/putong/data/User$125;

    const-string v1, "banStatus_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$125;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->BANSTATUS:Lcom/tantanapp/common/data/orm/Column;

    .line 126
    new-instance v0, Lcom/p1/mobile/putong/data/User$126;

    const-string v1, "profile_onlyShowAboutMeInside_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$126;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_ONLYSHOWABOUTMEINSIDE:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 127
    new-instance v0, Lcom/p1/mobile/putong/data/User$127;

    const-string v1, "profile_extensions_friendStatus_labelType_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$127;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_FRIENDSTATUS_LABELTYPE:Lcom/tantanapp/common/data/orm/Column;

    .line 128
    new-instance v0, Lcom/p1/mobile/putong/data/User$128;

    const-string v1, "profile_extensions_friendStatus_labelName_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$128;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_FRIENDSTATUS_LABELNAME:Lcom/tantanapp/common/data/orm/Column;

    .line 129
    new-instance v0, Lcom/p1/mobile/putong/data/User$129;

    const-string v1, "profile_extensions_friendStatus_endTime_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$129;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_FRIENDSTATUS_ENDTIME:Lcom/tantanapp/common/data/orm/Column;

    .line 130
    new-instance v0, Lcom/p1/mobile/putong/data/User$130;

    const-string v1, "localDiamondPrivateMatchTags_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$130;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->LOCALDIAMONDPRIVATEMATCHTAGS:Lcom/tantanapp/common/data/orm/Column;

    .line 131
    new-instance v0, Lcom/p1/mobile/putong/data/User$131;

    const-string v1, "profile_extensions_basic_interest_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$131;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_INTEREST:Lcom/tantanapp/common/data/orm/Column;

    .line 132
    new-instance v0, Lcom/p1/mobile/putong/data/User$132;

    const-string v1, "anonymousLike_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$132;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->ANONYMOUSLIKE:Lcom/tantanapp/common/data/orm/Column;

    .line 133
    new-instance v0, Lcom/p1/mobile/putong/data/User$133;

    const-string v1, "inactivated_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$133;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->INACTIVATED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 134
    new-instance v0, Lcom/p1/mobile/putong/data/User$134;

    const-string v1, "profile_extensions_basic_country_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$134;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_COUNTRY:Lcom/tantanapp/common/data/orm/Column;

    .line 135
    new-instance v0, Lcom/p1/mobile/putong/data/User$135;

    const-string v1, "profile_extensions_basic_province_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$135;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_PROVINCE:Lcom/tantanapp/common/data/orm/Column;

    .line 136
    new-instance v0, Lcom/p1/mobile/putong/data/User$136;

    const-string v1, "profile_extensions_basic_city_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$136;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_CITY:Lcom/tantanapp/common/data/orm/Column;

    .line 137
    new-instance v0, Lcom/p1/mobile/putong/data/User$137;

    const-string v1, "str_status_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$137;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->STR_STATUS:Lcom/tantanapp/common/data/orm/Column;

    .line 138
    new-instance v0, Lcom/p1/mobile/putong/data/User$138;

    const-string v1, "str_location_invisibleFields_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$138;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->STR_LOCATION_INVISIBLEFIELDS:Lcom/tantanapp/common/data/orm/Column;

    .line 139
    new-instance v0, Lcom/p1/mobile/putong/data/User$139;

    const-string v1, "str_profile_extensions_physical_bloodType_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$139;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->STR_PROFILE_EXTENSIONS_PHYSICAL_BLOODTYPE:Lcom/tantanapp/common/data/orm/Column;

    .line 140
    new-instance v0, Lcom/p1/mobile/putong/data/User$140;

    const-string v1, "str_profile_extensions_basic_friendPurpose_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$140;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->STR_PROFILE_EXTENSIONS_BASIC_FRIENDPURPOSE:Lcom/tantanapp/common/data/orm/Column;

    .line 141
    new-instance v0, Lcom/p1/mobile/putong/data/User$141;

    const-string v1, "str_profile_extensions_friendStatus_status_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$141;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->STR_PROFILE_EXTENSIONS_FRIENDSTATUS_STATUS:Lcom/tantanapp/common/data/orm/Column;

    .line 142
    new-instance v0, Lcom/p1/mobile/putong/data/User$142;

    const-string v1, "profile_extensions_momentSwitch_noSyncMoment_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$142;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_MOMENTSWITCH_NOSYNCMOMENT:Lcom/tantanapp/common/data/orm/Column;

    .line 143
    new-instance v0, Lcom/p1/mobile/putong/data/User$143;

    const-string v1, "profile_extensions_wealth_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$143;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_WEALTH:Lcom/tantanapp/common/data/orm/Column;

    .line 144
    new-instance v0, Lcom/p1/mobile/putong/data/User$144;

    const-string v1, "profile_extensions_basic_qualification_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$144;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_QUALIFICATION:Lcom/tantanapp/common/data/orm/Column;

    .line 145
    new-instance v0, Lcom/p1/mobile/putong/data/User$145;

    const-string v1, "profile_extensions_physical_height_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$145;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_PHYSICAL_HEIGHT:Lcom/tantanapp/common/data/orm/Column;

    .line 146
    new-instance v0, Lcom/p1/mobile/putong/data/User$146;

    const-string v1, "profile_extensions_profileCompletion_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$146;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_PROFILECOMPLETION:Lcom/tantanapp/common/data/orm/Column;

    .line 147
    new-instance v0, Lcom/p1/mobile/putong/data/User$147;

    const-string v1, "profile_extensions_voiceSignature_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$147;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_VOICESIGNATURE:Lcom/tantanapp/common/data/orm/Column;

    .line 148
    new-instance v0, Lcom/p1/mobile/putong/data/User$148;

    const-string v1, "activityUser_action_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$148;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->ACTIVITYUSER_ACTION:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 149
    new-instance v0, Lcom/p1/mobile/putong/data/User$149;

    const-string v1, "activityUser_score_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$149;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->ACTIVITYUSER_SCORE:Lcom/tantanapp/common/data/orm/LongColumn;

    .line 150
    new-instance v0, Lcom/p1/mobile/putong/data/User$150;

    const-string v1, "matePlanUser_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$150;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->MATEPLANUSER:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 151
    new-instance v0, Lcom/p1/mobile/putong/data/User$151;

    const-string v1, "matePlanAdUser_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$151;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->MATEPLANADUSER:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 152
    new-instance v0, Lcom/p1/mobile/putong/data/User$152;

    const-string v1, "regionTag_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$152;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->REGIONTAG:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 153
    new-instance v0, Lcom/p1/mobile/putong/data/User$153;

    const-string v1, "localLikeIdentifiers_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$153;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->LOCALLIKEIDENTIFIERS:Lcom/tantanapp/common/data/orm/Column;

    .line 154
    new-instance v0, Lcom/p1/mobile/putong/data/User$154;

    const-string v1, "deleted_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$154;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->DELETED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 155
    new-instance v0, Lcom/p1/mobile/putong/data/User$155;

    const-string v1, "profile_extensions_interest_tags_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$155;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_INTEREST_TAGS:Lcom/tantanapp/common/data/orm/Column;

    .line 156
    new-instance v0, Lcom/p1/mobile/putong/data/User$156;

    const-string v1, "profile_extensions_live_voiceImgId_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$156;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_LIVE_VOICEIMGID:Lcom/tantanapp/common/data/orm/Column;

    .line 157
    new-instance v0, Lcom/p1/mobile/putong/data/User$157;

    const-string v1, "profile_extensions_live_voiceImgUrl_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$157;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_LIVE_VOICEIMGURL:Lcom/tantanapp/common/data/orm/Column;

    .line 158
    new-instance v0, Lcom/p1/mobile/putong/data/User$158;

    const-string v1, "profile_extensions_mate_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$158;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_MATE:Lcom/tantanapp/common/data/orm/Column;

    .line 159
    new-instance v0, Lcom/p1/mobile/putong/data/User$159;

    const-string v1, "profile_extensions_pet_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$159;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_PET:Lcom/tantanapp/common/data/orm/Column;

    .line 160
    new-instance v0, Lcom/p1/mobile/putong/data/User$160;

    const-string v1, "profile_extensions_tailFrame_url_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$160;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_TAILFRAME_URL:Lcom/tantanapp/common/data/orm/Column;

    .line 161
    new-instance v0, Lcom/p1/mobile/putong/data/User$161;

    const-string v1, "profile_extensions_tailFrame_expiredTime_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$161;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_TAILFRAME_EXPIREDTIME:Lcom/tantanapp/common/data/orm/Column;

    .line 162
    new-instance v0, Lcom/p1/mobile/putong/data/User$162;

    const-string v1, "profile_extensions_business_avatarID_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$162;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BUSINESS_AVATARID:Lcom/tantanapp/common/data/orm/Column;

    .line 163
    new-instance v0, Lcom/p1/mobile/putong/data/User$163;

    const-string v1, "profile_extensions_business_avatarExpireTime_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$163;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BUSINESS_AVATAREXPIRETIME:Lcom/tantanapp/common/data/orm/Column;

    .line 164
    new-instance v0, Lcom/p1/mobile/putong/data/User$164;

    const-string v1, "profile_extensions_business_avatarClose_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$164;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BUSINESS_AVATARCLOSE:Lcom/tantanapp/common/data/orm/Column;

    .line 165
    new-instance v0, Lcom/p1/mobile/putong/data/User$165;

    const-string v1, "specialEffect_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$165;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->SPECIALEFFECT:Lcom/tantanapp/common/data/orm/Column;

    .line 166
    new-instance v0, Lcom/p1/mobile/putong/data/User$166;

    const-string v1, "profile_extensions_basic_ethnicity_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$166;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_ETHNICITY:Lcom/tantanapp/common/data/orm/Column;

    .line 167
    new-instance v0, Lcom/p1/mobile/putong/data/User$167;

    const-string v1, "profile_extensions_basic_language_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$167;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_LANGUAGE:Lcom/tantanapp/common/data/orm/Column;

    .line 168
    new-instance v0, Lcom/p1/mobile/putong/data/User$168;

    const-string v1, "profile_extensions_voiceAvatarFrame_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$168;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_VOICEAVATARFRAME:Lcom/tantanapp/common/data/orm/Column;

    .line 169
    new-instance v0, Lcom/p1/mobile/putong/data/User$169;

    const-string v1, "profile_extensions_physical_heightImg_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$169;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_PHYSICAL_HEIGHTIMG:Lcom/tantanapp/common/data/orm/Column;

    .line 170
    new-instance v0, Lcom/p1/mobile/putong/data/User$170;

    const-string v1, "profile_extensions_marriage_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$170;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_MARRIAGE:Lcom/tantanapp/common/data/orm/Column;

    .line 171
    new-instance v0, Lcom/p1/mobile/putong/data/User$171;

    const-string v1, "profile_extensions_basic_address_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$171;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_ADDRESS:Lcom/tantanapp/common/data/orm/Column;

    .line 172
    new-instance v0, Lcom/p1/mobile/putong/data/User$172;

    const-string v1, "profile_extensions_basic_familyBackground_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$172;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_FAMILYBACKGROUND:Lcom/tantanapp/common/data/orm/Column;

    .line 173
    new-instance v0, Lcom/p1/mobile/putong/data/User$173;

    const-string v1, "profile_extensions_physical_weight_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$173;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_PHYSICAL_WEIGHT:Lcom/tantanapp/common/data/orm/Column;

    .line 174
    new-instance v0, Lcom/p1/mobile/putong/data/User$174;

    const-string v1, "verifications_others_otherCTDID_verified_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$174;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VERIFICATIONS_OTHERS_OTHERCTDID_VERIFIED:Lcom/tantanapp/common/data/orm/BooleanColumn;

    .line 175
    new-instance v0, Lcom/p1/mobile/putong/data/User$175;

    const-string v1, "profile_extensions_game_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$175;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_GAME:Lcom/tantanapp/common/data/orm/Column;

    .line 176
    new-instance v0, Lcom/p1/mobile/putong/data/User$176;

    const-string v1, "profile_extensions_basic_facialFeature_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$176;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_FACIALFEATURE:Lcom/tantanapp/common/data/orm/Column;

    .line 177
    new-instance v0, Lcom/p1/mobile/putong/data/User$177;

    const-string v1, "verifications_idCard_age_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$177;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VERIFICATIONS_IDCARD_AGE:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 178
    new-instance v0, Lcom/p1/mobile/putong/data/User$178;

    const-string v1, "verifications_idCard_first4_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$178;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->VERIFICATIONS_IDCARD_FIRST4:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 179
    new-instance v0, Lcom/p1/mobile/putong/data/User$179;

    const-string v1, "profile_extensions_physical_fitness_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$179;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_PHYSICAL_FITNESS:Lcom/tantanapp/common/data/orm/Column;

    .line 180
    new-instance v0, Lcom/p1/mobile/putong/data/User$180;

    const-string v1, "profile_extensions_physical_drink_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$180;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_PHYSICAL_DRINK:Lcom/tantanapp/common/data/orm/Column;

    .line 181
    new-instance v0, Lcom/p1/mobile/putong/data/User$181;

    const-string v1, "profile_extensions_physical_smoke_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$181;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_PHYSICAL_SMOKE:Lcom/tantanapp/common/data/orm/Column;

    .line 182
    new-instance v0, Lcom/p1/mobile/putong/data/User$182;

    const-string v1, "profile_extensions_basic_mbti_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$182;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_MBTI:Lcom/tantanapp/common/data/orm/Column;

    .line 183
    new-instance v0, Lcom/p1/mobile/putong/data/User$183;

    const-string v1, "userActivityInfo_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$183;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->USERACTIVITYINFO:Lcom/tantanapp/common/data/orm/Column;

    .line 184
    new-instance v0, Lcom/p1/mobile/putong/data/User$184;

    const-string v1, "profile_extensions_basic_ideal_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$184;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_IDEAL:Lcom/tantanapp/common/data/orm/Column;

    .line 185
    new-instance v0, Lcom/p1/mobile/putong/data/User$185;

    const-string v1, "profile_extensions_basic_unideal_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$185;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_UNIDEAL:Lcom/tantanapp/common/data/orm/Column;

    .line 186
    new-instance v0, Lcom/p1/mobile/putong/data/User$186;

    const-string v1, "profile_moments_counters_totalNormalMoments_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$186;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_MOMENTS_COUNTERS_TOTALNORMALMOMENTS:Lcom/tantanapp/common/data/orm/IntegerColumn;

    .line 187
    new-instance v0, Lcom/p1/mobile/putong/data/User$187;

    const-string v1, "profile_extensions_interest_taste_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$187;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_INTEREST_TASTE:Lcom/tantanapp/common/data/orm/Column;

    .line 188
    new-instance v0, Lcom/p1/mobile/putong/data/User$188;

    const-string v1, "location_region_province_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$188;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->LOCATION_REGION_PROVINCE:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 189
    new-instance v0, Lcom/p1/mobile/putong/data/User$189;

    const-string v1, "profile_extensions_basic_intlFriendPurpose_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$189;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_INTLFRIENDPURPOSE:Lcom/tantanapp/common/data/orm/Column;

    .line 190
    new-instance v0, Lcom/p1/mobile/putong/data/User$190;

    const-string v1, "profile_extensions_basic_intlFriendPurposeV2_c"

    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/data/User$190;-><init>(Ljava/lang/String;)V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->PROFILE_EXTENSIONS_BASIC_INTLFRIENDPURPOSEV2:Lcom/tantanapp/common/data/orm/Column;

    .line 191
    new-instance v0, Lcom/p1/mobile/putong/data/User$191;

    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User$191;-><init>()V

    sput-object v0, Lcom/p1/mobile/putong/data/User;->DB_ADAPTER:Ll/vzf0;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/DbObject;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "no_assistant_msg"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->NO_ASSISTANT_MSG:Ljava/lang/String;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashSet;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->parseFieldSet:Ljava/util/HashSet;

    .line 14
    .line 15
    return-void
.end method

.method public static final ILLEGAL_NAME_PATTERN()Ljava/util/regex/Pattern;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/User;->inp:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/data/User;->inp:Ljava/util/regex/Pattern;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const-string v1, "^[-.\\040]+$"

    .line 13
    .line 14
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sput-object v1, Lcom/p1/mobile/putong/data/User;->inp:Ljava/util/regex/Pattern;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    goto :goto_2

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw v1

    .line 27
    :cond_1
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/data/User;->inp:Ljava/util/regex/Pattern;

    .line 28
    .line 29
    return-object v0
.end method

.method public static final NAME_PATTERN()Ljava/util/regex/Pattern;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/User;->np:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/data/User;->np:Ljava/util/regex/Pattern;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const-string v1, "^[\\p{L}-.\\040]{1,50}$"

    .line 13
    .line 14
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sput-object v1, Lcom/p1/mobile/putong/data/User;->np:Ljava/util/regex/Pattern;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    goto :goto_2

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw v1

    .line 27
    :cond_1
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/data/User;->np:Ljava/util/regex/Pattern;

    .line 28
    .line 29
    return-object v0
.end method

.method public static final NEW_NAME_PATTERN()Ljava/util/regex/Pattern;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/User;->np:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/data/User;->np:Ljava/util/regex/Pattern;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const-string v1, "^[\\p{L}\\040]{1,50}$"

    .line 13
    .line 14
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sput-object v1, Lcom/p1/mobile/putong/data/User;->np:Ljava/util/regex/Pattern;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    goto :goto_2

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw v1

    .line 27
    :cond_1
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/data/User;->np:Ljava/util/regex/Pattern;

    .line 28
    .line 29
    return-object v0
.end method

.method public static final ThAI_NAME_PATTERN()Ljava/util/regex/Pattern;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/User;->tnp:Ljava/util/regex/Pattern;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/data/User;->tnp:Ljava/util/regex/Pattern;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    const-string v1, "[\\u0E00-\\u0E7F0-9]{1,50}$"

    .line 13
    .line 14
    invoke-static {v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    sput-object v1, Lcom/p1/mobile/putong/data/User;->tnp:Ljava/util/regex/Pattern;

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v1

    .line 22
    goto :goto_1

    .line 23
    :cond_0
    :goto_0
    monitor-exit v0

    .line 24
    goto :goto_2

    .line 25
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    throw v1

    .line 27
    :cond_1
    :goto_2
    sget-object v0, Lcom/p1/mobile/putong/data/User;->tnp:Ljava/util/regex/Pattern;

    .line 28
    .line 29
    return-object v0
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/data/Membership;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 2
    .line 3
    const-string v0, "vip"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/data/StepSignupStage;)Lcom/p1/mobile/putong/data/StepSignupStage;
    .locals 0

    .line 1
    return-object p0
.end method

.method private checkRelationshipStatus()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    new-instance p0, Ljava/lang/NullPointerException;

    .line 8
    .line 9
    const-string v0, "------------localRelationship.status==null------------"

    .line 10
    .line 11
    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x1

    .line 20
    return p0
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/data/PrivateAnswer;)Lcom/p1/mobile/putong/data/PrivateAnswer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/PrivateAnswer;->clone()Lcom/p1/mobile/putong/data/PrivateAnswer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/data/Membership;)Lcom/p1/mobile/putong/data/Membership;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Membership;->clone()Lcom/p1/mobile/putong/data/Membership;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/data/PrivateAnswer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PrivateAnswer;->selection:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private getFrozenActiveTime()J
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getActiveTimeFromSvip()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 6
    .line 7
    cmp-long p0, v2, v0

    .line 8
    .line 9
    if-lez p0, :cond_0

    .line 10
    .line 11
    return-wide v2

    .line 12
    :cond_0
    return-wide v0
.end method

.method private initAvatarFrame()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->userAvatarFrame:Lcom/p1/mobile/putong/data/UserAvatarFrame;

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
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Business;->avatarID:Ljava/util/List;

    .line 40
    .line 41
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_1

    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 52
    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Business;->avatarClose:Ljava/util/List;

    .line 54
    .line 55
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 62
    .line 63
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 66
    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Business;->avatarExpireTime:Ljava/util/List;

    .line 68
    .line 69
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    if-nez v0, :cond_1

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/data/UserAvatarFrame;->new_()Lcom/p1/mobile/putong/data/UserAvatarFrame;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->userAvatarFrame:Lcom/p1/mobile/putong/data/UserAvatarFrame;

    .line 80
    .line 81
    sget-object v0, Ll/uqb0;->p0:Ll/d07;

    .line 82
    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 84
    .line 85
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 86
    .line 87
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 88
    .line 89
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Business;->avatarID:Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    check-cast v2, Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v0, v2}, Ll/d07;->x(Ljava/lang/String;)Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->userAvatarFrame:Lcom/p1/mobile/putong/data/UserAvatarFrame;

    .line 102
    .line 103
    iput-object v0, v2, Lcom/p1/mobile/putong/data/UserAvatarFrame;->url:Ljava/lang/String;

    .line 104
    .line 105
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 106
    .line 107
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 108
    .line 109
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 110
    .line 111
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Business;->avatarExpireTime:Ljava/util/List;

    .line 112
    .line 113
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Ljava/lang/Long;

    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 120
    .line 121
    .line 122
    move-result-wide v3

    .line 123
    iput-wide v3, v2, Lcom/p1/mobile/putong/data/UserAvatarFrame;->expireTime:J

    .line 124
    .line 125
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->userAvatarFrame:Lcom/p1/mobile/putong/data/UserAvatarFrame;

    .line 126
    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 128
    .line 129
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 130
    .line 131
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Business;->avatarClose:Ljava/util/List;

    .line 134
    .line 135
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    check-cast p0, Ljava/lang/CharSequence;

    .line 140
    .line 141
    const-string v1, "false"

    .line 142
    .line 143
    invoke-static {p0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    iput-boolean p0, v0, Lcom/p1/mobile/putong/data/UserAvatarFrame;->isShow:Z

    .line 148
    .line 149
    return-void

    .line 150
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/data/UserAvatarFrame;->new_()Lcom/p1/mobile/putong/data/UserAvatarFrame;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->userAvatarFrame:Lcom/p1/mobile/putong/data/UserAvatarFrame;

    .line 155
    .line 156
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/UserAvatarFrame;->isShow:Z

    .line 157
    .line 158
    return-void
.end method

.method private initLiveAvatarFrame()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->liveUserAvatarFrame:Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;

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
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 33
    .line 34
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 35
    .line 36
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 37
    .line 38
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->id:Ljava/util/List;

    .line 39
    .line 40
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_2

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->expiredTime:Ljava/util/List;

    .line 53
    .line 54
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_2

    .line 59
    .line 60
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;->new_()Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->liveUserAvatarFrame:Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;

    .line 65
    .line 66
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 67
    .line 68
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 69
    .line 70
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->id:Ljava/util/List;

    .line 73
    .line 74
    const/4 v2, 0x0

    .line 75
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, Ljava/lang/String;

    .line 80
    .line 81
    iput-object v1, v0, Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;->id:Ljava/lang/String;

    .line 82
    .line 83
    sget-object v0, Ll/uqb0;->p0:Ll/d07;

    .line 84
    .line 85
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->liveUserAvatarFrame:Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;

    .line 86
    .line 87
    iget-object v1, v1, Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;->id:Ljava/lang/String;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Ll/d07;->y(Ljava/lang/String;)Lcom/p1/mobile/putong/data/LiveRight;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-eqz v1, :cond_1

    .line 98
    .line 99
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->liveUserAvatarFrame:Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/LiveRight;->getUrl()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    iput-object v3, v1, Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;->url:Ljava/lang/String;

    .line 106
    .line 107
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->liveUserAvatarFrame:Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;

    .line 108
    .line 109
    iput-object v0, v1, Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;->liveRight:Lcom/p1/mobile/putong/data/LiveRight;

    .line 110
    .line 111
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 112
    .line 113
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->expiredTime:Ljava/util/List;

    .line 118
    .line 119
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    check-cast v0, Ljava/lang/String;

    .line 124
    .line 125
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 126
    .line 127
    .line 128
    move-result-wide v2

    .line 129
    iput-wide v2, v1, Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;->expireTime:J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 130
    .line 131
    return-void

    .line 132
    :catch_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->liveUserAvatarFrame:Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;

    .line 133
    .line 134
    const-wide/16 v0, 0x0

    .line 135
    .line 136
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;->expireTime:J

    .line 137
    .line 138
    return-void

    .line 139
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;->new_()Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->liveUserAvatarFrame:Lcom/p1/mobile/putong/data/LiveUserAvatarFrame;

    .line 144
    .line 145
    return-void
.end method

.method public static isAiStory(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "-10021"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public static isBusinessAI1V1(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "-10025"

    .line 2
    .line 3
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static isFollowshipMatched(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 8
    .line 9
    const-string v0, "matched"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

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

.method public static isLiveServiceAccount(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    const-string v0, "-11000"

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    const-string v0, "-11001"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return v1

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_2
    return v1
.end method

.method public static isMatched(Lcom/p1/mobile/putong/data/User;)Z
    .locals 2

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 4
    .line 5
    const-string v1, "matched"

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 22
    .line 23
    invoke-static {p0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    :cond_1
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_2
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public static isRelationshipMatched(Lcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 8
    .line 9
    const-string v0, "matched"

    .line 10
    .line 11
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

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

.method public static isTeamAccount(Ljava/lang/String;)Z
    .locals 2

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_2

    .line 7
    .line 8
    const-string v0, "-1"

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    const-string v0, "-10040"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    const-string v0, "-11000"

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-nez v0, :cond_1

    .line 31
    .line 32
    const-string v0, "-11004"

    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-nez v0, :cond_1

    .line 39
    .line 40
    const-string v0, "-11001"

    .line 41
    .line 42
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    if-nez v0, :cond_1

    .line 47
    .line 48
    const-string v0, "-10007"

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_1

    .line 55
    .line 56
    const-string v0, "-11006"

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-nez v0, :cond_1

    .line 63
    .line 64
    const-string v0, "-10015"

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_1

    .line 71
    .line 72
    const-string v0, "-10021"

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_1

    .line 79
    .line 80
    const-string v0, "-"

    .line 81
    .line 82
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-eqz p0, :cond_0

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_0
    return v1

    .line 90
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 91
    return p0

    .line 92
    :cond_2
    return v1
.end method

.method public static isWisdomStar(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string v0, "-10015"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public static synthetic k(Lcom/p1/mobile/putong/data/UserStatus;)Lcom/p1/mobile/putong/data/UserStatus;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic l(Lcom/p1/mobile/putong/data/MembershipType;Lcom/p1/mobile/putong/data/Membership;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 2
    .line 3
    invoke-static {p1, p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic m(Lcom/p1/mobile/putong/data/PrivateAnswer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PrivateAnswer;->selection:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic n(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static new_()Lcom/p1/mobile/putong/data/User;
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->nullCheck()V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public static synthetic o(Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static synthetic p(Lcom/p1/mobile/putong/data/Media;)Lcom/p1/mobile/putong/data/Media;
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


# virtual methods
.method public boosted()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/User;->checkRelationshipStatus()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    return v1

    .line 34
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 37
    .line 38
    const-string v0, "boosted"

    .line 39
    .line 40
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0

    .line 49
    :cond_2
    :goto_0
    return v1
.end method

.method public bridge synthetic clone()Lcom/google/protobuf/nano/MessageNano;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 668
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    return-object p0
.end method

.method public clone()Lcom/p1/mobile/putong/data/User;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User;-><init>()V

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Location;->clone()Lcom/p1/mobile/putong/data/Location;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 27
    .line 28
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 31
    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 33
    .line 34
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 35
    .line 36
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 37
    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    new-instance v2, Ll/j6k0;

    .line 41
    .line 42
    invoke-direct {v2}, Ll/j6k0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 50
    .line 51
    :cond_1
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 52
    .line 53
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 54
    .line 55
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 56
    .line 57
    if-eqz v1, :cond_2

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Profile;->clone()Lcom/p1/mobile/putong/data/Profile;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 64
    .line 65
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 66
    .line 67
    if-eqz v1, :cond_3

    .line 68
    .line 69
    new-instance v2, Ll/k6k0;

    .line 70
    .line 71
    invoke-direct {v2}, Ll/k6k0;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 79
    .line 80
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 81
    .line 82
    if-eqz v1, :cond_4

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Settings;->clone()Lcom/p1/mobile/putong/data/Settings;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 89
    .line 90
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 91
    .line 92
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 93
    .line 94
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 95
    .line 96
    if-eqz v1, :cond_5

    .line 97
    .line 98
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Relationship;->clone()Lcom/p1/mobile/putong/data/Relationship;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 103
    .line 104
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 105
    .line 106
    if-eqz v1, :cond_6

    .line 107
    .line 108
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Membership;->clone()Lcom/p1/mobile/putong/data/Membership;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 113
    .line 114
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 115
    .line 116
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 117
    .line 118
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 119
    .line 120
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 121
    .line 122
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 123
    .line 124
    if-eqz v1, :cond_7

    .line 125
    .line 126
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Followship;->clone()Lcom/p1/mobile/putong/data/Followship;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 131
    .line 132
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 133
    .line 134
    if-eqz v1, :cond_8

    .line 135
    .line 136
    new-instance v2, Ll/l6k0;

    .line 137
    .line 138
    invoke-direct {v2}, Ll/l6k0;-><init>()V

    .line 139
    .line 140
    .line 141
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 146
    .line 147
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 148
    .line 149
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 152
    .line 153
    if-eqz v1, :cond_9

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserState;->clone()Lcom/p1/mobile/putong/data/UserState;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 160
    .line 161
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 162
    .line 163
    if-eqz v1, :cond_a

    .line 164
    .line 165
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/PicVerification;->clone()Lcom/p1/mobile/putong/data/PicVerification;

    .line 166
    .line 167
    .line 168
    move-result-object v1

    .line 169
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 170
    .line 171
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 172
    .line 173
    if-eqz v1, :cond_b

    .line 174
    .line 175
    new-instance v2, Ll/m6k0;

    .line 176
    .line 177
    invoke-direct {v2}, Ll/m6k0;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 181
    .line 182
    .line 183
    move-result-object v1

    .line 184
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 185
    .line 186
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 187
    .line 188
    if-eqz v1, :cond_c

    .line 189
    .line 190
    new-instance v2, Ll/n6k0;

    .line 191
    .line 192
    invoke-direct {v2}, Ll/n6k0;-><init>()V

    .line 193
    .line 194
    .line 195
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 200
    .line 201
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 202
    .line 203
    if-eqz v1, :cond_d

    .line 204
    .line 205
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Membership;->clone()Lcom/p1/mobile/putong/data/Membership;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 210
    .line 211
    :cond_d
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    .line 212
    .line 213
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    .line 214
    .line 215
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

    .line 216
    .line 217
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

    .line 218
    .line 219
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 220
    .line 221
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 222
    .line 223
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 224
    .line 225
    if-eqz v1, :cond_e

    .line 226
    .line 227
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserCreditData;->clone()Lcom/p1/mobile/putong/data/UserCreditData;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 232
    .line 233
    :cond_e
    iget v1, p0, Lcom/p1/mobile/putong/data/User;->picksTagType:I

    .line 234
    .line 235
    iput v1, v0, Lcom/p1/mobile/putong/data/User;->picksTagType:I

    .line 236
    .line 237
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 238
    .line 239
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 240
    .line 241
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    .line 242
    .line 243
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    .line 244
    .line 245
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->isLord:Z

    .line 246
    .line 247
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/User;->isLord:Z

    .line 248
    .line 249
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    .line 250
    .line 251
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    .line 252
    .line 253
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 254
    .line 255
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 256
    .line 257
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    .line 258
    .line 259
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    .line 260
    .line 261
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 262
    .line 263
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 264
    .line 265
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    .line 266
    .line 267
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    .line 268
    .line 269
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->localLetterUnRead:Z

    .line 270
    .line 271
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/User;->localLetterUnRead:Z

    .line 272
    .line 273
    iget v1, p0, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 274
    .line 275
    iput v1, v0, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 276
    .line 277
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 278
    .line 279
    if-eqz v1, :cond_f

    .line 280
    .line 281
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AudioSignature;->clone()Lcom/p1/mobile/putong/data/AudioSignature;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 286
    .line 287
    :cond_f
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->datingMode:Z

    .line 288
    .line 289
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/User;->datingMode:Z

    .line 290
    .line 291
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 292
    .line 293
    if-eqz v1, :cond_10

    .line 294
    .line 295
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserLiveState;->clone()Lcom/p1/mobile/putong/data/UserLiveState;

    .line 296
    .line 297
    .line 298
    move-result-object v1

    .line 299
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 300
    .line 301
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 302
    .line 303
    if-eqz v1, :cond_11

    .line 304
    .line 305
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UssTags;->clone()Lcom/p1/mobile/putong/data/UssTags;

    .line 306
    .line 307
    .line 308
    move-result-object v1

    .line 309
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 310
    .line 311
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 312
    .line 313
    if-eqz v1, :cond_12

    .line 314
    .line 315
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserAbroad;->clone()Lcom/p1/mobile/putong/data/UserAbroad;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 320
    .line 321
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 322
    .line 323
    if-eqz v1, :cond_13

    .line 324
    .line 325
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/StatusesItem;->clone()Lcom/p1/mobile/putong/data/StatusesItem;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 330
    .line 331
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 332
    .line 333
    if-eqz v1, :cond_14

    .line 334
    .line 335
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/StatusesItem;->clone()Lcom/p1/mobile/putong/data/StatusesItem;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 340
    .line 341
    :cond_14
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    .line 342
    .line 343
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    .line 344
    .line 345
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->aiOrderPicture:Z

    .line 346
    .line 347
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/User;->aiOrderPicture:Z

    .line 348
    .line 349
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 350
    .line 351
    if-eqz v1, :cond_15

    .line 352
    .line 353
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserMedalWrapper;->clone()Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 358
    .line 359
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;

    .line 360
    .line 361
    if-eqz v1, :cond_16

    .line 362
    .line 363
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VisitPlace;->clone()Lcom/p1/mobile/putong/data/VisitPlace;

    .line 364
    .line 365
    .line 366
    move-result-object v1

    .line 367
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;

    .line 368
    .line 369
    :cond_16
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 370
    .line 371
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 372
    .line 373
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 374
    .line 375
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 376
    .line 377
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->broadcast:Lcom/p1/mobile/putong/data/Broadcast;

    .line 378
    .line 379
    if-eqz v1, :cond_17

    .line 380
    .line 381
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Broadcast;->clone()Lcom/p1/mobile/putong/data/Broadcast;

    .line 382
    .line 383
    .line 384
    move-result-object v1

    .line 385
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->broadcast:Lcom/p1/mobile/putong/data/Broadcast;

    .line 386
    .line 387
    :cond_17
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 388
    .line 389
    if-eqz v1, :cond_18

    .line 390
    .line 391
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserSoulSettings;->clone()Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 396
    .line 397
    :cond_18
    iget v1, p0, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    .line 398
    .line 399
    iput v1, v0, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    .line 400
    .line 401
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 402
    .line 403
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 404
    .line 405
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    .line 406
    .line 407
    if-eqz v1, :cond_19

    .line 408
    .line 409
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/RichListUsers;->clone()Lcom/p1/mobile/putong/data/RichListUsers;

    .line 410
    .line 411
    .line 412
    move-result-object v1

    .line 413
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    .line 414
    .line 415
    :cond_19
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 416
    .line 417
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 418
    .line 419
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 420
    .line 421
    if-eqz v1, :cond_1a

    .line 422
    .line 423
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;->clone()Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 424
    .line 425
    .line 426
    move-result-object v1

    .line 427
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 428
    .line 429
    :cond_1a
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    .line 430
    .line 431
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    .line 432
    .line 433
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 434
    .line 435
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 436
    .line 437
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 438
    .line 439
    if-eqz v1, :cond_1b

    .line 440
    .line 441
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/FriendCommentInfo;->clone()Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 442
    .line 443
    .line 444
    move-result-object v1

    .line 445
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 446
    .line 447
    :cond_1b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 448
    .line 449
    if-eqz v1, :cond_1c

    .line 450
    .line 451
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/TotalRewardPoint;->clone()Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 452
    .line 453
    .line 454
    move-result-object v1

    .line 455
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 456
    .line 457
    :cond_1c
    iget v1, p0, Lcom/p1/mobile/putong/data/User;->minRichListPosition:I

    .line 458
    .line 459
    iput v1, v0, Lcom/p1/mobile/putong/data/User;->minRichListPosition:I

    .line 460
    .line 461
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 462
    .line 463
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 464
    .line 465
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 466
    .line 467
    if-eqz v1, :cond_1d

    .line 468
    .line 469
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->clone()Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 470
    .line 471
    .line 472
    move-result-object v1

    .line 473
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 474
    .line 475
    :cond_1d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 476
    .line 477
    if-eqz v1, :cond_1e

    .line 478
    .line 479
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->clone()Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 480
    .line 481
    .line 482
    move-result-object v1

    .line 483
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 484
    .line 485
    :cond_1e
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 486
    .line 487
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 488
    .line 489
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 490
    .line 491
    if-eqz v1, :cond_1f

    .line 492
    .line 493
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AvatarFrame;->clone()Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 494
    .line 495
    .line 496
    move-result-object v1

    .line 497
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 498
    .line 499
    :cond_1f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 500
    .line 501
    if-eqz v1, :cond_20

    .line 502
    .line 503
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/LiveUserLevel;->clone()Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 504
    .line 505
    .line 506
    move-result-object v1

    .line 507
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 508
    .line 509
    :cond_20
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localSoulShip:Lcom/p1/mobile/putong/data/SoulShip;

    .line 510
    .line 511
    if-eqz v1, :cond_21

    .line 512
    .line 513
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SoulShip;->clone()Lcom/p1/mobile/putong/data/SoulShip;

    .line 514
    .line 515
    .line 516
    move-result-object v1

    .line 517
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->localSoulShip:Lcom/p1/mobile/putong/data/SoulShip;

    .line 518
    .line 519
    :cond_21
    iget-wide v1, p0, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 520
    .line 521
    iput-wide v1, v0, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 522
    .line 523
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 524
    .line 525
    if-eqz v1, :cond_22

    .line 526
    .line 527
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/BanStatus;->clone()Lcom/p1/mobile/putong/data/BanStatus;

    .line 528
    .line 529
    .line 530
    move-result-object v1

    .line 531
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 532
    .line 533
    :cond_22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localDiamondPrivateMatchTags:Ljava/util/List;

    .line 534
    .line 535
    if-eqz v1, :cond_23

    .line 536
    .line 537
    new-instance v2, Ll/o6k0;

    .line 538
    .line 539
    invoke-direct {v2}, Ll/o6k0;-><init>()V

    .line 540
    .line 541
    .line 542
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 543
    .line 544
    .line 545
    move-result-object v1

    .line 546
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->localDiamondPrivateMatchTags:Ljava/util/List;

    .line 547
    .line 548
    :cond_23
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 549
    .line 550
    if-eqz v1, :cond_24

    .line 551
    .line 552
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;->clone()Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 553
    .line 554
    .line 555
    move-result-object v1

    .line 556
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 557
    .line 558
    :cond_24
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 559
    .line 560
    if-eqz v1, :cond_25

    .line 561
    .line 562
    new-instance v2, Ll/p6k0;

    .line 563
    .line 564
    invoke-direct {v2}, Ll/p6k0;-><init>()V

    .line 565
    .line 566
    .line 567
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 568
    .line 569
    .line 570
    move-result-object v1

    .line 571
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 572
    .line 573
    :cond_25
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 574
    .line 575
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 576
    .line 577
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 578
    .line 579
    if-eqz v1, :cond_26

    .line 580
    .line 581
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ActivityUser;->clone()Lcom/p1/mobile/putong/data/ActivityUser;

    .line 582
    .line 583
    .line 584
    move-result-object v1

    .line 585
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 586
    .line 587
    :cond_26
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 588
    .line 589
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 590
    .line 591
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 592
    .line 593
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 594
    .line 595
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 596
    .line 597
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 598
    .line 599
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 600
    .line 601
    if-eqz v1, :cond_27

    .line 602
    .line 603
    new-instance v2, Ll/f6k0;

    .line 604
    .line 605
    invoke-direct {v2}, Ll/f6k0;-><init>()V

    .line 606
    .line 607
    .line 608
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_map(Ljava/util/List;Ll/qcj;)Ljava/util/List;

    .line 609
    .line 610
    .line 611
    move-result-object v1

    .line 612
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 613
    .line 614
    :cond_27
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->deleted:Z

    .line 615
    .line 616
    iput-boolean v1, v0, Lcom/p1/mobile/putong/data/User;->deleted:Z

    .line 617
    .line 618
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 619
    .line 620
    if-eqz v1, :cond_28

    .line 621
    .line 622
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VoiceLiveState;->clone()Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 623
    .line 624
    .line 625
    move-result-object v1

    .line 626
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 627
    .line 628
    :cond_28
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 629
    .line 630
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 631
    .line 632
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 633
    .line 634
    if-eqz v1, :cond_29

    .line 635
    .line 636
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SpecialEffect;->clone()Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 637
    .line 638
    .line 639
    move-result-object v1

    .line 640
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 641
    .line 642
    :cond_29
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 643
    .line 644
    if-eqz v1, :cond_2a

    .line 645
    .line 646
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserActivityInfo;->clone()Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 647
    .line 648
    .line 649
    move-result-object v1

    .line 650
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 651
    .line 652
    :cond_2a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 653
    .line 654
    if-eqz v1, :cond_2b

    .line 655
    .line 656
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserIdealInfo;->clone()Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 657
    .line 658
    .line 659
    move-result-object v1

    .line 660
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 661
    .line 662
    :cond_2b
    iget p0, p0, Lcom/p1/mobile/putong/data/User;->popularity:F

    .line 663
    .line 664
    iput p0, v0, Lcom/p1/mobile/putong/data/User;->popularity:F

    .line 665
    .line 666
    return-object v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 667
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

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
    instance-of v1, p1, Lcom/p1/mobile/putong/data/User;

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
    check-cast v1, Lcom/p1/mobile/putong/data/User;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 32
    .line 33
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 52
    .line 53
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 62
    .line 63
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 72
    .line 73
    iget-wide v5, v1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 74
    .line 75
    cmpl-double p1, v3, v5

    .line 76
    .line 77
    if-nez p1, :cond_3

    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 80
    .line 81
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 82
    .line 83
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-eqz p1, :cond_3

    .line 88
    .line 89
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 90
    .line 91
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 92
    .line 93
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_3

    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 100
    .line 101
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 102
    .line 103
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    if-eqz p1, :cond_3

    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 110
    .line 111
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 112
    .line 113
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    if-eqz p1, :cond_3

    .line 118
    .line 119
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 120
    .line 121
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 122
    .line 123
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_3

    .line 128
    .line 129
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 130
    .line 131
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 132
    .line 133
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    move-result p1

    .line 137
    if-eqz p1, :cond_3

    .line 138
    .line 139
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 140
    .line 141
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 142
    .line 143
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result p1

    .line 147
    if-eqz p1, :cond_3

    .line 148
    .line 149
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 150
    .line 151
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 152
    .line 153
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result p1

    .line 157
    if-eqz p1, :cond_3

    .line 158
    .line 159
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 160
    .line 161
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 162
    .line 163
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result p1

    .line 167
    if-eqz p1, :cond_3

    .line 168
    .line 169
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 170
    .line 171
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 172
    .line 173
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-eqz p1, :cond_3

    .line 178
    .line 179
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 180
    .line 181
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 182
    .line 183
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p1

    .line 187
    if-eqz p1, :cond_3

    .line 188
    .line 189
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 190
    .line 191
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 192
    .line 193
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result p1

    .line 197
    if-eqz p1, :cond_3

    .line 198
    .line 199
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 200
    .line 201
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 202
    .line 203
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-eqz p1, :cond_3

    .line 208
    .line 209
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 210
    .line 211
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 212
    .line 213
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result p1

    .line 217
    if-eqz p1, :cond_3

    .line 218
    .line 219
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 220
    .line 221
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 222
    .line 223
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result p1

    .line 227
    if-eqz p1, :cond_3

    .line 228
    .line 229
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 230
    .line 231
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 232
    .line 233
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    if-eqz p1, :cond_3

    .line 238
    .line 239
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    .line 240
    .line 241
    iget-wide v5, v1, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    .line 242
    .line 243
    cmp-long p1, v3, v5

    .line 244
    .line 245
    if-nez p1, :cond_3

    .line 246
    .line 247
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

    .line 248
    .line 249
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

    .line 250
    .line 251
    if-ne p1, v3, :cond_3

    .line 252
    .line 253
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 254
    .line 255
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 256
    .line 257
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 258
    .line 259
    .line 260
    move-result p1

    .line 261
    if-eqz p1, :cond_3

    .line 262
    .line 263
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 264
    .line 265
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 266
    .line 267
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result p1

    .line 271
    if-eqz p1, :cond_3

    .line 272
    .line 273
    iget p1, p0, Lcom/p1/mobile/putong/data/User;->picksTagType:I

    .line 274
    .line 275
    iget v3, v1, Lcom/p1/mobile/putong/data/User;->picksTagType:I

    .line 276
    .line 277
    if-ne p1, v3, :cond_3

    .line 278
    .line 279
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 280
    .line 281
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 282
    .line 283
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result p1

    .line 287
    if-eqz p1, :cond_3

    .line 288
    .line 289
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    .line 290
    .line 291
    iget-wide v5, v1, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    .line 292
    .line 293
    cmpl-double p1, v3, v5

    .line 294
    .line 295
    if-nez p1, :cond_3

    .line 296
    .line 297
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/User;->isLord:Z

    .line 298
    .line 299
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/User;->isLord:Z

    .line 300
    .line 301
    if-ne p1, v3, :cond_3

    .line 302
    .line 303
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    .line 304
    .line 305
    iget-wide v5, v1, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    .line 306
    .line 307
    cmpl-double p1, v3, v5

    .line 308
    .line 309
    if-nez p1, :cond_3

    .line 310
    .line 311
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 312
    .line 313
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 314
    .line 315
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 316
    .line 317
    .line 318
    move-result p1

    .line 319
    if-eqz p1, :cond_3

    .line 320
    .line 321
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    .line 322
    .line 323
    iget-wide v5, v1, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    .line 324
    .line 325
    cmp-long p1, v3, v5

    .line 326
    .line 327
    if-nez p1, :cond_3

    .line 328
    .line 329
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 330
    .line 331
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 332
    .line 333
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 334
    .line 335
    .line 336
    move-result p1

    .line 337
    if-eqz p1, :cond_3

    .line 338
    .line 339
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    .line 340
    .line 341
    iget-wide v5, v1, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    .line 342
    .line 343
    cmp-long p1, v3, v5

    .line 344
    .line 345
    if-nez p1, :cond_3

    .line 346
    .line 347
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/User;->localLetterUnRead:Z

    .line 348
    .line 349
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/User;->localLetterUnRead:Z

    .line 350
    .line 351
    if-ne p1, v3, :cond_3

    .line 352
    .line 353
    iget p1, p0, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 354
    .line 355
    iget v3, v1, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 356
    .line 357
    if-ne p1, v3, :cond_3

    .line 358
    .line 359
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 360
    .line 361
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 362
    .line 363
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 364
    .line 365
    .line 366
    move-result p1

    .line 367
    if-eqz p1, :cond_3

    .line 368
    .line 369
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/User;->datingMode:Z

    .line 370
    .line 371
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/User;->datingMode:Z

    .line 372
    .line 373
    if-ne p1, v3, :cond_3

    .line 374
    .line 375
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 376
    .line 377
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 386
    .line 387
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 396
    .line 397
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 406
    .line 407
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 408
    .line 409
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 410
    .line 411
    .line 412
    move-result p1

    .line 413
    if-eqz p1, :cond_3

    .line 414
    .line 415
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 416
    .line 417
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 418
    .line 419
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 420
    .line 421
    .line 422
    move-result p1

    .line 423
    if-eqz p1, :cond_3

    .line 424
    .line 425
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    .line 426
    .line 427
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    .line 428
    .line 429
    if-ne p1, v3, :cond_3

    .line 430
    .line 431
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/User;->aiOrderPicture:Z

    .line 432
    .line 433
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/User;->aiOrderPicture:Z

    .line 434
    .line 435
    if-ne p1, v3, :cond_3

    .line 436
    .line 437
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 438
    .line 439
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 440
    .line 441
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 442
    .line 443
    .line 444
    move-result p1

    .line 445
    if-eqz p1, :cond_3

    .line 446
    .line 447
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;

    .line 448
    .line 449
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;

    .line 450
    .line 451
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 452
    .line 453
    .line 454
    move-result p1

    .line 455
    if-eqz p1, :cond_3

    .line 456
    .line 457
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 458
    .line 459
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 460
    .line 461
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 462
    .line 463
    .line 464
    move-result p1

    .line 465
    if-eqz p1, :cond_3

    .line 466
    .line 467
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 468
    .line 469
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 470
    .line 471
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 472
    .line 473
    .line 474
    move-result p1

    .line 475
    if-eqz p1, :cond_3

    .line 476
    .line 477
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->broadcast:Lcom/p1/mobile/putong/data/Broadcast;

    .line 478
    .line 479
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->broadcast:Lcom/p1/mobile/putong/data/Broadcast;

    .line 480
    .line 481
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 482
    .line 483
    .line 484
    move-result p1

    .line 485
    if-eqz p1, :cond_3

    .line 486
    .line 487
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 488
    .line 489
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 490
    .line 491
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 492
    .line 493
    .line 494
    move-result p1

    .line 495
    if-eqz p1, :cond_3

    .line 496
    .line 497
    iget p1, p0, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    .line 498
    .line 499
    iget v3, v1, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    .line 500
    .line 501
    if-ne p1, v3, :cond_3

    .line 502
    .line 503
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 504
    .line 505
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    .line 514
    .line 515
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    .line 516
    .line 517
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 518
    .line 519
    .line 520
    move-result p1

    .line 521
    if-eqz p1, :cond_3

    .line 522
    .line 523
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 524
    .line 525
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 526
    .line 527
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 528
    .line 529
    .line 530
    move-result p1

    .line 531
    if-eqz p1, :cond_3

    .line 532
    .line 533
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 534
    .line 535
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 536
    .line 537
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 538
    .line 539
    .line 540
    move-result p1

    .line 541
    if-eqz p1, :cond_3

    .line 542
    .line 543
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    .line 544
    .line 545
    iget-wide v5, v1, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    .line 546
    .line 547
    cmpl-double p1, v3, v5

    .line 548
    .line 549
    if-nez p1, :cond_3

    .line 550
    .line 551
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 552
    .line 553
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 562
    .line 563
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 572
    .line 573
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

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
    iget p1, p0, Lcom/p1/mobile/putong/data/User;->minRichListPosition:I

    .line 582
    .line 583
    iget v3, v1, Lcom/p1/mobile/putong/data/User;->minRichListPosition:I

    .line 584
    .line 585
    if-ne p1, v3, :cond_3

    .line 586
    .line 587
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 588
    .line 589
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 590
    .line 591
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 592
    .line 593
    .line 594
    move-result p1

    .line 595
    if-eqz p1, :cond_3

    .line 596
    .line 597
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 598
    .line 599
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 600
    .line 601
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 602
    .line 603
    .line 604
    move-result p1

    .line 605
    if-eqz p1, :cond_3

    .line 606
    .line 607
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 608
    .line 609
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 610
    .line 611
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 612
    .line 613
    .line 614
    move-result p1

    .line 615
    if-eqz p1, :cond_3

    .line 616
    .line 617
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 618
    .line 619
    iget-wide v5, v1, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 620
    .line 621
    cmp-long p1, v3, v5

    .line 622
    .line 623
    if-nez p1, :cond_3

    .line 624
    .line 625
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 626
    .line 627
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 628
    .line 629
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 630
    .line 631
    .line 632
    move-result p1

    .line 633
    if-eqz p1, :cond_3

    .line 634
    .line 635
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 636
    .line 637
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 638
    .line 639
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 640
    .line 641
    .line 642
    move-result p1

    .line 643
    if-eqz p1, :cond_3

    .line 644
    .line 645
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localSoulShip:Lcom/p1/mobile/putong/data/SoulShip;

    .line 646
    .line 647
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->localSoulShip:Lcom/p1/mobile/putong/data/SoulShip;

    .line 648
    .line 649
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 650
    .line 651
    .line 652
    move-result p1

    .line 653
    if-eqz p1, :cond_3

    .line 654
    .line 655
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 656
    .line 657
    iget-wide v5, v1, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 658
    .line 659
    cmpl-double p1, v3, v5

    .line 660
    .line 661
    if-nez p1, :cond_3

    .line 662
    .line 663
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 664
    .line 665
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 666
    .line 667
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 668
    .line 669
    .line 670
    move-result p1

    .line 671
    if-eqz p1, :cond_3

    .line 672
    .line 673
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localDiamondPrivateMatchTags:Ljava/util/List;

    .line 674
    .line 675
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->localDiamondPrivateMatchTags:Ljava/util/List;

    .line 676
    .line 677
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 678
    .line 679
    .line 680
    move-result p1

    .line 681
    if-eqz p1, :cond_3

    .line 682
    .line 683
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 684
    .line 685
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 686
    .line 687
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 688
    .line 689
    .line 690
    move-result p1

    .line 691
    if-eqz p1, :cond_3

    .line 692
    .line 693
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 694
    .line 695
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 696
    .line 697
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 698
    .line 699
    .line 700
    move-result p1

    .line 701
    if-eqz p1, :cond_3

    .line 702
    .line 703
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 704
    .line 705
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 706
    .line 707
    if-ne p1, v3, :cond_3

    .line 708
    .line 709
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 710
    .line 711
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 712
    .line 713
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 714
    .line 715
    .line 716
    move-result p1

    .line 717
    if-eqz p1, :cond_3

    .line 718
    .line 719
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 720
    .line 721
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 722
    .line 723
    if-ne p1, v3, :cond_3

    .line 724
    .line 725
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 726
    .line 727
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 728
    .line 729
    if-ne p1, v3, :cond_3

    .line 730
    .line 731
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 732
    .line 733
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 734
    .line 735
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 736
    .line 737
    .line 738
    move-result p1

    .line 739
    if-eqz p1, :cond_3

    .line 740
    .line 741
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 742
    .line 743
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 744
    .line 745
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 746
    .line 747
    .line 748
    move-result p1

    .line 749
    if-eqz p1, :cond_3

    .line 750
    .line 751
    iget-boolean p1, p0, Lcom/p1/mobile/putong/data/User;->deleted:Z

    .line 752
    .line 753
    iget-boolean v3, v1, Lcom/p1/mobile/putong/data/User;->deleted:Z

    .line 754
    .line 755
    if-ne p1, v3, :cond_3

    .line 756
    .line 757
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 758
    .line 759
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 760
    .line 761
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 762
    .line 763
    .line 764
    move-result p1

    .line 765
    if-eqz p1, :cond_3

    .line 766
    .line 767
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 768
    .line 769
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 770
    .line 771
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 772
    .line 773
    .line 774
    move-result p1

    .line 775
    if-eqz p1, :cond_3

    .line 776
    .line 777
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 778
    .line 779
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 780
    .line 781
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 782
    .line 783
    .line 784
    move-result p1

    .line 785
    if-eqz p1, :cond_3

    .line 786
    .line 787
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 788
    .line 789
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 790
    .line 791
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 792
    .line 793
    .line 794
    move-result p1

    .line 795
    if-eqz p1, :cond_3

    .line 796
    .line 797
    iget-object p1, p0, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 798
    .line 799
    iget-object v3, v1, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 800
    .line 801
    invoke-static {p1, v3}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 802
    .line 803
    .line 804
    move-result p1

    .line 805
    if-eqz p1, :cond_3

    .line 806
    .line 807
    iget p0, p0, Lcom/p1/mobile/putong/data/User;->popularity:F

    .line 808
    .line 809
    iget p1, v1, Lcom/p1/mobile/putong/data/User;->popularity:F

    .line 810
    .line 811
    cmpl-float p0, p0, p1

    .line 812
    .line 813
    if-nez p0, :cond_3

    .line 814
    .line 815
    return v0

    .line 816
    :cond_3
    return v2
.end method

.method public followedButNotMatched()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const-string v2, "matched"

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 9
    .line 10
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 22
    .line 23
    const-string v3, "following"

    .line 24
    .line 25
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 32
    .line 33
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    :cond_1
    const/4 p0, 0x1

    .line 40
    return p0

    .line 41
    :cond_2
    return v1
.end method

.method public fp()Lcom/p1/mobile/putong/data/Picture;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public getActiveTimeFromSvip()J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->frozenTime:J

    .line 36
    .line 37
    return-wide v0

    .line 38
    :cond_0
    const-wide/16 v0, 0x0

    .line 39
    .line 40
    return-wide v0
.end method

.method public getAiPictureStatus()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getAiPictureEnable()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    const-string p0, "none"

    .line 17
    .line 18
    return-object p0
.end method

.method public getAnonymousCoverIdentifier()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Anonymity;->identifier:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-lez v0, :cond_0

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    check-cast p0, Ljava/lang/String;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return-object p0
.end method

.method public getAnonymousUrl()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->voiceImgUrl:Ljava/util/List;

    .line 8
    .line 9
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->voiceImgUrl:Ljava/util/List;

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/lang/String;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_0
    const-string p0, ""

    .line 32
    .line 33
    return-object p0
.end method

.method public getClassParseName()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "user"

    .line 2
    .line 3
    return-object p0
.end method

.method public getCurrentPureMode()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->pureModeGroup:Ljava/lang/String;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    const-string p0, ""

    .line 29
    .line 30
    return-object p0
.end method

.method public getDefaultRiskAuditUser()Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->defaultRiskAuditUser:Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;-><init>(Lcom/p1/mobile/putong/data/User;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->defaultRiskAuditUser:Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->defaultRiskAuditUser:Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;

    .line 13
    .line 14
    return-object p0
.end method

.method public getFriendCommentCount()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsComments:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsComments:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public getFriendHistoryCommentCount()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsCommentsHistory:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsCommentsHistory:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public getHometown()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    const/4 v1, 0x0

    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 47
    .line 48
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 51
    .line 52
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ljava/lang/CharSequence;

    .line 59
    .line 60
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_0

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->city:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Ljava/lang/String;

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 82
    .line 83
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 86
    .line 87
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 88
    .line 89
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_1

    .line 94
    .line 95
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 96
    .line 97
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 98
    .line 99
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 100
    .line 101
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Ljava/lang/CharSequence;

    .line 108
    .line 109
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_1

    .line 114
    .line 115
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 116
    .line 117
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 118
    .line 119
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 120
    .line 121
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->province:Ljava/util/List;

    .line 122
    .line 123
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    check-cast p0, Ljava/lang/String;

    .line 128
    .line 129
    return-object p0

    .line 130
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 131
    .line 132
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 133
    .line 134
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 135
    .line 136
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 137
    .line 138
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-nez v0, :cond_2

    .line 143
    .line 144
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 145
    .line 146
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 147
    .line 148
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 149
    .line 150
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->country:Ljava/util/List;

    .line 151
    .line 152
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    check-cast p0, Ljava/lang/String;

    .line 157
    .line 158
    return-object p0

    .line 159
    :cond_2
    const-string p0, ""

    .line 160
    .line 161
    return-object p0
.end method

.method public getIdealList()Ljava/util/List;
    .locals 2
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    new-instance v0, Ljava/util/ArrayList;

    .line 46
    .line 47
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .line 49
    .line 50
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 55
    .line 56
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 57
    .line 58
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    if-eqz v1, :cond_0

    .line 67
    .line 68
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    check-cast v1, Lcom/p1/mobile/putong/data/IdealTag;

    .line 73
    .line 74
    iget-object v1, v1, Lcom/p1/mobile/putong/data/IdealTag;->id:Ljava/lang/String;

    .line 75
    .line 76
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_0
    return-object v0

    .line 81
    :cond_1
    const/4 p0, 0x0

    .line 82
    return-object p0
.end method

.method public getInterestCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestsCount:I

    .line 6
    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getLastActiveTimeMillis()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isHideActiveFromSVip()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/User;->getFrozenActiveTime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    return-wide v0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 13
    .line 14
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 15
    .line 16
    double-to-long v0, v0

    .line 17
    return-wide v0
.end method

.method public getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getMarriageDeclaration()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->declaration:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->declaration:Ljava/util/List;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ljava/lang/CharSequence;

    .line 59
    .line 60
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_0

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->declaration:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Ljava/lang/String;

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_0
    const-string p0, ""

    .line 82
    .line 83
    return-object p0
.end method

.method public getMarriageFamilyBackground()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->familyBackground:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->familyBackground:Ljava/util/List;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ljava/lang/CharSequence;

    .line 59
    .line 60
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_0

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->familyBackground:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Ljava/lang/String;

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_0
    const-string p0, ""

    .line 82
    .line 83
    return-object p0
.end method

.method public getMarriageFamilyBridePrice()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->bridePrice:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->bridePrice:Ljava/util/List;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ljava/lang/CharSequence;

    .line 59
    .line 60
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_0

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->bridePrice:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Ljava/lang/String;

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_0
    const-string p0, ""

    .line 82
    .line 83
    return-object p0
.end method

.method public getMarriagePrologue()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->prologue:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 46
    .line 47
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 48
    .line 49
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 50
    .line 51
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->prologue:Ljava/util/List;

    .line 52
    .line 53
    const/4 v1, 0x0

    .line 54
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Ljava/lang/CharSequence;

    .line 59
    .line 60
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_0

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->prologue:Ljava/util/List;

    .line 73
    .line 74
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    check-cast p0, Ljava/lang/String;

    .line 79
    .line 80
    return-object p0

    .line 81
    :cond_0
    const-string p0, ""

    .line 82
    .line 83
    return-object p0
.end method

.method public getMarryLifeMoment()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->lifeMoment:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->lifeMoment:Ljava/util/List;

    .line 52
    .line 53
    return-object p0

    .line 54
    :cond_0
    const/4 p0, 0x0

    .line 55
    return-object p0
.end method

.method public getMarryPosition()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->address:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_1

    .line 44
    .line 45
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/lit8 v0, v0, -0x1

    .line 50
    .line 51
    :goto_0
    if-ltz v0, :cond_1

    .line 52
    .line 53
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-nez v2, :cond_0

    .line 64
    .line 65
    return-object v1

    .line 66
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_1
    const-string p0, ""

    .line 70
    .line 71
    return-object p0
.end method

.method public getMembershipExpireTime(Lcom/p1/mobile/putong/data/MembershipType;)J
    .locals 4

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/h6k0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/h6k0;-><init>(Lcom/p1/mobile/putong/data/MembershipType;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    if-lez p1, :cond_2

    .line 17
    .line 18
    sget p1, Lcom/p1/mobile/putong/data/User;->MEMBERSHIP_DEFAULT_EXPIRE_TIME:I

    .line 19
    .line 20
    int-to-long v0, p1

    .line 21
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lcom/p1/mobile/putong/data/Membership;

    .line 36
    .line 37
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/Membership;->expiresTime:D

    .line 38
    .line 39
    double-to-long v2, v2

    .line 40
    cmp-long p1, v2, v0

    .line 41
    .line 42
    if-lez p1, :cond_0

    .line 43
    .line 44
    move-wide v0, v2

    .line 45
    goto :goto_0

    .line 46
    :cond_1
    return-wide v0

    .line 47
    :cond_2
    sget p0, Lcom/p1/mobile/putong/data/User;->MEMBERSHIP_DEFAULT_EXPIRE_TIME:I

    .line 48
    .line 49
    int-to-long p0, p0

    .line 50
    return-wide p0
.end method

.method public getMomentRoamLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/putong/data/DoublePair;->new_()Lcom/p1/mobile/putong/data/DoublePair;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getMomentLatitudeAndLongitude()Lcom/p1/mobile/putong/data/DoublePair;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public getPinyinOfRealName()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pinyinOfRealName:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPronoun()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    const-string v0, "female"

    .line 4
    .line 5
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "\u5979"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "\u4ed6"

    .line 15
    .line 16
    return-object p0
.end method

.method public getQualificationText()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->qualification:Ljava/util/List;

    .line 52
    .line 53
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_0

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-nez v0, :cond_0

    .line 71
    .line 72
    return-object p0

    .line 73
    :cond_0
    const-string p0, ""

    .line 74
    .line 75
    return-object p0
.end method

.method public getSchool()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 6
    .line 7
    return-object p0
.end method

.method public getSupremePartnerUserCode()I
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSupremePartnerUserCode()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public getUserHeight()Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 46
    .line 47
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 48
    .line 49
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Physical;->height:Ljava/util/List;

    .line 52
    .line 53
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_0

    .line 58
    .line 59
    const/4 v0, 0x0

    .line 60
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    check-cast v1, Ljava/lang/CharSequence;

    .line 65
    .line 66
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 67
    .line 68
    .line 69
    move-result v1

    .line 70
    if-nez v1, :cond_0

    .line 71
    .line 72
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    check-cast p0, Ljava/lang/String;

    .line 77
    .line 78
    return-object p0

    .line 79
    :cond_0
    const-string p0, ""

    .line 80
    .line 81
    return-object p0
.end method

.method public getUserInfoForMarryStatus()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/MarrySettings;->profileAudit:Ljava/lang/String;

    .line 26
    .line 27
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MarrySettings;->profileAudit:Ljava/lang/String;

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_0
    const-string p0, ""

    .line 39
    .line 40
    return-object p0
.end method

.method public getUserName()Ll/wyd0;
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "UserName"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v1, ""

    .line 20
    .line 21
    invoke-direct {v0, p0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method public getUserPicture()Ll/wyd0;
    .locals 3

    .line 1
    new-instance v0, Ll/wyd0;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "UserPicture"

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v1, ""

    .line 20
    .line 21
    invoke-direct {v0, p0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method public getUserPushAllEnable()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->userPushAllEnable()Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public getVipExpireTime()J
    .locals 2

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide v0, 0x7fffffffffffffffL

    return-wide v0

    .line 1
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 2
    .line 3
    new-instance v1, Ll/e6k0;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/e6k0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-lez v0, :cond_1

    .line 17
    .line 18
    const-string v0, "vip"

    .line 19
    .line 20
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MembershipType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MembershipType;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->getMembershipExpireTime(Lcom/p1/mobile/putong/data/MembershipType;)J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    return-wide v0

    .line 29
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 30
    .line 31
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/Membership;->expiresTime:D

    .line 32
    .line 33
    double-to-long v0, v0

    .line 34
    return-wide v0
.end method

.method public getVipToExpireTimeInMill()J
    .locals 4

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const-wide v0, 0x7fffffffffffffffL

    return-wide v0

    .line 1
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getVipExpireTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v2

    .line 11
    sub-long/2addr v0, v2

    .line 12
    return-wide v0
.end method

.method public gpHideActiveTime()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isVIP()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public gpHideVip()Z
    .locals 1

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 1
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 2
    .line 3
    iget-boolean v0, v0, Lcom/p1/mobile/putong/data/Membership;->hideVIP:Z

    .line 4
    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isHideIconFromSVip()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public hasAuditedMarray()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/MarrySettings;->hasEntered:Z

    .line 26
    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public hasFriendComment()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsComments:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public hasHistoryFriendComment()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->friendsCommentsHistory:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public hasIdealInfo()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->ideal:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_0

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_0
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public hasInterestUser()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/data/FriendCommentInfo;->interestsCount:I

    .line 6
    .line 7
    if-lez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public hasPic()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-nez p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    return v1
.end method

.method public hasSoulAvatar()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserSoulSettings;->picture:Lcom/p1/mobile/putong/data/SoulHead;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SoulHead;->url:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

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

.method public hasVideoMedia()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 26
    .line 27
    instance-of v0, v0, Lcom/p1/mobile/putong/data/Video;

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public hashCode()I
    .locals 10

    .line 1
    iget v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 2
    .line 3
    if-nez v0, :cond_49

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/Location;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 52
    .line 53
    if-eqz v1, :cond_3

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/Integer;->hashCode()I

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
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 65
    .line 66
    if-eqz v1, :cond_4

    .line 67
    .line 68
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

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
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 76
    .line 77
    invoke-static {v3, v4}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 78
    .line 79
    .line 80
    move-result-wide v3

    .line 81
    mul-int/lit8 v0, v0, 0x29

    .line 82
    .line 83
    const/16 v1, 0x20

    .line 84
    .line 85
    ushr-long v5, v3, v1

    .line 86
    .line 87
    xor-long/2addr v3, v5

    .line 88
    long-to-int v3, v3

    .line 89
    add-int/2addr v0, v3

    .line 90
    mul-int/lit8 v0, v0, 0x29

    .line 91
    .line 92
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 93
    .line 94
    if-eqz v3, :cond_5

    .line 95
    .line 96
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Profile;->hashCode()I

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    goto :goto_5

    .line 101
    :cond_5
    move v3, v2

    .line 102
    :goto_5
    add-int/2addr v0, v3

    .line 103
    mul-int/lit8 v0, v0, 0x29

    .line 104
    .line 105
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 106
    .line 107
    if-eqz v3, :cond_6

    .line 108
    .line 109
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    goto :goto_6

    .line 114
    :cond_6
    move v3, v2

    .line 115
    :goto_6
    add-int/2addr v0, v3

    .line 116
    mul-int/lit8 v0, v0, 0x29

    .line 117
    .line 118
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 119
    .line 120
    if-eqz v3, :cond_7

    .line 121
    .line 122
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Settings;->hashCode()I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    goto :goto_7

    .line 127
    :cond_7
    move v3, v2

    .line 128
    :goto_7
    add-int/2addr v0, v3

    .line 129
    mul-int/lit8 v0, v0, 0x29

    .line 130
    .line 131
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 132
    .line 133
    if-eqz v3, :cond_8

    .line 134
    .line 135
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    goto :goto_8

    .line 140
    :cond_8
    move v3, v2

    .line 141
    :goto_8
    add-int/2addr v0, v3

    .line 142
    mul-int/lit8 v0, v0, 0x29

    .line 143
    .line 144
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 145
    .line 146
    if-eqz v3, :cond_9

    .line 147
    .line 148
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Relationship;->hashCode()I

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    goto :goto_9

    .line 153
    :cond_9
    move v3, v2

    .line 154
    :goto_9
    add-int/2addr v0, v3

    .line 155
    mul-int/lit8 v0, v0, 0x29

    .line 156
    .line 157
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 158
    .line 159
    if-eqz v3, :cond_a

    .line 160
    .line 161
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Membership;->hashCode()I

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    goto :goto_a

    .line 166
    :cond_a
    move v3, v2

    .line 167
    :goto_a
    add-int/2addr v0, v3

    .line 168
    mul-int/lit8 v0, v0, 0x29

    .line 169
    .line 170
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 171
    .line 172
    if-eqz v3, :cond_b

    .line 173
    .line 174
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    goto :goto_b

    .line 179
    :cond_b
    move v3, v2

    .line 180
    :goto_b
    add-int/2addr v0, v3

    .line 181
    mul-int/lit8 v0, v0, 0x29

    .line 182
    .line 183
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 184
    .line 185
    if-eqz v3, :cond_c

    .line 186
    .line 187
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 188
    .line 189
    .line 190
    move-result v3

    .line 191
    goto :goto_c

    .line 192
    :cond_c
    move v3, v2

    .line 193
    :goto_c
    add-int/2addr v0, v3

    .line 194
    mul-int/lit8 v0, v0, 0x29

    .line 195
    .line 196
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 197
    .line 198
    if-eqz v3, :cond_d

    .line 199
    .line 200
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Followship;->hashCode()I

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    goto :goto_d

    .line 205
    :cond_d
    move v3, v2

    .line 206
    :goto_d
    add-int/2addr v0, v3

    .line 207
    mul-int/lit8 v0, v0, 0x29

    .line 208
    .line 209
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 210
    .line 211
    if-eqz v3, :cond_e

    .line 212
    .line 213
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 214
    .line 215
    .line 216
    move-result v3

    .line 217
    goto :goto_e

    .line 218
    :cond_e
    move v3, v2

    .line 219
    :goto_e
    add-int/2addr v0, v3

    .line 220
    mul-int/lit8 v0, v0, 0x29

    .line 221
    .line 222
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 223
    .line 224
    if-eqz v3, :cond_f

    .line 225
    .line 226
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 227
    .line 228
    .line 229
    move-result v3

    .line 230
    goto :goto_f

    .line 231
    :cond_f
    move v3, v2

    .line 232
    :goto_f
    add-int/2addr v0, v3

    .line 233
    mul-int/lit8 v0, v0, 0x29

    .line 234
    .line 235
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 236
    .line 237
    if-eqz v3, :cond_10

    .line 238
    .line 239
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/UserState;->hashCode()I

    .line 240
    .line 241
    .line 242
    move-result v3

    .line 243
    goto :goto_10

    .line 244
    :cond_10
    move v3, v2

    .line 245
    :goto_10
    add-int/2addr v0, v3

    .line 246
    mul-int/lit8 v0, v0, 0x29

    .line 247
    .line 248
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 249
    .line 250
    if-eqz v3, :cond_11

    .line 251
    .line 252
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/PicVerification;->hashCode()I

    .line 253
    .line 254
    .line 255
    move-result v3

    .line 256
    goto :goto_11

    .line 257
    :cond_11
    move v3, v2

    .line 258
    :goto_11
    add-int/2addr v0, v3

    .line 259
    mul-int/lit8 v0, v0, 0x29

    .line 260
    .line 261
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 262
    .line 263
    if-eqz v3, :cond_12

    .line 264
    .line 265
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 266
    .line 267
    .line 268
    move-result v3

    .line 269
    goto :goto_12

    .line 270
    :cond_12
    move v3, v2

    .line 271
    :goto_12
    add-int/2addr v0, v3

    .line 272
    mul-int/lit8 v0, v0, 0x29

    .line 273
    .line 274
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 275
    .line 276
    if-eqz v3, :cond_13

    .line 277
    .line 278
    invoke-interface {v3}, Ljava/util/List;->hashCode()I

    .line 279
    .line 280
    .line 281
    move-result v3

    .line 282
    goto :goto_13

    .line 283
    :cond_13
    move v3, v2

    .line 284
    :goto_13
    add-int/2addr v0, v3

    .line 285
    mul-int/lit8 v0, v0, 0x29

    .line 286
    .line 287
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 288
    .line 289
    if-eqz v3, :cond_14

    .line 290
    .line 291
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Membership;->hashCode()I

    .line 292
    .line 293
    .line 294
    move-result v3

    .line 295
    goto :goto_14

    .line 296
    :cond_14
    move v3, v2

    .line 297
    :goto_14
    add-int/2addr v0, v3

    .line 298
    mul-int/lit8 v0, v0, 0x29

    .line 299
    .line 300
    iget-wide v3, p0, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    .line 301
    .line 302
    ushr-long v5, v3, v1

    .line 303
    .line 304
    xor-long/2addr v3, v5

    .line 305
    long-to-int v3, v3

    .line 306
    add-int/2addr v0, v3

    .line 307
    mul-int/lit8 v0, v0, 0x29

    .line 308
    .line 309
    iget-boolean v3, p0, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

    .line 310
    .line 311
    const/16 v4, 0x4d5

    .line 312
    .line 313
    const/16 v5, 0x4cf

    .line 314
    .line 315
    if-eqz v3, :cond_15

    .line 316
    .line 317
    move v3, v5

    .line 318
    goto :goto_15

    .line 319
    :cond_15
    move v3, v4

    .line 320
    :goto_15
    add-int/2addr v0, v3

    .line 321
    mul-int/lit8 v0, v0, 0x29

    .line 322
    .line 323
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 324
    .line 325
    if-eqz v3, :cond_16

    .line 326
    .line 327
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 328
    .line 329
    .line 330
    move-result v3

    .line 331
    goto :goto_16

    .line 332
    :cond_16
    move v3, v2

    .line 333
    :goto_16
    add-int/2addr v0, v3

    .line 334
    mul-int/lit8 v0, v0, 0x29

    .line 335
    .line 336
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 337
    .line 338
    if-eqz v3, :cond_17

    .line 339
    .line 340
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/UserCreditData;->hashCode()I

    .line 341
    .line 342
    .line 343
    move-result v3

    .line 344
    goto :goto_17

    .line 345
    :cond_17
    move v3, v2

    .line 346
    :goto_17
    add-int/2addr v0, v3

    .line 347
    mul-int/lit8 v0, v0, 0x29

    .line 348
    .line 349
    iget v3, p0, Lcom/p1/mobile/putong/data/User;->picksTagType:I

    .line 350
    .line 351
    add-int/2addr v0, v3

    .line 352
    mul-int/lit8 v0, v0, 0x29

    .line 353
    .line 354
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 355
    .line 356
    if-eqz v3, :cond_18

    .line 357
    .line 358
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 359
    .line 360
    .line 361
    move-result v3

    .line 362
    goto :goto_18

    .line 363
    :cond_18
    move v3, v2

    .line 364
    :goto_18
    add-int/2addr v0, v3

    .line 365
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    .line 366
    .line 367
    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 368
    .line 369
    .line 370
    move-result-wide v6

    .line 371
    mul-int/lit8 v0, v0, 0x29

    .line 372
    .line 373
    ushr-long v8, v6, v1

    .line 374
    .line 375
    xor-long/2addr v6, v8

    .line 376
    long-to-int v3, v6

    .line 377
    add-int/2addr v0, v3

    .line 378
    mul-int/lit8 v0, v0, 0x29

    .line 379
    .line 380
    iget-boolean v3, p0, Lcom/p1/mobile/putong/data/User;->isLord:Z

    .line 381
    .line 382
    if-eqz v3, :cond_19

    .line 383
    .line 384
    move v3, v5

    .line 385
    goto :goto_19

    .line 386
    :cond_19
    move v3, v4

    .line 387
    :goto_19
    add-int/2addr v0, v3

    .line 388
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    .line 389
    .line 390
    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 391
    .line 392
    .line 393
    move-result-wide v6

    .line 394
    mul-int/lit8 v0, v0, 0x29

    .line 395
    .line 396
    ushr-long v8, v6, v1

    .line 397
    .line 398
    xor-long/2addr v6, v8

    .line 399
    long-to-int v3, v6

    .line 400
    add-int/2addr v0, v3

    .line 401
    mul-int/lit8 v0, v0, 0x29

    .line 402
    .line 403
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 404
    .line 405
    if-eqz v3, :cond_1a

    .line 406
    .line 407
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 408
    .line 409
    .line 410
    move-result v3

    .line 411
    goto :goto_1a

    .line 412
    :cond_1a
    move v3, v2

    .line 413
    :goto_1a
    add-int/2addr v0, v3

    .line 414
    mul-int/lit8 v0, v0, 0x29

    .line 415
    .line 416
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    .line 417
    .line 418
    ushr-long v8, v6, v1

    .line 419
    .line 420
    xor-long/2addr v6, v8

    .line 421
    long-to-int v3, v6

    .line 422
    add-int/2addr v0, v3

    .line 423
    mul-int/lit8 v0, v0, 0x29

    .line 424
    .line 425
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 426
    .line 427
    if-eqz v3, :cond_1b

    .line 428
    .line 429
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 430
    .line 431
    .line 432
    move-result v3

    .line 433
    goto :goto_1b

    .line 434
    :cond_1b
    move v3, v2

    .line 435
    :goto_1b
    add-int/2addr v0, v3

    .line 436
    mul-int/lit8 v0, v0, 0x29

    .line 437
    .line 438
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    .line 439
    .line 440
    ushr-long v8, v6, v1

    .line 441
    .line 442
    xor-long/2addr v6, v8

    .line 443
    long-to-int v3, v6

    .line 444
    add-int/2addr v0, v3

    .line 445
    mul-int/lit8 v0, v0, 0x29

    .line 446
    .line 447
    iget-boolean v3, p0, Lcom/p1/mobile/putong/data/User;->localLetterUnRead:Z

    .line 448
    .line 449
    if-eqz v3, :cond_1c

    .line 450
    .line 451
    move v3, v5

    .line 452
    goto :goto_1c

    .line 453
    :cond_1c
    move v3, v4

    .line 454
    :goto_1c
    add-int/2addr v0, v3

    .line 455
    mul-int/lit8 v0, v0, 0x29

    .line 456
    .line 457
    iget v3, p0, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 458
    .line 459
    add-int/2addr v0, v3

    .line 460
    mul-int/lit8 v0, v0, 0x29

    .line 461
    .line 462
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 463
    .line 464
    if-eqz v3, :cond_1d

    .line 465
    .line 466
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/AudioSignature;->hashCode()I

    .line 467
    .line 468
    .line 469
    move-result v3

    .line 470
    goto :goto_1d

    .line 471
    :cond_1d
    move v3, v2

    .line 472
    :goto_1d
    add-int/2addr v0, v3

    .line 473
    mul-int/lit8 v0, v0, 0x29

    .line 474
    .line 475
    iget-boolean v3, p0, Lcom/p1/mobile/putong/data/User;->datingMode:Z

    .line 476
    .line 477
    if-eqz v3, :cond_1e

    .line 478
    .line 479
    move v3, v5

    .line 480
    goto :goto_1e

    .line 481
    :cond_1e
    move v3, v4

    .line 482
    :goto_1e
    add-int/2addr v0, v3

    .line 483
    mul-int/lit8 v0, v0, 0x29

    .line 484
    .line 485
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 486
    .line 487
    if-eqz v3, :cond_1f

    .line 488
    .line 489
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/UserLiveState;->hashCode()I

    .line 490
    .line 491
    .line 492
    move-result v3

    .line 493
    goto :goto_1f

    .line 494
    :cond_1f
    move v3, v2

    .line 495
    :goto_1f
    add-int/2addr v0, v3

    .line 496
    mul-int/lit8 v0, v0, 0x29

    .line 497
    .line 498
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 499
    .line 500
    if-eqz v3, :cond_20

    .line 501
    .line 502
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/UssTags;->hashCode()I

    .line 503
    .line 504
    .line 505
    move-result v3

    .line 506
    goto :goto_20

    .line 507
    :cond_20
    move v3, v2

    .line 508
    :goto_20
    add-int/2addr v0, v3

    .line 509
    mul-int/lit8 v0, v0, 0x29

    .line 510
    .line 511
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 512
    .line 513
    if-eqz v3, :cond_21

    .line 514
    .line 515
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/UserAbroad;->hashCode()I

    .line 516
    .line 517
    .line 518
    move-result v3

    .line 519
    goto :goto_21

    .line 520
    :cond_21
    move v3, v2

    .line 521
    :goto_21
    add-int/2addr v0, v3

    .line 522
    mul-int/lit8 v0, v0, 0x29

    .line 523
    .line 524
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 525
    .line 526
    if-eqz v3, :cond_22

    .line 527
    .line 528
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/StatusesItem;->hashCode()I

    .line 529
    .line 530
    .line 531
    move-result v3

    .line 532
    goto :goto_22

    .line 533
    :cond_22
    move v3, v2

    .line 534
    :goto_22
    add-int/2addr v0, v3

    .line 535
    mul-int/lit8 v0, v0, 0x29

    .line 536
    .line 537
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 538
    .line 539
    if-eqz v3, :cond_23

    .line 540
    .line 541
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/StatusesItem;->hashCode()I

    .line 542
    .line 543
    .line 544
    move-result v3

    .line 545
    goto :goto_23

    .line 546
    :cond_23
    move v3, v2

    .line 547
    :goto_23
    add-int/2addr v0, v3

    .line 548
    mul-int/lit8 v0, v0, 0x29

    .line 549
    .line 550
    iget-boolean v3, p0, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    .line 551
    .line 552
    if-eqz v3, :cond_24

    .line 553
    .line 554
    move v3, v5

    .line 555
    goto :goto_24

    .line 556
    :cond_24
    move v3, v4

    .line 557
    :goto_24
    add-int/2addr v0, v3

    .line 558
    mul-int/lit8 v0, v0, 0x29

    .line 559
    .line 560
    iget-boolean v3, p0, Lcom/p1/mobile/putong/data/User;->aiOrderPicture:Z

    .line 561
    .line 562
    if-eqz v3, :cond_25

    .line 563
    .line 564
    move v3, v5

    .line 565
    goto :goto_25

    .line 566
    :cond_25
    move v3, v4

    .line 567
    :goto_25
    add-int/2addr v0, v3

    .line 568
    mul-int/lit8 v0, v0, 0x29

    .line 569
    .line 570
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 571
    .line 572
    if-eqz v3, :cond_26

    .line 573
    .line 574
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/UserMedalWrapper;->hashCode()I

    .line 575
    .line 576
    .line 577
    move-result v3

    .line 578
    goto :goto_26

    .line 579
    :cond_26
    move v3, v2

    .line 580
    :goto_26
    add-int/2addr v0, v3

    .line 581
    mul-int/lit8 v0, v0, 0x29

    .line 582
    .line 583
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;

    .line 584
    .line 585
    if-eqz v3, :cond_27

    .line 586
    .line 587
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/VisitPlace;->hashCode()I

    .line 588
    .line 589
    .line 590
    move-result v3

    .line 591
    goto :goto_27

    .line 592
    :cond_27
    move v3, v2

    .line 593
    :goto_27
    add-int/2addr v0, v3

    .line 594
    mul-int/lit8 v0, v0, 0x29

    .line 595
    .line 596
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 597
    .line 598
    if-eqz v3, :cond_28

    .line 599
    .line 600
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->hashCode()I

    .line 601
    .line 602
    .line 603
    move-result v3

    .line 604
    goto :goto_28

    .line 605
    :cond_28
    move v3, v2

    .line 606
    :goto_28
    add-int/2addr v0, v3

    .line 607
    mul-int/lit8 v0, v0, 0x29

    .line 608
    .line 609
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 610
    .line 611
    if-eqz v3, :cond_29

    .line 612
    .line 613
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 614
    .line 615
    .line 616
    move-result v3

    .line 617
    goto :goto_29

    .line 618
    :cond_29
    move v3, v2

    .line 619
    :goto_29
    add-int/2addr v0, v3

    .line 620
    mul-int/lit8 v0, v0, 0x29

    .line 621
    .line 622
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->broadcast:Lcom/p1/mobile/putong/data/Broadcast;

    .line 623
    .line 624
    if-eqz v3, :cond_2a

    .line 625
    .line 626
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/Broadcast;->hashCode()I

    .line 627
    .line 628
    .line 629
    move-result v3

    .line 630
    goto :goto_2a

    .line 631
    :cond_2a
    move v3, v2

    .line 632
    :goto_2a
    add-int/2addr v0, v3

    .line 633
    mul-int/lit8 v0, v0, 0x29

    .line 634
    .line 635
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 636
    .line 637
    if-eqz v3, :cond_2b

    .line 638
    .line 639
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/UserSoulSettings;->hashCode()I

    .line 640
    .line 641
    .line 642
    move-result v3

    .line 643
    goto :goto_2b

    .line 644
    :cond_2b
    move v3, v2

    .line 645
    :goto_2b
    add-int/2addr v0, v3

    .line 646
    mul-int/lit8 v0, v0, 0x29

    .line 647
    .line 648
    iget v3, p0, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    .line 649
    .line 650
    add-int/2addr v0, v3

    .line 651
    mul-int/lit8 v0, v0, 0x29

    .line 652
    .line 653
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 654
    .line 655
    if-eqz v3, :cond_2c

    .line 656
    .line 657
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 658
    .line 659
    .line 660
    move-result v3

    .line 661
    goto :goto_2c

    .line 662
    :cond_2c
    move v3, v2

    .line 663
    :goto_2c
    add-int/2addr v0, v3

    .line 664
    mul-int/lit8 v0, v0, 0x29

    .line 665
    .line 666
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    .line 667
    .line 668
    if-eqz v3, :cond_2d

    .line 669
    .line 670
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/RichListUsers;->hashCode()I

    .line 671
    .line 672
    .line 673
    move-result v3

    .line 674
    goto :goto_2d

    .line 675
    :cond_2d
    move v3, v2

    .line 676
    :goto_2d
    add-int/2addr v0, v3

    .line 677
    mul-int/lit8 v0, v0, 0x29

    .line 678
    .line 679
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 680
    .line 681
    if-eqz v3, :cond_2e

    .line 682
    .line 683
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 684
    .line 685
    .line 686
    move-result v3

    .line 687
    goto :goto_2e

    .line 688
    :cond_2e
    move v3, v2

    .line 689
    :goto_2e
    add-int/2addr v0, v3

    .line 690
    mul-int/lit8 v0, v0, 0x29

    .line 691
    .line 692
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 693
    .line 694
    if-eqz v3, :cond_2f

    .line 695
    .line 696
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;->hashCode()I

    .line 697
    .line 698
    .line 699
    move-result v3

    .line 700
    goto :goto_2f

    .line 701
    :cond_2f
    move v3, v2

    .line 702
    :goto_2f
    add-int/2addr v0, v3

    .line 703
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    .line 704
    .line 705
    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 706
    .line 707
    .line 708
    move-result-wide v6

    .line 709
    mul-int/lit8 v0, v0, 0x29

    .line 710
    .line 711
    ushr-long v8, v6, v1

    .line 712
    .line 713
    xor-long/2addr v6, v8

    .line 714
    long-to-int v3, v6

    .line 715
    add-int/2addr v0, v3

    .line 716
    mul-int/lit8 v0, v0, 0x29

    .line 717
    .line 718
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 719
    .line 720
    if-eqz v3, :cond_30

    .line 721
    .line 722
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 723
    .line 724
    .line 725
    move-result v3

    .line 726
    goto :goto_30

    .line 727
    :cond_30
    move v3, v2

    .line 728
    :goto_30
    add-int/2addr v0, v3

    .line 729
    mul-int/lit8 v0, v0, 0x29

    .line 730
    .line 731
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 732
    .line 733
    if-eqz v3, :cond_31

    .line 734
    .line 735
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/FriendCommentInfo;->hashCode()I

    .line 736
    .line 737
    .line 738
    move-result v3

    .line 739
    goto :goto_31

    .line 740
    :cond_31
    move v3, v2

    .line 741
    :goto_31
    add-int/2addr v0, v3

    .line 742
    mul-int/lit8 v0, v0, 0x29

    .line 743
    .line 744
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 745
    .line 746
    if-eqz v3, :cond_32

    .line 747
    .line 748
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/TotalRewardPoint;->hashCode()I

    .line 749
    .line 750
    .line 751
    move-result v3

    .line 752
    goto :goto_32

    .line 753
    :cond_32
    move v3, v2

    .line 754
    :goto_32
    add-int/2addr v0, v3

    .line 755
    mul-int/lit8 v0, v0, 0x29

    .line 756
    .line 757
    iget v3, p0, Lcom/p1/mobile/putong/data/User;->minRichListPosition:I

    .line 758
    .line 759
    add-int/2addr v0, v3

    .line 760
    mul-int/lit8 v0, v0, 0x29

    .line 761
    .line 762
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 763
    .line 764
    if-eqz v3, :cond_33

    .line 765
    .line 766
    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    .line 767
    .line 768
    .line 769
    move-result v3

    .line 770
    goto :goto_33

    .line 771
    :cond_33
    move v3, v2

    .line 772
    :goto_33
    add-int/2addr v0, v3

    .line 773
    mul-int/lit8 v0, v0, 0x29

    .line 774
    .line 775
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 776
    .line 777
    if-eqz v3, :cond_34

    .line 778
    .line 779
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->hashCode()I

    .line 780
    .line 781
    .line 782
    move-result v3

    .line 783
    goto :goto_34

    .line 784
    :cond_34
    move v3, v2

    .line 785
    :goto_34
    add-int/2addr v0, v3

    .line 786
    mul-int/lit8 v0, v0, 0x29

    .line 787
    .line 788
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 789
    .line 790
    if-eqz v3, :cond_35

    .line 791
    .line 792
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->hashCode()I

    .line 793
    .line 794
    .line 795
    move-result v3

    .line 796
    goto :goto_35

    .line 797
    :cond_35
    move v3, v2

    .line 798
    :goto_35
    add-int/2addr v0, v3

    .line 799
    mul-int/lit8 v0, v0, 0x29

    .line 800
    .line 801
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 802
    .line 803
    ushr-long v8, v6, v1

    .line 804
    .line 805
    xor-long/2addr v6, v8

    .line 806
    long-to-int v3, v6

    .line 807
    add-int/2addr v0, v3

    .line 808
    mul-int/lit8 v0, v0, 0x29

    .line 809
    .line 810
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 811
    .line 812
    if-eqz v3, :cond_36

    .line 813
    .line 814
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/AvatarFrame;->hashCode()I

    .line 815
    .line 816
    .line 817
    move-result v3

    .line 818
    goto :goto_36

    .line 819
    :cond_36
    move v3, v2

    .line 820
    :goto_36
    add-int/2addr v0, v3

    .line 821
    mul-int/lit8 v0, v0, 0x29

    .line 822
    .line 823
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 824
    .line 825
    if-eqz v3, :cond_37

    .line 826
    .line 827
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/LiveUserLevel;->hashCode()I

    .line 828
    .line 829
    .line 830
    move-result v3

    .line 831
    goto :goto_37

    .line 832
    :cond_37
    move v3, v2

    .line 833
    :goto_37
    add-int/2addr v0, v3

    .line 834
    mul-int/lit8 v0, v0, 0x29

    .line 835
    .line 836
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->localSoulShip:Lcom/p1/mobile/putong/data/SoulShip;

    .line 837
    .line 838
    if-eqz v3, :cond_38

    .line 839
    .line 840
    invoke-virtual {v3}, Lcom/p1/mobile/putong/data/SoulShip;->hashCode()I

    .line 841
    .line 842
    .line 843
    move-result v3

    .line 844
    goto :goto_38

    .line 845
    :cond_38
    move v3, v2

    .line 846
    :goto_38
    add-int/2addr v0, v3

    .line 847
    iget-wide v6, p0, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 848
    .line 849
    invoke-static {v6, v7}, Ljava/lang/Double;->doubleToLongBits(D)J

    .line 850
    .line 851
    .line 852
    move-result-wide v6

    .line 853
    mul-int/lit8 v0, v0, 0x29

    .line 854
    .line 855
    ushr-long v8, v6, v1

    .line 856
    .line 857
    xor-long/2addr v6, v8

    .line 858
    long-to-int v1, v6

    .line 859
    add-int/2addr v0, v1

    .line 860
    mul-int/lit8 v0, v0, 0x29

    .line 861
    .line 862
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 863
    .line 864
    if-eqz v1, :cond_39

    .line 865
    .line 866
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/BanStatus;->hashCode()I

    .line 867
    .line 868
    .line 869
    move-result v1

    .line 870
    goto :goto_39

    .line 871
    :cond_39
    move v1, v2

    .line 872
    :goto_39
    add-int/2addr v0, v1

    .line 873
    mul-int/lit8 v0, v0, 0x29

    .line 874
    .line 875
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localDiamondPrivateMatchTags:Ljava/util/List;

    .line 876
    .line 877
    if-eqz v1, :cond_3a

    .line 878
    .line 879
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 880
    .line 881
    .line 882
    move-result v1

    .line 883
    goto :goto_3a

    .line 884
    :cond_3a
    move v1, v2

    .line 885
    :goto_3a
    add-int/2addr v0, v1

    .line 886
    mul-int/lit8 v0, v0, 0x29

    .line 887
    .line 888
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 889
    .line 890
    if-eqz v1, :cond_3b

    .line 891
    .line 892
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;->hashCode()I

    .line 893
    .line 894
    .line 895
    move-result v1

    .line 896
    goto :goto_3b

    .line 897
    :cond_3b
    move v1, v2

    .line 898
    :goto_3b
    add-int/2addr v0, v1

    .line 899
    mul-int/lit8 v0, v0, 0x29

    .line 900
    .line 901
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 902
    .line 903
    if-eqz v1, :cond_3c

    .line 904
    .line 905
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 906
    .line 907
    .line 908
    move-result v1

    .line 909
    goto :goto_3c

    .line 910
    :cond_3c
    move v1, v2

    .line 911
    :goto_3c
    add-int/2addr v0, v1

    .line 912
    mul-int/lit8 v0, v0, 0x29

    .line 913
    .line 914
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 915
    .line 916
    if-eqz v1, :cond_3d

    .line 917
    .line 918
    move v1, v5

    .line 919
    goto :goto_3d

    .line 920
    :cond_3d
    move v1, v4

    .line 921
    :goto_3d
    add-int/2addr v0, v1

    .line 922
    mul-int/lit8 v0, v0, 0x29

    .line 923
    .line 924
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 925
    .line 926
    if-eqz v1, :cond_3e

    .line 927
    .line 928
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/ActivityUser;->hashCode()I

    .line 929
    .line 930
    .line 931
    move-result v1

    .line 932
    goto :goto_3e

    .line 933
    :cond_3e
    move v1, v2

    .line 934
    :goto_3e
    add-int/2addr v0, v1

    .line 935
    mul-int/lit8 v0, v0, 0x29

    .line 936
    .line 937
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 938
    .line 939
    if-eqz v1, :cond_3f

    .line 940
    .line 941
    move v1, v5

    .line 942
    goto :goto_3f

    .line 943
    :cond_3f
    move v1, v4

    .line 944
    :goto_3f
    add-int/2addr v0, v1

    .line 945
    mul-int/lit8 v0, v0, 0x29

    .line 946
    .line 947
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 948
    .line 949
    if-eqz v1, :cond_40

    .line 950
    .line 951
    move v1, v5

    .line 952
    goto :goto_40

    .line 953
    :cond_40
    move v1, v4

    .line 954
    :goto_40
    add-int/2addr v0, v1

    .line 955
    mul-int/lit8 v0, v0, 0x29

    .line 956
    .line 957
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 958
    .line 959
    if-eqz v1, :cond_41

    .line 960
    .line 961
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 962
    .line 963
    .line 964
    move-result v1

    .line 965
    goto :goto_41

    .line 966
    :cond_41
    move v1, v2

    .line 967
    :goto_41
    add-int/2addr v0, v1

    .line 968
    mul-int/lit8 v0, v0, 0x29

    .line 969
    .line 970
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 971
    .line 972
    if-eqz v1, :cond_42

    .line 973
    .line 974
    invoke-interface {v1}, Ljava/util/List;->hashCode()I

    .line 975
    .line 976
    .line 977
    move-result v1

    .line 978
    goto :goto_42

    .line 979
    :cond_42
    move v1, v2

    .line 980
    :goto_42
    add-int/2addr v0, v1

    .line 981
    mul-int/lit8 v0, v0, 0x29

    .line 982
    .line 983
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/User;->deleted:Z

    .line 984
    .line 985
    if-eqz v1, :cond_43

    .line 986
    .line 987
    move v4, v5

    .line 988
    :cond_43
    add-int/2addr v0, v4

    .line 989
    mul-int/lit8 v0, v0, 0x29

    .line 990
    .line 991
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 992
    .line 993
    if-eqz v1, :cond_44

    .line 994
    .line 995
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/VoiceLiveState;->hashCode()I

    .line 996
    .line 997
    .line 998
    move-result v1

    .line 999
    goto :goto_43

    .line 1000
    :cond_44
    move v1, v2

    .line 1001
    :goto_43
    add-int/2addr v0, v1

    .line 1002
    mul-int/lit8 v0, v0, 0x29

    .line 1003
    .line 1004
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 1005
    .line 1006
    if-eqz v1, :cond_45

    .line 1007
    .line 1008
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 1009
    .line 1010
    .line 1011
    move-result v1

    .line 1012
    goto :goto_44

    .line 1013
    :cond_45
    move v1, v2

    .line 1014
    :goto_44
    add-int/2addr v0, v1

    .line 1015
    mul-int/lit8 v0, v0, 0x29

    .line 1016
    .line 1017
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 1018
    .line 1019
    if-eqz v1, :cond_46

    .line 1020
    .line 1021
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/SpecialEffect;->hashCode()I

    .line 1022
    .line 1023
    .line 1024
    move-result v1

    .line 1025
    goto :goto_45

    .line 1026
    :cond_46
    move v1, v2

    .line 1027
    :goto_45
    add-int/2addr v0, v1

    .line 1028
    mul-int/lit8 v0, v0, 0x29

    .line 1029
    .line 1030
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 1031
    .line 1032
    if-eqz v1, :cond_47

    .line 1033
    .line 1034
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserActivityInfo;->hashCode()I

    .line 1035
    .line 1036
    .line 1037
    move-result v1

    .line 1038
    goto :goto_46

    .line 1039
    :cond_47
    move v1, v2

    .line 1040
    :goto_46
    add-int/2addr v0, v1

    .line 1041
    mul-int/lit8 v0, v0, 0x29

    .line 1042
    .line 1043
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 1044
    .line 1045
    if-eqz v1, :cond_48

    .line 1046
    .line 1047
    invoke-virtual {v1}, Lcom/p1/mobile/putong/data/UserIdealInfo;->hashCode()I

    .line 1048
    .line 1049
    .line 1050
    move-result v2

    .line 1051
    :cond_48
    add-int/2addr v0, v2

    .line 1052
    mul-int/lit8 v0, v0, 0x29

    .line 1053
    .line 1054
    iget v1, p0, Lcom/p1/mobile/putong/data/User;->popularity:F

    .line 1055
    .line 1056
    invoke-static {v1}, Ljava/lang/Float;->floatToIntBits(F)I

    .line 1057
    .line 1058
    .line 1059
    move-result v1

    .line 1060
    add-int/2addr v0, v1

    .line 1061
    iput v0, p0, Lcom/tantanapp/common/data/ValueObject;->hashCode:I

    .line 1062
    .line 1063
    :cond_49
    return v0
.end method

.method public headFrameUrl()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public hideBlackDiamondTag()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public isAccountCancellation()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 2
    .line 3
    return p0
.end method

.method public isActive()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/data/UssTags;->onlineStatus:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public isAgeVerified()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PicVerification;->age:Lcom/p1/mobile/putong/data/VerificationResult;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/VerificationResult;->verified:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public isAiFakeAvatar()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->fp()Lcom/p1/mobile/putong/data/Picture;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Picture;->isAiFakePic()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isAiPictureEnable()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->aiPictureEnable()Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public isAudit()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const-string v0, "audit"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public isBanedOrInactivated()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 23
    return p0
.end method

.method public isBanned()Z
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserState;->jailed:Lcom/p1/mobile/putong/data/UserStateContent;

    .line 7
    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-boolean v1, p0, Lcom/p1/mobile/putong/data/UserStateContent;->active:Z

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    const-string v1, "60009"

    .line 16
    .line 17
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserStateContent;->code:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    :goto_0
    return v0
.end method

.method public isBannedNew()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/data/BanStatus;->code:I

    .line 4
    .line 5
    if-lez p0, :cond_0

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

.method public isBlackDiamondVIP()Z
    .locals 1

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 1
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->isDiamondVIP:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public isChatJailed()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->chat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->chat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 36
    .line 37
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->active:Z

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 42
    .line 43
    invoke-static {}, Ll/pzi0;->o()J

    .line 44
    .line 45
    .line 46
    move-result-wide v2

    .line 47
    long-to-double v2, v2

    .line 48
    cmpl-double p0, v0, v2

    .line 49
    .line 50
    if-lez p0, :cond_0

    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_0
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method public isCustomerServiceAccount()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 2
    .line 3
    const-string v0, "customer_service_account"

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public isDelIn()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/User;->deleted:Z

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public isDelOut()Z
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/User;->deleted:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public isFakePlayEnable()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 12
    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    return v0

    .line 16
    :cond_1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/GrowthSettings;->fakeTag:Z

    .line 17
    .line 18
    return p0
.end method

.method public isFakeUser()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 10
    .line 11
    const-string v1, "hidden"

    .line 12
    .line 13
    invoke-static {v1}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 24
    .line 25
    const-string v0, "RISK_TAG_UNREAL"

    .line 26
    .line 27
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    const/4 p0, 0x1

    .line 38
    return p0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    return p0
.end method

.method public isFemale()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 2
    .line 3
    const-string v0, "female"

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

.method public isFieldParsed(Ljava/lang/String;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->parseFieldSet:Ljava/util/HashSet;

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

.method public isGreetingJailed()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->greeting:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->greeting:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 36
    .line 37
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->active:Z

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 42
    .line 43
    invoke-static {}, Ll/pzi0;->o()J

    .line 44
    .line 45
    .line 46
    move-result-wide v2

    .line 47
    long-to-double v2, v2

    .line 48
    cmpl-double p0, v0, v2

    .line 49
    .line 50
    if-lez p0, :cond_0

    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_0
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method public isHideActiveFromSVip()Z
    .locals 6

    const/4 v0, 0x1

    return v0

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 13
    .line 14
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 33
    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->frozenTime:J

    .line 37
    .line 38
    const-wide/16 v4, 0x0

    .line 39
    .line 40
    cmp-long p0, v2, v4

    .line 41
    .line 42
    if-eqz p0, :cond_0

    .line 43
    .line 44
    const/4 p0, 0x1

    .line 45
    return p0

    .line 46
    :cond_0
    return v1
.end method

.method public isHideAgeForTeamAccount()Z
    .locals 1

    .line 1
    const-string v0, "-10023"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public isHideAgeFromSVip()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->hideAge:Z

    .line 36
    .line 37
    return p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public isHideAgeFromSVipWithOutMe()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isHideAgeFromSVip()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public isHideIconFromSVip()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 38
    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->hideIcon:Z

    .line 42
    .line 43
    return p0

    .line 44
    :cond_0
    const/4 p0, 0x0

    .line 45
    return p0
.end method

.method public isHideIconFromSVipWithMe()Z
    .locals 2

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 1
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_1

    .line 30
    .line 31
    iget-object v1, v0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 32
    .line 33
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_1

    .line 38
    .line 39
    iget-object p0, v0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 40
    .line 41
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->hideIcon:Z

    .line 42
    .line 43
    return p0

    .line 44
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 45
    .line 46
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Membership;->hideVIP:Z

    .line 47
    .line 48
    return p0
.end method

.method public isHideLocationFromSVip()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 32
    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->hideLocation:Z

    .line 36
    .line 37
    return p0

    .line 38
    :cond_0
    const/4 p0, 0x0

    .line 39
    return p0
.end method

.method public isIdAndPicBothVerified()Z
    .locals 1

    const/4 v0, 0x1

    return v0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isIdCardVerified()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public isIdCardVerified()Z
    .locals 0

    const/4 p0, 0x1

    return p0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PicVerification;->idCard:Lcom/p1/mobile/putong/data/IdVerificationResult;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/IdVerificationResult;->verified:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public isIntlFaceless()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

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
    if-nez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 12
    .line 13
    const-string v2, "RISK_TAG_GOOD_FACELESS_STATUS_2"

    .line 14
    .line 15
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_2

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 26
    .line 27
    const-string v0, "RISK_TAG_GOOD_FACELESS_STATUS_3"

    .line 28
    .line 29
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    return v1

    .line 41
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 42
    return p0
.end method

.method public isIntlSpammerOrScammer()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return p0

    .line 11
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 12
    .line 13
    const-string v0, "RISK_TAG_INTL_SUSPECT"

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public isJailed()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserState;->jailed:Lcom/p1/mobile/putong/data/UserStateContent;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/UserStateContent;->active:Z

    .line 11
    .line 12
    return p0

    .line 13
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isJailedOrRestrict()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isRestrict()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public isLiveJailed()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->live:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->live:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 36
    .line 37
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->active:Z

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 42
    .line 43
    invoke-static {}, Ll/pzi0;->o()J

    .line 44
    .line 45
    .line 46
    move-result-wide v2

    .line 47
    long-to-double v2, v2

    .line 48
    cmpl-double p0, v0, v2

    .line 49
    .line 50
    if-lez p0, :cond_0

    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_0
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method public isLoveBuzz()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 26
    .line 27
    const-string v0, "lovebuzz"

    .line 28
    .line 29
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    return v1
.end method

.method public isMe()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Ll/uqb0;->c0:Ll/bn5;

    .line 4
    .line 5
    invoke-interface {v0}, Ll/bn5;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public isMembership(Lcom/p1/mobile/putong/data/MembershipType;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 1
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/User;->getMembershipExpireTime(Lcom/p1/mobile/putong/data/MembershipType;)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    sget-object v0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    sub-long/2addr p0, v0

    .line 12
    const-wide/16 v0, 0x0

    .line 13
    .line 14
    cmp-long p0, p0, v0

    .line 15
    .line 16
    if-lez p0, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x1

    .line 19
    return p0

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public isMembershipUsed(Lcom/p1/mobile/putong/data/MembershipType;)Z
    .locals 2

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 1
    :cond_0
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/User;->getMembershipExpireTime(Lcom/p1/mobile/putong/data/MembershipType;)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmp-long p0, p0, v0

    .line 8
    .line 9
    if-lez p0, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_1
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isMomentCommentJailed()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->momentComment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->momentComment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 36
    .line 37
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->active:Z

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 42
    .line 43
    invoke-static {}, Ll/pzi0;->o()J

    .line 44
    .line 45
    .line 46
    move-result-wide v2

    .line 47
    long-to-double v2, v2

    .line 48
    cmpl-double p0, v0, v2

    .line 49
    .line 50
    if-lez p0, :cond_0

    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_0
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method public isMomentJailed()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->moment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->moment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 36
    .line 37
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->active:Z

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 42
    .line 43
    invoke-static {}, Ll/pzi0;->o()J

    .line 44
    .line 45
    .line 46
    move-result-wide v2

    .line 47
    long-to-double v2, v2

    .line 48
    cmpl-double p0, v0, v2

    .line 49
    .line 50
    if-lez p0, :cond_0

    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_0
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method public isNameFake()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p0, p0, Lcom/p1/mobile/putong/data/StatusesItem;->code:I

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public isNew(J)Z
    .locals 6

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/Relationship;->updateTime:D

    .line 13
    .line 14
    const-wide/16 v4, 0x0

    .line 15
    .line 16
    cmpl-double p0, v2, v4

    .line 17
    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    double-to-long v2, v2

    .line 21
    cmp-long p0, p1, v2

    .line 22
    .line 23
    if-gez p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    return v1
.end method

.method public isNewHere()Z
    .locals 6

    .line 1
    sget v0, Lcom/p1/mobile/putong/data/User;->newHereDay:I

    .line 2
    .line 3
    if-gez v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x7

    .line 6
    :try_start_0
    invoke-static {}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->x()Lcom/p1/mobile/putong/remote_config/RemoteConfig;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-string v2, "ttt_new_here_days"

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/remote_config/RemoteConfig;->F(Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    new-instance v2, Lorg/json/JSONObject;

    .line 23
    .line 24
    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const-string v1, "register_days"

    .line 28
    .line 29
    invoke-virtual {v2, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    sput v1, Lcom/p1/mobile/putong/data/User;->newHereDay:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    sput v0, Lcom/p1/mobile/putong/data/User;->newHereDay:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catch_0
    sput v0, Lcom/p1/mobile/putong/data/User;->newHereDay:I

    .line 40
    .line 41
    :cond_1
    :goto_0
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 42
    .line 43
    const-wide/16 v2, 0x0

    .line 44
    .line 45
    cmpl-double v0, v0, v2

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    if-lez v0, :cond_2

    .line 49
    .line 50
    sget v0, Lcom/p1/mobile/putong/data/User;->newHereDay:I

    .line 51
    .line 52
    if-lez v0, :cond_2

    .line 53
    .line 54
    invoke-static {}, Ll/pzi0;->o()J

    .line 55
    .line 56
    .line 57
    move-result-wide v2

    .line 58
    long-to-double v2, v2

    .line 59
    iget-wide v4, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 60
    .line 61
    sub-double/2addr v2, v4

    .line 62
    sget p0, Lcom/p1/mobile/putong/data/User;->newHereDay:I

    .line 63
    .line 64
    const v0, 0x5265c00

    .line 65
    .line 66
    .line 67
    mul-int/2addr p0, v0

    .line 68
    int-to-double v4, p0

    .line 69
    cmpg-double p0, v2, v4

    .line 70
    .line 71
    if-gtz p0, :cond_2

    .line 72
    .line 73
    const/4 v1, 0x1

    .line 74
    :cond_2
    return v1
.end method

.method public isNewUser()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/UssTags;->newUser:Z

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public isNewUserIn24H()Z
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 2
    .line 3
    double-to-long v0, v0

    .line 4
    const/16 p0, 0x18

    .line 5
    .line 6
    invoke-static {v0, v1, p0}, Ll/pzi0;->w(JI)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    xor-int/lit8 p0, p0, 0x1

    .line 11
    .line 12
    return p0
.end method

.method public isNonBinary()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/IntlMoreGender;->newGender:Lcom/p1/mobile/putong/data/IntlGender;

    .line 14
    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    return v0

    .line 18
    :cond_1
    const-string v0, "nonbinary"

    .line 19
    .line 20
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public isODiamond()Z
    .locals 1

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 1
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->userIsODiamond()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isOnCityTop()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->isCityTop()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

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

.method public isOnlinePending()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 10
    .line 11
    if-eqz v0, :cond_2

    .line 12
    .line 13
    const-string v2, "quickchat"

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 26
    .line 27
    const-string v2, "default"

    .line 28
    .line 29
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 39
    .line 40
    const-string v0, "peeking"

    .line 41
    .line 42
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-eqz p0, :cond_2

    .line 47
    .line 48
    :goto_0
    const/4 p0, 0x1

    .line 49
    return p0

    .line 50
    :cond_2
    return v1
.end method

.method public isOpenFilterVeriMsg()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 12
    .line 13
    if-eqz p0, :cond_2

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->verifiedUserMsg:Ljava/lang/Boolean;

    .line 16
    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0

    .line 25
    :cond_2
    :goto_0
    return v0
.end method

.method public isPicVerificationVerified()Z
    .locals 0

    const/4 p0, 0x1

    return p0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/PicVerification;->picVerificationResult:Lcom/p1/mobile/putong/data/PicVerificationResult;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/PicVerificationResult;->verified:Z

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public isPlatinum()Z
    .locals 1

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 1
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->isPlatinum()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isProfileJailed()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->changeProfile:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->changeProfile:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 36
    .line 37
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->active:Z

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 42
    .line 43
    invoke-static {}, Ll/pzi0;->o()J

    .line 44
    .line 45
    .line 46
    move-result-wide v2

    .line 47
    long-to-double v2, v2

    .line 48
    cmpl-double p0, v0, v2

    .line 49
    .line 50
    if-lez p0, :cond_0

    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_0
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method public isRepeatUser()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/UssTags;->repeatedUser:Z

    .line 6
    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public isRestrict()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserState;->restricted:Lcom/p1/mobile/putong/data/UserStateContent;

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/UserStateContent;->active:Z

    .line 11
    .line 12
    return p0

    .line 13
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isRiskAudit()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public isRiskAuditAvatar()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 10
    .line 11
    const-string v0, "RISK_TAG_AVATAR_IN_AUDIT"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public isRiskAuditName()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 10
    .line 11
    const-string v0, "RISK_TAG_NAME_IN_AUDIT"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public isSVIP()Z
    .locals 1

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 1
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserSVIPSettings;->isSvip:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public isSendQuestions()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 12
    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    return v0

    .line 16
    :cond_1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/SettingGroupsProfile;->sendQuestions:Z

    .line 17
    .line 18
    return p0
.end method

.method public isStudentVerified()Z
    .locals 4

    const/4 v0, 0x1

    return v0

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    const/4 v2, 0x1

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 26
    .line 27
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Verification;->studies:Lcom/p1/mobile/putong/data/StudentVerification;

    .line 38
    .line 39
    iget-object v0, v0, Lcom/p1/mobile/putong/data/StudentVerification;->status:Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 40
    .line 41
    const-string v3, "verified"

    .line 42
    .line 43
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-eqz v0, :cond_0

    .line 48
    .line 49
    move v0, v2

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    move v0, v1

    .line 52
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 53
    .line 54
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 55
    .line 56
    iget-boolean v3, p0, Lcom/p1/mobile/putong/data/Studies;->verified:Z

    .line 57
    .line 58
    if-eqz v3, :cond_1

    .line 59
    .line 60
    iget-boolean p0, p0, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 61
    .line 62
    if-eqz p0, :cond_1

    .line 63
    .line 64
    move p0, v2

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    move p0, v1

    .line 67
    :goto_1
    if-nez v0, :cond_3

    .line 68
    .line 69
    if-eqz p0, :cond_2

    .line 70
    .line 71
    goto :goto_2

    .line 72
    :cond_2
    return v1

    .line 73
    :cond_3
    :goto_2
    return v2
.end method

.method public isSupremePartner()Z
    .locals 1

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 1
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->isSupremePartner()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public isSupremePartnerOpenMystery()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

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
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Settings;->isSupremePartner()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->isSupremePartnerOpenMystery()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    return v1
.end method

.method public isSwipeJailed()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->swipe:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/JailedBusiness;->swipe:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 36
    .line 37
    iget-boolean v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->active:Z

    .line 38
    .line 39
    if-eqz v0, :cond_0

    .line 40
    .line 41
    iget-wide v0, p0, Lcom/p1/mobile/putong/data/JailedGroupChat;->expireTime:D

    .line 42
    .line 43
    invoke-static {}, Ll/pzi0;->o()J

    .line 44
    .line 45
    .line 46
    move-result-wide v2

    .line 47
    long-to-double v2, v2

    .line 48
    cmpl-double p0, v0, v2

    .line 49
    .line 50
    if-lez p0, :cond_0

    .line 51
    .line 52
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_0
    const/4 p0, 0x0

    .line 55
    return p0
.end method

.method public isTalkLocked()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const-string v0, "quickchat"

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 22
    .line 23
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    return v1
.end method

.method public isTeamAccount()Z
    .locals 2

    .line 93
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    const-string v1, "teamaccount"

    invoke-static {v1}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method

.method public isThinProfile()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_6

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-gt v0, v1, :cond_6

    .line 25
    .line 26
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 31
    .line 32
    iget-boolean v2, v2, Lcom/p1/mobile/putong/data/Work;->active:Z

    .line 33
    .line 34
    if-nez v2, :cond_6

    .line 35
    .line 36
    :cond_2
    if-eqz v0, :cond_3

    .line 37
    .line 38
    iget-object v2, v0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 39
    .line 40
    iget-boolean v2, v2, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 41
    .line 42
    if-nez v2, :cond_6

    .line 43
    .line 44
    :cond_3
    if-eqz v0, :cond_4

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_6

    .line 53
    .line 54
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 55
    .line 56
    if-eqz v0, :cond_5

    .line 57
    .line 58
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-eqz v0, :cond_6

    .line 65
    .line 66
    :cond_5
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 67
    .line 68
    if-eqz p0, :cond_7

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 71
    .line 72
    if-eqz p0, :cond_7

    .line 73
    .line 74
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-nez p0, :cond_6

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_6
    const/4 p0, 0x0

    .line 82
    return p0

    .line 83
    :cond_7
    :goto_0
    return v1
.end method

.method public isUltraPremium()Z
    .locals 1

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 1
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/data/UserUpVipSettings;->isUpvip:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_1
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public isVIP()Z
    .locals 4

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 1
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getVipToExpireTimeInMill()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-lez p0, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_1
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isVIPExpired()Z
    .locals 4

    const/4 v0, 0x0

    return v0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getVipExpireTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getVipToExpireTimeInMill()J

    .line 12
    .line 13
    .line 14
    move-result-wide v0

    .line 15
    cmp-long p0, v0, v2

    .line 16
    .line 17
    if-gtz p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public isVIPUsed()Z
    .locals 4

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    .line 1
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getVipExpireTime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-lez p0, :cond_1

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_1
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public isVedioforFp()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Video;

    .line 9
    .line 10
    return p0
.end method

.method public isYoungRisk()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 10
    .line 11
    const-string v0, "RISK_TAG_MANDATORY_IDENTITY_VERIFICATION_UNDERAGE"

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_0

    .line 22
    .line 23
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_0
    const/4 p0, 0x0

    .line 26
    return p0
.end method

.method public jailedBusinessChatHadReason()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->chat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->chat:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->reason:Ljava/lang/String;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->NO_ASSISTANT_MSG:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const/4 p0, 0x0

    .line 49
    return p0

    .line 50
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 51
    return p0
.end method

.method public jailedBusinessMomentCommentHadReason()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->momentComment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->momentComment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->reason:Ljava/lang/String;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->NO_ASSISTANT_MSG:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const/4 p0, 0x0

    .line 49
    return p0

    .line 50
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 51
    return p0
.end method

.method public jailedBusinessMomentHadReason()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->moment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->moment:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->reason:Ljava/lang/String;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->NO_ASSISTANT_MSG:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const/4 p0, 0x0

    .line 49
    return p0

    .line 50
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 51
    return p0
.end method

.method public jailedBusinessProfileHadReason()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->changeProfile:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->changeProfile:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->reason:Ljava/lang/String;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->NO_ASSISTANT_MSG:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const/4 p0, 0x0

    .line 49
    return p0

    .line 50
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 51
    return p0
.end method

.method public jailedBusinessSwipeHadReason()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 22
    .line 23
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->swipe:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/UserState;->jailedBusiness:Lcom/p1/mobile/putong/data/JailedBusiness;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedBusiness;->swipe:Lcom/p1/mobile/putong/data/JailedGroupChat;

    .line 36
    .line 37
    iget-object v0, v0, Lcom/p1/mobile/putong/data/JailedGroupChat;->reason:Ljava/lang/String;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->NO_ASSISTANT_MSG:Ljava/lang/String;

    .line 40
    .line 41
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_0

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_0
    const/4 p0, 0x0

    .line 49
    return p0

    .line 50
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 51
    return p0
.end method

.method public lessThanFifteenPrivateAnswer()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/g6k0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/g6k0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    const/16 v0, 0xf

    .line 17
    .line 18
    if-gt p0, v0, :cond_0

    .line 19
    .line 20
    const/4 p0, 0x1

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method public lessThanFivePrivateAnswer()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/i6k0;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/i6k0;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    const/4 v0, 0x5

    .line 17
    if-ge p0, v0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public letter()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_3

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/User;->checkRelationshipStatus()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    return v1

    .line 34
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 37
    .line 38
    const-string v0, "letter"

    .line 39
    .line 40
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0

    .line 49
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    xor-int/lit8 p0, p0, 0x1

    .line 56
    .line 57
    return p0

    .line 58
    :cond_3
    :goto_0
    return v1
.end method

.method public letterString()Ljava/lang/String;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->letter()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLetter:Ljava/lang/String;

    .line 32
    .line 33
    return-object p0

    .line 34
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 35
    .line 36
    return-object p0
.end method

.method public likedMe()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 24
    .line 25
    if-eqz p0, :cond_1

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 28
    .line 29
    const-string v0, "liked"

    .line 30
    .line 31
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0

    .line 36
    :cond_1
    :goto_0
    return v1
.end method

.method public liveHeadFrameConfig()Lcom/p1/mobile/putong/data/LiveRight;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public matchFromForTrack()Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 6
    .line 7
    const-string v1, "matched"

    .line 8
    .line 9
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string p0, "follow"

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 19
    .line 20
    if-eqz v0, :cond_4

    .line 21
    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/User;->checkRelationshipStatus()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    const-string p0, "default"

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 32
    .line 33
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 34
    .line 35
    const-string v1, "quickchat"

    .line 36
    .line 37
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    return-object v1

    .line 48
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 49
    .line 50
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 51
    .line 52
    const-string v1, "secretcrush"

    .line 53
    .line 54
    invoke-static {v1}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    const-string p0, "secret_crush"

    .line 65
    .line 66
    return-object p0

    .line 67
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 68
    .line 69
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 70
    .line 71
    const-string v0, "vipseen"

    .line 72
    .line 73
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result p0

    .line 81
    if-eqz p0, :cond_4

    .line 82
    .line 83
    const-string p0, "see_who_like_me"

    .line 84
    .line 85
    return-object p0

    .line 86
    :cond_4
    const-string p0, ""

    .line 87
    .line 88
    return-object p0
.end method

.method public matchedOrFollowed()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "matched"

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 9
    .line 10
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 22
    .line 23
    const-string v3, "following"

    .line 24
    .line 25
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 32
    .line 33
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    :cond_1
    return v1

    .line 40
    :cond_2
    const/4 p0, 0x0

    .line 41
    return p0
.end method

.method public media(I)Lcom/p1/mobile/putong/data/Media;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    return-object p0
.end method

.method public mergeData(Lcom/p1/mobile/putong/data/User;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->shouldMergeData()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_4e

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/User;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_3

    .line 14
    .line 15
    :cond_0
    const-string v0, "name"

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    const-string v0, "location"

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 36
    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 38
    .line 39
    :cond_2
    const-string v0, "description"

    .line 40
    .line 41
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 48
    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 50
    .line 51
    :cond_3
    const-string v0, "age"

    .line 52
    .line 53
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 60
    .line 61
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 62
    .line 63
    :cond_4
    const-string v0, "pictures"

    .line 64
    .line 65
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_5

    .line 70
    .line 71
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 72
    .line 73
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 74
    .line 75
    :cond_5
    const-string v0, "createdTime"

    .line 76
    .line 77
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_6

    .line 82
    .line 83
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 84
    .line 85
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 86
    .line 87
    :cond_6
    const-string v0, "profile"

    .line 88
    .line 89
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-nez v0, :cond_7

    .line 94
    .line 95
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 96
    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 101
    .line 102
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Profile;->mergeData(Lcom/p1/mobile/putong/data/Profile;)V

    .line 105
    .line 106
    .line 107
    :goto_0
    const-string v0, "status"

    .line 108
    .line 109
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_8

    .line 114
    .line 115
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 116
    .line 117
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 118
    .line 119
    :cond_8
    const-string v0, "settings"

    .line 120
    .line 121
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_9

    .line 126
    .line 127
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 128
    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 130
    .line 131
    goto :goto_1

    .line 132
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 133
    .line 134
    if-eqz v0, :cond_a

    .line 135
    .line 136
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 137
    .line 138
    if-eqz v1, :cond_b

    .line 139
    .line 140
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/Settings;->mergeData(Lcom/p1/mobile/putong/data/Settings;)V

    .line 141
    .line 142
    .line 143
    goto :goto_1

    .line 144
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 145
    .line 146
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 147
    .line 148
    :cond_b
    :goto_1
    const-string v0, "gender"

    .line 149
    .line 150
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    if-nez v0, :cond_c

    .line 155
    .line 156
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 157
    .line 158
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 159
    .line 160
    :cond_c
    const-string v0, "membership"

    .line 161
    .line 162
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    if-nez v0, :cond_d

    .line 167
    .line 168
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 169
    .line 170
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 171
    .line 172
    :cond_d
    const-string v0, "source"

    .line 173
    .line 174
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-nez v0, :cond_e

    .line 179
    .line 180
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 181
    .line 182
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 183
    .line 184
    :cond_e
    const-string v0, "realName"

    .line 185
    .line 186
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-nez v0, :cond_f

    .line 191
    .line 192
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 193
    .line 194
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 195
    .line 196
    :cond_f
    const-string v0, "memberships"

    .line 197
    .line 198
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-nez v0, :cond_10

    .line 203
    .line 204
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 205
    .line 206
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 207
    .line 208
    :cond_10
    const-string v0, "state"

    .line 209
    .line 210
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    if-nez v0, :cond_11

    .line 215
    .line 216
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 217
    .line 218
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 219
    .line 220
    :cond_11
    const-string v0, "verifications"

    .line 221
    .line 222
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-nez v0, :cond_12

    .line 227
    .line 228
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 229
    .line 230
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 231
    .line 232
    :cond_12
    const-string v0, "abGroups"

    .line 233
    .line 234
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    if-nez v0, :cond_13

    .line 239
    .line 240
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 241
    .line 242
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 243
    .line 244
    :cond_13
    const-string v0, "privateAnswers"

    .line 245
    .line 246
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    if-nez v0, :cond_14

    .line 251
    .line 252
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 253
    .line 254
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 255
    .line 256
    :cond_14
    const-string v0, "peepership"

    .line 257
    .line 258
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    if-nez v0, :cond_15

    .line 263
    .line 264
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 265
    .line 266
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 267
    .line 268
    :cond_15
    const-string v0, "picksExpiredTimestamp"

    .line 269
    .line 270
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    if-nez v0, :cond_16

    .line 275
    .line 276
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    .line 277
    .line 278
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    .line 279
    .line 280
    :cond_16
    const-string v0, "picksSwipable"

    .line 281
    .line 282
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    if-nez v0, :cond_17

    .line 287
    .line 288
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

    .line 289
    .line 290
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

    .line 291
    .line 292
    :cond_17
    const-string v0, "picksTag"

    .line 293
    .line 294
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-nez v0, :cond_18

    .line 299
    .line 300
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 301
    .line 302
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 303
    .line 304
    :cond_18
    const-string v0, "credit"

    .line 305
    .line 306
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    if-nez v0, :cond_19

    .line 311
    .line 312
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 313
    .line 314
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 315
    .line 316
    :cond_19
    const-string v0, "picksTagType"

    .line 317
    .line 318
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 319
    .line 320
    .line 321
    move-result v0

    .line 322
    if-nez v0, :cond_1a

    .line 323
    .line 324
    iget v0, p1, Lcom/p1/mobile/putong/data/User;->picksTagType:I

    .line 325
    .line 326
    iput v0, p0, Lcom/p1/mobile/putong/data/User;->picksTagType:I

    .line 327
    .line 328
    :cond_1a
    const-string v0, "picksTracker"

    .line 329
    .line 330
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 331
    .line 332
    .line 333
    move-result v0

    .line 334
    if-nez v0, :cond_1b

    .line 335
    .line 336
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 337
    .line 338
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 339
    .line 340
    :cond_1b
    const-string v0, "goPlaceTimestamp"

    .line 341
    .line 342
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 343
    .line 344
    .line 345
    move-result v0

    .line 346
    if-nez v0, :cond_1c

    .line 347
    .line 348
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    .line 349
    .line 350
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    .line 351
    .line 352
    :cond_1c
    const-string v0, "isLord"

    .line 353
    .line 354
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    if-nez v0, :cond_1d

    .line 359
    .line 360
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->isLord:Z

    .line 361
    .line 362
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/User;->isLord:Z

    .line 363
    .line 364
    :cond_1d
    const-string v0, "privateAnswersUpdatedTime"

    .line 365
    .line 366
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    if-nez v0, :cond_1e

    .line 371
    .line 372
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    .line 373
    .line 374
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    .line 375
    .line 376
    :cond_1e
    const-string v0, "sendLetter"

    .line 377
    .line 378
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    if-nez v0, :cond_1f

    .line 383
    .line 384
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 385
    .line 386
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 387
    .line 388
    :cond_1f
    const-string v0, "sendLetterTimestamp"

    .line 389
    .line 390
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 391
    .line 392
    .line 393
    move-result v0

    .line 394
    if-nez v0, :cond_20

    .line 395
    .line 396
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    .line 397
    .line 398
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    .line 399
    .line 400
    :cond_20
    const-string v0, "receivedLetter"

    .line 401
    .line 402
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 403
    .line 404
    .line 405
    move-result v0

    .line 406
    if-nez v0, :cond_21

    .line 407
    .line 408
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 409
    .line 410
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 411
    .line 412
    :cond_21
    const-string v0, "receivedLetterTimestamp"

    .line 413
    .line 414
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 415
    .line 416
    .line 417
    move-result v0

    .line 418
    if-nez v0, :cond_22

    .line 419
    .line 420
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    .line 421
    .line 422
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    .line 423
    .line 424
    :cond_22
    const-string v0, "localLetterUnRead"

    .line 425
    .line 426
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 427
    .line 428
    .line 429
    move-result v0

    .line 430
    if-nez v0, :cond_23

    .line 431
    .line 432
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->localLetterUnRead:Z

    .line 433
    .line 434
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/User;->localLetterUnRead:Z

    .line 435
    .line 436
    :cond_23
    const-string v0, "popLevel"

    .line 437
    .line 438
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 439
    .line 440
    .line 441
    move-result v0

    .line 442
    if-nez v0, :cond_24

    .line 443
    .line 444
    iget v0, p1, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 445
    .line 446
    iput v0, p0, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 447
    .line 448
    :cond_24
    const-string v0, "voice"

    .line 449
    .line 450
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 451
    .line 452
    .line 453
    move-result v0

    .line 454
    if-nez v0, :cond_25

    .line 455
    .line 456
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 457
    .line 458
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 459
    .line 460
    :cond_25
    const-string v0, "liveState"

    .line 461
    .line 462
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 463
    .line 464
    .line 465
    move-result v0

    .line 466
    if-nez v0, :cond_26

    .line 467
    .line 468
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 469
    .line 470
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 471
    .line 472
    :cond_26
    const-string v0, "ussTags"

    .line 473
    .line 474
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 475
    .line 476
    .line 477
    move-result v0

    .line 478
    if-nez v0, :cond_27

    .line 479
    .line 480
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 481
    .line 482
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 483
    .line 484
    :cond_27
    const-string v0, "abroad"

    .line 485
    .line 486
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 487
    .line 488
    .line 489
    move-result v0

    .line 490
    if-nez v0, :cond_28

    .line 491
    .line 492
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 493
    .line 494
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 495
    .line 496
    :cond_28
    const-string v0, "fakeStatus"

    .line 497
    .line 498
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 499
    .line 500
    .line 501
    move-result v0

    .line 502
    if-nez v0, :cond_29

    .line 503
    .line 504
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 505
    .line 506
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 507
    .line 508
    :cond_29
    const-string v0, "nameStatus"

    .line 509
    .line 510
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 511
    .line 512
    .line 513
    move-result v0

    .line 514
    if-nez v0, :cond_2a

    .line 515
    .line 516
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 517
    .line 518
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 519
    .line 520
    :cond_2a
    const-string v0, "displayAudit"

    .line 521
    .line 522
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 523
    .line 524
    .line 525
    move-result v0

    .line 526
    if-nez v0, :cond_2b

    .line 527
    .line 528
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    .line 529
    .line 530
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    .line 531
    .line 532
    :cond_2b
    const-string v0, "aiOrderPicture"

    .line 533
    .line 534
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 535
    .line 536
    .line 537
    move-result v0

    .line 538
    if-nez v0, :cond_2c

    .line 539
    .line 540
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->aiOrderPicture:Z

    .line 541
    .line 542
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/User;->aiOrderPicture:Z

    .line 543
    .line 544
    :cond_2c
    const-string v0, "medal"

    .line 545
    .line 546
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 547
    .line 548
    .line 549
    move-result v0

    .line 550
    if-nez v0, :cond_2d

    .line 551
    .line 552
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 553
    .line 554
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 555
    .line 556
    :cond_2d
    const-string v0, "signupStage"

    .line 557
    .line 558
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 559
    .line 560
    .line 561
    move-result v0

    .line 562
    if-nez v0, :cond_2e

    .line 563
    .line 564
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 565
    .line 566
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 567
    .line 568
    :cond_2e
    const-string v0, "publicId"

    .line 569
    .line 570
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 571
    .line 572
    .line 573
    move-result v0

    .line 574
    if-nez v0, :cond_2f

    .line 575
    .line 576
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 577
    .line 578
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 579
    .line 580
    :cond_2f
    const-string v0, "soul-settings"

    .line 581
    .line 582
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 583
    .line 584
    .line 585
    move-result v0

    .line 586
    if-nez v0, :cond_30

    .line 587
    .line 588
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 589
    .line 590
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 591
    .line 592
    :cond_30
    const-string v0, "richListPosition"

    .line 593
    .line 594
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 595
    .line 596
    .line 597
    move-result v0

    .line 598
    if-nez v0, :cond_31

    .line 599
    .line 600
    iget v0, p1, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    .line 601
    .line 602
    iput v0, p0, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    .line 603
    .line 604
    :cond_31
    const-string v0, "richListTracker"

    .line 605
    .line 606
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 607
    .line 608
    .line 609
    move-result v0

    .line 610
    if-nez v0, :cond_32

    .line 611
    .line 612
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 613
    .line 614
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 615
    .line 616
    :cond_32
    const-string v0, "richListType"

    .line 617
    .line 618
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 619
    .line 620
    .line 621
    move-result v0

    .line 622
    if-nez v0, :cond_33

    .line 623
    .line 624
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 625
    .line 626
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 627
    .line 628
    :cond_33
    const-string v0, "liveRevenueCampaignVip"

    .line 629
    .line 630
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 631
    .line 632
    .line 633
    move-result v0

    .line 634
    if-nez v0, :cond_34

    .line 635
    .line 636
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 637
    .line 638
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 639
    .line 640
    :cond_34
    const-string v0, "diamondVIPExpiresTime"

    .line 641
    .line 642
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 643
    .line 644
    .line 645
    move-result v0

    .line 646
    if-nez v0, :cond_35

    .line 647
    .line 648
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    .line 649
    .line 650
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    .line 651
    .line 652
    :cond_35
    const-string v0, "aiTag"

    .line 653
    .line 654
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 655
    .line 656
    .line 657
    move-result v0

    .line 658
    if-nez v0, :cond_36

    .line 659
    .line 660
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 661
    .line 662
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 663
    .line 664
    :cond_36
    const-string v0, "totalRewardPoint"

    .line 665
    .line 666
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 667
    .line 668
    .line 669
    move-result v0

    .line 670
    if-nez v0, :cond_37

    .line 671
    .line 672
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 673
    .line 674
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 675
    .line 676
    :cond_37
    const-string v0, "ussTracker"

    .line 677
    .line 678
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 679
    .line 680
    .line 681
    move-result v0

    .line 682
    if-nez v0, :cond_38

    .line 683
    .line 684
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 685
    .line 686
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 687
    .line 688
    :cond_38
    const-string v0, "anchorHierarchy"

    .line 689
    .line 690
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 691
    .line 692
    .line 693
    move-result v0

    .line 694
    if-nez v0, :cond_39

    .line 695
    .line 696
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 697
    .line 698
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 699
    .line 700
    :cond_39
    const-string v0, "fanbaseHierarchy"

    .line 701
    .line 702
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 703
    .line 704
    .line 705
    move-result v0

    .line 706
    if-nez v0, :cond_3a

    .line 707
    .line 708
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 709
    .line 710
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 711
    .line 712
    :cond_3a
    const-string v0, "localLatestReceivedMessageTime"

    .line 713
    .line 714
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 715
    .line 716
    .line 717
    move-result v0

    .line 718
    if-nez v0, :cond_3b

    .line 719
    .line 720
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 721
    .line 722
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 723
    .line 724
    :cond_3b
    const-string v0, "avatarFrame"

    .line 725
    .line 726
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 727
    .line 728
    .line 729
    move-result v0

    .line 730
    if-nez v0, :cond_3c

    .line 731
    .line 732
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 733
    .line 734
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 735
    .line 736
    :cond_3c
    const-string v0, "hierarchy"

    .line 737
    .line 738
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 739
    .line 740
    .line 741
    move-result v0

    .line 742
    if-nez v0, :cond_3d

    .line 743
    .line 744
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 745
    .line 746
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 747
    .line 748
    :cond_3d
    const-string v0, "signupTime"

    .line 749
    .line 750
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 751
    .line 752
    .line 753
    move-result v0

    .line 754
    if-nez v0, :cond_3e

    .line 755
    .line 756
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 757
    .line 758
    iput-wide v0, p0, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 759
    .line 760
    :cond_3e
    const-string v0, "banStatus"

    .line 761
    .line 762
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 763
    .line 764
    .line 765
    move-result v0

    .line 766
    if-nez v0, :cond_3f

    .line 767
    .line 768
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 769
    .line 770
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 771
    .line 772
    :cond_3f
    const-string v0, "anonymousLike"

    .line 773
    .line 774
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 775
    .line 776
    .line 777
    move-result v0

    .line 778
    if-nez v0, :cond_40

    .line 779
    .line 780
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 781
    .line 782
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 783
    .line 784
    :cond_40
    const-string v0, "finishedStages"

    .line 785
    .line 786
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 787
    .line 788
    .line 789
    move-result v0

    .line 790
    if-nez v0, :cond_41

    .line 791
    .line 792
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 793
    .line 794
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 795
    .line 796
    :cond_41
    const-string v0, "inactivated"

    .line 797
    .line 798
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 799
    .line 800
    .line 801
    move-result v0

    .line 802
    if-nez v0, :cond_42

    .line 803
    .line 804
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 805
    .line 806
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 807
    .line 808
    :cond_42
    const-string v0, "activityUser"

    .line 809
    .line 810
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 811
    .line 812
    .line 813
    move-result v0

    .line 814
    if-nez v0, :cond_43

    .line 815
    .line 816
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 817
    .line 818
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 819
    .line 820
    goto :goto_2

    .line 821
    :cond_43
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 822
    .line 823
    iget-object v1, p1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 824
    .line 825
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/data/ActivityUser;->mergeData(Lcom/p1/mobile/putong/data/ActivityUser;)V

    .line 826
    .line 827
    .line 828
    :goto_2
    const-string v0, "matePlanUser"

    .line 829
    .line 830
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 831
    .line 832
    .line 833
    move-result v0

    .line 834
    if-nez v0, :cond_44

    .line 835
    .line 836
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 837
    .line 838
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 839
    .line 840
    :cond_44
    const-string v0, "matePlanAdUser"

    .line 841
    .line 842
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 843
    .line 844
    .line 845
    move-result v0

    .line 846
    if-nez v0, :cond_45

    .line 847
    .line 848
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 849
    .line 850
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 851
    .line 852
    :cond_45
    const-string v0, "regionTag"

    .line 853
    .line 854
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 855
    .line 856
    .line 857
    move-result v0

    .line 858
    if-nez v0, :cond_46

    .line 859
    .line 860
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 861
    .line 862
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 863
    .line 864
    :cond_46
    const-string v0, "localLikeIdentifiers"

    .line 865
    .line 866
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 867
    .line 868
    .line 869
    move-result v0

    .line 870
    if-nez v0, :cond_47

    .line 871
    .line 872
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 873
    .line 874
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 875
    .line 876
    :cond_47
    const-string v0, "deleted"

    .line 877
    .line 878
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 879
    .line 880
    .line 881
    move-result v0

    .line 882
    if-nez v0, :cond_48

    .line 883
    .line 884
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->deleted:Z

    .line 885
    .line 886
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/User;->deleted:Z

    .line 887
    .line 888
    :cond_48
    const-string v0, "voiceLiveState"

    .line 889
    .line 890
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 891
    .line 892
    .line 893
    move-result v0

    .line 894
    if-nez v0, :cond_49

    .line 895
    .line 896
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 897
    .line 898
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 899
    .line 900
    :cond_49
    const-string v0, "localSeeReminderType"

    .line 901
    .line 902
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 903
    .line 904
    .line 905
    move-result v0

    .line 906
    if-nez v0, :cond_4a

    .line 907
    .line 908
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 909
    .line 910
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 911
    .line 912
    :cond_4a
    const-string v0, "specialEffect"

    .line 913
    .line 914
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 915
    .line 916
    .line 917
    move-result v0

    .line 918
    if-nez v0, :cond_4b

    .line 919
    .line 920
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 921
    .line 922
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 923
    .line 924
    :cond_4b
    const-string v0, "ideal"

    .line 925
    .line 926
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 927
    .line 928
    .line 929
    move-result v0

    .line 930
    if-nez v0, :cond_4c

    .line 931
    .line 932
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 933
    .line 934
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 935
    .line 936
    :cond_4c
    const-string v0, "popularity"

    .line 937
    .line 938
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->isFieldParsed(Ljava/lang/String;)Z

    .line 939
    .line 940
    .line 941
    move-result v0

    .line 942
    if-nez v0, :cond_4d

    .line 943
    .line 944
    iget p1, p1, Lcom/p1/mobile/putong/data/User;->popularity:F

    .line 945
    .line 946
    iput p1, p0, Lcom/p1/mobile/putong/data/User;->popularity:F

    .line 947
    .line 948
    :cond_4d
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->parseFieldSet:Ljava/util/HashSet;

    .line 949
    .line 950
    invoke-virtual {p0}, Ljava/util/HashSet;->clear()V

    .line 951
    .line 952
    .line 953
    :cond_4e
    :goto_3
    return-void
.end method

.method public bridge synthetic mergeData(Lcom/tantanapp/common/data/ValueObject;)V
    .locals 0

    .line 954
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/User;->mergeData(Lcom/p1/mobile/putong/data/User;)V

    return-void
.end method

.method public needShowFrame()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public needShowLiveFrame()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public nullCheck()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/tantanapp/common/data/ValueObject;->nullCheck()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 5
    .line 6
    const-string v1, ""

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/data/Location;->new_()Lcom/p1/mobile/putong/data/Location;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 21
    .line 22
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 27
    .line 28
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 29
    .line 30
    if-nez v0, :cond_3

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 38
    .line 39
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 40
    .line 41
    if-nez v0, :cond_4

    .line 42
    .line 43
    new-instance v0, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 49
    .line 50
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 51
    .line 52
    if-nez v0, :cond_5

    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/data/Profile;->new_()Lcom/p1/mobile/putong/data/Profile;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 61
    .line 62
    if-nez v0, :cond_6

    .line 63
    .line 64
    new-instance v0, Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .line 68
    .line 69
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 70
    .line 71
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 72
    .line 73
    if-nez v0, :cond_7

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    check-cast v0, Lcom/p1/mobile/putong/data/Gender;

    .line 82
    .line 83
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 84
    .line 85
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 86
    .line 87
    if-nez v0, :cond_8

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/data/Membership;->new_()Lcom/p1/mobile/putong/data/Membership;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 94
    .line 95
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 96
    .line 97
    if-nez v0, :cond_9

    .line 98
    .line 99
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 100
    .line 101
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 102
    .line 103
    if-nez v0, :cond_a

    .line 104
    .line 105
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 106
    .line 107
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 108
    .line 109
    if-nez v0, :cond_b

    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/data/PicVerification;->new_()Lcom/p1/mobile/putong/data/PicVerification;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 116
    .line 117
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 118
    .line 119
    if-nez v0, :cond_c

    .line 120
    .line 121
    new-instance v0, Ljava/util/ArrayList;

    .line 122
    .line 123
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 124
    .line 125
    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 127
    .line 128
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 129
    .line 130
    if-nez v0, :cond_d

    .line 131
    .line 132
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 133
    .line 134
    :cond_d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 135
    .line 136
    if-nez v0, :cond_e

    .line 137
    .line 138
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 139
    .line 140
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 141
    .line 142
    if-nez v0, :cond_f

    .line 143
    .line 144
    invoke-static {}, Lcom/p1/mobile/putong/data/AudioSignature;->new_()Lcom/p1/mobile/putong/data/AudioSignature;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 149
    .line 150
    :cond_f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 151
    .line 152
    if-nez v0, :cond_10

    .line 153
    .line 154
    invoke-static {}, Lcom/p1/mobile/putong/data/UserLiveState;->new_()Lcom/p1/mobile/putong/data/UserLiveState;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 159
    .line 160
    :cond_10
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 161
    .line 162
    if-nez v0, :cond_11

    .line 163
    .line 164
    invoke-static {}, Lcom/p1/mobile/putong/data/UserAbroad;->new_()Lcom/p1/mobile/putong/data/UserAbroad;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 169
    .line 170
    :cond_11
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 171
    .line 172
    if-nez v0, :cond_12

    .line 173
    .line 174
    invoke-static {}, Lcom/p1/mobile/putong/data/UserMedalWrapper;->new_()Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 179
    .line 180
    :cond_12
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 181
    .line 182
    if-nez v0, :cond_13

    .line 183
    .line 184
    sget-object v0, Lcom/p1/mobile/putong/data/SignupStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 185
    .line 186
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    check-cast v0, Lcom/p1/mobile/putong/data/SignupStage;

    .line 191
    .line 192
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 193
    .line 194
    :cond_13
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 195
    .line 196
    if-nez v0, :cond_14

    .line 197
    .line 198
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 199
    .line 200
    :cond_14
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 201
    .line 202
    if-nez v0, :cond_15

    .line 203
    .line 204
    invoke-static {}, Lcom/p1/mobile/putong/data/UserSoulSettings;->new_()Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 209
    .line 210
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 211
    .line 212
    if-nez v0, :cond_16

    .line 213
    .line 214
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 215
    .line 216
    :cond_16
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    .line 217
    .line 218
    if-nez v0, :cond_17

    .line 219
    .line 220
    invoke-static {}, Lcom/p1/mobile/putong/data/RichListUsers;->new_()Lcom/p1/mobile/putong/data/RichListUsers;

    .line 221
    .line 222
    .line 223
    move-result-object v0

    .line 224
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    .line 225
    .line 226
    :cond_17
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 227
    .line 228
    if-nez v0, :cond_18

    .line 229
    .line 230
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 231
    .line 232
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 233
    .line 234
    if-nez v0, :cond_19

    .line 235
    .line 236
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;->new_()Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 241
    .line 242
    :cond_19
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 243
    .line 244
    if-nez v0, :cond_1a

    .line 245
    .line 246
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 247
    .line 248
    :cond_1a
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 249
    .line 250
    if-nez v0, :cond_1b

    .line 251
    .line 252
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 253
    .line 254
    :cond_1b
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 255
    .line 256
    if-nez v0, :cond_1c

    .line 257
    .line 258
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->new_()Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 263
    .line 264
    :cond_1c
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 265
    .line 266
    if-nez v0, :cond_1d

    .line 267
    .line 268
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->new_()Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 273
    .line 274
    :cond_1d
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 275
    .line 276
    if-nez v0, :cond_1e

    .line 277
    .line 278
    invoke-static {}, Lcom/p1/mobile/putong/data/AvatarFrame;->new_()Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 283
    .line 284
    :cond_1e
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 285
    .line 286
    if-nez v0, :cond_1f

    .line 287
    .line 288
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveUserLevel;->new_()Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 289
    .line 290
    .line 291
    move-result-object v0

    .line 292
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 293
    .line 294
    :cond_1f
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 295
    .line 296
    if-nez v0, :cond_20

    .line 297
    .line 298
    invoke-static {}, Lcom/p1/mobile/putong/data/BanStatus;->new_()Lcom/p1/mobile/putong/data/BanStatus;

    .line 299
    .line 300
    .line 301
    move-result-object v0

    .line 302
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 303
    .line 304
    :cond_20
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 305
    .line 306
    if-nez v0, :cond_21

    .line 307
    .line 308
    new-instance v0, Ljava/util/ArrayList;

    .line 309
    .line 310
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 311
    .line 312
    .line 313
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 314
    .line 315
    :cond_21
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 316
    .line 317
    if-nez v0, :cond_22

    .line 318
    .line 319
    invoke-static {}, Lcom/p1/mobile/putong/data/ActivityUser;->new_()Lcom/p1/mobile/putong/data/ActivityUser;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 324
    .line 325
    :cond_22
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 326
    .line 327
    if-nez v0, :cond_23

    .line 328
    .line 329
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 330
    .line 331
    :cond_23
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 332
    .line 333
    if-nez v0, :cond_24

    .line 334
    .line 335
    new-instance v0, Ljava/util/ArrayList;

    .line 336
    .line 337
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 338
    .line 339
    .line 340
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 341
    .line 342
    :cond_24
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 343
    .line 344
    if-nez v0, :cond_25

    .line 345
    .line 346
    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceLiveState;->new_()Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 351
    .line 352
    :cond_25
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 353
    .line 354
    if-nez v0, :cond_26

    .line 355
    .line 356
    iput-object v1, p0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 357
    .line 358
    :cond_26
    return-void
.end method

.method public onApiParseComplete()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 15
    .line 16
    invoke-static {}, Lcom/p1/mobile/putong/data/Picture;->new_()Lcom/p1/mobile/putong/data/Picture;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Lcom/p1/mobile/putong/data/Dimension;

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-direct {v1, v2, v2}, Lcom/p1/mobile/putong/data/Dimension;-><init>(II)V

    .line 24
    .line 25
    .line 26
    iput-object v1, v0, Lcom/p1/mobile/putong/data/Picture;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 27
    .line 28
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    const/16 v1, 0x9

    .line 40
    .line 41
    const/4 v2, 0x0

    .line 42
    if-le v0, v1, :cond_1

    .line 43
    .line 44
    new-instance v0, Ljava/util/ArrayList;

    .line 45
    .line 46
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 47
    .line 48
    invoke-interface {v3, v2, v1}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 56
    .line 57
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isRiskAudit()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_4

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getUserName()Ll/wyd0;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getUserPicture()Ll/wyd0;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isRiskAuditName()Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    if-eqz v3, :cond_2

    .line 76
    .line 77
    iget-object v3, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0, v3}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getDefaultRiskAuditUser()Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;->userName:Ljava/lang/String;

    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 89
    .line 90
    :cond_2
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isRiskAuditAvatar()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 97
    .line 98
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 103
    .line 104
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v1, v0}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 110
    .line 111
    invoke-interface {v0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lcom/p1/mobile/putong/data/Media;

    .line 116
    .line 117
    sget-object v1, Ll/jm5;->d:Ll/wyd0;

    .line 118
    .line 119
    invoke-virtual {v1}, Ll/azd0;->get()Ljava/lang/Object;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    check-cast v1, Ljava/lang/CharSequence;

    .line 124
    .line 125
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    if-eqz v1, :cond_3

    .line 130
    .line 131
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getDefaultRiskAuditUser()Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User$DefaultRiskAuditUser;->userPicture:Ljava/lang/String;

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_3
    sget-object p0, Ll/jm5;->d:Ll/wyd0;

    .line 139
    .line 140
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    check-cast p0, Ljava/lang/String;

    .line 145
    .line 146
    :goto_0
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 147
    .line 148
    :cond_4
    return-void
.end method

.method public onlineMatch()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_3

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 20
    .line 21
    const-string v2, "quickchat"

    .line 22
    .line 23
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_1
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/User;->checkRelationshipStatus()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    return v1

    .line 38
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 41
    .line 42
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    return p0

    .line 51
    :cond_3
    :goto_0
    return v1
.end method

.method public onlineMatchAvatarUnlock()Z
    .locals 1

    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/data/User;->onlineMatchAvatarUnlock(Z)Z

    move-result p0

    return p0
.end method

.method public onlineMatchAvatarUnlock(Z)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    return v0

    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const-string p1, "quickchat"

    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_1
    return v0
.end method

.method public onlineMatchLocked()Z
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 10
    .line 11
    if-eqz v0, :cond_3

    .line 12
    .line 13
    const-string v2, "quickchat"

    .line 14
    .line 15
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->convType:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 26
    .line 27
    const-string v2, "peeking"

    .line 28
    .line 29
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 38
    .line 39
    const-string v0, "peeking_blocked"

    .line 40
    .line 41
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return v1

    .line 49
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_3
    return v1
.end method

.method public onlineMatchUnlock()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->onlineMatch()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 12
    .line 13
    const-string v0, "default"

    .line 14
    .line 15
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return p0
.end method

.method public parseRelationStatus()I
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x3

    .line 10
    return p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x4

    .line 18
    return p0

    .line 19
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 20
    .line 21
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x0

    .line 26
    const-string v2, "matched"

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 31
    .line 32
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->state:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 33
    .line 34
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    return v1

    .line 41
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 42
    .line 43
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const-string v3, "following"

    .line 48
    .line 49
    const-string v4, "followed"

    .line 50
    .line 51
    if-eqz v0, :cond_4

    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->maskState:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 56
    .line 57
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_4

    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 64
    .line 65
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->maskState:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 66
    .line 67
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_3

    .line 72
    .line 73
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 74
    .line 75
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->maskState:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 76
    .line 77
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    if-nez v0, :cond_3

    .line 82
    .line 83
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 84
    .line 85
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->maskState:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 86
    .line 87
    invoke-static {v0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_4

    .line 92
    .line 93
    :cond_3
    const/4 p0, 0x1

    .line 94
    return p0

    .line 95
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 96
    .line 97
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    if-eqz v0, :cond_6

    .line 102
    .line 103
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 104
    .line 105
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 106
    .line 107
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    if-eqz v0, :cond_6

    .line 112
    .line 113
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 114
    .line 115
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 116
    .line 117
    invoke-static {v0, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-nez v0, :cond_5

    .line 122
    .line 123
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 124
    .line 125
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 126
    .line 127
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    if-nez v0, :cond_5

    .line 132
    .line 133
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 136
    .line 137
    invoke-static {p0, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 138
    .line 139
    .line 140
    move-result p0

    .line 141
    if-eqz p0, :cond_6

    .line 142
    .line 143
    :cond_5
    return v1

    .line 144
    :cond_6
    const/4 p0, 0x2

    .line 145
    return p0
.end method

.method public picture(I)Lcom/p1/mobile/putong/data/Picture;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public profileIntegrity()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x4

    .line 8
    .line 9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 10
    .line 11
    iget-object v2, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 12
    .line 13
    iget-boolean v3, v2, Lcom/p1/mobile/putong/data/Studies;->active:Z

    .line 14
    .line 15
    if-eqz v3, :cond_1

    .line 16
    .line 17
    add-int/lit8 v1, v0, 0x4

    .line 18
    .line 19
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Studies;->major:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    add-int/lit8 v0, v0, 0x8

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    move v0, v1

    .line 31
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 32
    .line 33
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 34
    .line 35
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Studies;->school:Ljava/lang/String;

    .line 36
    .line 37
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-nez v1, :cond_4

    .line 42
    .line 43
    :goto_1
    add-int/lit8 v0, v0, 0x4

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_1
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 47
    .line 48
    iget-boolean v2, v1, Lcom/p1/mobile/putong/data/Work;->active:Z

    .line 49
    .line 50
    if-eqz v2, :cond_4

    .line 51
    .line 52
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->industry:Ljava/lang/String;

    .line 53
    .line 54
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    if-nez v1, :cond_2

    .line 59
    .line 60
    add-int/lit8 v0, v0, 0x4

    .line 61
    .line 62
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 63
    .line 64
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 65
    .line 66
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->department:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-nez v1, :cond_3

    .line 73
    .line 74
    add-int/lit8 v0, v0, 0x4

    .line 75
    .line 76
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 77
    .line 78
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 79
    .line 80
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Work;->company:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-nez v1, :cond_4

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_4
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 90
    .line 91
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 92
    .line 93
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    if-nez v1, :cond_5

    .line 98
    .line 99
    add-int/lit8 v0, v0, 0x4

    .line 100
    .line 101
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 102
    .line 103
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 104
    .line 105
    .line 106
    move-result v1

    .line 107
    if-nez v1, :cond_6

    .line 108
    .line 109
    add-int/lit8 v0, v0, 0x14

    .line 110
    .line 111
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 112
    .line 113
    iget-object v1, v1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 114
    .line 115
    if-eqz v1, :cond_7

    .line 116
    .line 117
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    if-nez v1, :cond_7

    .line 122
    .line 123
    add-int/lit8 v0, v0, 0x14

    .line 124
    .line 125
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 126
    .line 127
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 128
    .line 129
    if-eqz p0, :cond_8

    .line 130
    .line 131
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 132
    .line 133
    .line 134
    move-result p0

    .line 135
    if-nez p0, :cond_8

    .line 136
    .line 137
    add-int/lit8 v0, v0, 0x14

    .line 138
    .line 139
    :cond_8
    return v0
.end method

.method public putParsedField(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->requestUrl:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->requestUrl:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->parseFieldSet:Ljava/util/HashSet;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public receiveSuperLikeNum()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

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
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 11
    .line 12
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    :try_start_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->recvSuperLikedNum:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 30
    return p0

    .line 31
    :catch_0
    :cond_0
    return v1
.end method

.method public relativeTimeForTrack()Ljava/lang/String;
    .locals 5

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->getLastActiveTimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v1

    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x1

    .line 13
    invoke-virtual {v0, p0}, Ljava/util/Calendar;->get(I)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/16 v0, 0x7b2

    .line 18
    .line 19
    if-gt p0, v0, :cond_0

    .line 20
    .line 21
    const-string p0, "60"

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_0
    sget-object p0, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 27
    .line 28
    .line 29
    move-result-wide v3

    .line 30
    sub-long/2addr v3, v1

    .line 31
    const-wide/16 v0, 0x3e8

    .line 32
    .line 33
    div-long/2addr v3, v0

    .line 34
    const-wide/32 v0, 0x1e13380

    .line 35
    .line 36
    .line 37
    cmp-long p0, v3, v0

    .line 38
    .line 39
    if-lez p0, :cond_1

    .line 40
    .line 41
    div-long/2addr v3, v0

    .line 42
    long-to-int p0, v3

    .line 43
    const v0, 0x1e13380

    .line 44
    .line 45
    .line 46
    :goto_0
    mul-int/2addr p0, v0

    .line 47
    goto :goto_1

    .line 48
    :cond_1
    const-wide/32 v0, 0x278d00

    .line 49
    .line 50
    .line 51
    cmp-long p0, v3, v0

    .line 52
    .line 53
    if-lez p0, :cond_2

    .line 54
    .line 55
    div-long/2addr v3, v0

    .line 56
    long-to-int p0, v3

    .line 57
    const v0, 0x278d00

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_2
    const-wide/32 v0, 0x93a80

    .line 62
    .line 63
    .line 64
    cmp-long p0, v3, v0

    .line 65
    .line 66
    if-lez p0, :cond_3

    .line 67
    .line 68
    div-long/2addr v3, v0

    .line 69
    long-to-int p0, v3

    .line 70
    const v0, 0x93a80

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_3
    const-wide/32 v0, 0x15180

    .line 75
    .line 76
    .line 77
    cmp-long p0, v3, v0

    .line 78
    .line 79
    if-lez p0, :cond_4

    .line 80
    .line 81
    div-long/2addr v3, v0

    .line 82
    long-to-int p0, v3

    .line 83
    const v0, 0x15180

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_4
    const-wide/16 v0, 0xe10

    .line 88
    .line 89
    cmp-long p0, v3, v0

    .line 90
    .line 91
    if-lez p0, :cond_5

    .line 92
    .line 93
    div-long/2addr v3, v0

    .line 94
    long-to-int p0, v3

    .line 95
    mul-int/lit16 p0, p0, 0xe10

    .line 96
    .line 97
    goto :goto_1

    .line 98
    :cond_5
    const-wide/16 v0, 0x3c

    .line 99
    .line 100
    cmp-long p0, v3, v0

    .line 101
    .line 102
    const/16 v2, 0x3c

    .line 103
    .line 104
    if-lez p0, :cond_6

    .line 105
    .line 106
    div-long/2addr v3, v0

    .line 107
    long-to-int p0, v3

    .line 108
    mul-int/2addr p0, v2

    .line 109
    goto :goto_1

    .line 110
    :cond_6
    move p0, v2

    .line 111
    :goto_1
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    return-object p0
.end method

.method public riskAuditUser(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isRiskAudit()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_3

    .line 6
    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->clone()Lcom/p1/mobile/putong/data/User;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isRiskAuditAvatar()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iget-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Lcom/p1/mobile/putong/data/Media;

    .line 28
    .line 29
    iget-object v3, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 30
    .line 31
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    check-cast v2, Lcom/p1/mobile/putong/data/Media;

    .line 36
    .line 37
    iget-object v2, v2, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 38
    .line 39
    iput-object v2, v1, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 40
    .line 41
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isRiskAuditName()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 48
    .line 49
    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 50
    .line 51
    :cond_2
    return-object v0

    .line 52
    :cond_3
    :goto_0
    return-object p0
.end method

.method public setBlackDiamondTag(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Settings;->getSettingGroup()Lcom/p1/mobile/putong/data/SettingGroups;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 22
    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveSettings;->hideDiamondTag:Ljava/lang/Boolean;

    .line 30
    .line 31
    :cond_0
    return-void
.end method

.method public setParsedApiRequest(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/User;->requestUrl:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setPinyinOfRealName(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/data/User;->pinyinOfRealName:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method public shouldMergeData()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->requestUrl:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->requestUrl:Ljava/lang/String;

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

.method public showPicVerificationIcon(Landroid/view/View;Lv/VImage;)V
    .locals 2

    .line 1
    sget-object v0, Ll/uqb0;->b0:Ll/sre0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/sre0;->b:Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v0, v1, p0, p2}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->showUserVerificationLogo(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;Lv/VImage;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ll/nrb0;->b()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    invoke-static {p2}, Ll/bnl0;->O0(Landroid/view/View;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-static {p1, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public subtract(Lcom/p1/mobile/putong/data/User;)Lcom/p1/mobile/putong/data/User;
    .locals 3

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/data/User;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 7
    .line 8
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 19
    .line 20
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 21
    .line 22
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-nez v1, :cond_1

    .line 29
    .line 30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 33
    .line 34
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 35
    .line 36
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 37
    .line 38
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 45
    .line 46
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 47
    .line 48
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 49
    .line 50
    if-eqz v1, :cond_3

    .line 51
    .line 52
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/Profile;->subtract(Lcom/p1/mobile/putong/data/Profile;)Lcom/p1/mobile/putong/data/Profile;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 59
    .line 60
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 61
    .line 62
    if-eqz v1, :cond_4

    .line 63
    .line 64
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 65
    .line 66
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/Settings;->subtract(Lcom/p1/mobile/putong/data/Settings;)Lcom/p1/mobile/putong/data/Settings;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 71
    .line 72
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 73
    .line 74
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 75
    .line 76
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v1

    .line 80
    if-nez v1, :cond_5

    .line 81
    .line 82
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 83
    .line 84
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 85
    .line 86
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 87
    .line 88
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 89
    .line 90
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    if-nez v1, :cond_6

    .line 95
    .line 96
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 97
    .line 98
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 99
    .line 100
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 101
    .line 102
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 103
    .line 104
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    if-nez v1, :cond_7

    .line 109
    .line 110
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 111
    .line 112
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 113
    .line 114
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 115
    .line 116
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 117
    .line 118
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-nez v1, :cond_8

    .line 123
    .line 124
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 125
    .line 126
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 127
    .line 128
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 129
    .line 130
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 131
    .line 132
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-nez v1, :cond_9

    .line 137
    .line 138
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 139
    .line 140
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 141
    .line 142
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 143
    .line 144
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 145
    .line 146
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v1

    .line 150
    if-nez v1, :cond_a

    .line 151
    .line 152
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 153
    .line 154
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 155
    .line 156
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 157
    .line 158
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 159
    .line 160
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result v1

    .line 164
    if-nez v1, :cond_b

    .line 165
    .line 166
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 167
    .line 168
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 169
    .line 170
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 171
    .line 172
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 173
    .line 174
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-nez v1, :cond_c

    .line 179
    .line 180
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 181
    .line 182
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 183
    .line 184
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 185
    .line 186
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 187
    .line 188
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result v1

    .line 192
    if-nez v1, :cond_d

    .line 193
    .line 194
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 195
    .line 196
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 197
    .line 198
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 199
    .line 200
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 201
    .line 202
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    if-nez v1, :cond_e

    .line 207
    .line 208
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 209
    .line 210
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 211
    .line 212
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 213
    .line 214
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 215
    .line 216
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v1

    .line 220
    if-nez v1, :cond_f

    .line 221
    .line 222
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 223
    .line 224
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 225
    .line 226
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 227
    .line 228
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 229
    .line 230
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    if-nez v1, :cond_10

    .line 235
    .line 236
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 237
    .line 238
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 239
    .line 240
    :cond_10
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 241
    .line 242
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 243
    .line 244
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    if-nez v1, :cond_11

    .line 249
    .line 250
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 251
    .line 252
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 253
    .line 254
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 255
    .line 256
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 257
    .line 258
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 259
    .line 260
    .line 261
    move-result v1

    .line 262
    if-nez v1, :cond_12

    .line 263
    .line 264
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 265
    .line 266
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 267
    .line 268
    :cond_12
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 269
    .line 270
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 271
    .line 272
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    if-nez v1, :cond_13

    .line 277
    .line 278
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 279
    .line 280
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 281
    .line 282
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 283
    .line 284
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 285
    .line 286
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 287
    .line 288
    .line 289
    move-result v1

    .line 290
    if-nez v1, :cond_14

    .line 291
    .line 292
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 293
    .line 294
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 295
    .line 296
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 297
    .line 298
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 299
    .line 300
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    move-result v1

    .line 304
    if-nez v1, :cond_15

    .line 305
    .line 306
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 307
    .line 308
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 309
    .line 310
    :cond_15
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 311
    .line 312
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 313
    .line 314
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 315
    .line 316
    .line 317
    move-result v1

    .line 318
    if-nez v1, :cond_16

    .line 319
    .line 320
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 321
    .line 322
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 323
    .line 324
    :cond_16
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 325
    .line 326
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 327
    .line 328
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result v1

    .line 332
    if-nez v1, :cond_17

    .line 333
    .line 334
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 335
    .line 336
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 337
    .line 338
    :cond_17
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 339
    .line 340
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 341
    .line 342
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 343
    .line 344
    .line 345
    move-result v1

    .line 346
    if-nez v1, :cond_18

    .line 347
    .line 348
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 349
    .line 350
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 351
    .line 352
    :cond_18
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 353
    .line 354
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 355
    .line 356
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 357
    .line 358
    .line 359
    move-result v1

    .line 360
    if-nez v1, :cond_19

    .line 361
    .line 362
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 363
    .line 364
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 365
    .line 366
    :cond_19
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 367
    .line 368
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 369
    .line 370
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 371
    .line 372
    .line 373
    move-result v1

    .line 374
    if-nez v1, :cond_1a

    .line 375
    .line 376
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 377
    .line 378
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 379
    .line 380
    :cond_1a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 381
    .line 382
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 383
    .line 384
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    if-nez v1, :cond_1b

    .line 389
    .line 390
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 391
    .line 392
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 393
    .line 394
    :cond_1b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 395
    .line 396
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 397
    .line 398
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 399
    .line 400
    .line 401
    move-result v1

    .line 402
    if-nez v1, :cond_1c

    .line 403
    .line 404
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 405
    .line 406
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 407
    .line 408
    :cond_1c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 409
    .line 410
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 411
    .line 412
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 413
    .line 414
    .line 415
    move-result v1

    .line 416
    if-nez v1, :cond_1d

    .line 417
    .line 418
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 419
    .line 420
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 421
    .line 422
    :cond_1d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 423
    .line 424
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 425
    .line 426
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 427
    .line 428
    .line 429
    move-result v1

    .line 430
    if-nez v1, :cond_1e

    .line 431
    .line 432
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 433
    .line 434
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 435
    .line 436
    :cond_1e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 437
    .line 438
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 439
    .line 440
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 441
    .line 442
    .line 443
    move-result v1

    .line 444
    if-nez v1, :cond_1f

    .line 445
    .line 446
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 447
    .line 448
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 449
    .line 450
    :cond_1f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 451
    .line 452
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 453
    .line 454
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 455
    .line 456
    .line 457
    move-result v1

    .line 458
    if-nez v1, :cond_20

    .line 459
    .line 460
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 461
    .line 462
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 463
    .line 464
    :cond_20
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 465
    .line 466
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 467
    .line 468
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 469
    .line 470
    .line 471
    move-result v1

    .line 472
    if-nez v1, :cond_21

    .line 473
    .line 474
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 475
    .line 476
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 477
    .line 478
    :cond_21
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 479
    .line 480
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 481
    .line 482
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 483
    .line 484
    .line 485
    move-result v1

    .line 486
    if-nez v1, :cond_22

    .line 487
    .line 488
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 489
    .line 490
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->totalRewardPoint:Lcom/p1/mobile/putong/data/TotalRewardPoint;

    .line 491
    .line 492
    :cond_22
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 493
    .line 494
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 495
    .line 496
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 497
    .line 498
    .line 499
    move-result v1

    .line 500
    if-nez v1, :cond_23

    .line 501
    .line 502
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 503
    .line 504
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 505
    .line 506
    :cond_23
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 507
    .line 508
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 509
    .line 510
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 511
    .line 512
    .line 513
    move-result v1

    .line 514
    if-nez v1, :cond_24

    .line 515
    .line 516
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 517
    .line 518
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 519
    .line 520
    :cond_24
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 521
    .line 522
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 523
    .line 524
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 525
    .line 526
    .line 527
    move-result v1

    .line 528
    if-nez v1, :cond_25

    .line 529
    .line 530
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 531
    .line 532
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 533
    .line 534
    :cond_25
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 535
    .line 536
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 537
    .line 538
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 539
    .line 540
    .line 541
    move-result v1

    .line 542
    if-nez v1, :cond_26

    .line 543
    .line 544
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 545
    .line 546
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 547
    .line 548
    :cond_26
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 549
    .line 550
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 551
    .line 552
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 553
    .line 554
    .line 555
    move-result v1

    .line 556
    if-nez v1, :cond_27

    .line 557
    .line 558
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 559
    .line 560
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 561
    .line 562
    :cond_27
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 563
    .line 564
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 565
    .line 566
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 567
    .line 568
    .line 569
    move-result v1

    .line 570
    if-nez v1, :cond_28

    .line 571
    .line 572
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 573
    .line 574
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 575
    .line 576
    :cond_28
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 577
    .line 578
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 579
    .line 580
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 581
    .line 582
    .line 583
    move-result v1

    .line 584
    if-nez v1, :cond_29

    .line 585
    .line 586
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 587
    .line 588
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 589
    .line 590
    :cond_29
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 591
    .line 592
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 593
    .line 594
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 595
    .line 596
    .line 597
    move-result v1

    .line 598
    if-nez v1, :cond_2a

    .line 599
    .line 600
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 601
    .line 602
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 603
    .line 604
    :cond_2a
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 605
    .line 606
    if-eqz v1, :cond_2b

    .line 607
    .line 608
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 609
    .line 610
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/data/ActivityUser;->subtract(Lcom/p1/mobile/putong/data/ActivityUser;)Lcom/p1/mobile/putong/data/ActivityUser;

    .line 611
    .line 612
    .line 613
    move-result-object v1

    .line 614
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 615
    .line 616
    :cond_2b
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 617
    .line 618
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 619
    .line 620
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 621
    .line 622
    .line 623
    move-result v1

    .line 624
    if-nez v1, :cond_2c

    .line 625
    .line 626
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 627
    .line 628
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 629
    .line 630
    :cond_2c
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 631
    .line 632
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 633
    .line 634
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 635
    .line 636
    .line 637
    move-result v1

    .line 638
    if-nez v1, :cond_2d

    .line 639
    .line 640
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 641
    .line 642
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 643
    .line 644
    :cond_2d
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 645
    .line 646
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 647
    .line 648
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 649
    .line 650
    .line 651
    move-result v1

    .line 652
    if-nez v1, :cond_2e

    .line 653
    .line 654
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 655
    .line 656
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 657
    .line 658
    :cond_2e
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 659
    .line 660
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 661
    .line 662
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 663
    .line 664
    .line 665
    move-result v1

    .line 666
    if-nez v1, :cond_2f

    .line 667
    .line 668
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 669
    .line 670
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    .line 671
    .line 672
    :cond_2f
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 673
    .line 674
    iget-object v2, p1, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 675
    .line 676
    invoke-static {v1, v2}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 677
    .line 678
    .line 679
    move-result v1

    .line 680
    if-nez v1, :cond_30

    .line 681
    .line 682
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 683
    .line 684
    iput-object v1, v0, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 685
    .line 686
    :cond_30
    iget-object v1, p0, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 687
    .line 688
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 689
    .line 690
    invoke-static {v1, p1}, Lcom/tantanapp/common/data/ValueObject;->util_equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 691
    .line 692
    .line 693
    move-result p1

    .line 694
    if-nez p1, :cond_31

    .line 695
    .line 696
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 697
    .line 698
    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->ideal:Lcom/p1/mobile/putong/data/UserIdealInfo;

    .line 699
    .line 700
    :cond_31
    new-instance p0, Lcom/p1/mobile/putong/data/User;

    .line 701
    .line 702
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    .line 703
    .line 704
    .line 705
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/data/User;->equals(Ljava/lang/Object;)Z

    .line 706
    .line 707
    .line 708
    move-result p0

    .line 709
    if-eqz p0, :cond_32

    .line 710
    .line 711
    const/4 p0, 0x0

    .line 712
    return-object p0

    .line 713
    :cond_32
    return-object v0
.end method

.method public superLikedMe()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/User;->checkRelationshipStatus()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    return v1

    .line 34
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 37
    .line 38
    const-string v0, "superLiked"

    .line 39
    .line 40
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0

    .line 49
    :cond_2
    :goto_0
    return v1
.end method

.method public talkMatchUnlock()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 20
    .line 21
    const-string v0, "default"

    .line 22
    .line 23
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    return v1
.end method

.method public toJson()Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/data/User;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

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

.method public unilateralBlock()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_4

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 16
    .line 17
    if-eqz v0, :cond_4

    .line 18
    .line 19
    invoke-static {}, Ll/nrb0;->e()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 24
    .line 25
    const-string v3, "blocked"

    .line 26
    .line 27
    if-eqz v0, :cond_3

    .line 28
    .line 29
    iget-object v0, v2, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 30
    .line 31
    invoke-static {v0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 40
    .line 41
    const-string v0, "peeking_blocked"

    .line 42
    .line 43
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_1
    return v1

    .line 51
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 52
    return p0

    .line 53
    :cond_3
    iget-object p0, v2, Lcom/p1/mobile/putong/data/Relationship;->conversationStatus:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 54
    .line 55
    invoke-static {p0, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    return p0

    .line 60
    :cond_4
    :goto_1
    return v1
.end method

.method public veryUgly()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    const-string v0, "lowPopularity"

    .line 8
    .line 9
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/UserStatus;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public vipSeen()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/uqb0;->c0:Ll/bn5;

    .line 4
    .line 5
    invoke-interface {v1}, Ll/bn5;->userId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-nez v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/User;->checkRelationshipStatus()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_1

    .line 32
    .line 33
    return v1

    .line 34
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->status:Ljava/util/List;

    .line 37
    .line 38
    const-string v0, "vipseen"

    .line 39
    .line 40
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/MatchFrom;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0

    .line 49
    :cond_2
    :goto_0
    return v1
.end method
