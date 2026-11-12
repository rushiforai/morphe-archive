.class public final Lr00;
.super Lq00;
.source "SourceFile"


# instance fields
.field public final synthetic m:Ls00;


# direct methods
.method public constructor <init>(Ls00;Landroid/app/Activity;Lzy;Ldl;)V
    .registers 11

    iput-object p1, p0, Lr00;->m:Ls00;

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lq00;-><init>(Ls00;Landroid/app/Activity;Lzy;Ldl;B)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 9

    sget-boolean v0, Ls00;->v:Z

    if-eqz v0, :cond_17

    const-string v0, "ads provider not available"

    iget-object v1, p0, Lr00;->m:Ls00;

    iget-object v1, v1, Lbqi;->g:Ljava/lang/String;

    invoke-static {v0, v1}, Lbqi;->n(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v2, p0

    invoke-virtual/range {v2 .. v7}, Lk43;->b(ZLjava/lang/String;ZLv50;Ljava/lang/Long;)V

    return-void

    :cond_17
    move-object v2, p0

    invoke-virtual {v2}, Lq00;->i()V

    return-void
.end method

.method public final g(Lcie;)V
    .registers 4

    iget-object p0, p1, Lbzo;->g:Ljava/lang/String;

    new-instance v0, Lkqd;

    const/4 v1, 0x6

    invoke-direct {v0, p1, v1}, Lkqd;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Lfmn;

    const/16 v1, 0x13

    invoke-direct {p1, p0, v0, v1}, Lfmn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1}, Lgxo;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final h(Lcie;Ljava/lang/String;Lp00;)V
    .registers 4

    invoke-virtual {p0, p1, p2, p3}, Lq00;->j(Lcie;Ljava/lang/String;Lp00;)V

    return-void
.end method
