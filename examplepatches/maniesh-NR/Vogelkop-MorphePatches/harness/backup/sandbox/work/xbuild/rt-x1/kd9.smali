.class Lkd9;
.super Lagc;
.source "SourceFile"


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 3

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    new-instance p1, Lrxh;

    const v0, 0x7f14120d

    invoke-direct {p1, v0}, Lrxh;-><init>(I)V

    const-string v0, "https://www.opera.com/terms"

    invoke-static {p0, v0, p1}, Lcom/opera/android/FullscreenWebActivity;->A0(Landroid/content/Context;Ljava/lang/String;Lpxh;)V

    return-void
.end method
