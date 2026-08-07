.class Lorg/junit/runners/ParentRunner$2;
.super Lorg/junit/runners/model/Statement;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/runners/ParentRunner;->childrenInvoker(Lorg/junit/runner/notification/RunNotifier;)Lorg/junit/runners/model/Statement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/runners/ParentRunner;

.field final synthetic val$notifier:Lorg/junit/runner/notification/RunNotifier;


# direct methods
.method public constructor <init>(Lorg/junit/runners/ParentRunner;Lorg/junit/runner/notification/RunNotifier;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/junit/runners/ParentRunner$2;->this$0:Lorg/junit/runners/ParentRunner;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/junit/runners/ParentRunner$2;->val$notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/junit/runners/model/Statement;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public evaluate()V
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/junit/runners/ParentRunner$2;->this$0:Lorg/junit/runners/ParentRunner;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/junit/runners/ParentRunner$2;->val$notifier:Lorg/junit/runner/notification/RunNotifier;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lorg/junit/runners/ParentRunner;->access$000(Lorg/junit/runners/ParentRunner;Lorg/junit/runner/notification/RunNotifier;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
