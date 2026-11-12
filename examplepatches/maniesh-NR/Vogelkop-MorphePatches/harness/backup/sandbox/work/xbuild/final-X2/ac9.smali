.class public final Lac9;
.super Lab2;
.source "SourceFile"


# instance fields
.field public final d:Lnb9;

.field public final e:Lcom/opera/android/flow/MyFlowMessageRoot;

.field private final f:Landroid/widget/TextView;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public final g:Landroid/widget/TextView;

.field public final h:Landroid/widget/ImageView;

.field public final i:Landroid/widget/ImageView;

.field public final j:Landroid/widget/ProgressBar;

.field public k:Lzb9;

.field public l:Lob9;


# direct methods
.method public constructor <init>(Landroid/view/View;Lnb9;)V
    .registers 9

    invoke-direct {p0, p1}, Lab2;-><init>(Landroid/view/View;)V

    move-object v0, p1

    check-cast v0, Lcom/opera/android/flow/MyFlowMessageRoot;

    iput-object v0, p0, Lac9;->e:Lcom/opera/android/flow/MyFlowMessageRoot;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/opera/android/flow/MyFlowMessageRoot;->a(ZZ)V

    invoke-virtual {v0, v1}, Lcom/opera/android/flow/MyFlowMessageRoot;->b(I)V

    sget-object v3, Lr5n;->a:Ljava/util/WeakHashMap;

    const v3, 0x7f0a0b93

    invoke-static {p1, v3}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    check-cast v3, Landroid/widget/TextView;

    const v4, 0x7f140779

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(I)V

    iput-object p2, p0, Lac9;->d:Lnb9;

    const p2, 0x7f0a0435

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/widget/TextView;

    iput-object p2, p0, Lac9;->f:Landroid/widget/TextView;

    const v3, 0x7f0a0a80

    invoke-static {p1, v3}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, p0, Lac9;->g:Landroid/widget/TextView;

    const v3, 0x7f0a085d

    invoke-static {p1, v3}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lac9;->h:Landroid/widget/ImageView;

    const v3, 0x7f0a0bfc

    invoke-static {p1, v3}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View;

    check-cast v3, Landroid/widget/ImageView;

    iput-object v3, p0, Lac9;->i:Landroid/widget/ImageView;

    const v4, 0x7f0a0871

    invoke-static {p1, v4}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/view/View;

    check-cast v4, Landroid/widget/ProgressBar;

    iput-object v4, p0, Lac9;->j:Landroid/widget/ProgressBar;

    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    new-instance v2, Lob9;

    invoke-direct {v2, p2}, Lob9;-><init>(Landroid/widget/TextView;)V

    iget-object v4, p0, Lac9;->l:Lob9;

    if-eqz v4, :cond_7a

    iget-object v5, v0, Lcom/opera/android/flow/MyFlowMessageRoot;->c:Li7f;

    invoke-virtual {v5, v4}, Li7f;->c(Ljava/lang/Object;)Z

    const/4 v4, 0x0

    iput-object v4, p0, Lac9;->l:Lob9;

    :cond_7a
    iput-object v2, p0, Lac9;->l:Lob9;

    iget-object v4, v0, Lcom/opera/android/flow/MyFlowMessageRoot;->c:Li7f;

    invoke-virtual {v4, v2}, Li7f;->b(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9f

    iget v0, v0, Lcom/opera/android/flow/MyFlowMessageRoot;->i:I

    iget v4, v2, Lob9;->a:I

    if-ne v4, v0, :cond_8e

    iget-boolean v4, v2, Lob9;->c:Z

    if-nez v4, :cond_9f

    :cond_8e
    iput-boolean v1, v2, Lob9;->c:Z

    iput v0, v2, Lob9;->a:I

    iget-object v1, v2, Lob9;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    if-eqz v1, :cond_9f

    invoke-static {v0, v1}, Lob9;->b(ILandroid/view/View;)V

    :cond_9f
    invoke-static {p2, v2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    new-instance p2, Lpc5;

    const/16 v0, 0x15

    invoke-direct {p2, p0, v0}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {v3, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    const p0, 0x7f0a0046

    invoke-static {p1, p0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    const/16 p1, 0x8

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 3

    if-nez p2, :cond_8

    check-cast p1, Lzb9;

    iput-object p1, p0, Lac9;->k:Lzb9;

    iput-object p0, p1, Lzb9;->j:Lac9;

    :cond_8
    invoke-virtual {p0}, Lac9;->e0()V

    invoke-virtual {p0}, Lac9;->c0()V

    invoke-virtual {p0}, Lac9;->b0()V

    return-void
.end method

.method public final Y()V
    .registers 3

    iget-object v0, p0, Lac9;->k:Lzb9;

    const/4 v1, 0x0

    iput-object v1, v0, Lzb9;->j:Lac9;

    iput-object v1, p0, Lac9;->k:Lzb9;

    return-void
.end method

.method public final b0()V
    .registers 3

    iget-object v0, p0, Lac9;->k:Lzb9;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v1, p0, Lac9;->f:Landroid/widget/TextView;

    iget-object v0, v0, Lzb9;->e:Ljava/lang/String;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lac9;->k:Lzb9;

    iget-object v1, v0, Lzb9;->e:Ljava/lang/String;

    iget-object v0, v0, Lzb9;->f:Ljava/lang/String;

    iget-object p0, p0, Lac9;->i:Landroid/widget/ImageView;

    invoke-static {p0, v1, v0}, Lbc9;->u(Landroid/widget/ImageView;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final c0()V
    .registers 5

    iget-object v0, p0, Lac9;->k:Lzb9;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, v0, Lzb9;->g:Landroid/net/Uri;

    iget-object v1, p0, Lac9;->h:Landroid/widget/ImageView;

    if-nez v0, :cond_11

    const/16 p0, 0x8

    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void

    :cond_11
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    sget-object v0, Lyne;->b:Ldeg;

    iget-object v2, p0, Lac9;->k:Lzb9;

    iget-object v2, v2, Lzb9;->g:Landroid/net/Uri;

    invoke-virtual {v0, v2}, Ldeg;->g(Landroid/net/Uri;)Ldwh;

    move-result-object v0

    const/4 v2, 0x1

    iput-boolean v2, v0, Ldwh;->d:Z

    invoke-virtual {v0}, Ldwh;->a()V

    iget-object v3, p0, Lac9;->k:Lzb9;

    iget-object v3, v3, Lzb9;->g:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lwqm;->r(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_3a

    iget-object p0, p0, Lac9;->d:Lnb9;

    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    goto :goto_3c

    :cond_3a
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :goto_3c
    invoke-virtual {v0, p0}, Ldwh;->m(Ljava/util/List;)V

    iget-object p0, v0, Ldwh;->b:Lgvh;

    iput-boolean v2, p0, Lgvh;->k:Z

    const/4 p0, 0x0

    invoke-virtual {v0, v1, p0}, Ldwh;->g(Landroid/widget/ImageView;Ld94;)V

    return-void
.end method

.method public final e0()V
    .registers 7

    iget-object v0, p0, Lac9;->k:Lzb9;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Lac9;->g:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lac9;->k:Lzb9;

    iget v3, v2, Lzb9;->i:F

    iget-wide v4, v2, Lzb9;->h:J

    long-to-float v2, v4

    mul-float/2addr v3, v2

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v2

    int-to-long v2, v2

    invoke-static {v2, v3, v1}, Laik;->h(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lac9;->k:Lzb9;

    iget-wide v3, v3, Lzb9;->h:J

    invoke-static {v3, v4, v1}, Laik;->h(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iget-object v3, p0, Lac9;->f:Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f140622

    filled-new-array {v2, v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v3, v4, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lac9;->k:Lzb9;

    iget v0, v0, Lzb9;->i:F

    iget-object p0, p0, Lac9;->j:Landroid/widget/ProgressBar;

    invoke-virtual {p0}, Landroid/widget/ProgressBar;->getMax()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    return-void
.end method

.method public final onDestroy()V
    .registers 3

    iget-object v0, p0, Lac9;->l:Lob9;

    if-eqz v0, :cond_e

    iget-object v1, p0, Lac9;->e:Lcom/opera/android/flow/MyFlowMessageRoot;

    iget-object v1, v1, Lcom/opera/android/flow/MyFlowMessageRoot;->c:Li7f;

    invoke-virtual {v1, v0}, Li7f;->c(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lac9;->l:Lob9;

    :cond_e
    return-void
.end method
