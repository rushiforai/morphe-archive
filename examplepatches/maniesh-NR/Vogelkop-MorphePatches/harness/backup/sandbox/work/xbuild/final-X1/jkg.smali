.class public final Ljkg;
.super Lyrf;
.source "SourceFile"


# instance fields
.field public final f:Likg;

.field public final g:Lcom/opera/api/Callback;

.field public final h:[Likg;


# direct methods
.method public constructor <init>(Lmej;I[Likg;Likg;Lcom/opera/api/Callback;)V
    .registers 7

    if-nez p2, :cond_4

    const/4 p2, 0x0

    goto :goto_c

    :cond_4
    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    :goto_c
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lyrf;-><init>(Lmej;Ljava/lang/String;Z)V

    iput-object p4, p0, Ljkg;->f:Likg;

    iput-object p5, p0, Ljkg;->g:Lcom/opera/api/Callback;

    iput-object p3, p0, Ljkg;->h:[Likg;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 6

    invoke-super {p0, p1}, Lyrf;->a(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Ljkg;->h:[Likg;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v1, :cond_12

    aget-object v3, v0, v2

    invoke-virtual {p0, v3}, Lyrf;->d(Llrf;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_12
    return-object p1
.end method

.method public final e(Llrf;)Z
    .registers 2

    iget-object p0, p0, Ljkg;->f:Likg;

    if-ne p1, p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final f(Llrf;)V
    .registers 2

    iget-object p0, p0, Ljkg;->g:Lcom/opera/api/Callback;

    check-cast p1, Likg;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void
.end method
