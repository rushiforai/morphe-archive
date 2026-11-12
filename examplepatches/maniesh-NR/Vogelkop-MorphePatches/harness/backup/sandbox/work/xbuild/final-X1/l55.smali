.class public final Ll55;
.super Lfmj;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field public static final synthetic i:I


# instance fields
.field public final f:Z

.field public g:Z

.field public final h:Lyk4;


# direct methods
.method public constructor <init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;I)V
    .registers 5

    invoke-direct {p0, p1, p2}, Lfmj;-><init>(Lcom/opera/android/suggestion/adapter/SuggestionListItem;Lhqk;)V

    const/4 p2, 0x4

    if-eq p3, p2, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    iput-boolean v0, p0, Ll55;->f:Z

    new-instance v0, Lyk4;

    invoke-direct {v0, p0, p2}, Lyk4;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ll55;->h:Lyk4;

    invoke-virtual {p1, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eq p3, p2, :cond_22

    const/4 p2, 0x5

    if-eq p3, p2, :cond_1e

    const p2, 0x7f080533

    goto :goto_25

    :cond_1e
    const p2, 0x7f08057b

    goto :goto_25

    :cond_22
    const p2, 0x7f0805ae

    :goto_25
    new-instance p3, Llxh;

    invoke-direct {p3, p2}, Llxh;-><init>(I)V

    invoke-virtual {p1, p3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    new-instance p2, Lu7;

    const/16 p3, 0x1c

    invoke-direct {p2, p0, p3}, Lu7;-><init>(Ljava/lang/Object;B)V

    sget-object p0, Lq9n;->c:Ll5b;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object p0

    if-nez p0, :cond_41

    return-void

    :cond_41
    invoke-static {p0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void
.end method


# virtual methods
.method public final U(Lgqk;Ljava/lang/String;)V
    .registers 4

    check-cast p1, Lfqk;

    iput-object p1, p0, Lfmj;->d:Lfqk;

    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object p1, p1, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    new-instance p2, Lqxh;

    invoke-direct {p2, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget-object p2, p0, Lfmj;->d:Lfqk;

    if-eqz p2, :cond_3b

    iget-object p2, p2, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object p2, p2, Lcom/opera/android/suggestion/Suggestion;->d:Ljava/lang/String;

    if-nez p2, :cond_3b

    new-instance p2, Lplf;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->y(Luup;)V

    iget-object p2, p0, Ll55;->h:Lyk4;

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->w(Landroid/view/View$OnClickListener;)V

    new-instance p2, Ldxh;

    const v0, 0x7f04052c

    invoke-direct {p2, v0}, Ldxh;-><init>(I)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->x(Lcxh;)V

    const/4 p1, 0x0

    iput-boolean p1, p0, Ll55;->g:Z

    invoke-virtual {p0}, Ll55;->a0()V

    return-void

    :cond_3b
    sget-object p0, Lrlf;->h:Lrlf;

    invoke-virtual {p1, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->y(Luup;)V

    return-void
.end method

.method public final a0()V
    .registers 5

    iget-object v0, p0, Lfmj;->d:Lfqk;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, v0, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-object v1, p0, Lfmj;->b:Lcom/opera/android/suggestion/adapter/SuggestionListItem;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-boolean p0, p0, Ll55;->g:Z

    if-eqz p0, :cond_3a

    new-instance p0, Llxh;

    const v3, 0x7f080624

    invoke-direct {p0, v3}, Llxh;-><init>(I)V

    invoke-virtual {v1, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->v(Lb8h;)V

    const p0, 0x7f140445

    invoke-virtual {v2, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance v2, Lqxh;

    invoke-direct {v2, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iput-object v2, v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z:Lpxh;

    invoke-virtual {v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u()V

    invoke-virtual {v0}, Lcom/opera/android/suggestion/Suggestion;->b()Ljava/lang/String;

    move-result-object p0

    new-instance v0, Lqxh;

    invoke-direct {v0, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    return-void

    :cond_3a
    new-instance p0, Llxh;

    const v3, 0x7f080625

    invoke-direct {p0, v3}, Llxh;-><init>(I)V

    invoke-virtual {v1, p0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->v(Lb8h;)V

    const p0, 0x7f140447

    invoke-virtual {v2, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance v2, Lqxh;

    invoke-direct {v2, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    iput-object v2, v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z:Lpxh;

    invoke-virtual {v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u()V

    iget-object p0, v0, Lcom/opera/android/suggestion/Suggestion;->b:Ljava/lang/String;

    new-instance v0, Lqxh;

    invoke-direct {v0, p0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 3

    iget-object p1, p0, Lfmj;->d:Lfqk;

    if-nez p1, :cond_5

    return-void

    :cond_5
    iget-object p1, p1, Lfqk;->c:Lcom/opera/android/suggestion/Suggestion;

    iget-boolean v0, p0, Ll55;->f:Z

    iget-object p0, p0, Lfmj;->c:Lhqk;

    invoke-virtual {p0, p1, v0}, Lhqk;->q(Lcom/opera/android/suggestion/Suggestion;Z)V

    return-void
.end method
