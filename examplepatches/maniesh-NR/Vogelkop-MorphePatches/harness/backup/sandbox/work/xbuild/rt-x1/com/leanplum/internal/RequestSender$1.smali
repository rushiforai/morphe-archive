.class Lcom/leanplum/internal/RequestSender$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/RequestSender;->send(Lcom/leanplum/internal/Request;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/internal/RequestSender;

.field final synthetic val$request:Lcom/leanplum/internal/Request;


# direct methods
.method public constructor <init>(Lcom/leanplum/internal/RequestSender;Lcom/leanplum/internal/Request;)V
    .registers 3

    iput-object p1, p0, Lcom/leanplum/internal/RequestSender$1;->this$0:Lcom/leanplum/internal/RequestSender;

    iput-object p2, p0, Lcom/leanplum/internal/RequestSender$1;->val$request:Lcom/leanplum/internal/Request;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 2

    iget-object v0, p0, Lcom/leanplum/internal/RequestSender$1;->this$0:Lcom/leanplum/internal/RequestSender;

    iget-object p0, p0, Lcom/leanplum/internal/RequestSender$1;->val$request:Lcom/leanplum/internal/Request;

    # invokes: Lcom/leanplum/internal/RequestSender;->sendSync(Lcom/leanplum/internal/Request;)V
    invoke-static {v0, p0}, Lcom/leanplum/internal/RequestSender;->access$000(Lcom/leanplum/internal/RequestSender;Lcom/leanplum/internal/Request;)V

    return-void
.end method
