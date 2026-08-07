.class Lorg/junit/internal/runners/JUnit4ClassRunner$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/internal/runners/JUnit4ClassRunner;->run(Lorg/junit/runner/notification/RunNotifier;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/internal/runners/JUnit4ClassRunner;

.field final synthetic val$notifier:Lorg/junit/runner/notification/RunNotifier;


# direct methods
.method public constructor <init>(Lorg/junit/internal/runners/JUnit4ClassRunner;Lorg/junit/runner/notification/RunNotifier;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/junit/internal/runners/JUnit4ClassRunner$1;->this$0:Lorg/junit/internal/runners/JUnit4ClassRunner;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/junit/internal/runners/JUnit4ClassRunner$1;->val$notifier:Lorg/junit/runner/notification/RunNotifier;

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
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner$1;->this$0:Lorg/junit/internal/runners/JUnit4ClassRunner;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/junit/internal/runners/JUnit4ClassRunner$1;->val$notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/junit/internal/runners/JUnit4ClassRunner;->runMethods(Lorg/junit/runner/notification/RunNotifier;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
