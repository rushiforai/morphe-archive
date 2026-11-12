.class public Lcom/opera/android/bar/FindInPage;
.super Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;
.source "SourceFile"


# static fields
.field public static final synthetic w:I


# instance fields
.field public c:Ljava/lang/String;

.field public d:Lzg;

.field public e:I

.field public f:I

.field public g:Z

.field public h:Lcom/opera/android/custom_views/StylingImageView;

.field public i:Lcom/opera/android/custom_views/StylingImageView;

.field public j:Lcom/opera/android/custom_views/StylingImageView;

.field public k:Landroid/widget/TextView;

.field public l:Lcom/opera/android/custom_views/ObservableEditText;

.field public m:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

.field public n:Ljava/lang/String;

.field public o:Ljava/lang/String;

.field public p:Z

.field public final q:Lic;

.field public final r:Lh63;

.field public final s:Lx39;

.field public final t:Ly39;

.field public final u:Lz39;

.field public v:Lqie;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const-string p1, ""

    iput-object p1, p0, Lcom/opera/android/bar/FindInPage;->c:Ljava/lang/String;

    iput-object p1, p0, Lcom/opera/android/bar/FindInPage;->n:Ljava/lang/String;

    iput-object p1, p0, Lcom/opera/android/bar/FindInPage;->o:Ljava/lang/String;

    new-instance p1, Lic;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lic;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/bar/FindInPage;->q:Lic;

    new-instance p1, Lh63;

    const/4 p2, 0x2

    invoke-direct {p1, p0, p2}, Lh63;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/bar/FindInPage;->r:Lh63;

    new-instance p1, Lx39;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lx39;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/bar/FindInPage;->s:Lx39;

    new-instance p1, Ly39;

    invoke-direct {p1, p0, p2}, Ly39;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/bar/FindInPage;->t:Ly39;

    new-instance p1, Lz39;

    invoke-direct {p1, p0, p2}, Lz39;-><init>(Landroid/view/View;B)V

    iput-object p1, p0, Lcom/opera/android/bar/FindInPage;->u:Lz39;

    return-void
.end method


# virtual methods
.method public final f()V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/bar/FindInPage;->p:Z

    iget-object v1, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    if-eqz v0, :cond_11

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Laik;->c(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/bar/FindInPage;->o:Ljava/lang/String;

    goto :goto_1b

    :cond_11
    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-static {v0}, Laik;->c(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/bar/FindInPage;->n:Ljava/lang/String;

    :goto_1b
    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->d:Lzg;

    if-eqz v0, :cond_2d

    iget-object v0, v0, Lzg;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/content_public/browser/WebContents;

    invoke-static {v0}, LJ/N;->Mjhb9sjl(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->d:Lzg;

    const/4 v1, 0x0

    iput-object v1, v0, Lzg;->d:Ljava/lang/Object;

    iput-object v1, p0, Lcom/opera/android/bar/FindInPage;->d:Lzg;

    :cond_2d
    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {v0}, Landroid/view/View;->clearFocus()V

    const v0, 0x7f0a0494

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    iget-object p0, p0, Lcom/opera/android/bar/FindInPage;->v:Lqie;

    if-eqz p0, :cond_5d

    iget-object p0, p0, Lqie;->b:Ljava/lang/Object;

    check-cast p0, Lgbf;

    iget-object v0, p0, Lgbf;->v:Lkze;

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v0, p0, Lgbf;->b:Lz43;

    iget-object v1, p0, Lgbf;->u:Lcom/opera/android/bar/FindInPage;

    iget-object v0, v0, Lz43;->e:Ljava/lang/Object;

    check-cast v0, Lysl;

    invoke-interface {v0, v1}, Lysl;->f0(Ljava/lang/Object;)V

    iget-object p0, p0, Lgbf;->u:Lcom/opera/android/bar/FindInPage;

    const/16 v0, 0x8

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_5d
    return-void
.end method

.method public final g()V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->i:Lcom/opera/android/custom_views/StylingImageView;

    iget v1, p0, Lcom/opera/android/bar/FindInPage;->e:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-le v1, v3, :cond_a

    move v1, v3

    goto :goto_b

    :cond_a
    move v1, v2

    :goto_b
    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->j:Lcom/opera/android/custom_views/StylingImageView;

    iget v1, p0, Lcom/opera/android/bar/FindInPage;->e:I

    if-gt v1, v3, :cond_15

    move v3, v2

    :cond_15
    invoke-virtual {v0, v3}, Landroid/view/View;->setEnabled(Z)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->k:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-gtz v1, :cond_28

    const/16 v2, 0x8

    :cond_28
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->k:Landroid/widget/TextView;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p0, Lcom/opera/android/bar/FindInPage;->f:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    iget v3, p0, Lcom/opera/android/bar/FindInPage;->e:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v2, v3}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f14077e

    invoke-virtual {v1, v3, v2}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->k:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/bar/FindInPage;->k:Landroid/widget/TextView;

    iget v2, p0, Lcom/opera/android/bar/FindInPage;->e:I

    if-lez v2, :cond_5e

    iget-object p0, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    invoke-virtual {p0}, Landroid/widget/TextView;->getHintTextColors()Landroid/content/res/ColorStateList;

    move-result-object p0

    goto :goto_62

    :cond_5e
    invoke-static {v0}, Lf03;->y(Landroid/content/Context;)Landroid/content/res/ColorStateList;

    move-result-object p0

    :goto_62
    invoke-virtual {v1, p0}, Landroid/widget/TextView;->setTextColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public final onFinishInflate()V
    .registers 4

    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    const v0, 0x7f0a0492

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    iput-object v0, p0, Lcom/opera/android/bar/FindInPage;->h:Lcom/opera/android/custom_views/StylingImageView;

    const v0, 0x7f0a049a

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    iput-object v0, p0, Lcom/opera/android/bar/FindInPage;->i:Lcom/opera/android/custom_views/StylingImageView;

    const v0, 0x7f0a0499

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    iput-object v0, p0, Lcom/opera/android/bar/FindInPage;->j:Lcom/opera/android/custom_views/StylingImageView;

    const v0, 0x7f0a0493

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/opera/android/bar/FindInPage;->k:Landroid/widget/TextView;

    const v0, 0x7f0a0494

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/ObservableEditText;

    iput-object v0, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    const v0, 0x7f0a0495

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    iput-object v0, p0, Lcom/opera/android/bar/FindInPage;->m:Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->h:Lcom/opera/android/custom_views/StylingImageView;

    iget-object v1, p0, Lcom/opera/android/bar/FindInPage;->q:Lic;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->i:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->j:Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    iget-object v1, p0, Lcom/opera/android/bar/FindInPage;->r:Lh63;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    iget-object v1, p0, Lcom/opera/android/bar/FindInPage;->s:Lx39;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setOnEditorActionListener(Landroid/widget/TextView$OnEditorActionListener;)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    iget-object v1, p0, Lcom/opera/android/bar/FindInPage;->t:Ly39;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->l:Lcom/opera/android/custom_views/ObservableEditText;

    iget-object v1, p0, Lcom/opera/android/bar/FindInPage;->u:Lz39;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    iget-object v0, p0, Lcom/opera/android/bar/FindInPage;->k:Landroid/widget/TextView;

    new-instance v1, Lpc5;

    const/16 v2, 0x14

    invoke-direct {v1, p0, v2}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    return-void
.end method
