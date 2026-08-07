.class public final Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecallOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LiveChatRecall"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecallOrBuilder;"
    }
.end annotation


# static fields
.field public static final AGE_FIELD_NUMBER:I = 0x6

.field public static final AUTH_FIELD_NUMBER:I = 0x2

.field public static final BIRTHDAY_FIELD_NUMBER:I = 0xf

.field public static final BROADCASTID_FIELD_NUMBER:I = 0x10

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

.field public static final GENDER_FIELD_NUMBER:I = 0x4

.field public static final NAME_FIELD_NUMBER:I = 0x5

.field public static final OPENINGREMARK_FIELD_NUMBER:I = 0xd

.field public static final OTHERUSERID_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;",
            ">;"
        }
    .end annotation
.end field

.field public static final POOLID_FIELD_NUMBER:I = 0xe

.field public static final QUERYTOKEN_FIELD_NUMBER:I = 0xa

.field public static final SESSIONID_FIELD_NUMBER:I = 0xc

.field public static final TAG1_FIELD_NUMBER:I = 0x7

.field public static final TAG2_FIELD_NUMBER:I = 0x8

.field public static final TAG3_FIELD_NUMBER:I = 0x9

.field public static final TOPIC_FIELD_NUMBER:I = 0xb

.field public static final URL_FIELD_NUMBER:I = 0x3


# instance fields
.field private age_:Ljava/lang/String;

.field private auth_:Ljava/lang/String;

.field private birthday_:J

.field private broadcastID_:Ljava/lang/String;

.field private gender_:Ljava/lang/String;

.field private name_:Ljava/lang/String;

.field private openingRemark_:Ljava/lang/String;

.field private otherUserId_:Ljava/lang/String;

.field private poolID_:Ljava/lang/String;

.field private queryToken_:Ljava/lang/String;

.field private sessionID_:Ljava/lang/String;

.field private tag1_:Ljava/lang/String;

.field private tag2_:Ljava/lang/String;

.field private tag3_:Ljava/lang/String;

.field private topic_:Ljava/lang/String;

