.class public final Le/e/a/NumericInput114;
.super Ljava/lang/Object;
.source "NumericInput114.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static configure(Landroid/widget/EditText;)V
    .registers 4

    .line 4
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setSingleLine(Z)V

    const/high16 v0, 0x41800000    # 16.0f

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setTextSize(F)V

    const/4 v0, 0x2

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setInputType(I)V

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setTransformationMethod(Landroid/text/method/TransformationMethod;)V

    const v2, 0x11000005

    invoke-virtual {p0, v2}, Landroid/widget/EditText;->setImeOptions(I)V

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setImportantForAutofill(I)V

    invoke-virtual {p0, v1}, Landroid/widget/EditText;->setAutofillHints([Ljava/lang/String;)V

    const-string v0, "com.google.android.inputmethod.latin.noPersonalizedLearning=true,com.google.android.inputmethod.latin.noMicrophoneKey"

    invoke-virtual {p0, v0}, Landroid/widget/EditText;->setPrivateImeOptions(Ljava/lang/String;)V

    return-void
.end method

.method static hint(Ljava/lang/String;)Ljava/lang/CharSequence;
    .registers 6

    .line 5
    new-instance v0, Landroid/text/SpannableString;

    invoke-direct {v0, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    const v1, 0xff08

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_14

    const/16 v1, 0x28

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    :cond_14
    if-ltz v1, :cond_27

    new-instance v2, Landroid/text/style/AbsoluteSizeSpan;

    const/16 v3, 0xc

    const/4 v4, 0x1

    invoke-direct {v2, v3, v4}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    const/16 v3, 0x21

    invoke-virtual {v0, v2, v1, p0, v3}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    :cond_27
    return-object v0
.end method
