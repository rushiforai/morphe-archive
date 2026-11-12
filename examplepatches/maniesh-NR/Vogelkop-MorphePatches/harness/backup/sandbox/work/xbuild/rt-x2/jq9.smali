.class public final Ljq9;
.super Lqxe;
.source "SourceFile"


# instance fields
.field public k:I

.field public l:I

.field public m:I


# virtual methods
.method public final b(II)V
    .registers 3

    iput p1, p0, Ljq9;->k:I

    iput p2, p0, Ljq9;->l:I

    invoke-virtual {p0}, Ljq9;->g()V

    return-void
.end method

.method public final g()V
    .registers 4

    iget v0, p0, Ljq9;->k:I

    iget v1, p0, Ljq9;->l:I

    iget v2, p0, Ljq9;->m:I

    sub-int/2addr v1, v2

    invoke-super {p0, v0, v1}, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->b(II)V

    return-void
.end method
