.class public final Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfigOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfigOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->m()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

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

.method public synthetic constructor <init>(Ll/c2w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearBackgroundColorConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->a(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearBorderColorConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->b(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCornerConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->c(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getBackgroundColorConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->getBackgroundColorConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBorderColorConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->getBorderColorConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCornerConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->getCornerConfig()Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasBackgroundColorConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->hasBackgroundColorConfig()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasBorderColorConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->hasBorderColorConfig()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasCornerConfig()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->hasCornerConfig()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->d(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeBorderColorConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->e(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeCornerConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->f(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->g(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;)V

    return-object p0
.end method

.method public setBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->h(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBorderColorConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->i(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig$Builder;)V

    return-object p0
.end method

.method public setBorderColorConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->j(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveBackgroundColorConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCornerConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig$Builder;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->k(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig$Builder;)V

    return-object p0
.end method

.method public setCornerConfig(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;->l(Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatShadingConfig;Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveCornerConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
