.class public Ll/xti;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/uti;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/uti;

.field public b:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

.field public c:Landroid/view/WindowManager;

.field public d:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/xti;->d:Z

    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Ll/xti;Landroid/view/WindowManager$LayoutParams;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/xti;->l(Landroid/view/WindowManager$LayoutParams;)V

    return-void
.end method

.method private e(Landroid/content/Context;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xti;->b:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    sget v0, Ll/yec0;->d1:I

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {p1, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 14
    .line 15
    iput-object p1, p0, Ll/xti;->b:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 16
    .line 17
    iget-object v0, p0, Ll/xti;->a:Ll/uti;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/uti;->s()F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->g(F)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/xti;->b:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 27
    .line 28
    new-instance v0, Ll/wti;

    .line 29
    .line 30
    invoke-direct {v0, p0}, Ll/wti;-><init>(Ll/xti;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->setUpdateWindowAction(Ll/y20;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method private l(Landroid/view/WindowManager$LayoutParams;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/xti;->b:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/xti;->c:Landroid/view/WindowManager;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-boolean p0, p0, Ll/xti;->d:Z

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-interface {v1, v0, p1}, Landroid/view/ViewManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    :cond_1
    :goto_0
    return-void

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public b(Ll/uti;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xti;->a:Ll/uti;

    .line 2
    .line 3
    return-void
.end method

.method public c()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/xti;->b:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Ll/xti;->c:Landroid/view/WindowManager;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    iget-boolean v2, p0, Ll/xti;->d:Z

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :try_start_0
    invoke-interface {v1, v0}, Landroid/view/WindowManager;->removeViewImmediate(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catch_0
    move-exception v0

    .line 19
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    :goto_0
    const/4 v0, 0x0

    .line 23
    iput-boolean v0, p0, Ll/xti;->d:Z

    .line 24
    .line 25
    :cond_1
    :goto_1
    return-void
.end method

.method public d()Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xti;->b:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 2
    .line 3
    return-object p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xti;->c()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/xti;->c:Landroid/view/WindowManager;

    .line 6
    .line 7
    iput-object v0, p0, Ll/xti;->b:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 8
    .line 9
    return-void
.end method

.method public f()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xti;->b:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xti;->b:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/xti;->a:Ll/uti;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/uti;->o()Ll/eti;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->e(Ll/eti;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/uti;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/xti;->b(Ll/uti;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j()Z
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/xti;->d:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :try_start_0
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 9
    .line 10
    invoke-direct {p0, v2}, Ll/xti;->e(Landroid/content/Context;)V

    .line 11
    .line 12
    .line 13
    const-string v3, "window"

    .line 14
    .line 15
    invoke-virtual {v2, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    check-cast v2, Landroid/view/WindowManager;

    .line 20
    .line 21
    iput-object v2, p0, Ll/xti;->c:Landroid/view/WindowManager;

    .line 22
    .line 23
    iget-object v3, p0, Ll/xti;->b:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 24
    .line 25
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->getWindowParams()Landroid/view/WindowManager$LayoutParams;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-interface {v2, v3, v4}, Landroid/view/ViewManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 30
    .line 31
    .line 32
    :try_start_1
    iput-boolean v1, p0, Ll/xti;->d:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 33
    .line 34
    return v1

    .line 35
    :catch_0
    move-exception p0

    .line 36
    goto :goto_0

    .line 37
    :catch_1
    move-exception p0

    .line 38
    move v1, v0

    .line 39
    :goto_0
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 40
    .line 41
    .line 42
    return v1
.end method

.method public k(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xti;->b:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->getWindowParams()Landroid/view/WindowManager$LayoutParams;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 11
    .line 12
    iput p2, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 13
    .line 14
    invoke-direct {p0, v0}, Ll/xti;->l(Landroid/view/WindowManager$LayoutParams;)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/xti;->b:Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/other/floatwindow/FloatView;->s(II)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
