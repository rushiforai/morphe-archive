.class Lcom/clevertap/android/sdk/task/d;
.super Lcom/clevertap/android/sdk/task/a;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TResult:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/clevertap/android/sdk/task/a<",
        "TTResult;>;"
    }
.end annotation


# instance fields
.field private final b:Ll/vo50;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vo50<",
            "TTResult;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/concurrent/Executor;Ll/vo50;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Executor;",
            "Ll/vo50<",
            "TTResult;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/task/a;-><init>(Ljava/util/concurrent/Executor;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/clevertap/android/sdk/task/d;->b:Ll/vo50;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic b(Lcom/clevertap/android/sdk/task/d;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/task/d;->b:Ll/vo50;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/vo50;->onSuccess(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTResult;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/clevertap/android/sdk/task/a;->a:Ljava/util/concurrent/Executor;

    .line 2
    .line 3
    new-instance v1, Lcom/clevertap/android/sdk/task/c;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/clevertap/android/sdk/task/c;-><init>(Lcom/clevertap/android/sdk/task/d;Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
