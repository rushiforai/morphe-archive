.class Lorg/eclipse/jetty/client/HttpClient$LocalQueuedThreadPool;
.super Lorg/eclipse/jetty/util/thread/QueuedThreadPool;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/eclipse/jetty/client/HttpClient;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LocalQueuedThreadPool"
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/eclipse/jetty/util/thread/QueuedThreadPool;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public synthetic constructor <init>(Lorg/eclipse/jetty/client/HttpClient$1;)V
    .locals 0

    .line 5
    invoke-direct {p0}, Lorg/eclipse/jetty/client/HttpClient$LocalQueuedThreadPool;-><init>()V

    return-void
.end method
