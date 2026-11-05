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

.field task:Le/e/a/NetworkTask;

.field volatile version:I


# direct methods
.method constructor <init>(Landroid/widget/AutoCompleteTextView;)V
    .registers 5

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/SearchSuggestions$Candidates;->active:Z

    .line 95
    iput-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    new-instance v1, Le/e/a/SearchSuggestions$CandidateAdapter;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Le/e/a/SearchSuggestions$CandidateAdapter;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Le/e/a/SearchSuggestions$Candidates;->adapter:Le/e/a/SearchSuggestions$CandidateAdapter;

    iget-object v1, p0, Le/e/a/SearchSuggestions$Candidates;->adapter:Le/e/a/SearchSuggestions$CandidateAdapter;

    invoke-virtual {p1, v1}, Landroid/widget/AutoCompleteTextView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {p1, v0}, Landroid/widget/AutoCompleteTextView;->setThreshold(I)V

    .line 96
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Le/e/a/SearchSuggestions;->background(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0x8

    invoke-static {v1, v2}, Le/e/a/FeedbackFixes;->dp(Landroid/content/Context;I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    invoke-virtual {p1, v0}, Landroid/widget/AutoCompleteTextView;->setDropDownBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 97
    invoke-virtual {p1, p0}, Landroid/widget/AutoCompleteTextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    invoke-virtual {p1, p0}, Landroid/widget/AutoCompleteTextView;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 98
    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .registers 5

    .line 102
    iget v0, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    invoke-virtual {p0}, Le/e/a/SearchSuggestions$Candidates;->cancel()V

    .line 103
    iget-boolean v1, p0, Le/e/a/SearchSuggestions$Candidates;->active:Z

    if-eqz v1, :cond_44

    iget-object v1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v1}, Landroid/widget/AutoCompleteTextView;->isPerformingCompletion()Z

    move-result v1

    if-eqz v1, :cond_16

    goto :goto_44

    .line 104
    :cond_16
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    .line 105
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_33

    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->adapter:Le/e/a/SearchSuggestions$CandidateAdapter;

    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    invoke-virtual {p1, v0}, Le/e/a/SearchSuggestions$CandidateAdapter;->set(Ljava/util/List;)V

    return-void

    .line 106
    :cond_33
    new-instance v1, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda3;

    invoke-direct {v1, p0, v0, p1}, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda3;-><init>(Le/e/a/SearchSuggestions$Candidates;ILjava/lang/String;)V

    iput-object v1, p0, Le/e/a/SearchSuggestions$Candidates;->scheduled:Ljava/lang/Runnable;

    .line 115
    sget-object p1, Le/e/a/SearchSuggestions;->main:Landroid/os/Handler;

    iget-object v0, p0, Le/e/a/SearchSuggestions$Candidates;->scheduled:Ljava/lang/Runnable;

    const-wide/16 v1, 0x15e

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 116
    return-void

    .line 103
    :cond_44
    :goto_44
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 117
    return-void
.end method

.method cancel()V
    .registers 4

    .line 99
    iget-object v0, p0, Le/e/a/SearchSuggestions$Candidates;->scheduled:Ljava/lang/Runnable;

    const/4 v1, 0x0

    if-eqz v0, :cond_e

    sget-object v0, Le/e/a/SearchSuggestions;->main:Landroid/os/Handler;

    iget-object v2, p0, Le/e/a/SearchSuggestions$Candidates;->scheduled:Ljava/lang/Runnable;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iput-object v1, p0, Le/e/a/SearchSuggestions$Candidates;->scheduled:Ljava/lang/Runnable;

    :cond_e
    iget-object v0, p0, Le/e/a/SearchSuggestions$Candidates;->task:Le/e/a/NetworkTask;

    if-eqz v0, :cond_19

    iget-object v0, p0, Le/e/a/SearchSuggestions$Candidates;->task:Le/e/a/NetworkTask;

    invoke-virtual {v0}, Le/e/a/NetworkTask;->cancel()V

    iput-object v1, p0, Le/e/a/SearchSuggestions$Candidates;->task:Le/e/a/NetworkTask;

    :cond_19
    return-void
.end method

.method dispose()V
    .registers 3

    .line 100
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/SearchSuggestions$Candidates;->active:Z

    iget v0, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    invoke-virtual {p0}, Le/e/a/SearchSuggestions$Candidates;->cancel()V

    iget-object v0, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p0}, Landroid/widget/AutoCompleteTextView;->removeTextChangedListener(Landroid/text/TextWatcher;)V

    iget-object v0, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, p0}, Landroid/widget/AutoCompleteTextView;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    sget-object v0, Le/e/a/SearchSuggestions;->attached:Ljava/util/WeakHashMap;

    iget-object v1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_2f

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_2f

    sget-object v0, Le/e/a/SearchSuggestions;->attached:Ljava/util/WeakHashMap;

    iget-object v1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0, v1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2f
    iget-object v0, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {v0}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    return-void
