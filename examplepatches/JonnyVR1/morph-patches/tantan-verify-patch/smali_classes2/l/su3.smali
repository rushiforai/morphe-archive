.class public Ll/su3;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# instance fields
.field public final a:Ll/e1m;

.field public final b:Ll/psw;

.field public final c:Ljava/util/concurrent/Executor;

.field public final d:Ll/psw;

.field protected final e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

.field protected f:Ljava/lang/String;

.field private final g:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ll/ml80;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/psw;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/psw;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/su3;->b:Ll/psw;

    .line 10
    .line 11
    new-instance v1, Ll/pox;

    .line 12
    .line 13
    invoke-direct {v1}, Ll/pox;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v1, p0, Ll/su3;->c:Ljava/util/concurrent/Executor;

    .line 17
    .line 18
    iput-object v0, p0, Ll/su3;->d:Ll/psw;

    .line 19
    .line 20
    new-instance v0, Ljava/util/HashMap;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Ll/su3;->g:Ljava/util/HashMap;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Ll/su3;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 29
    .line 30
    new-instance v0, Ll/e1m;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/e1m;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/su3;->a:Ll/e1m;

    .line 36
    .line 37
    sget-object v0, Ll/o4k0;->INSTANCE:Ll/o4k0;

    .line 38
    .line 39
    invoke-virtual {v0}, Ll/o4k0;->c()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iput-object v0, p0, Ll/su3;->f:Ljava/lang/String;

    .line 44
    .line 45
    return-void
.end method

.method public constructor <init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;)V
    .locals 2

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    new-instance v0, Ll/psw;

    invoke-direct {v0}, Ll/psw;-><init>()V

    iput-object v0, p0, Ll/su3;->b:Ll/psw;

    .line 48
    new-instance v1, Ll/pox;

    invoke-direct {v1}, Ll/pox;-><init>()V

    iput-object v1, p0, Ll/su3;->c:Ljava/util/concurrent/Executor;

    .line 49
    iput-object v0, p0, Ll/su3;->d:Ll/psw;

    .line 50
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ll/su3;->g:Ljava/util/HashMap;

    .line 51
    iput-object p1, p0, Ll/su3;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 52
    new-instance p1, Ll/e1m;

    invoke-direct {p1}, Ll/e1m;-><init>()V

    iput-object p1, p0, Ll/su3;->a:Ll/e1m;

    return-void
.end method


# virtual methods
.method public a()Lcom/clevertap/android/sdk/task/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/clevertap/android/sdk/task/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/su3;->a:Ll/e1m;

    .line 2
    .line 3
    iget-object v1, p0, Ll/su3;->d:Ll/psw;

    .line 4
    .line 5
    const-string v2, "ioTask"

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1, v2}, Ll/su3;->f(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Ljava/lang/String;)Lcom/clevertap/android/sdk/task/Task;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public b()Lcom/clevertap/android/sdk/task/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/clevertap/android/sdk/task/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/su3;->a:Ll/e1m;

    .line 2
    .line 3
    const-string v1, "ioTaskNonUi"

    .line 4
    .line 5
    invoke-virtual {p0, v0, v0, v1}, Ll/su3;->f(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Ljava/lang/String;)Lcom/clevertap/android/sdk/task/Task;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public c()Lcom/clevertap/android/sdk/task/Task;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/clevertap/android/sdk/task/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/su3;->b:Ll/psw;

    .line 2
    .line 3
    iget-object v1, p0, Ll/su3;->d:Ll/psw;

    .line 4
    .line 5
    const-string v2, "Main"

    .line 6
    .line 7
    invoke-virtual {p0, v0, v1, v2}, Ll/su3;->f(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Ljava/lang/String;)Lcom/clevertap/android/sdk/task/Task;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public d()Lcom/clevertap/android/sdk/task/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/clevertap/android/sdk/task/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/su3;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Ll/su3;->f:Ljava/lang/String;

    .line 11
    .line 12
    :goto_0
    invoke-virtual {p0, v0}, Ll/su3;->e(Ljava/lang/String;)Lcom/clevertap/android/sdk/task/Task;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public e(Ljava/lang/String;)Lcom/clevertap/android/sdk/task/Task;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/String;",
            ")",
            "Lcom/clevertap/android/sdk/task/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Ll/su3;->g:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ll/ml80;

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/ml80;

    .line 14
    .line 15
    invoke-direct {v0}, Ll/ml80;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/su3;->g:Ljava/util/HashMap;

    .line 19
    .line 20
    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Ll/su3;->d:Ll/psw;

    .line 24
    .line 25
    const-string v1, "PostAsyncSafely"

    .line 26
    .line 27
    invoke-virtual {p0, v0, p1, v1}, Ll/su3;->f(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Ljava/lang/String;)Lcom/clevertap/android/sdk/task/Task;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_1
    const-string p0, "Tag can\'t be null"

    .line 33
    .line 34
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 p0, 0x0

    .line 38
    return-object p0
.end method

.method public f(Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Ljava/lang/String;)Lcom/clevertap/android/sdk/task/Task;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TResult:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/Executor;",
            "Ljava/util/concurrent/Executor;",
            "Ljava/lang/String;",
            ")",
            "Lcom/clevertap/android/sdk/task/Task<",
            "TTResult;>;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    new-instance v0, Lcom/clevertap/android/sdk/task/Task;

    .line 6
    .line 7
    iget-object p0, p0, Ll/su3;->e:Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/clevertap/android/sdk/task/Task;-><init>(Lcom/clevertap/android/sdk/CleverTapInstanceConfig;Ljava/util/concurrent/Executor;Ljava/util/concurrent/Executor;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    const-string p0, "Can\'t create task "

    .line 14
    .line 15
    const-string p1, " with null executors"

    .line 16
    .line 17
    invoke-static {p0, p3, p1}, Ll/v1d0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method
