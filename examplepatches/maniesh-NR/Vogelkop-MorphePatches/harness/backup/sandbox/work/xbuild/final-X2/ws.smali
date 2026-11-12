.class public final Lws;
.super Landroidx/recyclerview/widget/i;
.source "SourceFile"


# instance fields
.field public final b:Lvs;

.field public final c:Lzs;

.field public d:Lts;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lzs;)V
    .registers 12

    const v0, 0x7f0d002e

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p1, v0, v2, v1}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a0140

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_54

    const v0, 0x7f0a056f

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/ImageView;

    if-eqz v6, :cond_54

    const v0, 0x7f0a06c5

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v7, :cond_54

    new-instance v3, Lvs;

    move-object v4, p1

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v8}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, v4}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object v3, p0, Lws;->b:Lvs;

    iput-object p2, p0, Lws;->c:Lzs;

    new-instance p1, Lgf;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lu7;

    const/4 p2, 0x6

    invoke-direct {p1, p0, p2}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v4}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_50

    return-void

    :cond_50
    invoke-static {p0, v4, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void

    :cond_54
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    throw v2
.end method
