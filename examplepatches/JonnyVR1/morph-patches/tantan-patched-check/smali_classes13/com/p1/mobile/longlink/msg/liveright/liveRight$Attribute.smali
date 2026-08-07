.class public final Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
.super Lcom/google/protobuf/GeneratedMessageLite;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveright/liveRight$AttributeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveright/liveRight;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Attribute"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite<",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$AttributeOrBuilder;"
    }
.end annotation


# static fields
.field public static final AVATARCONFIG_FIELD_NUMBER:I = 0xb

.field public static final CALLEFFECTCONFIG_FIELD_NUMBER:I = 0xd

.field public static final CHATSHADINGCONFIG_FIELD_NUMBER:I = 0xa

.field private static final DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

.field public static final JUMPURL_FIELD_NUMBER:I = 0x3

.field private static volatile PARSER:Ll/ng60; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;",
            ">;"
        }
    .end annotation
.end field

.field public static final PROFILECONFIG_FIELD_NUMBER:I = 0xc

.field public static final RESOURCEURL_FIELD_NUMBER:I = 0x5

.field public static final RESTRICT_FIELD_NUMBER:I = 0x4

.field public static final THUMBNAILURL_FIELD_NUMBER:I = 0x2


# instance fields
.field private avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

.field private callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

.field private chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

.field private jumpUrl_:Ljava/lang/String;

.field private profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

.field private resourceUrl_:Ljava/lang/String;

.field private restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

.field private thumbnailUrl_:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

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
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

    .line 11
    .line 12
    return-void
.end method

.method public static bridge synthetic A(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setRestrict(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;)V

    return-void
.end method

.method public static bridge synthetic B(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setThumbnailUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic C(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setThumbnailUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic D()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    return-object v0
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->clearAvatarConfig()V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->clearCallEffectConfig()V

    return-void
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->clearChatShadingConfig()V

    return-void
.end method

.method private clearAvatarConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 3
    .line 4
    return-void
.end method

.method private clearCallEffectConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 3
    .line 4
    return-void
.end method

.method private clearChatShadingConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 3
    .line 4
    return-void
.end method

.method private clearJumpUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getJumpUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearProfileConfig()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 3
    .line 4
    return-void
.end method

.method private clearResourceUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getResourceUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method private clearRestrict()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 3
    .line 4
    return-void
.end method

.method private clearThumbnailUrl()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getThumbnailUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->clearJumpUrl()V

    return-void
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->clearProfileConfig()V

    return-void
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->clearResourceUrl()V

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->clearRestrict()V

    return-void
.end method

.method public static getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 2
    .line 3
    return-object v0
.end method

.method public static bridge synthetic h(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->clearThumbnailUrl()V

    return-void
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->mergeAvatarConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;)V

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->mergeCallEffectConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;)V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->mergeChatShadingConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)V

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->mergeProfileConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;)V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->mergeRestrict(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;)V

    return-void
.end method

.method private mergeAvatarConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 33
    .line 34
    return-void
.end method

.method private mergeCallEffectConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 33
    .line 34
    return-void
.end method

.method private mergeChatShadingConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 33
    .line 34
    return-void
.end method

.method private mergeProfileConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 33
    .line 34
    return-void
.end method

