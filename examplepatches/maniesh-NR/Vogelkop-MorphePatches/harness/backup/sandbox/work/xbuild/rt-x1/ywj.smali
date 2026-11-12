.class public final Lywj;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final o:Ljava/util/regex/Pattern;


# instance fields
.field public final a:Lcom/opera/android/widget/UrlFieldEditText;

.field public final b:Lx5f;

.field public final c:Lip2;

.field public final d:Lip2;

.field public final e:Lip2;

.field public final f:Lrgh;

.field public g:Lxwj;

.field public h:Z

.field public i:Z

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:Z


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const-string v0, "[\\p{script=latin}\\p{script=cyrillic}\\p{script=greek}\\p{script=hebrew}\\p{Punct} 0-9]*"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lywj;->o:Ljava/util/regex/Pattern;

    return-void
.end method

.method public constructor <init>(Lcom/opera/android/widget/UrlFieldEditText;Lx5f;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lywj;->h:Z

    iput-boolean v0, p0, Lywj;->i:Z

    iput-boolean v0, p0, Lywj;->n:Z

    iput-object p1, p0, Lywj;->a:Lcom/opera/android/widget/UrlFieldEditText;

    iput-object p2, p0, Lywj;->b:Lx5f;

    new-instance p2, Lip2;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {p1}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v1

    invoke-virtual {p1}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result v2

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    const-string v3, ""

    invoke-virtual {p2, v1, v2, v0, v3}, Lip2;->f(IILjava/lang/CharSequence;Ljava/lang/CharSequence;)V

    iput-object p2, p0, Lywj;->c:Lip2;

    new-instance v0, Lip2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, p2}, Lip2;->a(Lip2;)V

    iput-object v0, p0, Lywj;->d:Lip2;

    new-instance v0, Lip2;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, p2}, Lip2;->a(Lip2;)V

    iput-object v0, p0, Lywj;->e:Lip2;

    new-instance p2, Lrgh;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    iput-object p1, p2, Lrgh;->a:Ljava/lang/Object;

    iput-object p2, p0, Lywj;->f:Lrgh;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 12

    iget v0, p0, Lywj;->j:I

    if-gtz v0, :cond_154

    iget-object v0, p0, Lywj;->c:Lip2;

    iget-object v1, p0, Lywj;->d:Lip2;

    invoke-virtual {v0, v1}, Lip2;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_154

    invoke-virtual {v0, v1}, Lip2;->equals(Ljava/lang/Object;)Z

    move-result v2

    iget-object v3, p0, Lywj;->a:Lcom/opera/android/widget/UrlFieldEditText;

    if-nez v2, :cond_117

    iget-object v2, v3, Lcom/opera/android/widget/UrlFieldEditText;->v:Landroid/view/accessibility/AccessibilityManager;

    invoke-virtual {v2}, Landroid/view/accessibility/AccessibilityManager;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_117

    invoke-virtual {v0}, Lip2;->d()Z

    move-result v2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_4f

    invoke-virtual {v1}, Lip2;->d()Z

    move-result v2

    if-eqz v2, :cond_4f

    iget-object v2, v0, Lip2;->a:Ljava/lang/CharSequence;

    iget-object v6, v1, Lip2;->a:Ljava/lang/CharSequence;

    invoke-static {v2, v6}, Lip2;->e(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_4f

    invoke-virtual {v1}, Lip2;->b()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v6, v0, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    sub-int/2addr v2, v6

    iget-object v6, v0, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    :goto_4b
    move v7, v6

    move v6, v2

    move v2, v5

    goto :goto_a8

    :cond_4f
    invoke-virtual {v0}, Lip2;->d()Z

    move-result v2

    if-eqz v2, :cond_67

    invoke-virtual {v1}, Lip2;->d()Z

    move-result v2

    if-eqz v2, :cond_67

    iget-object v2, v1, Lip2;->a:Ljava/lang/CharSequence;

    iget-object v6, v0, Lip2;->a:Ljava/lang/CharSequence;

    invoke-static {v2, v6}, Lip2;->e(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_67

    move v2, v4

    goto :goto_68

    :cond_67
    move v2, v5

    :goto_68
    iget-object v6, v0, Lip2;->a:Ljava/lang/CharSequence;

    if-eqz v2, :cond_84

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v2

    iget-object v6, v1, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    sub-int/2addr v2, v6

    iget-object v6, v1, Lip2;->b:Ljava/lang/CharSequence;

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    iget-object v7, v1, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v7}, Ljava/lang/CharSequence;->length()I

    move-result v7

    goto :goto_a8

    :cond_84
    iget-object v2, v1, Lip2;->a:Ljava/lang/CharSequence;

    invoke-static {v6, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_99

    iget-object v2, v1, Lip2;->b:Ljava/lang/CharSequence;

    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v2

    iget-object v6, v1, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    goto :goto_4b

    :cond_99
    invoke-virtual {v0}, Lip2;->b()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v6, v1, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    move v7, v5

    :goto_a8
    iput-boolean v5, p0, Lywj;->n:Z

    invoke-virtual {v1}, Lip2;->b()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0}, Lip2;->b()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v8

    const/16 v9, 0x10

    if-nez v8, :cond_d5

    if-nez v2, :cond_be

    if-eqz v6, :cond_d5

    :cond_be
    invoke-static {v9}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v8

    invoke-virtual {v1}, Lip2;->b()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v8, v10}, Landroid/view/accessibility/AccessibilityRecord;->setBeforeText(Ljava/lang/CharSequence;)V

    invoke-virtual {v8, v7}, Landroid/view/accessibility/AccessibilityRecord;->setFromIndex(I)V

    invoke-virtual {v8, v6}, Landroid/view/accessibility/AccessibilityRecord;->setRemovedCount(I)V

    invoke-virtual {v8, v2}, Landroid/view/accessibility/AccessibilityRecord;->setAddedCount(I)V

    invoke-virtual {v3, v8}, Lcom/opera/android/widget/UrlFieldEditText;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    :cond_d5
    iget v2, v1, Lip2;->c:I

    iget v6, v0, Lip2;->c:I

    if-ne v2, v6, :cond_e1

    iget v2, v1, Lip2;->d:I

    iget v6, v0, Lip2;->d:I

    if-eq v2, v6, :cond_ea

    :cond_e1
    const/16 v2, 0x2000

    invoke-static {v2}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/opera/android/widget/UrlFieldEditText;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    :cond_ea
    iput-boolean v4, p0, Lywj;->n:Z

    invoke-virtual {v0}, Lip2;->c()Z

    move-result v2

    if-eqz v2, :cond_117

    invoke-static {v9}, Landroid/view/accessibility/AccessibilityEvent;->obtain(I)Landroid/view/accessibility/AccessibilityEvent;

    move-result-object v2

    iget-object v6, v0, Lip2;->a:Ljava/lang/CharSequence;

    invoke-virtual {v2, v6}, Landroid/view/accessibility/AccessibilityRecord;->setBeforeText(Ljava/lang/CharSequence;)V

    iget-object v6, v0, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/view/accessibility/AccessibilityRecord;->setFromIndex(I)V

    invoke-virtual {v2, v5}, Landroid/view/accessibility/AccessibilityRecord;->setRemovedCount(I)V

    iget-object v6, v0, Lip2;->b:Ljava/lang/CharSequence;

    invoke-interface {v6}, Ljava/lang/CharSequence;->length()I

    move-result v6

    invoke-virtual {v2, v6}, Landroid/view/accessibility/AccessibilityRecord;->setAddedCount(I)V

    iput-boolean v5, p0, Lywj;->n:Z

    invoke-virtual {v3, v2}, Lcom/opera/android/widget/UrlFieldEditText;->sendAccessibilityEventUnchecked(Landroid/view/accessibility/AccessibilityEvent;)V

    iput-boolean v4, p0, Lywj;->n:Z

    :cond_117
    iget-object v2, v0, Lip2;->a:Ljava/lang/CharSequence;

    iget-object v4, v1, Lip2;->a:Ljava/lang/CharSequence;

    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_131

    invoke-virtual {v0}, Lip2;->c()Z

    move-result v2

    if-nez v2, :cond_12d

    invoke-virtual {v1}, Lip2;->c()Z

    move-result v2

    if-nez v2, :cond_131

    :cond_12d
    invoke-virtual {v1, v0}, Lip2;->a(Lip2;)V

    return-void

    :cond_131
    invoke-virtual {v1, v0}, Lip2;->a(Lip2;)V

    iget-boolean p0, p0, Lywj;->i:Z

    if-nez p0, :cond_154

    iget-object p0, v3, Lcom/opera/android/custom_views/ObservableEditText;->s:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_13e
    :goto_13e
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_154

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lz6f;

    instance-of v1, v0, Lspm;

    if-eqz v1, :cond_13e

    check-cast v0, Lspm;

    invoke-interface {v0}, Lspm;->g()V

    goto :goto_13e

    :cond_154
    return-void
