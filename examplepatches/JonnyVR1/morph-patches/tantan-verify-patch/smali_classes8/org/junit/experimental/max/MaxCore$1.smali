.class Lorg/junit/experimental/max/MaxCore$1;
.super Lorg/junit/runner/Request;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/experimental/max/MaxCore;->constructLeafRequest(Ljava/util/List;)Lorg/junit/runner/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/experimental/max/MaxCore;

.field final synthetic val$runners:Ljava/util/List;


# direct methods
.method public constructor <init>(Lorg/junit/experimental/max/MaxCore;Ljava/util/List;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/junit/experimental/max/MaxCore$1;->this$0:Lorg/junit/experimental/max/MaxCore;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/junit/experimental/max/MaxCore$1;->val$runners:Ljava/util/List;

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/junit/runner/Request;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getRunner()Lorg/junit/runner/Runner;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    new-instance v1, Lorg/junit/experimental/max/MaxCore$1$1;

    .line 3
    .line 4
    iget-object v2, p0, Lorg/junit/experimental/max/MaxCore$1;->val$runners:Ljava/util/List;

    .line 5
    .line 6
    invoke-direct {v1, p0, v0, v2}, Lorg/junit/experimental/max/MaxCore$1$1;-><init>(Lorg/junit/experimental/max/MaxCore$1;Ljava/lang/Class;Ljava/util/List;)V
    :try_end_0
    .catch Lorg/junit/runners/model/InitializationError; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    .line 8
    .line 9
    return-object v1

    .line 10
    :catch_0
    move-exception p0

    .line 11
    new-instance v1, Lorg/junit/internal/runners/ErrorReportingRunner;

    .line 12
    .line 13
    invoke-direct {v1, v0, p0}, Lorg/junit/internal/runners/ErrorReportingRunner;-><init>(Ljava/lang/Class;Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    return-object v1
.end method
