.class public final Lqwc;
.super Lab2;
.source "SourceFile"


# instance fields
.field public final d:Lswc;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 5

    invoke-direct {p0, p1}, Lab2;-><init>(Landroid/view/View;)V

    const v0, 0x7f0a05e0

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_19

    new-instance v0, Lswc;

    check-cast p1, Landroid/widget/FrameLayout;

    const/4 v2, 0x0

    invoke-direct {v0, p1, v1, v2}, Lswc;-><init>(Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingTextView;B)V

    iput-object v0, p0, Lqwc;->d:Lswc;

    return-void

    :cond_19
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 3

    check-cast p1, Lpwc;

    iget-object p0, p0, Lqwc;->d:Lswc;

    iget-object p0, p0, Lswc;->c:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    iget p1, p1, Lpwc;->b:I

    invoke-virtual {p2, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
