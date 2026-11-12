.class public abstract Lfmj;
.super Lpa3;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

.field public final c:Lhqk;

.field public d:Lfqk;

.field public final e:I


# direct methods
.method public constructor <init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;)V
    .registers 4

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    iput-object p2, p0, Lfmj;->c:Lhqk;

    new-instance p2, Ljxh;

    const v0, 0x7f070982

    invoke-direct {p2, v0}, Ljxh;-><init>(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p2, p1}, Ly7h;->k(Landroid/content/Context;)I

    move-result p1

    iput p1, p0, Lfmj;->e:I

    return-void
.end method


# virtual methods
.method public final Z(ILcom/opera/android/suggestion/Suggestion;)V
    .registers 4

    iget p2, p2, Lcom/opera/android/suggestion/Suggestion;->a:I

    const/16 v0, 0x17

    if-ne p2, v0, :cond_d

    const p1, 0x7f080609

    const p2, 0x7f1411d6

    goto :goto_1e

    :cond_d
    if-eqz p1, :cond_18

    const/4 p2, 0x1

    if-eq p1, p2, :cond_14

    const/4 p1, 0x0

    goto :goto_1b

    :cond_14
    const p1, 0x7f080501

    goto :goto_1b

    :cond_18
    const p1, 0x7f080500

    :goto_1b
    const p2, 0x7f140f40

    :goto_1e
    new-instance v0, Lplf;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iget-object p0, p0, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->y(Luup;)V

    new-instance v0, Llxh;

    invoke-direct {v0, p1}, Llxh;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->v(Lb8h;)V

    new-instance p1, Lrxh;

    invoke-direct {p1, p2}, Lrxh;-><init>(I)V

    iput-object p1, p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z:Lpxh;

    invoke-virtual {p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u()V

    return-void
.end method
