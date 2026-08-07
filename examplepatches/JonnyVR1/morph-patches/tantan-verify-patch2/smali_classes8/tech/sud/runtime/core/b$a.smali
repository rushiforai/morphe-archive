.class Ltech/sud/runtime/core/b$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ltech/sud/runtime/core/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation


# instance fields
.field a:Ltech/sud/runtime/core/b;

.field b:Z


# direct methods
.method private constructor <init>(Ltech/sud/runtime/core/b;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ltech/sud/runtime/core/b$a;->b:Z

    .line 6
    .line 7
    iput-object p1, p0, Ltech/sud/runtime/core/b$a;->a:Ltech/sud/runtime/core/b;

    .line 8
    .line 9
    return-void
.end method

.method public synthetic constructor <init>(Ltech/sud/runtime/core/b;Ltech/sud/runtime/core/b$1;)V
    .locals 0

    .line 10
    invoke-direct {p0, p1}, Ltech/sud/runtime/core/b$a;-><init>(Ltech/sud/runtime/core/b;)V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ltech/sud/runtime/core/b$a;->a:Ltech/sud/runtime/core/b;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-static {v1}, Ltech/sud/runtime/core/b;->h(Ltech/sud/runtime/core/b;)Landroid/app/Activity;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p1, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Ltech/sud/runtime/core/b$a;->a:Ltech/sud/runtime/core/b;

    .line 20
    .line 21
    new-instance v1, Ltech/sud/runtime/core/b$a$3;

    .line 22
    .line 23
    invoke-direct {v1, p0, v0, p0}, Ltech/sud/runtime/core/b$a$3;-><init>(Ltech/sud/runtime/core/b$a;Landroid/app/Application;Ltech/sud/runtime/core/b$a;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, v1}, Ltech/sud/runtime/core/b;->a(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/b$a;->a:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ltech/sud/runtime/core/b;->h(Ltech/sud/runtime/core/b;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ltech/sud/runtime/core/b$a;->a:Ltech/sud/runtime/core/b;

    .line 16
    .line 17
    new-instance v0, Ltech/sud/runtime/core/b$a$2;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ltech/sud/runtime/core/b$a$2;-><init>(Ltech/sud/runtime/core/b$a;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ltech/sud/runtime/core/b;->a(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/core/b$a;->a:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ltech/sud/runtime/core/b;->h(Ltech/sud/runtime/core/b;)Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Ltech/sud/runtime/core/b$a;->a:Ltech/sud/runtime/core/b;

    .line 16
    .line 17
    new-instance v0, Ltech/sud/runtime/core/b$a$1;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Ltech/sud/runtime/core/b$a$1;-><init>(Ltech/sud/runtime/core/b$a;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Ltech/sud/runtime/core/b;->a(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onActivityStarted(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method

.method public onActivityStopped(Landroid/app/Activity;)V
    .locals 0

    return-void
.end method
