.class public final Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;
.super Lgej;
.source "SourceFile"

# interfaces
.implements Lw6f;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0001\u0018\u00002\u00020\u0001B\u001b\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;",
        "Lgej;",
        "Landroid/content/Context;",
        "context",
        "Landroid/util/AttributeSet;",
        "attrs",
        "<init>",
        "(Landroid/content/Context;Landroid/util/AttributeSet;)V",
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


# instance fields
.field public final c:Li7f;

.field public d:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lgej;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Li7f;

    invoke-direct {p1}, Li7f;-><init>()V

    iput-object p1, p0, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;->c:Li7f;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Laqn;

    iget-object p0, p0, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;->c:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Laqn;

    iget-object p0, p0, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;->c:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(ILandroid/view/View;)V
    .registers 3

    check-cast p2, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;

    const/4 p0, 0x0

    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    iget p2, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->h:I

    if-le p1, p2, :cond_16

    iput p1, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->h:I

    iget-object p0, p0, Lcom/opera/android/webcore/FastResizeWebViewContainer;->c:Lzll;

    if-eqz p0, :cond_16

    invoke-static {p1, p0}, Lp37;->l0(ILandroid/view/View;)V

    :cond_16
    return-void
.end method

.method public final b()I
    .registers 2

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p0

    return p0
.end method

.method public final f(I)V
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    invoke-virtual {v1, v0, v0, v2, v3}, Landroid/view/View;->layout(IIII)V

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    sub-int v3, p1, v3

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p0

    invoke-virtual {v2, v0, v3, p0, p1}, Landroid/view/View;->layout(IIII)V

    return-void
.end method

.method public final g(I)V
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {p1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    invoke-virtual {v1, v3, v0}, Landroid/view/View;->measure(II)V

    const/4 v1, 0x2

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {p1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-virtual {v3, p1, v0}, Landroid/view/View;->measure(II)V

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    iget v0, p0, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;->d:I

    if-eq p1, v0, :cond_3e

    iput p1, p0, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;->d:I

    iget-object p0, p0, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;->c:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_2e
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3e

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Laqn;

    invoke-interface {v0, p1}, Laqn;->a(I)V

    goto :goto_2e

    :cond_3e
    return-void
.end method
