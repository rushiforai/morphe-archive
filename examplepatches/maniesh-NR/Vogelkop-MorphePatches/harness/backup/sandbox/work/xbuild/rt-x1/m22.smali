.class public final Lm22;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Las6;


# instance fields
.field public final synthetic a:Lx22;


# direct methods
.method public constructor <init>(Lx22;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lm22;->a:Lx22;

    return-void
.end method


# virtual methods
.method public final W(Lndc;)V
    .registers 4

    iget-object p0, p0, Lm22;->a:Lx22;

    iget-object p1, p0, Lx22;->b:Lk6l;

    iget-object v0, p1, Lk6l;->w:Lxg;

    iget-object v1, p0, Lx22;->q:Lqz;

    invoke-virtual {v0, v1}, Lxg;->a(La2l;)V

    iget-object v0, p0, Lx22;->r:Ln22;

    invoke-virtual {p1, v0}, Lk6l;->c(Lj6l;)V

    iget-object v0, p0, Lx22;->d:Ldll;

    iget-object v1, p0, Lx22;->s:Lrw0;

    invoke-virtual {v0, v1}, Ldll;->a(Lcll;)V

    iget-object p1, p1, Lk6l;->o:Lb2l;

    if-eqz p1, :cond_40

    invoke-virtual {p0, p1}, Lx22;->g(Lb2l;)Lv22;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_28

    iput-boolean v1, v0, Lv22;->b:Z

    invoke-virtual {v0}, Lv22;->b()V

    goto :goto_40

    :cond_28
    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lx22;->j(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_40

    invoke-virtual {p0, p1}, Lx22;->e(Lb2l;)Lv22;

    move-result-object p1

    invoke-virtual {p1}, Lv22;->a()V

    iput-boolean v1, p1, Lv22;->c:Z

    invoke-virtual {p1}, Lv22;->b()V

    :cond_40
    :goto_40
    iget-object p1, p0, Lx22;->i:Ly22;

    iput-object p0, p1, Ly22;->a:Lx22;

    return-void
.end method

.method public final onDestroy(Lndc;)V
    .registers 6

    iget-object v0, p0, Lm22;->a:Lx22;

    iget-object v1, v0, Lx22;->b:Lk6l;

    iget-object v2, v0, Lx22;->i:Ly22;

    iget-object v3, v2, Ly22;->a:Lx22;

    invoke-static {v3, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_11

    const/4 v3, 0x0

    iput-object v3, v2, Ly22;->a:Lx22;

    :cond_11
    iget-object v2, v0, Lx22;->d:Ldll;

    iget-object v3, v0, Lx22;->s:Lrw0;

    invoke-virtual {v2, v3}, Ldll;->b(Lcll;)V

    iget-object v2, v1, Lk6l;->w:Lxg;

    iget-object v3, v0, Lx22;->q:Lqz;

    invoke-virtual {v2, v3}, Lxg;->b(La2l;)V

    iget-object v2, v0, Lx22;->r:Ln22;

    invoke-virtual {v1, v2}, Lk6l;->x(Lj6l;)V

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    iget-object p0, v0, Lx22;->t:Landroid/util/SparseArray;

    invoke-virtual {p0}, Landroid/util/SparseArray;->clear()V

    return-void
.end method

.method public final onPause(Lndc;)V
    .registers 2

    iget-object p0, p0, Lm22;->a:Lx22;

    iget-object p1, p0, Lx22;->b:Lk6l;

    iget-object p1, p1, Lk6l;->o:Lb2l;

    if-eqz p1, :cond_11

    invoke-virtual {p0, p1}, Lx22;->g(Lb2l;)Lv22;

    move-result-object p0

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Lv22;->b()V

    :cond_11
    return-void
.end method

.method public final onResume(Lndc;)V
    .registers 2

    iget-object p0, p0, Lm22;->a:Lx22;

    iget-object p1, p0, Lx22;->b:Lk6l;

    iget-object p1, p1, Lk6l;->o:Lb2l;

    if-eqz p1, :cond_11

    invoke-virtual {p0, p1}, Lx22;->g(Lb2l;)Lv22;

    move-result-object p0

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Lv22;->b()V

    :cond_11
    return-void
.end method
