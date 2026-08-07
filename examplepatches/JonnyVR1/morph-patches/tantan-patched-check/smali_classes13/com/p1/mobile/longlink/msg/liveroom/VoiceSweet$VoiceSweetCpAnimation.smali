.class public final Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimationOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "VoiceSweetCpAnimation"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;,
        Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimationOrBuilder;"
    }
.end annotation


# static fields
.field public static final ANIMATIONURL_FIELD_NUMBER:I = 0x2

.field public static final CPUSERS_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

.field public static final HOUSEINFO_FIELD_NUMBER:I = 0x4

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;",
            ">;"
        }
    .end annotation
.end field

.field public static final TYPE_FIELD_NUMBER:I = 0x1


# instance fields
.field private animationUrl_:Ljava/lang/String;

.field private bitField0_:I

.field private cpUsers_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;",
            ">;"
        }
    .end annotation
.end field

.field private houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

.field private type_:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

    .line 7
    .line 8
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 13
    .line 14
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->addAllCpUsers(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllCpUsers(Ljava/lang/Iterable;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->ensureCpUsersIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addCpUsers(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 22
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->ensureCpUsersIsMutable()V

    .line 23
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p2

    check-cast p2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addCpUsers(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->ensureCpUsersIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    return-void
.end method

.method private addCpUsers(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->ensureCpUsersIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 11
    .line 12
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private addCpUsers(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 19
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->ensureCpUsersIsMutable()V

    .line 21
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->addCpUsers(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->addCpUsers(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method private clearAnimationUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->getAnimationUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearCpUsers()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearHouseInfo()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 3
    .line 4
    return-void
.end method

.method private clearType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->type_:I

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->addCpUsers(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->addCpUsers(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method private ensureCpUsersIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->clearAnimationUrl()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->clearCpUsers()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->clearHouseInfo()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->clearType()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->mergeHouseInfo(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->removeCpUsers(I)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->setAnimationUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->setAnimationUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private mergeHouseInfo(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;->newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->setCpUsers(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->setCpUsers(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->setHouseInfo(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo$Builder;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->setHouseInfo(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->setType(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;)V

    return-void
.end method

.method private removeCpUsers(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->ensureCpUsersIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->setTypeValue(I)V

    return-void
.end method

.method private setAnimationUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAnimationUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setCpUsers(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->ensureCpUsersIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-virtual {p2}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 7
    .line 8
    .line 9
    move-result-object p2

    .line 10
    check-cast p2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 11
    .line 12
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private setCpUsers(ILcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 16
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 17
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->ensureCpUsersIsMutable()V

    .line 18
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method private setHouseInfo(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 8
    .line 9
    return-void
.end method

.method private setHouseInfo(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    return-void
.end method

.method private setType(Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->type_:I

    .line 9
    .line 10
    return-void
.end method

.method private setTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->type_:I

    .line 2
    .line 3
    return-void
.end method

.method public static bridge synthetic t()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    const/4 v1, 0x0

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
    return-object v0

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->PARSER:Ll/ng60;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :goto_0
    monitor-exit p0

    .line 43
    goto :goto_2

    .line 44
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    throw p1

    .line 46
    :cond_1
    :goto_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->PARSER:Ll/ng60;

    .line 47
    .line 48
    return-object p0

    .line 49
    :pswitch_1
    check-cast p2, Lcom/google/protobuf/e;

    .line 50
    .line 51
    check-cast p3, Lcom/google/protobuf/h;

    .line 52
    .line 53
    :cond_2
    :goto_3
    if-nez v1, :cond_a

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_3

    .line 60
    .line 61
    const/16 v3, 0x8

    .line 62
    .line 63
    if-eq p1, v3, :cond_9

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq p1, v3, :cond_8

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq p1, v3, :cond_6

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq p1, v3, :cond_4

    .line 76
    .line 77
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-nez p1, :cond_2

    .line 82
    .line 83
    :cond_3
    move v1, v2

    .line 84
    goto :goto_3

    .line 85
    :catch_0
    move-exception p1

    .line 86
    goto :goto_5

    .line 87
    :catch_1
    move-exception p1

    .line 88
    goto :goto_6

    .line 89
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 90
    .line 91
    if-eqz p1, :cond_5

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo$Builder;

    .line 98
    .line 99
    goto :goto_4

    .line 100
    :cond_5
    move-object p1, v0

    .line 101
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;->parser()Ll/ng60;

    .line 102
    .line 103
    .line 104
    move-result-object v3

    .line 105
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 110
    .line 111
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 112
    .line 113
    if-eqz p1, :cond_2

    .line 114
    .line 115
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 123
    .line 124
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 125
    .line 126
    goto :goto_3

    .line 127
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 128
    .line 129
    invoke-interface {p1}, Lcom/google/protobuf/l$h;->q()Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-nez p1, :cond_7

    .line 134
    .line 135
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 136
    .line 137
    invoke-static {p1}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 142
    .line 143
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 144
    .line 145
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->parser()Ll/ng60;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 150
    .line 151
    .line 152
    move-result-object v3

    .line 153
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 154
    .line 155
    invoke-interface {p1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :cond_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->type_:I
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 171
    .line 172
    goto :goto_3

    .line 173
    :catchall_1
    move-exception p0

    .line 174
    throw p0

    .line 175
    :goto_5
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 176
    .line 177
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 189
    .line 190
    .line 191
    return-object v0

    .line 192
    :goto_6
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 197
    .line 198
    .line 199
    return-object v0

    .line 200
    :cond_a
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 201
    .line 202
    return-object p0

    .line 203
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 204
    .line 205
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 206
    .line 207
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->type_:I

    .line 208
    .line 209
    if-eqz p1, :cond_b

    .line 210
    .line 211
    move v0, v2

    .line 212
    goto :goto_7

    .line 213
    :cond_b
    move v0, v1

    .line 214
    :goto_7
    iget v3, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->type_:I

    .line 215
    .line 216
    if-eqz v3, :cond_c

    .line 217
    .line 218
    move v1, v2

    .line 219
    :cond_c
    invoke-interface {p2, v0, p1, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 220
    .line 221
    .line 222
    move-result p1

    .line 223
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->type_:I

    .line 224
    .line 225
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

    .line 233
    .line 234
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

    .line 235
    .line 236
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    xor-int/2addr v1, v2

    .line 241
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

    .line 242
    .line 243
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object p1

    .line 247
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

    .line 248
    .line 249
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 250
    .line 251
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 252
    .line 253
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 258
    .line 259
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 260
    .line 261
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 262
    .line 263
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 268
    .line 269
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 270
    .line 271
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 272
    .line 273
    if-ne p2, p1, :cond_d

    .line 274
    .line 275
    iget p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->bitField0_:I

    .line 276
    .line 277
    iget p2, p3, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->bitField0_:I

    .line 278
    .line 279
    or-int/2addr p1, p2

    .line 280
    iput p1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->bitField0_:I

    .line 281
    .line 282
    :cond_d
    return-object p0

    .line 283
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Builder;

    .line 284
    .line 285
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Builder;-><init>(Ll/uvo0;)V

    .line 286
    .line 287
    .line 288
    return-object p0

    .line 289
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 290
    .line 291
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 292
    .line 293
    .line 294
    return-object v0

    .line 295
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 296
    .line 297
    return-object p0

    .line 298
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;

    .line 299
    .line 300
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;-><init>()V

    .line 301
    .line 302
    .line 303
    return-object p0

    .line 304
    nop

    .line 305
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

.method public getAnimationUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAnimationUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

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

.method public getCpUsers(I)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 8
    .line 9
    return-object p0
.end method

.method public getCpUsersCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

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

.method public getCpUsersList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCpUsersOrBuilder(I)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMaskOrBuilder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMaskOrBuilder;

    .line 8
    .line 9
    return-object p0
.end method

.method public getCpUsersOrBuilderList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMaskOrBuilder;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHouseInfo()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getSerializedSize()I
    .locals 4

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->type_:I

    .line 8
    .line 9
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->upgrade:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->getNumber()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const/4 v2, 0x0

    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->type_:I

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/CodedOutputStream;->m(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v0, v2

    .line 27
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-nez v1, :cond_2

    .line 34
    .line 35
    const/4 v1, 0x2

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->getAnimationUrl()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-static {v1, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    add-int/2addr v0, v1

    .line 45
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 46
    .line 47
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-ge v2, v1, :cond_3

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 54
    .line 55
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    check-cast v1, Lcom/google/protobuf/q;

    .line 60
    .line 61
    const/4 v3, 0x3

    .line 62
    invoke-static {v3, v1}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    add-int/2addr v0, v1

    .line 67
    add-int/lit8 v2, v2, 0x1

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 71
    .line 72
    if-eqz v1, :cond_4

    .line 73
    .line 74
    const/4 v1, 0x4

    .line 75
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->getHouseInfo()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    add-int/2addr v0, v1

    .line 84
    :cond_4
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 85
    .line 86
    return v0
.end method

.method public getType()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->type_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->forNumber(I)Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->type_:I

    .line 2
    .line 3
    return p0
.end method

.method public hasHouseInfo()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

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
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->type_:I

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->upgrade:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation$Type;->getNumber()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->type_:I

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->animationUrl_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->getAnimationUrl()Ljava/lang/String;

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
    const/4 v0, 0x0

    .line 34
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 35
    .line 36
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-ge v0, v1, :cond_2

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->cpUsers_:Lcom/google/protobuf/l$h;

    .line 43
    .line 44
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    check-cast v1, Lcom/google/protobuf/q;

    .line 49
    .line 50
    const/4 v2, 0x3

    .line 51
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 52
    .line 53
    .line 54
    add-int/lit8 v0, v0, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->houseInfo_:Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 58
    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    const/4 v0, 0x4

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpAnimation;->getHouseInfo()Lcom/p1/mobile/longlink/msg/liveroom/VoiceSweet$VoiceSweetCpHouseInfo;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 67
    .line 68
    .line 69
    :cond_3
    return-void
.end method
