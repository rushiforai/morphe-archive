.class public abstract Lcom/leanplum/callbacks/InboxChangedCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract inboxChanged()V
.end method

.method public run()V
    .registers 1

    invoke-virtual {p0}, Lcom/leanplum/callbacks/InboxChangedCallback;->inboxChanged()V

    return-void
.end method
