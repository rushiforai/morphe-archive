.class Lorg/junit/rules/Stopwatch$InternalWatcher;
.super Lorg/junit/rules/TestWatcher;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/junit/rules/Stopwatch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "InternalWatcher"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/rules/Stopwatch;


# direct methods
.method private constructor <init>(Lorg/junit/rules/Stopwatch;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/junit/rules/Stopwatch$InternalWatcher;->this$0:Lorg/junit/rules/Stopwatch;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/junit/rules/TestWatcher;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Lorg/junit/rules/Stopwatch;Lorg/junit/rules/Stopwatch$1;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Lorg/junit/rules/Stopwatch$InternalWatcher;-><init>(Lorg/junit/rules/Stopwatch;)V

    return-void
.end method


# virtual methods
.method public failed(Ljava/lang/Throwable;Lorg/junit/runner/Description;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/junit/rules/Stopwatch$InternalWatcher;->this$0:Lorg/junit/rules/Stopwatch;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/junit/rules/Stopwatch;->access$300(Lorg/junit/rules/Stopwatch;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/junit/rules/Stopwatch$InternalWatcher;->this$0:Lorg/junit/rules/Stopwatch;

    .line 7
    .line 8
    invoke-static {p0}, Lorg/junit/rules/Stopwatch;->access$200(Lorg/junit/rules/Stopwatch;)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    invoke-virtual {p0, v0, v1, p1, p2}, Lorg/junit/rules/Stopwatch;->failed(JLjava/lang/Throwable;Lorg/junit/runner/Description;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public finished(Lorg/junit/runner/Description;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/junit/rules/Stopwatch$InternalWatcher;->this$0:Lorg/junit/rules/Stopwatch;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/junit/rules/Stopwatch;->access$200(Lorg/junit/rules/Stopwatch;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    invoke-virtual {p0, v0, v1, p1}, Lorg/junit/rules/Stopwatch;->finished(JLorg/junit/runner/Description;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public skipped(Lorg/junit/AssumptionViolatedException;Lorg/junit/runner/Description;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/junit/rules/Stopwatch$InternalWatcher;->this$0:Lorg/junit/rules/Stopwatch;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/junit/rules/Stopwatch;->access$300(Lorg/junit/rules/Stopwatch;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/junit/rules/Stopwatch$InternalWatcher;->this$0:Lorg/junit/rules/Stopwatch;

    .line 7
    .line 8
    invoke-static {p0}, Lorg/junit/rules/Stopwatch;->access$200(Lorg/junit/rules/Stopwatch;)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    invoke-virtual {p0, v0, v1, p1, p2}, Lorg/junit/rules/Stopwatch;->skipped(JLorg/junit/AssumptionViolatedException;Lorg/junit/runner/Description;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public starting(Lorg/junit/runner/Description;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/junit/rules/Stopwatch$InternalWatcher;->this$0:Lorg/junit/rules/Stopwatch;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/junit/rules/Stopwatch;->access$100(Lorg/junit/rules/Stopwatch;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public succeeded(Lorg/junit/runner/Description;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/junit/rules/Stopwatch$InternalWatcher;->this$0:Lorg/junit/rules/Stopwatch;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/junit/rules/Stopwatch;->access$300(Lorg/junit/rules/Stopwatch;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lorg/junit/rules/Stopwatch$InternalWatcher;->this$0:Lorg/junit/rules/Stopwatch;

    .line 7
    .line 8
    invoke-static {p0}, Lorg/junit/rules/Stopwatch;->access$200(Lorg/junit/rules/Stopwatch;)J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    invoke-virtual {p0, v0, v1, p1}, Lorg/junit/rules/Stopwatch;->succeeded(JLorg/junit/runner/Description;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method
