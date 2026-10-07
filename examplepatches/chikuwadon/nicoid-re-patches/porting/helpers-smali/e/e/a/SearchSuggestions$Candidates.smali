.class Le/e/a/SearchSuggestions$Candidates;
.super Ljava/lang/Object;
.source "SearchSuggestions.java"

# interfaces
.implements Landroid/text/TextWatcher;
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/SearchSuggestions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "Candidates"
.end annotation


# instance fields
.field volatile active:Z

.field final adapter:Le/e/a/SearchSuggestions$CandidateAdapter;

.field final input:Landroid/widget/AutoCompleteTextView;

.field scheduled:Ljava/lang/Runnable;

.field volatile version:I


# direct methods
.method constructor <init>(Landroid/widget/AutoCompleteTextView;)V
    .registers 5

    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/SearchSuggestions$Candidates;->active:Z

    .line 8
    iput-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Le/e/a/SearchSuggestions$CandidateAdapter;

    invoke-direct {v2, v1}, Le/e/a/SearchSuggestions$CandidateAdapter;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Le/e/a/SearchSuggestions$Candidates;->adapter:Le/e/a/SearchSuggestions$CandidateAdapter;

    iget-object v2, p0, Le/e/a/SearchSuggestions$Candidates;->adapter:Le/e/a/SearchSuggestions$CandidateAdapter;

    invoke-virtual {p1, v2}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {p1, v0}, Landroid/widget/AutoCompleteTextView;->setThreshold(I)V

    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-static {v1}, Le/e/a/SearchSuggestions;->background(Landroid/content/Context;)I

    move-result v2

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    const/16 v2, 0x8

    invoke-static {v1, v2}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {p1, v0}, Landroid/widget/AutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p1, p0}, Landroid/widget/AutoCompleteTextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {p1, p0}, Landroid/widget/AutoCompleteTextView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 5

    .line 9
    iget v0, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    iget-object v1, p0, Le/e/a/SearchSuggestions$Candidates;->scheduled:Ljava/lang/Runnable;

    if-eqz v1, :cond_11

    sget-object v1, Le/e/a/SearchSuggestions;->main:Landroid/os/Handler;

    iget-object v2, p0, Le/e/a/SearchSuggestions$Candidates;->scheduled:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_11
    iget-object v1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->isPerformingCompletion()Z

    move-result v1

    if-eqz v1, :cond_1a

    return-void

    :cond_1a
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_37

    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->adapter:Le/e/a/SearchSuggestions$CandidateAdapter;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Le/e/a/SearchSuggestions$CandidateAdapter;->set(Ljava/util/List;)V

    return-void

    :cond_37
    new-instance v1, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, v0, p1}, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda1;-><init>(Le/e/a/SearchSuggestions$Candidates;ILjava/lang/String;)V

    iput-object v1, p0, Le/e/a/SearchSuggestions$Candidates;->scheduled:Ljava/lang/Runnable;

    sget-object p1, Le/e/a/SearchSuggestions;->main:Landroid/os/Handler;

    iget-object v0, p0, Le/e/a/SearchSuggestions$Candidates;->scheduled:Ljava/lang/Runnable;

    const-wide/16 v1, 0x15e

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 9
    return-void
.end method

.method synthetic lambda$afterTextChanged$0$e-e-a-SearchSuggestions$Candidates(ILjava/lang/String;Ljava/util/List;)V
    .registers 5

    .line 9
    iget-boolean v0, p0, Le/e/a/SearchSuggestions$Candidates;->active:Z

    if-eqz v0, :cond_3b

    iget v0, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    if-ne p1, v0, :cond_3b

    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->hasFocus()Z

    move-result p1

    if-eqz p1, :cond_3b

    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_25

    goto :goto_3b

    :cond_25
    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->adapter:Le/e/a/SearchSuggestions$CandidateAdapter;

    invoke-virtual {p1, p3}, Le/e/a/SearchSuggestions$CandidateAdapter;->set(Ljava/util/List;)V

    invoke-interface {p3}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_36

    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->showDropDown()V

    goto :goto_3b

    :cond_36
    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    :cond_3b
    :goto_3b
    return-void
.end method

.method synthetic lambda$afterTextChanged$1$e-e-a-SearchSuggestions$Candidates(ILjava/lang/String;)V
    .registers 6

    .line 9
    iget v0, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    if-ne p1, v0, :cond_17

    iget-boolean v0, p0, Le/e/a/SearchSuggestions$Candidates;->active:Z

    if-nez v0, :cond_9

    goto :goto_17

    :cond_9
    invoke-static {p2}, Le/e/a/SearchSuggestions;->request(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    sget-object v1, Le/e/a/SearchSuggestions;->main:Landroid/os/Handler;

    new-instance v2, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda2;

    invoke-direct {v2, p0, p1, p2, v0}, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda2;-><init>(Le/e/a/SearchSuggestions$Candidates;ILjava/lang/String;Ljava/util/List;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_17
    :goto_17
    return-void
.end method

.method synthetic lambda$afterTextChanged$2$e-e-a-SearchSuggestions$Candidates(ILjava/lang/String;)V
    .registers 5

    .line 9
    sget-object v0, Le/e/a/SearchSuggestions;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda0;-><init>(Le/e/a/SearchSuggestions$Candidates;ILjava/lang/String;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 9
    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 10
    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/SearchSuggestions$Candidates;->active:Z

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 3

    .line 10
    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/SearchSuggestions$Candidates;->active:Z

    iget p1, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->scheduled:Ljava/lang/Runnable;

    if-eqz p1, :cond_14

    sget-object p1, Le/e/a/SearchSuggestions;->main:Landroid/os/Handler;

    iget-object v0, p0, Le/e/a/SearchSuggestions$Candidates;->scheduled:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_14
    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    return-void
.end method
