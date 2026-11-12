.class public final Lv43;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lotl;


# instance fields
.field public a:Z

.field public final synthetic b:Lz43;


# direct methods
.method public constructor <init>(Lz43;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lv43;->b:Lz43;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Lv43;->a:Z

    iget-object v0, p0, Lv43;->b:Lz43;

    iget-object v1, v0, Lz43;->c:Ljava/lang/Object;

    check-cast v1, Lk6l;

    iget-object v1, v1, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v1}, Lv43;->c(Lb2l;)V

    invoke-virtual {v0}, Lz43;->x()V

    return-void
.end method

.method public final b()V
    .registers 3

    const/4 v0, 0x1

    iput-boolean v0, p0, Lv43;->a:Z

    iget-object v0, p0, Lv43;->b:Lz43;

    iget-object v1, v0, Lz43;->c:Ljava/lang/Object;

    check-cast v1, Lk6l;

    iget-object v1, v1, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v1}, Lv43;->c(Lb2l;)V

    invoke-virtual {v0}, Lz43;->y()V

    return-void
.end method

.method public final c(Lb2l;)V
    .registers 3

    iget-boolean v0, p0, Lv43;->a:Z

    iget-object p0, p0, Lv43;->b:Lz43;

    if-eqz v0, :cond_e

    new-instance p1, Lx43;

    sget-object v0, Lyul;->d:Lyul;

    invoke-direct {p1, v0}, Lx43;-><init>(Lyul;)V

    goto :goto_35

    :cond_e
    if-eqz p1, :cond_31

    check-cast p1, Ld7l;

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->isLoading()Z

    move-result v0

    if-eqz v0, :cond_26

    iget-object v0, p1, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lwqm;->z(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_31

    :cond_26
    new-instance v0, Lx43;

    invoke-virtual {p1}, Ld7l;->m0()Lyul;

    move-result-object p1

    invoke-direct {v0, p1}, Lx43;-><init>(Lyul;)V

    move-object p1, v0

    goto :goto_35

    :cond_31
    invoke-virtual {p0}, Lz43;->k()Lx43;

    move-result-object p1

    :goto_35
    invoke-virtual {p0, p1}, Lz43;->A(Lx43;)V

    return-void
.end method
