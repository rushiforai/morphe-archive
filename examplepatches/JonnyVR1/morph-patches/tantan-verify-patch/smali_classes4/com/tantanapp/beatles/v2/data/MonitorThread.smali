.class public final Lcom/tantanapp/beatles/v2/data/MonitorThread;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/Keep;
.end annotation


# instance fields
.field private crashed:Ljava/lang/Boolean;

.field private current:Ljava/lang/Boolean;

.field private id:Ljava/lang/Long;

.field private name:Ljava/lang/String;

.field private stacktrace:Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;

.field private state:Ljava/lang/String;


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
.method public getId()Ljava/lang/Long;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorThread;->id:Ljava/lang/Long;

    .line 2
    .line 3
    return-object p0
.end method

.method public getName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorThread;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStacktrace()Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorThread;->stacktrace:Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;

    .line 2
    .line 3
    return-object p0
.end method

.method public getState()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorThread;->state:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public isCrashed()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorThread;->crashed:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public isCurrent()Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/v2/data/MonitorThread;->current:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCrashed(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorThread;->crashed:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-void
.end method

.method public setCurrent(Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorThread;->current:Ljava/lang/Boolean;

    .line 2
    .line 3
    return-void
.end method

.method public setId(Ljava/lang/Long;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorThread;->id:Ljava/lang/Long;

    .line 2
    .line 3
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorThread;->name:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setStacktrace(Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorThread;->stacktrace:Lcom/tantanapp/beatles/v2/data/MonitorStackTrace;

    .line 2
    .line 3
    return-void
.end method

.method public setState(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/v2/data/MonitorThread;->state:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
