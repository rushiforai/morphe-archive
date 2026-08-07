.class public Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$d;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->q()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->k(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;Z)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->k(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 14
    .line 15
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->f(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)Ljava/lang/Runnable;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-wide/16 v1, 0x3e8

    .line 20
    .line 21
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->e(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)Ljava/lang/Runnable;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const-wide/16 v1, 0x0

    .line 37
    .line 38
    invoke-static {p1, v0, v1, v2}, Ll/l51;->H(Landroid/content/Context;Ljava/lang/Runnable;J)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView$d;->a:Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;

    .line 42
    .line 43
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;->d(Lcom/p1/mobile/putong/live/livingroom/increment/bullet/BulletView;)Ll/pf2;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-static {p0}, Ll/li3;->g(Ll/pf2;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method
