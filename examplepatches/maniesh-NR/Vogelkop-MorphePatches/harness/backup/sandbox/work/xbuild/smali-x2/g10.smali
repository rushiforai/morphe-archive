.class public abstract Lg10;
.super Ll00;
.source "SourceFile"

# interfaces
.implements Lya2;


# instance fields
.field public final E:Landroid/widget/LinearLayout;

.field public final F:Ljsd;

.field public final G:Lw00;


# direct methods
.method public constructor <init>(Landroid/view/View;Lkze;)V
    .registers 5

    new-instance v0, Lf10;

    invoke-direct {v0, p1}, Lf10;-><init>(Landroid/view/View;)V

    invoke-direct {p0, p1, v0, p2}, Lxv8;-><init>(Landroid/view/View;Lwv8;Lize;)V

    new-instance p2, Landroid/widget/LinearLayout;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lg10;->E:Landroid/widget/LinearLayout;

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    new-instance p2, Ljsd;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p2, v0}, Ljsd;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lg10;->F:Ljsd;

    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {v0, v1, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/4 v1, -0x2

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->height:I

    invoke-virtual {p2, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    invoke-virtual {p0, p2}, Lxv8;->h0(Landroid/view/View;)V

    new-instance p2, Lw00;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Lw00;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lg10;->G:Lw00;

    iget-object p0, p0, Lxv8;->p:Landroid/widget/TextView;

    invoke-static {p0}, Lvwj;->a(Landroid/widget/TextView;)V

    return-void
.end method

.method public static n0(Landroid/view/View;)V
    .registers 3

    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method

.method public static o0(Lcie;Landroid/view/View;)Ljava/lang/CharSequence;
    .registers 6

    iget-object v0, p0, Lcie;->z:Ljava/lang/String;

    sget-object v1, Laik;->a:[Ljava/lang/String;

    const-string v1, ""

    if-nez v0, :cond_9

    move-object v0, v1

    :cond_9
    iget-object v2, p0, Lbzo;->d:Lw06;

    sget-object v3, Lw06;->f:Lw06;

    if-ne v2, v3, :cond_18

    iget-boolean v2, p0, Lcie;->J:Z

    if-eqz v2, :cond_21

    iget-object p0, p0, Lcie;->K:Ljava/lang/String;

    if-nez p0, :cond_20

    goto :goto_21

    :cond_18
    iget-boolean v2, p0, Lcie;->s:Z

    if-eqz v2, :cond_21

    iget-object p0, p0, Lcie;->t:Ljava/lang/String;

    if-eqz p0, :cond_21

    :cond_20
    move-object v1, p0

    :cond_21
    :goto_21
    sget p0, Lx00;->f:I

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_42

    new-instance p0, Landroid/text/SpannableString;

    invoke-direct {p0, v1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    new-instance v1, Lx00;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {v1, p1}, Lagc;-><init>(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroid/text/SpannableString;->length()I

    move-result p1

    const/16 v2, 0x21

    const/4 v3, 0x0

    invoke-virtual {p0, v1, v3, p1, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    move-object v1, p0

    :cond_42
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_49

    return-object v1

    :cond_49
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-eqz p0, :cond_50

    return-object v0

    :cond_50
    new-instance p0, Landroid/text/SpannableStringBuilder;

    invoke-direct {p0, v0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    const-string p1, " "

    invoke-virtual {p0, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    invoke-virtual {p0, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    return-object p0
.end method

.method public static p0(ILandroid/view/View;)V
    .registers 4

    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout$LayoutParams;->removeRule(I)V

    const/4 v1, 0x3

    invoke-virtual {v0, v1, p0}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public final R()V
    .registers 4

    invoke-virtual {p0}, Ll00;->m0()Lx10;

    move-result-object v0

    invoke-virtual {v0}, Lja2;->d()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_10

    iget-object v1, v0, Lja2;->a:Lu0g;

    iput-object v2, v0, Lja2;->a:Lu0g;

    goto :goto_11

    :cond_10
    move-object v1, v2

    :goto_11
    if-eqz v1, :cond_1d

    const v0, 0x7f0a0443

    invoke-virtual {v1, v0}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Landroid/os/Parcelable;

    :cond_1d
    instance-of v0, v2, Landroid/os/Bundle;

    if-eqz v0, :cond_24

    check-cast v2, Landroid/os/Bundle;

    goto :goto_26

    :cond_24
    sget-object v2, Landroid/os/Bundle;->EMPTY:Landroid/os/Bundle;

    :goto_26
    invoke-virtual {p0, v2}, Lg10;->q0(Landroid/os/Bundle;)V

    return-void
.end method

.method public V(Lja2;Z)V
    .registers 3

    invoke-super {p0, p1, p2}, Lxv8;->V(Lja2;Z)V

    if-eqz p2, :cond_6

    return-void

    :cond_6
    invoke-virtual {p0}, Ll00;->m0()Lx10;

    move-result-object p1

    new-instance p2, Lsz;

    invoke-direct {p2, p0}, Lsz;-><init>(Lg10;)V

    iput-object p2, p1, Lx10;->p:Lsz;

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p1

    iget-object p1, p1, Lw10;->u:Lcie;

    iget-object p0, p0, Lg10;->G:Lw00;

    iput-object p0, p1, Lcie;->T:Ly55;

    return-void
.end method

.method public final X(Z)V
    .registers 6

    if-eqz p1, :cond_3

    return-void

    :cond_3
    iget-object p1, p0, Lxv8;->p:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {p1}, Lphj;->Z(Landroid/widget/TextView;)V

    new-instance p1, Lgf;

    const/16 v1, 0xa

    invoke-direct {p1, p0, v1}, Lgf;-><init>(Ljava/lang/Object;B)V

    sget v1, Lx00;->f:I

    instance-of v1, v0, Landroid/text/Spannable;

    if-eqz v1, :cond_30

    move-object v1, v0

    check-cast v1, Landroid/text/Spannable;

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const-class v2, Lx00;

    const/4 v3, 0x0

    invoke-interface {v1, v3, v0, v2}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lx00;

    array-length v1, v0

    if-lez v1, :cond_30

    aget-object v0, v0, v3

    iput-object p1, v0, Lx00;->e:Landroid/view/View$OnClickListener;

    :cond_30
    invoke-virtual {p0}, Lg10;->R()V

    return-void
.end method

.method public final Y()V
    .registers 3

    invoke-super {p0}, Lo43;->Y()V

    invoke-virtual {p0}, Lg10;->t()V

    invoke-virtual {p0}, Ll00;->m0()Lx10;

    move-result-object v0

    const/4 v1, 0x0

    iput-object v1, v0, Lx10;->p:Lsz;

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p0

    iget-object p0, p0, Lw10;->u:Lcie;

    sget-object v0, Ly55;->a:Ly55;

    iput-object v0, p0, Lcie;->T:Ly55;

    return-void
.end method

.method public final i(Z)V
    .registers 4

    invoke-super {p0, p1}, Ll00;->i(Z)V

    iget-object v0, p0, Lg10;->E:Landroid/widget/LinearLayout;

    if-eqz p1, :cond_27

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object p1

    iget-object p1, p1, Lw10;->u:Lcie;

    iget-object p0, p0, Lg10;->F:Ljsd;

    iget-object p0, p0, Ljsd;->a:Ljava/util/HashMap;

    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfjo;

    instance-of p1, p0, Lz5p;

    if-eqz p1, :cond_34

    check-cast p0, Lz5p;

    new-instance p1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v1, -0x1

    invoke-direct {p1, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    return-void

    :cond_27
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    instance-of p1, p0, Landroid/view/ViewGroup;

    if-eqz p1, :cond_34

    check-cast p0, Landroid/view/ViewGroup;

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_34
    return-void
.end method

.method public abstract q0(Landroid/os/Bundle;)V
.end method

.method public abstract r0(Landroid/os/Bundle;)V
.end method

.method public final s0(Lcie;)V
    .registers 6

    iget-object p0, p0, Lg10;->E:Landroid/widget/LinearLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d0159

    const/4 v2, 0x1

    invoke-virtual {v0, v1, p0, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a00be

    invoke-static {p0, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Laik;->c(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f0a00bd

    invoke-static {p0, v1}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/View;

    check-cast p0, Landroid/widget/TextView;

    iget-object p1, p1, Lcie;->D:Ljava/lang/String;

    if-nez p1, :cond_37

    const-string p1, ""

    :cond_37
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v3, 0x0

    if-nez v1, :cond_44

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_45

    :cond_44
    move v2, v3

    :cond_45
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-nez v2, :cond_4c

    const/16 v3, 0x8

    :cond_4c
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final t()V
    .registers 4

    new-instance v0, Lu0g;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const v2, 0x7f0a0443

    invoke-virtual {v0, v2, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    invoke-virtual {p0, v1}, Lg10;->r0(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Ll00;->m0()Lx10;

    move-result-object p0

    iput-object v0, p0, Lja2;->a:Lu0g;

    return-void
.end method
