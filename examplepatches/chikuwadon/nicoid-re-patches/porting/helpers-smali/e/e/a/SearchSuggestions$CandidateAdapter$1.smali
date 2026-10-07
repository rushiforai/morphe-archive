.class Le/e/a/SearchSuggestions$CandidateAdapter$1;
.super Landroid/widget/Filter;
.source "SearchSuggestions.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/SearchSuggestions$CandidateAdapter;->getFilter()Landroid/widget/Filter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/SearchSuggestions$CandidateAdapter;


# direct methods
.method constructor <init>(Le/e/a/SearchSuggestions$CandidateAdapter;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            null
        }
    .end annotation

    .line 16
    iput-object p1, p0, Le/e/a/SearchSuggestions$CandidateAdapter$1;->this$0:Le/e/a/SearchSuggestions$CandidateAdapter;

    invoke-direct {p0}, Landroid/widget/Filter;-><init>()V

    return-void
.end method


# virtual methods
.method protected performFiltering(Ljava/lang/CharSequence;)Landroid/widget/Filter$FilterResults;
    .registers 3

    .line 16
    new-instance p1, Landroid/widget/Filter$FilterResults;

    invoke-direct {p1}, Landroid/widget/Filter$FilterResults;-><init>()V

    iget-object v0, p0, Le/e/a/SearchSuggestions$CandidateAdapter$1;->this$0:Le/e/a/SearchSuggestions$CandidateAdapter;

    iget-object v0, v0, Le/e/a/SearchSuggestions$CandidateAdapter;->values:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iput v0, p1, Landroid/widget/Filter$FilterResults;->count:I

    return-object p1
.end method

.method protected publishResults(Ljava/lang/CharSequence;Landroid/widget/Filter$FilterResults;)V
    .registers 3

    .line 16
    iget-object p1, p0, Le/e/a/SearchSuggestions$CandidateAdapter$1;->this$0:Le/e/a/SearchSuggestions$CandidateAdapter;

    invoke-virtual {p1}, Le/e/a/SearchSuggestions$CandidateAdapter;->notifyDataSetChanged()V

    return-void
.end method
