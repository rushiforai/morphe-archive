.class public Lcom/opera/android/StatusBarDrawerAppBarLayout;
.super Lcom/google/android/material/appbar/AppBarLayout;
.source "SourceFile"


# static fields
.field public static final synthetic H:I


# instance fields
.field public final C:Lkqe;

.field public final D:Lqzg;

.field public E:Lc1f;

.field public F:Z

.field public final G:Z


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

    invoke-direct {p0, p1, p2}, Lcom/google/android/material/appbar/AppBarLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance p1, Lkqe;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lkqe;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->C:Lkqe;

    new-instance p1, Lqzg;

    const/16 p2, 0x14

    invoke-direct {p1, p0, p2}, Lqzg;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->D:Lqzg;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->G:Z

    return-void
.end method


# virtual methods
.method public final dispatchDraw(Landroid/graphics/Canvas;)V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->G:Z

    if-eqz v0, :cond_7

    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    :cond_7
    return-void
.end method

.method public final onAttachedToWindow()V
    .registers 5

    invoke-super {p0}, Lcom/google/android/material/appbar/AppBarLayout;->onAttachedToWindow()V

    invoke-static {p0}, Lc1f;->c(Landroid/view/View;)Lc1f;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->E:Lc1f;

    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    iget-object v1, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->C:Lkqe;

    iget-object v2, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->D:Lqzg;

    if-eqz v0, :cond_31

    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_31

    iget-boolean v0, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->F:Z

    if-nez v0, :cond_48

    iget-object v0, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->E:Lc1f;

    if-eqz v0, :cond_48

    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->F:Z

    iget-object v0, v0, Lc1f;->g:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0, v2}, Lekc;->k(Lf7f;)V

    iget-object p0, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->E:Lc1f;

    invoke-virtual {p0, v1}, Lc1f;->d(Lfck;)V

    return-void

    :cond_31
    iget-boolean v0, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->F:Z

    if-eqz v0, :cond_48

    iget-object v0, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->E:Lc1f;

    if-eqz v0, :cond_48

    const/4 v3, 0x0

    iput-boolean v3, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->F:Z

    iget-object v0, v0, Lc1f;->g:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0, v2}, Lekc;->p(Lf7f;)V

    iget-object p0, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->E:Lc1f;

    invoke-virtual {p0, v1}, Lc1f;->g(Lfck;)V

    :cond_48
    return-void
.end method

.method public final onDetachedFromWindow()V
    .registers 3

    invoke-super {p0}, Lcom/google/android/material/appbar/AppBarLayout;->onDetachedFromWindow()V

    iget-boolean v0, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->F:Z

    if-eqz v0, :cond_1e

    iget-object v0, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->E:Lc1f;

    if-eqz v0, :cond_1e

    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->F:Z

    iget-object v0, v0, Lc1f;->g:Ljava/lang/Object;

    check-cast v0, Lode;

    iget-object v1, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->D:Lqzg;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    iget-object v0, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->E:Lc1f;

    iget-object v1, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->C:Lkqe;

    invoke-virtual {v0, v1}, Lc1f;->g(Lfck;)V

    :cond_1e
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/StatusBarDrawerAppBarLayout;->E:Lc1f;

    return-void
.end method
