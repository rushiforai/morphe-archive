.class Lcom/leanplum/LeanplumPushService$1$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/internal/Request$ErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/LeanplumPushService$1;->variablesChanged()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/leanplum/LeanplumPushService$1;


# direct methods
.method public constructor <init>(Lcom/leanplum/LeanplumPushService$1;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/LeanplumPushService$1$2;->this$0:Lcom/leanplum/LeanplumPushService$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public error(Ljava/lang/Exception;)V
    .registers 2

    iget-object p0, p0, Lcom/leanplum/LeanplumPushService$1$2;->this$0:Lcom/leanplum/LeanplumPushService$1;

    iget-object p0, p0, Lcom/leanplum/LeanplumPushService$1;->val$onComplete:Lcom/leanplum/callbacks/VariablesChangedCallback;

    invoke-virtual {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;->variablesChanged()V

    return-void
.end method
