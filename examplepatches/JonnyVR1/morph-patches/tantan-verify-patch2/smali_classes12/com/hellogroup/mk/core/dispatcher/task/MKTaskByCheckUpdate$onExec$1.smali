.class final Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate$onExec$1;
.super Lkotlin/jvm/internal/Lambda;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;->n(Ll/cd00;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/Lambda;",
        "Lkotlin/jvm/functions/Function0<",
        "Lkotlin/Unit;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    bv = {
        0x1,
        0x0,
        0x3
    }
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0010\u0002\n\u0000\u0010\u0000\u001a\u00020\u0001H\n\u00a2\u0006\u0002\u0008\u0002"
    }
    d2 = {
        "<anonymous>",
        "",
        "invoke"
    }
    k = 0x3
    mv = {
        0x1,
        0x1,
        0x10
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;


# direct methods
.method public constructor <init>(Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;)V
    .locals 0

    iput-object p1, p0, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate$onExec$1;->this$0:Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lkotlin/jvm/internal/Lambda;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate$onExec$1;->invoke()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 5
    .line 6
    return-object p0
.end method

.method public final invoke()V
    .locals 0

    .line 7
    iget-object p0, p0, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate$onExec$1;->this$0:Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;

    invoke-virtual {p0}, Lcom/hellogroup/mk/core/dispatcher/task/MKTaskByCheckUpdate;->m()V

    return-void
.end method
