.class public Lcom/leanplum/messagetemplates/actions/AlertMessage;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/messagetemplates/MessageTemplate;


# static fields
.field private static final ALERT:Ljava/lang/String; = "Alert"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic a(Lcom/leanplum/ActionContext;Landroid/content/DialogInterface;I)V
    .registers 3

    invoke-static {p0, p1, p2}, Lcom/leanplum/messagetemplates/actions/AlertMessage;->lambda$handleAction$0(Lcom/leanplum/ActionContext;Landroid/content/DialogInterface;I)V

    return-void
.end method

.method private static synthetic lambda$handleAction$0(Lcom/leanplum/ActionContext;Landroid/content/DialogInterface;I)V
    .registers 3

    const-string p1, "Dismiss action"

    invoke-virtual {p0, p1}, Lcom/leanplum/ActionContext;->runActionNamed(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public createActionArgs(Landroid/content/Context;)Lcom/leanplum/ActionArgs;
    .registers 3
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance p0, Lcom/leanplum/ActionArgs;

    invoke-direct {p0}, Lcom/leanplum/ActionArgs;-><init>()V

    const-string v0, "Title"

    invoke-static {p1}, Lcom/leanplum/internal/Util;->getApplicationName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string p1, "Message"

    const-string v0, "Alert message goes here."

    invoke-virtual {p0, p1, v0}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string p1, "Dismiss text"

    const-string v0, "OK"

    invoke-virtual {p0, p1, v0}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string p1, "Dismiss action"

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/leanplum/ActionArgs;->withAction(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const-string p0, "Alert"

    return-object p0
.end method

.method public handleAction(Lcom/leanplum/ActionContext;)V
    .registers 5

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p0

    if-eqz p0, :cond_40

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_40

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string p0, "Title"

    invoke-virtual {p1, p0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string v0, "Message"

    invoke-virtual {p1, v0}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    const-string v1, "Dismiss text"

    invoke-virtual {p1, v1}, Lcom/leanplum/ActionContext;->stringNamed(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Loz0;

    invoke-direct {v2, p1, v0}, Loz0;-><init>(Lcom/leanplum/ActionContext;B)V

    invoke-virtual {p0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object p0

    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    :cond_40
    return-void
.end method
