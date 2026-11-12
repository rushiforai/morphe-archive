.class public final Lcom/opera/android/freedom/FreedomResourceThrottle;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static requestDialog(JLorg/chromium/content_public/browser/WebContents;Ljava/lang/String;)V
    .registers 6
    .param p2    # Lorg/chromium/content_public/browser/WebContents;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p2}, Ldx3;->L(Lorg/chromium/content_public/browser/WebContents;)Ldx3;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_b

    invoke-static {p0, p1, v1}, LJ/N;->M89iwLkI(JZ)V

    return-void

    :cond_b
    invoke-virtual {v0, p2}, Ldx3;->V(Lorg/chromium/content_public/browser/WebContents;)Lb2l;

    move-result-object p2

    if-nez p2, :cond_15

    invoke-static {p0, p1, v1}, LJ/N;->M89iwLkI(JZ)V

    return-void

    :cond_15
    iget-object v0, v0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->f:Laal;

    new-instance v1, Lmp9;

    invoke-direct {v1, p0, p1, p3}, Lmp9;-><init>(JLjava/lang/String;)V

    invoke-virtual {v0, v1, p2}, Laal;->Q(Lb87;Lb2l;)V

    return-void
.end method
