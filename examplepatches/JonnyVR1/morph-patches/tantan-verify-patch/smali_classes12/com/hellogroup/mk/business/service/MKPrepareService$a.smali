.class Lcom/hellogroup/mk/business/service/MKPrepareService$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/business/service/MKPrepareService;->startPrepare()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/hellogroup/mk/business/service/MKPrepareService;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/business/service/MKPrepareService;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/hellogroup/mk/business/service/MKPrepareService$a;->a:Lcom/hellogroup/mk/business/service/MKPrepareService;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    invoke-static {}, Lcom/hellogroup/mk/business/service/MKPrepareService;->access$000()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-static {}, Lcom/hellogroup/mk/business/service/MKPrepareService;->access$000()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ljava/lang/Runnable;

    .line 26
    .line 27
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 v0, 0x0

    .line 32
    invoke-static {v0}, Lcom/hellogroup/mk/business/service/MKPrepareService;->access$002(Ljava/util/List;)Ljava/util/List;

    .line 33
    .line 34
    .line 35
    :cond_1
    iget-object p0, p0, Lcom/hellogroup/mk/business/service/MKPrepareService$a;->a:Lcom/hellogroup/mk/business/service/MKPrepareService;

    .line 36
    .line 37
    invoke-static {p0}, Lcom/hellogroup/mk/business/service/MKPrepareService;->access$100(Lcom/hellogroup/mk/business/service/MKPrepareService;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method
