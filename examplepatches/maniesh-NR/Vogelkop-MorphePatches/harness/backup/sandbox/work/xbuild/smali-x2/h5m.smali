.class public final Lh5m;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final a:Lv3m;

.field public final b:Lghf;

.field public final c:Lcbl;

.field public final d:Lo4m;

.field public final e:Lf5m;

.field public f:Lvz5;

.field public g:Lj5m;

.field public final h:Lkze;


# direct methods
.method public constructor <init>(Lv3m;Lghf;Lcbl;Lo4m;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lf5m;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lf5m;-><init>(Lh5m;B)V

    iput-object v0, p0, Lh5m;->e:Lf5m;

    new-instance v0, Lkze;

    new-instance v1, Lb5m;

    const/4 v2, 0x2

    invoke-direct {v1, v2}, Lb5m;-><init>(I)V

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lh5m;->h:Lkze;

    iput-object p1, p0, Lh5m;->a:Lv3m;

    iput-object p2, p0, Lh5m;->b:Lghf;

    iput-object p3, p0, Lh5m;->c:Lcbl;

    iput-object p4, p0, Lh5m;->d:Lo4m;

    new-instance p1, Lf5m;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lf5m;-><init>(Lh5m;B)V

    invoke-virtual {v0, p1}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Lh5m;->h:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ld5m;

    invoke-virtual {v1}, Ld5m;->a()Z

    move-result v1

    if-eqz v1, :cond_f

    return-void

    :cond_f
    iget-object v1, p0, Lh5m;->f:Lvz5;

    if-eqz v1, :cond_1b

    iget-object p0, p0, Lh5m;->g:Lj5m;

    if-eqz p0, :cond_1b

    invoke-virtual {p0}, Lj5m;->c()V

    return-void

    :cond_1b
    new-instance p0, Lb5m;

    const/4 v1, 0x2

    invoke-direct {p0, v1}, Lb5m;-><init>(I)V

    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final b(Lvz5;)V
    .registers 4

    iget-object v0, p0, Lh5m;->f:Lvz5;

    iget-object v1, p0, Lh5m;->e:Lf5m;

    if-eqz v0, :cond_d

    iget-object v0, v0, Lvz5;->f:Ljava/lang/Object;

    check-cast v0, Lkze;

    invoke-virtual {v0, v1}, Lekc;->p(Lf7f;)V

    :cond_d
    iput-object p1, p0, Lh5m;->f:Lvz5;

    if-nez p1, :cond_21

    iget-object p1, p0, Lh5m;->g:Lj5m;

    if-eqz p1, :cond_1a

    iget-object p1, p1, Lj5m;->d:Lkze;

    invoke-virtual {p1, p0}, Lekc;->p(Lf7f;)V

    :cond_1a
    const/4 p1, 0x0

    iput-object p1, p0, Lh5m;->g:Lj5m;

    invoke-virtual {p0}, Lh5m;->a()V

    return-void

    :cond_21
    iget-object p0, p1, Lvz5;->f:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0, v1}, Lekc;->k(Lf7f;)V

    return-void
.end method

.method public final c(Ljava/lang/String;Ljava/lang/String;)V
    .registers 13

    iget-object v0, p0, Lh5m;->a:Lv3m;

    iget-object v0, v0, Lv3m;->a:Landroid/content/Context;

    invoke-static {v0}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual {p0}, Lh5m;->a()V

    return-void

    :cond_e
    iget-object v0, p0, Lh5m;->h:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld5m;

    invoke-virtual {v0}, Ld5m;->b()Z

    move-result v0

    if-nez v0, :cond_79

    if-eqz p1, :cond_5e

    if-eqz p2, :cond_5e

    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_79

    iget-object v2, p0, Lh5m;->f:Lvz5;

    if-eqz v2, :cond_79

    iget-object p0, v2, Lvz5;->f:Ljava/lang/Object;

    check-cast p0, Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj5m;

    iget-object v1, v0, Lj5m;->j:Ljava/lang/Runnable;

    if-eqz v1, :cond_3e

    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    const/4 v1, 0x0

    iput-object v1, v0, Lj5m;->j:Ljava/lang/Runnable;

    :cond_3e
    new-instance v1, Lj5m;

    iget v3, v2, Lvz5;->a:I

    add-int/lit8 v0, v3, 0x1

    iput v0, v2, Lvz5;->a:I

    iget-object v0, v2, Lvz5;->e:Ljava/lang/Object;

    move-object v6, v0

    check-cast v6, Loji;

    const/4 v7, 0x3

    const-wide/16 v8, 0x2710

    move-object v4, p1

    move-object v5, p2

    invoke-direct/range {v1 .. v9}, Lj5m;-><init>(Lvz5;ILjava/lang/String;Ljava/lang/String;Loji;IJ)V

    invoke-virtual {p0, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget p0, v1, Lj5m;->a:I

    iput p0, v2, Lvz5;->b:I

    invoke-virtual {v2}, Lvz5;->b()V

    return-void

    :cond_5e
    new-instance p1, Lg5m;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lg5m;-><init>(Lh5m;B)V

    iget-object p0, p0, Lh5m;->b:Lghf;

    iget-object p2, p0, Lghf;->d:Ljava/lang/Object;

    check-cast p2, Landroid/content/res/Resources;

    const v0, 0x7f1404e3

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p2

    iget-object v0, p0, Lghf;->b:Ljava/lang/Object;

    check-cast v0, Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-nez v0, :cond_7a

    :cond_79
    return-void

    :cond_7a
    new-instance v1, Lc4m;

    const v2, 0x7f140ebc

    invoke-direct {v1, p0, p2, v2, p1}, Lc4m;-><init>(Lghf;Ljava/lang/String;ILandroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lghf;->c:Ljava/lang/Object;

    check-cast p0, Laal;

    const/4 p1, 0x1

    invoke-virtual {p0, v1, v0, p1}, Laal;->S(Lo93;Lb2l;Z)V

    return-void
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 3

    check-cast p1, Ld5m;

    iget-object v0, p0, Lh5m;->g:Lj5m;

    iget-object p0, p0, Lh5m;->h:Lkze;

    if-nez v0, :cond_12

    new-instance p1, La5m;

    const/4 v0, 0x7

    invoke-direct {p1, v0}, La5m;-><init>(I)V

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :cond_12
    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ld5m;

    invoke-virtual {p1, v0}, Ld5m;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    invoke-virtual {p0, p1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_21
    return-void
.end method
