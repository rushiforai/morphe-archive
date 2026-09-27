.class Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference$1;
.super Ljava/lang/Object;
.source "DeepSeekModelPreference.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 5

    .line 43
    new-instance p0, Ljava/lang/Thread;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "DeepSeekModelCatalog-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lapp/yydarlinker/deepseekcaptions/DeepSeekModelPreference;->-$$Nest$sfgetTHREAD_IDS()Ljava/util/concurrent/atomic/AtomicLong;

    move-result-object v1

    .line 45
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p1, 0x1

    .line 47
    invoke-virtual {p0, p1}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object p0
.end method
