.class public Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/animation/Animator$AnimatorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->C(Landroid/view/View;Landroid/view/View;Landroid/view/View;Lcom/p1/mobile/putong/data/User;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Landroid/view/View;

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Z

.field public final synthetic d:Landroid/view/View;

.field public final synthetic e:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;Landroid/view/View;Landroid/view/View;ZLandroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->e:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->a:Landroid/view/View;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->b:Landroid/view/View;

    .line 6
    .line 7
    iput-boolean p4, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->c:Z

    .line 8
    .line 9
    iput-object p5, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->d:Landroid/view/View;

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public onAnimationCancel(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationEnd(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->e:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->a:Landroid/widget/RelativeLayout;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->e:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->g:Landroid/widget/RelativeLayout;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->d:Landroid/view/View;

    .line 17
    .line 18
    const/16 v0, 0x8

    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->d:Landroid/view/View;

    .line 24
    .line 25
    const/high16 v0, 0x3f800000    # 1.0f

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 28
    .line 29
    .line 30
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->c:Z

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->e:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->z(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;I)V

    .line 38
    .line 39
    .line 40
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->e:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 41
    .line 42
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->n:Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/mmsdk/AnimEffectPlayer;->n()V

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public onAnimationRepeat(Landroid/animation/Animator;)V
    .locals 0

    return-void
.end method

.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->a:Landroid/view/View;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->b:Landroid/view/View;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Landroid/view/View;->setAlpha(F)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->a:Landroid/view/View;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->e:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 19
    .line 20
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->a:Landroid/widget/RelativeLayout;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->e:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 26
    .line 27
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->g:Landroid/widget/RelativeLayout;

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->setClickable(Z)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->e:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 33
    .line 34
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->z(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;I)V

    .line 35
    .line 36
    .line 37
    iget-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->c:Z

    .line 38
    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView$b;->e:Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;

    .line 42
    .line 43
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->v(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    const/4 v0, 0x1

    .line 48
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;->w(Lcom/p1/mobile/putong/live/livingroom/view/CardFansClubLevelView;Ljava/lang/String;Z)V

    .line 49
    .line 50
    .line 51
    :cond_0
    return-void
.end method
