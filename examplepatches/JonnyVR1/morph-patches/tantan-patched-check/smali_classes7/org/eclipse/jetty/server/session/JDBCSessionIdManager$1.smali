.class Lorg/eclipse/jetty/server/session/JDBCSessionIdManager$1;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/server/session/JDBCSessionIdManager;->setScavengeInterval(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/session/JDBCSessionIdManager;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/session/JDBCSessionIdManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/session/JDBCSessionIdManager$1;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionIdManager;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/JDBCSessionIdManager$1;->this$0:Lorg/eclipse/jetty/server/session/JDBCSessionIdManager;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/eclipse/jetty/server/session/JDBCSessionIdManager;->access$000(Lorg/eclipse/jetty/server/session/JDBCSessionIdManager;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
