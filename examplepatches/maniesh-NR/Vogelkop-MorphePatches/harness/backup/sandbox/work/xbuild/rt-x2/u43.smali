.class public abstract Lu43;
.super Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;
.source "SourceFile"


# instance fields
.field public c:Lt43;


# virtual methods
.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroid/view/View;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lu43;->c:Lt43;

    if-eqz p0, :cond_a

    invoke-interface {p0, p1}, Lt43;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    :cond_a
    return-void
.end method
