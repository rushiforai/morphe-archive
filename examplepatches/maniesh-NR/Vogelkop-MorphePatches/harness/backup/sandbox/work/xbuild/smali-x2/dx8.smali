.class public final Ldx8;
.super Lou8;
.source "SourceFile"


# instance fields
.field public final k:Lkf;


# direct methods
.method public constructor <init>(Lr9i;Landroid/view/View;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Lou8;-><init>(Lr9i;Landroid/view/View;)V

    move-object p1, p2

    check-cast p1, Landroid/widget/FrameLayout;

    const v0, 0x7f0a0469

    invoke-static {v0, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/widget/RoundedImageView;

    if-eqz v1, :cond_51

    const v0, 0x7f0a046a

    invoke-static {v0, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_51

    invoke-static {v1}, Lov0;->d(Landroid/view/View;)Lov0;

    const v0, 0x7f0a046d

    invoke-static {v0, p2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    if-eqz v1, :cond_51

    new-instance p2, Lkf;

    const/16 v0, 0xc

    invoke-direct {p2, v0, p1, v1}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    iput-object p2, p0, Ldx8;->k:Lkf;

    new-instance p2, Lcx8;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lcx8;-><init>(Ldx8;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v0

    if-eqz v0, :cond_40

    invoke-static {v0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_40
    new-instance p1, Lcx8;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lcx8;-><init>(Ldx8;B)V

    invoke-static {v1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p0

    if-nez p0, :cond_4d

    return-void

    :cond_4d
    invoke-static {p0, v1, p1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void

    :cond_51
    invoke-virtual {p2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

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

    invoke-super {p0, p1, p2}, Lou8;->V(Lja2;Z)V

    iget-object p1, p0, Lou8;->i:Lov0;

    if-eqz p1, :cond_19

    iget-object p1, p1, Lov0;->b:Landroid/view/View;

    check-cast p1, Landroid/widget/LinearLayout;

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setForeground(Landroid/graphics/drawable/Drawable;)V

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setFocusable(Z)V

    :cond_19
    invoke-virtual {p0}, Ldx8;->e0()V

    invoke-virtual {p0}, Ldx8;->f0()V

    return-void
.end method

.method public final c0()Lcmg;
    .registers 1

    sget-object p0, Lcmg;->c:Lcmg;

    return-object p0
.end method

.method public final e0()V
    .registers 4

    iget-object v0, p0, Lab2;->b:Lja2;

    check-cast v0, Lj82;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    check-cast v0, Lpue;

    iget-object v0, v0, Lj82;->c:Loqe;

    goto :goto_d

    :cond_c
    move-object v0, v1

    :goto_d
    instance-of v2, v0, Ld9i;

    if-eqz v2, :cond_14

    move-object v1, v0

    check-cast v1, Ld9i;

    :cond_14
    if-eqz v1, :cond_40

    iget-object v0, v1, Lmsh;->z:Lxlg;

    if-eqz v0, :cond_40

    iget-object p0, p0, Ldx8;->k:Lkf;

    iget-object v1, p0, Lkf;->b:Landroid/view/View;

    check-cast v1, Landroid/widget/FrameLayout;

    sget-object v2, Le9i;->f:Lwu5;

    iget-object v0, v0, Lxlg;->m:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lwu5;->h(Ljava/lang/String;)Le9i;

    move-result-object v0

    iget-object v0, v0, Le9i;->c:Ldxh;

    iget-object p0, p0, Lkf;->b:Landroid/view/View;

    check-cast p0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    invoke-static {p0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p0

    invoke-virtual {v1, p0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    :cond_40
    return-void
.end method

.method public final f0()V
    .registers 4

    iget-object v0, p0, Lab2;->b:Lja2;

    check-cast v0, Lj82;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    check-cast v0, Lpue;

    iget-object v0, v0, Lj82;->c:Loqe;

    goto :goto_d

    :cond_c
    move-object v0, v1

    :goto_d
    instance-of v2, v0, Ld9i;

    if-eqz v2, :cond_14

    move-object v1, v0

    check-cast v1, Ld9i;

    :cond_14
    if-eqz v1, :cond_3c

    iget-object v0, v1, Lmsh;->z:Lxlg;

    if-eqz v0, :cond_3c

    iget-object p0, p0, Ldx8;->k:Lkf;

    iget-object v1, p0, Lkf;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    sget-object v2, Le9i;->f:Lwu5;

    iget-object v0, v0, Lxlg;->m:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lwu5;->h(Ljava/lang/String;)Le9i;

    move-result-object v0

    iget-object v0, v0, Le9i;->b:Ldxh;

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcxh;->a(Landroid/content/Context;)I

    move-result p0

    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(I)V

    :cond_3c
    return-void
.end method
