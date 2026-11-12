.class public final Lcfl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# instance fields
.field public a:Landroid/text/SpannableString;

.field public b:I

.field public c:I

.field public final synthetic d:Lcom/opera/hype/image/editor/TextBoxEditText;


# direct methods
.method public constructor <init>(Lcom/opera/hype/image/editor/TextBoxEditText;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcfl;->d:Lcom/opera/hype/image/editor/TextBoxEditText;

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 8

    iget-object v0, p0, Lcfl;->d:Lcom/opera/hype/image/editor/TextBoxEditText;

    invoke-virtual {v0}, Landroid/widget/TextView;->getMaxLines()I

    move-result v1

    const/4 v2, 0x0

    if-eqz p1, :cond_1e

    move v3, v2

    :goto_a
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-ge v2, v4, :cond_1d

    invoke-interface {p1, v2}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v4

    const/16 v5, 0xa

    if-ne v4, v5, :cond_1a

    add-int/lit8 v3, v3, 0x1

    :cond_1a
    add-int/lit8 v2, v2, 0x1

    goto :goto_a

    :cond_1d
    move v2, v3

    :cond_1e
    add-int/lit8 v2, v2, 0x1

    if-lez v1, :cond_25

    if-gt v2, v1, :cond_25

    return-void

    :cond_25
    invoke-virtual {v0, p0}, Landroid/widget/TextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object p1, p0, Lcfl;->a:Landroid/text/SpannableString;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Lcom/opera/hype/image/editor/TextBoxEditText;->t()Landroid/text/Editable;

    move-result-object p1

    iget v1, p0, Lcfl;->b:I

    iget v2, p0, Lcfl;->c:I

    invoke-static {p1, v1, v2}, Landroid/text/Selection;->setSelection(Landroid/text/Spannable;II)V

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    return-void
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    new-instance p4, Landroid/text/SpannableString;

    if-nez p1, :cond_6

    const-string p1, ""

    :cond_6
    invoke-direct {p4, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    iput-object p4, p0, Lcfl;->a:Landroid/text/SpannableString;

    iput p2, p0, Lcfl;->b:I

    add-int/2addr p2, p3

    iput p2, p0, Lcfl;->c:I

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method
