.class public final Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveright/liveRight;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UserLiveRight"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightOrBuilder;"
    }
.end annotation


# static fields
.field public static final ATTRIBUTE_FIELD_NUMBER:I = 0x8

.field public static final CREATETIMEINSECONDS_FIELD_NUMBER:I = 0xa

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

.field public static final FROMUSERID_FIELD_NUMBER:I = 0xc

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final LEVEL_FIELD_NUMBER:I = 0x7

.field public static final LIVERIGHTID_FIELD_NUMBER:I = 0x3

.field public static final NAME_FIELD_NUMBER:I = 0x5

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;",
            ">;"
        }
    .end annotation
.end field

.field public static final PLACETYPE_FIELD_NUMBER:I = 0xd

.field public static final RIGHTTYPE_FIELD_NUMBER:I = 0x4

.field public static final SHOWTYPE_FIELD_NUMBER:I = 0x6

.field public static final STATUS_FIELD_NUMBER:I = 0x9

.field public static final USERID_FIELD_NUMBER:I = 0x2

.field public static final VALIDENDTIMEINSECONDS_FIELD_NUMBER:I = 0xb


# instance fields
.field private attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

.field private createTimeInSeconds_:J

.field private fromUserId_:Ljava/lang/String;

.field private id_:Ljava/lang/String;

.field private level_:J

.field private liveRightId_:Ljava/lang/String;

.field private name_:Ljava/lang/String;

.field private placeType_:I

.field private rightType_:I

.field private showType_:I

.field private status_:I

.field private userId_:Ljava/lang/String;

