.class public abstract Ld43;
.super Lve;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ljava/lang/String;

.field public final c:Lhrj;

.field public final d:Lf1p;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lgrj;I)V
    .registers 6

    invoke-direct {p0}, Landroid/view/ActionMode$Callback2;-><init>()V

    iput-object p1, p0, Ld43;->a:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Ld43;->b:Ljava/lang/String;

    new-instance v1, Lhrj;

    invoke-direct {v1, p1, p2, p3}, Lhrj;-><init>(Landroid/content/Context;Lgrj;I)V

    iput-object v1, p0, Ld43;->c:Lhrj;

    new-instance p1, Lf1p;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    new-instance p2, Ljava/util/HashMap;

    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    iput-object p2, p1, Lf1p;->b:Ljava/lang/Object;

    iput-object v0, p1, Lf1p;->a:Ljava/lang/Object;

    iput-object p1, p0, Ld43;->d:Lf1p;

    return-void
.end method


# virtual methods
.method public final a(Lnzi;Z)Z
    .registers 3

    const/4 p0, 0x0

    return p0
.end method

.method public abstract b()Ljava/lang/String;
.end method

.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .registers 4

    iget-object p0, p0, Ld43;->c:Lhrj;

    iget-object p1, p0, Lhrj;->d:Lsc;

    if-eqz p1, :cond_1d

    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result p2

    const v0, 0x1020041

    if-eq p2, v0, :cond_10

    const/4 p1, 0x0

    :cond_10
    if-eqz p1, :cond_1d

    iget-object p0, p0, Lhrj;->a:Landroid/content/Context;

    iget-object p1, p1, Lsc;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    const/4 p0, 0x1

    return p0

    :cond_1d
    const/4 p0, 0x0

    return p0
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 3

    const/4 p0, 0x1

    return p0
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .registers 2

    iget-object p0, p0, Ld43;->c:Lhrj;

    const/4 p1, 0x0

    iput-object p1, p0, Lhrj;->d:Lsc;

    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .registers 12

    invoke-virtual {p0}, Ld43;->b()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Ld43;->c:Lhrj;

    iget v1, v0, Lhrj;->c:I

    const/4 v2, 0x0

    iput-object v2, v0, Lhrj;->d:Lsc;

    if-eqz p2, :cond_13

    const v3, 0x7f0a0b65

    invoke-interface {p2, v3}, Landroid/view/Menu;->removeItem(I)V

    :cond_13
    const/4 v3, 0x0

    const/4 v4, 0x1

    if-eqz p1, :cond_45

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v4

    move v6, v3

    move v7, v6

    :goto_1e
    if-gt v6, v5, :cond_3b

    if-nez v7, :cond_24

    move v8, v6

    goto :goto_25

    :cond_24
    move v8, v5

    :goto_25
    invoke-virtual {p1, v8}, Ljava/lang/String;->charAt(I)C

    move-result v8

    invoke-static {v8}, Lkotlin/text/CharsKt;->c(C)Z

    move-result v8

    if-nez v7, :cond_36

    if-nez v8, :cond_33

    move v7, v4

    goto :goto_1e

    :cond_33
    add-int/lit8 v6, v6, 0x1

    goto :goto_1e

    :cond_36
    if-eqz v8, :cond_3b

    add-int/lit8 v5, v5, -0x1

    goto :goto_1e

    :cond_3b
    add-int/2addr v5, v4

    invoke-virtual {p1, v6, v5}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_46

    :cond_45
    move-object p1, v2

    :goto_46
    iget-object v5, v0, Lhrj;->b:Lgrj;

    invoke-interface {v5}, Lgrj;->e0()Landroid/view/textclassifier/TextClassification;

    move-result-object v5

    if-eqz v5, :cond_84

    invoke-virtual {v5}, Landroid/view/textclassifier/TextClassification;->getText()Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_84

    const-string v7, "url"

    invoke-virtual {v5, v7}, Landroid/view/textclassifier/TextClassification;->getConfidenceScore(Ljava/lang/String;)F

    move-result v7

    const v8, 0x3f7ae148    # 0.98f

    cmpl-float v7, v7, v8

    if-lez v7, :cond_66

    invoke-virtual {v0, v6}, Lhrj;->b(Ljava/lang/String;)Lcrj;

    move-result-object v5

    goto :goto_85

    :cond_66
    const-string v7, "money"

    invoke-virtual {v5, v7}, Landroid/view/textclassifier/TextClassification;->getConfidenceScore(Ljava/lang/String;)F

    move-result v7

    cmpl-float v7, v7, v8

    if-lez v7, :cond_75

    invoke-virtual {v0, v6}, Lhrj;->a(Ljava/lang/String;)Lbrj;

    move-result-object v5

    goto :goto_85

    :cond_75
    const-string v7, "unit"

    invoke-virtual {v5, v7}, Landroid/view/textclassifier/TextClassification;->getConfidenceScore(Ljava/lang/String;)F

    move-result v5

    cmpl-float v5, v5, v8

    if-lez v5, :cond_84

    invoke-virtual {v0, v6}, Lhrj;->a(Ljava/lang/String;)Lbrj;

    move-result-object v5

    goto :goto_85

    :cond_84
    move-object v5, v2

    :goto_85
    const/4 v6, 0x3

    if-nez v5, :cond_e4

    if-eqz p1, :cond_e3

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    if-eqz v5, :cond_e3

    sget-object v5, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p1}, LJ/N;->Mhbidx2d(Ljava/lang/Object;)I

    move-result v5

    if-ne v5, v6, :cond_b6

    invoke-static {p1}, LJ/N;->MxvwDZcS(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lorg/chromium/url/GURL;

    iget-boolean v7, v5, Lorg/chromium/url/GURL;->b:Z

    if-eqz v7, :cond_b6

    invoke-virtual {v5}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7, v3}, Lwqm;->F(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_b6

    invoke-virtual {v5}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lhrj;->b(Ljava/lang/String;)Lcrj;

    move-result-object p1

    :goto_b4
    move-object v5, p1

    goto :goto_e4

    :cond_b6
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v5

    const/16 v7, 0xff

    if-gt v5, v7, :cond_e3

    new-instance v5, Landroid/text/SpannableString;

    invoke-direct {v5, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    invoke-static {v5, v1}, Landroid/text/util/Linkify;->addLinks(Landroid/text/Spannable;I)Z

    move-result p1

    if-eqz p1, :cond_e3

    invoke-virtual {v5}, Landroid/text/SpannableString;->length()I

    move-result p1

    const-class v7, Landroid/text/style/URLSpan;

    invoke-virtual {v5, v3, p1, v7}, Landroid/text/SpannableString;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/text/style/URLSpan;

    array-length v5, p1

    if-gt v5, v4, :cond_e3

    aget-object p1, p1, v3

    invoke-virtual {p1}, Landroid/text/style/URLSpan;->getURL()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lhrj;->b(Ljava/lang/String;)Lcrj;

    move-result-object p1

    goto :goto_b4

    :cond_e3
    move-object v5, v2

    :cond_e4
    :goto_e4
    if-eqz v5, :cond_10d

    const p1, 0x1020041

    invoke-interface {p2, p1}, Landroid/view/Menu;->removeItem(I)V

    instance-of v7, v5, Lcrj;

    if-eqz v7, :cond_fa

    move-object v7, v5

    check-cast v7, Lcrj;

    iget-object v7, v7, Lcrj;->d:Lfrj;

    iget-byte v7, v7, Lfrj;->c:B

    and-int/2addr v1, v7

    if-eqz v1, :cond_10d

    :cond_fa
    iput-object v5, v0, Lhrj;->d:Lsc;

    iget v0, v0, Lhrj;->e:I

    iget-object v1, v5, Lsc;->b:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    invoke-interface {p2, v0, p1, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    move-result-object p1

    iget-object v0, v5, Lsc;->c:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/drawable/Drawable;

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setIcon(Landroid/graphics/drawable/Drawable;)Landroid/view/MenuItem;

    :cond_10d
    iget-object p0, p0, Ld43;->d:Lf1p;

    iget-object p1, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/util/HashMap;->clear()V

    move v0, v3

    :goto_117
    invoke-interface {p2}, Landroid/view/Menu;->size()I

    move-result v1

    if-ge v0, v1, :cond_14b

    invoke-interface {p2, v0}, Landroid/view/Menu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v1

    invoke-interface {v1}, Landroid/view/MenuItem;->getTitle()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_148

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    sget-object v7, Lwwc;->a:Ljava/util/Locale;

    invoke-virtual {v5, v7}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/util/List;

    if-nez v7, :cond_145

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-virtual {p1, v5, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_145
    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_148
    add-int/lit8 v0, v0, 0x1

    goto :goto_117

    :cond_14b
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_158
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1d9

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    const-string v5, "android.intent.action.PROCESS_TEXT"

    if-le v1, v4, :cond_1ab

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_170
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1ab

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/view/MenuItem;

    invoke-interface {v6}, Landroid/view/MenuItem;->getIntent()Landroid/content/Intent;

    move-result-object v7

    if-nez v7, :cond_184

    move v7, v3

    goto :goto_18c

    :cond_184
    invoke-virtual {v7}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    :goto_18c
    if-eqz v7, :cond_1ac

    iget-object v7, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    invoke-interface {v6}, Landroid/view/MenuItem;->getIntent()Landroid/content/Intent;

    move-result-object v8

    if-eqz v8, :cond_19e

    invoke-virtual {v8}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v8

    if-nez v8, :cond_1a0

    :cond_19e
    move v7, v3

    goto :goto_1a8

    :cond_1a0
    invoke-virtual {v8}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    :goto_1a8
    if-eqz v7, :cond_170

    goto :goto_1ac

    :cond_1ab
    move-object v6, v2

    :cond_1ac
    :goto_1ac
    if-eqz v6, :cond_158

    move v1, v3

    :goto_1af
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    if-ge v1, v7, :cond_158

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/MenuItem;

    if-eq v6, v7, :cond_1d6

    invoke-interface {v7}, Landroid/view/MenuItem;->getIntent()Landroid/content/Intent;

    move-result-object v8

    if-nez v8, :cond_1c5

    move v8, v3

    goto :goto_1cd

    :cond_1c5
    invoke-virtual {v8}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    :goto_1cd
    if-nez v8, :cond_1d3

    invoke-virtual {p2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1d6

    :cond_1d3
    invoke-virtual {p2, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_1d6
    :goto_1d6
    add-int/lit8 v1, v1, 0x1

    goto :goto_1af

    :cond_1d9
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p0

    move p1, v3

    :goto_1de
    if-ge p1, p0, :cond_1ec

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 p1, p1, 0x1

    check-cast v0, Landroid/view/MenuItem;

    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_1de

    :cond_1ec
    return v4
.end method
