.class public final Lmzb;
.super Lab2;
.source "SourceFile"


# instance fields
.field public final d:Lswc;

.field public final e:Ltah;


# direct methods
.method public constructor <init>(Landroid/view/View;Ltah;)V
    .registers 6

    invoke-direct {p0, p1}, Lab2;-><init>(Landroid/view/View;)V

    const v0, 0x7f0a05e0

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_27

    new-instance v0, Lswc;

    check-cast p1, Landroid/widget/FrameLayout;

    const/4 v2, 0x2

    invoke-direct {v0, p1, v1, v2}, Lswc;-><init>(Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingTextView;B)V

    iput-object v0, p0, Lmzb;->d:Lswc;

    iput-object p2, p0, Lmzb;->e:Ltah;

    new-instance p1, Llzb;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, p1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p1, v1}, Llzb;->a(Landroid/view/View;)V

    return-void

    :cond_27
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

    check-cast p1, Lkzb;

    iget-object p0, p0, Lmzb;->d:Lswc;

    iget-object p0, p0, Lswc;->c:Lcom/opera/android/custom_views/StylingTextView;

    iget p1, p1, Lkzb;->b:I

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method
