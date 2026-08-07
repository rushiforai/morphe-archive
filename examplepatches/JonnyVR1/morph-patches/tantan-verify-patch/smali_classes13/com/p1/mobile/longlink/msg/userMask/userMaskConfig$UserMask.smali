.class public final Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMaskOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "UserMask"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMaskOrBuilder;"
    }
.end annotation


# static fields
.field public static final AVATARCONFIG_FIELD_NUMBER:I = 0x4

.field public static final AVATARRESOURCETYPE_FIELD_NUMBER:I = 0x6

.field public static final AVATAR_FIELD_NUMBER:I = 0x3

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

.field public static final NAME_FIELD_NUMBER:I = 0x2

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;",
            ">;"
        }
    .end annotation
.end field

.field public static final USERID_FIELD_NUMBER:I = 0x1

.field public static final USERNAMEGRADIENTCOLORS_FIELD_NUMBER:I = 0x7

.field public static final VOICEMASKMODEADDITION_FIELD_NUMBER:I = 0x5


# instance fields
.field private avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

.field private avatarResourceType_:Ljava/lang/String;

.field private avatar_:Ljava/lang/String;

.field private bitField0_:I

.field private name_:Ljava/lang/String;

.field private userId_:Ljava/lang/String;

.field private userNameGradientColors_:Lcom/google/protobuf/l$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/protobuf/l$h<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 19
    .line 20
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Ljava/lang/Iterable;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->addAllUserNameGradientColors(Ljava/lang/Iterable;)V

    return-void
.end method