.method private mergeRestrict(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;

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
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 33
    .line 34
    return-void
.end method

.method public static bridge synthetic n(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setAvatarConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig$Builder;)V

    return-void
.end method

.method public static newBuilder()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;
    .locals 1

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;

    return-object v0
.end method

.method public static newBuilder(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;

    .line 14
    .line 15
    return-object p0
.end method

.method public static bridge synthetic o(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setAvatarConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;)V

    return-void
.end method

.method public static bridge synthetic p(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setCallEffectConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig$Builder;)V

    return-void
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseDelimitedFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseDelimitedFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 2
    .line 3
    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;)Lcom/google/protobuf/GeneratedMessageLite;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 8
    .line 9
    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 10
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/ByteString;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 15
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    return-object p0
.end method

.method public static parseFrom(Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 16
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Lcom/google/protobuf/e;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    return-object p0
.end method

.method public static parseFrom(Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;Ljava/io/InputStream;Lcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    return-object p0
.end method

.method public static parseFrom([B)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 11
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    invoke-static {v0, p0}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[B)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    return-object p0
.end method

.method public static parseFrom([BLcom/google/protobuf/h;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/protobuf/InvalidProtocolBufferException;
        }
    .end annotation

    .line 12
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    invoke-static {v0, p0, p1}, Lcom/google/protobuf/GeneratedMessageLite;->parseFrom(Lcom/google/protobuf/GeneratedMessageLite;[BLcom/google/protobuf/h;)Lcom/google/protobuf/GeneratedMessageLite;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    return-object p0
.end method

.method public static parser()Ll/ng60;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ll/ng60<",
            "Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

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

.method public static bridge synthetic q(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setCallEffectConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;)V

    return-void
.end method

.method public static bridge synthetic r(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setChatShadingConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;)V

    return-void
.end method

.method public static bridge synthetic s(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setChatShadingConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)V

    return-void
.end method

.method private setAvatarConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setAvatarConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    return-void
.end method

.method private setCallEffectConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setCallEffectConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    return-void
.end method

.method private setChatShadingConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setChatShadingConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    return-void
.end method

.method private setJumpUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setJumpUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setProfileConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 8
    .line 9
    return-void
.end method

.method private setProfileConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    return-void
.end method

.method private setResourceUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setResourceUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method private setRestrict(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/google/protobuf/GeneratedMessageLite$b;->build()Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 6
    .line 7
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 8
    .line 9
    return-void
.end method

.method private setRestrict(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;)V
    .locals 0

    .line 10
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    return-void
.end method

.method private setThumbnailUrl(Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;

    .line 5
    .line 6
    return-void
.end method

.method private setThumbnailUrlBytes(Lcom/google/protobuf/ByteString;)V
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
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;

    .line 12
    .line 13
    return-void
.end method

.method public static bridge synthetic t(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setJumpUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic u(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setJumpUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic v(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setProfileConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;)V

    return-void
.end method

.method public static bridge synthetic w(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setProfileConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;)V

    return-void
.end method

.method public static bridge synthetic x(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setResourceUrl(Ljava/lang/String;)V

    return-void
.end method

.method public static bridge synthetic y(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/google/protobuf/ByteString;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setResourceUrlBytes(Lcom/google/protobuf/ByteString;)V

    return-void
.end method

.method public static bridge synthetic z(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->setRestrict(Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;)V

    return-void
.end method


# virtual methods
.method public final dynamicMethod(Lcom/google/protobuf/GeneratedMessageLite$MethodToInvoke;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->PARSER:Ll/ng60;

    .line 19
    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    const-class p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 23
    .line 24
    monitor-enter p0

    .line 25
    :try_start_0
    sget-object p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->PARSER:Ll/ng60;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    new-instance p1, Lcom/google/protobuf/GeneratedMessageLite$c;

    .line 30
    .line 31
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 32
    .line 33
    invoke-direct {p1, p2}, Lcom/google/protobuf/GeneratedMessageLite$c;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 34
    .line 35
    .line 36
    sput-object p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->PARSER:Ll/ng60;

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
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->PARSER:Ll/ng60;

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
    if-nez p1, :cond_11

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
    const/16 v3, 0x12

    .line 62
    .line 63
    if-eq v2, v3, :cond_10

    .line 64
    .line 65
    const/16 v3, 0x1a

    .line 66
    .line 67
    if-eq v2, v3, :cond_f

    .line 68
    .line 69
    const/16 v3, 0x22

    .line 70
    .line 71
    if-eq v2, v3, :cond_d

    .line 72
    .line 73
    const/16 v3, 0x2a

    .line 74
    .line 75
    if-eq v2, v3, :cond_c

    .line 76
    .line 77
    const/16 v3, 0x52

    .line 78
    .line 79
    if-eq v2, v3, :cond_a

    .line 80
    .line 81
    const/16 v3, 0x5a

    .line 82
    .line 83
    if-eq v2, v3, :cond_8

    .line 84
    .line 85
    const/16 v3, 0x62

    .line 86
    .line 87
    if-eq v2, v3, :cond_6

    .line 88
    .line 89
    const/16 v3, 0x6a

    .line 90
    .line 91
    if-eq v2, v3, :cond_4

    .line 92
    .line 93
    invoke-virtual {p2, v2}, Lcom/google/protobuf/e;->R(I)Z

    .line 94
    .line 95
    .line 96
    move-result v2

    .line 97
    if-nez v2, :cond_2

    .line 98
    .line 99
    :cond_3
    move p1, v1

    .line 100
    goto :goto_3

    .line 101
    :catch_0
    move-exception p1

    .line 102
    goto/16 :goto_9

    .line 103
    .line 104
    :catch_1
    move-exception p1

    .line 105
    goto/16 :goto_a

    .line 106
    .line 107
    :cond_4
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 108
    .line 109
    if-eqz v2, :cond_5

    .line 110
    .line 111
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig$Builder;

    .line 116
    .line 117
    goto :goto_4

    .line 118
    :cond_5
    move-object v2, v0

    .line 119
    :goto_4
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;->parser()Ll/ng60;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 124
    .line 125
    .line 126
    move-result-object v3

    .line 127
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 128
    .line 129
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 130
    .line 131
    if-eqz v2, :cond_2

    .line 132
    .line 133
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 141
    .line 142
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 143
    .line 144
    goto :goto_3

    .line 145
    :cond_6
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 146
    .line 147
    if-eqz v2, :cond_7

    .line 148
    .line 149
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig$Builder;

    .line 154
    .line 155
    goto :goto_5

    .line 156
    :cond_7
    move-object v2, v0

    .line 157
    :goto_5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->parser()Ll/ng60;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 162
    .line 163
    .line 164
    move-result-object v3

    .line 165
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 166
    .line 167
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 168
    .line 169
    if-eqz v2, :cond_2

    .line 170
    .line 171
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 179
    .line 180
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 181
    .line 182
    goto/16 :goto_3

    .line 183
    .line 184
    :cond_8
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 185
    .line 186
    if-eqz v2, :cond_9

    .line 187
    .line 188
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig$Builder;

    .line 193
    .line 194
    goto :goto_6

    .line 195
    :cond_9
    move-object v2, v0

    .line 196
    :goto_6
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;->parser()Ll/ng60;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 201
    .line 202
    .line 203
    move-result-object v3

    .line 204
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 205
    .line 206
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 207
    .line 208
    if-eqz v2, :cond_2

    .line 209
    .line 210
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 211
    .line 212
    .line 213
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 214
    .line 215
    .line 216
    move-result-object v2

    .line 217
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 218
    .line 219
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 220
    .line 221
    goto/16 :goto_3

    .line 222
    .line 223
    :cond_a
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 224
    .line 225
    if-eqz v2, :cond_b

    .line 226
    .line 227
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;

    .line 232
    .line 233
    goto :goto_7

    .line 234
    :cond_b
    move-object v2, v0

    .line 235
    :goto_7
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->parser()Ll/ng60;

    .line 236
    .line 237
    .line 238
    move-result-object v3

    .line 239
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 244
    .line 245
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 246
    .line 247
    if-eqz v2, :cond_2

    .line 248
    .line 249
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 257
    .line 258
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 259
    .line 260
    goto/16 :goto_3

    .line 261
    .line 262
    :cond_c
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v2

    .line 266
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

    .line 267
    .line 268
    goto/16 :goto_3

    .line 269
    .line 270
    :cond_d
    iget-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 271
    .line 272
    if-eqz v2, :cond_e

    .line 273
    .line 274
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite;->toBuilder()Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 275
    .line 276
    .line 277
    move-result-object v2

    .line 278
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict$Builder;

    .line 279
    .line 280
    goto :goto_8

    .line 281
    :cond_e
    move-object v2, v0

    .line 282
    :goto_8
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->parser()Ll/ng60;

    .line 283
    .line 284
    .line 285
    move-result-object v3

    .line 286
    invoke-virtual {p2, v3, p3}, Lcom/google/protobuf/e;->w(Ll/ng60;Lcom/google/protobuf/h;)Lcom/google/protobuf/q;

    .line 287
    .line 288
    .line 289
    move-result-object v3

    .line 290
    check-cast v3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 291
    .line 292
    iput-object v3, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 293
    .line 294
    if-eqz v2, :cond_2

    .line 295
    .line 296
    invoke-virtual {v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$b;->mergeFrom(Lcom/google/protobuf/GeneratedMessageLite;)Lcom/google/protobuf/GeneratedMessageLite$b;

    .line 297
    .line 298
    .line 299
    invoke-virtual {v2}, Lcom/google/protobuf/GeneratedMessageLite$b;->buildPartial()Lcom/google/protobuf/GeneratedMessageLite;

    .line 300
    .line 301
    .line 302
    move-result-object v2

    .line 303
    check-cast v2, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 304
    .line 305
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 306
    .line 307
    goto/16 :goto_3

    .line 308
    .line 309
    :cond_f
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object v2

    .line 313
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

    .line 314
    .line 315
    goto/16 :goto_3

    .line 316
    .line 317
    :cond_10
    invoke-virtual {p2}, Lcom/google/protobuf/e;->L()Ljava/lang/String;

    .line 318
    .line 319
    .line 320
    move-result-object v2

    .line 321
    iput-object v2, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;
    :try_end_1
    .catch Lcom/google/protobuf/InvalidProtocolBufferException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 322
    .line 323
    goto/16 :goto_3

    .line 324
    .line 325
    :catchall_1
    move-exception p0

    .line 326
    throw p0

    .line 327
    :goto_9
    new-instance p2, Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 328
    .line 329
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object p1

    .line 333
    invoke-direct {p2, p1}, Lcom/google/protobuf/InvalidProtocolBufferException;-><init>(Ljava/lang/String;)V

    .line 334
    .line 335
    .line 336
    invoke-virtual {p2, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 341
    .line 342
    .line 343
    return-object v0

    .line 344
    :goto_a
    invoke-virtual {p1, p0}, Lcom/google/protobuf/InvalidProtocolBufferException;->setUnfinishedMessage(Lcom/google/protobuf/q;)Lcom/google/protobuf/InvalidProtocolBufferException;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 349
    .line 350
    .line 351
    return-object v0

    .line 352
    :cond_11
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 353
    .line 354
    return-object p0

    .line 355
    :pswitch_3
    check-cast p2, Lcom/google/protobuf/GeneratedMessageLite$h;

    .line 356
    .line 357
    check-cast p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 358
    .line 359
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;

    .line 360
    .line 361
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 362
    .line 363
    .line 364
    move-result p1

    .line 365
    xor-int/2addr p1, v1

    .line 366
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;

    .line 367
    .line 368
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;

    .line 369
    .line 370
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 371
    .line 372
    .line 373
    move-result v2

    .line 374
    xor-int/2addr v2, v1

    .line 375
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;

    .line 376
    .line 377
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object p1

    .line 381
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;

    .line 382
    .line 383
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

    .line 384
    .line 385
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 386
    .line 387
    .line 388
    move-result p1

    .line 389
    xor-int/2addr p1, v1

    .line 390
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

    .line 391
    .line 392
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

    .line 393
    .line 394
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 395
    .line 396
    .line 397
    move-result v2

    .line 398
    xor-int/2addr v2, v1

    .line 399
    iget-object v3, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

    .line 400
    .line 401
    invoke-interface {p2, p1, v0, v2, v3}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object p1

    .line 405
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

    .line 406
    .line 407
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 408
    .line 409
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 410
    .line 411
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 412
    .line 413
    .line 414
    move-result-object p1

    .line 415
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 416
    .line 417
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 418
    .line 419
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

    .line 420
    .line 421
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 422
    .line 423
    .line 424
    move-result p1

    .line 425
    xor-int/2addr p1, v1

    .line 426
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

    .line 427
    .line 428
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

    .line 429
    .line 430
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 431
    .line 432
    .line 433
    move-result v2

    .line 434
    xor-int/2addr v1, v2

    .line 435
    iget-object v2, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

    .line 436
    .line 437
    invoke-interface {p2, p1, v0, v1, v2}, Lcom/google/protobuf/GeneratedMessageLite$h;->f(ZLjava/lang/String;ZLjava/lang/String;)Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object p1

    .line 441
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

    .line 442
    .line 443
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 444
    .line 445
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 446
    .line 447
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 448
    .line 449
    .line 450
    move-result-object p1

    .line 451
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 452
    .line 453
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 454
    .line 455
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 456
    .line 457
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 458
    .line 459
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 460
    .line 461
    .line 462
    move-result-object p1

    .line 463
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 464
    .line 465
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 466
    .line 467
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 468
    .line 469
    iget-object v0, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 470
    .line 471
    invoke-interface {p2, p1, v0}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 472
    .line 473
    .line 474
    move-result-object p1

    .line 475
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 476
    .line 477
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 478
    .line 479
    iget-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 480
    .line 481
    iget-object p3, p3, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 482
    .line 483
    invoke-interface {p2, p1, p3}, Lcom/google/protobuf/GeneratedMessageLite$h;->o(Lcom/google/protobuf/q;Lcom/google/protobuf/q;)Lcom/google/protobuf/q;

    .line 484
    .line 485
    .line 486
    move-result-object p1

    .line 487
    check-cast p1, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 488
    .line 489
    iput-object p1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 490
    .line 491
    sget-object p1, Lcom/google/protobuf/GeneratedMessageLite$g;->INSTANCE:Lcom/google/protobuf/GeneratedMessageLite$g;

    .line 492
    .line 493
    return-object p0

    .line 494
    :pswitch_4
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;

    .line 495
    .line 496
    invoke-direct {p0, v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute$Builder;-><init>(Ll/x4r0;)V

    .line 497
    .line 498
    .line 499
    return-object p0

    .line 500
    :pswitch_5
    return-object v0

    .line 501
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->DEFAULT_INSTANCE:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 502
    .line 503
    return-object p0

    .line 504
    :pswitch_7
    new-instance p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;

    .line 505
    .line 506
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;-><init>()V

    .line 507
    .line 508
    .line 509
    return-object p0

    .line 510
    nop

    .line 511
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

.method public getAvatarConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getCallEffectConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getChatShadingConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getJumpUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getJumpUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

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

.method public getProfileConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    return-object p0
.end method

.method public getResourceUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getResourceUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

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

.method public getRestrict()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;->getDefaultInstance()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;

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
    const/4 v0, 0x2

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getThumbnailUrl()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

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
    const/4 v1, 0x3

    .line 35
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getJumpUrl()Ljava/lang/String;

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
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 45
    .line 46
    if-eqz v1, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x4

    .line 49
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getRestrict()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    add-int/2addr v0, v1

    .line 58
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-nez v1, :cond_4

    .line 65
    .line 66
    const/4 v1, 0x5

    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getResourceUrl()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->K(ILjava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    add-int/2addr v0, v1

    .line 76
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 77
    .line 78
    if-eqz v1, :cond_5

    .line 79
    .line 80
    const/16 v1, 0xa

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getChatShadingConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    add-int/2addr v0, v1

    .line 91
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 92
    .line 93
    if-eqz v1, :cond_6

    .line 94
    .line 95
    const/16 v1, 0xb

    .line 96
    .line 97
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    add-int/2addr v0, v1

    .line 106
    :cond_6
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 107
    .line 108
    if-eqz v1, :cond_7

    .line 109
    .line 110
    const/16 v1, 0xc

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getProfileConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    add-int/2addr v0, v1

    .line 121
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 122
    .line 123
    if-eqz v1, :cond_8

    .line 124
    .line 125
    const/16 v1, 0xd

    .line 126
    .line 127
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getCallEffectConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    invoke-static {v1, v2}, Lcom/google/protobuf/CodedOutputStream;->C(ILcom/google/protobuf/q;)I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    add-int/2addr v0, v1

    .line 136
    :cond_8
    iput v0, p0, Lcom/google/protobuf/GeneratedMessageLite;->memoizedSerializedSize:I

    .line 137
    .line 138
    return v0
.end method

.method public getThumbnailUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThumbnailUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

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

.method public hasCallEffectConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

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

.method public hasChatShadingConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

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
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

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

.method public hasRestrict()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->thumbnailUrl_:Ljava/lang/String;

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
    const/4 v0, 0x2

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getThumbnailUrl()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->jumpUrl_:Ljava/lang/String;

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
    const/4 v0, 0x3

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getJumpUrl()Ljava/lang/String;

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
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->restrict_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    const/4 v0, 0x4

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getRestrict()Lcom/p1/mobile/longlink/msg/liveright/liveRight$Restrict;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 43
    .line 44
    .line 45
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->resourceUrl_:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_3

    .line 52
    .line 53
    const/4 v0, 0x5

    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getResourceUrl()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->D0(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->chatShadingConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 62
    .line 63
    if-eqz v0, :cond_4

    .line 64
    .line 65
    const/16 v0, 0xa

    .line 66
    .line 67
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getChatShadingConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 72
    .line 73
    .line 74
    :cond_4
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->avatarConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 75
    .line 76
    if-eqz v0, :cond_5

    .line 77
    .line 78
    const/16 v0, 0xb

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getAvatarConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$AvatarConfig;

    .line 81
    .line 82
    .line 83
    move-result-object v1

    .line 84
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 85
    .line 86
    .line 87
    :cond_5
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->profileConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 88
    .line 89
    if-eqz v0, :cond_6

    .line 90
    .line 91
    const/16 v0, 0xc

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getProfileConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ProfileConfig;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    invoke-virtual {p1, v0, v1}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 98
    .line 99
    .line 100
    :cond_6
    iget-object v0, p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->callEffectConfig_:Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 101
    .line 102
    if-eqz v0, :cond_7

    .line 103
    .line 104
    const/16 v0, 0xd

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$Attribute;->getCallEffectConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$CallEffectConfig;

    .line 107
    .line 108
    .line 109
    move-result-object p0

    .line 110
    invoke-virtual {p1, v0, p0}, Lcom/google/protobuf/CodedOutputStream;->w0(ILcom/google/protobuf/q;)V

    .line 111
    .line 112
    .line 113
    :cond_7
    return-void
.end method
