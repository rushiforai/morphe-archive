.class public final Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatchedOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "QuickchatMatched"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;",
        "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatchedOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

.field public static final OTHERUSERID_FIELD_NUMBER:I = 0x1

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;",
            ">;"
        }
    .end annotation
.end field

.field public static final QUERYOTHERUSERTOKEN_FIELD_NUMBER:I = 0x6

.field public static final QUICKCHATTYPE_FIELD_NUMBER:I = 0x2

.field public static final RTCCHANNELWAITTINGTIME_FIELD_NUMBER:I = 0x5

.field public static final RTCCHANNEL_FIELD_NUMBER:I = 0x4

.field public static final RTCTOKEN_FIELD_NUMBER:I = 0x3


# instance fields
.field private otherUserID_:Ljava/lang/String;

.field private queryOtherUserToken_:Ljava/lang/String;

.field private quickchatType_:I

.field private rtcChannelWaittingTime_:J

.field private rtcChannel_:Ljava/lang/String;

.field private rtcToken_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->clearOtherUserID()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->clearQueryOtherUserToken()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->clearQuickchatType()V

    return-void
.end method

.method private clearOtherUserID()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getOtherUserID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearQueryOtherUserToken()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getQueryOtherUserToken()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearQuickchatType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->quickchatType_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearRtcChannel()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getRtcChannel()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRtcChannelWaittingTime()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannelWaittingTime_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearRtcToken()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getRtcToken()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->clearRtcChannel()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->clearRtcChannelWaittingTime()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->clearRtcToken()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->setOtherUserID(Ljava/lang/String;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->setOtherUserIDBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->setQueryOtherUserToken(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->setQueryOtherUserTokenBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->setQuickchatType(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->setQuickchatTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->setRtcChannel(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->setRtcChannelBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->setRtcChannelWaittingTime(J)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->setRtcToken(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->setRtcTokenBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    return-object v0
.end method

.method private setOtherUserID(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOtherUserIDBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setQueryOtherUserToken(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setQueryOtherUserTokenBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setQuickchatType(Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->quickchatType_:I

    .line 9
    .line 10
    return-void
.end method

.method private setQuickchatTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->quickchatType_:I

    .line 2
    .line 3
    return-void
.end method

.method private setRtcChannel(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setRtcChannelBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setRtcChannelWaittingTime(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannelWaittingTime_:J

    .line 2
    .line 3
    return-void
.end method

.method private setRtcToken(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setRtcTokenBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_a

    .line 55
    .line 56
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_3

    .line 61
    .line 62
    const/16 p3, 0xa

    .line 63
    .line 64
    if-eq p1, p3, :cond_9

    .line 65
    .line 66
    const/16 p3, 0x10

    .line 67
    .line 68
    if-eq p1, p3, :cond_8

    .line 69
    .line 70
    const/16 p3, 0x1a

    .line 71
    .line 72
    if-eq p1, p3, :cond_7

    .line 73
    .line 74
    const/16 p3, 0x22

    .line 75
    .line 76
    if-eq p1, p3, :cond_6

    .line 77
    .line 78
    const/16 p3, 0x28

    .line 79
    .line 80
    if-eq p1, p3, :cond_5

    .line 81
    .line 82
    const/16 p3, 0x32

    .line 83
    .line 84
    if-eq p1, p3, :cond_4

    .line 85
    .line 86
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    if-nez p1, :cond_2

    .line 91
    .line 92
    :cond_3
    move v0, v2

    .line 93
    goto :goto_3

    .line 94
    :catch_0
    move-exception v0

    .line 95
    move-object p1, v0

    .line 96
    goto :goto_4

    .line 97
    :catch_1
    move-exception v0

    .line 98
    move-object p1, v0

    .line 99
    goto :goto_5

    .line 100
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 108
    .line 109
    .line 110
    move-result-wide v3

    .line 111
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannelWaittingTime_:J

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_3

    .line 121
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 129
    .line 130
    .line 131
    move-result p1

    .line 132
    iput p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->quickchatType_:I

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p1

    .line 139
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :catchall_1
    move-exception v0

    .line 143
    move-object p0, v0

    .line 144
    throw p0

    .line 145
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 146
    .line 147
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 159
    .line 160
    .line 161
    return-object v1

    .line 162
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 167
    .line 168
    .line 169
    return-object v1

    .line 170
    :cond_a
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 171
    .line 172
    return-object p0

    .line 173
    :pswitch_3
    move-object v3, p2

    .line 174
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 175
    .line 176
    check-cast p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 177
    .line 178
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;

    .line 179
    .line 180
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    xor-int/2addr p1, v2

    .line 185
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;

    .line 186
    .line 187
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    xor-int/2addr v1, v2

    .line 194
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;

    .line 195
    .line 196
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;

    .line 201
    .line 202
    iget p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->quickchatType_:I

    .line 203
    .line 204
    if-eqz p1, :cond_b

    .line 205
    .line 206
    move p2, v2

    .line 207
    goto :goto_6

    .line 208
    :cond_b
    move p2, v0

    .line 209
    :goto_6
    iget v1, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->quickchatType_:I

    .line 210
    .line 211
    if-eqz v1, :cond_c

    .line 212
    .line 213
    move v4, v2

    .line 214
    goto :goto_7

    .line 215
    :cond_c
    move v4, v0

    .line 216
    :goto_7
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 217
    .line 218
    .line 219
    move-result p1

    .line 220
    iput p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->quickchatType_:I

    .line 221
    .line 222
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

    .line 223
    .line 224
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 225
    .line 226
    .line 227
    move-result p1

    .line 228
    xor-int/2addr p1, v2

    .line 229
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

    .line 230
    .line 231
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

    .line 232
    .line 233
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    xor-int/2addr v1, v2

    .line 238
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

    .line 239
    .line 240
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

    .line 245
    .line 246
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

    .line 247
    .line 248
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 249
    .line 250
    .line 251
    move-result p1

    .line 252
    xor-int/2addr p1, v2

    .line 253
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

    .line 254
    .line 255
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

    .line 256
    .line 257
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    xor-int/2addr v1, v2

    .line 262
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

    .line 263
    .line 264
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

    .line 269
    .line 270
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannelWaittingTime_:J

    .line 271
    .line 272
    const-wide/16 p1, 0x0

    .line 273
    .line 274
    cmp-long v1, v5, p1

    .line 275
    .line 276
    if-eqz v1, :cond_d

    .line 277
    .line 278
    move v4, v2

    .line 279
    goto :goto_8

    .line 280
    :cond_d
    move v4, v0

    .line 281
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannelWaittingTime_:J

    .line 282
    .line 283
    cmp-long p1, v8, p1

    .line 284
    .line 285
    if-eqz p1, :cond_e

    .line 286
    .line 287
    move v7, v2

    .line 288
    goto :goto_9

    .line 289
    :cond_e
    move v7, v0

    .line 290
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 291
    .line 292
    .line 293
    move-result-wide p1

    .line 294
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannelWaittingTime_:J

    .line 295
    .line 296
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

    .line 297
    .line 298
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 299
    .line 300
    .line 301
    move-result p1

    .line 302
    xor-int/2addr p1, v2

    .line 303
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

    .line 304
    .line 305
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

    .line 306
    .line 307
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    xor-int/2addr v0, v2

    .line 312
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

    .line 313
    .line 314
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

    .line 319
    .line 320
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 321
    .line 322
    return-object p0

    .line 323
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;

    .line 324
    .line 325
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched$Builder;-><init>(Ll/i4w;)V

    .line 326
    .line 327
    .line 328
    return-object p0

    .line 329
    :pswitch_5
    return-object v1

    .line 330
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 331
    .line 332
    return-object p0

    .line 333
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;

    .line 334
    .line 335
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;-><init>()V

    .line 336
    .line 337
    .line 338
    return-object p0

    .line 339
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
.end method

.method public getOtherUserID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOtherUserIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;

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

.method public getQueryOtherUserToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getQueryOtherUserTokenBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

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

.method public getQuickchatType()Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->quickchatType_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;->forNumber(I)Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getQuickchatTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->quickchatType_:I

    .line 2
    .line 3
    return p0
.end method

.method public getRtcChannel()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRtcChannelBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

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

.method public getRtcChannelWaittingTime()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannelWaittingTime_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRtcToken()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getRtcTokenBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getOtherUserID()Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->quickchatType_:I

    .line 27
    .line 28
    sget-object v2, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;->Unknown:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;->getNumber()I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eq v1, v2, :cond_2

    .line 35
    .line 36
    const/4 v1, 0x2

    .line 37
    iget v2, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->quickchatType_:I

    .line 38
    .line 39
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    add-int/2addr v0, v1

    .line 44
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getRtcToken()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getRtcChannel()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannelWaittingTime_:J

    .line 81
    .line 82
    const-wide/16 v3, 0x0

    .line 83
    .line 84
    cmp-long v3, v1, v3

    .line 85
    .line 86
    if-eqz v3, :cond_5

    .line 87
    .line 88
    const/4 v3, 0x5

    .line 89
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    add-int/2addr v0, v1

    .line 94
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

    .line 95
    .line 96
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-nez v1, :cond_6

    .line 101
    .line 102
    const/4 v1, 0x6

    .line 103
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getQueryOtherUserToken()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    add-int/2addr v0, v1

    .line 112
    :cond_6
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 113
    .line 114
    return v0
.end method

.method public writeTo(Lcom/google/protobuf/CodedOutputStream;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->otherUserID_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getOtherUserID()Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->quickchatType_:I

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;->Unknown:Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatType;->getNumber()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eq v0, v1, :cond_1

    .line 26
    .line 27
    const/4 v0, 0x2

    .line 28
    iget v1, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->quickchatType_:I

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcToken_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getRtcToken()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannel_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getRtcChannel()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->rtcChannelWaittingTime_:J

    .line 66
    .line 67
    const-wide/16 v2, 0x0

    .line 68
    .line 69
    cmp-long v2, v0, v2

    .line 70
    .line 71
    if-eqz v2, :cond_4

    .line 72
    .line 73
    const/4 v2, 0x5

    .line 74
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 75
    .line 76
    .line 77
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->queryOtherUserToken_:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    if-nez v0, :cond_5

    .line 84
    .line 85
    const/4 v0, 0x6

    .line 86
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/LongLinkmediaquickchatmeassage$QuickchatMatched;->getQueryOtherUserToken()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_5
    return-void
.end method
