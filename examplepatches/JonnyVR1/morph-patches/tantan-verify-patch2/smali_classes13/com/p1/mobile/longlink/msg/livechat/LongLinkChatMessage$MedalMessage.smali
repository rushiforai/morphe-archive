.class public final Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "MedalMessage"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessageOrBuilder;"
    }
.end annotation


# static fields
.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

.field public static final IDS_FIELD_NUMBER:I = 0x1

.field public static final MULTIROOMMEDALS_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;",
            ">;"
        }
    .end annotation
.end field

.field public static final SINGLEROOMMEDALS_FIELD_NUMBER:I = 0x3

.field public static final VERSION_FIELD_NUMBER:I = 0x2


# instance fields
.field private bitField0_:I

.field private ids_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private multiRoomMedals_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ">;"
        }
    .end annotation
.end field

.field private singleRoomMedals_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ">;"
        }
    .end annotation
.end field

.field private version_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

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
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 19
    .line 20
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 25
    .line 26
    return-void
.end method

.method public static bridge synthetic A()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->addAllIds(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllIds(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureIdsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addAllMultiRoomMedals(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureMultiRoomMedalsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addAllSingleRoomMedals(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureSingleRoomMedalsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addIds(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureIdsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private addIdsBytes(Lcom/google/protobuf/ByteString;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureIdsIsMutable()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/protobuf/ByteString;->toStringUtf8()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private addMultiRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureMultiRoomMedalsIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addMultiRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureMultiRoomMedalsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addMultiRoomMedals(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureMultiRoomMedalsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addMultiRoomMedals(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureMultiRoomMedalsIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private addSingleRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureSingleRoomMedalsIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addSingleRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureSingleRoomMedalsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addSingleRoomMedals(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureSingleRoomMedalsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addSingleRoomMedals(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureSingleRoomMedalsIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->addAllMultiRoomMedals(Ljava/lang/Iterable;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->addAllSingleRoomMedals(Ljava/lang/Iterable;)V

    return-void
.end method

.method private clearIds()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearMultiRoomMedals()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearSingleRoomMedals()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearVersion()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getVersion()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->addIds(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->addIdsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private ensureIdsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private ensureMultiRoomMedalsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private ensureSingleRoomMedalsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {v0}, Lcom/google/protobuf/l$h;->q()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->addMultiRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->addMultiRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->addMultiRoomMedals(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->addMultiRoomMedals(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->addSingleRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->addSingleRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->addSingleRoomMedals(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->addSingleRoomMedals(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->clearIds()V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->clearMultiRoomMedals()V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->clearSingleRoomMedals()V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->clearVersion()V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->removeMultiRoomMedals(I)V

    return-void
.end method

.method private removeMultiRoomMedals(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureMultiRoomMedalsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private removeSingleRoomMedals(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureSingleRoomMedalsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->removeSingleRoomMedals(I)V

    return-void
.end method

.method private setIds(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureIdsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private setMultiRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureMultiRoomMedalsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setMultiRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureMultiRoomMedalsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setSingleRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureSingleRoomMedalsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setSingleRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ensureSingleRoomMedalsIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setVersion(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setVersionBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->setIds(ILjava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->setMultiRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->setMultiRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->setSingleRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal$Builder;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->setSingleRoomMedals(ILcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->setVersion(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->setVersionBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    const/4 v0, 0x0

    .line 10
    const/4 v1, 0x1

    .line 11
    packed-switch p1, :pswitch_data_0

    .line 12
    .line 13
    .line 14
    invoke-static {}, Ll/l710;->a()V

    .line 15
    .line 16
    .line 17
    return-object v0

    .line 18
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->PARSER:Ll/ng60;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    :goto_0
    monitor-exit p0

    .line 42
    goto :goto_2

    .line 43
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p1

    .line 45
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->PARSER:Ll/ng60;

    .line 46
    .line 47
    return-object p0

    .line 48
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 49
    .line 50
    check-cast p3, Lcom/google/protobuf/h;

    .line 51
    .line 52
    const/4 p1, 0x0

    .line 53
    :cond_2
    :goto_3
    if-nez p1, :cond_b

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_3

    .line 60
    .line 61
    const/16 v3, 0xa

    .line 62
    .line 63
    if-eq v2, v3, :cond_9

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v2, v3, :cond_8

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq v2, v3, :cond_6

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq v2, v3, :cond_4

    .line 76
    .line 77
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    if-nez v2, :cond_2

    .line 82
    .line 83
    :cond_3
    move p1, v1

    .line 84
    goto :goto_3

    .line 85
    :catch_0
    move-exception p1

    .line 86
    goto :goto_4

    .line 87
    :catch_1
    move-exception p1

    .line 88
    goto/16 :goto_5

    .line 89
    .line 90
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 91
    .line 92
    invoke-interface {v2}, Lcom/google/protobuf/l$h;->q()Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-nez v2, :cond_5

    .line 97
    .line 98
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 99
    .line 100
    invoke-static {v2}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 105
    .line 106
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 107
    .line 108
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->parser()Ll/ng60;

    .line 109
    .line 110
    .line 111
    move-result-object v3

    .line 112
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    check-cast v3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    .line 117
    .line 118
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    goto :goto_3

    .line 122
    :cond_6
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 123
    .line 124
    invoke-interface {v2}, Lcom/google/protobuf/l$h;->q()Z

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    if-nez v2, :cond_7

    .line 129
    .line 130
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 131
    .line 132
    invoke-static {v2}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 137
    .line 138
    :cond_7
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 139
    .line 140
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;->parser()Ll/ng60;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    check-cast v3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    .line 149
    .line 150
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 151
    .line 152
    .line 153
    goto :goto_3

    .line 154
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 166
    .line 167
    invoke-interface {v3}, Lcom/google/protobuf/l$h;->q()Z

    .line 168
    .line 169
    .line 170
    move-result v3

    .line 171
    if-nez v3, :cond_a

    .line 172
    .line 173
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 174
    .line 175
    invoke-static {v3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 180
    .line 181
    :cond_a
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 182
    .line 183
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 184
    .line 185
    .line 186
    goto/16 :goto_3

    .line 187
    .line 188
    :catchall_1
    move-exception p0

    .line 189
    throw p0

    .line 190
    :goto_4
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 191
    .line 192
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p1

    .line 196
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 204
    .line 205
    .line 206
    return-object v0

    .line 207
    :goto_5
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 212
    .line 213
    .line 214
    return-object v0

    .line 215
    :cond_b
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 216
    .line 217
    return-object p0

    .line 218
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 219
    .line 220
    check-cast p3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 221
    .line 222
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 223
    .line 224
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 225
    .line 226
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 231
    .line 232
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

    .line 233
    .line 234
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 235
    .line 236
    .line 237
    move-result p1

    .line 238
    xor-int/2addr p1, v1

    .line 239
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

    .line 240
    .line 241
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

    .line 242
    .line 243
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    xor-int/2addr v1, v2

    .line 248
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

    .line 249
    .line 250
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

    .line 255
    .line 256
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 257
    .line 258
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 259
    .line 260
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 265
    .line 266
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 267
    .line 268
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 269
    .line 270
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 271
    .line 272
    .line 273
    move-result-object p1

    .line 274
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 275
    .line 276
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 277
    .line 278
    if-ne p2, p1, :cond_c

    .line 279
    .line 280
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->bitField0_:I

    .line 281
    .line 282
    iget p2, p3, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->bitField0_:I

    .line 283
    .line 284
    or-int/2addr p1, p2

    .line 285
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->bitField0_:I

    .line 286
    .line 287
    :cond_c
    return-object p0

    .line 288
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;

    .line 289
    .line 290
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage$Builder;-><init>(Ll/c2w;)V

    .line 291
    .line 292
    .line 293
    return-object p0

    .line 294
    :pswitch_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 295
    .line 296
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->n()V

    .line 297
    .line 298
    .line 299
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 300
    .line 301
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->n()V

    .line 302
    .line 303
    .line 304
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 305
    .line 306
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 307
    .line 308
    .line 309
    return-object v0

    .line 310
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 311
    .line 312
    return-object p0

    .line 313
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;

    .line 314
    .line 315
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;-><init>()V

    .line 316
    .line 317
    .line 318
    return-object p0

    .line 319
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

.method public getIds(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    return-object p0
.end method

.method public getIdsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p0}, Lcom/google/protobuf/ByteString;->copyFromUtf8(Ljava/lang/String;)Lcom/google/protobuf/ByteString;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getIdsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getIdsList()Ljava/util/List;
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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMultiRoomMedals(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    .line 8
    .line 9
    return-object p0
.end method

.method public getMultiRoomMedalsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMultiRoomMedalsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getMultiRoomMedalsOrBuilder(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getMultiRoomMedalsOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
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
    const/4 v0, 0x0

    .line 8
    move v1, v0

    .line 9
    move v2, v1

    .line 10
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 11
    .line 12
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-ge v1, v3, :cond_1

    .line 17
    .line 18
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 19
    .line 20
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    check-cast v3, Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v3}, Lcom/google/protobuf/CodedOutputStream;->L(Ljava/lang/String;)I

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    add-int/2addr v2, v3

    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getIdsList()Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    add-int/2addr v2, v1

    .line 43
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-nez v1, :cond_2

    .line 50
    .line 51
    const/4 v1, 0x2

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getVersion()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-static {v1, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    add-int/2addr v2, v1

    .line 61
    :cond_2
    move v1, v0

    .line 62
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 63
    .line 64
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    if-ge v1, v3, :cond_3

    .line 69
    .line 70
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 71
    .line 72
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    check-cast v3, Lcom/google/protobuf/q;

    .line 77
    .line 78
    const/4 v4, 0x3

    .line 79
    invoke-static {v4, v3}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    add-int/2addr v2, v3

    .line 84
    add-int/lit8 v1, v1, 0x1

    .line 85
    .line 86
    goto :goto_1

    .line 87
    :cond_3
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 88
    .line 89
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    if-ge v0, v1, :cond_4

    .line 94
    .line 95
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 96
    .line 97
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    check-cast v1, Lcom/google/protobuf/q;

    .line 102
    .line 103
    const/4 v3, 0x4

    .line 104
    invoke-static {v3, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    add-int/2addr v2, v1

    .line 109
    add-int/lit8 v0, v0, 0x1

    .line 110
    .line 111
    goto :goto_2

    .line 112
    :cond_4
    iput v2, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 113
    .line 114
    return v2
.end method

.method public getSingleRoomMedals(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;

    .line 8
    .line 9
    return-object p0
.end method

.method public getSingleRoomMedalsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getSingleRoomMedalsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$Medal;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSingleRoomMedalsOrBuilder(I)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getSingleRoomMedalsOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersion()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVersionBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

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
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 4
    .line 5
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-ge v1, v2, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->ids_:Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Ljava/lang/String;

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    invoke-virtual {p1, v3, v2}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 21
    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->version_:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-nez v1, :cond_1

    .line 33
    .line 34
    const/4 v1, 0x2

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->getVersion()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p1, v1, v2}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    move v1, v0

    .line 43
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 44
    .line 45
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 46
    .line 47
    .line 48
    move-result v2

    .line 49
    if-ge v1, v2, :cond_2

    .line 50
    .line 51
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->singleRoomMedals_:Lcom/google/protobuf/l$h;

    .line 52
    .line 53
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    check-cast v2, Lcom/google/protobuf/q;

    .line 58
    .line 59
    const/4 v3, 0x3

    .line 60
    invoke-virtual {p1, v3, v2}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 61
    .line 62
    .line 63
    add-int/lit8 v1, v1, 0x1

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_2
    :goto_2
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 67
    .line 68
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    if-ge v0, v1, :cond_3

    .line 73
    .line 74
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$MedalMessage;->multiRoomMedals_:Lcom/google/protobuf/l$h;

    .line 75
    .line 76
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Lcom/google/protobuf/q;

    .line 81
    .line 82
    const/4 v2, 0x4

    .line 83
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 84
    .line 85
    .line 86
    add-int/lit8 v0, v0, 0x1

    .line 87
    .line 88
    goto :goto_2

    .line 89
    :cond_3
    return-void
.end method
