.class public final Lcom/opera/android/OverlaidStatusBarDrawingView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u0001:\u0001\u0002\u00a8\u0006\u0003"
    }
    d2 = {
        "Lcom/opera/android/OverlaidStatusBarDrawingView;",
        "Landroid/view/View;",
        "wuf",
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
.field public static final synthetic g:I


# instance fields
.field public final a:Lkqe;

.field public final b:Landroid/graphics/Paint;

.field public c:Lc1f;

.field public d:I

.field public e:I

.field public f:Lwuf;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lkqe;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lkqe;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->a:Lkqe;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->b:Landroid/graphics/Paint;

    sget-object p1, Lwuf;->a:Lwuf;

    iput-object p1, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->f:Lwuf;

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 9

    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    iget v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->e:I

    iget-object v6, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->b:Landroid/graphics/Paint;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v0

    int-to-float v4, v0

    iget p0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->d:I

    int-to-float v5, p0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;
    .registers 4

    invoke-static {p0, p1}, Lg3o;->g(Landroid/view/View;Landroid/view/WindowInsets;)Lg3o;

    move-result-object v0

    const/16 v1, 0x207

    iget-object v0, v0, Lg3o;->a:Ld3o;

    invoke-virtual {v0, v1}, Ld3o;->i(I)Lr9b;

    move-result-object v0

    iget v0, v0, Lr9b;->b:I

    iget v1, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->d:I

    if-eq v0, v1, :cond_17

    iput v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->d:I

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_17
    invoke-super {p0, p1}, Landroid/view/View;->onApplyWindowInsets(Landroid/view/WindowInsets;)Landroid/view/WindowInsets;

    move-result-object p0

    return-object p0
.end method

.method public final onAttachedToWindow()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onAttachedToWindow()V

    invoke-static {p0}, Lc1f;->c(Landroid/view/View;)Lc1f;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->c:Lc1f;

    if-eqz v0, :cond_10

    iget-object v1, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->a:Lkqe;

    invoke-virtual {v0, v1}, Lc1f;->d(Lfck;)V

    :cond_10
    invoke-virtual {p0}, Landroid/view/View;->requestApplyInsets()V

    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 3

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    iget-object v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->c:Lc1f;

    if-eqz v0, :cond_c

    iget-object v1, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->a:Lkqe;

    invoke-virtual {v0, v1}, Lc1f;->g(Lfck;)V

    :cond_c
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->c:Lc1f;

    return-void
.end method

.method public final setAlpha(F)V
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v0

    cmpg-float v0, p1, v0

    if-eqz v0, :cond_15

    invoke-super {p0, p1}, Landroid/view/View;->setAlpha(F)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget-object p0, p0, Lcom/opera/android/OverlaidStatusBarDrawingView;->c:Lc1f;

    if-eqz p0, :cond_15

    invoke-virtual {p0}, Lc1f;->e()V

    :cond_15
    return-void
.end method
