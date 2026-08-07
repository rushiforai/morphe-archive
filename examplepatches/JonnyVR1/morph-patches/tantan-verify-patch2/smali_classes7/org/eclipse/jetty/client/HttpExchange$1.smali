.class Lorg/eclipse/jetty/client/HttpExchange$1;
.super Lorg/eclipse/jetty/util/thread/Timeout$Task;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/client/HttpExchange;->scheduleTimeout(Lorg/eclipse/jetty/client/HttpDestination;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/client/HttpExchange;

.field final synthetic val$destination:Lorg/eclipse/jetty/client/HttpDestination;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/client/HttpExchange;Lorg/eclipse/jetty/client/HttpDestination;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/client/HttpExchange$1;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/eclipse/jetty/client/HttpExchange$1;->val$destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/eclipse/jetty/util/thread/Timeout$Task;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public expired()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/client/HttpExchange$1;->this$0:Lorg/eclipse/jetty/client/HttpExchange;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/eclipse/jetty/client/HttpExchange$1;->val$destination:Lorg/eclipse/jetty/client/HttpDestination;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/eclipse/jetty/client/HttpExchange;->expire(Lorg/eclipse/jetty/client/HttpDestination;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
