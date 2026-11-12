.class public final Lu3h;
.super Lpa3;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final b:Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;

.field public final c:Lhqk;

.field public final d:Lnv6;

.field public e:Lfqk;


# direct methods
.method public constructor <init>(Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;Lhqk;Lnv6;)V
    .registers 4

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lu3h;->b:Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;

    iput-object p2, p0, Lu3h;->c:Lhqk;

    iput-object p3, p0, Lu3h;->d:Lnv6;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final U(Lgqk;Ljava/lang/String;)V
    .registers 10

    check-cast p1, Lfqk;

    iput-object p1, p0, Lu3h;->e:Lfqk;

    iget-object p2, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object v0, p0, Lu3h;->b:Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;

    iput-object p2, v0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->p:Lcom/opera/android/suggestion/Suggestion;

    iget-object v1, v0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->q:Lpt1;

    iget-object v2, v1, Lpt1;->b:Landroid/view/View;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v3, p2, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    sget-object v2, Lyne;->b:Ldeg;

    iget-object v3, p2, Lcom/opera/android/suggestion/Suggestion;->h:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ldeg;->i(Ljava/lang/String;)Ldwh;

    move-result-object v2

    new-instance v3, Ldcd;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    new-instance v5, Lixh;

    const/high16 v6, 0x42380000    # 46.0f

    invoke-direct {v5, v6}, Lixh;-><init>(F)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v5, v6}, Ly7h;->k(Landroid/content/Context;)I

    move-result v5

    invoke-direct {v3, v4, v5}, Ldcd;-><init>(Landroid/content/Context;I)V

    iget-object v4, v2, Ldwh;->b:Lgvh;

    invoke-virtual {v4, v3}, Lgvh;->c(Le2m;)V

    iget-object v3, v1, Lpt1;->e:Ljava/lang/Object;

    check-cast v3, Landroid/widget/ImageView;

    new-instance v4, Lisd;

    const/16 v5, 0xe

    invoke-direct {v4, v0, v5}, Lisd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v3, v4}, Ldwh;->g(Landroid/widget/ImageView;Ld94;)V

    iget-object p2, p2, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    instance-of v2, p2, Lc3h;

    if-eqz v2, :cond_51

    check-cast p2, Lc3h;

    goto :goto_52

    :cond_51
    const/4 p2, 0x0

    :goto_52
    if-eqz p2, :cond_a2

    iget-object v2, p2, Lc3h;->d:Ljava/lang/String;

    iget-object v3, v1, Lpt1;->g:Landroid/view/View;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    iget-object v4, p2, Lc3h;->c:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v1, Lpt1;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    invoke-static {}, Ljava/text/NumberFormat;->getCurrencyInstance()Ljava/text/NumberFormat;

    move-result-object v3

    iget-object v4, p2, Lc3h;->b:Ljava/lang/String;

    invoke-static {v4}, Ljava/util/Currency;->getInstance(Ljava/lang/String;)Ljava/util/Currency;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/text/NumberFormat;->setCurrency(Ljava/util/Currency;)V

    iget v4, p2, Lc3h;->a:F

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v1, Lixh;

    const/high16 v3, 0x41e00000    # 28.0f

    invoke-direct {v1, v3}, Lixh;-><init>(F)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v1, v3}, Ly7h;->k(Landroid/content/Context;)I

    move-result v1

    iget-object v3, v0, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->t:Ljava/util/LinkedHashSet;

    invoke-interface {v3, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9f

    new-instance v3, Lq14;

    const/4 v4, 0x6

    invoke-direct {v3, v0, p2, v1, v4}, Lq14;-><init>(Ljava/lang/Object;Ljava/lang/Object;IB)V

    const/4 p2, 0x1

    invoke-virtual {v0, v2, v1, p2, v3}, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->r(Ljava/lang/String;IZLkotlin/jvm/functions/Function0;)V

    goto :goto_a2

    :cond_9f
    invoke-virtual {v0, p2, v1}, Lcom/opera/android/suggestion/adapter/ProductSuggestionListItem;->s(Lc3h;I)V

    :cond_a2
    :goto_a2
    iget-object p0, p0, Lu3h;->d:Lnv6;

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {p0, p1}, Lnv6;->D(Lcom/opera/android/suggestion/Suggestion;)V

    return-void
.end method

.method public final Y()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lu3h;->e:Lfqk;

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 4

    iget-object v0, p0, Lu3h;->e:Lfqk;

    if-eqz v0, :cond_a

    iget-object v0, v0, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object v1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eq p1, v1, :cond_b

    :cond_a
    return-void

    :cond_b
    iget-object p1, p0, Lu3h;->d:Lnv6;

    invoke-virtual {p1, v0}, Lnv6;->C(Lcom/opera/android/suggestion/Suggestion;)V

    iget-object p0, p0, Lu3h;->c:Lhqk;

    const/4 p1, 0x1

    invoke-virtual {p0, v0, p1}, Lhqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    return-void
.end method
