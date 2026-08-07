.class public final Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfileOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfileOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->n()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

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

.method public synthetic constructor <init>(Ll/c3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearMask()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->a(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearMaskMode()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->b(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPictureUrl()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->c(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearUserMask()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->d(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getMask()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Mask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getMask()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Mask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getMaskMode()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getMaskMode()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getPictureUrl()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getPictureUrl()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPictureUrlBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getPictureUrlBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->getUserMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->hasMask()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasUserMask()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->hasUserMask()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeMask(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Mask;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->e(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Mask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->f(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMask(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Mask$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->g(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Mask$Builder;)V

    return-object p0
.end method

.method public setMask(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Mask;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->h(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$Mask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMaskMode(Z)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->i(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;Z)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPictureUrl(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->j(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPictureUrlBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->k(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->l(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask$Builder;)V

    return-object p0
.end method

.method public setUserMask(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;->m(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserProfile;Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
