.class public abstract Lcom/leanplum/callbacks/MessageDisplayedCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private messageArchiveData:Lcom/leanplum/models/MessageArchiveData;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public abstract messageDisplayed(Lcom/leanplum/models/MessageArchiveData;)V
.end method

.method public run()V
    .registers 2

    iget-object v0, p0, Lcom/leanplum/callbacks/MessageDisplayedCallback;->messageArchiveData:Lcom/leanplum/models/MessageArchiveData;

    invoke-virtual {p0, v0}, Lcom/leanplum/callbacks/MessageDisplayedCallback;->messageDisplayed(Lcom/leanplum/models/MessageArchiveData;)V

    return-void
.end method

.method public setMessageArchiveData(Lcom/leanplum/models/MessageArchiveData;)V
    .registers 2

    iput-object p1, p0, Lcom/leanplum/callbacks/MessageDisplayedCallback;->messageArchiveData:Lcom/leanplum/models/MessageArchiveData;

    return-void
.end method
