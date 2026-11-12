.class public final Lcom/leanplum/messagetemplates/OperaSubscriptionSheet$register$1;
.super Lcom/leanplum/callbacks/ActionCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaSubscriptionSheet;->register(Landroid/content/Context;Ltcl;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0017\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0006"
    }
    d2 = {
        "com/leanplum/messagetemplates/OperaSubscriptionSheet$register$1",
        "Lcom/leanplum/callbacks/ActionCallback;",
        "onResponse",
        "",
        "actionContext",
        "Lcom/leanplum/ActionContext;",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $currentContext:Landroid/content/Context;

.field final synthetic $taskExecutor:Ltcl;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ltcl;)V
    .registers 3

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet$register$1;->$currentContext:Landroid/content/Context;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet$register$1;->$taskExecutor:Ltcl;

    invoke-direct {p0}, Lcom/leanplum/callbacks/ActionCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Lcom/leanplum/ActionContext;)Z
    .registers 4

    new-instance v0, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet$register$1$onResponse$1;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet$register$1;->$currentContext:Landroid/content/Context;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet$register$1;->$taskExecutor:Ltcl;

    invoke-direct {v0, v1, p0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionSheet$register$1$onResponse$1;-><init>(Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;)V

    invoke-static {v0}, Lcom/leanplum/Leanplum;->addOnceVariablesChangedAndNoDownloadsPendingHandler(Lcom/leanplum/callbacks/VariablesChangedCallback;)V

    const/4 p0, 0x1

    return p0
.end method
