.class public final Lh9c;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Lk7c;

.field public final b:Landroid/view/View;

.field public final c:Lcom/google/android/material/textfield/TextInputLayout;

.field public final d:Lcom/google/android/material/textfield/TextInputEditText;

.field public final e:Ldnb;

.field public f:Z


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lk7c;Ldnb;)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lh9c;->a:Lk7c;

    const v0, 0x7f0d0145

    const/4 v1, 0x0

    invoke-static {p1, v0, p1, v1}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lh9c;->b:Landroid/view/View;

    iput-object p3, p0, Lh9c;->e:Ldnb;

    sget-object p3, Lr5n;->a:Ljava/util/WeakHashMap;

    const p3, 0x7f0a044a

    invoke-static {p1, p3}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/View;

    check-cast p3, Lcom/google/android/material/textfield/TextInputLayout;

    iput-object p3, p0, Lh9c;->c:Lcom/google/android/material/textfield/TextInputLayout;

    iget v0, p2, Lk7c;->a:I

    iget v2, p2, Lk7c;->a:I

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    packed-switch v0, :pswitch_data_b6

    move v0, v1

    goto :goto_54

    :pswitch_2d
    const v0, 0x7f1407cb

    goto :goto_54

    :pswitch_31
    const v0, 0x7f1407c3

    goto :goto_54

    :pswitch_35
    const v0, 0x7f1407c2

    goto :goto_54

    :pswitch_39
    const v0, 0x7f1407c0

    goto :goto_54

    :pswitch_3d
    const v0, 0x7f1407bf

    goto :goto_54

    :pswitch_41
    const v0, 0x7f1407c1

    goto :goto_54

    :pswitch_45
    const v0, 0x7f1407c5

    goto :goto_54

    :pswitch_49
    const v0, 0x7f1407c4

    goto :goto_54

    :pswitch_4d
    const v0, 0x7f1407ca

    goto :goto_54

    :pswitch_51
    const v0, 0x7f1407c9

    :goto_54
    if-nez v0, :cond_59

    iget-object p2, p2, Lk7c;->b:Ljava/lang/String;

    goto :goto_61

    :cond_59
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    :goto_61
    invoke-virtual {p3, p2}, Lcom/google/android/material/textfield/TextInputLayout;->t(Ljava/lang/CharSequence;)V

    const p2, 0x7f0a0449

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Lcom/google/android/material/textfield/TextInputEditText;

    iput-object p1, p0, Lh9c;->d:Lcom/google/android/material/textfield/TextInputEditText;

    invoke-static {v2}, Lvep;->A(I)I

    move-result p2

    const/4 p3, 0x3

    const/16 v0, 0x9

    if-eq p2, v0, :cond_89

    packed-switch p2, :pswitch_data_ce

    const/4 v1, 0x1

    goto :goto_8b

    :pswitch_7f
    const/16 v1, 0x71

    goto :goto_8b

    :pswitch_82
    const/4 v1, 0x2

    goto :goto_8b

    :pswitch_84
    const/16 v1, 0xd1

    goto :goto_8b

    :pswitch_87
    move v1, p3

    goto :goto_8b

    :cond_89
    :pswitch_89
    const/16 v1, 0x61

    :goto_8b
    :pswitch_8b
    invoke-virtual {p1, v1}, Landroid/widget/TextView;->setInputType(I)V

    new-instance p2, Lh63;

    invoke-direct {p2, p0, p3}, Lh63;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    const/4 p0, 0x4

    if-ne v2, p0, :cond_b5

    new-instance p2, Lg9c;

    new-instance p3, Ly0a;

    const/16 v1, 0x8

    invoke-direct {p3, p1, v1}, Ly0a;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p2, p3}, Lg9c;-><init>(Ly0a;)V

    new-instance p3, Lsma;

    invoke-direct {p3, p2, v0}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p3, Lzp2;

    invoke-direct {p3, p2, p0}, Lzp2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p3}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    :cond_b5
    return-void

    :pswitch_data_b6
    .packed-switch 0x0
        :pswitch_51
        :pswitch_4d
        :pswitch_49
        :pswitch_45
        :pswitch_41
        :pswitch_3d
        :pswitch_39
        :pswitch_35
        :pswitch_31
        :pswitch_2d
    .end packed-switch

    :pswitch_data_ce
    .packed-switch 0x0
        :pswitch_89
        :pswitch_87
        :pswitch_84
        :pswitch_8b
        :pswitch_82
        :pswitch_7f
        :pswitch_7f
    .end packed-switch
.end method
