.class public abstract Lqxe;
.super Lorg/chromium/components/embedder_support/view/ContentViewRenderView;
.source "SourceFile"

# interfaces
.implements Lpwe;


# instance fields
.field public final i:Lqwe;

.field public j:Z


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .registers 6

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Lc5o;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->c:Lc5o;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/view/SurfaceView;

    invoke-direct {v2, v1}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Lc5o;->a:Ljava/lang/Object;

    const/4 v1, -0x1

    invoke-virtual {v2, v1}, Landroid/view/View;->setBackgroundColor(I)V

    iget-object v2, v0, Lc5o;->a:Ljava/lang/Object;

    check-cast v2, Landroid/view/SurfaceView;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v3, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, v0, Lc5o;->a:Ljava/lang/Object;

    check-cast v0, Landroid/view/SurfaceView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/SurfaceView;->setVisibility(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object p1

    iput-object p1, p0, Lqxe;->i:Lqwe;

    return-void
.end method


# virtual methods
.method public final a(Lbp;)V
    .registers 4

    iget-boolean v0, p0, Lqxe;->j:Z

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget p1, p1, Lbp;->a:I

    iget-wide v0, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v0, v1, p1}, LJ/N;->MQ_YfC8P(JI)V

    return-void
.end method

.method public final f(Lorg/chromium/ui/base/WindowAndroid;)V
    .registers 4

    invoke-static {p0, p1}, LJ/N;->MGnYpjUQ(Ljava/lang/Object;Ljava/lang/Object;)J

    move-result-wide v0

    iput-wide v0, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    check-cast p1, Lqi;

    iput-object p1, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->b:Lqi;

    new-instance p1, Lyr5;

    invoke-direct {p1, p0}, Lyr5;-><init>(Lqxe;)V

    iget-object v0, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->c:Lc5o;

    iput-object p1, v0, Lc5o;->b:Ljava/lang/Object;

    iget-object p1, v0, Lc5o;->a:Ljava/lang/Object;

    check-cast p1, Landroid/view/SurfaceView;

    invoke-virtual {p1}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object p1

    iget-object v1, v0, Lc5o;->b:Ljava/lang/Object;

    check-cast v1, Lyr5;

    invoke-interface {p1, v1}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    iget-object p1, v0, Lc5o;->a:Ljava/lang/Object;

    check-cast p1, Landroid/view/SurfaceView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/SurfaceView;->setVisibility(I)V

    const/4 p1, 0x1

    iput-boolean p1, p0, Lqxe;->j:Z

    iget-object p1, p0, Lqxe;->i:Lqwe;

    iget-object p1, p1, Lqwe;->a:Lbp;

    iget p1, p1, Lbp;->a:I

    iget-wide v0, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v0, v1, p1}, LJ/N;->MQ_YfC8P(JI)V

    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    iget-object v0, p0, Lqxe;->i:Lqwe;

    iget-object v1, v0, Lqwe;->b:Li7f;

    invoke-virtual {v1, p0}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object v0, v0, Lqwe;->a:Lbp;

    iget-boolean v1, p0, Lqxe;->j:Z

    if-nez v1, :cond_11

    return-void

    :cond_11
    iget v0, v0, Lbp;->a:I

    iget-wide v1, p0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v1, v2, v0}, LJ/N;->MQ_YfC8P(JI)V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 2

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object v0, p0, Lqxe;->i:Lqwe;

    iget-object v0, v0, Lqwe;->b:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method
