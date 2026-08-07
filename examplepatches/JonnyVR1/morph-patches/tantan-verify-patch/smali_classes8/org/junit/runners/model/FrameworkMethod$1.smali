.class Lorg/junit/runners/model/FrameworkMethod$1;
.super Lorg/junit/internal/runners/model/ReflectiveCallable;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lorg/junit/runners/model/FrameworkMethod;->invokeExplosively(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lorg/junit/runners/model/FrameworkMethod;

.field final synthetic val$params:[Ljava/lang/Object;

.field final synthetic val$target:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lorg/junit/runners/model/FrameworkMethod;Ljava/lang/Object;[Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lorg/junit/runners/model/FrameworkMethod$1;->this$0:Lorg/junit/runners/model/FrameworkMethod;

    .line 2
    .line 3
    iput-object p2, p0, Lorg/junit/runners/model/FrameworkMethod$1;->val$target:Ljava/lang/Object;

    .line 4
    .line 5
    iput-object p3, p0, Lorg/junit/runners/model/FrameworkMethod$1;->val$params:[Ljava/lang/Object;

    .line 6
    .line 7
    invoke-direct {p0}, Lorg/junit/internal/runners/model/ReflectiveCallable;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public runReflectiveCall()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lorg/junit/runners/model/FrameworkMethod$1;->this$0:Lorg/junit/runners/model/FrameworkMethod;

    .line 2
    .line 3
    invoke-static {v0}, Lorg/junit/runners/model/FrameworkMethod;->access$000(Lorg/junit/runners/model/FrameworkMethod;)Ljava/lang/reflect/Method;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lorg/junit/runners/model/FrameworkMethod$1;->val$target:Ljava/lang/Object;

    .line 8
    .line 9
    iget-object p0, p0, Lorg/junit/runners/model/FrameworkMethod$1;->val$params:[Ljava/lang/Object;

    .line 10
    .line 11
    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method
