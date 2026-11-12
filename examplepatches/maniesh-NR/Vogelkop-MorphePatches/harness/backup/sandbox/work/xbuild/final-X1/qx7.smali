.class public final Lqx7;
.super Llj;
.source "SourceFile"


# instance fields
.field public final r:Lgjm;

.field public s:Lkf;


# direct methods
.method public constructor <init>(Lgjm;)V
    .registers 4

    const v0, 0x7f0d0097

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    const v1, 0x7f140377

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    iput-boolean v1, v0, Litl;->e:Z

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    iput-object p1, p0, Lqx7;->r:Lgjm;

    return-void
.end method


# virtual methods
.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lqx7;->s:Lkf;

    if-nez p1, :cond_8

    const/4 p1, 0x0

    :cond_8
    iget-object p1, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p1, Landroidx/emoji2/emojipicker/EmojiPickerView;

    new-instance p2, Lip1;

    const/4 v0, 0x4

    invoke-direct {p2, p0, v0}, Lip1;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p1, Landroidx/emoji2/emojipicker/EmojiPickerView;->k:Lip1;

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 5

    const p1, 0x7f0a02a9

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object p2, p1

    check-cast p2, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const v0, 0x7f0a0831

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroidx/emoji2/emojipicker/EmojiPickerView;

    if-eqz v1, :cond_39

    new-instance p1, Lkf;

    const/4 v0, 0x5

    invoke-direct {p1, v0, p2, v1}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    iput-object p1, p0, Lqx7;->s:Lkf;

    invoke-virtual {p0, p2, v1}, Lltl;->p0(Landroid/view/View;Landroid/view/View;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/opera/android/utilities/DisplayUtil;->e(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_38

    iget-object p0, p0, Lqx7;->s:Lkf;

    if-nez p0, :cond_2f

    const/4 p0, 0x0

    :cond_2f
    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/emoji2/emojipicker/EmojiPickerView;

    const/16 p1, 0xf

    invoke-virtual {p0, p1}, Landroidx/emoji2/emojipicker/EmojiPickerView;->c(I)V

    :cond_38
    return-void

    :cond_39
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
