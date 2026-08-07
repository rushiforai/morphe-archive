.class Lorg/junit/experimental/max/MaxCore$1$1;
.super Lorg/junit/runners/Suite;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/experimental/max/MaxCore$1;->getRunner()Lorg/junit/runner/Runner;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lorg/junit/experimental/max/MaxCore$1;


# direct methods
.method public constructor <init>(Lorg/junit/experimental/max/MaxCore$1;Ljava/lang/Class;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/junit/runners/model/InitializationError;
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/junit/experimental/max/MaxCore$1$1;->this$1:Lorg/junit/experimental/max/MaxCore$1;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3}, Lorg/junit/runners/Suite;-><init>(Ljava/lang/Class;Ljava/util/List;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
