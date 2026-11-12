.class public final Lbde;
.super Ly08;
.source "SourceFile"

# interfaces
.implements Lj6l;


# instance fields
.field public a:I

.field public b:I

.field public c:I


# virtual methods
.method public final L(Lb2l;Z)V
    .registers 3

    iget p1, p0, Lbde;->b:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lbde;->b:I

    return-void
.end method

.method public final T(Lb2l;Lcom/opera/android/browser/TabInfo;)V
    .registers 3

    check-cast p1, Ld7l;

    iget-object p1, p1, Ld7l;->j:Le7l;

    invoke-interface {p1}, Lb9l;->a()Lcom/opera/android/browser/TabInfo;

    move-result-object p1

    iget p1, p1, Lcom/opera/android/browser/TabInfo;->d:I

    iget p2, p2, Lcom/opera/android/browser/TabInfo;->d:I

    if-eq p1, p2, :cond_14

    iget p1, p0, Lbde;->c:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lbde;->c:I

    :cond_14
    return-void
.end method

.method public final o(Lb2l;IZ)V
    .registers 4

    iget p1, p0, Lbde;->a:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lbde;->a:I

    return-void
.end method