.field private url_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

    .line 25
    .line 26
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

    .line 27
    .line 28
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

    .line 31
    .line 32
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

    .line 33
    .line 34
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

    .line 35
    .line 36
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setOpeningRemark(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setOpeningRemarkBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setOtherUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setOtherUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setPoolID(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setPoolIDBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setQueryToken(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setQueryTokenBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setSessionID(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setSessionIDBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setTag1(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setTag1Bytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setTag2(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic O(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setTag2Bytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic P(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setTag3(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic Q(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setTag3Bytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic R(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setTopic(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic S(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setTopicBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic T(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic U(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic V()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearAge()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearAuth()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearBirthday()V

    return-void
.end method

.method private clearAge()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getAge()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAuth()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getAuth()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearBirthday()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->birthday_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearBroadcastID()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getBroadcastID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGender()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getGender()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOpeningRemark()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getOpeningRemark()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOtherUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getOtherUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearPoolID()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getPoolID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearQueryToken()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getQueryToken()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSessionID()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getSessionID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTag1()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTag1()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTag2()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTag2()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTag3()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTag3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTopic()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTopic()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearBroadcastID()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearGender()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearName()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearOpeningRemark()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearOtherUserId()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearPoolID()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearQueryToken()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearSessionID()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearTag1()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearTag2()V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearTag3()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearTopic()V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->clearUrl()V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setAge(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setAgeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setAuth(Ljava/lang/String;)V

    return-void
.end method

.method private setAge(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAgeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAuth(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAuthBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setBirthday(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->birthday_:J

    .line 2
    .line 3
    return-void
.end method

.method private setBroadcastID(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setBroadcastIDBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGender(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setGenderBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOpeningRemark(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOpeningRemarkBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOtherUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOtherUserIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setPoolID(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setPoolIDBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setQueryToken(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setQueryTokenBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSessionID(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSessionIDBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTag1(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTag1Bytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTag2(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTag2Bytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTag3(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTag3Bytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTopic(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTopicBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setAuthBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setBirthday(J)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setBroadcastID(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setBroadcastIDBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setGender(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setGenderBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->setName(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_3

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
    goto/16 :goto_4

    .line 74
    .line 75
    :catch_1
    move-exception v0

    .line 76
    move-object p1, v0

    .line 77
    goto/16 :goto_5

    .line 78
    .line 79
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

    .line 84
    .line 85
    goto :goto_3

    .line 86
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 87
    .line 88
    .line 89
    move-result-wide v3

    .line 90
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->birthday_:J

    .line 91
    .line 92
    goto :goto_3

    .line 93
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_3

    .line 100
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :sswitch_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :sswitch_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

    .line 154
    .line 155
    goto :goto_3

    .line 156
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

    .line 161
    .line 162
    goto :goto_3

    .line 163
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

    .line 168
    .line 169
    goto :goto_3

    .line 170
    :sswitch_e
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :sswitch_f
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

    .line 182
    .line 183
    goto/16 :goto_3

    .line 184
    .line 185
    :sswitch_10
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 190
    .line 191
    goto/16 :goto_3

    .line 192
    .line 193
    :catchall_1
    move-exception v0

    .line 194
    move-object p0, v0

    .line 195
    throw p0

    .line 196
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 197
    .line 198
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 210
    .line 211
    .line 212
    return-object v1

    .line 213
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 218
    .line 219
    .line 220
    return-object v1

    .line 221
    :cond_3
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 222
    .line 223
    return-object p0

    .line 224
    :pswitch_3
    move-object v3, p2

    .line 225
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 226
    .line 227
    check-cast p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 228
    .line 229
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;

    .line 230
    .line 231
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 232
    .line 233
    .line 234
    move-result p1

    .line 235
    xor-int/2addr p1, v2

    .line 236
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;

    .line 237
    .line 238
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;

    .line 239
    .line 240
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 241
    .line 242
    .line 243
    move-result v1

    .line 244
    xor-int/2addr v1, v2

    .line 245
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;

    .line 246
    .line 247
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;

    .line 252
    .line 253
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

    .line 254
    .line 255
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 256
    .line 257
    .line 258
    move-result p1

    .line 259
    xor-int/2addr p1, v2

    .line 260
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

    .line 261
    .line 262
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

    .line 263
    .line 264
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 265
    .line 266
    .line 267
    move-result v1

    .line 268
    xor-int/2addr v1, v2

    .line 269
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

    .line 270
    .line 271
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

    .line 276
    .line 277
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

    .line 278
    .line 279
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 280
    .line 281
    .line 282
    move-result p1

    .line 283
    xor-int/2addr p1, v2

    .line 284
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

    .line 285
    .line 286
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

    .line 287
    .line 288
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 289
    .line 290
    .line 291
    move-result v1

    .line 292
    xor-int/2addr v1, v2

    .line 293
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

    .line 294
    .line 295
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

    .line 300
    .line 301
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

    .line 302
    .line 303
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 304
    .line 305
    .line 306
    move-result p1

    .line 307
    xor-int/2addr p1, v2

    .line 308
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

    .line 309
    .line 310
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

    .line 311
    .line 312
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    xor-int/2addr v1, v2

    .line 317
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

    .line 318
    .line 319
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

    .line 324
    .line 325
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

    .line 326
    .line 327
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 328
    .line 329
    .line 330
    move-result p1

    .line 331
    xor-int/2addr p1, v2

    .line 332
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

    .line 333
    .line 334
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

    .line 335
    .line 336
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 337
    .line 338
    .line 339
    move-result v1

    .line 340
    xor-int/2addr v1, v2

    .line 341
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

    .line 342
    .line 343
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object p1

    .line 347
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

    .line 348
    .line 349
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

    .line 350
    .line 351
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 352
    .line 353
    .line 354
    move-result p1

    .line 355
    xor-int/2addr p1, v2

    .line 356
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

    .line 357
    .line 358
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

    .line 359
    .line 360
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 361
    .line 362
    .line 363
    move-result v1

    .line 364
    xor-int/2addr v1, v2

    .line 365
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

    .line 366
    .line 367
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object p1

    .line 371
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

    .line 372
    .line 373
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

    .line 374
    .line 375
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 376
    .line 377
    .line 378
    move-result p1

    .line 379
    xor-int/2addr p1, v2

    .line 380
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

    .line 381
    .line 382
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

    .line 383
    .line 384
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 385
    .line 386
    .line 387
    move-result v1

    .line 388
    xor-int/2addr v1, v2

    .line 389
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

    .line 390
    .line 391
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object p1

    .line 395
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

    .line 396
    .line 397
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

    .line 398
    .line 399
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 400
    .line 401
    .line 402
    move-result p1

    .line 403
    xor-int/2addr p1, v2

    .line 404
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

    .line 405
    .line 406
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

    .line 407
    .line 408
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 409
    .line 410
    .line 411
    move-result v1

    .line 412
    xor-int/2addr v1, v2

    .line 413
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

    .line 414
    .line 415
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object p1

    .line 419
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

    .line 420
    .line 421
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

    .line 422
    .line 423
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 424
    .line 425
    .line 426
    move-result p1

    .line 427
    xor-int/2addr p1, v2

    .line 428
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

    .line 429
    .line 430
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

    .line 431
    .line 432
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 433
    .line 434
    .line 435
    move-result v1

    .line 436
    xor-int/2addr v1, v2

    .line 437
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

    .line 438
    .line 439
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 440
    .line 441
    .line 442
    move-result-object p1

    .line 443
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

    .line 444
    .line 445
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

    .line 446
    .line 447
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 448
    .line 449
    .line 450
    move-result p1

    .line 451
    xor-int/2addr p1, v2

    .line 452
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

    .line 453
    .line 454
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

    .line 455
    .line 456
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 457
    .line 458
    .line 459
    move-result v1

    .line 460
    xor-int/2addr v1, v2

    .line 461
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

    .line 462
    .line 463
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 464
    .line 465
    .line 466
    move-result-object p1

    .line 467
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

    .line 468
    .line 469
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

    .line 470
    .line 471
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 472
    .line 473
    .line 474
    move-result p1

    .line 475
    xor-int/2addr p1, v2

    .line 476
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

    .line 477
    .line 478
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

    .line 479
    .line 480
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 481
    .line 482
    .line 483
    move-result v1

    .line 484
    xor-int/2addr v1, v2

    .line 485
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

    .line 486
    .line 487
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 488
    .line 489
    .line 490
    move-result-object p1

    .line 491
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

    .line 492
    .line 493
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

    .line 494
    .line 495
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 496
    .line 497
    .line 498
    move-result p1

    .line 499
    xor-int/2addr p1, v2

    .line 500
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

    .line 501
    .line 502
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

    .line 503
    .line 504
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 505
    .line 506
    .line 507
    move-result v1

    .line 508
    xor-int/2addr v1, v2

    .line 509
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

    .line 510
    .line 511
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object p1

    .line 515
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

    .line 516
    .line 517
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

    .line 518
    .line 519
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 520
    .line 521
    .line 522
    move-result p1

    .line 523
    xor-int/2addr p1, v2

    .line 524
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

    .line 525
    .line 526
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

    .line 527
    .line 528
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 529
    .line 530
    .line 531
    move-result v1

    .line 532
    xor-int/2addr v1, v2

    .line 533
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

    .line 534
    .line 535
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 536
    .line 537
    .line 538
    move-result-object p1

    .line 539
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

    .line 540
    .line 541
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

    .line 542
    .line 543
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 544
    .line 545
    .line 546
    move-result p1

    .line 547
    xor-int/2addr p1, v2

    .line 548
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

    .line 549
    .line 550
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

    .line 551
    .line 552
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 553
    .line 554
    .line 555
    move-result v1

    .line 556
    xor-int/2addr v1, v2

    .line 557
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

    .line 558
    .line 559
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 560
    .line 561
    .line 562
    move-result-object p1

    .line 563
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

    .line 564
    .line 565
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->birthday_:J

    .line 566
    .line 567
    const-wide/16 p1, 0x0

    .line 568
    .line 569
    cmp-long v1, v5, p1

    .line 570
    .line 571
    if-eqz v1, :cond_4

    .line 572
    .line 573
    move v4, v2

    .line 574
    goto :goto_6

    .line 575
    :cond_4
    move v4, v0

    .line 576
    :goto_6
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->birthday_:J

    .line 577
    .line 578
    cmp-long p1, v8, p1

    .line 579
    .line 580
    if-eqz p1, :cond_5

    .line 581
    .line 582
    move v7, v2

    .line 583
    goto :goto_7

    .line 584
    :cond_5
    move v7, v0

    .line 585
    :goto_7
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 586
    .line 587
    .line 588
    move-result-wide p1

    .line 589
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->birthday_:J

    .line 590
    .line 591
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

    .line 592
    .line 593
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 594
    .line 595
    .line 596
    move-result p1

    .line 597
    xor-int/2addr p1, v2

    .line 598
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

    .line 599
    .line 600
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

    .line 601
    .line 602
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 603
    .line 604
    .line 605
    move-result v0

    .line 606
    xor-int/2addr v0, v2

    .line 607
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

    .line 608
    .line 609
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 610
    .line 611
    .line 612
    move-result-object p1

    .line 613
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

    .line 614
    .line 615
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 616
    .line 617
    return-object p0

    .line 618
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall$Builder;

    .line 619
    .line 620
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall$Builder;-><init>(Ll/v2w;)V

    .line 621
    .line 622
    .line 623
    return-object p0

    .line 624
    :pswitch_5
    return-object v1

    .line 625
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 626
    .line 627
    return-object p0

    .line 628
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;

    .line 629
    .line 630
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;-><init>()V

    .line 631
    .line 632
    .line 633
    return-object p0

    .line 634
    nop

    .line 635
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

    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_10
        0x12 -> :sswitch_f
        0x1a -> :sswitch_e
        0x22 -> :sswitch_d
        0x2a -> :sswitch_c
        0x32 -> :sswitch_b
        0x3a -> :sswitch_a
        0x42 -> :sswitch_9
        0x4a -> :sswitch_8
        0x52 -> :sswitch_7
        0x5a -> :sswitch_6
        0x62 -> :sswitch_5
        0x6a -> :sswitch_4
        0x72 -> :sswitch_3
        0x78 -> :sswitch_2
        0x82 -> :sswitch_1
    .end sparse-switch
.end method

.method public getAge()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAgeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

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

.method public getAuth()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAuthBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

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

.method public getBirthday()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->birthday_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getBroadcastID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBroadcastIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

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

.method public getGender()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGenderBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

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

.method public getOpeningRemark()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOpeningRemarkBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

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

.method public getOtherUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;

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

.method public getPoolID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPoolIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

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

.method public getQueryToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getQueryTokenBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

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

.method public getSerializedSize()I
    .locals 5

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getOtherUserId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getAuth()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getUrl()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-nez v1, :cond_4

    .line 69
    .line 70
    const/4 v1, 0x4

    .line 71
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getGender()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    add-int/2addr v0, v1

    .line 80
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getName()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

    .line 99
    .line 100
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 101
    .line 102
    .line 103
    move-result v1

    .line 104
    if-nez v1, :cond_6

    .line 105
    .line 106
    const/4 v1, 0x6

    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getAge()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    add-int/2addr v0, v1

    .line 116
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-nez v1, :cond_7

    .line 123
    .line 124
    const/4 v1, 0x7

    .line 125
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTag1()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    add-int/2addr v0, v1

    .line 134
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    if-nez v1, :cond_8

    .line 141
    .line 142
    const/16 v1, 0x8

    .line 143
    .line 144
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTag2()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    add-int/2addr v0, v1

    .line 153
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-nez v1, :cond_9

    .line 160
    .line 161
    const/16 v1, 0x9

    .line 162
    .line 163
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTag3()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 168
    .line 169
    .line 170
    move-result v1

    .line 171
    add-int/2addr v0, v1

    .line 172
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    if-nez v1, :cond_a

    .line 179
    .line 180
    const/16 v1, 0xa

    .line 181
    .line 182
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getQueryToken()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 187
    .line 188
    .line 189
    move-result v1

    .line 190
    add-int/2addr v0, v1

    .line 191
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    if-nez v1, :cond_b

    .line 198
    .line 199
    const/16 v1, 0xb

    .line 200
    .line 201
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTopic()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v2

    .line 205
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    add-int/2addr v0, v1

    .line 210
    :cond_b
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

    .line 211
    .line 212
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    if-nez v1, :cond_c

    .line 217
    .line 218
    const/16 v1, 0xc

    .line 219
    .line 220
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getSessionID()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v2

    .line 224
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    add-int/2addr v0, v1

    .line 229
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

    .line 230
    .line 231
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    if-nez v1, :cond_d

    .line 236
    .line 237
    const/16 v1, 0xd

    .line 238
    .line 239
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getOpeningRemark()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v2

    .line 243
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    add-int/2addr v0, v1

    .line 248
    :cond_d
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

    .line 249
    .line 250
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 251
    .line 252
    .line 253
    move-result v1

    .line 254
    if-nez v1, :cond_e

    .line 255
    .line 256
    const/16 v1, 0xe

    .line 257
    .line 258
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getPoolID()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 263
    .line 264
    .line 265
    move-result v1

    .line 266
    add-int/2addr v0, v1

    .line 267
    :cond_e
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->birthday_:J

    .line 268
    .line 269
    const-wide/16 v3, 0x0

    .line 270
    .line 271
    cmp-long v3, v1, v3

    .line 272
    .line 273
    if-eqz v3, :cond_f

    .line 274
    .line 275
    const/16 v3, 0xf

    .line 276
    .line 277
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    add-int/2addr v0, v1

    .line 282
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

    .line 283
    .line 284
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 285
    .line 286
    .line 287
    move-result v1

    .line 288
    if-nez v1, :cond_10

    .line 289
    .line 290
    const/16 v1, 0x10

    .line 291
    .line 292
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getBroadcastID()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v2

    .line 296
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 297
    .line 298
    .line 299
    move-result v1

    .line 300
    add-int/2addr v0, v1

    .line 301
    :cond_10
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 302
    .line 303
    return v0
.end method

.method public getSessionID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSessionIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

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

.method public getTag1()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTag1Bytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

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

.method public getTag2()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTag2Bytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

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

.method public getTag3()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTag3Bytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

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

.method public getTopic()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTopicBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

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

.method public getUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

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

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->otherUserId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getOtherUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->auth_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getAuth()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->url_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getUrl()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->gender_:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_3

    .line 56
    .line 57
    const/4 v0, 0x4

    .line 58
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getGender()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->name_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->age_:Ljava/lang/String;

    .line 82
    .line 83
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-nez v0, :cond_5

    .line 88
    .line 89
    const/4 v0, 0x6

    .line 90
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getAge()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag1_:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_6

    .line 104
    .line 105
    const/4 v0, 0x7

    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTag1()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 111
    .line 112
    .line 113
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag2_:Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_7

    .line 120
    .line 121
    const/16 v0, 0x8

    .line 122
    .line 123
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTag2()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->tag3_:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-nez v0, :cond_8

    .line 137
    .line 138
    const/16 v0, 0x9

    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTag3()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 145
    .line 146
    .line 147
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->queryToken_:Ljava/lang/String;

    .line 148
    .line 149
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    if-nez v0, :cond_9

    .line 154
    .line 155
    const/16 v0, 0xa

    .line 156
    .line 157
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getQueryToken()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->topic_:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-nez v0, :cond_a

    .line 171
    .line 172
    const/16 v0, 0xb

    .line 173
    .line 174
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getTopic()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 179
    .line 180
    .line 181
    :cond_a
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->sessionID_:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-nez v0, :cond_b

    .line 188
    .line 189
    const/16 v0, 0xc

    .line 190
    .line 191
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getSessionID()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 196
    .line 197
    .line 198
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->openingRemark_:Ljava/lang/String;

    .line 199
    .line 200
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    if-nez v0, :cond_c

    .line 205
    .line 206
    const/16 v0, 0xd

    .line 207
    .line 208
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getOpeningRemark()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 213
    .line 214
    .line 215
    :cond_c
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->poolID_:Ljava/lang/String;

    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    if-nez v0, :cond_d

    .line 222
    .line 223
    const/16 v0, 0xe

    .line 224
    .line 225
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getPoolID()Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 230
    .line 231
    .line 232
    :cond_d
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->birthday_:J

    .line 233
    .line 234
    const-wide/16 v2, 0x0

    .line 235
    .line 236
    cmp-long v2, v0, v2

    .line 237
    .line 238
    if-eqz v2, :cond_e

    .line 239
    .line 240
    const/16 v2, 0xf

    .line 241
    .line 242
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 243
    .line 244
    .line 245
    :cond_e
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->broadcastID_:Ljava/lang/String;

    .line 246
    .line 247
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    if-nez v0, :cond_f

    .line 252
    .line 253
    const/16 v0, 0x10

    .line 254
    .line 255
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/connector/LongLinkLiveChatMessage$LiveChatRecall;->getBroadcastID()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 260
    .line 261
    .line 262
    :cond_f
    return-void
.end method
