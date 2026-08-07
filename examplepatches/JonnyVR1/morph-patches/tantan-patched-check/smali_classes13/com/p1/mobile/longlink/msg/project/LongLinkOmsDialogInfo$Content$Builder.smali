.class public final Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ContentOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ContentOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->k()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

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

.method public synthetic constructor <init>(Ll/p3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public clearMorph()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->a(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTemplate()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->b(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearWeb()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->c(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getMorph()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->getMorph()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTemplate()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->getTemplate()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getWeb()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Web;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->getWeb()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Web;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public hasTemplate()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->hasTemplate()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public hasWeb()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->hasWeb()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeTemplate(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->d(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public mergeWeb(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Web;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->e(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Web;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setMorph(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->f(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTemplate(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->g(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;)V

    return-object p0
.end method

.method public setTemplate(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->h(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setWeb(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Web$Builder;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->i(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Web$Builder;)V

    return-object p0
.end method

.method public setWeb(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Web;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;->j(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Content;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Web;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
