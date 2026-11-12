.class public final synthetic Lup2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnFocusChangeListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lup2;->a:B

    iput-object p1, p0, Lup2;->b:Ljava/lang/Object;

    iput-object p2, p0, Lup2;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onFocusChange(Landroid/view/View;Z)V
    .registers 5

    iget-byte p1, p0, Lup2;->a:B

    const/4 v0, 0x0

    iget-object v1, p0, Lup2;->c:Ljava/lang/Object;

    iget-object p0, p0, Lup2;->b:Ljava/lang/Object;

    packed-switch p1, :pswitch_data_6e

    check-cast p0, Lcom/opera/android/custom_views/OperaEditText;

    check-cast v1, Lmrn;

    iget-object p1, v1, Lmrn;->j:Lcom/opera/android/custom_views/OperaEditText;

    invoke-virtual {p0}, Landroid/view/View;->isShown()Z

    move-result p0

    if-eqz p0, :cond_2c

    if-eqz p2, :cond_21

    sget-object p0, Lq9n;->c:Ll5b;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1}, Lq9n;->G(Landroid/content/Context;Landroid/view/View;)Z

    :cond_21
    iget-object p0, v1, Lmrn;->p:Lkrn;

    new-instance p1, Lirn;

    invoke-direct {p1, p2}, Lirn;-><init>(Z)V

    invoke-interface {p0, p1}, Lkrn;->f(Ltc2;)V

    goto :goto_2f

    :cond_2c
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    :goto_2f
    return-void

    :pswitch_30
    check-cast p0, Landroid/widget/EditText;

    check-cast v1, Ljava/util/concurrent/atomic/AtomicInteger;

    if-nez p2, :cond_3a

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    :cond_3a
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setHintTextColor(I)V

    return-void

    :pswitch_3e
    check-cast p0, Lcom/opera/hype/image/editor/EditImage;

    check-cast v1, Lbfl;

    if-eqz p2, :cond_4a

    sget-object p1, Lcom/opera/hype/image/editor/EditImage;->s:[Lxtb;

    invoke-virtual {p0, v1, v0}, Lcom/opera/hype/image/editor/EditImage;->a(Lbfl;Z)V

    goto :goto_52

    :cond_4a
    iget-object p1, p0, Lcom/opera/hype/image/editor/EditImage;->j:Lbfl;

    if-ne p1, v1, :cond_52

    const/4 p1, 0x1

    invoke-virtual {p0, p1, v0}, Lcom/opera/hype/image/editor/EditImage;->c(ZZ)Z

    :cond_52
    :goto_52
    return-void

    :pswitch_53
    check-cast p0, Lwp2;

    check-cast v1, Lfw;

    iget-object p1, p0, Lwp2;->c:Lcom/google/android/material/textfield/TextInputLayout;

    if-nez p2, :cond_6d

    iget-object p2, p1, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, v1, p2}, Ltp2;->Y(Lfw;Ljava/lang/String;)V

    iget-object p0, v1, Lfw;->e:Ljava/lang/String;

    invoke-virtual {p1, p0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    :cond_6d
    return-void

    :pswitch_data_6e
    .packed-switch 0x0
        :pswitch_53
        :pswitch_3e
        :pswitch_30
    .end packed-switch
.end method
