.class public final synthetic Lmc8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfn8;
.implements Lr8;
.implements Ljtl;
.implements Lgrj;
.implements Lxjj;
.implements Lyjj;


# static fields
.field public static final b:Lmc8;


# instance fields
.field public final synthetic a:B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lmc8;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lmc8;-><init>(B)V

    sput-object v0, Lmc8;->b:Lmc8;

    return-void
.end method

.method public synthetic constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, Lmc8;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static synthetic b(Ljava/lang/Object;Ljava/lang/String;)V
    .registers 3

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ld0;

    invoke-direct {p1, p0}, Ld0;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public final a(Ljava/lang/Object;)Landroid/text/ParcelableSpan;
    .registers 5

    iget-byte p0, p0, Lmc8;->a:B

    const/4 v0, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch p0, :pswitch_data_9e

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_15

    new-instance v2, Landroid/text/style/TypefaceSpan;

    invoke-direct {v2, p1}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    :cond_15
    return-object v2

    :pswitch_16
    check-cast p1, Ljava/lang/Integer;

    new-instance p0, Landroid/text/style/BackgroundColorSpan;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Landroid/text/style/BackgroundColorSpan;-><init>(I)V

    return-object p0

    :pswitch_22
    check-cast p1, Ljava/lang/Integer;

    new-instance p0, Landroid/text/style/ForegroundColorSpan;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    invoke-direct {p0, p1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    return-object p0

    :pswitch_2e
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-ne p0, v1, :cond_3c

    new-instance v2, Landroid/text/style/SubscriptSpan;

    invoke-direct {v2}, Landroid/text/style/SubscriptSpan;-><init>()V

    goto :goto_47

    :cond_3c
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-ne p0, v0, :cond_47

    new-instance v2, Landroid/text/style/SuperscriptSpan;

    invoke-direct {v2}, Landroid/text/style/SuperscriptSpan;-><init>()V

    :cond_47
    :goto_47
    return-object v2

    :pswitch_48
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-ne p0, v1, :cond_56

    new-instance v2, Landroid/text/style/StyleSpan;

    invoke-direct {v2, v1}, Landroid/text/style/StyleSpan;-><init>(I)V

    goto :goto_7b

    :cond_56
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    if-ne p0, v0, :cond_62

    new-instance v2, Landroid/text/style/StyleSpan;

    invoke-direct {v2, v0}, Landroid/text/style/StyleSpan;-><init>(I)V

    goto :goto_7b

    :cond_62
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const/4 v0, 0x3

    if-ne p0, v0, :cond_6f

    new-instance v2, Landroid/text/style/UnderlineSpan;

    invoke-direct {v2}, Landroid/text/style/UnderlineSpan;-><init>()V

    goto :goto_7b

    :cond_6f
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    const/4 p1, 0x4

    if-ne p0, p1, :cond_7b

    new-instance v2, Landroid/text/style/StrikethroughSpan;

    invoke-direct {v2}, Landroid/text/style/StrikethroughSpan;-><init>()V

    :cond_7b
    :goto_7b
    return-object v2

    :pswitch_7c
    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p0

    const/4 v0, 0x0

    cmpl-float p0, p0, v0

    if-ltz p0, :cond_94

    new-instance v2, Landroid/text/style/AbsoluteSizeSpan;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p0

    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    invoke-direct {v2, p0}, Landroid/text/style/AbsoluteSizeSpan;-><init>(I)V

    :cond_94
    return-object v2

    :pswitch_95
    check-cast p1, Ljava/lang/String;

    new-instance p0, Landroid/text/style/URLSpan;

    invoke-direct {p0, p1}, Landroid/text/style/URLSpan;-><init>(Ljava/lang/String;)V

    return-object p0

    nop

    :pswitch_data_9e
    .packed-switch 0x4
        :pswitch_95
        :pswitch_7c
        :pswitch_48
        :pswitch_2e
        :pswitch_22
        :pswitch_16
    .end packed-switch
.end method

.method public final c(Landroid/view/ViewGroup;)Landroidx/recyclerview/widget/i;
    .registers 7

    iget-byte p0, p0, Lmc8;->a:B

    const/4 v0, 0x0

    const-string v1, "rootView"

    const/4 v2, 0x0

    packed-switch p0, :pswitch_data_72

    :pswitch_9
    new-instance p0, Lek;

    invoke-static {p1}, Lp37;->U(Landroid/view/View;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f0d0022

    invoke-virtual {v3, v4, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_1f

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-direct {p0, p1}, Lek;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    move-object v0, p0

    goto :goto_22

    :cond_1f
    invoke-static {v1}, Lt3p;->q(Ljava/lang/String;)V

    :goto_22
    return-object v0

    :pswitch_23
    new-instance p0, Ldk;

    invoke-static {p1}, Lp37;->U(Landroid/view/View;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f0d0021

    invoke-virtual {v3, v4, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_39

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-direct {p0, p1}, Ldk;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    move-object v0, p0

    goto :goto_3c

    :cond_39
    invoke-static {v1}, Lt3p;->q(Ljava/lang/String;)V

    :goto_3c
    return-object v0

    :pswitch_3d
    new-instance p0, Lfk;

    invoke-static {p1}, Lp37;->U(Landroid/view/View;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f0d0023

    invoke-virtual {v3, v4, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_53

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-direct {p0, p1}, Lfk;-><init>(Lcom/opera/android/custom_views/StylingTextView;)V

    move-object v0, p0

    goto :goto_56

    :cond_53
    invoke-static {v1}, Lt3p;->q(Ljava/lang/String;)V

    :goto_56
    return-object v0

    :pswitch_57
    new-instance p0, Lgk;

    invoke-static {p1}, Lp37;->U(Landroid/view/View;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v4, 0x7f0d0024

    invoke-virtual {v3, v4, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    if-eqz p1, :cond_6d

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-direct {p0, p1}, Lgk;-><init>(Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    move-object v0, p0

    goto :goto_70

    :cond_6d
    invoke-static {v1}, Lt3p;->q(Ljava/lang/String;)V

    :goto_70
    return-object v0

    nop

    :pswitch_data_72
    .packed-switch 0x16
        :pswitch_57
        :pswitch_3d
        :pswitch_9
        :pswitch_23
    .end packed-switch
.end method

.method public final createExtractors()[Lcn8;
    .registers 3

    iget-byte p0, p0, Lmc8;->a:B

    const/4 v0, 0x0

    const/4 v1, 0x1

    packed-switch p0, :pswitch_data_1c

    new-instance p0, Lp7;

    invoke-direct {p0}, Lp7;-><init>()V

    new-array v1, v1, [Lcn8;

    aput-object p0, v1, v0

    return-object v1

    :pswitch_11
    new-instance p0, Ln7;

    invoke-direct {p0}, Ln7;-><init>()V

    new-array v1, v1, [Lcn8;

    aput-object p0, v1, v0

    return-object v1

    nop

    :pswitch_data_1c
    .packed-switch 0x2
        :pswitch_11
    .end packed-switch
.end method

.method public final e0()Landroid/view/textclassifier/TextClassification;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final i(Ljava/lang/Object;Landroidx/recyclerview/widget/i;)V
    .registers 7

    iget-byte p0, p0, Lmc8;->a:B

    sparse-switch p0, :sswitch_data_6a

    check-cast p1, Lcom/opera/android/autofill/Address;

    check-cast p2, Lww;

    iget-object p0, p2, Lww;->b:Lvs;

    iget-object v0, p0, Lvs;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p1, Lcom/opera/android/autofill/Address;->c:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p1, Lcom/opera/android/autofill/Address;->b:Ljava/lang/String;

    if-lez v2, :cond_1f

    const-string v2, " - "

    invoke-static {v3, v2, v1}, Lsko;->v(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :cond_1f
    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    iget-object v1, p1, Lcom/opera/android/autofill/Address;->n:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    iget-object v1, p2, Lww;->c:Lyw;

    new-instance v2, Lnf;

    const/4 v3, 0x5

    invoke-direct {v2, v1, p1, v3}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lvs;->d:Ljava/lang/Object;

    check-cast p0, Landroid/widget/ImageView;

    new-instance v0, Lnf;

    const/4 v1, 0x6

    invoke-direct {v0, p2, p1, v1}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :sswitch_46
    check-cast p1, Lbk;

    check-cast p2, Lfk;

    iget-object p0, p2, Lfk;->b:Lcom/opera/android/custom_views/StylingTextView;

    iget-object p1, p1, Lbk;->W:Lrxh;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p1, p2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :sswitch_5a
    check-cast p1, Lvf;

    check-cast p2, Ltf;

    iget-object p0, p1, Lvf;->a:Lpc;

    iget-object p1, p2, Ltf;->f:Lpc;

    if-eq p0, p1, :cond_69

    iput-object p0, p2, Ltf;->f:Lpc;

    invoke-virtual {p2}, Ltf;->U()V

    :cond_69
    return-void

    :sswitch_data_6a
    .sparse-switch
        0x15 -> :sswitch_5a
        0x18 -> :sswitch_46
    .end sparse-switch
.end method

.method public final k(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ljava/lang/Object;
    .registers 24

    move-object/from16 v0, p1

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    iget-byte v1, v1, Lmc8;->a:B

    const/4 v3, 0x0

    const-string v4, "Missing required view with ID: "

    const/4 v5, 0x0

    sparse-switch v1, :sswitch_data_1f4

    const v1, 0x7f0d01d6

    invoke-virtual {v0, v1, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a0983

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v10, :cond_57

    const v1, 0x7f0a0984

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v9, :cond_57

    const v1, 0x7f0a0990

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v11, :cond_57

    const v1, 0x7f0a099d

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_57

    new-instance v7, Ljq2;

    check-cast v2, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    invoke-direct {v7, v2, v5}, Ljq2;-><init>(Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;B)V

    new-instance v6, Lxk9;

    move-object v8, v0

    check-cast v8, Landroid/widget/LinearLayout;

    invoke-direct/range {v6 .. v11}, Lxk9;-><init>(Ljq2;Landroid/widget/LinearLayout;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/custom_views/SeparatorView;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    move-object v3, v6

    goto :goto_66

    :cond_57
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_66
    return-object v3

    :sswitch_67
    const v1, 0x7f0d01e7

    invoke-virtual {v0, v1, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a0101

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;

    if-eqz v7, :cond_fd

    const v1, 0x7f0a0103

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v8, :cond_fd

    const v1, 0x7f0a01c7

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/google/android/material/button/MaterialButton;

    if-eqz v9, :cond_fd

    const v1, 0x7f0a0364

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/ViewSurrogate;

    if-eqz v2, :cond_fd

    const v1, 0x7f0a04dd

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v10, :cond_fd

    const v1, 0x7f0a0813

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v11, :cond_fd

    const v1, 0x7f0a0815

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v12, :cond_fd

    const v1, 0x7f0a0916

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/google/android/material/button/MaterialButton;

    if-eqz v13, :cond_fd

    const v1, 0x7f0a0a9f

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Space;

    if-eqz v2, :cond_fd

    const v1, 0x7f0a0c78

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/custom_views/OperaTextInputEditText;

    if-eqz v14, :cond_fd

    const v1, 0x7f0a0c79

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/google/android/material/textfield/TextInputLayout;

    if-eqz v15, :cond_fd

    new-instance v5, Lhm9;

    move-object v6, v0

    check-cast v6, Landroid/widget/ScrollView;

    invoke-direct/range {v5 .. v15}, Lhm9;-><init>(Landroid/widget/ScrollView;Lcom/google/android/material/textfield/MaterialAutoCompleteTextView;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/button/MaterialButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;Lcom/google/android/material/button/MaterialButton;Lcom/opera/android/custom_views/OperaTextInputEditText;Lcom/google/android/material/textfield/TextInputLayout;)V

    move-object v3, v5

    goto :goto_10c

    :cond_fd
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_10c
    return-object v3

    :sswitch_10d
    const v1, 0x7f0d01d3

    invoke-virtual {v0, v1, v2, v5}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a09bb

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v7, :cond_1e4

    const v1, 0x7f0a09c5

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v8, :cond_1e4

    const v1, 0x7f0a09ee

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v9, v2

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v9, :cond_1e4

    const v1, 0x7f0a0a11

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_1e4

    const v1, 0x7f0a0a1e

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Landroid/widget/FrameLayout;

    if-eqz v11, :cond_1e4

    const v1, 0x7f0a0a1f

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v12, :cond_1e4

    const v1, 0x7f0a0a20

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v2, :cond_1e4

    const v1, 0x7f0a0a21

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v13, :cond_1e4

    const v1, 0x7f0a0a22

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v14, :cond_1e4

    const v1, 0x7f0a0a23

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v15, v2

    check-cast v15, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v15, :cond_1e4

    const v1, 0x7f0a0a24

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v16, v2

    check-cast v16, Landroid/widget/TextView;

    if-eqz v16, :cond_1e4

    const v1, 0x7f0a0a25

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v17, v2

    check-cast v17, Landroid/widget/LinearLayout;

    if-eqz v17, :cond_1e4

    const v1, 0x7f0a0a26

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v18, v2

    check-cast v18, Landroid/widget/ImageView;

    if-eqz v18, :cond_1e4

    const v1, 0x7f0a0a27

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v19, v2

    check-cast v19, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v19, :cond_1e4

    const v1, 0x7f0a0a28

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object/from16 v20, v2

    check-cast v20, Lcom/google/android/material/slider/Slider;

    if-eqz v20, :cond_1e4

    const v1, 0x7f0a0a29

    invoke-static {v1, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v2, :cond_1e4

    new-instance v5, Lvk9;

    move-object v6, v0

    check-cast v6, Landroid/widget/LinearLayout;

    invoke-direct/range {v5 .. v20}, Lvk9;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/TextView;Landroid/widget/LinearLayout;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/google/android/material/slider/Slider;)V

    move-object v3, v5

    goto :goto_1f3

    :cond_1e4
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_1f3
    return-object v3

    :sswitch_data_1f4
    .sparse-switch
        0x12 -> :sswitch_10d
        0x1b -> :sswitch_67
    .end sparse-switch
.end method
