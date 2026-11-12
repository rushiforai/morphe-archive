.class public final Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$register$1$onResponse$1;
.super Lcom/leanplum/callbacks/VariablesChangedCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$register$1;->onResponse(Lcom/leanplum/ActionContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "com/leanplum/messagetemplates/OperaConfigBundleSheet$register$1$onResponse$1",
        "Lcom/leanplum/callbacks/VariablesChangedCallback;",
        "variablesChanged",
        "",
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
.field final synthetic $context:Lcom/leanplum/ActionContext;

.field final synthetic $taskExecutor:Ltcl;

.field final synthetic $usageReporter:Lorm;


# direct methods
.method public constructor <init>(Lcom/leanplum/ActionContext;Ltcl;Lorm;)V
    .registers 4

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$register$1$onResponse$1;->$context:Lcom/leanplum/ActionContext;

    iput-object p2, p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$register$1$onResponse$1;->$taskExecutor:Ltcl;

    iput-object p3, p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$register$1$onResponse$1;->$usageReporter:Lorm;

    invoke-direct {p0}, Lcom/leanplum/callbacks/VariablesChangedCallback;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/leanplum/ActionContext;Ltcl;Lorm;)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$register$1$onResponse$1;->variablesChanged$lambda$0(Lcom/leanplum/ActionContext;Ltcl;Lorm;)V

    return-void
.end method

.method private static final variablesChanged$lambda$0(Lcom/leanplum/ActionContext;Ltcl;Lorm;)V
    .registers 11

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v1, v0, Lcom/opera/android/BrowserActivity;

    if-nez v1, :cond_9

    return-void

    :cond_9
    sget-object v2, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;->INSTANCE:Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->Q0()Lqln;

    move-result-object v6

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->O()Leej;

    move-result-object v7

    move-object v3, p0

    move-object v4, p1

    move-object v5, p2

    # invokes: Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;->initializeSheetRequest(Lcom/leanplum/ActionContext;Ltcl;Lorm;Lqln;Lok5;)V
    invoke-static/range {v2 .. v7}, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;->access$initializeSheetRequest(Lcom/leanplum/messagetemplates/OperaConfigBundleSheet;Lcom/leanplum/ActionContext;Ltcl;Lorm;Lqln;Lok5;)V

    return-void
.end method


# virtual methods
.method public variablesChanged()V
    .registers 5

    iget-object v0, p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$register$1$onResponse$1;->$context:Lcom/leanplum/ActionContext;

    iget-object v1, p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$register$1$onResponse$1;->$taskExecutor:Ltcl;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$register$1$onResponse$1;->$usageReporter:Lorm;

    new-instance v2, Ljbd;

    const/16 v3, 0xb

    invoke-direct {v2, v0, v1, p0, v3}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v2}, Lcom/leanplum/LeanplumActivityHelper;->queueActionUponActive(Ljava/lang/Runnable;)V

    return-void
.end method
