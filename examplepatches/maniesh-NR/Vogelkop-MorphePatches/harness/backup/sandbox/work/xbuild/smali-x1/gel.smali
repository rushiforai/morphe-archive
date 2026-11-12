.class public final Lgel;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroidx/recyclerview/widget/i;

.field public final b:Ls9i;

.field public final c:Lpde;

.field public final d:Landroid/view/View;

.field public final e:Lcbl;

.field public final f:F

.field public final g:F

.field public final h:I


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/i;Ls9i;Lpde;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lgel;->a:Landroidx/recyclerview/widget/i;

    iput-object p2, p0, Lgel;->b:Ls9i;

    iput-object p3, p0, Lgel;->c:Lpde;

    iget-object p1, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iput-object p1, p0, Lgel;->d:Landroid/view/View;

    new-instance p2, Lcbl;

    const/4 p3, 0x3

    invoke-direct {p2, p0, p3}, Lcbl;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Lgel;->e:Lcbl;

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p3

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    move-result v0

    add-float/2addr v0, p3

    iput v0, p0, Lgel;->f:F

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p3

    int-to-float p3, p3

    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result v0

    add-float/2addr v0, p3

    iput v0, p0, Lgel;->g:F

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p3

    const/high16 v0, 0x41800000    # 16.0f

    invoke-static {p3, v0}, Lz7h;->h(Landroid/content/Context;F)I

    move-result p3

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result v0

    if-ge p3, v0, :cond_46

    move p3, v0

    :cond_46
    iput p3, p0, Lgel;->h:I

    invoke-virtual {p1, p2}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void
.end method
