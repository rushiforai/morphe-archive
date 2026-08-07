.class public final Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePageOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePageOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->l()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllNodes(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->a(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addNodes(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->b(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)V

    return-object p0
.end method

.method public addNodes(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->c(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)V

    return-object p0
.end method

.method public addNodes(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->d(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)V

    return-object p0
.end method

.method public addNodes(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->e(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearIndex()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->f(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearNodes()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->g(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getIndex()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->getIndex()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getNodes(I)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->getNodes(I)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getNodesCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->getNodesCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getNodesList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->getNodesList()Ljava/util/List;

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

.method public removeNodes(I)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->h(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setIndex(I)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->i(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setNodes(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->j(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode$Builder;)V

    return-object p0
.end method

.method public setNodes(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;->k(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourcePage;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$ResourceNode;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
