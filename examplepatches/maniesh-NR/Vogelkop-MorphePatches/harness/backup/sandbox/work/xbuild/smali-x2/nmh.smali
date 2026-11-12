.class public final Lnmh;
.super Lfmj;
.source "SourceFile"


# instance fields
.field public final f:Lnv6;

.field public final g:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;Lnv6;I)V
    .registers 5

    invoke-direct {p0, p1, p2}, Lfmj;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;)V

    iput-object p3, p0, Lnmh;->f:Lnv6;

    iput-boolean p4, p0, Lnmh;->g:Z

    new-instance p2, Lmmh;

    const/4 p3, 0x0

    invoke-direct {p2, p0, p3}, Lmmh;-><init>(Lnmh;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lmmh;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lmmh;-><init>(Lnmh;B)V

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

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    invoke-static {p1}, Lybh;->g(Lcom/opera/android/suggestion/Suggestion;)I

    move-result p2

    new-instance v1, Llxh;

    invoke-direct {v1, p2}, Llxh;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    iget-boolean p2, p0, Lnmh;->g:Z

    invoke-virtual {p0, p2, p1}, Lfmj;->Z(ILcom/opera/android/suggestion/Suggestion;)V

    return-void
.end method
