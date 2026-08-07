.class public final Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RoomTopEffect"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;",
        "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

.field public static final DURATION_FIELD_NUMBER:I = 0x9

.field public static final GRADE_FIELD_NUMBER:I = 0x7

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;",
            ">;"
        }
    .end annotation
.end field

.field public static final SUPERGRADE_FIELD_NUMBER:I = 0x8

.field public static final SVGURL_FIELD_NUMBER:I = 0x2

.field public static final TAG_FIELD_NUMBER:I = 0x3

.field public static final TYPE_FIELD_NUMBER:I = 0x1

.field public static final USERID_FIELD_NUMBER:I = 0x4

.field public static final USERIMAGEURL_FIELD_NUMBER:I = 0x6

.field public static final USERNAME_FIELD_NUMBER:I = 0x5


# instance fields
.field private duration_:J

.field private grade_:J

.field private superGrade_:J

.field private svgUrl_:Ljava/lang/String;

.field private tag_:Ljava/lang/String;

.field private type_:I

.field private userId_:Ljava/lang/String;

.field private userImageUrl_:Ljava/lang/String;

.field private userName_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->clearDuration()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->clearGrade()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->clearSuperGrade()V

    return-void
.end method

.method private clearDuration()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->duration_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearGrade()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->grade_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearSuperGrade()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->superGrade_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearSvgUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getSvgUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearTag()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getTag()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->type_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserImageUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getUserImageUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getUserName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->clearSvgUrl()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->clearTag()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->clearType()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->clearUserId()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->clearUserImageUrl()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->clearUserName()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setDuration(J)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setGrade(J)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setSuperGrade(J)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setSvgUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setSvgUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setTag(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setTagBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setType(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method private setDuration(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->duration_:J

    .line 2
    .line 3
    return-void
.end method

.method private setGrade(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->grade_:J

    .line 2
    .line 3
    return-void
.end method

.method private setSuperGrade(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->superGrade_:J

    .line 2
    .line 3
    return-void
.end method

.method private setSvgUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSvgUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setTag(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setTagBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setType(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->type_:I

    .line 9
    .line 10
    return-void
.end method

.method private setTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->type_:I

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserImageUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserImageUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setUserNameBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setUserImageUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setUserImageUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setUserName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->setUserNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic y()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_d

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
    const/16 p3, 0x8

    .line 63
    .line 64
    if-eq p1, p3, :cond_c

    .line 65
    .line 66
    const/16 p3, 0x12

    .line 67
    .line 68
    if-eq p1, p3, :cond_b

    .line 69
    .line 70
    const/16 p3, 0x1a

    .line 71
    .line 72
    if-eq p1, p3, :cond_a

    .line 73
    .line 74
    const/16 p3, 0x22

    .line 75
    .line 76
    if-eq p1, p3, :cond_9

    .line 77
    .line 78
    const/16 p3, 0x2a

    .line 79
    .line 80
    if-eq p1, p3, :cond_8

    .line 81
    .line 82
    const/16 p3, 0x32

    .line 83
    .line 84
    if-eq p1, p3, :cond_7

    .line 85
    .line 86
    const/16 p3, 0x38

    .line 87
    .line 88
    if-eq p1, p3, :cond_6

    .line 89
    .line 90
    const/16 p3, 0x40

    .line 91
    .line 92
    if-eq p1, p3, :cond_5

    .line 93
    .line 94
    const/16 p3, 0x48

    .line 95
    .line 96
    if-eq p1, p3, :cond_4

    .line 97
    .line 98
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_2

    .line 103
    .line 104
    :cond_3
    move v0, v2

    .line 105
    goto :goto_3

    .line 106
    :catch_0
    move-exception v0

    .line 107
    move-object p1, v0

    .line 108
    goto :goto_4

    .line 109
    :catch_1
    move-exception v0

    .line 110
    move-object p1, v0

    .line 111
    goto :goto_5

    .line 112
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 113
    .line 114
    .line 115
    move-result-wide v3

    .line 116
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->duration_:J

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 120
    .line 121
    .line 122
    move-result-wide v3

    .line 123
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->superGrade_:J

    .line 124
    .line 125
    goto :goto_3

    .line 126
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 127
    .line 128
    .line 129
    move-result-wide v3

    .line 130
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->grade_:J

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

    .line 138
    .line 139
    goto :goto_3

    .line 140
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 169
    .line 170
    .line 171
    move-result p1

    .line 172
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->type_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 173
    .line 174
    goto :goto_3

    .line 175
    :catchall_1
    move-exception v0

    .line 176
    move-object p0, v0

    .line 177
    throw p0

    .line 178
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 179
    .line 180
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 192
    .line 193
    .line 194
    return-object v1

    .line 195
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 200
    .line 201
    .line 202
    return-object v1

    .line 203
    :cond_d
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 204
    .line 205
    return-object p0

    .line 206
    :pswitch_3
    move-object v3, p2

    .line 207
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 208
    .line 209
    check-cast p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 210
    .line 211
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->type_:I

    .line 212
    .line 213
    if-eqz p1, :cond_e

    .line 214
    .line 215
    move p2, v2

    .line 216
    goto :goto_6

    .line 217
    :cond_e
    move p2, v0

    .line 218
    :goto_6
    iget v1, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->type_:I

    .line 219
    .line 220
    if-eqz v1, :cond_f

    .line 221
    .line 222
    move v4, v2

    .line 223
    goto :goto_7

    .line 224
    :cond_f
    move v4, v0

    .line 225
    :goto_7
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 226
    .line 227
    .line 228
    move-result p1

    .line 229
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->type_:I

    .line 230
    .line 231
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

    .line 232
    .line 233
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    xor-int/2addr p1, v2

    .line 238
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

    .line 239
    .line 240
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

    .line 241
    .line 242
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    xor-int/2addr v1, v2

    .line 247
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

    .line 248
    .line 249
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

    .line 254
    .line 255
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

    .line 256
    .line 257
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 258
    .line 259
    .line 260
    move-result p1

    .line 261
    xor-int/2addr p1, v2

    .line 262
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

    .line 263
    .line 264
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

    .line 265
    .line 266
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 267
    .line 268
    .line 269
    move-result v1

    .line 270
    xor-int/2addr v1, v2

    .line 271
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

    .line 272
    .line 273
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

    .line 278
    .line 279
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

    .line 280
    .line 281
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    xor-int/2addr p1, v2

    .line 286
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

    .line 287
    .line 288
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

    .line 289
    .line 290
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    xor-int/2addr v1, v2

    .line 295
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

    .line 296
    .line 297
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object p1

    .line 301
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

    .line 302
    .line 303
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

    .line 304
    .line 305
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 306
    .line 307
    .line 308
    move-result p1

    .line 309
    xor-int/2addr p1, v2

    .line 310
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

    .line 311
    .line 312
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

    .line 313
    .line 314
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 315
    .line 316
    .line 317
    move-result v1

    .line 318
    xor-int/2addr v1, v2

    .line 319
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

    .line 320
    .line 321
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p1

    .line 325
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

    .line 326
    .line 327
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

    .line 328
    .line 329
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 330
    .line 331
    .line 332
    move-result p1

    .line 333
    xor-int/2addr p1, v2

    .line 334
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

    .line 335
    .line 336
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

    .line 337
    .line 338
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 339
    .line 340
    .line 341
    move-result v1

    .line 342
    xor-int/2addr v1, v2

    .line 343
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

    .line 344
    .line 345
    invoke-interface {v3, p1, p2, v1, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object p1

    .line 349
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

    .line 350
    .line 351
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->grade_:J

    .line 352
    .line 353
    const-wide/16 p1, 0x0

    .line 354
    .line 355
    cmp-long v1, v5, p1

    .line 356
    .line 357
    if-eqz v1, :cond_10

    .line 358
    .line 359
    move v4, v2

    .line 360
    goto :goto_8

    .line 361
    :cond_10
    move v4, v0

    .line 362
    :goto_8
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->grade_:J

    .line 363
    .line 364
    cmp-long v1, v8, p1

    .line 365
    .line 366
    if-eqz v1, :cond_11

    .line 367
    .line 368
    move v7, v2

    .line 369
    goto :goto_9

    .line 370
    :cond_11
    move v7, v0

    .line 371
    :goto_9
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 372
    .line 373
    .line 374
    move-result-wide v4

    .line 375
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->grade_:J

    .line 376
    .line 377
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->superGrade_:J

    .line 378
    .line 379
    cmp-long v1, v5, p1

    .line 380
    .line 381
    if-eqz v1, :cond_12

    .line 382
    .line 383
    move v4, v2

    .line 384
    goto :goto_a

    .line 385
    :cond_12
    move v4, v0

    .line 386
    :goto_a
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->superGrade_:J

    .line 387
    .line 388
    cmp-long v1, v8, p1

    .line 389
    .line 390
    if-eqz v1, :cond_13

    .line 391
    .line 392
    move v7, v2

    .line 393
    goto :goto_b

    .line 394
    :cond_13
    move v7, v0

    .line 395
    :goto_b
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 396
    .line 397
    .line 398
    move-result-wide v4

    .line 399
    iput-wide v4, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->superGrade_:J

    .line 400
    .line 401
    move v1, v0

    .line 402
    move v4, v2

    .line 403
    move-object v0, v3

    .line 404
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->duration_:J

    .line 405
    .line 406
    cmp-long v5, v2, p1

    .line 407
    .line 408
    if-eqz v5, :cond_14

    .line 409
    .line 410
    move v5, v1

    .line 411
    move v1, v4

    .line 412
    goto :goto_c

    .line 413
    :cond_14
    move v5, v1

    .line 414
    :goto_c
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->duration_:J

    .line 415
    .line 416
    cmp-long p1, v6, p1

    .line 417
    .line 418
    if-eqz p1, :cond_15

    .line 419
    .line 420
    :goto_d
    move-wide v5, v6

    .line 421
    goto :goto_e

    .line 422
    :cond_15
    move v4, v5

    .line 423
    goto :goto_d

    .line 424
    :goto_e
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 425
    .line 426
    .line 427
    move-result-wide p1

    .line 428
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->duration_:J

    .line 429
    .line 430
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 431
    .line 432
    return-object p0

    .line 433
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect$Builder;

    .line 434
    .line 435
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect$Builder;-><init>(Ll/h3w;)V

    .line 436
    .line 437
    .line 438
    return-object p0

    .line 439
    :pswitch_5
    return-object v1

    .line 440
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 441
    .line 442
    return-object p0

    .line 443
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;

    .line 444
    .line 445
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;-><init>()V

    .line 446
    .line 447
    .line 448
    return-object p0

    .line 449
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

.method public getDuration()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->duration_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getGrade()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->grade_:J

    .line 2
    .line 3
    return-wide v0
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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->type_:I

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;->userWealthGradeUp:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;->getNumber()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-eq v0, v1, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    iget v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->type_:I

    .line 19
    .line 20
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getSvgUrl()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getTag()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getUserId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getUserName()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getUserImageUrl()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->grade_:J

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->superGrade_:J

    .line 131
    .line 132
    cmp-long v5, v1, v3

    .line 133
    .line 134
    if-eqz v5, :cond_8

    .line 135
    .line 136
    const/16 v5, 0x8

    .line 137
    .line 138
    invoke-static {v5, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 139
    .line 140
    .line 141
    move-result v1

    .line 142
    add-int/2addr v0, v1

    .line 143
    :cond_8
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->duration_:J

    .line 144
    .line 145
    cmp-long v3, v1, v3

    .line 146
    .line 147
    if-eqz v3, :cond_9

    .line 148
    .line 149
    const/16 v3, 0x9

    .line 150
    .line 151
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 152
    .line 153
    .line 154
    move-result v1

    .line 155
    add-int/2addr v0, v1

    .line 156
    :cond_9
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 157
    .line 158
    return v0
.end method

.method public getSuperGrade()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->superGrade_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getSvgUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSvgUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

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

.method public getTag()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTagBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

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

.method public getType()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->type_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;->forNumber(I)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->type_:I

    .line 2
    .line 3
    return p0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

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

.method public getUserImageUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserImageUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

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

.method public getUserName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

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
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->type_:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;->userWealthGradeUp:Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffectType;->getNumber()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iget v1, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->type_:I

    .line 13
    .line 14
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->svgUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getSvgUrl()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->tag_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getTag()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userName_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getUserName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->userImageUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->getUserImageUrl()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->grade_:J

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->superGrade_:J

    .line 110
    .line 111
    cmp-long v4, v0, v2

    .line 112
    .line 113
    if-eqz v4, :cond_7

    .line 114
    .line 115
    const/16 v4, 0x8

    .line 116
    .line 117
    invoke-virtual {p1, v4, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 118
    .line 119
    .line 120
    :cond_7
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$RoomTopEffect;->duration_:J

    .line 121
    .line 122
    cmp-long p0, v0, v2

    .line 123
    .line 124
    if-eqz p0, :cond_8

    .line 125
    .line 126
    const/16 p0, 0x9

    .line 127
    .line 128
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 129
    .line 130
    .line 131
    :cond_8
    return-void
.end method
