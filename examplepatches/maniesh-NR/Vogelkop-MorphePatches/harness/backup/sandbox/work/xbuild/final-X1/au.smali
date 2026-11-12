.class public final Lau;
.super Leu;
.source "SourceFile"


# instance fields
.field public final c:Let;

.field public final d:Lbs;

.field public e:Lis;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Ltta;Lbs;)V
    .registers 6

    new-instance v0, Let;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    sget-object v1, Lvr8;->l:Lvr8;

    invoke-direct {v0, p1, p2, v1}, Lfr8;-><init>(Landroid/content/Context;Ltta;Lvr8;)V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const p2, 0x7f0402d4

    const v1, 0x7f06063b

    invoke-static {p2, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    iput p1, v0, Let;->A:I

    invoke-direct {p0, v0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    iput-object v0, p0, Lau;->c:Let;

    iput-object p3, p0, Lau;->d:Lbs;

    new-instance p1, Lgf;

    const/4 p2, 0x5

    invoke-direct {p1, p0, p2}, Lgf;-><init>(Ljava/lang/Object;B)V

    new-instance p2, Lks8;

    const/4 p3, 0x2

    invoke-direct {p2, p1, p3}, Lks8;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lzt;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lzt;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, p1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    return-void
.end method


# virtual methods
.method public final U(Ljs;)V
    .registers 6

    check-cast p1, Lis;

    iput-object p1, p0, Lau;->e:Lis;

    iget-object p0, p0, Lau;->c:Let;

    const/4 v0, 0x0

    iput-boolean v0, p0, Lfr8;->l:Z

    invoke-virtual {p0}, Let;->s()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    iget-object v1, p1, Lis;->c:Lst;

    iget-object v2, p0, Let;->s:Lst;

    iput-object v1, p0, Let;->s:Lst;

    const/4 v3, 0x0

    if-eqz v2, :cond_1b

    iget-object v2, v2, Lst;->j:Lrt;

    goto :goto_1c

    :cond_1b
    move-object v2, v3

    :goto_1c
    iget-object v1, v1, Lst;->j:Lrt;

    invoke-static {v2, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_36

    iput v0, p0, Let;->w:I

    invoke-virtual {p0}, Let;->v()V

    iput-object v3, p0, Let;->x:Ljava/lang/String;

    iput-object v3, p0, Let;->y:Lvmj;

    invoke-virtual {p0, v0}, Let;->q(Z)V

    invoke-virtual {p0}, Let;->s()V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_36
    iget-object p1, p1, Lis;->c:Lst;

    iget-boolean p1, p1, Lst;->k:Z

    if-eqz p1, :cond_40

    const p1, 0x7f080431

    goto :goto_43

    :cond_40
    const p1, 0x7f080430

    :goto_43
    iget v0, p0, Lfr8;->o:I

    if-ne v0, p1, :cond_48

    return-void

    :cond_48
    iput p1, p0, Lfr8;->o:I

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v0}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iput-object p1, p0, Lfr8;->p:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
