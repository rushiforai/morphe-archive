.class public final Lov8;
.super Lou8;
.source "SourceFile"


# static fields
.field public static final m:Lixh;

.field public static final n:Lixh;


# instance fields
.field public final k:Lyhe;

.field public final l:Lvs;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lixh;

    const/high16 v1, 0x42100000    # 36.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lov8;->m:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x42500000    # 52.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lov8;->n:Lixh;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;Lyhe;Lr9i;)V
    .registers 10

    invoke-direct {p0, p3, p1}, Lou8;-><init>(Lr9i;Landroid/view/View;)V

    iput-object p2, p0, Lov8;->k:Lyhe;

    move-object v1, p1

    check-cast v1, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;

    const p2, 0x7f0a0469

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    check-cast p3, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz p3, :cond_51

    const p2, 0x7f0a046b

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v2, p3

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v2, :cond_51

    const p2, 0x7f0a046c

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v3, p3

    check-cast v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_51

    const p2, 0x7f0a046d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object p3

    move-object v4, p3

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v4, :cond_51

    new-instance v0, Lvs;

    const/16 v5, 0xc

    invoke-direct/range {v0 .. v5}, Lvs;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Lov8;->l:Lvs;

    instance-of p2, p1, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;

    if-eqz p2, :cond_50

    move-object p2, p1

    check-cast p2, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;

    new-instance p3, Lge5;

    const/16 v0, 0x15

    invoke-direct {p3, p1, p0, v0}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p3, p2, Lcom/opera/android/feed/SoftwareClipMaskableFrameLayout;->d:Lge5;

    :cond_50
    return-void

    :cond_51
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0
.end method


# virtual methods
.method public final T(Landroid/view/View;II)V
    .registers 4

    invoke-super {p0, p1, p2, p3}, Lou8;->T(Landroid/view/View;II)V

    invoke-static {p2, p3}, Lr9i;->K(II)Z

    move-result p1

    if-eqz p1, :cond_f

    iget-object p1, p0, Lab2;->b:Lja2;

    check-cast p1, Lj82;

    if-nez p1, :cond_10

    :cond_f
    return-void

    :cond_10
    check-cast p1, Lpue;

    iget-object p1, p1, Lj82;->c:Loqe;

    iget-object p0, p0, Lov8;->k:Lyhe;

    if-eqz p1, :cond_23

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Luqe;

    iget-object p0, p0, Luqe;->h:Luy8;

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Luy8;->j(Loqe;I)V

    return-void

    :cond_23
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public final V(Lja2;Z)V
    .registers 15

    invoke-super {p0, p1, p2}, Lou8;->V(Lja2;Z)V

    if-nez p2, :cond_4a

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p1

    check-cast p1, Lj82;

    check-cast p1, Lpue;

    iget-object p1, p1, Lj82;->c:Loqe;

    instance-of p2, p1, Lmsh;

    if-eqz p2, :cond_4a

    iget-object p2, p0, Lov8;->l:Lvs;

    iget-object v0, p2, Lvs;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    check-cast p1, Lmsh;

    iget-wide v1, p1, Lmsh;->o:J

    const-wide/16 v3, 0x3e8

    mul-long v5, v1, v3

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    const-wide/32 v9, 0xea60

    const/high16 v11, 0x40000

    invoke-static/range {v5 .. v11}, Landroid/text/format/DateUtils;->getRelativeTimeSpanString(JJJI)Ljava/lang/CharSequence;

    move-result-object p1

    iget-object p2, p2, Lvs;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/StylingTextView;

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v1, 0x7f140757

    filled-new-array {v0, p1}, [Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v1, p1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_4a
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 4

    invoke-super {p0, p1}, Lou8;->onClick(Landroid/view/View;)V

    iget-object v0, p0, Lab2;->b:Lja2;

    check-cast v0, Lj82;

    if-eqz v0, :cond_27

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-ne p1, v1, :cond_27

    check-cast v0, Lpue;

    iget-object p1, v0, Lj82;->c:Loqe;

    instance-of v0, p1, Lmsh;

    iget-object p0, p0, Lov8;->k:Lyhe;

    if-eqz v0, :cond_24

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Luqe;

    iget-object p0, p0, Luqe;->h:Luy8;

    check-cast p1, Lmsh;

    const/4 v0, 0x1

    invoke-virtual {p0, v0, p1}, Luy8;->h(ILmsh;)V

    return-void

    :cond_24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_27
    return-void
.end method
