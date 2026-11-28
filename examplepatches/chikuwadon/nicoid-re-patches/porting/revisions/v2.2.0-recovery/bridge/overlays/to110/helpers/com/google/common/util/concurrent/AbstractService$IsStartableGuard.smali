.class final Lcom/google/common/util/concurrent/AbstractService$IsStartableGuard;
.super Lcom/google/common/util/concurrent/Monitor$Guard;
.source "AbstractService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/AbstractService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "IsStartableGuard"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/util/concurrent/AbstractService;


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/AbstractService;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 127
    iput-object p1, p0, Lcom/google/common/util/concurrent/AbstractService$IsStartableGuard;->this$0:Lcom/google/common/util/concurrent/AbstractService;

    .line 128
    # getter for: Lcom/google/common/util/concurrent/AbstractService;->monitor:Lcom/google/common/util/concurrent/Monitor;
    invoke-static {p1}, Lcom/google/common/util/concurrent/AbstractService;->access$000(Lcom/google/common/util/concurrent/AbstractService;)Lcom/google/common/util/concurrent/Monitor;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/google/common/util/concurrent/Monitor$Guard;-><init>(Lcom/google/common/util/concurrent/Monitor;)V

    return-void
.end method


# virtual methods
.method public isSatisfied()Z
    .registers 2

    .line 133
    iget-object p0, p0, Lcom/google/common/util/concurrent/AbstractService$IsStartableGuard;->this$0:Lcom/google/common/util/concurrent/AbstractService;

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractService;->state()Lcom/google/common/util/concurrent/Service$State;

    move-result-object p0

    sget-object v0, Lcom/google/common/util/concurrent/Service$State;->NEW:Lcom/google/common/util/concurrent/Service$State;

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
