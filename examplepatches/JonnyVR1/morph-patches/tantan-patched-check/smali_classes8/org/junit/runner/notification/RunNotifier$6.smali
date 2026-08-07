.class Lorg/junit/runner/notification/RunNotifier$6;
.super Lorg/junit/runner/notification/RunNotifier$SafeNotifier;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/runner/notification/RunNotifier;->fireTestIgnored(Lorg/junit/runner/Description;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/runner/notification/RunNotifier;

.field final synthetic val$description:Lorg/junit/runner/Description;


# direct methods
.method public constructor <init>(Lorg/junit/runner/notification/RunNotifier;Lorg/junit/runner/Description;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/junit/runner/notification/RunNotifier$6;->this$0:Lorg/junit/runner/notification/RunNotifier;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/junit/runner/notification/RunNotifier$6;->val$description:Lorg/junit/runner/Description;

    .line 4
    .line 5
    invoke-direct {p0, p1}, Lorg/junit/runner/notification/RunNotifier$SafeNotifier;-><init>(Lorg/junit/runner/notification/RunNotifier;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public notifyListener(Lorg/junit/runner/notification/RunListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/junit/runner/notification/RunNotifier$6;->val$description:Lorg/junit/runner/Description;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lorg/junit/runner/notification/RunListener;->testIgnored(Lorg/junit/runner/Description;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
