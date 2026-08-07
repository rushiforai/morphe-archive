.class public Lcom/tantanapp/beatles/monitor/StackInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private stackTrace:Ljava/lang/String;

.field private threadId:J

.field private threadName:Ljava/lang/String;


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
.method public getStackTrace()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/monitor/StackInfo;->stackTrace:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getThreadId()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/tantanapp/beatles/monitor/StackInfo;->threadId:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getThreadName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/monitor/StackInfo;->threadName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public setStackTrace(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/monitor/StackInfo;->stackTrace:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setThreadId(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/beatles/monitor/StackInfo;->threadId:J

    .line 2
    .line 3
    return-void
.end method

.method public setThreadName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/monitor/StackInfo;->threadName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method