.end method

.method public final b(II)V
    .registers 6

    iget-object v0, p0, Lywj;->c:Lip2;

    iget v1, v0, Lip2;->c:I

    if-ne v1, p1, :cond_a

    iget v1, v0, Lip2;->d:I

    if-eq v1, p2, :cond_12

    :cond_a
    iput p1, v0, Lip2;->c:I

    iput p2, v0, Lip2;->d:I

    iget v1, p0, Lywj;->j:I

    if-lez v1, :cond_13

    :cond_12
    return-void

    :cond_13
    iget-object v1, v0, Lip2;->a:Ljava/lang/CharSequence;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-virtual {v0}, Lip2;->c()Z

    move-result v2

    if-eqz v2, :cond_48

    if-gt p1, v1, :cond_41

    if-gt p2, v1, :cond_41

    iget-object p1, p0, Lywj;->e:Lip2;

    const-string p2, ""

    iput-object p2, p1, Lip2;->b:Ljava/lang/CharSequence;

    iput-object p2, v0, Lip2;->b:Ljava/lang/CharSequence;

    iget-object p1, p0, Lywj;->g:Lxwj;

    if-eqz p1, :cond_38

    invoke-virtual {p1}, Lxwj;->d()V

    iget-object p1, p0, Lywj;->g:Lxwj;

    invoke-virtual {p1}, Lxwj;->e()Z

    goto :goto_48

    :cond_38
    iget-object p1, p0, Lywj;->f:Lrgh;

    invoke-virtual {p1}, Lrgh;->s()V

    invoke-virtual {p0}, Lywj;->a()V

    goto :goto_48

    :cond_41
    iget-object p1, p0, Lywj;->g:Lxwj;

    if-eqz p1, :cond_48

    invoke-virtual {p1}, Lxwj;->a()V

    :cond_48
    :goto_48
    invoke-virtual {p0}, Lywj;->e()V

    invoke-virtual {p0}, Lywj;->a()V

    return-void
