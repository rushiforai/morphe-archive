.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfoOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UserInfo"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfoOrBuilder;"
    }
.end annotation


# static fields
.field public static final AGE_FIELD_NUMBER:I = 0x6

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

.field public static final GENDER_FIELD_NUMBER:I = 0x5

.field public static final GRADE_FIELD_NUMBER:I = 0x3

.field public static final IDENTITY_FIELD_NUMBER:I = 0x4

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final NAME_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private age_:J

.field private gender_:Ljava/lang/String;

.field private grade_:Ljava/lang/String;

.field private id_:Ljava/lang/String;

.field private identity_:Ljava/lang/String;

.field private name_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->clearAge()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->clearGender()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->clearGrade()V

    return-void
.end method

.method private clearAge()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->age_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearGender()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getGender()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearGrade()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getGrade()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIdentity()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getIdentity()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->clearId()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->clearIdentity()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->clearName()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->setAge(J)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->setGender(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->setGenderBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->setGrade(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->setGradeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->setIdentity(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->setIdentityBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->setName(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->setNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    return-object v0
.end method

.method private setAge(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->age_:J

    .line 2
    .line 3
    return-void
.end method

.method private setGender(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setGrade(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setGradeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIdentity(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIdentityBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 8

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->PARSER:Ll/ng60;

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
    const/16 p3, 0x12

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
    const/16 p3, 0x2a

    .line 79
    .line 80
    if-eq p1, p3, :cond_5

    .line 81
    .line 82
    const/16 p3, 0x30

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
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->age_:J

    .line 105
    .line 106
    goto :goto_3

    .line 107
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;
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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 171
    .line 172
    return-object p0

    .line 173
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 174
    .line 175
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 176
    .line 177
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;

    .line 178
    .line 179
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    xor-int/2addr p1, v2

    .line 184
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;

    .line 185
    .line 186
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;

    .line 187
    .line 188
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 189
    .line 190
    .line 191
    move-result v3

    .line 192
    xor-int/2addr v3, v2

    .line 193
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;

    .line 194
    .line 195
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;

    .line 200
    .line 201
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

    .line 202
    .line 203
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    xor-int/2addr p1, v2

    .line 208
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

    .line 209
    .line 210
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

    .line 211
    .line 212
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 213
    .line 214
    .line 215
    move-result v3

    .line 216
    xor-int/2addr v3, v2

    .line 217
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

    .line 218
    .line 219
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

    .line 224
    .line 225
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

    .line 226
    .line 227
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 228
    .line 229
    .line 230
    move-result p1

    .line 231
    xor-int/2addr p1, v2

    .line 232
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

    .line 233
    .line 234
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

    .line 235
    .line 236
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    xor-int/2addr v3, v2

    .line 241
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

    .line 242
    .line 243
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

    .line 248
    .line 249
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

    .line 250
    .line 251
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 252
    .line 253
    .line 254
    move-result p1

    .line 255
    xor-int/2addr p1, v2

    .line 256
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

    .line 257
    .line 258
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

    .line 259
    .line 260
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 261
    .line 262
    .line 263
    move-result v3

    .line 264
    xor-int/2addr v3, v2

    .line 265
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

    .line 266
    .line 267
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

    .line 272
    .line 273
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

    .line 274
    .line 275
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 276
    .line 277
    .line 278
    move-result p1

    .line 279
    xor-int/2addr p1, v2

    .line 280
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

    .line 281
    .line 282
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

    .line 283
    .line 284
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 285
    .line 286
    .line 287
    move-result v3

    .line 288
    xor-int/2addr v3, v2

    .line 289
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

    .line 290
    .line 291
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object p1

    .line 295
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

    .line 296
    .line 297
    move p1, v2

    .line 298
    iget-wide v2, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->age_:J

    .line 299
    .line 300
    const-wide/16 v4, 0x0

    .line 301
    .line 302
    cmp-long v1, v2, v4

    .line 303
    .line 304
    if-eqz v1, :cond_b

    .line 305
    .line 306
    move v1, p1

    .line 307
    goto :goto_6

    .line 308
    :cond_b
    move v1, v0

    .line 309
    :goto_6
    iget-wide v6, p3, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->age_:J

    .line 310
    .line 311
    cmp-long p3, v6, v4

    .line 312
    .line 313
    if-eqz p3, :cond_c

    .line 314
    .line 315
    move v4, p1

    .line 316
    move-object v0, p2

    .line 317
    move-wide v5, v6

    .line 318
    goto :goto_7

    .line 319
    :cond_c
    move v4, v0

    .line 320
    move-wide v5, v6

    .line 321
    move-object v0, p2

    .line 322
    :goto_7
    invoke-interface/range {v0 .. v6}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 323
    .line 324
    .line 325
    move-result-wide p1

    .line 326
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->age_:J

    .line 327
    .line 328
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 329
    .line 330
    return-object p0

    .line 331
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;

    .line 332
    .line 333
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo$Builder;-><init>(Ll/c3w;)V

    .line 334
    .line 335
    .line 336
    return-object p0

    .line 337
    :pswitch_5
    return-object v1

    .line 338
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 339
    .line 340
    return-object p0

    .line 341
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 342
    .line 343
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;-><init>()V

    .line 344
    .line 345
    .line 346
    return-object p0

    .line 347
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

.method public getAge()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->age_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getGender()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGenderBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

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

.method public getGrade()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGradeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;

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

.method public getIdentity()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdentityBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getName()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getGrade()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getIdentity()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getGender()Ljava/lang/String;

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
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->age_:J

    .line 99
    .line 100
    const-wide/16 v3, 0x0

    .line 101
    .line 102
    cmp-long v3, v1, v3

    .line 103
    .line 104
    if-eqz v3, :cond_6

    .line 105
    .line 106
    const/4 v3, 0x6

    .line 107
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->name_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->grade_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getGrade()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->identity_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getIdentity()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->gender_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getGender()Ljava/lang/String;

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
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->age_:J

    .line 82
    .line 83
    const-wide/16 v2, 0x0

    .line 84
    .line 85
    cmp-long p0, v0, v2

    .line 86
    .line 87
    if-eqz p0, :cond_5

    .line 88
    .line 89
    const/4 p0, 0x6

    .line 90
    invoke-virtual {p1, p0, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 91
    .line 92
    .line 93
    :cond_5
    return-void
.end method
