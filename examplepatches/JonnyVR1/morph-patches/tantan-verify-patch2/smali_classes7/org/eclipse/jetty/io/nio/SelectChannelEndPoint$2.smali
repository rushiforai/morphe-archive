.class Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;->checkIdleTimestamp(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;

.field final synthetic val$idleForMs:J


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;J)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint$2;->this$0:Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;

    .line 2
    .line 3
    iput-wide p2, p0, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint$2;->val$idleForMs:J

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint$2;->this$0:Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;

    .line 3
    .line 4
    iget-wide v2, p0, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint$2;->val$idleForMs:J

    .line 5
    .line 6
    invoke-virtual {v1, v2, v3}, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;->onIdleExpired(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint$2;->this$0:Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;->setCheckForIdle(Z)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception v1

    .line 16
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint$2;->this$0:Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/nio/SelectChannelEndPoint;->setCheckForIdle(Z)V

    .line 19
    .line 20
    .line 21
    throw v1
.end method
