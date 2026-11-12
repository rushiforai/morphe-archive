.class public final Liii;
.super Laii;
.source "SourceFile"


# instance fields
.field public final A:[Landroid/print/PageRange;

.field public final B:Lqie;

.field public final C:Lcom/opera/android/BrowserActivity;

.field public final D:Lx5f;

.field public E:Lqji;

.field public F:Lgii;

.field public G:Lhii;

.field public H:Lre7;

.field public final y:Lumi;

.field public final z:Lh7b;


# direct methods
.method public constructor <init>(Lmej;Ldx3;Lumi;Lqji;[Landroid/print/PageRange;Lr9g;Lwjh;Lx5f;)V
    .registers 11

    const-string v0, "application/pdf"

    invoke-direct {p0, p1, p2, v0}, Laii;-><init>(Lmej;Ldx3;Ljava/lang/String;)V

    iput-object p3, p0, Liii;->y:Lumi;

    iget-object p1, p4, Lqji;->p:[Landroid/print/PageRange;

    const-wide/16 v0, 0x0

    if-nez p1, :cond_1b

    new-instance p1, Lhii;

    const/4 p3, 0x0

    invoke-direct {p1, p0, p6, p3}, Lhii;-><init>(Lndc;Ljava/lang/Object;B)V

    iput-object p1, p0, Liii;->G:Lhii;

    iget-object p3, p4, Lqji;->c:Lh7f;

    invoke-virtual {p3, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    goto :goto_23

    :cond_1b
    invoke-virtual {p6, p1}, Lr9g;->test(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_23

    iget-wide v0, p4, Lqji;->o:J

    :cond_23
    :goto_23
    new-instance p1, Lh7b;

    iget-object p3, p4, Lqji;->m:Ljava/lang/String;

    const/4 p6, 0x1

    invoke-direct {p1, p3, v0, v1, p6}, Lh7b;-><init>(Ljava/lang/String;JB)V

    iput-object p1, p0, Liii;->z:Lh7b;

    const/4 p1, 0x0

    if-eqz p7, :cond_38

    new-instance p3, Lqie;

    const/16 p6, 0x10

    invoke-direct {p3, p7, p6}, Lqie;-><init>(Ljava/lang/Object;B)V

    goto :goto_39

    :cond_38
    move-object p3, p1

    :goto_39
    iput-object p3, p0, Liii;->B:Lqie;

    instance-of p3, p2, Lcom/opera/android/BrowserActivity;

    if-eqz p3, :cond_42

    move-object p1, p2

    check-cast p1, Lcom/opera/android/BrowserActivity;

    :cond_42
    iput-object p1, p0, Liii;->C:Lcom/opera/android/BrowserActivity;

    iput-object p5, p0, Liii;->A:[Landroid/print/PageRange;

    iput-object p4, p0, Liii;->E:Lqji;

    iput-object p8, p0, Liii;->D:Lx5f;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 4

    invoke-super {p0, p1}, Liji;->a(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Liii;->B:Lqie;

    if-nez v0, :cond_a

    const/4 v0, 0x0

    goto :goto_e

    :cond_a
    iget-object v0, v0, Lqie;->b:Ljava/lang/Object;

    check-cast v0, Lwjh;

    :goto_e
    iget-object v1, p0, Liii;->z:Lh7b;

    invoke-virtual {p0, v1, v0}, Liji;->r(Lfji;Lwjh;)V

    return-object p1
.end method

.method public final e(Z)V
    .registers 4

    iget-object v0, p0, Liii;->F:Lgii;

    if-nez v0, :cond_15

    new-instance p1, Lglj;

    const v0, 0x7f1405e1

    const/16 v1, 0x9c4

    invoke-direct {p1, v0, v1}, Lglj;-><init>(II)V

    invoke-virtual {p0, p1}, Liji;->R(Lo93;)V

    invoke-virtual {p0}, Ldej;->b()V

    return-void

    :cond_15
    invoke-super {p0, p1}, Liji;->e(Z)V

    return-void
.end method

.method public final g()V
    .registers 2

    iget-object v0, p0, Liii;->E:Lqji;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lqji;->b()V

    const/4 v0, 0x0

    iput-object v0, p0, Liii;->E:Lqji;

    :cond_a
    return-void
.end method

.method public final h(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 16

    iget-object v0, p0, Liii;->E:Lqji;

    if-eqz v0, :cond_a

    invoke-virtual {p0, p1, p2}, Laii;->a0(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    if-nez v9, :cond_b

    :cond_a
    return-void

    :cond_b
    iget-object p1, p0, Liii;->B:Lqie;

    const/4 v0, 0x0

    if-eqz p1, :cond_18

    new-instance p1, Lzzh;

    const/4 v1, 0x3

    invoke-direct {p1, p0, v1}, Lzzh;-><init>(Ljava/lang/Object;B)V

    move-object v11, p1

    goto :goto_19

    :cond_18
    move-object v11, v0

    :goto_19
    iget-object p1, p0, Liii;->G:Lhii;

    if-eqz p1, :cond_24

    iget-object v1, p0, Liii;->E:Lqji;

    invoke-virtual {v1, p1}, Lqji;->e(Lnji;)V

    iput-object v0, p0, Liii;->G:Lhii;

    :cond_24
    new-instance v1, Lgii;

    iget-object p1, p0, Ldej;->b:Lmej;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v5, p0, Liii;->E:Lqji;

    new-instance v8, Lr9g;

    const/16 p1, 0x18

    invoke-direct {v8, p0, p1}, Lr9g;-><init>(Ljava/lang/Object;B)V

    iget-object v12, p0, Liii;->D:Lx5f;

    iget-object v3, p0, Liii;->y:Lumi;

    iget-object v4, p0, Laii;->x:Lrf7;

    iget-object v6, p0, Liii;->A:[Landroid/print/PageRange;

    iget-object v7, p0, Liii;->C:Lcom/opera/android/BrowserActivity;

    move-object v10, p2

    invoke-direct/range {v1 .. v12}, Lgii;-><init>(Landroid/content/Context;Lumi;Lrf7;Lqji;[Landroid/print/PageRange;Lcom/opera/android/BrowserActivity;Lr9g;Landroid/net/Uri;Ljava/lang/String;Lzzh;Lx5f;)V

    iput-object v1, p0, Liii;->F:Lgii;

    iput-object v0, p0, Liii;->E:Lqji;

    return-void
.end method

.method public final j(Lwii;)V
    .registers 3

    iget-object v0, p0, Laii;->x:Lrf7;

    iget-object p0, p0, Liii;->H:Lre7;

    invoke-virtual {v0, p0, p1}, Lrf7;->c(Lre7;Lvwh;)V

    return-void
.end method

.method public final k(Lfji;Lvwh;)V
    .registers 3

    check-cast p1, Leii;

    iget-object p1, p1, Leii;->a:Lre7;

    iget-object p0, p0, Laii;->x:Lrf7;

    invoke-virtual {p0, p1, p2}, Lrf7;->c(Lre7;Lvwh;)V

    return-void
.end method

.method public final o(Landroid/net/Uri;Ljava/lang/String;)Lfji;
    .registers 4

    invoke-virtual {p1}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p1

    const/4 p2, 0x0

    iget-object v0, p0, Laii;->x:Lrf7;

    invoke-virtual {v0, p1, p2}, Lrf7;->e(Landroid/net/Uri;I)Lre7;

    move-result-object p1

    iput-object p1, p0, Liii;->H:Lre7;

    if-eqz p1, :cond_2d

    invoke-virtual {p1}, Lre7;->q()Z

    move-result p1

    if-eqz p1, :cond_2d

    iget-object p1, p0, Liii;->H:Lre7;

    invoke-virtual {p1}, Lre7;->a()Z

    move-result p1

    if-eqz p1, :cond_2d

    new-instance p1, Leii;

    iget-object p0, p0, Liii;->H:Lre7;

    invoke-direct {p1, p0}, Leii;-><init>(Lre7;)V

    return-object p1

    :cond_2d
    const/4 p0, 0x0

    return-object p0
.end method

.method public final q(Landroid/net/Uri;)Lfji;
    .registers 3

    iget-object p0, p0, Laii;->x:Lrf7;

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lrf7;->e(Landroid/net/Uri;I)Lre7;

    move-result-object p0

    if-nez p0, :cond_b

    const/4 p0, 0x0

    return-object p0

    :cond_b
    new-instance p1, Leii;

    invoke-direct {p1, p0}, Leii;-><init>(Lre7;)V

    return-object p1
.end method

.method public final w(Landroid/content/Context;Lwii;)V
    .registers 5

    iget-object v0, p0, Liii;->H:Lre7;

    const/4 v1, 0x1

    iget-object p0, p0, Laii;->x:Lrf7;

    invoke-virtual {p0, v0, p1, p2, v1}, Lrf7;->p(Lre7;Landroid/content/Context;Lvwh;Z)V

    return-void
.end method
