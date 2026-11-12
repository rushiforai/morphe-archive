.class public interface abstract Lcom/leanplum/messagetemplates/MessageTemplate;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract createActionArgs(Landroid/content/Context;)Lcom/leanplum/ActionArgs;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public abstract getName()Ljava/lang/String;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end method

.method public abstract handleAction(Lcom/leanplum/ActionContext;)V
.end method

.method public waitFilesAndVariables()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method
