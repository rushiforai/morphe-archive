.class final Le/e/a/SearchSuggestions$CandidateAdapter;
.super Landroid/widget/BaseAdapter;
.source "SearchSuggestions.java"

# interfaces
.implements Landroid/widget/Filterable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/SearchSuggestions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "CandidateAdapter"
.end annotation


# instance fields
.field final context:Landroid/content/Context;

.field volatile values:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 14
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Le/e/a/SearchSuggestions$CandidateAdapter;->values:Ljava/util/List;

    iput-object p1, p0, Le/e/a/SearchSuggestions$CandidateAdapter;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public getCount()I
    .registers 2

    .line 14
    iget-object v0, p0, Le/e/a/SearchSuggestions$CandidateAdapter;->values:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getFilter()Landroid/widget/Filter;
    .registers 2

    .line 16
    new-instance v0, Le/e/a/SearchSuggestions$CandidateAdapter$1;

    invoke-direct {v0, p0}, Le/e/a/SearchSuggestions$CandidateAdapter$1;-><init>(Le/e/a/SearchSuggestions$CandidateAdapter;)V

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            null
        }
    .end annotation

    .line 13
    invoke-virtual {p0, p1}, Le/e/a/SearchSuggestions$CandidateAdapter;->getItem(I)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public getItem(I)Ljava/lang/String;
    .registers 3

    .line 14
    iget-object v0, p0, Le/e/a/SearchSuggestions$CandidateAdapter;->values:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    .line 14
    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 7

    .line 15
    instance-of p3, p2, Landroid/widget/TextView;

    if-eqz p3, :cond_7

    check-cast p2, Landroid/widget/TextView;

    goto :goto_e

    :cond_7
    new-instance p2, Landroid/widget/TextView;

    iget-object p3, p0, Le/e/a/SearchSuggestions$CandidateAdapter;->context:Landroid/content/Context;

    invoke-direct {p2, p3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    :goto_e
    invoke-virtual {p0, p1}, Le/e/a/SearchSuggestions$CandidateAdapter;->getItem(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/high16 p1, 0x41800000    # 16.0f

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextSize(F)V

    invoke-static {p2}, Le/e/a/ThemeChoice;->textColor(Landroid/view/View;)I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setTextColor(I)V

    iget-object p1, p0, Le/e/a/SearchSuggestions$CandidateAdapter;->context:Landroid/content/Context;

    invoke-static {p1}, Le/e/a/SearchSuggestions;->background(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setBackgroundColor(I)V

    iget-object p1, p0, Le/e/a/SearchSuggestions$CandidateAdapter;->context:Landroid/content/Context;

    const/16 p3, 0x10

    invoke-static {p1, p3}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result p1

    iget-object v0, p0, Le/e/a/SearchSuggestions$CandidateAdapter;->context:Landroid/content/Context;

    const/16 v1, 0xc

    invoke-static {v0, v1}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v0

    iget-object v2, p0, Le/e/a/SearchSuggestions$CandidateAdapter;->context:Landroid/content/Context;

    invoke-static {v2, p3}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result p3

    iget-object v2, p0, Le/e/a/SearchSuggestions$CandidateAdapter;->context:Landroid/content/Context;

    invoke-static {v2, v1}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {p2, p1, v0, p3, v1}, Landroid/widget/TextView;->setPadding(IIII)V

    return-object p2
.end method

.method set(Ljava/util/List;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 14
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Le/e/a/SearchSuggestions$CandidateAdapter;->values:Ljava/util/List;

    invoke-virtual {p0}, Le/e/a/SearchSuggestions$CandidateAdapter;->notifyDataSetChanged()V

    return-void
.end method
