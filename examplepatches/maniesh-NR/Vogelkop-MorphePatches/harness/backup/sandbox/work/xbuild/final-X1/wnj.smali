.class public abstract Lwnj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements La5n;


# direct methods
.method public static a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 4

    const v0, 0x7f0d03a6

    const/4 v1, 0x0

    invoke-virtual {p0, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    if-eqz p0, :cond_10

    check-cast p0, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    return-void

    :cond_10
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
