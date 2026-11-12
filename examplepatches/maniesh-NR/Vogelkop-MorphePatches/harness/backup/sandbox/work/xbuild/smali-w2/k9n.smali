.class public final Lk9n;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;


# instance fields
.field public final synthetic a:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lk9n;->a:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final onWindowFocusChanged(Z)V
    .registers 4

    iget-object v0, p0, Lk9n;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnWindowFocusChangeListener(Landroid/view/ViewTreeObserver$OnWindowFocusChangeListener;)V

    if-eqz p1, :cond_e

    invoke-static {v0}, Lq9n;->H(Landroid/view/View;)Z

    :cond_e
    return-void
.end method
