.class Lorg/eclipse/jetty/server/session/HashSessionManager$2;
.super Ljava/util/TimerTask;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/server/session/HashSessionManager;->setScavengePeriod(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/eclipse/jetty/server/session/HashSessionManager;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/server/session/HashSessionManager;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/server/session/HashSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/HashSessionManager;

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
    iget-object p0, p0, Lorg/eclipse/jetty/server/session/HashSessionManager$2;->this$0:Lorg/eclipse/jetty/server/session/HashSessionManager;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/eclipse/jetty/server/session/HashSessionManager;->scavenge()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
