.class public final Lh63;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lcom/opera/android/widget/FaqItemView;Lcom/opera/android/custom_views/StylingTextView;)V
    .registers 3

    const/4 p1, 0x1

    iput-byte p1, p0, Lh63;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lh63;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lh63;->a:B

    iput-object p1, p0, Lh63;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final A(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final B(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final a(Landroid/text/Editable;)V
    .registers 2

    return-void
.end method

.method private final b(Landroid/text/Editable;)V
    .registers 2

    return-void
.end method

.method private final j(Landroid/text/Editable;)V
    .registers 2

    return-void
.end method

.method private final k(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final l(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final m(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final n(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final o(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final p(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final q(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final r(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final s(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final t(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final u(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final v(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final w(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final x(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final y(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method

.method private final z(IIILjava/lang/CharSequence;)V
    .registers 5

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 8

    iget-byte v0, p0, Lh63;->a:B

    const-string v1, ""

    const/4 v2, 0x1

    const/16 v3, 0x8

    const/4 v4, 0x0

    const/4 v5, 0x0

    iget-object p0, p0, Lh63;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_13a

    return-void

    :pswitch_f
    check-cast p0, Lcom/opera/android/uninstall/UninstallSurveyFragment;

    invoke-virtual {p0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->I0()Lrlm;

    move-result-object v0

    iget-object v0, v0, Lrlm;->c:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnlm;

    if-eqz p1, :cond_23

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_23
    invoke-static {v0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->H0(Lnlm;)Ljava/lang/Integer;

    move-result-object p1

    if-eqz p1, :cond_3e

    invoke-virtual {p1}, Ljava/lang/Number;->intValue()I

    move-result p1

    invoke-virtual {p0}, Lcom/opera/android/uninstall/UninstallSurveyFragment;->I0()Lrlm;

    move-result-object p0

    iget-object v0, v0, Lnlm;->c:Ljava/util/Set;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-virtual {p0, p1, v4, v0}, Lrlm;->h(ILjava/lang/String;Z)V

    :cond_3e
    return-void

    :pswitch_3f
    check-cast p0, Lcom/opera/hype/image/editor/TextBoxEditText;

    if-eqz p1, :cond_56

    iget-object v0, p0, Lcom/opera/hype/image/editor/TextBoxEditText;->j:Lfz2;

    sget-object v1, Lcom/opera/hype/image/editor/TextBoxEditText;->o:[Lxtb;

    aget-object v1, v1, v5

    iget-object v0, v0, La7f;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->intValue()I

    move-result v0

    if-eqz v0, :cond_56

    invoke-virtual {p0, p1}, Lcom/opera/hype/image/editor/TextBoxEditText;->u(Landroid/text/Editable;)V

    :cond_56
    :pswitch_56
    return-void

    :pswitch_57
    check-cast p0, Lr9l;

    iget-object p1, p0, Lr9l;->v:Lpde;

    iget-object p0, p0, Lr9l;->q:Lebl;

    iget-object v0, p0, Lebl;->o:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v1

    if-eqz v0, :cond_80

    invoke-static {v0}, Lkotlin/text/StringsKt;->N(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_80

    new-instance v4, Lesi;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lkotlin/text/StringsKt;->l0(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0, v1}, Lesi;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    :cond_80
    invoke-virtual {p1, v4}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Lebl;->n:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_8c

    move v3, v5

    :cond_8c
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_90
    check-cast p0, Lc9j;

    sget-object p1, Lc9j;->w:[Lxtb;

    invoke-virtual {p0, v2}, Lc9j;->I0(Z)V

    :pswitch_97
    return-void

    :pswitch_98
    check-cast p0, Lh9c;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    iget-object v3, p0, Lh9c;->a:Lk7c;

    if-eqz v0, :cond_ab

    iget p1, v3, Lk7c;->a:I

    const/4 v0, 0x6

    if-eq p1, v0, :cond_da

    const/4 v0, 0x7

    if-ne p1, v0, :cond_c3

    goto :goto_da

    :cond_ab
    iget v0, v3, Lk7c;->a:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    if-eq v0, v2, :cond_d0

    const/4 v3, 0x2

    if-eq v0, v3, :cond_c5

    const/4 v3, 0x4

    if-ne v0, v3, :cond_da

    :try_start_b9
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_c1
    .catch Ljava/lang/NumberFormatException; {:try_start_b9 .. :try_end_c1} :catch_c3

    if-gtz p1, :cond_da

    :catch_c3
    :cond_c3
    move v2, v5

    goto :goto_da

    :cond_c5
    sget-object v0, Landroid/util/Patterns;->EMAIL_ADDRESS:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    goto :goto_da

    :cond_d0
    sget-object v0, Landroid/util/Patterns;->PHONE:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    :cond_da
    :goto_da
    iget-object p1, p0, Lh9c;->c:Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v2, :cond_e2

    invoke-virtual {p1, v1}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    goto :goto_e7

    :cond_e2
    const-string v0, " "

    invoke-virtual {p1, v0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    :goto_e7
    iget-boolean p1, p0, Lh9c;->f:Z

    if-eq p1, v2, :cond_f2

    iput-boolean v2, p0, Lh9c;->f:Z

    iget-object p0, p0, Lh9c;->e:Ldnb;

    invoke-virtual {p0}, Ldnb;->run()V

    :cond_f2
    return-void

    :pswitch_f3
    check-cast p0, Lcom/opera/android/bar/FindInPage;

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->m:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    iget-object v0, v0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;->a:Ll2c;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcs5;->J(Ljava/lang/CharSequence;)I

    move-result p1

    invoke-virtual {v0, p1}, Ll2c;->d(I)V

    iget-object p1, p0, Lcom/opera/android/bar/FindInPage;->m:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-static {p1}, Lcs5;->W(Landroid/view/View;)Z

    move-result p1

    iget-object p0, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    if-eqz p1, :cond_110

    const/4 p1, 0x5

    goto :goto_111

    :cond_110
    const/4 p1, 0x3

    :goto_111
    or-int/lit8 p1, p1, 0x10

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setGravity(I)V

    return-void

    :pswitch_117
    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    sget p1, Lcom/opera/android/widget/FaqItemView;->t:I

    invoke-virtual {p0}, Lyq1;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    if-eqz p1, :cond_128

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-eqz p1, :cond_128

    move v3, v5

    :cond_128
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_12c
    check-cast p0, Ldw7;

    if-eqz p1, :cond_134

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_134
    if-eqz v4, :cond_137

    move-object v1, v4

    :cond_137
    iput-object v1, p0, Ldw7;->b:Ljava/lang/String;

    return-void

    :pswitch_data_13a
    .packed-switch 0x0
        :pswitch_12c
        :pswitch_117
        :pswitch_f3
        :pswitch_98
        :pswitch_97
        :pswitch_90
        :pswitch_57
        :pswitch_56
        :pswitch_3f
        :pswitch_f
    .end packed-switch
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    iget-byte p0, p0, Lh63;->a:B

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    iget-byte p2, p0, Lh63;->a:B

    iget-object p0, p0, Lh63;->b:Ljava/lang/Object;

    packed-switch p2, :pswitch_data_9e

    check-cast p0, Lnen;

    iget-object p0, p0, Lnen;->a:Lwtm;

    iget-object p0, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Loen;

    const/4 p3, 0x0

    const/4 p4, 0x5

    invoke-static {p2, p3, p1, p4}, Loen;->a(Loen;Ljava/lang/Integer;Ljava/lang/CharSequence;I)Loen;

    move-result-object p1

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    :pswitch_1e
    return-void

    :pswitch_1f
    check-cast p0, Lbfl;

    iget-object p0, p0, Lbfl;->d:Lrf2;

    iget-object p0, p0, Lrf2;->e:Landroid/view/View;

    check-cast p0, Lcom/opera/hype/image/editor/TextBoxEditText;

    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    :pswitch_2a
    return-void

    :pswitch_2b
    check-cast p0, Landroidx/appcompat/widget/SearchView;

    iget-object p2, p0, Landroidx/appcompat/widget/SearchView;->p:Landroidx/appcompat/widget/SearchView$SearchAutoComplete;

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    iput-object p2, p0, Landroidx/appcompat/widget/SearchView;->W:Ljava/lang/CharSequence;

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p2

    xor-int/lit8 p3, p2, 0x1

    invoke-virtual {p0, p3}, Landroidx/appcompat/widget/SearchView;->s(Z)V

    invoke-virtual {p0, p2}, Landroidx/appcompat/widget/SearchView;->u(Z)V

    invoke-virtual {p0}, Landroidx/appcompat/widget/SearchView;->o()V

    invoke-virtual {p0}, Landroidx/appcompat/widget/SearchView;->r()V

    iget-object p2, p0, Landroidx/appcompat/widget/SearchView;->J:Lhti;

    if-eqz p2, :cond_5c

    iget-object p2, p0, Landroidx/appcompat/widget/SearchView;->V:Ljava/lang/String;

    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result p2

    if-nez p2, :cond_5c

    iget-object p2, p0, Landroidx/appcompat/widget/SearchView;->J:Lhti;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-interface {p2, p3}, Lhti;->p(Ljava/lang/String;)V

    :cond_5c
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Landroidx/appcompat/widget/SearchView;->V:Ljava/lang/String;

    :pswitch_62
    return-void

    :pswitch_63
    check-cast p0, Lcom/opera/android/bar/FindInPage;

    iget-object p2, p0, Lcom/opera/android/bar/FindInPage;->d:Lzg;

    if-eqz p2, :cond_9c

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    const/4 p3, 0x0

    if-eqz p2, :cond_89

    iget-object p1, p0, Lcom/opera/android/bar/FindInPage;->d:Lzg;

    iget-object p1, p1, Lzg;->b:Ljava/lang/Object;

    check-cast p1, Lorg/chromium/content_public/browser/WebContents;

    invoke-static {p1}, LJ/N;->Mjhb9sjl(Ljava/lang/Object;)V

    const-string p1, ""

    iput-object p1, p0, Lcom/opera/android/bar/FindInPage;->c:Ljava/lang/String;

    iput p3, p0, Lcom/opera/android/bar/FindInPage;->e:I

    iput p3, p0, Lcom/opera/android/bar/FindInPage;->f:I

    invoke-virtual {p0}, Lcom/opera/android/bar/FindInPage;->g()V

    goto :goto_9c

    :cond_89
    iput-object p1, p0, Lcom/opera/android/bar/FindInPage;->c:Ljava/lang/String;

    const/4 p2, 0x1

    iput-boolean p2, p0, Lcom/opera/android/bar/FindInPage;->g:Z

    iget-object p0, p0, Lcom/opera/android/bar/FindInPage;->d:Lzg;

    iput-object p1, p0, Lzg;->c:Ljava/lang/Object;

    iget-object p4, p0, Lzg;->b:Ljava/lang/Object;

    check-cast p4, Lorg/chromium/content_public/browser/WebContents;

    invoke-static {p4, p1, p2, p3}, LJ/N;->MaMXv1PI(Ljava/lang/Object;Ljava/lang/Object;ZZ)I

    move-result p1

    iput p1, p0, Lzg;->a:I

    :cond_9c
    :goto_9c
    :pswitch_9c
    return-void

    nop

    :pswitch_data_9e
    .packed-switch 0x0
        :pswitch_9c
        :pswitch_9c
        :pswitch_63
        :pswitch_62
        :pswitch_2b
        :pswitch_2a
        :pswitch_2a
        :pswitch_1f
        :pswitch_1e
        :pswitch_1e
    .end packed-switch
.end method
