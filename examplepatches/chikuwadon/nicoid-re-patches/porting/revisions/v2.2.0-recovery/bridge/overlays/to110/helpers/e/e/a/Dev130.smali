.class public final Le/e/a/Dev130;
.super Ljava/lang/Object;
.source "Dev130.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static stripFinalStop(Landroid/widget/TextView;)V
    .registers 4
    .param p0, "text"    # Landroid/widget/TextView;

    .line 30
    if-nez p0, :cond_0

    return-void

    .line 31
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 32
    .local v0, "s":Ljava/lang/String;
    const-string v1, "\u3002"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    const-string/jumbo v1, "\uff0e"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 33
    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 35
    :cond_2
    return-void
.end method

.method public static styleSensitivity(Landroid/widget/TextView;)V
    .registers 10
    .param p0, "text"    # Landroid/widget/TextView;

    .line 14
    if-nez p0, :cond_0

    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 16
    .local v0, "original":Ljava/lang/String;
    const/16 v1, 0xa

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    .line 17
    .local v1, "separator":I
    if-ltz v1, :cond_4

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x1

    sub-int/2addr v2, v3

    if-lt v1, v2, :cond_1

    goto :goto_2

    .line 18
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    iget v2, v2, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 v2, v2, 0x30

    const/16 v4, 0x20

    const/4 v5, 0x0

    if-ne v2, v4, :cond_2

    goto :goto_0

    :cond_2
    const/4 v3, 0x0

    .line 20
    .local v3, "night":Z
    :goto_0
    if-eqz v3, :cond_3

    const v2, -0x57524c

    goto :goto_1

    :cond_3
    const v2, -0x9d9790

    .line 21
    .local v2, "grey":I
    :goto_1
    new-instance v4, Landroid/text/SpannableString;

    invoke-direct {v4, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 22
    .local v4, "result":Landroid/text/SpannableString;
    new-instance v6, Landroid/text/style/RelativeSizeSpan;

    const v7, 0x3f5c28f6    # 0.86f

    invoke-direct {v6, v7}, Landroid/text/style/RelativeSizeSpan;-><init>(F)V

    add-int/lit8 v7, v1, 0x1

    .line 23
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    .line 22
    invoke-virtual {v4, v6, v7, v8, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 24
    new-instance v6, Landroid/text/style/ForegroundColorSpan;

    invoke-direct {v6, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    add-int/lit8 v7, v1, 0x1

    .line 25
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v8

    .line 24
    invoke-virtual {v4, v6, v7, v8, v5}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 26
    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 27
    return-void

    .line 17
    .end local v2    # "grey":I
    .end local v3    # "night":Z
    .end local v4    # "result":Landroid/text/SpannableString;
    :cond_4
    :goto_2
    return-void
.end method
