.class Le/e/a/SearchRange$1;
.super Ljava/lang/Object;
.source "SearchRange.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/SearchRange;->durations(Landroid/content/Context;[ILandroid/widget/Button;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field private final synthetic val$bar:Le/e/a/DurationRangeBar;

.field private final synthetic val$draw:Ljava/lang/Runnable;

.field private final synthetic val$high:Landroid/widget/EditText;

.field private final synthetic val$low:Landroid/widget/EditText;

.field private final synthetic val$model:Le/e/a/DurationRangeModel;

.field private final synthetic val$rangeLabel:Landroid/widget/TextView;

.field private final synthetic val$syncing:[Z


# direct methods
.method constructor <init>([ZLe/e/a/DurationRangeModel;Landroid/widget/EditText;Landroid/widget/EditText;Le/e/a/DurationRangeBar;Ljava/lang/Runnable;Landroid/widget/TextView;)V
    .registers 8

    .line 34
    iput-object p1, p0, Le/e/a/SearchRange$1;->val$syncing:[Z

    iput-object p2, p0, Le/e/a/SearchRange$1;->val$model:Le/e/a/DurationRangeModel;

    iput-object p3, p0, Le/e/a/SearchRange$1;->val$low:Landroid/widget/EditText;

    iput-object p4, p0, Le/e/a/SearchRange$1;->val$high:Landroid/widget/EditText;

    iput-object p5, p0, Le/e/a/SearchRange$1;->val$bar:Le/e/a/DurationRangeBar;

    iput-object p6, p0, Le/e/a/SearchRange$1;->val$draw:Ljava/lang/Runnable;

    iput-object p7, p0, Le/e/a/SearchRange$1;->val$rangeLabel:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 5

    .line 34
    iget-object p1, p0, Le/e/a/SearchRange$1;->val$syncing:[Z

    const/4 v0, 0x0

    aget-boolean p1, p1, v0

    if-eqz p1, :cond_8

    return-void

    :cond_8
    :try_start_8
    iget-object p1, p0, Le/e/a/SearchRange$1;->val$model:Le/e/a/DurationRangeModel;

    iget-object v1, p0, Le/e/a/SearchRange$1;->val$low:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/SearchRange;->parse(Ljava/lang/String;)I

    move-result v1

    iget-object v2, p0, Le/e/a/SearchRange$1;->val$model:Le/e/a/DurationRangeModel;

    iget-boolean v2, v2, Le/e/a/DurationRangeModel;->unlimited:Z

    if-eqz v2, :cond_23

    iget-object v2, p0, Le/e/a/SearchRange$1;->val$model:Le/e/a/DurationRangeModel;

    iget v2, v2, Le/e/a/DurationRangeModel;->high:I

    goto :goto_31

    :cond_23
    iget-object v2, p0, Le/e/a/SearchRange$1;->val$high:Landroid/widget/EditText;

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/SearchRange;->parse(Ljava/lang/String;)I

    move-result v2

    :goto_31
    invoke-virtual {p1, v1, v2}, Le/e/a/DurationRangeModel;->typed(II)V

    iget-object p1, p0, Le/e/a/SearchRange$1;->val$low:Landroid/widget/EditText;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Le/e/a/SearchRange$1;->val$high:Landroid/widget/EditText;

    invoke-virtual {p1, v1}, Landroid/widget/EditText;->setError(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Le/e/a/SearchRange$1;->val$bar:Le/e/a/DurationRangeBar;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Le/e/a/DurationRangeBar;->setEnabled(Z)V

    iget-object p1, p0, Le/e/a/SearchRange$1;->val$draw:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V
    :try_end_4a
    .catch Ljava/lang/IllegalArgumentException; {:try_start_8 .. :try_end_4a} :catch_4b

    goto :goto_58

    :catch_4b
    move-exception p1

    iget-object p1, p0, Le/e/a/SearchRange$1;->val$bar:Le/e/a/DurationRangeBar;

    invoke-virtual {p1, v0}, Le/e/a/DurationRangeBar;->setEnabled(Z)V

    iget-object p1, p0, Le/e/a/SearchRange$1;->val$rangeLabel:Landroid/widget/TextView;

    const-string v0, "\u5206:\u79d2\u3067\u3001\u6700\u77ed \u2266 \u6700\u9577\u306b\u306a\u308b\u3088\u3046\u6307\u5b9a\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_58
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 34
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 34
    return-void
.end method
