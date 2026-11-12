.class public final synthetic Lkii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lpii;


# direct methods
.method public synthetic constructor <init>(Lpii;B)V
    .registers 3

    iput-byte p2, p0, Lkii;->a:B

    iput-object p1, p0, Lkii;->b:Lpii;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 16

    iget-byte v0, p0, Lkii;->a:B

    packed-switch v0, :pswitch_data_176

    iget-object p0, p0, Lkii;->b:Lpii;

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_b
    iget-object v1, p0, Lkii;->b:Lpii;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object v2

    if-eqz v2, :cond_174

    iget-object p0, v1, Lpii;->u:Lqji;

    if-eqz p0, :cond_174

    instance-of p0, v2, Lcom/opera/android/BrowserActivity;

    const/4 v0, 0x0

    if-eqz p0, :cond_27

    move-object p0, v2

    check-cast p0, Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->o0:Lwjh;

    move-object v5, p0

    goto :goto_28

    :cond_27
    move-object v5, v0

    :goto_28
    iget-object p0, v1, Lpii;->B:Lro9;

    iget p0, p0, Lro9;->b:I

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez p0, :cond_38

    new-array p0, v3, [Landroid/print/PageRange;

    sget-object v3, Landroid/print/PageRange;->ALL_PAGES:Landroid/print/PageRange;

    aput-object v3, p0, v4

    goto/16 :goto_130

    :cond_38
    iget-object p0, v1, Lpii;->D:Lcom/google/android/material/textfield/TextInputLayout;

    iget-object p0, p0, Lcom/google/android/material/textfield/TextInputLayout;->e:Landroid/widget/EditText;

    invoke-virtual {p0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    new-instance v7, Ljava/util/StringTokenizer;

    const-string v8, "-, \t\n\r\u000c"

    invoke-direct {v7, p0, v8, v3}, Ljava/util/StringTokenizer;-><init>(Ljava/lang/String;Ljava/lang/String;Z)V

    move p0, v4

    move v8, p0

    move v9, v8

    :cond_53
    :goto_53
    invoke-virtual {v7}, Ljava/util/StringTokenizer;->hasMoreTokens()Z

    move-result v10

    const/4 v11, 0x3

    const/4 v12, 0x2

    if-eqz v10, :cond_c1

    invoke-virtual {v7}, Ljava/util/StringTokenizer;->nextToken()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/String;->length()I

    move-result v13

    if-ne v13, v3, :cond_a8

    invoke-virtual {v10, v4}, Ljava/lang/String;->charAt(I)C

    move-result v13

    const/16 v14, 0x9

    if-eq v13, v14, :cond_53

    const/16 v14, 0x20

    if-eq v13, v14, :cond_53

    const/16 v14, 0xc

    if-eq v13, v14, :cond_53

    const/16 v14, 0xd

    if-eq v13, v14, :cond_53

    const/16 v14, 0x2c

    if-eq v13, v14, :cond_8b

    const/16 v14, 0x2d

    if-ne v13, v14, :cond_a8

    if-eqz p0, :cond_88

    if-eq p0, v12, :cond_10a

    if-eq p0, v11, :cond_10a

    goto :goto_89

    :cond_88
    move v8, v4

    :goto_89
    move p0, v12

    goto :goto_53

    :cond_8b
    if-eqz p0, :cond_10a

    if-eq p0, v3, :cond_9e

    if-eq p0, v12, :cond_10a

    if-ne p0, v11, :cond_a6

    if-lt v9, v8, :cond_10a

    new-instance p0, Landroid/print/PageRange;

    invoke-direct {p0, v8, v9}, Landroid/print/PageRange;-><init>(II)V

    invoke-virtual {v6, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_a6

    :cond_9e
    new-instance p0, Landroid/print/PageRange;

    invoke-direct {p0, v8, v8}, Landroid/print/PageRange;-><init>(II)V

    invoke-virtual {v6, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_a6
    :goto_a6
    move p0, v4

    goto :goto_53

    :cond_a8
    :try_start_a8
    invoke-static {v10}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v10
    :try_end_ac
    .catch Ljava/lang/NumberFormatException; {:try_start_a8 .. :try_end_ac} :catch_10a

    if-lez v10, :cond_10a

    if-eqz p0, :cond_bc

    if-eq p0, v3, :cond_10a

    if-eq p0, v12, :cond_b7

    if-eq p0, v11, :cond_10a

    goto :goto_53

    :cond_b7
    add-int/lit8 v10, v10, -0x1

    move v9, v10

    move p0, v11

    goto :goto_53

    :cond_bc
    add-int/lit8 v10, v10, -0x1

    move p0, v3

    move v8, v10

    goto :goto_53

    :cond_c1
    if-eqz p0, :cond_e9

    if-eq p0, v3, :cond_e0

    if-eq p0, v12, :cond_d4

    if-ne p0, v11, :cond_f4

    if-lt v9, v8, :cond_10a

    new-instance p0, Landroid/print/PageRange;

    invoke-direct {p0, v8, v9}, Landroid/print/PageRange;-><init>(II)V

    invoke-virtual {v6, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f4

    :cond_d4
    new-instance p0, Landroid/print/PageRange;

    const v3, 0x7fffffff

    invoke-direct {p0, v8, v3}, Landroid/print/PageRange;-><init>(II)V

    invoke-virtual {v6, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f4

    :cond_e0
    new-instance p0, Landroid/print/PageRange;

    invoke-direct {p0, v8, v8}, Landroid/print/PageRange;-><init>(II)V

    invoke-virtual {v6, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_f4

    :cond_e9
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_f4

    sget-object p0, Landroid/print/PageRange;->ALL_PAGES:Landroid/print/PageRange;

    invoke-virtual {v6, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_f4
    :goto_f4
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result p0

    move v3, v4

    move v7, v3

    :goto_fa
    if-ge v7, p0, :cond_111

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Landroid/print/PageRange;

    invoke-virtual {v8}, Landroid/print/PageRange;->getStart()I

    move-result v9

    if-ge v9, v3, :cond_10c

    :catch_10a
    :cond_10a
    move-object p0, v0

    goto :goto_119

    :cond_10c
    invoke-virtual {v8}, Landroid/print/PageRange;->getEnd()I

    move-result v3

    goto :goto_fa

    :cond_111
    new-array p0, v4, [Landroid/print/PageRange;

    invoke-virtual {v6, p0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Landroid/print/PageRange;

    :goto_119
    iget-object v3, v1, Lpii;->D:Lcom/google/android/material/textfield/TextInputLayout;

    if-nez p0, :cond_128

    const p0, 0x7f140ef3

    invoke-virtual {v1, p0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    goto :goto_174

    :cond_128
    invoke-virtual {v3, v0}, Lcom/google/android/material/textfield/TextInputLayout;->p(Ljava/lang/CharSequence;)V

    iget-object v3, v1, Lpii;->D:Lcom/google/android/material/textfield/TextInputLayout;

    invoke-virtual {v3, v4}, Lcom/google/android/material/textfield/TextInputLayout;->q(Z)V

    :goto_130
    iget-object v3, v1, Lpii;->G:Llii;

    invoke-interface {v3, v4}, Llii;->g(Z)V

    iget-object v4, v1, Lpii;->u:Lqji;

    iget-object v6, v1, Lpii;->H:Lhii;

    invoke-virtual {v4, v6}, Lqji;->e(Lnji;)V

    iput-object v0, v1, Lpii;->H:Lhii;

    invoke-interface {v3}, Llii;->b()Z

    move-result v4

    if-eqz v4, :cond_14d

    const-string v4, ""

    invoke-interface {v3, v4}, Llii;->n(Ljava/lang/String;)V

    const/4 v4, 0x4

    invoke-interface {v3, v4}, Llii;->l(I)V

    :cond_14d
    iget-object v3, v1, Lpii;->F:Lcii;

    if-eqz v3, :cond_158

    iget-object v4, v1, Lpii;->u:Lqji;

    invoke-virtual {v4, v3}, Lqji;->e(Lnji;)V

    iput-object v0, v1, Lpii;->F:Lcii;

    :cond_158
    iget-object v3, v1, Lpii;->u:Lqji;

    iput-object v0, v1, Lpii;->u:Lqji;

    iget-object v0, v2, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v6, v0, Lqim;->d:Lnej;

    new-instance v0, Ldii;

    move-object v4, p0

    invoke-direct/range {v0 .. v5}, Ldii;-><init>(Lpii;Ldx3;Lqji;[Landroid/print/PageRange;Lwjh;)V

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v6, v0, p0}, Lr22;->b(Ljjm;Lijm;)V

    invoke-virtual {v1}, Lryl;->g0()V

    :cond_174
    :goto_174
    return-void

    nop

    :pswitch_data_176
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
