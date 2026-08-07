.class public Lcom/tantanapp/beatles/monitor/CrashInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private crashMessage:Ljava/lang/String;

.field private crashName:Ljava/lang/String;

.field private crashStackTrace:Ljava/lang/String;

.field private crashThread:Ljava/lang/Thread;

.field private stackInfos:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/monitor/StackInfo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/beatles/monitor/CrashInfo;->stackInfos:Ljava/util/List;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public getCrashMessage()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/monitor/CrashInfo;->crashMessage:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCrashName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/monitor/CrashInfo;->crashName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCrashStackTrace()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/monitor/CrashInfo;->crashStackTrace:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCrashThread()Ljava/lang/Thread;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/monitor/CrashInfo;->crashThread:Ljava/lang/Thread;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStackInfos()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/monitor/StackInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/monitor/CrashInfo;->stackInfos:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public setCrashMessage(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/monitor/CrashInfo;->crashMessage:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setCrashName(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/monitor/CrashInfo;->crashName:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setCrashStackTrace(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/monitor/CrashInfo;->crashStackTrace:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setCrashThread(Ljava/lang/Thread;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/monitor/CrashInfo;->crashThread:Ljava/lang/Thread;

    .line 2
    .line 3
    return-void
.end method

.method public setStackInfos(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/tantanapp/beatles/monitor/StackInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/monitor/CrashInfo;->stackInfos:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method
