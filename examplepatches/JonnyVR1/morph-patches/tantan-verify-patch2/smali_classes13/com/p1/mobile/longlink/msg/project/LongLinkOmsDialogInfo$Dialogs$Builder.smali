.class public final Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs$Builder;
.super Lcom/google/protobuf/GeneratedMessageLite$b;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$DialogsOrBuilder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/protobuf/GeneratedMessageLite$b<",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs$Builder;",
        ">;",
        "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$DialogsOrBuilder;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;->j()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

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
    invoke-direct {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs$Builder;-><init>()V

    return-void
.end method


# virtual methods
.method public addAllDialogs(Ljava/lang/Iterable;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs$Builder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;",
            ">;)",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs$Builder;"
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
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;->a(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;Ljava/lang/Iterable;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public addDialogs(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs$Builder;
    .locals 1

    .line 16
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 17
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;->b(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;)V

    return-object p0
.end method

.method public addDialogs(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;->c(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V

    return-object p0
.end method

.method public addDialogs(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs$Builder;
    .locals 1

    .line 14
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 15
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;->d(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;)V

    return-object p0
.end method

.method public addDialogs(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;->e(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public clearDialogs()Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    .line 7
    .line 8
    invoke-static {v0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;->f(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public getDialogs(I)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;->getDialogs(I)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDialogsCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;->getDialogsCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getDialogsList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;->getDialogsList()Ljava/util/List;

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

.method public removeDialogs(I)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    .line 7
    .line 8
    invoke-static {v0, p1}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;->g(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;I)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method

.method public setDialogs(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs$Builder;
    .locals 1

    .line 12
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 13
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;->h(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog$Builder;)V

    return-object p0
.end method

.method public setDialogs(ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs$Builder;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/google/protobuf/GeneratedMessageLite$b;->copyOnWrite()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/google/protobuf/GeneratedMessageLite$b;->instance:Lcom/google/protobuf/GeneratedMessageLite;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;

    .line 7
    .line 8
    invoke-static {v0, p1, p2}, Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;->i(Lcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialogs;ILcom/p1/mobile/longlink/msg/project/LongLinkOmsDialogInfo$Dialog;)V

    .line 9
    .line 10
    .line 11
    return-object p0
.end method
