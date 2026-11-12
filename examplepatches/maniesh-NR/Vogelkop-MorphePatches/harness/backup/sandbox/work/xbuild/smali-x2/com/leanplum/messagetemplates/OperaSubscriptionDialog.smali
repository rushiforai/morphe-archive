.class public final Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\u0008\u00c7\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001f\u0010\t\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u0006H\u0007\u00a2\u0006\u0004\u0008\t\u0010\nJ\'\u0010\u000e\u001a\u00020\u00082\u0006\u0010\u000b\u001a\u00020\u00042\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\u000cH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\'\u0010\u0012\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0011\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\'\u0010\u0014\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0011\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0013J\'\u0010\u0017\u001a\u00020\u00082\u0006\u0010\u0016\u001a\u00020\u00152\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0011\u001a\u00020\u0010H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u0017\u0010\u001b\u001a\u00020\u00082\u0006\u0010\u001a\u001a\u00020\u0019H\u0002\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u001f\u0010\u001e\u001a\u00020\u001d2\u0006\u0010\r\u001a\u00020\u000c2\u0006\u0010\u0016\u001a\u00020\u0015H\u0002\u00a2\u0006\u0004\u0008\u001e\u0010\u001fJ-\u0010\"\u001a\u00020\u00082\u0006\u0010\u0007\u001a\u00020\u00062\u0006\u0010\r\u001a\u00020\u000c2\u000c\u0010!\u001a\u0008\u0012\u0004\u0012\u00020\u00150 H\u0002\u00a2\u0006\u0004\u0008\"\u0010#R\u0014\u0010%\u001a\u00020$8\u0006X\u0086T\u00a2\u0006\u0006\n\u0004\u0008%\u0010&\u00a8\u0006\'"
    }
    d2 = {
        "Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;",
        "",
        "<init>",
        "()V",
        "Landroid/content/Context;",
        "currentContext",
        "Ltcl;",
        "taskExecutor",
        "",
        "register",
        "(Landroid/content/Context;Ltcl;)V",
        "context",
        "Lcom/leanplum/ActionContext;",
        "actionContext",
        "initializeDialogRequest",
        "(Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;)V",
        "Lorm;",
        "usageReporter",
        "onValidated",
        "(Ltcl;Lcom/leanplum/ActionContext;Lorm;)V",
        "onOffersApplied",
        "Lcom/leanplum/messagetemplates/ResourceWrapper;",
        "resourceWrapper",
        "onResourceLoaded",
        "(Lcom/leanplum/messagetemplates/ResourceWrapper;Lcom/leanplum/ActionContext;Lorm;)V",
        "Lb87;",
        "request",
        "addDialogRequest",
        "(Lb87;)V",
        "Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;",
        "createModel",
        "(Lcom/leanplum/ActionContext;Lcom/leanplum/messagetemplates/ResourceWrapper;)Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;",
        "Lcom/opera/api/Callback;",
        "callback",
        "loadResource",
        "(Ltcl;Lcom/leanplum/ActionContext;Lcom/opera/api/Callback;)V",
        "",
        "NAME",
        "Ljava/lang/String;",
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


# static fields
.field public static final $stable:I = 0x0

.field public static final INSTANCE:Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final NAME:Ljava/lang/String; = "Subscription Dialog"
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;

    invoke-direct {v0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;-><init>()V

    sput-object v0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->INSTANCE:Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/leanplum/ActionContext;)Lkotlin/Unit;
    .registers 1

    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->createModel$lambda$3$0(Lcom/leanplum/ActionContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static final synthetic access$initializeDialogRequest(Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;)V
    .registers 4

    invoke-direct {p0, p1, p2, p3}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->initializeDialogRequest(Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;)V

    return-void
.end method

.method private final addDialogRequest(Lb87;)V
    .registers 3

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p0

    if-eqz p0, :cond_19

    instance-of v0, p0, Lcom/opera/android/BrowserActivity;

    if-eqz v0, :cond_19

    check-cast p0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_19

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->z0()Lz77;

    move-result-object p0

    invoke-virtual {p0, p1}, Lr22;->a(Ljjm;)V

    :cond_19
    return-void
.end method

.method public static synthetic b(Lcom/leanplum/ActionContext;)Lkotlin/Unit;
    .registers 1

    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->createModel$lambda$4(Lcom/leanplum/ActionContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ltcl;Lcom/leanplum/ActionContext;Lorm;Ltw7;)V
    .registers 4

    invoke-static {p0, p1, p2, p3}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->onValidated$lambda$0(Ltcl;Lcom/leanplum/ActionContext;Lorm;Ltw7;)V

    return-void
.end method

.method private final createModel(Lcom/leanplum/ActionContext;Lcom/leanplum/messagetemplates/ResourceWrapper;)Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;
    .registers 16

    const-string p0, "Primary Text"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_f

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_10

    :cond_f
    move-object p0, v0

    :cond_10
    if-eqz p0, :cond_1f

    new-instance v1, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Button;

    new-instance v2, Lgof;

    const/4 v3, 0x0

    invoke-direct {v2, p1, v3}, Lgof;-><init>(Lcom/leanplum/ActionContext;B)V

    invoke-direct {v1, p0, v2}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Button;-><init>(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    move-object v8, v1

    goto :goto_20

    :cond_1f
    move-object v8, v0

    :goto_20
    const-string p0, "Secondary Text"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_2e

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_2f

    :cond_2e
    move-object p0, v0

    :cond_2f
    if-eqz p0, :cond_3e

    new-instance v1, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Button;

    new-instance v2, Lgof;

    const/4 v3, 0x1

    invoke-direct {v2, p1, v3}, Lgof;-><init>(Lcom/leanplum/ActionContext;B)V

    invoke-direct {v1, p0, v2}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Button;-><init>(Ljava/lang/String;Lkotlin/jvm/functions/Function0;)V

    move-object v9, v1

    goto :goto_3f

    :cond_3e
    move-object v9, v0

    :goto_3f
    const-string p0, "Show Close Button"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->booleanNamed(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_4d

    new-instance v0, Lgof;

    const/4 p0, 0x2

    invoke-direct {v0, p1, p0}, Lgof;-><init>(Lcom/leanplum/ActionContext;B)V

    :cond_4d
    move-object v12, v0

    new-instance v4, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    invoke-virtual {p1}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object v5

    const-string p0, "Title"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string p0, "Message"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string p0, "Full Width Buttons"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->booleanNamed(Ljava/lang/String;)Z

    move-result v11

    move-object v10, p2

    invoke-direct/range {v4 .. v12}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Button;Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Button;Lcom/leanplum/messagetemplates/ResourceWrapper;ZLkotlin/jvm/functions/Function0;)V

    return-object v4
.end method

.method private static final createModel$lambda$1$0(Lcom/leanplum/ActionContext;)Lkotlin/Unit;
    .registers 2

    const-string v0, "Primary Action"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->runTrackedActionNamed(Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private static final createModel$lambda$3$0(Lcom/leanplum/ActionContext;)Lkotlin/Unit;
    .registers 2

    const-string v0, "Secondary Action"

    invoke-virtual {p0, v0}, Lcom/leanplum/ActionContext;->runTrackedActionNamed(Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private static final createModel$lambda$4(Lcom/leanplum/ActionContext;)Lkotlin/Unit;
    .registers 5

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    const-string v3, "CloseX"

    invoke-virtual {p0, v3, v0, v1, v2}, Lcom/leanplum/ActionContext;->track(Ljava/lang/String;DLjava/util/Map;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method public static synthetic d(Lcom/opera/api/Callback;Lcom/leanplum/messagetemplates/ResourceWrapper;)Lkotlin/Unit;
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->loadResource$run(Lcom/opera/api/Callback;Lcom/leanplum/messagetemplates/ResourceWrapper;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e(Lcom/leanplum/ActionContext;Lorm;Lcom/leanplum/messagetemplates/ResourceWrapper;)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->onOffersApplied$lambda$0(Lcom/leanplum/ActionContext;Lorm;Lcom/leanplum/messagetemplates/ResourceWrapper;)V

    return-void
.end method

.method public static synthetic f(Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;Ltw7;)V
    .registers 4

    invoke-static {p0, p1, p2, p3}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->initializeDialogRequest$lambda$0(Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;Ltw7;)V

    return-void
.end method

.method public static synthetic g(Lcom/leanplum/ActionContext;)Lkotlin/Unit;
    .registers 1

    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->createModel$lambda$1$0(Lcom/leanplum/ActionContext;)Lkotlin/Unit;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h(Lcom/leanplum/ActionContext;)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 1

    invoke-static {p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->loadResource$lambda$1(Lcom/leanplum/ActionContext;)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0
.end method

.method private final initializeDialogRequest(Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;)V
    .registers 5

    new-instance p0, Lfof;

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, p3, v0}, Lfof;-><init>(Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;B)V

    const-string p2, "Primary Action"

    invoke-static {p1, p3, p2, p0}, Lcom/leanplum/messagetemplates/UtilsKt;->validateActionUrl(Landroid/content/Context;Lcom/leanplum/ActionContext;Ljava/lang/String;Lcom/opera/api/Callback;)V

    return-void
.end method

.method private static final initializeDialogRequest$lambda$0(Landroid/content/Context;Ltcl;Lcom/leanplum/ActionContext;Ltw7;)V
    .registers 5

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    instance-of v0, p3, Lrw7;

    if-eqz v0, :cond_24

    check-cast p3, Lrw7;

    iget-object p1, p3, Lrw7;->a:Ljava/lang/Object;

    check-cast p1, Lcom/leanplum/messagetemplates/DiscardInfo;

    iget-object p3, p1, Lcom/leanplum/messagetemplates/DiscardInfo;->message:Ljava/lang/String;

    iget-object p1, p1, Lcom/leanplum/messagetemplates/DiscardInfo;->reason:Leg0;

    invoke-virtual {p2}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p3, p1, p2}, Lx5f;->p0(Ljava/lang/String;Leg0;Ljava/lang/String;)V

    return-void

    :cond_24
    instance-of v0, p3, Lsw7;

    if-eqz v0, :cond_34

    check-cast p3, Lsw7;

    iget-object p3, p3, Lsw7;->a:Ljava/lang/Object;

    check-cast p3, Ljava/lang/String;

    sget-object p3, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->INSTANCE:Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;

    invoke-direct {p3, p1, p2, p0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->onValidated(Ltcl;Lcom/leanplum/ActionContext;Lorm;)V

    return-void

    :cond_34
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method private final loadResource(Ltcl;Lcom/leanplum/ActionContext;Lcom/opera/api/Callback;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ltcl;",
            "Lcom/leanplum/ActionContext;",
            "Lcom/opera/api/Callback;",
            ")V"
        }
    .end annotation

    const-string p0, "Hero Image"

    invoke-virtual {p2, p0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_33

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-eqz v0, :cond_33

    const-string v0, "None"

    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_33

    new-instance p0, Lodf;

    const/4 v0, 0x6

    invoke-direct {p0, v0}, Lodf;-><init>(B)V

    check-cast p1, Lumi;

    invoke-virtual {p1, p0}, Lumi;->e(Ln5o;)Lnml;

    move-result-object p0

    new-instance v0, Llw0;

    const/4 v1, 0x4

    invoke-direct {v0, p3, v1}, Llw0;-><init>(Lcom/opera/api/Callback;B)V

    invoke-virtual {p1, v0}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnml;->b(Lnml;)V

    invoke-virtual {p0, p2}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    :cond_33
    sget-object p0, Lcom/leanplum/messagetemplates/ResourceWrapper;->EMPTY:Lcom/leanplum/messagetemplates/ResourceWrapper;

    invoke-interface {p3, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method

.method private static final loadResource$lambda$1(Lcom/leanplum/ActionContext;)Lcom/leanplum/messagetemplates/ResourceWrapper;
    .registers 3

    sget-object v0, Lcom/leanplum/messagetemplates/ResourceWrapper;->Companion:Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;

    const-string v1, "Hero Image"

    invoke-virtual {p0, v1}, Lcom/leanplum/ActionContext;->streamNamed(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Lcom/leanplum/messagetemplates/ResourceWrapper$Companion;->getResourceFromInputStream(Ljava/io/InputStream;Z)Lcom/leanplum/messagetemplates/ResourceWrapper;

    move-result-object p0

    return-object p0
.end method

.method private static final loadResource$run(Lcom/opera/api/Callback;Lcom/leanplum/messagetemplates/ResourceWrapper;)Lkotlin/Unit;
    .registers 2

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0
.end method

.method private final onOffersApplied(Ltcl;Lcom/leanplum/ActionContext;Lorm;)V
    .registers 6

    new-instance v0, Leof;

    const/4 v1, 0x0

    invoke-direct {v0, p2, p3, v1}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, p1, p2, v0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->loadResource(Ltcl;Lcom/leanplum/ActionContext;Lcom/opera/api/Callback;)V

    return-void
.end method

.method private static final onOffersApplied$lambda$0(Lcom/leanplum/ActionContext;Lorm;Lcom/leanplum/messagetemplates/ResourceWrapper;)V
    .registers 4

    sget-object v0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->INSTANCE:Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;

    invoke-direct {v0, p2, p0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->onResourceLoaded(Lcom/leanplum/messagetemplates/ResourceWrapper;Lcom/leanplum/ActionContext;Lorm;)V

    return-void
.end method

.method private final onResourceLoaded(Lcom/leanplum/messagetemplates/ResourceWrapper;Lcom/leanplum/ActionContext;Lorm;)V
    .registers 5

    new-instance v0, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;

    invoke-direct {p0, p2, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->createModel(Lcom/leanplum/ActionContext;Lcom/leanplum/messagetemplates/ResourceWrapper;)Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;

    move-result-object p1

    invoke-direct {v0, p1, p3}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest;-><init>(Lcom/leanplum/messagetemplates/OperaSubscriptionDialogRequest$Model;Lorm;)V

    invoke-direct {p0, v0}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->addDialogRequest(Lb87;)V

    return-void
.end method

.method private final onValidated(Ltcl;Lcom/leanplum/ActionContext;Lorm;)V
    .registers 5

    new-instance p0, Lsu;

    const/16 v0, 0x1d

    invoke-direct {p0, p1, p2, p3, v0}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p2, p0}, Lcom/leanplum/messagetemplates/SubscriptionOffersKt;->applySubscriptionOffers(Lcom/leanplum/ActionContext;Lcom/opera/api/Callback;)V

    return-void
.end method

.method private static final onValidated$lambda$0(Ltcl;Lcom/leanplum/ActionContext;Lorm;Ltw7;)V
    .registers 5

    instance-of v0, p3, Lrw7;

    if-eqz v0, :cond_18

    check-cast p3, Lrw7;

    iget-object p0, p3, Lrw7;->a:Ljava/lang/Object;

    check-cast p0, Lcom/leanplum/messagetemplates/DiscardInfo;

    iget-object p3, p0, Lcom/leanplum/messagetemplates/DiscardInfo;->message:Ljava/lang/String;

    iget-object p0, p0, Lcom/leanplum/messagetemplates/DiscardInfo;->reason:Leg0;

    invoke-virtual {p1}, Lcom/leanplum/internal/BaseActionContext;->getMessageId()Ljava/lang/String;

    move-result-object p1

    check-cast p2, Lx5f;

    invoke-virtual {p2, p3, p0, p1}, Lx5f;->p0(Ljava/lang/String;Leg0;Ljava/lang/String;)V

    return-void

    :cond_18
    instance-of v0, p3, Lsw7;

    if-eqz v0, :cond_28

    check-cast p3, Lsw7;

    iget-object p3, p3, Lsw7;->a:Ljava/lang/Object;

    check-cast p3, Lkotlin/Unit;

    sget-object p3, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->INSTANCE:Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;

    invoke-direct {p3, p0, p1, p2}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog;->onOffersApplied(Ltcl;Lcom/leanplum/ActionContext;Lorm;)V

    return-void

    :cond_28
    invoke-static {}, Lh9o;->p()V

    return-void
.end method

.method public static final register(Landroid/content/Context;Ltcl;)V
    .registers 6
    .param p0    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p1    # Ltcl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    new-instance v0, Lcom/leanplum/ActionArgs;

    invoke-direct {v0}, Lcom/leanplum/ActionArgs;-><init>()V

    const-string v1, "Title"

    invoke-static {p0}, Lcom/leanplum/internal/Util;->getApplicationName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Message"

    const-string v2, "Confirmation message goes here."

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    const-string v2, "Full Width Buttons"

    invoke-virtual {v0, v2, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v2, "Show Close Button"

    invoke-virtual {v0, v2, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Primary Text"

    const-string v2, "OK"

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Secondary Text"

    const-string v2, ""

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Hero Image"

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->withFile(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Primary Action"

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3}, Lcom/leanplum/ActionArgs;->withAction(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Secondary Action"

    invoke-virtual {v0, v1, v3}, Lcom/leanplum/ActionArgs;->withAction(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    const-string v1, "Offers"

    invoke-virtual {v0, v1, v2}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object v0

    new-instance v1, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog$register$1;

    invoke-direct {v1, p0, p1}, Lcom/leanplum/messagetemplates/OperaSubscriptionDialog$register$1;-><init>(Landroid/content/Context;Ltcl;)V

    const-string p0, "Subscription Dialog"

    const/4 p1, 0x3

    invoke-static {p0, p1, v0, v1}, Lcom/leanplum/Leanplum;->defineAction(Ljava/lang/String;ILcom/leanplum/ActionArgs;Lcom/leanplum/callbacks/ActionCallback;)V

    return-void
.end method
