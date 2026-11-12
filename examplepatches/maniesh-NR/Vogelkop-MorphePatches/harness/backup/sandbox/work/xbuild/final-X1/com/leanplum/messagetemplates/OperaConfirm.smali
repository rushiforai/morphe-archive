.class public Lcom/leanplum/messagetemplates/OperaConfirm;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final NAME:Ljava/lang/String; = "Confirm"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static bridge synthetic a(Lcom/leanplum/ActionContext;Lx5f;)Lb87;
    .registers 2

    invoke-static {p0, p1}, Lcom/leanplum/messagetemplates/OperaConfirm;->createDialogRequest(Lcom/leanplum/ActionContext;Lorm;)Lb87;

    move-result-object p0

    return-object p0
.end method

.method private static createDialogRequest(Lcom/leanplum/ActionContext;Lorm;)Lb87;
    .registers 4
    .param p0    # Lcom/leanplum/ActionContext;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p1    # Lorm;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    new-instance v0, Lcom/leanplum/messagetemplates/OperaConfirm$1;

    const/4 v1, 0x0

    invoke-direct {v0, v1, p0, p1}, Lcom/leanplum/messagetemplates/OperaConfirm$1;-><init>(ZLcom/leanplum/ActionContext;Lorm;)V

    return-object v0
.end method

.method public static register(Landroid/content/Context;)V
    .registers 4

    new-instance v0, Lcom/leanplum/ActionArgs;

    invoke-direct {v0}, Lcom/leanplum/ActionArgs;-><init>()V

    const-string v1, "Title"

    invoke-static {p0}, Lcom/leanplum/internal/Util;->getApplicationName(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Message"

    const-string v1, "Confirmation message goes here."

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Accept text"

    const-string v1, "Yes"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Cancel text"

    const-string v1, "No"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->with(Ljava/lang/String;Ljava/lang/Object;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Accept action"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->withAction(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    const-string v0, "Cancel action"

    invoke-virtual {p0, v0, v1}, Lcom/leanplum/ActionArgs;->withAction(Ljava/lang/String;Ljava/lang/String;)Lcom/leanplum/ActionArgs;

    move-result-object p0

    new-instance v0, Lcom/leanplum/messagetemplates/OperaConfirm$2;

    invoke-direct {v0}, Lcom/leanplum/messagetemplates/OperaConfirm$2;-><init>()V

    const-string v1, "Confirm"

    const/4 v2, 0x3

    invoke-static {v1, v2, p0, v0}, Lcom/leanplum/Leanplum;->defineAction(Ljava/lang/String;ILcom/leanplum/ActionArgs;Lcom/leanplum/callbacks/ActionCallback;)V

    return-void
.end method
