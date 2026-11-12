.class Lcom/leanplum/internal/LeanplumInternal$8$1$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/internal/Request$ResponseCallback;


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

    iput-object p1, p0, Lcom/leanplum/internal/LeanplumInternal$8$1$1;->this$1:Lcom/leanplum/internal/LeanplumInternal$8$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public response(Lorg/json/JSONObject;)V
    .registers 2

    iget-object p0, p0, Lcom/leanplum/internal/LeanplumInternal$8$1$1;->this$1:Lcom/leanplum/internal/LeanplumInternal$8$1;

    iget-object p0, p0, Lcom/leanplum/internal/LeanplumInternal$8$1;->this$0:Lcom/leanplum/internal/LeanplumInternal$8;

    iget-object p0, p0, Lcom/leanplum/internal/LeanplumInternal$8;->val$callback:Lcom/leanplum/internal/LeanplumInternal$locationAttributeRequestsCallback;

    const/4 p1, 0x1

    invoke-interface {p0, p1}, Lcom/leanplum/internal/LeanplumInternal$locationAttributeRequestsCallback;->response(Z)V

    return-void
.end method
