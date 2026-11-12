.class public Lcom/leanplum/messagetemplates/actions/CenterPopupMessage;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/leanplum/messagetemplates/MessageTemplate;


# static fields
.field private static final CENTER_POPUP:Ljava/lang/String; = "Center Popup"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createActionArgs(Landroid/content/Context;)Lcom/leanplum/ActionArgs;
    .registers 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-static {p1}, Lcom/leanplum/messagetemplates/options/CenterPopupOptions;->toArgs(Landroid/content/Context;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .registers 1
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const-string p0, "Center Popup"

    return-object p0
.end method

.method public handleAction(Lcom/leanplum/ActionContext;)V
    .registers 3

    invoke-static {}, Lcom/leanplum/LeanplumActivityHelper;->getCurrentActivity()Landroid/app/Activity;

    move-result-object p0

    if-eqz p0, :cond_19

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_19

    new-instance v0, Lcom/leanplum/messagetemplates/options/CenterPopupOptions;

    invoke-direct {v0, p1}, Lcom/leanplum/messagetemplates/options/CenterPopupOptions;-><init>(Lcom/leanplum/ActionContext;)V

    new-instance p1, Lcom/leanplum/messagetemplates/controllers/CenterPopupController;

    invoke-direct {p1, p0, v0}, Lcom/leanplum/messagetemplates/controllers/CenterPopupController;-><init>(Landroid/app/Activity;Lcom/leanplum/messagetemplates/options/CenterPopupOptions;)V

    invoke-virtual {p1}, Landroid/app/Dialog;->show()V

    :cond_19
    return-void
.end method

.method public waitFilesAndVariables()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method
