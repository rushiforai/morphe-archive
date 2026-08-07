.class public final Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsgOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "LivePropSendMsg"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;",
        "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsgOrBuilder;"
    }
.end annotation


# static fields
.field public static final AMOUNT_FIELD_NUMBER:I = 0x4

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

.field public static final FROMUSER_FIELD_NUMBER:I = 0x1

.field public static final ICON_FIELD_NUMBER:I = 0x5

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;",
            ">;"
        }
    .end annotation
.end field

.field public static final SVGAURL_FIELD_NUMBER:I = 0x6

.field public static final TOUSER_FIELD_NUMBER:I = 0x2

.field public static final TYPE_FIELD_NUMBER:I = 0x3


# instance fields
.field private amount_:J

.field private fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

.field private icon_:Ljava/lang/String;

.field private svgaUrl_:Ljava/lang/String;

.field private toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

.field private type_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->clearAmount()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->clearFromUser()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->clearIcon()V

    return-void
.end method

.method private clearAmount()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    iput-wide v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->amount_:J

    .line 4
    .line 5
    return-void
.end method

.method private clearFromUser()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 3
    .line 4
    return-void
.end method

.method private clearIcon()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearSvgaUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getSvgaUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearToUser()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 3
    .line 4
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->type_:I

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->clearSvgaUrl()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->clearToUser()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->clearType()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->mergeFromUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->mergeToUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->setAmount(J)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->setFromUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->setFromUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->setIcon(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->setIconBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private mergeFromUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;->newBuilder(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 33
    .line 34
    return-void
.end method

.method private mergeToUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;->newBuilder(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->setSvgaUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->setSvgaUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->setToUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->setToUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->setType(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->setTypeValue(I)V

    return-void
.end method

.method private setAmount(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->amount_:J

    .line 2
    .line 3
    return-void
.end method

.method private setFromUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 8
    .line 9
    return-void
.end method

.method private setFromUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    return-void
.end method

.method private setIcon(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setIconBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setSvgaUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setSvgaUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setToUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 8
    .line 9
    return-void
.end method

.method private setToUser(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    return-void
.end method

.method private setType(Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->type_:I

    .line 9
    .line 10
    return-void
.end method

.method private setTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->type_:I

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 10

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_c

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
    const/16 v3, 0xa

    .line 63
    .line 64
    if-eq p1, v3, :cond_a

    .line 65
    .line 66
    const/16 v3, 0x12

    .line 67
    .line 68
    if-eq p1, v3, :cond_8

    .line 69
    .line 70
    const/16 v3, 0x18

    .line 71
    .line 72
    if-eq p1, v3, :cond_7

    .line 73
    .line 74
    const/16 v3, 0x20

    .line 75
    .line 76
    if-eq p1, v3, :cond_6

    .line 77
    .line 78
    const/16 v3, 0x2a

    .line 79
    .line 80
    if-eq p1, v3, :cond_5

    .line 81
    .line 82
    const/16 v3, 0x32

    .line 83
    .line 84
    if-eq p1, v3, :cond_4

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
    goto/16 :goto_6

    .line 97
    .line 98
    :catch_1
    move-exception v0

    .line 99
    move-object p1, v0

    .line 100
    goto/16 :goto_7

    .line 101
    .line 102
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

    .line 107
    .line 108
    goto :goto_3

    .line 109
    :cond_5
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

    .line 114
    .line 115
    goto :goto_3

    .line 116
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->v()J

    .line 117
    .line 118
    .line 119
    move-result-wide v3

    .line 120
    iput-wide v3, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->amount_:J

    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    iput p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->type_:I

    .line 128
    .line 129
    goto :goto_3

    .line 130
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 131
    .line 132
    if-eqz p1, :cond_9

    .line 133
    .line 134
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;

    .line 139
    .line 140
    goto :goto_4

    .line 141
    :cond_9
    move-object p1, v1

    .line 142
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;->parser()Ll/ng60;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 147
    .line 148
    .line 149
    move-result-object v3

    .line 150
    check-cast v3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 151
    .line 152
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 153
    .line 154
    if-eqz p1, :cond_2

    .line 155
    .line 156
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 164
    .line 165
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 169
    .line 170
    if-eqz p1, :cond_b

    .line 171
    .line 172
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 173
    .line 174
    .line 175
    move-result-object p1

    .line 176
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask$Builder;

    .line 177
    .line 178
    goto :goto_5

    .line 179
    :cond_b
    move-object p1, v1

    .line 180
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;->parser()Ll/ng60;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    check-cast v3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 189
    .line 190
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 191
    .line 192
    if-eqz p1, :cond_2

    .line 193
    .line 194
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 195
    .line 196
    .line 197
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 202
    .line 203
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 204
    .line 205
    goto/16 :goto_3

    .line 206
    .line 207
    :catchall_1
    move-exception v0

    .line 208
    move-object p0, v0

    .line 209
    throw p0

    .line 210
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 211
    .line 212
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 224
    .line 225
    .line 226
    return-object v1

    .line 227
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 232
    .line 233
    .line 234
    return-object v1

    .line 235
    :cond_c
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 236
    .line 237
    return-object p0

    .line 238
    :pswitch_3
    move-object v3, p2

    .line 239
    check-cast v3, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 240
    .line 241
    check-cast p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 242
    .line 243
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 244
    .line 245
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 246
    .line 247
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 252
    .line 253
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 254
    .line 255
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 256
    .line 257
    iget-object p2, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 258
    .line 259
    invoke-interface {v3, p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 260
    .line 261
    .line 262
    move-result-object p1

    .line 263
    check-cast p1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 264
    .line 265
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 266
    .line 267
    iget p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->type_:I

    .line 268
    .line 269
    if-eqz p1, :cond_d

    .line 270
    .line 271
    move p2, v2

    .line 272
    goto :goto_8

    .line 273
    :cond_d
    move p2, v0

    .line 274
    :goto_8
    iget v1, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->type_:I

    .line 275
    .line 276
    if-eqz v1, :cond_e

    .line 277
    .line 278
    move v4, v2

    .line 279
    goto :goto_9

    .line 280
    :cond_e
    move v4, v0

    .line 281
    :goto_9
    invoke-interface {v3, p2, p1, v4, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 282
    .line 283
    .line 284
    move-result p1

    .line 285
    iput p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->type_:I

    .line 286
    .line 287
    iget-wide v5, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->amount_:J

    .line 288
    .line 289
    const-wide/16 p1, 0x0

    .line 290
    .line 291
    cmp-long v1, v5, p1

    .line 292
    .line 293
    if-eqz v1, :cond_f

    .line 294
    .line 295
    move v4, v2

    .line 296
    goto :goto_a

    .line 297
    :cond_f
    move v4, v0

    .line 298
    :goto_a
    iget-wide v8, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->amount_:J

    .line 299
    .line 300
    cmp-long p1, v8, p1

    .line 301
    .line 302
    if-eqz p1, :cond_10

    .line 303
    .line 304
    move v7, v2

    .line 305
    goto :goto_b

    .line 306
    :cond_10
    move v7, v0

    .line 307
    :goto_b
    invoke-interface/range {v3 .. v9}, Lcom/google/protobuf/GeneratedMessageLite$h;->i(ZJZJ)J

    .line 308
    .line 309
    .line 310
    move-result-wide p1

    .line 311
    iput-wide p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->amount_:J

    .line 312
    .line 313
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

    .line 314
    .line 315
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 316
    .line 317
    .line 318
    move-result p1

    .line 319
    xor-int/2addr p1, v2

    .line 320
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

    .line 321
    .line 322
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

    .line 323
    .line 324
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 325
    .line 326
    .line 327
    move-result v0

    .line 328
    xor-int/2addr v0, v2

    .line 329
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

    .line 330
    .line 331
    invoke-interface {v3, p1, p2, v0, v1}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

    .line 336
    .line 337
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

    .line 338
    .line 339
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 340
    .line 341
    .line 342
    move-result p1

    .line 343
    xor-int/2addr p1, v2

    .line 344
    iget-object p2, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

    .line 345
    .line 346
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

    .line 347
    .line 348
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    xor-int/2addr v0, v2

    .line 353
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

    .line 354
    .line 355
    invoke-interface {v3, p1, p2, v0, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object p1

    .line 359
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

    .line 360
    .line 361
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 362
    .line 363
    return-object p0

    .line 364
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;

    .line 365
    .line 366
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg$Builder;-><init>(Ll/r1w;)V

    .line 367
    .line 368
    .line 369
    return-object p0

    .line 370
    :pswitch_5
    return-object v1

    .line 371
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 372
    .line 373
    return-object p0

    .line 374
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;

    .line 375
    .line 376
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;-><init>()V

    .line 377
    .line 378
    .line 379
    return-object p0

    .line 380
    nop

    .line 381
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

.method public getAmount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->amount_:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getFromUser()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getFromUser()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-static {v0, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 v0, 0x0

    .line 22
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 23
    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x2

    .line 27
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getToUser()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    add-int/2addr v0, v1

    .line 36
    :cond_2
    iget v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->type_:I

    .line 37
    .line 38
    sget-object v2, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->unknown:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;

    .line 39
    .line 40
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->getNumber()I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    if-eq v1, v2, :cond_3

    .line 45
    .line 46
    const/4 v1, 0x3

    .line 47
    iget v2, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->type_:I

    .line 48
    .line 49
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    add-int/2addr v0, v1

    .line 54
    :cond_3
    iget-wide v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->amount_:J

    .line 55
    .line 56
    const-wide/16 v3, 0x0

    .line 57
    .line 58
    cmp-long v3, v1, v3

    .line 59
    .line 60
    if-eqz v3, :cond_4

    .line 61
    .line 62
    const/4 v3, 0x4

    .line 63
    invoke-static {v3, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->v(IJ)I

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    add-int/2addr v0, v1

    .line 68
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-nez v1, :cond_5

    .line 75
    .line 76
    const/4 v1, 0x5

    .line 77
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getIcon()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    add-int/2addr v0, v1

    .line 86
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 89
    .line 90
    .line 91
    move-result v1

    .line 92
    if-nez v1, :cond_6

    .line 93
    .line 94
    const/4 v1, 0x6

    .line 95
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getSvgaUrl()Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    add-int/2addr v0, v1

    .line 104
    :cond_6
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 105
    .line 106
    return v0
.end method

.method public getSvgaUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSvgaUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

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

.method public getToUser()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getType()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->type_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->forNumber(I)Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->type_:I

    .line 2
    .line 3
    return p0
.end method

.method public hasFromUser()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

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

.method public hasToUser()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

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
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->fromUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getFromUser()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->toUser_:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getToUser()Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$UserMask;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->type_:I

    .line 26
    .line 27
    sget-object v1, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->unknown:Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;

    .line 28
    .line 29
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropType;->getNumber()I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eq v0, v1, :cond_2

    .line 34
    .line 35
    const/4 v0, 0x3

    .line 36
    iget v1, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->type_:I

    .line 37
    .line 38
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 39
    .line 40
    .line 41
    :cond_2
    iget-wide v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->amount_:J

    .line 42
    .line 43
    const-wide/16 v2, 0x0

    .line 44
    .line 45
    cmp-long v2, v0, v2

    .line 46
    .line 47
    if-eqz v2, :cond_3

    .line 48
    .line 49
    const/4 v2, 0x4

    .line 50
    invoke-virtual {p1, v2, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->u0(IJ)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->icon_:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    if-nez v0, :cond_4

    .line 60
    .line 61
    const/4 v0, 0x5

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getIcon()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->svgaUrl_:Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    if-nez v0, :cond_5

    .line 76
    .line 77
    const/4 v0, 0x6

    .line 78
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/live/prop/LongLinkAdminMessage$LivePropSendMsg;->getSvgaUrl()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :cond_5
    return-void
.end method
