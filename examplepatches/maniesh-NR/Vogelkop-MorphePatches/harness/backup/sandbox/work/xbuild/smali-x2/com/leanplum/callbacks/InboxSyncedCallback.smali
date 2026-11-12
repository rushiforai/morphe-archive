.class public abstract Lcom/leanplum/callbacks/InboxSyncedCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private success:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract onForceContentUpdate(Z)V
.end method

.method public run()V
    .registers 2

    iget-boolean v0, p0, Lcom/leanplum/callbacks/InboxSyncedCallback;->success:Z

    invoke-virtual {p0, v0}, Lcom/leanplum/callbacks/InboxSyncedCallback;->onForceContentUpdate(Z)V

    return-void
.end method

.method public setSuccess(Z)V
    .registers 2

    iput-boolean p1, p0, Lcom/leanplum/callbacks/InboxSyncedCallback;->success:Z

    return-void
.end method