.end method

.method public final c(Ljava/lang/CharSequence;)V
    .registers 6

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    iget-object v2, p0, Lywj;->c:Lip2;

    const-string v3, ""

    invoke-virtual {v2, v0, v1, p1, v3}, Lip2;->f(IILjava/lang/CharSequence;Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lywj;->f:Lrgh;

    iget-object v0, p1, Lrgh;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Landroid/view/View;->isFocused()Z

    move-result v1

    if-eqz v1, :cond_1f

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setCursorVisible(Z)V

    :cond_1f
    invoke-virtual {v0}, Landroid/widget/TextView;->getEditableText()Landroid/text/Editable;

    move-result-object v0

    const/4 v1, -0x1

    if-eqz v0, :cond_31

    iget-object v3, p1, Lrgh;->b:Ljava/lang/Object;

    check-cast v3, Landroid/text/style/BackgroundColorSpan;

    if-eqz v3, :cond_31

    invoke-interface {v0, v3}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v3

    goto :goto_32

    :cond_31
    move v3, v1

    :goto_32
    if-eq v3, v1, :cond_3b

    iget-object v1, p1, Lrgh;->b:Ljava/lang/Object;

    check-cast v1, Landroid/text/style/BackgroundColorSpan;

    invoke-interface {v0, v1}, Landroid/text/Spannable;->removeSpan(Ljava/lang/Object;)V

    :cond_3b
    const/4 v0, 0x0

    iput-object v0, p1, Lrgh;->b:Ljava/lang/Object;

    iget-object p1, p0, Lywj;->d:Lip2;

    invoke-virtual {p1, v2}, Lip2;->a(Lip2;)V

    iget-object p1, p0, Lywj;->e:Lip2;

    invoke-virtual {p1, v2}, Lip2;->a(Lip2;)V

    iget p1, p0, Lywj;->j:I

    if-nez p1, :cond_4f

    invoke-virtual {p0}, Lywj;->e()V

    :cond_4f
    return-void
.end method

.method public final d(Ljava/lang/CharSequence;)V
    .registers 8

    instance-of v0, p1, Landroid/text/Editable;

    const/4 v1, 0x0

    iget-object v2, p0, Lywj;->f:Lrgh;

    iget-object v3, p0, Lywj;->c:Lip2;

    if-eqz v0, :cond_33

    move-object v0, p1

    check-cast v0, Landroid/text/Editable;

    iget-object v4, v2, Lrgh;->b:Ljava/lang/Object;

    check-cast v4, Landroid/text/style/BackgroundColorSpan;

    const/4 v5, -0x1

    if-nez v4, :cond_15

    move v4, v5

    goto :goto_19

    :cond_15
    invoke-interface {v0, v4}, Landroid/text/Spanned;->getSpanStart(Ljava/lang/Object;)I

    move-result v4

    :goto_19
    if-eq v4, v5, :cond_33

    invoke-interface {v0, v1, v4}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    :try_start_1f
    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    iput-object v0, v3, Lip2;->a:Ljava/lang/CharSequence;
    :try_end_26
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_1f .. :try_end_26} :catch_27

    goto :goto_46

    :catch_27
    new-instance v0, Landroid/text/SpannableString;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    iput-object v0, v3, Lip2;->a:Ljava/lang/CharSequence;

    goto :goto_46

    :cond_33
    :try_start_33
    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    iput-object v0, v3, Lip2;->a:Ljava/lang/CharSequence;
    :try_end_3a
    .catch Ljava/lang/IndexOutOfBoundsException; {:try_start_33 .. :try_end_3a} :catch_3b

    goto :goto_46

    :catch_3b
    new-instance v0, Landroid/text/SpannableString;

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    iput-object v0, v3, Lip2;->a:Ljava/lang/CharSequence;

    :goto_46
    iget p1, p0, Lywj;->j:I

    if-gtz p1, :cond_67

    iput-boolean v1, p0, Lywj;->h:Z

    iget-object p1, p0, Lywj;->e:Lip2;

    const-string v0, ""

    iput-object v0, p1, Lip2;->b:Ljava/lang/CharSequence;

    iput-object v0, v3, Lip2;->b:Ljava/lang/CharSequence;

    iget-object p1, p0, Lywj;->g:Lxwj;

    if-eqz p1, :cond_61

    invoke-virtual {p1}, Lxwj;->d()V

    iget-object p0, p0, Lywj;->g:Lxwj;

    invoke-virtual {p0}, Lxwj;->e()Z

    goto :goto_67

    :cond_61
    invoke-virtual {v2}, Lrgh;->s()V

    invoke-virtual {p0}, Lywj;->a()V

    :cond_67
    :goto_67
    return-void
.end method

.method public final e()V
    .registers 4

    iget-object v0, p0, Lywj;->a:Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual {v0}, Landroid/widget/TextView;->getSelectionStart()I

    move-result v1

    invoke-virtual {v0}, Landroid/widget/TextView;->getSelectionEnd()I

    move-result v0

    iget v2, p0, Lywj;->l:I

    if-ne v1, v2, :cond_13

    iget v2, p0, Lywj;->m:I

    if-ne v0, v2, :cond_13

    return-void

    :cond_13
    iput v1, p0, Lywj;->l:I

    iput v0, p0, Lywj;->m:I

    return-void
.end method
