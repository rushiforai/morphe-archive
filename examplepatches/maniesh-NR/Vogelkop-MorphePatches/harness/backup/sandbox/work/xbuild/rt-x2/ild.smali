.class public final synthetic Lild;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lceb;
.implements Logh;


# instance fields
.field public final synthetic a:Lnld;


# direct methods
.method public synthetic constructor <init>(Lnld;)V
    .registers 2

    iput-object p1, p0, Lild;->a:Lnld;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(J)V
    .registers 7

    iget-object p0, p0, Lild;->a:Lnld;

    iget-boolean v0, p0, Lnld;->l:Z

    if-eqz v0, :cond_26

    iget-object v0, p0, Lnld;->a:Lnrl;

    iget-object v1, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v1, Lhld;

    iget-object v2, v1, Lhld;->i:Lcom/opera/android/custom_views/StylingImageButton;

    const/4 v3, 0x0

    invoke-virtual {v0, v3, v2}, Lnrl;->e(ILandroid/view/View;)V

    iget-object v2, v1, Lhld;->h:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, v3, v2}, Lnrl;->e(ILandroid/view/View;)V

    iget-boolean v2, v0, Lnrl;->a:Z

    if-eqz v2, :cond_20

    iget-object v1, v1, Lhld;->d:Landroidx/mediarouter/app/OperaMediaRouteButton;

    invoke-virtual {v0, v3, v1}, Lnrl;->e(ILandroid/view/View;)V

    :cond_20
    iget-object v0, p0, Lnld;->b:Lqe6;

    invoke-virtual {v0, v3}, Lqe6;->M(I)V

    goto :goto_29

    :cond_26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnld;->l:Z

    :goto_29
    iget-object v0, p0, Lnld;->d:Lwub;

    invoke-virtual {v0}, Lwub;->P()V

    iget-object v0, p0, Lnld;->c:Llld;

    invoke-virtual {v0}, Llld;->p0()V

    iget-object v0, p0, Lnld;->k:Lmld;

    invoke-static {v0}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-boolean v1, p0, Lnld;->m:Z

    if-eqz v1, :cond_43

    iget-boolean p0, p0, Lnld;->n:Z

    if-nez p0, :cond_43

    invoke-static {v0, p1, p2}, Lvml;->d(Ljava/lang/Runnable;J)V

    :cond_43
    return-void
.end method

.method public final c(Landroid/view/MotionEvent;)V
    .registers 2

    iget-object p0, p0, Lild;->a:Lnld;

    invoke-virtual {p0}, Lnld;->c()V

    return-void
.end method
