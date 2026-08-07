.class Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/io/nio/SelectorManager$ChangeTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;->dump(Ljava/lang/Appendable;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

.field final synthetic val$dump:Ljava/util/ArrayList;

.field final synthetic val$latch:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;Ljava/util/ArrayList;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet$3;->this$1:Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet$3;->val$dump:Ljava/util/ArrayList;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet$3;->val$latch:Ljava/util/concurrent/CountDownLatch;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet$3;->this$1:Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet$3;->val$dump:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet;->dumpKeyState(Ljava/util/List;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/SelectorManager$SelectSet$3;->val$latch:Ljava/util/concurrent/CountDownLatch;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
