.class public final Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfigOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfigOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->e()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-direct {p0, v0}, Lcom/google/protobuf/GeneratedMessageLite$b;-><init>(Lcom/google/protobuf/GeneratedMessageLite;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public synthetic constructor <init>(Ll/c6r0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->getFrameConfig()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasFrameConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->hasFrameConfig()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeFrameConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->b(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setFrameConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->c(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig$Builder;)V

    return-object p0
.end method

.method public setFrameConfig(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;->d(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$AvatarConfig;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$PictureConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
