.class public final Le0e;
.super Lf0e;
.source "SourceFile"


# static fields
.field public static final n:Lcyj;


# instance fields
.field public final i:Ls9i;

.field public final j:Lqz;

.field public final k:Lkol;

.field public l:Lzzd;

.field public m:Lzzd;


# direct methods
.method static constructor <clinit>()V
    .registers 10

    new-instance v0, Lcyj;

    sget-object v1, Ljsc;->d:Ljsc;

    new-instance v4, Lrxj;

    const/4 v2, 0x0

    invoke-direct {v4, v2, v2}, Lrxj;-><init>(II)V

    const/4 v8, 0x0

    const/16 v9, 0xf6

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-direct/range {v0 .. v9}, Lcyj;-><init>(Ljsc;Ly7h;Lhxh;Lrxj;Lzxj;Luxj;Lqxj;Lpxj;I)V

    sput-object v0, Le0e;->n:Lcyj;

    return-void
.end method

.method public constructor <init>(Lsf2;Lpde;Lpde;Lyhe;Lpde;Lyqa;Ls9i;Ls2;)V
    .registers 15

    invoke-direct/range {p0 .. p5}, Lf0e;-><init>(Lsf2;Lpde;Lpde;Lyhe;Lpde;)V

    iput-object p7, p0, Le0e;->i:Ls9i;

    new-instance p2, Luvc;

    const/16 p4, 0xd

    invoke-direct {p2, p4}, Luvc;-><init>(B)V

    invoke-static {p3, p2}, Lxf8;->V(Likc;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object p2

    invoke-static {p2}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v3

    new-instance p2, Lqz;

    invoke-direct {p2, p0, p4}, Lqz;-><init>(Ljava/lang/Object;B)V

    iput-object p2, p0, Le0e;->j:Lqz;

    new-instance v0, Lkol;

    iget-object p2, p1, Lsf2;->b:Landroid/widget/ImageView;

    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object v2, p0, Lf0e;->f:Ltsd;

    new-instance v5, Lrkc;

    const/16 p3, 0x11

    invoke-direct {v5, p1, p3}, Lrkc;-><init>(Ljava/lang/Object;B)V

    move-object v4, p6

    invoke-direct/range {v0 .. v5}, Lkol;-><init>(Landroid/content/Context;Lpde;Likc;Lyqa;Lkotlin/jvm/functions/Function1;)V

    iput-object v0, p0, Le0e;->k:Lkol;

    iget-object p1, p0, Lf0e;->f:Ltsd;

    new-instance p3, Lrkc;

    const/16 p4, 0x12

    invoke-direct {p3, p0, p4}, Lrkc;-><init>(Ljava/lang/Object;B)V

    new-instance p4, Liwa;

    const/16 p5, 0x9

    invoke-direct {p4, p3, p5}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p4}, Lekc;->k(Lf7f;)V

    new-instance p1, Ljf7;

    const/16 p3, 0x18

    invoke-direct {p1, p0, p8, p3}, Ljf7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p7, Ls9i;->c:Ljava/lang/Object;

    check-cast p1, Lpde;

    iget-object p2, p0, Lf0e;->f:Ltsd;

    new-instance p3, Ld8d;

    const/4 p4, 0x7

    invoke-direct {p3, p0, p4}, Ld8d;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2, p3}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method


# virtual methods
.method public final V()Landroid/view/View;
    .registers 6

    iget-object v0, p0, Le0e;->m:Lzzd;

    if-eqz v0, :cond_4f

    iget-object v0, v0, Lzzd;->a:Lb2l;

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getId()I

    move-result v0

    iget-object p0, p0, Lf0e;->d:Lyhe;

    iget-object p0, p0, Lyhe;->b:Ljava/lang/Object;

    check-cast p0, Lz5l;

    iget-object p0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lg6n;

    invoke-direct {v1, p0}, Lg6n;-><init>(Landroid/view/ViewGroup;)V

    invoke-virtual {v1}, Lg6n;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1f
    move-object v2, v1

    check-cast v2, Lh6n;

    invoke-virtual {v2}, Lh6n;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4f

    invoke-virtual {v2}, Lh6n;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v3

    instance-of v4, v3, Lh5l;

    if-eqz v4, :cond_1f

    check-cast v3, Lh5l;

    invoke-virtual {v3}, Lh5l;->X()Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Lkotlin/collections/CollectionsKt;->firstOrNull(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lb2l;

    if-eqz v3, :cond_1f

    check-cast v3, Ld7l;

    iget-object v3, v3, Ld7l;->j:Le7l;

    invoke-interface {v3}, Lb9l;->getId()I

    move-result v3

    if-ne v0, v3, :cond_1f

    return-object v2

    :cond_4f
    const/4 p0, 0x0

    return-object p0
.end method

.method public final X()V
    .registers 4

    iget-object v0, p0, Le0e;->m:Lzzd;

    if-eqz v0, :cond_28

    iget-object v0, v0, Lzzd;->a:Lb2l;

    iget-object v1, p0, Lf0e;->b:Lsf2;

    iget-object v1, v1, Lsf2;->b:Landroid/widget/ImageView;

    iget-object p0, p0, Le0e;->i:Ls9i;

    invoke-virtual {p0}, Ls9i;->Y()Z

    move-result v2

    if-eqz v2, :cond_24

    iget-object p0, p0, Ls9i;->c:Ljava/lang/Object;

    check-cast p0, Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-virtual {p0, v0}, Ljava/util/AbstractCollection;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_24

    const/4 p0, 0x1

    goto :goto_25

    :cond_24
    const/4 p0, 0x0

    :goto_25
    invoke-virtual {v1, p0}, Landroid/widget/ImageView;->setSelected(Z)V

    :cond_28
    return-void
.end method

.method public final Y()V
    .registers 5

    iget-object v0, p0, Le0e;->m:Lzzd;

    if-eqz v0, :cond_21

    iget-object v0, v0, Lzzd;->a:Lb2l;

    new-instance v1, Lfol;

    move-object v2, v0

    check-cast v2, Ld7l;

    invoke-virtual {v2}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0}, Lb9l;->T()Lp6l;

    move-result-object v0

    iget-object v2, v2, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->getId()I

    move-result v2

    invoke-direct {v1, v2, v0, v3}, Lfol;-><init>(ILp6l;Ljava/lang/String;)V

    iget-object p0, p0, Le0e;->k:Lkol;

    invoke-virtual {p0, v1}, Lkol;->j(Lfol;)V

    :cond_21
    return-void
.end method

.method public final Z()V
    .registers 4

    iget-object v0, p0, Lf0e;->f:Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    sget-object v1, Lng;->a:Lng;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_11

    iget-object v0, p0, Le0e;->l:Lzzd;

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    :goto_12
    iget-object v1, p0, Le0e;->m:Lzzd;

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_38

    iget-object v1, p0, Le0e;->m:Lzzd;

    iget-object v2, p0, Le0e;->j:Lqz;

    if-eqz v1, :cond_27

    iget-object v1, v1, Lzzd;->a:Lb2l;

    check-cast v1, Ld7l;

    invoke-virtual {v1, v2}, Ld7l;->s0(La2l;)V

    :cond_27
    iput-object v0, p0, Le0e;->m:Lzzd;

    if-eqz v0, :cond_38

    iget-object v0, v0, Lzzd;->a:Lb2l;

    check-cast v0, Ld7l;

    invoke-virtual {v0, v2}, Ld7l;->e0(La2l;)V

    invoke-virtual {p0}, Le0e;->Y()V

    invoke-virtual {p0}, Le0e;->X()V

    :cond_38
    return-void
.end method
