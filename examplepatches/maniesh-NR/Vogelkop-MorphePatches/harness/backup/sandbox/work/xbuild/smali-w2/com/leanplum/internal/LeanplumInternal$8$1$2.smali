.class Lcom/leanplum/internal/LeanplumInternal$8$1$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/internal/Request$ErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/internal/LeanplumInternal$8$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/leanplum/internal/LeanplumInternal$8$1;


# direct methods
.method public constructor <init>(Lcom/leanplum/internal/LeanplumInternal$8$1;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/internal/LeanplumInternal$8$1$2;->this$1:Lcom/leanplum/internal/LeanplumInternal$8$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public error(Ljava/lang/Exception;)V
    .registers 4

    iget-object p0, p0, Lcom/leanplum/internal/LeanplumInternal$8$1$2;->this$1:Lcom/leanplum/internal/LeanplumInternal$8$1;

    iget-object p0, p0, Lcom/leanplum/internal/LeanplumInternal$8$1;->this$0:Lcom/leanplum/internal/LeanplumInternal$8;

    iget-object p0, p0, Lcom/leanplum/internal/LeanplumInternal$8;->val$callback:Lcom/leanplum/internal/LeanplumInternal$locationAttributeRequestsCallback;

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Lcom/leanplum/internal/LeanplumInternal$locationAttributeRequestsCallback;->response(Z)V

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "setUserAttributes failed when specifying location with error: "

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-array p1, v0, [Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/leanplum/internal/Log;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
