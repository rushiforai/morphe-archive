.class public final Lu8k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lk7k;

.field public final c:Lv1;

.field public final d:Lode;

.field public final e:Lp8k;

.field public final f:Lp8k;

.field public final g:Li7f;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lk7k;Lv1;)V
    .registers 6

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu8k;->a:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lu8k;->b:Lk7k;

    iput-object p3, p0, Lu8k;->c:Lv1;

    new-instance p1, Lode;

    invoke-direct {p1}, Lekc;-><init>()V

    iput-object p1, p0, Lu8k;->d:Lode;

    new-instance v0, Lp8k;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lp8k;-><init>(Lu8k;B)V

    invoke-virtual {p2, v0}, Lno7;->g(Lmo7;)V

    iput-object v0, p0, Lu8k;->e:Lp8k;

    new-instance p2, Lp8k;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lp8k;-><init>(Lu8k;B)V

    invoke-virtual {p3, p2}, Lno7;->g(Lmo7;)V

    iput-object p2, p0, Lu8k;->f:Lp8k;

    new-instance p2, Li7f;

    invoke-direct {p2}, Li7f;-><init>()V

    iput-object p2, p0, Lu8k;->g:Li7f;

    new-instance p2, Ln6k;

    const/4 p3, 0x5

    invoke-direct {p2, p0, p3}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lw4i;

    const/16 p3, 0xc

    invoke-direct {p0, p2, p3}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0}, Lekc;->k(Lf7f;)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lq8k;

    iget-object p0, p0, Lu8k;->g:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lq8k;

    iget-object p0, p0, Lu8k;->g:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a()Lt8k;
    .registers 9

    new-instance v0, Lt8k;

    iget-object v1, p0, Lu8k;->c:Lv1;

    invoke-virtual {v1}, Lv1;->v()Lr1;

    move-result-object v2

    iget-object v3, p0, Lu8k;->b:Lk7k;

    if-eqz v2, :cond_f

    iget-boolean v2, v2, Lr1;->b:Z

    goto :goto_17

    :cond_f
    invoke-virtual {v3}, Lno7;->i()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lj7k;

    iget-boolean v2, v2, Lj7k;->e:Z

    :goto_17
    invoke-virtual {v1}, Lv1;->v()Lr1;

    move-result-object v4

    if-eqz v4, :cond_20

    iget-boolean v4, v4, Lr1;->e:Z

    goto :goto_28

    :cond_20
    invoke-virtual {v3}, Lno7;->i()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lj7k;

    iget-boolean v4, v4, Lj7k;->h:Z

    :goto_28
    iget-object p0, p0, Lu8k;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->f()Le7j;

    move-result-object v5

    sget-object v6, Le7j;->d:Le7j;

    if-ne v5, v6, :cond_35

    sget-object p0, Ls8k;->a:Ls8k;

    goto :goto_42

    :cond_35
    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object p0

    sget-object v5, Lb7j;->c:Lb7j;

    if-ne p0, v5, :cond_40

    sget-object p0, Ls8k;->b:Ls8k;

    goto :goto_42

    :cond_40
    sget-object p0, Ls8k;->c:Ls8k;

    :goto_42
    invoke-virtual {v1}, Lv1;->v()Lr1;

    move-result-object v5

    if-eqz v5, :cond_4b

    iget-boolean v5, v5, Lr1;->d:Z

    goto :goto_53

    :cond_4b
    invoke-virtual {v3}, Lno7;->i()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lj7k;

    iget-boolean v5, v5, Lj7k;->g:Z

    :goto_53
    if-eqz v5, :cond_6b

    invoke-virtual {v1}, Lv1;->v()Lr1;

    move-result-object v5

    if-eqz v5, :cond_5e

    iget-boolean v5, v5, Lr1;->c:Z

    goto :goto_66

    :cond_5e
    invoke-virtual {v3}, Lno7;->i()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lj7k;

    iget-boolean v5, v5, Lj7k;->f:Z

    :goto_66
    if-nez v5, :cond_6b

    sget-object v5, Lr8k;->b:Lr8k;

    goto :goto_6d

    :cond_6b
    sget-object v5, Lr8k;->a:Lr8k;

    :goto_6d
    invoke-virtual {v1}, Lv1;->v()Lr1;

    move-result-object v6

    if-eqz v6, :cond_76

    iget-boolean v6, v6, Lr1;->c:Z

    goto :goto_7e

    :cond_76
    invoke-virtual {v3}, Lno7;->i()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lj7k;

    iget-boolean v6, v6, Lj7k;->f:Z

    :goto_7e
    invoke-virtual {v1}, Lv1;->v()Lr1;

    move-result-object v1

    if-eqz v1, :cond_87

    iget-boolean v1, v1, Lr1;->d:Z

    goto :goto_8f

    :cond_87
    invoke-virtual {v3}, Lno7;->i()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lj7k;

    iget-boolean v1, v1, Lj7k;->i:Z

    :goto_8f
    invoke-virtual {v3}, Lno7;->i()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lj7k;

    iget-boolean v7, v3, Lj7k;->j:Z

    move v3, v6

    move v6, v1

    move v1, v2

    move v2, v4

    move-object v4, v5

    move v5, v3

    move-object v3, p0

    invoke-direct/range {v0 .. v7}, Lt8k;-><init>(ZZLs8k;Lr8k;ZZZ)V

    return-object v0
.end method

.method public final b()Lt8k;
    .registers 2

    iget-object v0, p0, Lu8k;->d:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt8k;

    if-nez v0, :cond_f

    invoke-virtual {p0}, Lu8k;->a()Lt8k;

    move-result-object p0

    return-object p0

    :cond_f
    return-object v0
.end method

.method public final c()V
    .registers 3

    iget-object v0, p0, Lu8k;->b:Lk7k;

    invoke-virtual {v0}, Lno7;->j()Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object v0, p0, Lu8k;->c:Lv1;

    invoke-virtual {v0}, Lno7;->j()Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-virtual {p0}, Lu8k;->a()Lt8k;

    move-result-object v0

    iget-object v1, p0, Lu8k;->d:Lode;

    invoke-static {v1, v0}, Lxf8;->E0(Lode;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    iget-object p0, p0, Lu8k;->g:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_22
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_32

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lq8k;

    invoke-interface {v0}, Lq8k;->a()V

    goto :goto_22

    :cond_32
    return-void
.end method
