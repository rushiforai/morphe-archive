.class public final Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChangeOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;",
        "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChangeOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->G()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

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

.method public synthetic constructor <init>(Ll/h3w;)V
    .locals 0

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllProgressTexts(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->a(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addProgressTexts(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->b(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addProgressTextsBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->c(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearGrade()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->d(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearJumpSchema()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->e(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearJumpText()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->f(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPreGrade()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->g(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearPreWealth()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->h(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearProgressText()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->i(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearProgressTexts()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->j(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearServerTs()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->k(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearStyle()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->l(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearSuperGrade()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->m(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearWealth()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->n(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearWealthRatio()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->o(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getGrade()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getGrade()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getJumpSchema()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getJumpSchema()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getJumpSchemaBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getJumpSchemaBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getJumpText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getJumpText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getJumpTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getJumpTextBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getPreGrade()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getPreGrade()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getPreWealth()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getPreWealth()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getProgressText()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getProgressText()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getProgressTextBytes()Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getProgressTextBytes()Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getProgressTexts(I)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getProgressTexts(I)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getProgressTextsBytes(I)Lcom/google/protobuf/ByteString;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getProgressTextsBytes(I)Lcom/google/protobuf/ByteString;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getProgressTextsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getProgressTextsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getProgressTextsList()Ljava/util/List;
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
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getProgressTextsList()Ljava/util/List;

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

.method public getServerTs()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getServerTs()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getStyle()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getStyle()Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getSuperGrade()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getSuperGrade()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getWealth()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getWealth()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public getWealthRatio()D
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->getWealthRatio()D

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0
.end method

.method public hasStyle()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->hasStyle()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public mergeStyle(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->p(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setGrade(J)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->q(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setJumpSchema(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->r(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setJumpSchemaBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->s(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setJumpText(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->t(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setJumpTextBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->u(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPreGrade(J)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->v(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setPreWealth(J)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->w(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setProgressText(Ljava/lang/String;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->x(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setProgressTextBytes(Lcom/google/protobuf/ByteString;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->y(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/google/protobuf/ByteString;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setProgressTexts(ILjava/lang/String;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->z(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;ILjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setServerTs(J)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->A(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setStyle(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle$Builder;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->B(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle$Builder;)V

    return-object p0
.end method

.method public setStyle(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->C(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressStyle;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setSuperGrade(J)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->D(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setWealth(J)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->E(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;J)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setWealthRatio(D)Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;->F(Lcom/p1/mobile/longlink/msg/livehierarchy/LongLinkLiveUserLevel$UserLiveHierarchyProgressChange;D)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
