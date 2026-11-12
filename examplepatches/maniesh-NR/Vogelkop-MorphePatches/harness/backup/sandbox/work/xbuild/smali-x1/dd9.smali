.class Ldd9;
.super Lagc;
.source "SourceFile"


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 2

    new-instance p0, Lcd9;

    invoke-direct {p0}, Lcd9;-><init>()V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Ls63;->w0(Landroid/content/Context;)V

    return-void
.end method
