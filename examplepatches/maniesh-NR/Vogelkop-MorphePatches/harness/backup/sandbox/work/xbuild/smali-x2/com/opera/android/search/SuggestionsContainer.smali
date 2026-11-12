.class public Lcom/opera/android/search/SuggestionsContainer;
.super Lcom/opera/android/StatusBarDrawingFrameLayout;
.source "SourceFile"


# instance fields
.field public final m:Lhc;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/StatusBarDrawingFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Lhc;

    invoke-direct {p1}, Lhc;-><init>()V

    iput-object p1, p0, Lcom/opera/android/search/SuggestionsContainer;->m:Lhc;

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    return-void
.end method


# virtual methods
.method public final onLayout(ZIIII)V
    .registers 6

    invoke-super/range {p0 .. p5}, Landroid/view/View;->onLayout(ZIIII)V

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result p2

    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result p3

    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p4

    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    iget-object p0, p0, Lcom/opera/android/search/SuggestionsContainer;->m:Lhc;

    iget-object p5, p0, Lhc;->b:Ljava/lang/Object;

    check-cast p5, Landroid/graphics/Rect;

    add-int/2addr p4, p2

    add-int/2addr p1, p3

    invoke-virtual {p5, p2, p3, p4, p1}, Landroid/graphics/Rect;->set(IIII)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method
