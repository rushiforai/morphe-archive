.class public final Le/e/a/VideoCounts;
.super Ljava/lang/Object;
.source "VideoCounts.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/VideoCounts$CountIcon;
    }
.end annotation


# static fields
.field private static final LABELS:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 15
    const-string v0, "\u3044\u3044\u306d"

    const-string v1, "\u30de\u30a4\u30ea\u30b9"

    const-string v2, "\u518d\u751f\u6570"

    const-string v3, "\u30b3\u30e1\u30f3\u30c8"

    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/VideoCounts;->LABELS:[Ljava/lang/String;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static render(Landroid/widget/TextView;[J)V
    .registers 13
    .param p0, "view"    # Landroid/widget/TextView;
    .param p1, "counts"    # [J

    .line 27
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 28
    .local v0, "accent":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/widget/TextView;->getCurrentTextColor()I

    move-result v1

    .line 29
    .local v1, "color":I
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const v3, 0x7f03005e

    const/4 v4, 0x1

    invoke-virtual {v2, v3, v0, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v2

    if-eqz v2, :cond_2d

    .line 30
    iget v2, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz v2, :cond_2a

    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget v3, v0, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getColor(I)I

    move-result v2

    goto :goto_2c

    :cond_2a
    iget v2, v0, Landroid/util/TypedValue;->data:I

    :goto_2c
    move v1, v2

    .line 33
    :cond_2d
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    .line 34
    .local v2, "background":Landroid/util/TypedValue;
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v3

    const v5, 0x1010031

    invoke-virtual {v3, v5, v2, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result v3

    if-eqz v3, :cond_99

    .line 35
    iget v3, v2, Landroid/util/TypedValue;->resourceId:I

    if-eqz v3, :cond_52

    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v4, v2, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    goto :goto_54

    :cond_52
    iget v3, v2, Landroid/util/TypedValue;->data:I

    .line 36
    .local v3, "bg":I
    :goto_54
    invoke-static {v3}, Landroid/graphics/Color;->red(I)I

    move-result v4

    mul-int/lit16 v4, v4, 0x12b

    invoke-static {v3}, Landroid/graphics/Color;->green(I)I

    move-result v5

    mul-int/lit16 v5, v5, 0x24b

    add-int/2addr v4, v5

    invoke-static {v3}, Landroid/graphics/Color;->blue(I)I

    move-result v5

    mul-int/lit8 v5, v5, 0x72

    add-int/2addr v4, v5

    const v5, 0x1f400

    if-ge v4, v5, :cond_99

    .line 37
    invoke-static {v1}, Landroid/graphics/Color;->alpha(I)I

    move-result v4

    invoke-static {v1}, Landroid/graphics/Color;->red(I)I

    move-result v5

    int-to-float v5, v5

    const v6, 0x3f59999a    # 0.85f

    mul-float v5, v5, v6

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v5

    .line 38
    invoke-static {v1}, Landroid/graphics/Color;->green(I)I

    move-result v7

    int-to-float v7, v7

    mul-float v7, v7, v6

    invoke-static {v7}, Ljava/lang/Math;->round(F)I

    move-result v7

    invoke-static {v1}, Landroid/graphics/Color;->blue(I)I

    move-result v8

    int-to-float v8, v8

    mul-float v8, v8, v6

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v6

    .line 37
    invoke-static {v4, v5, v7, v6}, Landroid/graphics/Color;->argb(IIII)I

    move-result v1

    .line 41
    .end local v3    # "bg":I
    :cond_99
    new-instance v3, Landroid/text/SpannableStringBuilder;

    invoke-direct {v3}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 42
    .local v3, "text":Landroid/text/SpannableStringBuilder;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .local v4, "description":Ljava/lang/StringBuilder;
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_a4
    array-length v6, p1

    if-ge v5, v6, :cond_fd

    .line 44
    aget-wide v6, p1, v5

    const-wide/16 v8, 0x0

    cmp-long v10, v6, v8

    if-gez v10, :cond_b0

    goto :goto_fa

    .line 45
    :cond_b0
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    if-eqz v6, :cond_c0

    const-string v6, "  "

    invoke-virtual {v3, v6}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    const-string v6, ", "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    :cond_c0
    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v6

    .line 47
    .local v6, "start":I
    const v7, 0xfffc

    invoke-virtual {v3, v7}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    .line 48
    new-instance v7, Le/e/a/VideoCounts$CountIcon;

    invoke-direct {v7, v5, v1}, Le/e/a/VideoCounts$CountIcon;-><init>(II)V

    add-int/lit8 v8, v6, 0x1

    const/16 v9, 0x21

    invoke-virtual {v3, v7, v6, v8, v9}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 49
    aget-wide v7, p1, v5

    invoke-static {v7, v8}, Le/e/a/VideoCountRules;->format(J)Ljava/lang/String;

    move-result-object v7

    .line 50
    .local v7, "number":Ljava/lang/String;
    const/16 v8, 0xa0

    invoke-virtual {v3, v8}, Landroid/text/SpannableStringBuilder;->append(C)Landroid/text/SpannableStringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 51
    sget-object v8, Le/e/a/VideoCounts;->LABELS:[Ljava/lang/String;

    aget-object v8, v8, v5

    invoke-static {v8}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const/16 v9, 0x20

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .end local v6    # "start":I
    .end local v7    # "number":Ljava/lang/String;
    :goto_fa
    add-int/lit8 v5, v5, 0x1

    goto :goto_a4

    .line 54
    .end local v5    # "i":I
    :cond_fd
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Landroid/widget/TextView;->setSingleLine(Z)V

    .line 55
    const v5, 0x7fffffff

    invoke-virtual {p0, v5}, Landroid/widget/TextView;->setMaxLines(I)V

    .line 56
    const/4 v5, 0x0

    invoke-virtual {p0, v5}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 57
    invoke-virtual {p0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 58
    invoke-virtual {p0, v4}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 59
    return-void
.end method

.method public static setText(Landroid/widget/TextView;Ljava/lang/CharSequence;)V
    .registers 4
    .param p0, "view"    # Landroid/widget/TextView;
    .param p1, "original"    # Ljava/lang/CharSequence;

    .line 19
    invoke-static {p1}, Le/e/a/VideoCountRules;->parse(Ljava/lang/CharSequence;)[J

    move-result-object v0

    .line 21
    .local v0, "counts":[J
    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/widget/TextView;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 22
    if-nez v0, :cond_e

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    .line 23
    :cond_e
    invoke-static {p0, v0}, Le/e/a/VideoCounts;->render(Landroid/widget/TextView;[J)V

    .line 24
    return-void
.end method
