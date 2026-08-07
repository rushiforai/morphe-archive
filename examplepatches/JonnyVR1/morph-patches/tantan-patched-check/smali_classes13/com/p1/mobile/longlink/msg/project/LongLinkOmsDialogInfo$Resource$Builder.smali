.class public final Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->p()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllPages(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->a(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addPages(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->b(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;)V

    return-object p0
.end method

.method public addPages(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->c(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;)V

    return-object p0
.end method

.method public addPages(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->d(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;)V

    return-object p0
.end method

.method public addPages(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->e(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearId()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->f(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPages()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->g(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearTemplateID()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->h(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->getId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getIdBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->getIdBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPages(I)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->getPages(I)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPagesCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->getPagesCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getPagesList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->getPagesList()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public getTemplateID()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->getTemplateID()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getTemplateIDBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->getTemplateIDBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public removePages(I)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->i(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setId(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->j(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIdBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->k(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPages(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->l(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;)V

    return-object p0
.end method

.method public setPages(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->m(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTemplateID(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->n(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setTemplateIDBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;->o(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Resource;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
