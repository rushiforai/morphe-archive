.class public final Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMaskOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "FakeUserMask"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;",
        "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMaskOrBuilder;"
    }
.end annotation


# static fields
.field public static final AVATARCONFIG_FIELD_NUMBER:I = 0x8

.field public static final AVATAR_FIELD_NUMBER:I = 0x7

.field public static final COLOR_FIELD_NUMBER:I = 0xa

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

.field public static final FAKEID_FIELD_NUMBER:I = 0x4

.field public static final FAKETYPE_FIELD_NUMBER:I = 0x2

.field public static final GENDER_FIELD_NUMBER:I = 0x6

.field public static final ICON_FIELD_NUMBER:I = 0xb

.field public static final ID_FIELD_NUMBER:I = 0x1

.field public static final ISFRESH_FIELD_NUMBER:I = 0xc

.field public static final NAME_FIELD_NUMBER:I = 0x5

.field public static final ORIGINUSERID_FIELD_NUMBER:I = 0xd

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILECONFIG_FIELD_NUMBER:I = 0x9

.field public static final USERID_FIELD_NUMBER:I = 0x3


# instance fields
.field private avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

.field private avatar_:Ljava/lang/String;

.field private color_:Ljava/lang/String;

.field private fakeId_:Ljava/lang/String;

.field private fakeType_:I

.field private gender_:Ljava/lang/String;

.field private icon_:Ljava/lang/String;

.field private id_:Ljava/lang/String;

.field private isFresh_:Z

.field private name_:Ljava/lang/String;

.field private originUserId_:Ljava/lang/String;

.field private profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

