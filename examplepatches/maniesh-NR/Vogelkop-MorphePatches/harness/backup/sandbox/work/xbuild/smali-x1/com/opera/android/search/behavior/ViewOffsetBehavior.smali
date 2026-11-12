.class public Lcom/opera/android/search/behavior/ViewOffsetBehavior;
.super Lnv5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Landroid/view/View;",
        ">",
        "Lnv5;"
    }
.end annotation


# instance fields
.field public a:Lr05;

.field public b:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final l(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)Z
    .registers 4

    invoke-virtual {p0, p1, p2, p3}, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->x(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)V

    iget-object p1, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->a:Lr05;

    if-nez p1, :cond_10

    new-instance p1, Lr05;

    const/16 p3, 0xb

    invoke-direct {p1, p2, p3}, Lr05;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->a:Lr05;

    :cond_10
    iget-object p2, p1, Lr05;->e:Ljava/lang/Object;

    check-cast p2, Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p3

    iput p3, p1, Lr05;->b:I

    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result p2

    iput p2, p1, Lr05;->c:I

    iget-object p1, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->a:Lr05;

    invoke-virtual {p1}, Lr05;->s()V

    iget p1, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->b:I

    if-eqz p1, :cond_37

    iget-object p2, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->a:Lr05;

    iget p3, p2, Lr05;->d:I

    if-eq p3, p1, :cond_34

    iput p1, p2, Lr05;->d:I

    invoke-virtual {p2}, Lr05;->s()V

    :cond_34
    const/4 p1, 0x0

    iput p1, p0, Lcom/opera/android/search/behavior/ViewOffsetBehavior;->b:I

    :cond_37
    const/4 p0, 0x1

    return p0
.end method

.method public x(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;I)V
    .registers 4

    invoke-virtual {p1, p3, p2}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->r(ILandroid/view/View;)V

    return-void
.end method
