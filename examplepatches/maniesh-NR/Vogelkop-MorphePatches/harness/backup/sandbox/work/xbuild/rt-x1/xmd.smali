.class public final Lxmd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# instance fields
.field public final a:Lvl9;

.field public final synthetic b:Landroidx/mediarouter/app/d;


# direct methods
.method public constructor <init>(Landroidx/mediarouter/app/d;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lxmd;->b:Landroidx/mediarouter/app/d;

    new-instance p1, Lvl9;

    const/16 v0, 0xf

    invoke-direct {p1, p0, v0}, Lvl9;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lxmd;->a:Lvl9;

    return-void
.end method


# virtual methods
.method public final onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .registers 4

    if-eqz p3, :cond_d

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcod;

    sget p1, Landroidx/mediarouter/app/d;->q0:I

    invoke-virtual {p0, p2}, Lcod;->j(I)V

    :cond_d
    return-void
.end method

.method public final onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 4

    iget-object v0, p0, Lxmd;->b:Landroidx/mediarouter/app/d;

    iget-object v1, v0, Landroidx/mediarouter/app/d;->N:Lcod;

    if-eqz v1, :cond_d

    iget-object v1, v0, Landroidx/mediarouter/app/d;->L:Landroid/widget/SeekBar;

    iget-object p0, p0, Lxmd;->a:Lvl9;

    invoke-virtual {v1, p0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    :cond_d
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcod;

    iput-object p0, v0, Landroidx/mediarouter/app/d;->N:Lcod;

    return-void
.end method

.method public final onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .registers 4

    iget-object p1, p0, Lxmd;->b:Landroidx/mediarouter/app/d;

    iget-object p1, p1, Landroidx/mediarouter/app/d;->L:Landroid/widget/SeekBar;

    iget-object p0, p0, Lxmd;->a:Lvl9;

    const-wide/16 v0, 0x1f4

    invoke-virtual {p1, p0, v0, v1}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
