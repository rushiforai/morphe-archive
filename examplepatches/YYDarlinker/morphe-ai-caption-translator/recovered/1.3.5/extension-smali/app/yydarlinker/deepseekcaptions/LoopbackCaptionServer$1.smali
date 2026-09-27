.class Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$1;
.super Ljava/lang/Object;
.source "LoopbackCaptionServer.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;


# direct methods
.method constructor <init>(Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 55
    iput-object p1, p0, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer$1;->this$0:Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 4

    .line 57
    new-instance p0, Ljava/lang/Thread;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DeepSeekCaptionSink-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/LoopbackCaptionServer;->-$$Nest$sfgetTHREAD_IDS()Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v1

    .line 59
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 61
    invoke-virtual {p0, p1}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object p0
.end method
