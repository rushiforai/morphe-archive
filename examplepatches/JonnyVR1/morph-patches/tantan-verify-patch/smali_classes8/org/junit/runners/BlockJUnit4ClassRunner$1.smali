.class Lorg/junit/runners/BlockJUnit4ClassRunner$1;
.super Lorg/junit/internal/runners/model/ReflectiveCallable;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/runners/BlockJUnit4ClassRunner;->methodBlock(Lorg/junit/runners/model/FrameworkMethod;)Lorg/junit/runners/model/Statement;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/runners/BlockJUnit4ClassRunner;


# direct methods
.method public constructor <init>(Lorg/junit/runners/BlockJUnit4ClassRunner;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/junit/runners/BlockJUnit4ClassRunner$1;->this$0:Lorg/junit/runners/BlockJUnit4ClassRunner;

    .line 2
    .line 3
    invoke-direct {p0}, Lorg/junit/internal/runners/model/ReflectiveCallable;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public runReflectiveCall()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lorg/junit/runners/BlockJUnit4ClassRunner$1;->this$0:Lorg/junit/runners/BlockJUnit4ClassRunner;

    .line 2
    .line 3
    invoke-virtual {p0}, Lorg/junit/runners/BlockJUnit4ClassRunner;->createTest()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
