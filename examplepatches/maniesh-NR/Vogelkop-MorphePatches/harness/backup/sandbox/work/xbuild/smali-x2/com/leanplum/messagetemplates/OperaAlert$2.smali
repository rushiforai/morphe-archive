.class Lcom/leanplum/messagetemplates/OperaAlert$2;
.super Lcom/leanplum/callbacks/ActionCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaAlert;->register(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Lcom/leanplum/callbacks/ActionCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onResponse(Lcom/leanplum/ActionContext;)Z
    .registers 3

    new-instance v0, Lcom/leanplum/messagetemplates/OperaAlert$2$1;

    invoke-direct {v0, p0, p1}, Lcom/leanplum/messagetemplates/OperaAlert$2$1;-><init>(Lcom/leanplum/messagetemplates/OperaAlert$2;Lcom/leanplum/ActionContext;)V

    invoke-static {v0}, Lcom/leanplum/LeanplumActivityHelper;->queueActionUponActive(Ljava/lang/Runnable;)V

    const/4 p0, 0x1

    return p0
.end method
