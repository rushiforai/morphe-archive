.class public final Lyqm;
.super Lfmj;
.source "SourceFile"


# instance fields
.field public final f:Lnv6;

.field public final g:Z

.field public h:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;Lnv6;I)V
    .registers 5

    invoke-direct {p0, p1, p2}, Lfmj;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;)V

    iput-object p3, p0, Lyqm;->f:Lnv6;

    iput-boolean p4, p0, Lyqm;->g:Z

    new-instance p2, Lxqm;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lxqm;-><init>(Lyqm;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lxqm;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lxqm;-><init>(Lyqm;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final U(Lgqk;Ljava/lang/String;)V
    .registers 8

    check-cast p1, Lfqk;

    iput-object p1, p0, Lfmj;->d:Lfqk;

    iget-object v0, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {v0}, Lcom/opera/android/suggestion/Suggestion;->b()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v0

    iput-boolean v0, p0, Lyqm;->h:Z

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object v1, p0, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    iput-object p1, v1, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    iget-object v2, p0, Lfmj;->d:Lfqk;

    if-nez v2, :cond_1d

    const-string v0, ""

    goto :goto_40

    :cond_1d
    iget-object v2, v2, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    if-eqz v0, :cond_2e

    invoke-virtual {v2}, Lcom/opera/android/suggestion/Suggestion;->b()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lz5i;->K(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_40

    iget-object v0, v2, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    goto :goto_40

    :cond_2e
    iget-object v0, v2, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_40

    invoke-virtual {p0}, Lyqm;->a0()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lwqm;->a:[Ljava/lang/String;

    invoke-static {v0}, Laik;->g(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_40
    :goto_40
    new-instance v2, Lqxh;

    invoke-direct {v2, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    invoke-static {p1}, Lybh;->g(Lcom/opera/android/suggestion/Suggestion;)I

    move-result v0

    new-instance v2, Llxh;

    invoke-direct {v2, v0}, Llxh;-><init>(I)V

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    invoke-virtual {p0}, Lyqm;->a0()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_5f

    const/4 p2, 0x0

    invoke-virtual {v1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    goto :goto_93

    :cond_5f
    new-instance v2, Landroid/text/SpannableString;

    invoke-direct {v2, v0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    invoke-static {v0, p2}, Laik;->d(Ljava/lang/String;Ljava/lang/String;)Landroid/util/Pair;

    move-result-object p2

    iget-object v0, p2, Landroid/util/Pair;->first:Ljava/lang/Object;

    iget-object p2, p2, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    check-cast p2, Ljava/lang/Integer;

    if-eqz v0, :cond_79

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v3

    const/4 v4, -0x1

    if-eq v3, v4, :cond_8b

    :cond_79
    new-instance v3, Landroid/text/style/StyleSpan;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v0, p2, v4}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    :cond_8b
    new-instance p2, Lqxh;

    invoke-direct {p2, v2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    :goto_93
    iget-object p2, p0, Lyqm;->f:Lnv6;

    invoke-virtual {p2, p1}, Lnv6;->D(Lcom/opera/android/suggestion/Suggestion;)V

    iget-boolean p2, p0, Lyqm;->g:Z

    invoke-virtual {p0, p2, p1}, Lfmj;->Z(ILcom/opera/android/suggestion/Suggestion;)V

    return-void
.end method

.method public final a0()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lfmj;->d:Lfqk;

    if-eqz v0, :cond_1e

    iget-boolean v1, p0, Lyqm;->h:Z

    if-eqz v1, :cond_16

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f14017c

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_16
    iget-object p0, v0, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget v0, p0, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v1, 0xb

    if-ne v0, v1, :cond_20

    :cond_1e
    const/4 p0, 0x0

    return-object p0

    :cond_20
    invoke-virtual {p0}, Lcom/opera/android/suggestion/Suggestion;->b()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/opera/android/browser/BrowserUtils;->getDisplayString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x1f4

    invoke-static {v0, p0}, Lpik;->D(ILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Laik;->p(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    sget-object v0, Laik;->a:[Ljava/lang/String;

    invoke-static {p0, v0}, Laik;->s(Ljava/lang/String;[Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
