.class public final Lhcd;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/text/TextWatcher;


# instance fields
.field public final a:Lcom/opera/android/custom_views/OperaTextInputEditText;

.field public b:Z

.field public c:Z

.field public d:I


# direct methods
.method public constructor <init>(Lcom/opera/android/custom_views/OperaTextInputEditText;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lhcd;->a:Lcom/opera/android/custom_views/OperaTextInputEditText;

    return-void
.end method


# virtual methods
.method public final afterTextChanged(Landroid/text/Editable;)V
    .registers 13

    iget-boolean v0, p0, Lhcd;->c:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_8

    iput-boolean v1, p0, Lhcd;->c:Z

    return-void

    :cond_8
    iget-boolean v0, p0, Lhcd;->b:Z

    if-eqz v0, :cond_d

    return-void

    :cond_d
    const/4 v0, 0x1

    iput-boolean v0, p0, Lhcd;->c:Z

    iget v0, p0, Lhcd;->d:I

    const/16 v2, 0x23

    invoke-static {v2}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    move-result-object v3

    const-string v4, "##/##"

    const-string v5, ""

    invoke-static {v4, v3, v5}, Lkotlin/text/c;->o(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    if-nez v6, :cond_28

    move-object v3, p1

    goto :goto_39

    :cond_28
    new-instance v6, Lkotlin/text/Regex;

    const-string v7, "["

    const-string v8, "]"

    invoke-static {v7, v3, v8}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v6, v3}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, p1, v5}, Lkotlin/text/Regex;->replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_39
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    move v6, v1

    :cond_3f
    :goto_3f
    const/4 v7, 0x5

    if-ge v1, v7, :cond_7c

    invoke-static {v6, v3}, Lpik;->A(ILjava/lang/CharSequence;)Ljava/lang/Character;

    move-result-object v8

    if-eqz v8, :cond_7c

    invoke-virtual {v4, v1}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-eq v9, v2, :cond_70

    invoke-virtual {v4, v1}, Ljava/lang/String;->charAt(I)C

    move-result v9

    invoke-virtual {v8}, Ljava/lang/Character;->charValue()C

    move-result v10

    if-eq v9, v10, :cond_70

    invoke-static {v1, v4}, Lpik;->A(ILjava/lang/CharSequence;)Ljava/lang/Character;

    move-result-object v8

    :goto_5c
    if-ge v1, v7, :cond_3f

    if-eqz v8, :cond_66

    invoke-virtual {v8}, Ljava/lang/Character;->charValue()C

    move-result v9

    if-eq v9, v2, :cond_3f

    :cond_66
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    invoke-static {v1, v4}, Lpik;->A(ILjava/lang/CharSequence;)Ljava/lang/Character;

    move-result-object v8

    goto :goto_5c

    :cond_70
    invoke-virtual {v8}, Ljava/lang/Character;->charValue()C

    move-result v7

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v6, v6, 0x1

    goto :goto_3f

    :cond_7c
    invoke-static {v1, v4}, Lpik;->A(ILjava/lang/CharSequence;)Ljava/lang/Character;

    move-result-object v3

    :goto_80
    if-ge v1, v7, :cond_94

    if-eqz v3, :cond_8a

    invoke-virtual {v3}, Ljava/lang/Character;->charValue()C

    move-result v6

    if-eq v6, v2, :cond_94

    :cond_8a
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    invoke-static {v1, v4}, Lpik;->A(ILjava/lang/CharSequence;)Ljava/lang/Character;

    move-result-object v3

    goto :goto_80

    :cond_94
    invoke-static {v7, v5}, Lpik;->C(ILjava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    iget-object p0, p0, Lhcd;->a:Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-ne v0, p1, :cond_ab

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/widget/EditText;->setSelection(I)V

    return-void

    :cond_ab
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result p1

    if-le v0, p1, :cond_b2

    move v0, p1

    :cond_b2
    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setSelection(I)V

    return-void
.end method

.method public final beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    return-void
.end method

.method public final onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    if-lez p3, :cond_6

    if-nez p4, :cond_6

    const/4 p1, 0x1

    goto :goto_7

    :cond_6
    const/4 p1, 0x0

    :goto_7
    iput-boolean p1, p0, Lhcd;->b:Z

    add-int/2addr p2, p4

    iput p2, p0, Lhcd;->d:I

    return-void
.end method
