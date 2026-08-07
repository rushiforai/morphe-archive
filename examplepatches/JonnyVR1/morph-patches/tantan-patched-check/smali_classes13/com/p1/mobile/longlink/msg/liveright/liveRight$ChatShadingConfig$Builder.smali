.class public final Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfigOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfigOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->m()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

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

.method public synthetic constructor <init>(Ll/x4r0;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearBackgroundColorConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->a(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearBorderColorConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->b(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearCornerConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->c(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getBackgroundColorConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->getBackgroundColorConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getBorderColorConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->getBorderColorConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getCornerConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->getCornerConfig()Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->hasBackgroundColorConfig()Z

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->hasBorderColorConfig()Z

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
    check-cast p0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->hasCornerConfig()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->d(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeBorderColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->e(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeCornerConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->f(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->g(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;)V

    return-object p0
.end method

.method public setBackgroundColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->h(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setBorderColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->i(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig$Builder;)V

    return-object p0
.end method

.method public setBorderColorConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->j(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$ColorConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setCornerConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig$Builder;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->k(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig$Builder;)V

    return-object p0
.end method

.method public setCornerConfig(Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;)Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;->l(Lcom/p1/mobile/longlink/msg/liveright/liveRight$ChatShadingConfig;Lcom/p1/mobile/longlink/msg/liveright/liveRight$CornerConfig;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
