.class public Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->x(Ll/x20;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/x20;

.field public final synthetic b:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;Ll/x20;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView$a;->b:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView$a;->a:Ll/x20;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView$a;->b:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView$a;->a:Ll/x20;

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->e(Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;Ll/x20;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView$a;->b:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->d(Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;)Ll/ezs;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-eqz p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView$a;->b:Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;->d(Lcom/p1/mobile/putong/live/livingroom/view/rollview/LiveRollView;)Ll/ezs;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-interface {p0}, Ll/ezs;->d()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0

    return-void
.end method