.end method

.method synthetic lambda$0$e-e-a-SearchSuggestions$Candidates(ILjava/lang/String;)V
    .registers 6

    .line 107
    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/SearchSuggestions$Candidates;->scheduled:Ljava/lang/Runnable;

    iget-boolean v0, p0, Le/e/a/SearchSuggestions$Candidates;->active:Z

    if-eqz v0, :cond_1e

    iget v0, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    if-eq p1, v0, :cond_c

    goto :goto_1e

    .line 108
    :cond_c
    new-instance v0, Le/e/a/NetworkTask;

    invoke-direct {v0}, Le/e/a/NetworkTask;-><init>()V

    iput-object v0, p0, Le/e/a/SearchSuggestions$Candidates;->task:Le/e/a/NetworkTask;

    .line 109
    sget-object v1, Le/e/a/SearchSuggestions;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda4;

    invoke-direct {v2, p0, p2, v0, p1}, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda4;-><init>(Le/e/a/SearchSuggestions$Candidates;Ljava/lang/String;Le/e/a/NetworkTask;I)V

    invoke-virtual {v0, v1, v2}, Le/e/a/NetworkTask;->start(Ljava/util/concurrent/ExecutorService;Ljava/lang/Runnable;)V

    .line 114
    return-void

    .line 107
    :cond_1e
    :goto_1e
    return-void
.end method

.method synthetic lambda$1$e-e-a-SearchSuggestions$Candidates(Ljava/lang/String;Le/e/a/NetworkTask;I)V
    .registers 12

    .line 110
    invoke-static {p1, p2}, Le/e/a/SearchSuggestions;->request(Ljava/lang/String;Le/e/a/NetworkTask;)Ljava/util/List;

    move-result-object v5

    .line 111
    invoke-virtual {p2}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    .line 112
    :cond_b
    sget-object v6, Le/e/a/SearchSuggestions;->main:Landroid/os/Handler;

    new-instance v7, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda5;

    move-object v0, v7

    move-object v1, p0

    move-object v2, p2

    move v3, p3

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Le/e/a/SearchSuggestions$Candidates$$ExternalSyntheticLambda5;-><init>(Le/e/a/SearchSuggestions$Candidates;Le/e/a/NetworkTask;ILjava/lang/String;Ljava/util/List;)V

    invoke-virtual {v6, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 113
    return-void
.end method

.method synthetic lambda$2$e-e-a-SearchSuggestions$Candidates(Le/e/a/NetworkTask;ILjava/lang/String;Ljava/util/List;)V
    .registers 6

    .line 112
    iget-object v0, p0, Le/e/a/SearchSuggestions$Candidates;->task:Le/e/a/NetworkTask;

    if-ne v0, p1, :cond_7

    const/4 p1, 0x0

    iput-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->task:Le/e/a/NetworkTask;

    :cond_7
    iget-boolean p1, p0, Le/e/a/SearchSuggestions$Candidates;->active:Z

    if-eqz p1, :cond_41

    iget p1, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    if-ne p2, p1, :cond_41

    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->hasFocus()Z

    move-result p1

    if-eqz p1, :cond_41

    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->getText()Landroid/text/Editable;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_41

    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->adapter:Le/e/a/SearchSuggestions$CandidateAdapter;

    invoke-virtual {p1, p4}, Le/e/a/SearchSuggestions$CandidateAdapter;->set(Ljava/util/List;)V

    invoke-interface {p4}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3c

    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    goto :goto_41

    :cond_3c
    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->showDropDown()V

    :cond_41
    :goto_41
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .registers 5

    .line 117
    return-void
.end method

.method public onViewAttachedToWindow(Landroid/view/View;)V
    .registers 2

    .line 118
    const/4 p1, 0x1

    iput-boolean p1, p0, Le/e/a/SearchSuggestions$Candidates;->active:Z

    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .registers 2

    .line 119
    const/4 p1, 0x0

    iput-boolean p1, p0, Le/e/a/SearchSuggestions$Candidates;->active:Z

    iget p1, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Le/e/a/SearchSuggestions$Candidates;->version:I

    invoke-virtual {p0}, Le/e/a/SearchSuggestions$Candidates;->cancel()V

    iget-object p1, p0, Le/e/a/SearchSuggestions$Candidates;->input:Landroid/widget/AutoCompleteTextView;

    invoke-virtual {p1}, Landroid/widget/AutoCompleteTextView;->dismissDropDown()V

    return-void
.end method
