.class public final synthetic Lrt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;

.field public final synthetic b:Lqq6;

.field public final synthetic c:Landroid/view/View;

.field public final synthetic d:Landroid/view/View;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;Lqq6;Landroid/view/View;Landroid/view/View;)V
    .registers 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lrt3;->a:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lrt3;->b:Lqq6;

    iput-object p3, p0, Lrt3;->c:Landroid/view/View;

    iput-object p4, p0, Lrt3;->d:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 10

    check-cast p1, Lkp3;

    iget-object v0, p0, Lrt3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v1, v0, Lcom/opera/android/BrowserActivity;->A:Lcom/opera/android/bar/BottomBar;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    move-object v1, v2

    :cond_a
    iget-boolean v3, p1, Lkp3;->f:Z

    iget-boolean v4, v1, Lcom/opera/android/bar/BottomBar;->k:Z

    if-eq v4, v3, :cond_15

    iput-boolean v3, v1, Lcom/opera/android/bar/BottomBar;->k:Z

    invoke-virtual {v1}, Landroid/view/View;->invalidate()V

    :cond_15
    iget-object v1, v0, Lcom/opera/android/BrowserActivity;->A:Lcom/opera/android/bar/BottomBar;

    if-nez v1, :cond_1a

    move-object v1, v2

    :cond_1a
    iget-object v3, p1, Lkp3;->a:Lno3;

    invoke-virtual {v1, v3}, Lcom/opera/android/bar/BottomBar;->i(Lno3;)V

    iget-object v1, p0, Lrt3;->b:Lqq6;

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-eqz v1, :cond_95

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v0, :cond_2b

    move-object v0, v2

    :cond_2b
    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_37

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v2

    :cond_37
    iget-boolean v0, p1, Lkp3;->b:Z

    iget-object v5, v1, Lqq6;->b:Ljava/lang/Object;

    check-cast v5, Landroid/widget/TextView;

    if-eqz v0, :cond_92

    if-eqz v2, :cond_92

    new-instance v0, Lkotlin/text/Regex;

    const-string v6, "^https?://"

    invoke-direct {v0, v6}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    iget-object v0, v0, Lkotlin/text/Regex;->a:Ljava/util/regex/Pattern;

    invoke-virtual {v0, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v6, Lkotlin/text/Regex;

    const-string v7, "^www\\."

    invoke-direct {v6, v7}, Lkotlin/text/Regex;-><init>(Ljava/lang/String;)V

    iget-object v6, v6, Lkotlin/text/Regex;->a:Ljava/util/regex/Pattern;

    invoke-virtual {v6, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x2f

    const/4 v6, 0x6

    invoke-static {v0, v2, v4, v6}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v2

    const/4 v7, -0x1

    if-eq v2, v7, :cond_73

    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_73
    const/16 v2, 0x3a

    invoke-static {v0, v2, v4, v6}, Lkotlin/text/StringsKt;->K(Ljava/lang/CharSequence;CII)I

    move-result v2

    if-eq v2, v7, :cond_7f

    invoke-virtual {v0, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_7f
    invoke-virtual {v5, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v0, :cond_8e

    new-instance v2, Lzr9;

    const/16 v6, 0xf

    invoke-direct {v2, v1, v0, v6}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v5, v2}, Lq9n;->A(Landroid/view/View;Ljava/lang/Runnable;)V

    :cond_8e
    invoke-virtual {v5, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_95

    :cond_92
    invoke-virtual {v5, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_95
    :goto_95
    iget-object v0, p0, Lrt3;->c:Landroid/view/View;

    if-eqz v0, :cond_a3

    iget-boolean v1, p1, Lkp3;->d:Z

    if-eqz v1, :cond_9f

    move v1, v4

    goto :goto_a0

    :cond_9f
    move v1, v3

    :goto_a0
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_a3
    iget-object p0, p0, Lrt3;->d:Landroid/view/View;

    if-eqz p0, :cond_af

    iget-boolean p1, p1, Lkp3;->e:Z

    if-eqz p1, :cond_ac

    move v3, v4

    :cond_ac
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_af
    return-void
.end method
