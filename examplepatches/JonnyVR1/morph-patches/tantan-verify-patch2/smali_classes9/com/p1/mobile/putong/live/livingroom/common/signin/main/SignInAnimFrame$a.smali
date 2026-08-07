.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$a;
.super Landroid/animation/AnimatorListenerAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->l()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

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
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->b:Landroid/widget/FrameLayout;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 6
    .line 7
    .line 8
    const-string v0, "[live]sign_in"

    .line 9
    .line 10
    const-string v1, "View port remove all child"

    .line 11
    .line 12
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->a:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    .line 24
    .line 25
    iget-object v0, v0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->a:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Landroid/view/View;->setClickable(Z)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->g(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;)Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->m4()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame$a;->a:Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;

    .line 40
    .line 41
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;->f(Lcom/p1/mobile/putong/live/livingroom/common/signin/main/SignInAnimFrame;)Ljava/util/List;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    return-void
.end method