.method private addAllUserNameGradientColors(Ljava/lang/Iterable;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->ensureUserNameGradientColorsIsMutable()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 5
    .line 6
    invoke-static {p1, p0}, Lcom/google/protobuf/a;->addAll(Ljava/lang/Iterable;Ljava/util/Collection;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private addUserNameGradientColors(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->ensureUserNameGradientColorsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private addUserNameGradientColorsBytes(Lcom/google/protobuf/ByteString;)V
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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->ensureUserNameGradientColorsIsMutable()V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

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

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->addUserNameGradientColors(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->addUserNameGradientColorsBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method private clearAvatar()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatar()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearAvatarConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 3
    .line 4
    return-void
.end method

.method private clearAvatarResourceType()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarResourceType()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearName()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserId()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearUserNameGradientColors()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/google/protobuf/GeneratedMessageLite;->emptyProtobufList()Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 6
    .line 7
    return-void
.end method

.method private clearVoiceMaskModeAddition()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 3
    .line 4
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->clearAvatar()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->clearAvatarConfig()V

    return-void
.end method

.method private ensureUserNameGradientColorsIsMutable()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->clearAvatarResourceType()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->clearName()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->clearUserId()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->clearUserNameGradientColors()V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->clearVoiceMaskModeAddition()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->mergeAvatarConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->mergeVoiceMaskModeAddition(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->setAvatar(Ljava/lang/String;)V

    return-void
.end method

.method private mergeAvatarConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 33
    .line 34
    return-void
.end method

.method private mergeVoiceMaskModeAddition(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->newBuilder(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->setAvatarBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->setAvatarConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->setAvatarConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

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

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

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

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->setAvatarResourceType(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->setAvatarResourceTypeBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->setName(Ljava/lang/String;)V

    return-void
.end method

.method private setAvatar(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setAvatarConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setAvatarConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    return-void
.end method

.method private setAvatarResourceType(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setAvatarResourceTypeBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserId(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;

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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setUserNameGradientColors(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->ensureUserNameGradientColorsIsMutable()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private setVoiceMaskModeAddition(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 8
    .line 9
    return-void
.end method

.method private setVoiceMaskModeAddition(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->setNameBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->setUserId(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->setUserIdBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->setUserNameGradientColors(ILjava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->setVoiceMaskModeAddition(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->setVoiceMaskModeAddition(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;)V

    return-void
.end method

.method public static bridge synthetic z()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    return-object v0
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$1;->$SwitchMap$com$google$protobuf$GeneratedMessageLite$MethodToInvoke:[I

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_e

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
    if-eq v2, v3, :cond_d

    .line 64
    .line 65
    const/16 v3, 0x12

    .line 66
    .line 67
    if-eq v2, v3, :cond_c

    .line 68
    .line 69
    const/16 v3, 0x1a

    .line 70
    .line 71
    if-eq v2, v3, :cond_b

    .line 72
    .line 73
    const/16 v3, 0x22

    .line 74
    .line 75
    if-eq v2, v3, :cond_9

    .line 76
    .line 77
    const/16 v3, 0x2a

    .line 78
    .line 79
    if-eq v2, v3, :cond_7

    .line 80
    .line 81
    const/16 v3, 0x32

    .line 82
    .line 83
    if-eq v2, v3, :cond_6

    .line 84
    .line 85
    const/16 v3, 0x3a

    .line 86
    .line 87
    if-eq v2, v3, :cond_4

    .line 88
    .line 89
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-nez v2, :cond_2

    .line 94
    .line 95
    :cond_3
    move p1, v1

    .line 96
    goto :goto_3

    .line 97
    :catch_0
    move-exception p1

    .line 98
    goto/16 :goto_6

    .line 99
    .line 100
    :catch_1
    move-exception p1

    .line 101
    goto/16 :goto_7

    .line 102
    .line 103
    :cond_4
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 108
    .line 109
    invoke-interface {v3}, Lcom/google/protobuf/l$h;->q()Z

    .line 110
    .line 111
    .line 112
    move-result v3

    .line 113
    if-nez v3, :cond_5

    .line 114
    .line 115
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 116
    .line 117
    invoke-static {v3}, Lcom/google/protobuf/GeneratedMessageLite;->mutableCopy(Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 122
    .line 123
    :cond_5
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 124
    .line 125
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 126
    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_6
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

    .line 134
    .line 135
    goto :goto_3

    .line 136
    :cond_7
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 137
    .line 138
    if-eqz v2, :cond_8

    .line 139
    .line 140
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition$Builder;

    .line 145
    .line 146
    goto :goto_4

    .line 147
    :cond_8
    move-object v2, v0

    .line 148
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->parser()Ll/ng60;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 157
    .line 158
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 159
    .line 160
    if-eqz v2, :cond_2

    .line 161
    .line 162
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 170
    .line 171
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 172
    .line 173
    goto :goto_3

    .line 174
    :cond_9
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 175
    .line 176
    if-eqz v2, :cond_a

    .line 177
    .line 178
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;

    .line 183
    .line 184
    goto :goto_5

    .line 185
    :cond_a
    move-object v2, v0

    .line 186
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->parser()Ll/ng60;

    .line 187
    .line 188
    .line 189
    move-result-object v3

    .line 190
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 191
    .line 192
    .line 193
    move-result-object v3

    .line 194
    check-cast v3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 195
    .line 196
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 197
    .line 198
    if-eqz v2, :cond_2

    .line 199
    .line 200
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 201
    .line 202
    .line 203
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 204
    .line 205
    .line 206
    move-result-object v2

    .line 207
    check-cast v2, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 208
    .line 209
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 210
    .line 211
    goto/16 :goto_3

    .line 212
    .line 213
    :cond_b
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

    .line 218
    .line 219
    goto/16 :goto_3

    .line 220
    .line 221
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object v2

    .line 225
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

    .line 226
    .line 227
    goto/16 :goto_3

    .line 228
    .line 229
    :cond_d
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v2

    .line 233
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 234
    .line 235
    goto/16 :goto_3

    .line 236
    .line 237
    :catchall_1
    move-exception p0

    .line 238
    throw p0

    .line 239
    :goto_6
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 240
    .line 241
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 249
    .line 250
    .line 251
    move-result-object p0

    .line 252
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 253
    .line 254
    .line 255
    return-object v0

    .line 256
    :goto_7
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 257
    .line 258
    .line 259
    move-result-object p0

    .line 260
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 261
    .line 262
    .line 263
    return-object v0

    .line 264
    :cond_e
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 265
    .line 266
    return-object p0

    .line 267
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 268
    .line 269
    check-cast p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 270
    .line 271
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;

    .line 272
    .line 273
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 274
    .line 275
    .line 276
    move-result p1

    .line 277
    xor-int/2addr p1, v1

    .line 278
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;

    .line 279
    .line 280
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;

    .line 281
    .line 282
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 283
    .line 284
    .line 285
    move-result v2

    .line 286
    xor-int/2addr v2, v1

    .line 287
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;

    .line 288
    .line 289
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;

    .line 294
    .line 295
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

    .line 296
    .line 297
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 298
    .line 299
    .line 300
    move-result p1

    .line 301
    xor-int/2addr p1, v1

    .line 302
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

    .line 303
    .line 304
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

    .line 305
    .line 306
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 307
    .line 308
    .line 309
    move-result v2

    .line 310
    xor-int/2addr v2, v1

    .line 311
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

    .line 312
    .line 313
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object p1

    .line 317
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

    .line 318
    .line 319
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

    .line 320
    .line 321
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 322
    .line 323
    .line 324
    move-result p1

    .line 325
    xor-int/2addr p1, v1

    .line 326
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

    .line 327
    .line 328
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

    .line 329
    .line 330
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 331
    .line 332
    .line 333
    move-result v2

    .line 334
    xor-int/2addr v2, v1

    .line 335
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

    .line 336
    .line 337
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object p1

    .line 341
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

    .line 342
    .line 343
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 344
    .line 345
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 346
    .line 347
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 348
    .line 349
    .line 350
    move-result-object p1

    .line 351
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 352
    .line 353
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 354
    .line 355
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 356
    .line 357
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 358
    .line 359
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 360
    .line 361
    .line 362
    move-result-object p1

    .line 363
    check-cast p1, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 364
    .line 365
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 366
    .line 367
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

    .line 368
    .line 369
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 370
    .line 371
    .line 372
    move-result p1

    .line 373
    xor-int/2addr p1, v1

    .line 374
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

    .line 375
    .line 376
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

    .line 377
    .line 378
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 379
    .line 380
    .line 381
    move-result v2

    .line 382
    xor-int/2addr v1, v2

    .line 383
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

    .line 384
    .line 385
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 386
    .line 387
    .line 388
    move-result-object p1

    .line 389
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

    .line 390
    .line 391
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 392
    .line 393
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 394
    .line 395
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->g(Lcom/google/protobuf/l$h;Lcom/google/protobuf/l$h;)Lcom/google/protobuf/l$h;

    .line 396
    .line 397
    .line 398
    move-result-object p1

    .line 399
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 400
    .line 401
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 402
    .line 403
    if-ne p2, p1, :cond_f

    .line 404
    .line 405
    iget p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->bitField0_:I

    .line 406
    .line 407
    iget p2, p3, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->bitField0_:I

    .line 408
    .line 409
    or-int/2addr p1, p2

    .line 410
    iput p1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->bitField0_:I

    .line 411
    .line 412
    :cond_f
    return-object p0

    .line 413
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;

    .line 414
    .line 415
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;-><init>(Ll/c6r0;)V

    .line 416
    .line 417
    .line 418
    return-object p0

    .line 419
    :pswitch_5
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 420
    .line 421
    invoke-interface {p0}, Lcom/google/protobuf/l$h;->n()V

    .line 422
    .line 423
    .line 424
    return-object v0

    .line 425
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 426
    .line 427
    return-object p0

    .line 428
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 429
    .line 430
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;-><init>()V

    .line 431
    .line 432
    .line 433
    return-object p0

    .line 434
    nop

    .line 435
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

.method public getAvatar()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAvatarBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

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

.method public getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getAvatarResourceType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAvatarResourceTypeBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNameBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-static {v2, v0}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    move v0, v1

    .line 27
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_2

    .line 34
    .line 35
    const/4 v2, 0x2

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    add-int/2addr v0, v2

    .line 45
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-nez v2, :cond_3

    .line 52
    .line 53
    const/4 v2, 0x3

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatar()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    add-int/2addr v0, v2

    .line 63
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 64
    .line 65
    if-eqz v2, :cond_4

    .line 66
    .line 67
    const/4 v2, 0x4

    .line 68
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    add-int/2addr v0, v2

    .line 77
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 78
    .line 79
    if-eqz v2, :cond_5

    .line 80
    .line 81
    const/4 v2, 0x5

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    add-int/2addr v0, v2

    .line 91
    :cond_5
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

    .line 92
    .line 93
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-nez v2, :cond_6

    .line 98
    .line 99
    const/4 v2, 0x6

    .line 100
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarResourceType()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v3

    .line 104
    invoke-static {v2, v3}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result v2

    .line 108
    add-int/2addr v0, v2

    .line 109
    :cond_6
    move v2, v1

    .line 110
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 111
    .line 112
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 113
    .line 114
    .line 115
    move-result v3

    .line 116
    if-ge v1, v3, :cond_7

    .line 117
    .line 118
    iget-object v3, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 119
    .line 120
    invoke-interface {v3, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    check-cast v3, Ljava/lang/String;

    .line 125
    .line 126
    invoke-static {v3}, Lcom/google/protobuf/CodedOutputStream;->L(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    add-int/2addr v2, v3

    .line 131
    add-int/lit8 v1, v1, 0x1

    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_7
    add-int/2addr v0, v2

    .line 135
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserNameGradientColorsList()Ljava/util/List;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    add-int/2addr v0, v1

    .line 144
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 145
    .line 146
    return v0
.end method

.method public getUserId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUserIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;

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

.method public getUserNameGradientColors(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

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

.method public getUserNameGradientColorsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

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

.method public getUserNameGradientColorsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

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

.method public getUserNameGradientColorsList()Ljava/util/List;
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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public hasAvatarConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

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

.method public hasVoiceMaskModeAddition()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userId_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getUserId()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x1

    .line 14
    invoke-virtual {p1, v1, v0}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->name_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getName()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatar_:Ljava/lang/String;

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
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatar()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarConfig_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 50
    .line 51
    if-eqz v0, :cond_3

    .line 52
    .line 53
    const/4 v0, 0x4

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->voiceMaskModeAddition_:Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    const/4 v0, 0x5

    .line 66
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getVoiceMaskModeAddition()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$VoiceMaskModeAddition;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 71
    .line 72
    .line 73
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->avatarResourceType_:Ljava/lang/String;

    .line 74
    .line 75
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-nez v0, :cond_5

    .line 80
    .line 81
    const/4 v0, 0x6

    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->getAvatarResourceType()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_5
    const/4 v0, 0x0

    .line 90
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 91
    .line 92
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 93
    .line 94
    .line 95
    move-result v1

    .line 96
    if-ge v0, v1, :cond_6

    .line 97
    .line 98
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;->userNameGradientColors_:Lcom/google/protobuf/l$h;

    .line 99
    .line 100
    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    check-cast v1, Ljava/lang/String;

    .line 105
    .line 106
    const/4 v2, 0x7

    .line 107
    invoke-virtual {p1, v2, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 108
    .line 109
    .line 110
    add-int/lit8 v0, v0, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_6
    return-void
.end method
