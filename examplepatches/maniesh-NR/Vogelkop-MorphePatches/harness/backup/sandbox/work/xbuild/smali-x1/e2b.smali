.class public final Le2b;
.super Llj;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "Le2b;",
        "Llj;",
        "<init>",
        "()V",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field public r:Lf2b;

.field public final s:Lzyk;


# direct methods
.method public constructor <init>()V
    .registers 3

    const v0, 0x7f140862

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Llj;-><init>(II)V

    new-instance v0, Lt2;

    const/16 v1, 0x18

    invoke-direct {v0, p0, v1}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Le2b;->s:Lzyk;

    return-void
.end method


# virtual methods
.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 11

    const v0, 0x7f0d0214

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a026e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    if-eqz v0, :cond_ae

    const p2, 0x7f0a056f

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    if-eqz v0, :cond_ae

    const p2, 0x7f0a0577

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;

    if-eqz v0, :cond_ae

    const p2, 0x7f0a0579

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/google/android/material/button/MaterialButton;

    if-eqz v4, :cond_ae

    const p2, 0x7f0a057a

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/google/android/material/button/MaterialButton;

    if-eqz v5, :cond_ae

    const p2, 0x7f0a086f

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_ae

    new-instance v2, Lf2b;

    move-object v3, p1

    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v7, 0x0

    invoke-direct/range {v2 .. v7}, Lf2b;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Landroid/widget/TextView;B)V

    iput-object v2, p0, Le2b;->r:Lf2b;

    const p1, 0x7f140bf3

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Lowj;

    new-instance v0, Ljng;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    new-instance v3, Lrl;

    const/4 v4, 0x4

    invoke-direct {v3, v4}, Lrl;-><init>(B)V

    const/4 v4, 0x2

    invoke-direct {v0, v4, v2, v3}, Ljng;-><init>(ILandroid/content/Context;Ljava/lang/Runnable;)V

    const-string v2, "<ps>"

    const-string v3, "</ps>"

    invoke-direct {p2, v2, v3, v0}, Lowj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/text/style/CharacterStyle;)V

    filled-new-array {p2}, [Lowj;

    move-result-object p2

    invoke-static {p1, p2}, Ln1h;->d(Ljava/lang/String;[Lowj;)Landroid/text/SpannableString;

    move-result-object p1

    iget-object p2, p0, Le2b;->r:Lf2b;

    const/4 v0, 0x0

    if-nez p2, :cond_89

    move-object p2, v0

    :cond_89
    iget-object p2, p2, Lf2b;->e:Landroid/widget/TextView;

    invoke-static {p2, p1}, Lphj;->u0(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Le2b;->r:Lf2b;

    if-nez p1, :cond_93

    move-object p1, v0

    :cond_93
    iget-object p1, p1, Lf2b;->c:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lc2b;

    invoke-direct {p2, p0, v1}, Lc2b;-><init>(Le2b;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Le2b;->r:Lf2b;

    if-eqz p1, :cond_a2

    move-object v0, p1

    :cond_a2
    iget-object p1, v0, Lf2b;->d:Lcom/google/android/material/button/MaterialButton;

    new-instance p2, Lc2b;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lc2b;-><init>(Le2b;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_ae
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