.field private userId_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

    .line 23
    .line 24
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setGenderBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setIcon(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setIconBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic D(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic E(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic F(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setIsFresh(Z)V

    return-void
.end method

.method public static bridge synthetic G(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setName(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic H(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic I(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setOriginUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic J(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setOriginUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic K(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setProfileConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;)V

    return-void
.end method

.method public static bridge synthetic L(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setProfileConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;)V

    return-void
.end method

.method public static bridge synthetic M(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic N(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic O()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->clearAvatar()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->clearAvatarConfig()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->clearColor()V

    return-void
.end method

.method private clearAvatar()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getAvatar()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAvatarConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 3
    .line 4
    return-void
.end method

.method private clearColor()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getColor()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearFakeId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getFakeId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearFakeType()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeType_:I

    .line 3
    .line 4
    return-void
.end method

.method private clearGender()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getGender()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIcon()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getIcon()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearIsFresh()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->isFresh_:Z

    .line 3
    .line 4
    return-void
.end method

.method private clearName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearOriginUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getOriginUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearProfileConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 3
    .line 4
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->clearFakeId()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->clearFakeType()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->clearGender()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->clearIcon()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->clearId()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->clearIsFresh()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->clearName()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->clearOriginUserId()V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->clearProfileConfig()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->clearUserId()V

    return-void
.end method

.method private mergeAvatarConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 33
    .line 34
    return-void
.end method

.method private mergeProfileConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->mergeAvatarConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->mergeProfileConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setAvatar(Ljava/lang/String;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setAvatarBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setAvatarConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig$Builder;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setAvatarConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;)V

    return-void
.end method

.method private setAvatar(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAvatarBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAvatarConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setAvatarConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    return-void
.end method

.method private setColor(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setColorBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setFakeId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setFakeIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setFakeType(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;->getNumber()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeType_:I

    .line 9
    .line 10
    return-void
.end method

.method private setFakeTypeValue(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeType_:I

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIcon(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setIsFresh(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->isFresh_:Z

    .line 2
    .line 3
    return-void
.end method

.method private setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setOriginUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setOriginUserIdBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setProfileConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setProfileConfig(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    return-void
.end method

.method private setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setColor(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setColorBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setFakeId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setFakeIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setFakeType(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setFakeTypeValue(I)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->setGender(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 5

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    return-object v1

    .line 19
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->PARSER:Ll/ng60;

    .line 20
    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    const-class p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 24
    .line 25
    monitor-enter p0

    .line 26
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->PARSER:Ll/ng60;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 31
    .line 32
    sget-object p2, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 33
    .line 34
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 35
    .line 36
    .line 37
    sput-object p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->PARSER:Ll/ng60;

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
    if-nez v0, :cond_5

    .line 54
    .line 55
    :try_start_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->M()I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    sparse-switch p1, :sswitch_data_0

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, p1}, Lcom/google/protobuf/e;->R(I)Z

    .line 63
    .line 64
    .line 65
    move-result p1

    .line 66
    if-nez p1, :cond_2

    .line 67
    .line 68
    :sswitch_0
    move v0, v2

    .line 69
    goto :goto_3

    .line 70
    :catch_0
    move-exception p1

    .line 71
    goto/16 :goto_6

    .line 72
    .line 73
    :catch_1
    move-exception p1

    .line 74
    goto/16 :goto_7

    .line 75
    .line 76
    :sswitch_1
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

    .line 81
    .line 82
    goto :goto_3

    .line 83
    :sswitch_2
    invoke-virtual {p2}, Lcom/google/protobuf/e;->m()Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->isFresh_:Z

    .line 88
    .line 89
    goto :goto_3

    .line 90
    :sswitch_3
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

    .line 95
    .line 96
    goto :goto_3

    .line 97
    :sswitch_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :sswitch_5
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 105
    .line 106
    if-eqz p1, :cond_3

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig$Builder;

    .line 113
    .line 114
    goto :goto_4

    .line 115
    :cond_3
    move-object p1, v1

    .line 116
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->parser()Ll/ng60;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    check-cast v3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 125
    .line 126
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 127
    .line 128
    if-eqz p1, :cond_2

    .line 129
    .line 130
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 138
    .line 139
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 140
    .line 141
    goto :goto_3

    .line 142
    :sswitch_6
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 143
    .line 144
    if-eqz p1, :cond_4

    .line 145
    .line 146
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 147
    .line 148
    .line 149
    move-result-object p1

    .line 150
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig$Builder;

    .line 151
    .line 152
    goto :goto_5

    .line 153
    :cond_4
    move-object p1, v1

    .line 154
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;->parser()Ll/ng60;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    check-cast v3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 163
    .line 164
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 165
    .line 166
    if-eqz p1, :cond_2

    .line 167
    .line 168
    invoke-virtual {p1, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 176
    .line 177
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 178
    .line 179
    goto :goto_3

    .line 180
    :sswitch_7
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

    .line 185
    .line 186
    goto/16 :goto_3

    .line 187
    .line 188
    :sswitch_8
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

    .line 193
    .line 194
    goto/16 :goto_3

    .line 195
    .line 196
    :sswitch_9
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

    .line 201
    .line 202
    goto/16 :goto_3

    .line 203
    .line 204
    :sswitch_a
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object p1

    .line 208
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

    .line 209
    .line 210
    goto/16 :goto_3

    .line 211
    .line 212
    :sswitch_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

    .line 217
    .line 218
    goto/16 :goto_3

    .line 219
    .line 220
    :sswitch_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->p()I

    .line 221
    .line 222
    .line 223
    move-result p1

    .line 224
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeType_:I

    .line 225
    .line 226
    goto/16 :goto_3

    .line 227
    .line 228
    :sswitch_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 233
    .line 234
    goto/16 :goto_3

    .line 235
    .line 236
    :catchall_1
    move-exception p0

    .line 237
    throw p0

    .line 238
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 239
    .line 240
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 245
    .line 246
    .line 247
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 252
    .line 253
    .line 254
    return-object v1

    .line 255
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 260
    .line 261
    .line 262
    return-object v1

    .line 263
    :cond_5
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 264
    .line 265
    return-object p0

    .line 266
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 267
    .line 268
    check-cast p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 269
    .line 270
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;

    .line 271
    .line 272
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 273
    .line 274
    .line 275
    move-result p1

    .line 276
    xor-int/2addr p1, v2

    .line 277
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;

    .line 278
    .line 279
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;

    .line 280
    .line 281
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 282
    .line 283
    .line 284
    move-result v3

    .line 285
    xor-int/2addr v3, v2

    .line 286
    iget-object v4, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;

    .line 287
    .line 288
    invoke-interface {p2, p1, v1, v3, v4}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object p1

    .line 292
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;

    .line 293
    .line 294
    iget p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeType_:I

    .line 295
    .line 296
    if-eqz p1, :cond_6

    .line 297
    .line 298
    move v1, v2

    .line 299
    goto :goto_8

    .line 300
    :cond_6
    move v1, v0

    .line 301
    :goto_8
    iget v3, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeType_:I

    .line 302
    .line 303
    if-eqz v3, :cond_7

    .line 304
    .line 305
    move v0, v2

    .line 306
    :cond_7
    invoke-interface {p2, v1, p1, v0, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->e(ZIZI)I

    .line 307
    .line 308
    .line 309
    move-result p1

    .line 310
    iput p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeType_:I

    .line 311
    .line 312
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

    .line 313
    .line 314
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 315
    .line 316
    .line 317
    move-result p1

    .line 318
    xor-int/2addr p1, v2

    .line 319
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

    .line 320
    .line 321
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

    .line 322
    .line 323
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 324
    .line 325
    .line 326
    move-result v1

    .line 327
    xor-int/2addr v1, v2

    .line 328
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

    .line 329
    .line 330
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object p1

    .line 334
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

    .line 335
    .line 336
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

    .line 337
    .line 338
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 339
    .line 340
    .line 341
    move-result p1

    .line 342
    xor-int/2addr p1, v2

    .line 343
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

    .line 344
    .line 345
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

    .line 346
    .line 347
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 348
    .line 349
    .line 350
    move-result v1

    .line 351
    xor-int/2addr v1, v2

    .line 352
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

    .line 353
    .line 354
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object p1

    .line 358
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

    .line 359
    .line 360
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

    .line 361
    .line 362
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 363
    .line 364
    .line 365
    move-result p1

    .line 366
    xor-int/2addr p1, v2

    .line 367
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

    .line 368
    .line 369
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

    .line 370
    .line 371
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 372
    .line 373
    .line 374
    move-result v1

    .line 375
    xor-int/2addr v1, v2

    .line 376
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

    .line 377
    .line 378
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object p1

    .line 382
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

    .line 383
    .line 384
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

    .line 385
    .line 386
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 387
    .line 388
    .line 389
    move-result p1

    .line 390
    xor-int/2addr p1, v2

    .line 391
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

    .line 392
    .line 393
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

    .line 394
    .line 395
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 396
    .line 397
    .line 398
    move-result v1

    .line 399
    xor-int/2addr v1, v2

    .line 400
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

    .line 401
    .line 402
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object p1

    .line 406
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

    .line 407
    .line 408
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

    .line 409
    .line 410
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 411
    .line 412
    .line 413
    move-result p1

    .line 414
    xor-int/2addr p1, v2

    .line 415
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

    .line 416
    .line 417
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

    .line 418
    .line 419
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 420
    .line 421
    .line 422
    move-result v1

    .line 423
    xor-int/2addr v1, v2

    .line 424
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

    .line 425
    .line 426
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object p1

    .line 430
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

    .line 431
    .line 432
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 433
    .line 434
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 435
    .line 436
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 437
    .line 438
    .line 439
    move-result-object p1

    .line 440
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 441
    .line 442
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 443
    .line 444
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 445
    .line 446
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 447
    .line 448
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 449
    .line 450
    .line 451
    move-result-object p1

    .line 452
    check-cast p1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 453
    .line 454
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 455
    .line 456
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

    .line 457
    .line 458
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 459
    .line 460
    .line 461
    move-result p1

    .line 462
    xor-int/2addr p1, v2

    .line 463
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

    .line 464
    .line 465
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

    .line 466
    .line 467
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 468
    .line 469
    .line 470
    move-result v1

    .line 471
    xor-int/2addr v1, v2

    .line 472
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

    .line 473
    .line 474
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object p1

    .line 478
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

    .line 479
    .line 480
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

    .line 481
    .line 482
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 483
    .line 484
    .line 485
    move-result p1

    .line 486
    xor-int/2addr p1, v2

    .line 487
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

    .line 488
    .line 489
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

    .line 490
    .line 491
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 492
    .line 493
    .line 494
    move-result v1

    .line 495
    xor-int/2addr v1, v2

    .line 496
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

    .line 497
    .line 498
    invoke-interface {p2, p1, v0, v1, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 499
    .line 500
    .line 501
    move-result-object p1

    .line 502
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

    .line 503
    .line 504
    iget-boolean p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->isFresh_:Z

    .line 505
    .line 506
    iget-boolean v0, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->isFresh_:Z

    .line 507
    .line 508
    invoke-interface {p2, p1, p1, v0, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->d(ZZZZ)Z

    .line 509
    .line 510
    .line 511
    move-result p1

    .line 512
    iput-boolean p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->isFresh_:Z

    .line 513
    .line 514
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

    .line 515
    .line 516
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 517
    .line 518
    .line 519
    move-result p1

    .line 520
    xor-int/2addr p1, v2

    .line 521
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

    .line 522
    .line 523
    iget-object v1, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

    .line 524
    .line 525
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 526
    .line 527
    .line 528
    move-result v1

    .line 529
    xor-int/2addr v1, v2

    .line 530
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

    .line 531
    .line 532
    invoke-interface {p2, p1, v0, v1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object p1

    .line 536
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

    .line 537
    .line 538
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 539
    .line 540
    return-object p0

    .line 541
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;

    .line 542
    .line 543
    invoke-direct {p0, v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask$Builder;-><init>(Ll/x2w;)V

    .line 544
    .line 545
    .line 546
    return-object p0

    .line 547
    :pswitch_5
    return-object v1

    .line 548
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 549
    .line 550
    return-object p0

    .line 551
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;

    .line 552
    .line 553
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;-><init>()V

    .line 554
    .line 555
    .line 556
    return-object p0

    .line 557
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

    .line 558
    .line 559
    .line 560
    .line 561
    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    .line 574
    .line 575
    .line 576
    .line 577
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0xa -> :sswitch_d
        0x10 -> :sswitch_c
        0x1a -> :sswitch_b
        0x22 -> :sswitch_a
        0x2a -> :sswitch_9
        0x32 -> :sswitch_8
        0x3a -> :sswitch_7
        0x42 -> :sswitch_6
        0x4a -> :sswitch_5
        0x52 -> :sswitch_4
        0x5a -> :sswitch_3
        0x60 -> :sswitch_2
        0x6a -> :sswitch_1
    .end sparse-switch
.end method

.method public getAvatar()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAvatarBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

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

.method public getAvatarConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getColor()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getColorBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

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

.method public getFakeId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFakeIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

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

.method public getFakeType()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeType_:I

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;->forNumber(I)Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;->UNRECOGNIZED:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;

    .line 10
    .line 11
    :cond_0
    return-object p0
.end method

.method public getFakeTypeValue()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeType_:I

    .line 2
    .line 3
    return p0
.end method

.method public getGender()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGenderBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

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

.method public getIcon()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIconBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;

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

.method public getIsFresh()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->isFresh_:Z

    .line 2
    .line 3
    return p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

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

.method public getOriginUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getOriginUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

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

.method public getProfileConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getSerializedSize()I
    .locals 3

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getId()Ljava/lang/String;

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeType_:I

    .line 27
    .line 28
    sget-object v2, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;->system:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;->getNumber()I

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
    iget v2, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeType_:I

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getUserId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getFakeId()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getName()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getGender()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getAvatar()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 135
    .line 136
    if-eqz v1, :cond_8

    .line 137
    .line 138
    const/16 v1, 0x8

    .line 139
    .line 140
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    add-int/2addr v0, v1

    .line 149
    :cond_8
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 150
    .line 151
    if-eqz v1, :cond_9

    .line 152
    .line 153
    const/16 v1, 0x9

    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getProfileConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    add-int/2addr v0, v1

    .line 164
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

    .line 165
    .line 166
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 167
    .line 168
    .line 169
    move-result v1

    .line 170
    if-nez v1, :cond_a

    .line 171
    .line 172
    const/16 v1, 0xa

    .line 173
    .line 174
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getColor()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 179
    .line 180
    .line 181
    move-result v1

    .line 182
    add-int/2addr v0, v1

    .line 183
    :cond_a
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    if-nez v1, :cond_b

    .line 190
    .line 191
    const/16 v1, 0xb

    .line 192
    .line 193
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getIcon()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    add-int/2addr v0, v1

    .line 202
    :cond_b
    iget-boolean v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->isFresh_:Z

    .line 203
    .line 204
    if-eqz v1, :cond_c

    .line 205
    .line 206
    const/16 v2, 0xc

    .line 207
    .line 208
    invoke-static {v2, v1}, Lcom/google/protobuf/CodedOutputStream;->f(IZ)I

    .line 209
    .line 210
    .line 211
    move-result v1

    .line 212
    add-int/2addr v0, v1

    .line 213
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

    .line 214
    .line 215
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-nez v1, :cond_d

    .line 220
    .line 221
    const/16 v1, 0xd

    .line 222
    .line 223
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getOriginUserId()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 228
    .line 229
    .line 230
    move-result v1

    .line 231
    add-int/2addr v0, v1

    .line 232
    :cond_d
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 233
    .line 234
    return v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

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

.method public hasAvatarConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

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

.method public hasProfileConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

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
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->id_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getId()Ljava/lang/String;

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
    iget v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeType_:I

    .line 18
    .line 19
    sget-object v1, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;->system:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeType;->getNumber()I

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
    iget v1, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeType_:I

    .line 29
    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->i0(II)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getUserId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->fakeId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getFakeId()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->name_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->gender_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getGender()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatar_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getAvatar()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 114
    .line 115
    if-eqz v0, :cond_7

    .line 116
    .line 117
    const/16 v0, 0x8

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserAvatarConfig;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 124
    .line 125
    .line 126
    :cond_7
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->profileConfig_:Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 127
    .line 128
    if-eqz v0, :cond_8

    .line 129
    .line 130
    const/16 v0, 0x9

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getProfileConfig()Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserProfileConfig;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 137
    .line 138
    .line 139
    :cond_8
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->color_:Ljava/lang/String;

    .line 140
    .line 141
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    if-nez v0, :cond_9

    .line 146
    .line 147
    const/16 v0, 0xa

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getColor()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 154
    .line 155
    .line 156
    :cond_9
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->icon_:Ljava/lang/String;

    .line 157
    .line 158
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_a

    .line 163
    .line 164
    const/16 v0, 0xb

    .line 165
    .line 166
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getIcon()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 171
    .line 172
    .line 173
    :cond_a
    iget-boolean v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->isFresh_:Z

    .line 174
    .line 175
    if-eqz v0, :cond_b

    .line 176
    .line 177
    const/16 v1, 0xc

    .line 178
    .line 179
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->a0(IZ)V

    .line 180
    .line 181
    .line 182
    :cond_b
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->originUserId_:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    if-nez v0, :cond_c

    .line 189
    .line 190
    const/16 v0, 0xd

    .line 191
    .line 192
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livegift/LongLinkLiveDanmakuMessage$FakeUserMask;->getOriginUserId()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 197
    .line 198
    .line 199
    :cond_c
    return-void
.end method
