.class public final Lcom/opera/android/live_score/LivescoreSheetContentWrapper;
.super Lgej;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0016\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0001\u0018\u00002\u00020\u0001B\u001b\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lcom/opera/android/live_score/LivescoreSheetContentWrapper;",
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


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lgej;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(ILandroid/view/View;)V
    .registers 3

    check-cast p2, Lcom/opera/android/live_score/LivescoreSheetLayoutSwitcher;

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
