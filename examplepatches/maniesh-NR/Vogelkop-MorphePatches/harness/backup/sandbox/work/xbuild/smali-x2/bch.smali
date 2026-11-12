.class public final Lbch;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ls9i;

.field private final b:Lach;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .annotation build Lcom/opera/android/annotations/WeakOwner;
    .end annotation
.end field

.field public c:Lmsh;

.field public final d:Lpre;


# direct methods
.method public constructor <init>(Lstm;Ls9i;Lpre;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p3, p0, Lbch;->d:Lpre;

    iput-object p2, p0, Lbch;->a:Ls9i;

    new-instance p2, Lach;

    invoke-direct {p2, p1}, Lach;-><init>(Lstm;)V

    iput-object p2, p0, Lbch;->b:Lach;

    invoke-virtual {p1, p2}, Lt7j;->b(Lq8j;)V

    return-void
.end method


# virtual methods
.method public final a(Luqe;Ljava/lang/String;)V
    .registers 11

    iget-object v0, p0, Lbch;->b:Lach;

    iget-object v5, v0, Lach;->b:Lqtm;

    if-eqz v5, :cond_16

    iget-object v0, p0, Lbch;->c:Lmsh;

    if-eqz v0, :cond_17

    iget-object v0, v0, Lmsh;->v:Lp12;

    iget-object v0, v0, Lp12;->b:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_17

    :cond_16
    return-void

    :cond_17
    iget-object v0, p0, Lbch;->a:Ls9i;

    iget-object v1, v0, Ls9i;->e:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, Luy8;

    if-eqz v6, :cond_3b

    new-instance v1, Lh82;

    iget-object v2, v0, Ls9i;->b:Ljava/lang/Object;

    check-cast v2, Landroid/content/Context;

    iget-object v0, v0, Ls9i;->d:Ljava/lang/Object;

    move-object v3, v0

    check-cast v3, Lvr9;

    iget-object v4, p0, Lbch;->d:Lpre;

    move-object v7, p2

    invoke-direct/range {v1 .. v7}, Lgze;-><init>(Landroid/content/Context;Lywh;Lqre;Lqtm;Luy8;Ljava/lang/String;)V

    new-instance p2, Lf1p;

    const/4 v0, 0x0

    invoke-direct {p2, p0, p1, v0}, Lf1p;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v1, p2}, Ln82;->U(Lm82;)V

    return-void

    :cond_3b
    invoke-static {}, Lh9o;->e()V

    return-void
.end method

.method public final b(Lmsh;Luqe;)V
    .registers 6

    iget-object v0, p0, Lbch;->b:Lach;

    iget v0, v0, Lach;->c:I

    new-instance v1, Ld50;

    const/16 v2, 0x9

    invoke-direct {v1, p0, v0, p1, v2}, Ld50;-><init>(Ljava/lang/Object;ILjava/lang/Object;B)V

    new-instance v0, Lvr9;

    const/4 v2, 0x2

    invoke-direct {v0, v1, v2}, Lvr9;-><init>(Ljava/lang/Runnable;I)V

    new-instance v1, Lzbh;

    invoke-direct {v1, p0, v0}, Lzbh;-><init>(Lbch;Lvr9;)V

    const/4 p0, 0x1

    invoke-virtual {p1, p2, v1, p0}, Lmsh;->d(Luqe;Lssh;Z)V

    return-void
.end method

.method public final c(ILmsh;)V
    .registers 4

    iget-object v0, p0, Lbch;->b:Lach;

    iget v0, v0, Lach;->c:I

    if-ne v0, p1, :cond_16

    iget-object p1, p2, Lmsh;->A:Lkm5;

    iget-object p1, p1, Lkm5;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    if-eqz p1, :cond_16

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_16

    iput-object p2, p0, Lbch;->c:Lmsh;

    :cond_16
    return-void
.end method
