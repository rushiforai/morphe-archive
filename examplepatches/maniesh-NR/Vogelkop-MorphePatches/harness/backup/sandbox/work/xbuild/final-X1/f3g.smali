.class public final Lf3g;
.super Lfmj;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final f:Lnv6;

.field public final g:Lwpk;

.field public h:Le3g;


# direct methods
.method public constructor <init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;Lnv6;Lwpk;)V
    .registers 5

    invoke-direct {p0, p1, p2}, Lfmj;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;)V

    iput-object p3, p0, Lf3g;->f:Lnv6;

    iput-object p4, p0, Lf3g;->g:Lwpk;

    invoke-virtual {p1, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public final U(Lgqk;Ljava/lang/String;)V
    .registers 7

    check-cast p1, Lfqk;

    iput-object p1, p0, Lfmj;->d:Lfqk;

    iget-object p2, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object v0, p0, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    iput-object p2, v0, Lcom/opera/android/suggestion/adapter/SuggestionListItem;->D:Lcom/opera/android/suggestion/Suggestion;

    const/4 v1, 0x0

    if-eqz p2, :cond_17

    iget-object v2, p2, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    if-eqz v2, :cond_17

    new-instance v3, Lqxh;

    invoke-direct {v3, v2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_18

    :cond_17
    move-object v3, v1

    :goto_18
    invoke-virtual {v0, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    if-eqz p2, :cond_27

    invoke-virtual {p2}, Lcom/opera/android/suggestion/Suggestion;->a()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Lqxh;

    invoke-direct {v2, v1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    move-object v1, v2

    :cond_27
    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lnr8;->e(Landroid/content/Context;)I

    move-result v1

    new-instance v2, Le3g;

    const/4 v3, 0x0

    invoke-direct {v2, p0, p1, v3}, Le3g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v0, p2, Lcom/opera/android/suggestion/Suggestion;->h:Ljava/lang/String;

    invoke-static {p1, v1, v0}, Lqbe;->G(Landroid/content/Context;ILjava/lang/String;)Ldwh;

    move-result-object p1

    iget p2, p2, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v0, 0x11

    if-ne p2, v0, :cond_4e

    const/4 p2, 0x3

    new-array v0, v3, [I

    invoke-virtual {p1, p2, v0}, Ldwh;->i(I[I)V

    :cond_4e
    invoke-virtual {p1, v2}, Ldwh;->f(Lacl;)V

    iput-object v2, p0, Lf3g;->h:Le3g;

    return-void
.end method

.method public final Y()V
    .registers 3

    iget-object v0, p0, Lf3g;->h:Le3g;

    if-eqz v0, :cond_c

    sget-object v1, Lyne;->b:Ldeg;

    invoke-virtual {v1, v0}, Ldeg;->a(Ljava/lang/Object;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lf3g;->h:Le3g;

    :cond_c
    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object p1, p0, Lfmj;->d:Lfqk;

    if-eqz p1, :cond_11

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object v0, p0, Lf3g;->f:Lnv6;

    invoke-virtual {v0, p1}, Lnv6;->C(Lcom/opera/android/suggestion/Suggestion;)V

    iget-object p0, p0, Lfmj;->c:Lhqk;

    const/4 v0, 0x1

    invoke-virtual {p0, p1, v0}, Lhqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    :cond_11
    return-void
.end method
