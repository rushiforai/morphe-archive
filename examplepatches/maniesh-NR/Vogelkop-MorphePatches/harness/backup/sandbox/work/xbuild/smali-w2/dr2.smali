.class public final synthetic Ldr2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lmr2;


# direct methods
.method public synthetic constructor <init>(Lmr2;B)V
    .registers 3

    iput-byte p2, p0, Ldr2;->a:B

    iput-object p1, p0, Ldr2;->b:Lmr2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 15

    iget-byte p1, p0, Ldr2;->a:B

    packed-switch p1, :pswitch_data_17a

    sget-object p1, Lq9n;->c:Ll5b;

    iget-object p0, p0, Ldr2;->b:Lmr2;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lq9n;->u(Landroid/view/View;)Z

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_14
    iget-object v0, p0, Ldr2;->b:Lmr2;

    invoke-virtual {v0}, Lmr2;->G0()Ljava/lang/String;

    move-result-object p0

    iget-object p1, v0, Lmr2;->s:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, LJ/N;->MSg1Yo08(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_179

    invoke-virtual {v0}, Lmr2;->H0()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez p1, :cond_39

    new-instance p0, Lfr;

    invoke-direct {p0, v3, v3, v1}, Lfr;-><init>(IIB)V

    goto :goto_64

    :cond_39
    const/16 p1, 0x2f

    const/4 v5, 0x6

    invoke-static {p0, p1, v3, v5}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result p1

    const/4 v5, -0x1

    if-eq p1, v5, :cond_63

    invoke-virtual {p0, v3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    add-int/2addr p1, v4

    invoke-virtual {p0, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :try_start_4c
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1

    if-lt p1, v4, :cond_63

    const/16 v5, 0xc

    if-gt p1, v5, :cond_63

    if-ltz p0, :cond_63

    new-instance v5, Lfr;

    invoke-direct {v5, p0, p1, v1}, Lfr;-><init>(IIB)V
    :try_end_61
    .catch Ljava/lang/NumberFormatException; {:try_start_4c .. :try_end_61} :catch_63

    move-object p0, v5

    goto :goto_64

    :catch_63
    :cond_63
    move-object p0, v2

    :goto_64
    if-nez p0, :cond_6b

    new-instance p0, Lfr;

    invoke-direct {p0, v3, v3, v1}, Lfr;-><init>(IIB)V

    :cond_6b
    iget p1, p0, Lfr;->c:I

    iget p0, p0, Lfr;->b:I

    iget-object v1, v0, Lmr2;->u:Lcr2;

    if-nez v1, :cond_74

    move-object v1, v2

    :cond_74
    iget-object v1, v1, Lcr2;->i:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v4

    move v6, v3

    move v7, v6

    :goto_87
    const/16 v8, 0x20

    if-gt v6, v5, :cond_a7

    if-nez v7, :cond_8f

    move v9, v6

    goto :goto_90

    :cond_8f
    move v9, v5

    :goto_90
    invoke-virtual {v1, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-gt v9, v8, :cond_98

    move v9, v4

    goto :goto_99

    :cond_98
    move v9, v3

    :goto_99
    if-nez v7, :cond_a2

    if-nez v9, :cond_9f

    move v7, v4

    goto :goto_87

    :cond_9f
    add-int/lit8 v6, v6, 0x1

    goto :goto_87

    :cond_a2
    if-eqz v9, :cond_a7

    add-int/lit8 v5, v5, -0x1

    goto :goto_87

    :cond_a7
    add-int/2addr v5, v4

    invoke-virtual {v1, v6, v5}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    move-object v5, v2

    invoke-virtual {v0}, Lmr2;->G0()Ljava/lang/String;

    move-result-object v2

    const-string v6, ""

    if-eqz p0, :cond_c0

    if-eqz p1, :cond_c0

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_c1

    :cond_c0
    move-object v7, v6

    :goto_c1
    if-eqz p0, :cond_c9

    if-eqz p1, :cond_c9

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    :cond_c9
    iget-object p0, v0, Lmr2;->w:Lro9;

    if-nez p0, :cond_ce

    move-object p0, v5

    :cond_ce
    iget-object p1, p0, Lro9;->d:Ljava/lang/Object;

    check-cast p1, Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object p1

    iget p0, p0, Lro9;->b:I

    invoke-interface {p1, p0}, Landroid/widget/Adapter;->getItem(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgr2;

    iget-object p0, p0, Lgr2;->c:Lcom/opera/android/autofill/Address;

    if-eqz p0, :cond_e5

    iget-object p0, p0, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    goto :goto_e6

    :cond_e5
    move-object p0, v5

    :goto_e6
    iget-object p1, v0, Lmr2;->u:Lcr2;

    if-nez p1, :cond_eb

    move-object p1, v5

    :cond_eb
    iget-object p1, p1, Lcr2;->j:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v4

    move v10, v3

    move v11, v10

    :goto_fe
    if-gt v10, v9, :cond_11c

    if-nez v11, :cond_104

    move v12, v10

    goto :goto_105

    :cond_104
    move v12, v9

    :goto_105
    invoke-virtual {p1, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-gt v12, v8, :cond_10d

    move v12, v4

    goto :goto_10e

    :cond_10d
    move v12, v3

    :goto_10e
    if-nez v11, :cond_117

    if-nez v12, :cond_114

    move v11, v4

    goto :goto_fe

    :cond_114
    add-int/lit8 v10, v10, 0x1

    goto :goto_fe

    :cond_117
    if-eqz v12, :cond_11c

    add-int/lit8 v9, v9, -0x1

    goto :goto_fe

    :cond_11c
    add-int/2addr v9, v4

    invoke-virtual {p1, v10, v9}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v9, v0, Lmr2;->u:Lcr2;

    if-eqz v9, :cond_12a

    move-object v5, v9

    :cond_12a
    iget-object v5, v5, Lcr2;->d:Landroid/view/View;

    check-cast v5, Lcom/opera/android/custom_views/OperaTextInputEditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v4

    move v10, v3

    move v11, v10

    :goto_13d
    if-gt v10, v9, :cond_15b

    if-nez v11, :cond_143

    move v12, v10

    goto :goto_144

    :cond_143
    move v12, v9

    :goto_144
    invoke-virtual {v5, v12}, Ljava/lang/String;->charAt(I)C

    move-result v12

    if-gt v12, v8, :cond_14c

    move v12, v4

    goto :goto_14d

    :cond_14c
    move v12, v3

    :goto_14d
    if-nez v11, :cond_156

    if-nez v12, :cond_153

    move v11, v4

    goto :goto_13d

    :cond_153
    add-int/lit8 v10, v10, 0x1

    goto :goto_13d

    :cond_156
    if-eqz v12, :cond_15b

    add-int/lit8 v9, v9, -0x1

    goto :goto_13d

    :cond_15b
    add-int/2addr v9, v4

    invoke-virtual {v5, v10, v9}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    move-object v4, v7

    move-object v7, v3

    move-object v3, v4

    move-object v5, p0

    move-object v4, v6

    move-object v6, p1

    invoke-virtual/range {v0 .. v7}, Lmr2;->K0(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Lq9n;->c:Ll5b;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lq9n;->u(Landroid/view/View;)Z

    invoke-virtual {v0}, Lryl;->g0()V

    :cond_179
    return-void

    :pswitch_data_17a
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
