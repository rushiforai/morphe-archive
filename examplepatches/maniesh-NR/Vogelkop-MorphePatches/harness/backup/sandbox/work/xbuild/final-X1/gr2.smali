.class public final Lgr2;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ljava/lang/CharSequence;

.field public final c:Lcom/opera/android/autofill/Address;


# direct methods
.method public constructor <init>(Lmr2;Lcom/opera/android/autofill/Address;)V
    .registers 9

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p2, Lcom/opera/android/autofill/AutofillItem;->a:Ljava/lang/String;

    iput-object v0, p0, Lgr2;->a:Ljava/lang/String;

    iget-object v0, p1, Lmr2;->s:Lcom/opera/android/autofill/AutofillManager;

    invoke-static {v0, p2}, Lqbe;->W(Lcom/opera/android/autofill/AutofillManager;Lcom/opera/android/autofill/Address;)I

    move-result v0

    iget-object v1, p2, Lcom/opera/android/autofill/Address;->n:Ljava/lang/String;

    const/4 v2, 0x1

    if-eq v0, v2, :cond_78

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f0402d7

    const v5, 0x7f0602c4

    invoke-static {v4, v3, v5}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v3

    new-instance v4, Landroid/text/SpannableStringBuilder;

    invoke-direct {v4, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    const v5, 0x7f140207

    invoke-virtual {v1, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v1

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    if-eq v0, v2, :cond_5f

    const/4 v2, 0x2

    if-eq v0, v2, :cond_5b

    const/4 v2, 0x3

    if-eq v0, v2, :cond_57

    const/4 v2, 0x4

    if-eq v0, v2, :cond_53

    const/4 v2, 0x5

    if-eq v0, v2, :cond_4f

    const/4 v0, 0x0

    goto :goto_62

    :cond_4f
    const v0, 0x7f140cae

    goto :goto_62

    :cond_53
    const v0, 0x7f140ca7

    goto :goto_62

    :cond_57
    const v0, 0x7f140cb4

    goto :goto_62

    :cond_5b
    const v0, 0x7f140cb9

    goto :goto_62

    :cond_5f
    const v0, 0x7f140cab

    :goto_62
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v4, p1}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    new-instance p1, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {p1, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v4}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v0

    const/16 v2, 0x21

    invoke-virtual {v4, p1, v1, v0, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    move-object v1, v4

    :cond_78
    iput-object v1, p0, Lgr2;->b:Ljava/lang/CharSequence;

    iput-object p2, p0, Lgr2;->c:Lcom/opera/android/autofill/Address;

    return-void
.end method

.method public constructor <init>(Lmr2;Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    iput-object p2, p0, Lgr2;->a:Ljava/lang/String;

    .line 127
    iput-object p3, p0, Lgr2;->b:Ljava/lang/CharSequence;

    const/4 p1, 0x0

    .line 128
    iput-object p1, p0, Lgr2;->c:Lcom/opera/android/autofill/Address;

    return-void
.end method


# virtual methods
.method public final toString()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lgr2;->b:Ljava/lang/CharSequence;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
