.class public final Lxwk;
.super Lyrf;
.source "SourceFile"


# instance fields
.field public final f:I

.field public final g:Z

.field public final h:Lvwk;

.field public final i:Lvwk;


# direct methods
.method public constructor <init>(Lmej;Z)V
    .registers 8

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f1411f6

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    invoke-direct {p0, p1, v0, v1}, Lyrf;-><init>(Lmej;Ljava/lang/String;Z)V

    new-instance p1, Lvwk;

    const v0, 0x7f1411f3

    const v2, 0x7f1411f2

    const/4 v3, 0x0

    const v4, 0x7f080620

    invoke-direct {p1, v3, v4, v0, v2}, Lvwk;-><init>(IIII)V

    iput-object p1, p0, Lxwk;->h:Lvwk;

    new-instance p1, Lvwk;

    const v0, 0x7f1411f5

    const v2, 0x7f1411f4

    const v3, 0x7f0805a8

    invoke-direct {p1, v1, v3, v0, v2}, Lvwk;-><init>(IIII)V

    iput-object p1, p0, Lxwk;->i:Lvwk;

    iput p2, p0, Lxwk;->f:I

    iput-boolean p2, p0, Lxwk;->g:Z

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 5

    invoke-super {p0, p1}, Lyrf;->a(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    iget-boolean v0, p0, Lxwk;->g:Z

    iget-object v1, p0, Lxwk;->h:Lvwk;

    if-eqz v0, :cond_11

    iget-object v0, p0, Lyrf;->e:Ltn;

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ltn;->t(Llrf;Z)V

    goto :goto_14

    :cond_11
    invoke-virtual {p0, v1}, Lyrf;->d(Llrf;)V

    :goto_14
    iget-object v0, p0, Lxwk;->i:Lvwk;

    invoke-virtual {p0, v0}, Lyrf;->d(Llrf;)V

    return-object p1
.end method

.method public final e(Llrf;)Z
    .registers 2

    invoke-interface {p1}, Llrf;->getValue()I

    move-result p1

    iget p0, p0, Lxwk;->f:I

    if-ne p1, p0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    const/4 p0, 0x0

    return p0
.end method

.method public final f(Llrf;)V
    .registers 3

    iget-object v0, p0, Lxwk;->i:Lvwk;

    if-ne p1, v0, :cond_18

    new-instance p1, La06;

    invoke-direct {p1}, La06;-><init>()V

    const/16 v0, 0x1003

    invoke-static {p1, v0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    :cond_18
    return-void
.end method
