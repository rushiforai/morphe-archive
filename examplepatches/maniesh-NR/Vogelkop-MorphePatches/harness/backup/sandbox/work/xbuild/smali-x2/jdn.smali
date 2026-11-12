.class public final Ljdn;
.super Lf73;
.source "SourceFile"


# instance fields
.field public final h:Lhdn;

.field public i:Lfdn;

.field public j:Lac1;


# direct methods
.method public constructor <init>(Landroid/view/View;Ltah;Lhdn;)V
    .registers 4

    invoke-static {p1}, Lowc;->a(Landroid/view/View;)Lowc;

    move-result-object p1

    invoke-direct {p0, p1, p2}, Lf73;-><init>(Lowc;Ltah;)V

    iput-object p3, p0, Ljdn;->h:Lhdn;

    return-void
.end method


# virtual methods
.method public final V(Lja2;Z)V
    .registers 9

    if-eqz p2, :cond_3

    return-void

    :cond_3
    check-cast p1, Ljxc;

    iget-object p1, p1, Ljxc;->c:Lfdn;

    iget-object p2, p1, Lfdn;->c:Ljava/lang/String;

    iget-object v0, p1, Lfdn;->f:Lfdn;

    iput-object p1, p0, Ljdn;->i:Lfdn;

    if-nez v0, :cond_15

    new-instance p1, Lac1;

    invoke-direct {p1, p2}, Lac1;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_4f

    :cond_15
    new-instance p1, Lac1;

    iget-object v1, v0, Lfdn;->c:Ljava/lang/String;

    invoke-direct {p1, v1}, Lac1;-><init>(Ljava/lang/CharSequence;)V

    iput-object p2, p1, Lac1;->d:Ljava/lang/Object;

    iget-object p2, v0, Lfdn;->g:Ljava/util/ArrayList;

    invoke-static {p2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p2

    const/4 v1, 0x1

    if-le p2, v1, :cond_4f

    iget-object p2, p0, Lf73;->e:Ltah;

    iget-object p2, p2, Ltah;->d:Ljava/lang/Object;

    check-cast p2, Lydn;

    iget-object p2, p2, Lydn;->c:Lgfn;

    invoke-interface {p2}, Lgfn;->isEnabled()Z

    move-result p2

    if-eqz p2, :cond_3d

    const p2, 0x7f0407da

    goto :goto_40

    :cond_3d
    const p2, 0x7f0402d7

    :goto_40
    new-instance v1, Lobn;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v0, v2}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const v0, 0x7f08051f

    iput v0, p1, Lac1;->a:I

    iput p2, p1, Lac1;->b:I

    iput-object v1, p1, Lac1;->e:Ljava/lang/Object;

    :cond_4f
    :goto_4f
    new-instance v0, Lac1;

    iget-object p2, p1, Lac1;->c:Ljava/lang/Object;

    move-object v1, p2

    check-cast v1, Ljava/lang/CharSequence;

    iget-object p2, p1, Lac1;->d:Ljava/lang/Object;

    move-object v2, p2

    check-cast v2, Ljava/lang/CharSequence;

    iget v3, p1, Lac1;->a:I

    iget v4, p1, Lac1;->b:I

    iget-object p1, p1, Lac1;->e:Ljava/lang/Object;

    move-object v5, p1

    check-cast v5, Lobn;

    invoke-direct/range {v0 .. v5}, Lac1;-><init>(Ljava/lang/CharSequence;Ljava/lang/CharSequence;IILandroid/view/View$OnClickListener;)V

    iput-object v0, p0, Ljdn;->j:Lac1;

    return-void
.end method

.method public final b0()Lac1;
    .registers 1

    iget-object p0, p0, Ljdn;->j:Lac1;

    return-object p0
.end method

.method public final c0()Lfdn;
    .registers 1

    iget-object p0, p0, Ljdn;->i:Lfdn;

    return-object p0
.end method
