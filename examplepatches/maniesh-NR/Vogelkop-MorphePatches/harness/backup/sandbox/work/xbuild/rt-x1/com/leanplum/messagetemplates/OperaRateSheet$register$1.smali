.class public final Lcom/leanplum/messagetemplates/OperaRateSheet$register$1;
.super Lcom/leanplum/callbacks/ActionCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/leanplum/messagetemplates/OperaRateSheet;->register(Lorm;)V
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
        "com/leanplum/messagetemplates/OperaRateSheet$register$1",
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
.field final synthetic $usageReporter:Lorm;


# direct methods
.method public constructor <init>(Lorm;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$register$1;->$usageReporter:Lorm;

    invoke-direct {p0}, Lcom/leanplum/callbacks/ActionCallback;-><init>()V

    return-void
.end method

.method public static synthetic a(Lorm;Lcom/leanplum/ActionContext;)V
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/OperaRateSheet$register$1;->onResponse$lambda$0(Lorm;Lcom/leanplum/ActionContext;)V

    return-void
.end method

.method private static final onResponse$lambda$0(Lorm;Lcom/leanplum/ActionContext;)V
    .registers 9

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object v1

    sget-object v0, Leg0;->f:Leg0;

    if-eqz v1, :cond_a1

    instance-of v2, v1, Lcom/opera/android/BrowserActivity;

    if-eqz v2, :cond_a1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    iget-object v3, v2, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v3, v3, Lxv1;->S:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lf4b;

    invoke-virtual {v3}, Lf4b;->b()Z

    move-result v3

    if-nez v3, :cond_7e

    iget-object v1, v2, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v1, v1, Lxv1;->S:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lf4b;

    iget-object v2, v1, Lf4b;->a:Lvg4;

    invoke-virtual {v2}, Lvg4;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_41

    sget-object v1, Le4b;->a:[Le4b;

    const-string v1, "Rating isn\'t supported for this build"

    goto :goto_74

    :cond_41
    iget-object v2, v1, Lf4b;->b:Ld4b;

    invoke-virtual {v2}, Ld4b;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-nez v2, :cond_54

    sget-object v1, Le4b;->a:[Le4b;

    const-string v1, "Rate dialog hasn\'t been show yet"

    goto :goto_74

    :cond_54
    iget-object v2, v1, Lf4b;->d:Ld4b;

    invoke-virtual {v2}, Ld4b;->invoke()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    if-eqz v2, :cond_67

    sget-object v1, Le4b;->a:[Le4b;

    const-string v1, "User has already rated"

    goto :goto_74

    :cond_67
    invoke-virtual {v1}, Lf4b;->a()Z

    move-result v1

    if-eqz v1, :cond_72

    sget-object v1, Le4b;->a:[Le4b;

    const-string v1, "Not enough time has passed since rate dialog was shown"

    goto :goto_74

    :cond_72
    const-string v1, ""

    :goto_74
    invoke-virtual {p1}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object p1

    check-cast p0, Lx5f;

    invoke-virtual {p0, v1, v0, p1}, Lx5f;->p0(Ljava/lang/String;Leg0;Ljava/lang/String;)V

    return-void

    :cond_7e
    sget-object v0, Lcom/leanplum/messagetemplates/OperaRateSheet;->INSTANCE:Lcom/leanplum/messagetemplates/OperaRateSheet;

    move-object p0, v1

    check-cast p0, Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->Z:Lhw3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqjh;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v4, v3, Ld6j;->c:Lx5f;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v5, v2, Ld6j;->d:Lx5f;

    sget-object v6, Lu55;->Ro:Lulp;

    move-object v2, p0

    move-object v3, p1

    # invokes: Lcom/leanplum/messagetemplates/OperaRateSheet;->initiateRateSheet(Landroid/app/Activity;Lqjh;Lcom/leanplum/ActionContext;Lorm;Lskm;Lu55;)V
    invoke-static/range {v0 .. v6}, Lcom/leanplum/messagetemplates/OperaRateSheet;->access$initiateRateSheet(Lcom/leanplum/messagetemplates/OperaRateSheet;Landroid/app/Activity;Lqjh;Lcom/leanplum/ActionContext;Lorm;Lskm;Lu55;)V

    return-void

    :cond_a1
    move-object v3, p1

    invoke-virtual {v3}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object p1

    check-cast p0, Lx5f;

    const-string v1, "Invalid activity"

    invoke-virtual {p0, v1, v0, p1}, Lx5f;->p0(Ljava/lang/String;Leg0;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public onResponse(Lcom/leanplum/ActionContext;)Z
    .registers 4

    iget-object p0, p0, Lcom/leanplum/messagetemplates/OperaRateSheet$register$1;->$usageReporter:Lorm;

    new-instance v0, Lhpd;

    const/16 v1, 0x1c

    invoke-direct {v0, p0, p1, v1}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0}, Lcom/leanplum/LeanplumActivityHelper;->queueActionUponActive(Ljava/lang/Runnable;)V

    const/4 p0, 0x1

    return p0
.end method
