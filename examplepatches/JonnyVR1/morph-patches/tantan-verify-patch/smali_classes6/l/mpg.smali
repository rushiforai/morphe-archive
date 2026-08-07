.class public Ll/mpg;
.super Ll/k1i;
.source "SourceFile"

# interfaces
.implements Ll/npg;


# instance fields
.field public a:Ll/tog;

.field public b:Ll/k5h;


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/k1i;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Ll/mpg;->c(Landroid/app/Activity;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1, p2}, Ll/mpg;->d(Landroid/app/Activity;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ll/mpg;->f()V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Exception;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mpg;->b:Ll/k5h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/mpg;->b:Ll/k5h;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/k5h;->a(Ljava/lang/Exception;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public b()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mpg;->a:Ll/tog;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 10
    .line 11
    iget-object v1, p0, Ll/mpg;->a:Ll/tog;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/mpg;->b:Ll/k5h;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 25
    .line 26
    iget-object v1, p0, Ll/mpg;->b:Ll/k5h;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Landroid/app/Application;->unregisterActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Ll/mpg;->b:Ll/k5h;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/k5h;->k()V

    .line 34
    .line 35
    .line 36
    :cond_1
    return-void
.end method

.method public final c(Landroid/app/Activity;)V
    .locals 1

    .line 1
    new-instance v0, Ll/tog;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/tog;-><init>(Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/mpg;->a:Ll/tog;

    .line 7
    .line 8
    return-void
.end method

.method public final d(Landroid/app/Activity;Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    new-instance v0, Ll/k5h;

    .line 14
    .line 15
    invoke-direct {v0, p1, p2}, Ll/k5h;-><init>(Landroid/app/Activity;Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/mpg;->b:Ll/k5h;

    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public e(Lcom/p1/mobile/putong/feed/data/Moment;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mpg;->b:Ll/k5h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/mpg;->b:Ll/k5h;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/k5h;->s(Lcom/p1/mobile/putong/feed/data/Moment;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public final f()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mpg;->a:Ll/tog;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 10
    .line 11
    iget-object v1, p0, Ll/mpg;->a:Ll/tog;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    iget-object v0, p0, Ll/mpg;->b:Ll/k5h;

    .line 17
    .line 18
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    sget-object v0, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 25
    .line 26
    iget-object p0, p0, Ll/mpg;->b:Ll/k5h;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public h()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mpg;->b:Ll/k5h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/mpg;->b:Ll/k5h;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/k5h;->h()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public i(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mpg;->b:Ll/k5h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/mpg;->b:Ll/k5h;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/k5h;->i(Z)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public j(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mpg;->b:Ll/k5h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/mpg;->b:Ll/k5h;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ll/k5h;->j(F)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onComplete()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mpg;->b:Ll/k5h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/mpg;->b:Ll/k5h;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/k5h;->onComplete()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onPause()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mpg;->b:Ll/k5h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/mpg;->b:Ll/k5h;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/k5h;->onPause()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onResume()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mpg;->b:Ll/k5h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/mpg;->b:Ll/k5h;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/k5h;->onResume()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/mpg;->b:Ll/k5h;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/mpg;->b:Ll/k5h;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/k5h;->onStart()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
