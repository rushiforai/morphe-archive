.class public final Ldsi;
.super Lfmj;
.source "SourceFile"


# instance fields
.field public final f:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;I)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lfmj;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;)V

    iput-boolean p3, p0, Ldsi;->f:Z

    new-instance p2, Lcsi;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lcsi;-><init>(Ldsi;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lcsi;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lcsi;-><init>(Ldsi;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final U(Lgqk;Ljava/lang/String;)V
    .registers 5

    check-cast p1, Lfqk;

    iput-object p1, p0, Lfmj;->d:Lfqk;

    iget-object p2, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object v0, p0, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    iput-object p2, v0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    iget-object p2, p2, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    new-instance v1, Lqxh;

    invoke-direct {v1, p2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-boolean p2, p0, Ldsi;->f:Z

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-virtual {p0, p2, p1}, Lfmj;->Z(ILcom/opera/android/suggestion/Suggestion;)V

    return-void
.end method