.field private validEndTimeInSeconds_:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->makeImmutable()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/google/protobuf/GeneratedMessageLite;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setPlaceType(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setPlaceTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setRightType(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setRightTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setShowType(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setShowTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setStatus(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setStatusValue(I)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setValidEndTimeInSeconds(J)V

    return-void
.end method

.method public static bridge synthetic L()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->clearAttribute()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->clearCreateTimeInSeconds()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->clearFromUserId()V

    return-void
.end method

.method private clearAttribute()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 3
    .line 4
    return-void
.end method

.method private clearCreateTimeInSeconds()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->createTimeInSeconds_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearFromUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getFromUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearLevel()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->level_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearLiveRightId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getLiveRightId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPlaceType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->placeType_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearRightType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->rightType_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearShowType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->showType_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearStatus()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->status_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearValidEndTimeInSeconds()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->validEndTimeInSeconds_:J

    .line 4
    .line 5
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->clearId()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->clearLevel()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->clearLiveRightId()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->clearName()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->clearPlaceType()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->clearRightType()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->clearShowType()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->clearStatus()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->clearValidEndTimeInSeconds()V

    return-void
.end method

.method private mergeAttribute(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0, p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->mergeAttribute(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setAttribute(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setAttribute(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->getParserForType()Ll/ng60;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    return-object v0
.end method

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setCreateTimeInSeconds(J)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setFromUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setFromUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private setAttribute(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 8
    .line 9
    return-void
.end method

.method private setAttribute(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    return-void
.end method

.method private setCreateTimeInSeconds(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->createTimeInSeconds_:J

    .line 2
    .line 3
    return-void
.end method

.method private setFromUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setFromUserIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setLevel(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->level_:J

    .line 2
    .line 3
    return-void
.end method

.method private setLiveRightId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setLiveRightIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setNameBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPlaceType(Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->placeType_:I

    .line 9
    .line 10
    return-void
.end method

.method private setPlaceTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->placeType_:I

    .line 2
    .line 3
    return-void
.end method

.method private setRightType(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->rightType_:I

    .line 9
    .line 10
    return-void
.end method

.method private setRightTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->rightType_:I

    .line 2
    .line 3
    return-void
.end method

.method private setShowType(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->showType_:I

    .line 9
    .line 10
    return-void
.end method

.method private setShowTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->showType_:I

    .line 2
    .line 3
    return-void
.end method

.method private setStatus(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->status_:I

    .line 9
    .line 10
    return-void
.end method

.method private setStatusValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->status_:I

    .line 2
    .line 3
    return-void
.end method

.method private setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserIdBytes(Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/protobuf/a;->checkByteStringIsUtf8(Lcom/google/protobuf/ByteString;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setValidEndTimeInSeconds(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->validEndTimeInSeconds_:J

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setLevel(J)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setLiveRightId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setLiveRightIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->setNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    const/4 v0, 0x0

    .line 11
    const/4 v2, 0x1

    .line 12
    packed-switch p1, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/l710;->a()V

    .line 16
    .line 17
    .line 18
    return-object v1

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->PARSER:Ll/ng60;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    move-object p1, v0

    .line 42
    goto :goto_1

    .line 43
    :cond_0
    :goto_0
    monitor-exit p0

    .line 44
    goto :goto_2

    .line 45
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    throw p1

    .line 47
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->PARSER:Ll/ng60;

    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 51
    .line 52
    check-cast p3, Lcom/google/protobuf/h;

    .line 53
    .line 54
    :cond_2
    :goto_3
    if-nez v0, :cond_4

    .line 55
    .line 56
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    sparse-switch p1, :sswitch_data_0

    .line 61
    .line 62
    .line 63
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    if-nez p1, :cond_2

    .line 68
    .line 69
    :sswitch_0
    move v0, v2

    .line 70
    goto :goto_3

    .line 71
    :catch_0
    move-exception v0

    .line 72
    move-object p1, v0

    .line 73
    goto/16 :goto_5

    .line 74
    .line 75
    :catch_1
    move-exception v0

    .line 76
    move-object p1, v0

    .line 77
    goto/16 :goto_6

    .line 78
    .line 79
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 80
    .line 81
    .line 82
    move-result p1

    .line 83
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->placeType_:I

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 94
    .line 95
    .line 96
    move-result-wide v3

    .line 97
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->validEndTimeInSeconds_:J

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->createTimeInSeconds_:J

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->status_:I

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :sswitch_6
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 115
    .line 116
    if-eqz p1, :cond_3

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;

    .line 123
    .line 124
    goto :goto_4

    .line 125
    :cond_3
    move-object p1, v1

    .line 126
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->parser()Ll/ng60;

    .line 127
    .line 128
    .line 129
    move-result-object v3

    .line 130
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 135
    .line 136
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 137
    .line 138
    if-eqz p1, :cond_2

    .line 139
    .line 140
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 141
    .line 142
    .line 143
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 148
    .line 149
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 150
    .line 151
    goto :goto_3

    .line 152
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 153
    .line 154
    .line 155
    move-result-wide v3

    .line 156
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->level_:J

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 160
    .line 161
    .line 162
    move-result p1

    .line 163
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->showType_:I

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->rightType_:I

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 185
    .line 186
    goto/16 :goto_3

    .line 187
    .line 188
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 193
    .line 194
    goto/16 :goto_3

    .line 195
    .line 196
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 201
    .line 202
    goto/16 :goto_3

    .line 203
    .line 204
    :catchall_1
    move-exception v0

    .line 205
    move-object p0, v0

    .line 206
    throw p0

    .line 207
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 208
    .line 209
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 221
    .line 222
    .line 223
    return-object v1

    .line 224
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 229
    .line 230
    .line 231
    return-object v1

    .line 232
    :cond_4
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 233
    .line 234
    return-object p0

    .line 235
    :pswitch_3
    move-object v3, p2

    .line 236
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 237
    .line 238
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 239
    .line 240
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;

    .line 241
    .line 242
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 243
    .line 244
    .line 245
    move-result p1

    .line 246
    xor-int/2addr p1, v2

    .line 247
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;

    .line 248
    .line 249
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;

    .line 250
    .line 251
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 252
    .line 253
    .line 254
    move-result v1

    .line 255
    xor-int/2addr v1, v2

    .line 256
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;

    .line 257
    .line 258
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;

    .line 263
    .line 264
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 267
    .line 268
    .line 269
    move-result p1

    .line 270
    xor-int/2addr p1, v2

    .line 271
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 272
    .line 273
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 274
    .line 275
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    xor-int/2addr v1, v2

    .line 280
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 281
    .line 282
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 287
    .line 288
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 289
    .line 290
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 291
    .line 292
    .line 293
    move-result p1

    .line 294
    xor-int/2addr p1, v2

    .line 295
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 296
    .line 297
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 298
    .line 299
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 300
    .line 301
    .line 302
    move-result v1

    .line 303
    xor-int/2addr v1, v2

    .line 304
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 305
    .line 306
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object p1

    .line 310
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 311
    .line 312
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->rightType_:I

    .line 313
    .line 314
    if-eqz p1, :cond_5

    .line 315
    .line 316
    move p2, v2

    .line 317
    goto :goto_7

    .line 318
    :cond_5
    move p2, v0

    .line 319
    :goto_7
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->rightType_:I

    .line 320
    .line 321
    if-eqz v1, :cond_6

    .line 322
    .line 323
    move v4, v2

    .line 324
    goto :goto_8

    .line 325
    :cond_6
    move v4, v0

    .line 326
    :goto_8
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 327
    .line 328
    .line 329
    move-result p1

    .line 330
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->rightType_:I

    .line 331
    .line 332
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 333
    .line 334
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 335
    .line 336
    .line 337
    move-result p1

    .line 338
    xor-int/2addr p1, v2

    .line 339
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 340
    .line 341
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 342
    .line 343
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 344
    .line 345
    .line 346
    move-result v1

    .line 347
    xor-int/2addr v1, v2

    .line 348
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 349
    .line 350
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object p1

    .line 354
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 355
    .line 356
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->showType_:I

    .line 357
    .line 358
    if-eqz p1, :cond_7

    .line 359
    .line 360
    move p2, v2

    .line 361
    goto :goto_9

    .line 362
    :cond_7
    move p2, v0

    .line 363
    :goto_9
    iget v1, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->showType_:I

    .line 364
    .line 365
    if-eqz v1, :cond_8

    .line 366
    .line 367
    move v4, v2

    .line 368
    goto :goto_a

    .line 369
    :cond_8
    move v4, v0

    .line 370
    :goto_a
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 371
    .line 372
    .line 373
    move-result p1

    .line 374
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->showType_:I

    .line 375
    .line 376
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->level_:J

    .line 377
    .line 378
    const-wide/16 p1, 0x0

    .line 379
    .line 380
    cmp-long v1, v5, p1

    .line 381
    .line 382
    if-eqz v1, :cond_9

    .line 383
    .line 384
    move v4, v2

    .line 385
    goto :goto_b

    .line 386
    :cond_9
    move v4, v0

    .line 387
    :goto_b
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->level_:J

    .line 388
    .line 389
    cmp-long v1, v8, p1

    .line 390
    .line 391
    if-eqz v1, :cond_a

    .line 392
    .line 393
    move v7, v2

    .line 394
    goto :goto_c

    .line 395
    :cond_a
    move v7, v0

    .line 396
    :goto_c
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 397
    .line 398
    .line 399
    move-result-wide v4

    .line 400
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->level_:J

    .line 401
    .line 402
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 403
    .line 404
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 405
    .line 406
    invoke-interface {v3, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 407
    .line 408
    .line 409
    move-result-object v1

    .line 410
    check-cast v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 411
    .line 412
    iput-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 413
    .line 414
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->status_:I

    .line 415
    .line 416
    if-eqz v1, :cond_b

    .line 417
    .line 418
    move v4, v2

    .line 419
    goto :goto_d

    .line 420
    :cond_b
    move v4, v0

    .line 421
    :goto_d
    iget v5, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->status_:I

    .line 422
    .line 423
    if-eqz v5, :cond_c

    .line 424
    .line 425
    move v6, v2

    .line 426
    goto :goto_e

    .line 427
    :cond_c
    move v6, v0

    .line 428
    :goto_e
    invoke-interface {v3, v4, v1, v6, v5}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 429
    .line 430
    .line 431
    move-result v1

    .line 432
    iput v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->status_:I

    .line 433
    .line 434
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->createTimeInSeconds_:J

    .line 435
    .line 436
    cmp-long v1, v5, p1

    .line 437
    .line 438
    if-eqz v1, :cond_d

    .line 439
    .line 440
    move v4, v2

    .line 441
    goto :goto_f

    .line 442
    :cond_d
    move v4, v0

    .line 443
    :goto_f
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->createTimeInSeconds_:J

    .line 444
    .line 445
    cmp-long v1, v8, p1

    .line 446
    .line 447
    if-eqz v1, :cond_e

    .line 448
    .line 449
    move v7, v2

    .line 450
    goto :goto_10

    .line 451
    :cond_e
    move v7, v0

    .line 452
    :goto_10
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 453
    .line 454
    .line 455
    move-result-wide v4

    .line 456
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->createTimeInSeconds_:J

    .line 457
    .line 458
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->validEndTimeInSeconds_:J

    .line 459
    .line 460
    cmp-long v1, v5, p1

    .line 461
    .line 462
    if-eqz v1, :cond_f

    .line 463
    .line 464
    move v4, v2

    .line 465
    goto :goto_11

    .line 466
    :cond_f
    move v4, v0

    .line 467
    :goto_11
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->validEndTimeInSeconds_:J

    .line 468
    .line 469
    cmp-long p1, v8, p1

    .line 470
    .line 471
    if-eqz p1, :cond_10

    .line 472
    .line 473
    move v7, v2

    .line 474
    goto :goto_12

    .line 475
    :cond_10
    move v7, v0

    .line 476
    :goto_12
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 477
    .line 478
    .line 479
    move-result-wide p1

    .line 480
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->validEndTimeInSeconds_:J

    .line 481
    .line 482
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 483
    .line 484
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 485
    .line 486
    .line 487
    move-result p1

    .line 488
    xor-int/2addr p1, v2

    .line 489
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 490
    .line 491
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 492
    .line 493
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 494
    .line 495
    .line 496
    move-result v1

    .line 497
    xor-int/2addr v1, v2

    .line 498
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 499
    .line 500
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object p1

    .line 504
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 505
    .line 506
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->placeType_:I

    .line 507
    .line 508
    if-eqz p1, :cond_11

    .line 509
    .line 510
    move p2, v2

    .line 511
    goto :goto_13

    .line 512
    :cond_11
    move p2, v0

    .line 513
    :goto_13
    iget p3, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->placeType_:I

    .line 514
    .line 515
    if-eqz p3, :cond_12

    .line 516
    .line 517
    move v0, v2

    .line 518
    :cond_12
    invoke-interface {v3, p2, p1, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 519
    .line 520
    .line 521
    move-result p1

    .line 522
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->placeType_:I

    .line 523
    .line 524
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 525
    .line 526
    return-object p0

    .line 527
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;

    .line 528
    .line 529
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight$Builder;-><init>(Ll/x4r0;)V

    .line 530
    .line 531
    .line 532
    return-object p0

    .line 533
    :pswitch_5
    return-object v1

    .line 534
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 535
    .line 536
    return-object p0

    .line 537
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;

    .line 538
    .line 539
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;-><init>()V

    .line 540
    .line 541
    .line 542
    return-object p0

    .line 543
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch

    .line 544
    .line 545
    .line 546
    .line 547
    .line 548
    .line 549
    .line 550
    .line 551
    .line 552
    .line 553
    .line 554
    .line 555
    .line 556
    .line 557
    .line 558
    .line 559
    .line 560
    .line 561
    .line 562
    .line 563
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_d
        0x12 -> :sswitch_c
        0x1a -> :sswitch_b
        0x20 -> :sswitch_a
        0x2a -> :sswitch_9
        0x30 -> :sswitch_8
        0x38 -> :sswitch_7
        0x42 -> :sswitch_6
        0x48 -> :sswitch_5
        0x50 -> :sswitch_4
        0x58 -> :sswitch_3
        0x62 -> :sswitch_2
        0x68 -> :sswitch_1
    .end sparse-switch
.end method

.method public getAttribute()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getCreateTimeInSeconds()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->createTimeInSeconds_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFromUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFromUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLevel()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->level_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getLiveRightId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLiveRightIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getPlaceType()Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->placeType_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getPlaceTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->placeType_:I

    .line 2
    .line 3
    return p0
.end method

.method public getRightType()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->rightType_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getRightTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->rightType_:I

    .line 2
    .line 3
    return p0
.end method

.method public getSerializedSize()I
    .locals 6

    .line 1
    iget v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-eq v0, v1, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x2

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getUserId()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/2addr v0, v1

    .line 44
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    const/4 v1, 0x3

    .line 53
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getLiveRightId()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    add-int/2addr v0, v1

    .line 62
    :cond_3
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->rightType_:I

    .line 63
    .line 64
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;->emptyType:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;

    .line 65
    .line 66
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;->getNumber()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    if-eq v1, v2, :cond_4

    .line 71
    .line 72
    const/4 v1, 0x4

    .line 73
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->rightType_:I

    .line 74
    .line 75
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    add-int/2addr v0, v1

    .line 80
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    if-nez v1, :cond_5

    .line 87
    .line 88
    const/4 v1, 0x5

    .line 89
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getName()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    add-int/2addr v0, v1

    .line 98
    :cond_5
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->showType_:I

    .line 99
    .line 100
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;->single:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;

    .line 101
    .line 102
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;->getNumber()I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    if-eq v1, v2, :cond_6

    .line 107
    .line 108
    const/4 v1, 0x6

    .line 109
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->showType_:I

    .line 110
    .line 111
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    add-int/2addr v0, v1

    .line 116
    :cond_6
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->level_:J

    .line 117
    .line 118
    const-wide/16 v3, 0x0

    .line 119
    .line 120
    cmp-long v5, v1, v3

    .line 121
    .line 122
    if-eqz v5, :cond_7

    .line 123
    .line 124
    const/4 v5, 0x7

    .line 125
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    add-int/2addr v0, v1

    .line 130
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 131
    .line 132
    if-eqz v1, :cond_8

    .line 133
    .line 134
    const/16 v1, 0x8

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getAttribute()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    add-int/2addr v0, v1

    .line 145
    :cond_8
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->status_:I

    .line 146
    .line 147
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;->deleted:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;

    .line 148
    .line 149
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;->getNumber()I

    .line 150
    .line 151
    .line 152
    move-result v2

    .line 153
    if-eq v1, v2, :cond_9

    .line 154
    .line 155
    const/16 v1, 0x9

    .line 156
    .line 157
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->status_:I

    .line 158
    .line 159
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    add-int/2addr v0, v1

    .line 164
    :cond_9
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->createTimeInSeconds_:J

    .line 165
    .line 166
    cmp-long v5, v1, v3

    .line 167
    .line 168
    if-eqz v5, :cond_a

    .line 169
    .line 170
    const/16 v5, 0xa

    .line 171
    .line 172
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    add-int/2addr v0, v1

    .line 177
    :cond_a
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->validEndTimeInSeconds_:J

    .line 178
    .line 179
    cmp-long v3, v1, v3

    .line 180
    .line 181
    if-eqz v3, :cond_b

    .line 182
    .line 183
    const/16 v3, 0xb

    .line 184
    .line 185
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    add-int/2addr v0, v1

    .line 190
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    if-nez v1, :cond_c

    .line 197
    .line 198
    const/16 v1, 0xc

    .line 199
    .line 200
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getFromUserId()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    add-int/2addr v0, v1

    .line 209
    :cond_c
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->placeType_:I

    .line 210
    .line 211
    sget-object v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;->videoRoom:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;

    .line 212
    .line 213
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;->getNumber()I

    .line 214
    .line 215
    .line 216
    move-result v2

    .line 217
    if-eq v1, v2, :cond_d

    .line 218
    .line 219
    const/16 v1, 0xd

    .line 220
    .line 221
    iget v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->placeType_:I

    .line 222
    .line 223
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    add-int/2addr v0, v1

    .line 228
    :cond_d
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 229
    .line 230
    return v0
.end method

.method public getShowType()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->showType_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getShowTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->showType_:I

    .line 2
    .line 3
    return p0
.end method

.method public getStatus()Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->status_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getStatusValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->status_:I

    .line 2
    .line 3
    return p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getValidEndTimeInSeconds()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->validEndTimeInSeconds_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public hasAttribute()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->id_:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x1

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getId()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->userId_:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x2

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getUserId()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->liveRightId_:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_2

    .line 40
    .line 41
    const/4 v0, 0x3

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getLiveRightId()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->rightType_:I

    .line 50
    .line 51
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;->emptyType:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Type;->getNumber()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    if-eq v0, v1, :cond_3

    .line 58
    .line 59
    const/4 v0, 0x4

    .line 60
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->rightType_:I

    .line 61
    .line 62
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->name_:Ljava/lang/String;

    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_4

    .line 72
    .line 73
    const/4 v0, 0x5

    .line 74
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getName()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_4
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->showType_:I

    .line 82
    .line 83
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;->single:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;

    .line 84
    .line 85
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ShowType;->getNumber()I

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eq v0, v1, :cond_5

    .line 90
    .line 91
    const/4 v0, 0x6

    .line 92
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->showType_:I

    .line 93
    .line 94
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 95
    .line 96
    .line 97
    :cond_5
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->level_:J

    .line 98
    .line 99
    const-wide/16 v2, 0x0

    .line 100
    .line 101
    cmp-long v4, v0, v2

    .line 102
    .line 103
    if-eqz v4, :cond_6

    .line 104
    .line 105
    const/4 v4, 0x7

    .line 106
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 107
    .line 108
    .line 109
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->attribute_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 110
    .line 111
    if-eqz v0, :cond_7

    .line 112
    .line 113
    const/16 v0, 0x8

    .line 114
    .line 115
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getAttribute()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 120
    .line 121
    .line 122
    :cond_7
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->status_:I

    .line 123
    .line 124
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;->deleted:Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;

    .line 125
    .line 126
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRightStatus;->getNumber()I

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-eq v0, v1, :cond_8

    .line 131
    .line 132
    const/16 v0, 0x9

    .line 133
    .line 134
    iget v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->status_:I

    .line 135
    .line 136
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 137
    .line 138
    .line 139
    :cond_8
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->createTimeInSeconds_:J

    .line 140
    .line 141
    cmp-long v4, v0, v2

    .line 142
    .line 143
    if-eqz v4, :cond_9

    .line 144
    .line 145
    const/16 v4, 0xa

    .line 146
    .line 147
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 148
    .line 149
    .line 150
    :cond_9
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->validEndTimeInSeconds_:J

    .line 151
    .line 152
    cmp-long v2, v0, v2

    .line 153
    .line 154
    if-eqz v2, :cond_a

    .line 155
    .line 156
    const/16 v2, 0xb

    .line 157
    .line 158
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 159
    .line 160
    .line 161
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->fromUserId_:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-nez v0, :cond_b

    .line 168
    .line 169
    const/16 v0, 0xc

    .line 170
    .line 171
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->getFromUserId()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 176
    .line 177
    .line 178
    :cond_b
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->placeType_:I

    .line 179
    .line 180
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;->videoRoom:Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;

    .line 181
    .line 182
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$PlaceType;->getNumber()I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    if-eq v0, v1, :cond_c

    .line 187
    .line 188
    const/16 v0, 0xd

    .line 189
    .line 190
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$UserLiveRight;->placeType_:I

    .line 191
    .line 192
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 193
    .line 194
    .line 195
    :cond_c
    return-void
.end method
