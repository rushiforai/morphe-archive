.class public final Ll/zyu0$d;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/Application$ActivityLifecycleCallbacks;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/zyu0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation


# instance fields
.field public final synthetic a:Ll/zyu0;


# direct methods
.method public constructor <init>(Ll/zyu0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/zyu0$d;->a:Ll/zyu0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final onActivityCreated(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zyu0$d;->a:Ll/zyu0;

    .line 2
    .line 3
    new-instance v1, Ll/a6w0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p2, p1}, Ll/a6w0;-><init>(Ll/zyu0$d;Landroid/os/Bundle;Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/zyu0;->z(Ll/zyu0;Ll/zyu0$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final onActivityDestroyed(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zyu0$d;->a:Ll/zyu0;

    .line 2
    .line 3
    new-instance v1, Ll/wbw0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/wbw0;-><init>(Ll/zyu0$d;Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/zyu0;->z(Ll/zyu0;Ll/zyu0$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final onActivityPaused(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zyu0$d;->a:Ll/zyu0;

    .line 2
    .line 3
    new-instance v1, Ll/qaw0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/qaw0;-><init>(Ll/zyu0$d;Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/zyu0;->z(Ll/zyu0;Ll/zyu0$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final onActivityResumed(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zyu0$d;->a:Ll/zyu0;

    .line 2
    .line 3
    new-instance v1, Ll/d7w0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/d7w0;-><init>(Ll/zyu0$d;Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/zyu0;->z(Ll/zyu0;Ll/zyu0$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 3

    .line 1
    new-instance v0, Ll/xhu0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/xhu0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ll/zyu0$d;->a:Ll/zyu0;

    .line 7
    .line 8
    new-instance v2, Ll/cdw0;

    .line 9
    .line 10
    invoke-direct {v2, p0, p1, v0}, Ll/cdw0;-><init>(Ll/zyu0$d;Landroid/app/Activity;Ll/xhu0;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v1, v2}, Ll/zyu0;->z(Ll/zyu0;Ll/zyu0$a;)V

    .line 14
    .line 15
    .line 16
    const-wide/16 p0, 0x32

    .line 17
    .line 18
    invoke-virtual {v0, p0, p1}, Ll/xhu0;->P2(J)Landroid/os/Bundle;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    invoke-virtual {p2, p0}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final onActivityStarted(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zyu0$d;->a:Ll/zyu0;

    .line 2
    .line 3
    new-instance v1, Ll/h8w0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/h8w0;-><init>(Ll/zyu0$d;Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/zyu0;->z(Ll/zyu0;Ll/zyu0$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final onActivityStopped(Landroid/app/Activity;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/zyu0$d;->a:Ll/zyu0;

    .line 2
    .line 3
    new-instance v1, Ll/m9w0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/m9w0;-><init>(Ll/zyu0$d;Landroid/app/Activity;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/zyu0;->z(Ll/zyu0;Ll/zyu0$a;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
