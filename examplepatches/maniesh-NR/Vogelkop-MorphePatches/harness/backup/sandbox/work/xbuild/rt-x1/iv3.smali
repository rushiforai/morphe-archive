.class public final Liv3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;

.field public final synthetic b:Lbsi;

.field public final synthetic c:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;Lbsi;Z)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Liv3;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Liv3;->b:Lbsi;

    iput-boolean p3, p0, Liv3;->c:Z

    return-void
.end method


# virtual methods
.method public final onWindowFocusChanged(Z)V
    .registers 6

    iget-object v0, p0, Liv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v1, v0, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    const/4 v2, 0x0

    if-nez v1, :cond_8

    move-object v1, v2

    :cond_8
    invoke-virtual {v1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    if-eqz p1, :cond_29

    iget-object p1, v0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez p1, :cond_16

    move-object p1, v2

    :cond_16
    iget-object v1, p0, Liv3;->b:Lbsi;

    sget-object v3, Lhbf;->d:Lhbf;

    invoke-virtual {p1, v1, v3}, Lgbf;->l(Lbsi;Lhbf;)V

    iget-boolean p0, p0, Liv3;->c:Z

    if-nez p0, :cond_29

    iget-object p0, v0, Lcom/opera/android/BrowserActivity;->z:Lz43;

    if-eqz p0, :cond_26

    move-object v2, p0

    :cond_26
    invoke-virtual {v2}, Lz43;->d()V

    :cond_29
    return-void
.end method
