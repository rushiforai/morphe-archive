.class public final Lcom/opera/android/webcore/FastResizeWebViewContainer;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/webcore/FastResizeWebViewContainer;",
        "Landroid/widget/FrameLayout;",
        "bq8",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic i:I


# instance fields
.field public final a:Lkze;

.field public b:Lcom/opera/android/browser/WebContentsWrapper;

.field public c:Lzll;

.field public d:Lqwe;

.field public e:Ljze;

.field public final f:Lks6;

.field public final g:Laq8;

.field public h:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lz61;

    invoke-direct {p1, p0}, Lz61;-><init>(Landroid/view/View;)V

    iget-object p1, p1, Lz61;->b:Ljava/lang/Object;

    check-cast p1, Lkze;

    iput-object p1, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->a:Lkze;

    new-instance p1, Lks6;

    const/4 p2, 0x6

    invoke-direct {p1, p0, p2}, Lks6;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->f:Lks6;

    new-instance p1, Laq8;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Laq8;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->g:Laq8;

    return-void
.end method


# virtual methods
.method public final a(Lzll;Lcom/opera/android/browser/WebContentsWrapper;Lqwe;)V
    .registers 8

    iput-object p2, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->b:Lcom/opera/android/browser/WebContentsWrapper;

    iput-object p1, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->c:Lzll;

    iput-object p3, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->d:Lqwe;

    new-instance v0, Lpc5;

    const/16 v1, 0xd

    invoke-direct {v0, p2, v1}, Lpc5;-><init>(Ljava/lang/Object;B)V

    sget-object p2, Lq9n;->c:Ll5b;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_1c

    invoke-static {p2, p1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_1c
    iget-object p2, p3, Lqwe;->a:Lbp;

    iget p2, p2, Lbp;->a:I

    iget-object v0, p1, Lzll;->a:Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;

    iget-wide v0, v0, Lorg/chromium/components/thinwebview/internal/CompositorViewImpl;->d:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_2d

    invoke-static {v0, v1, p2}, LJ/N;->MwkfWGl7(JI)V

    :cond_2d
    iget-object p2, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->g:Laq8;

    iget-object p3, p3, Lqwe;->b:Li7f;

    invoke-virtual {p3, p2}, Li7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void
.end method

.method public final b()V
    .registers 4

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-eqz v0, :cond_65

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-eqz v0, :cond_65

    iget-object v0, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->e:Ljze;

    if-eqz v0, :cond_17

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbq8;

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    :goto_18
    const/4 v1, -0x1

    if-nez v0, :cond_1d

    move v0, v1

    goto :goto_25

    :cond_1d
    sget-object v2, Lcq8;->a:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v2, v0

    :goto_25
    if-eq v0, v1, :cond_65

    const/4 v1, 0x1

    if-eq v0, v1, :cond_65

    const/4 v1, 0x2

    if-eq v0, v1, :cond_50

    const/4 v1, 0x3

    if-ne v0, v1, :cond_4c

    iget-object v0, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->b:Lcom/opera/android/browser/WebContentsWrapper;

    if-eqz v0, :cond_65

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    if-eqz v0, :cond_65

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v2

    iget p0, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->h:I

    invoke-static {v2, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    invoke-interface {v0, v1, p0}, Lorg/chromium/content_public/browser/WebContents;->y0(II)V

    return-void

    :cond_4c
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_50
    iget-object v0, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->b:Lcom/opera/android/browser/WebContentsWrapper;

    if-eqz v0, :cond_65

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->f()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    if-eqz v0, :cond_65

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    invoke-interface {v0, v1, p0}, Lorg/chromium/content_public/browser/WebContents;->y0(II)V

    :cond_65
    return-void
.end method

.method public final c(Lkze;)V
    .registers 6

    new-instance v0, Ld58;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, Ld58;-><init>(B)V

    new-instance v1, Ljze;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v2}, Ld58;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-direct {v1, v2}, Ljze;-><init>(Ljava/lang/Object;)V

    new-instance v2, Ljkc;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v0, v3}, Ljkc;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lug;

    const/16 v3, 0x19

    invoke-direct {v0, v2, v3}, Lug;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object v2, v1, Ljze;->l:Lh42;

    invoke-virtual {v2, p1, v0}, Lh42;->s(Lekc;Lf7f;)V

    iget-object p1, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->e:Ljze;

    iget-object v0, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->f:Lks6;

    if-eqz p1, :cond_2e

    invoke-virtual {p1, v0}, Lekc;->p(Lf7f;)V

    :cond_2e
    iput-object v1, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->e:Ljze;

    iget-object p0, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->a:Lkze;

    invoke-static {v1, p0, v0}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method

.method public final onSizeChanged(IIII)V
    .registers 5

    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    new-instance p1, Lbn7;

    const/16 p3, 0x12

    invoke-direct {p1, p0, p2, p3}, Lbn7;-><init>(Ljava/lang/Object;IB)V

    invoke-virtual {p0, p1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
