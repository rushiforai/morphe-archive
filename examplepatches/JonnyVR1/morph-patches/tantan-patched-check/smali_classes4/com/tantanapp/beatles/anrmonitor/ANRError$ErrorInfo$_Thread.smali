.class Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;
.super Ljava/lang/Throwable;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "_Thread"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;


# direct methods
.method private constructor <init>(Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;->this$0:Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;->access$000(Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {p0, p1, p2}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public synthetic constructor <init>(Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;Lcom/tantanapp/beatles/anrmonitor/ANRError$a;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;-><init>(Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;)V

    return-void
.end method


# virtual methods
.method public fillInStackTrace()Ljava/lang/Throwable;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo$_Thread;->this$0:Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;->access$100(Lcom/tantanapp/beatles/anrmonitor/ANRError$ErrorInfo;)[Ljava/lang/StackTraceElement;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/Throwable;->setStackTrace([Ljava/lang/StackTraceElement;)V

    .line 8
    .line 9
    .line 10
    return-object p0
.end method
