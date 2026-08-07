.class public Lcom/tantanapp/common/network/RunnerProxy;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private group:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/common/network/RunnerProxy;",
            ">;"
        }
    .end annotation
.end field

.field protected runner:Lcom/tantanapp/common/network/ObservableRunner;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tantanapp/common/network/RunnerProxy;->group:Ljava/util/List;

    .line 6
    .line 7
    new-instance v0, Lcom/tantanapp/common/network/ObservableRunner;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/tantanapp/common/network/ObservableRunner;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>(Lcom/tantanapp/common/network/RunnerProxy;)V
    .locals 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/tantanapp/common/network/RunnerProxy;->group:Ljava/util/List;

    .line 17
    iget-object p1, p1, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    iput-object p1, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    return-void
.end method


# virtual methods
.method public bind(Lcom/tantanapp/common/network/RunnerProxy;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/network/RunnerProxy;->group:Ljava/util/List;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/tantanapp/common/network/RunnerProxy;->group:Ljava/util/List;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->group:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public clearRequests(Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->doBeforeAction()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/network/ObservableRunner;->clearRequests(Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public clearRequestsAndStop()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->doBeforeAction()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tantanapp/common/network/ObservableRunner;->clearRequestsAndStop()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public doBeforeAction()V
    .locals 0

    return-void
.end method

.method public findRequest(Ljava/lang/String;I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "I)",
            "Lrx/c<",
            "TK;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->doBeforeAction()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/network/ObservableRunner;->findRequest(Ljava/lang/String;I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public just()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->doBeforeAction()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/tantanapp/common/network/ObservableRunner;->just()Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public now(Ljava/lang/String;Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 13
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->doBeforeAction()V

    .line 14
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/network/ObservableRunner;->now(Ljava/lang/String;Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public now(Ljava/lang/String;Lrx/c;Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "Lrx/c<",
            "TT;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->doBeforeAction()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Lcom/tantanapp/common/network/ObservableRunner;->now(Ljava/lang/String;Lrx/c;Z)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public now(Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 11
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->doBeforeAction()V

    .line 12
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/ObservableRunner;->now(Lrx/c;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public runnerStart()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/network/RunnerProxy;->group:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/tantanapp/common/network/RunnerProxy;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/tantanapp/common/network/RunnerProxy;->runnerStart()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/tantanapp/common/network/ObservableRunner;->runnerStart()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public runnerStop()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/tantanapp/common/network/RunnerProxy;->group:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/tantanapp/common/network/RunnerProxy;

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/tantanapp/common/network/RunnerProxy;->runnerStop()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    .line 26
    .line 27
    invoke-virtual {p0}, Lcom/tantanapp/common/network/ObservableRunner;->runnerStop()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "I",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->doBeforeAction()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2, p3}, Lcom/tantanapp/common/network/ObservableRunner;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            "I",
            "Ll/pcj<",
            "Lrx/c<",
            "TT;>;>;Z)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 11
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->doBeforeAction()V

    .line 12
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/tantanapp/common/network/ObservableRunner;->scheduled(Ljava/lang/String;ILl/pcj;Z)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public setErrorHandler(Ll/qcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "Ljava/lang/Throwable;",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/tantanapp/common/network/ObservableRunner;->setErrorHandler(Ll/qcj;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public wait(Ljava/lang/String;I)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/tantanapp/common/network/RunnerProxy;->doBeforeAction()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/tantanapp/common/network/RunnerProxy;->runner:Lcom/tantanapp/common/network/ObservableRunner;

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Lcom/tantanapp/common/network/ObservableRunner;->wait(Ljava/lang/String;I)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
