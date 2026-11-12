.class public final synthetic Lzp2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lzp2;->a:B

    iput-object p1, p0, Lzp2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .registers 7

    iget-byte v0, p0, Lzp2;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lzp2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_106

    check-cast p0, Lorg/chromium/ui/base/WindowAndroid;

    sget-object p1, Lorg/chromium/ui/base/WindowAndroid;->B:Lb2b;

    iget-object p1, p0, Lorg/chromium/ui/base/WindowAndroid;->s:Landroid/view/View$OnFocusChangeListener;

    if-eqz p1, :cond_16

    iget-object v0, p0, Lorg/chromium/ui/base/WindowAndroid;->p:Landroid/view/View;

    invoke-interface {p1, v0, p2}, Landroid/view/View$OnFocusChangeListener;->onFocusChange(Landroid/view/View;Z)V

    :cond_16
    if-nez p2, :cond_1c

    const/4 p1, 0x1

    invoke-virtual {p0, p1, p1}, Lorg/chromium/ui/base/WindowAndroid;->q(ZZ)V

    :cond_1c
    return-void

    :pswitch_1d
    check-cast p0, Lorg/chromium/ui/widget/TextViewWithClickableSpans;

    sget p1, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->l:I

    if-nez p2, :cond_24

    const/4 v2, -0x1

    :cond_24
    invoke-virtual {p0, v2}, Lorg/chromium/ui/widget/TextViewWithClickableSpans;->v(I)Z

    return-void

    :pswitch_28
    check-cast p0, Lr9l;

    if-nez p2, :cond_52

    iget-boolean p1, p0, Lr9l;->u:Z

    if-eqz p1, :cond_52

    sget-object p1, Lr9l;->F:Ljava/util/LinkedHashMap;

    iget-object p1, p0, Lr9l;->t:Lgal;

    iget-object p1, p1, Lgal;->e:Lp6l;

    iget-object p2, p0, Lr9l;->c:Lk6l;

    iget-object p0, p0, Lr9l;->q:Lebl;

    iget-object p0, p0, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    if-eqz p0, :cond_46

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    :cond_46
    sget-object p0, Lr9l;->F:Ljava/util/LinkedHashMap;

    new-instance v0, Lk9l;

    iget p2, p2, Lk6l;->y:I

    invoke-direct {v0, v1, p2}, Lk9l;-><init>(Ljava/lang/String;I)V

    invoke-interface {p0, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_52
    return-void

    :pswitch_53
    check-cast p0, Lawi;

    if-nez p2, :cond_6d

    iget-object p1, p0, Lawi;->u:Lei;

    iget-object p1, p1, Lei;->d:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p0, p1}, Lawi;->I0(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lawi;->u:Lei;

    iget-object p0, p0, Lei;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    :cond_6d
    return-void

    :pswitch_6e
    check-cast p0, Lfge;

    iget-object p1, p0, Lfge;->C:Landroid/view/View;

    if-eqz p1, :cond_bb

    iget-object p1, p0, Lfge;->G:Landroid/animation/ValueAnimator;

    if-eqz p1, :cond_7d

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    iput-object v1, p0, Lfge;->G:Landroid/animation/ValueAnimator;

    :cond_7d
    const/high16 p1, 0x41800000    # 16.0f

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p1, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    const/high16 v0, 0x42400000    # 48.0f

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {v0, v1}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    const/4 v1, 0x2

    new-array v1, v1, [F

    fill-array-data v1, :array_11c

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    const-wide/16 v2, 0x96

    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lfge;->G:Landroid/animation/ValueAnimator;

    new-instance v2, Lxfe;

    invoke-direct {v2, p0, p2, v0, p1}, Lxfe;-><init>(Lfge;ZII)V

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    iget-object p1, p0, Lfge;->G:Landroid/animation/ValueAnimator;

    new-instance v0, Lin8;

    const/4 v1, 0x3

    invoke-direct {v0, v1, p0, p2}, Lin8;-><init>(BLjava/lang/Object;Z)V

    invoke-virtual {p1, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    iget-object p0, p0, Lfge;->G:Landroid/animation/ValueAnimator;

    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    :cond_bb
    return-void

    :pswitch_bc
    check-cast p0, Lg9c;

    if-eqz p2, :cond_c7

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    invoke-virtual {p0, p1}, Lo73;->o(Landroid/view/View;)V

    goto :goto_ca

    :cond_c7
    invoke-virtual {p0}, Lo73;->b()Z

    :goto_ca
    return-void

    :pswitch_cb
    check-cast p0, Lym7;

    iput-boolean p2, p0, Lym7;->l:Z

    invoke-virtual {p0}, La38;->p()V

    if-nez p2, :cond_d9

    invoke-virtual {p0, v2}, Lym7;->s(Z)V

    iput-boolean v2, p0, Lym7;->m:Z

    :cond_d9
    return-void

    :pswitch_da
    check-cast p0, Lt35;

    invoke-virtual {p0}, Lt35;->t()Z

    move-result p1

    invoke-virtual {p0, p1}, Lt35;->s(Z)V

    return-void

    :pswitch_e4
    check-cast p0, Lfq2;

    if-eqz p2, :cond_f0

    iget-object p0, p0, Lfq2;->g:Liq2;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    :cond_f0
    return-void

    :pswitch_f1
    check-cast p0, Laq2;

    iget-object p1, p0, Laq2;->c:Liq2;

    if-nez p2, :cond_104

    invoke-virtual {p1}, Liq2;->J0()Ljava/lang/String;

    move-result-object p2

    iput-object p2, p1, Liq2;->J:Ljava/lang/String;

    iget-object p0, p0, Laq2;->b:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p1, p1, Liq2;->J:Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    :cond_104
    return-void

    nop

    :pswitch_data_106
    .packed-switch 0x0
        :pswitch_f1
        :pswitch_e4
        :pswitch_da
        :pswitch_cb
        :pswitch_bc
        :pswitch_6e
        :pswitch_53
        :pswitch_28
        :pswitch_1d
    .end packed-switch

    :array_11c
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method
