.class Le/e/a/CustomTheme119$1;
.super Ljava/lang/Object;
.source "CustomTheme119.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/CustomTheme119;->edit(Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$c:Landroid/content/Context;

.field private final synthetic val$inputs:[Landroid/widget/EditText;

.field private final synthetic val$preview:Landroid/widget/TextView;

.field private final synthetic val$swatches:[Landroid/view/View;


# direct methods
.method constructor <init>([Landroid/widget/EditText;Landroid/content/Context;[Landroid/view/View;Landroid/widget/TextView;)V
    .registers 5

    .line 20
    iput-object p1, p0, Le/e/a/CustomTheme119$1;->val$inputs:[Landroid/widget/EditText;

    iput-object p2, p0, Le/e/a/CustomTheme119$1;->val$c:Landroid/content/Context;

    iput-object p3, p0, Le/e/a/CustomTheme119$1;->val$swatches:[Landroid/view/View;

    iput-object p4, p0, Le/e/a/CustomTheme119$1;->val$preview:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 2

    .line 20
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 20
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 7

    .line 20
    const/4 p1, 0x0

    const/4 p2, 0x0

    :goto_2
    iget-object p3, p0, Le/e/a/CustomTheme119$1;->val$inputs:[Landroid/widget/EditText;

    array-length p3, p3

    const/4 p4, 0x0

    if-lt p2, p3, :cond_59

    :try_start_8
    iget-object p2, p0, Le/e/a/CustomTheme119$1;->val$inputs:[Landroid/widget/EditText;

    const/4 p3, 0x2

    aget-object p2, p2, p3

    invoke-virtual {p2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Le/e/a/CustomTheme119;->parse(Ljava/lang/String;)I

    move-result p2

    iget-object p3, p0, Le/e/a/CustomTheme119$1;->val$preview:Landroid/widget/TextView;

    invoke-virtual {p3, p2}, Landroid/widget/TextView;->setBackgroundColor(I)V

    iget-object p2, p0, Le/e/a/CustomTheme119$1;->val$preview:Landroid/widget/TextView;

    iget-object p3, p0, Le/e/a/CustomTheme119$1;->val$inputs:[Landroid/widget/EditText;

    const/4 v0, 0x3

    aget-object p3, p3, v0

    invoke-virtual {p3}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Le/e/a/CustomTheme119;->parse(Ljava/lang/String;)I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p2, p0, Le/e/a/CustomTheme119$1;->val$preview:Landroid/widget/TextView;

    new-instance p3, Le/e/a/VideoMarks119$Done;

    iget-object v0, p0, Le/e/a/CustomTheme119$1;->val$inputs:[Landroid/widget/EditText;

    aget-object p1, v0, p1

    invoke-virtual {p1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CustomTheme119;->parse(Ljava/lang/String;)I

    move-result p1

    iget-object v0, p0, Le/e/a/CustomTheme119$1;->val$c:Landroid/content/Context;

    const/16 v1, 0x14

    invoke-static {v0, v1}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    invoke-direct {p3, p1, v0}, Le/e/a/VideoMarks119$Done;-><init>(II)V

    invoke-virtual {p2, p4, p4, p3, p4}, Landroid/widget/TextView;->setCompoundDrawables(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V
    :try_end_56
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_56} :catch_57

    goto :goto_58

    :catch_57
    move-exception p1

    :goto_58
    return-void

    :cond_59
    :try_start_59
    new-instance p3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {p3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    iget-object v1, p0, Le/e/a/CustomTheme119$1;->val$inputs:[Landroid/widget/EditText;

    aget-object v1, v1, p2

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/CustomTheme119;->parse(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {p3, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    iget-object v1, p0, Le/e/a/CustomTheme119$1;->val$c:Landroid/content/Context;

    invoke-static {v1, v0}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v0

    const v1, 0x66777777

    invoke-virtual {p3, v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    iget-object v0, p0, Le/e/a/CustomTheme119$1;->val$swatches:[Landroid/view/View;

    aget-object v0, v0, p2

    invoke-virtual {v0, p3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V
    :try_end_88
    .catch Ljava/lang/IllegalArgumentException; {:try_start_59 .. :try_end_88} :catch_89

    goto :goto_91

    :catch_89
    move-exception p3

    iget-object p3, p0, Le/e/a/CustomTheme119$1;->val$swatches:[Landroid/view/View;

    aget-object p3, p3, p2

    invoke-virtual {p3, p4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    :goto_91
    add-int/lit8 p2, p2, 0x1

    goto/16 :goto_2
.end method
