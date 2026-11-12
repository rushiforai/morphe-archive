.class public final Lnii;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final e:Landroid/view/animation/DecelerateInterpolator;


# instance fields
.field public final a:Landroid/view/View;

.field public final b:Landroid/view/View;

.field public final c:Lvzk;

.field public d:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    sget-object v0, Llf1;->e:Landroid/view/animation/DecelerateInterpolator;

    sput-object v0, Lnii;->e:Landroid/view/animation/DecelerateInterpolator;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Landroid/view/View;Lvzk;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnii;->a:Landroid/view/View;

    iput-object p2, p0, Lnii;->b:Landroid/view/View;

    iput-object p3, p0, Lnii;->c:Lvzk;

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p1

    if-nez p1, :cond_11

    const/4 p1, 0x1

    goto :goto_12

    :cond_11
    const/4 p1, 0x0

    :goto_12
    iput-boolean p1, p0, Lnii;->d:Z

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 4

    iget-boolean v0, p0, Lnii;->d:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lnii;->c:Lvzk;

    invoke-virtual {v0}, Lvzk;->r()V

    const/4 v1, 0x1

    invoke-virtual {v0, v1, v1}, Lvzk;->x(ZZ)V

    iget-object v0, p0, Lnii;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    iget-object v1, p0, Lnii;->b:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getHeight()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v1, Lnii;->e:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    new-instance v1, Lpjg;

    const/16 v2, 0x1d

    invoke-direct {v1, p0, v2}, Lpjg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lnii;->d:Z

    return-void
.end method
