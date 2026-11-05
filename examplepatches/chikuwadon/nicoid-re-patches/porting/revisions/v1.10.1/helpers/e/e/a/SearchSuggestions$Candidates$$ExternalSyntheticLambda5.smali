.class public final synthetic Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Le/e/a/SearchSuggestions$Candidates;

.field public final synthetic f$1:Le/e/a/NetworkTask;

.field public final synthetic f$2:I

.field public final synthetic f$3:Ljava/lang/String;

.field public final synthetic f$4:Ljava/util/List;


# direct methods
.method public synthetic constructor <init>(Le/e/a/SearchSuggestions$Candidates;Le/e/a/NetworkTask;ILjava/lang/String;Ljava/util/List;)V
    .registers 6

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda5;->f$0:Le/e/a/SearchSuggestions$Candidates;

    iput-object p2, p0, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda5;->f$1:Le/e/a/NetworkTask;

    iput p3, p0, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda5;->f$2:I

    iput-object p4, p0, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda5;->f$3:Ljava/lang/String;

    iput-object p5, p0, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda5;->f$4:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    .line 0
    iget-object v0, p0, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda5;->f$0:Le/e/a/SearchSuggestions$Candidates;

    iget-object v1, p0, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda5;->f$1:Le/e/a/NetworkTask;

    iget v2, p0, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda5;->f$2:I

    iget-object v3, p0, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda5;->f$3:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda5;->f$4:Ljava/util/List;

    invoke-virtual {v0, v1, v2, v3, v4}, Le/e/a/SearchSuggestions$Candidates;->lambda$2$e-e-a-SearchSuggestions$Candidates(Le/e/a/NetworkTask;ILjava/lang/String;Ljava/util/List;)V

    return-void
.end method
