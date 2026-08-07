.class public Lcom/tantanapp/beatles/v2/data/MonitorException;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private module:Ljava/lang/String;

.field private stacktrace:Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;

.field private threadId:Ljava/lang/Long;

.field private threadName:Ljava/lang/String;

.field private type:Ljava/lang/String;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getModule()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorException;->module:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStacktrace()Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorException;->stacktrace:Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThreadId()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorException;->threadId:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThreadName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorException;->threadName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorException;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getValue()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorException;->value:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setModule(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorException;->module:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setStacktrace(Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorException;->stacktrace:Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;

    .line 2
    .line 3
    return-void
.end method

.method public setThreadId(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorException;->threadId:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setThreadName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorException;->threadName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setType(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorException;->type:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorException;->value:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
