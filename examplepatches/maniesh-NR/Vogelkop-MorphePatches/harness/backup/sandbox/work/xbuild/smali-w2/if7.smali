.class public final Lif7;
.super Laii;
.source "SourceFile"


# instance fields
.field public final A:Lib9;

.field public final B:Lhf7;

.field public final C:Lcom/opera/android/BrowserActivity;

.field public final D:Lx5f;

.field public E:La21;

.field public F:Lre7;

.field public final y:Ltcl;

.field public final z:Lrc9;


# direct methods
.method public constructor <init>(Lmej;Ldx3;Ltcl;Lrc9;Lib9;Lx5f;)V
    .registers 9

    iget-object v0, p5, Lib9;->h:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_a

    const-string v0, "application/octet-stream"

    :cond_a
    invoke-direct {p0, p1, p2, v0}, Laii;-><init>(Lmej;Ldx3;Ljava/lang/String;)V

    iput-object p3, p0, Lif7;->y:Ltcl;

    iput-object p4, p0, Lif7;->z:Lrc9;

    iput-object p5, p0, Lif7;->A:Lib9;

    new-instance p1, Lhf7;

    iget-object p3, p5, Lib9;->e:Ljava/lang/String;

    iget-object p4, p0, Laii;->w:Ljava/lang/String;

    iget-wide v0, p5, Lib9;->j:J

    invoke-direct {p1, p3, p4, v0, v1}, Lhf7;-><init>(Ljava/lang/String;Ljava/lang/String;J)V

    iput-object p1, p0, Lif7;->B:Lhf7;

    instance-of p1, p2, Lcom/opera/android/BrowserActivity;

    if-eqz p1, :cond_27

    check-cast p2, Lcom/opera/android/BrowserActivity;

    goto :goto_28

    :cond_27
    const/4 p2, 0x0

    :goto_28
    iput-object p2, p0, Lif7;->C:Lcom/opera/android/BrowserActivity;

    iput-object p6, p0, Lif7;->D:Lx5f;

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;)Landroid/view/View;
    .registers 4

    invoke-super {p0, p1}, Liji;->a(Landroid/content/Context;)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Lif7;->B:Lhf7;

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Liji;->r(Lfji;Lwjh;)V

    return-object p1
.end method

.method public final e(Z)V
    .registers 4

    iget-object v0, p0, Lif7;->E:La21;

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

.method public final h(Landroid/net/Uri;Ljava/lang/String;)V
    .registers 16

    invoke-virtual {p0, p1, p2}, Laii;->a0(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v9

    if-nez v9, :cond_7

    return-void

    :cond_7
    new-instance v0, La21;

    iget-object p1, p0, Ldej;->b:Lmej;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v5, Luk6;

    const/16 p1, 0xc

    invoke-direct {v5, p0, p1}, Luk6;-><init>(Ljava/lang/Object;B)V

    iget-object p1, p0, Lif7;->A:Lib9;

    iget-object v2, p1, Lib9;->f:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    iget-object v2, p0, Lif7;->B:Lhf7;

    iget-object v7, v2, Lhf7;->b:Ljava/lang/String;

    iget-object v8, p1, Lib9;->g:Ljava/lang/String;

    new-instance v11, Lhu5;

    const/4 p1, 0x5

    invoke-direct {v11, p0, v9, p1}, Lhu5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v12, p0, Lif7;->D:Lx5f;

    iget-object v2, p0, Lif7;->y:Ltcl;

    iget-object v3, p0, Laii;->x:Lrf7;

    iget-object v4, p0, Lif7;->C:Lcom/opera/android/BrowserActivity;

    move-object v10, p2

    invoke-direct/range {v0 .. v12}, La21;-><init>(Landroid/content/Context;Ltcl;Lrf7;Lcom/opera/android/BrowserActivity;Luk6;Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Landroid/net/Uri;Ljava/lang/String;Lhu5;Lx5f;)V

    iput-object v0, p0, Lif7;->E:La21;

    return-void
.end method

.method public final j(Lwii;)V
    .registers 3

    iget-object v0, p0, Laii;->x:Lrf7;

    iget-object p0, p0, Lif7;->F:Lre7;

    invoke-virtual {v0, p0, p1}, Lrf7;->c(Lre7;Lvwh;)V

    return-void
.end method

.method public final k(Lfji;Lvwh;)V
    .registers 3

    check-cast p1, Lgf7;

    iget-object p1, p1, Lgf7;->a:Lre7;

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

    iput-object p1, p0, Lif7;->F:Lre7;

    if-eqz p1, :cond_2d

    invoke-virtual {p1}, Lre7;->q()Z

    move-result p1

    if-eqz p1, :cond_2d

    iget-object p1, p0, Lif7;->F:Lre7;

    invoke-virtual {p1}, Lre7;->a()Z

    move-result p1

    if-eqz p1, :cond_2d

    new-instance p1, Lgf7;

    iget-object p0, p0, Lif7;->F:Lre7;

    invoke-direct {p1, p0}, Lgf7;-><init>(Lre7;)V

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
    new-instance p1, Lgf7;

    invoke-direct {p1, p0}, Lgf7;-><init>(Lre7;)V

    return-object p1
.end method

.method public final w(Landroid/content/Context;Lwii;)V
    .registers 5

    iget-object v0, p0, Lif7;->F:Lre7;

    const/4 v1, 0x1

    iget-object p0, p0, Laii;->x:Lrf7;

    invoke-virtual {p0, v0, p1, p2, v1}, Lrf7;->p(Lre7;Landroid/content/Context;Lvwh;Z)V

    return-void
.end method
