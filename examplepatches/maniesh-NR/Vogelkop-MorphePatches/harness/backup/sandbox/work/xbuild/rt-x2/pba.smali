.class public final Lpba;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;


# instance fields
.field public a:Z

.field public final synthetic b:Lqba;

.field public final synthetic c:Lsba;


# direct methods
.method public constructor <init>(Lsba;Lqba;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lpba;->b:Lqba;

    iput-object p1, p0, Lpba;->c:Lsba;

    return-void
.end method


# virtual methods
.method public final b(Lhjm;)V
    .registers 5

    iget-object v0, p0, Lpba;->b:Lqba;

    iget-object v0, v0, Lqba;->f:Lrba;

    iget-boolean v1, p0, Lpba;->a:Z

    if-nez v1, :cond_26

    iget-object v1, p0, Lpba;->c:Lsba;

    iget-boolean v2, v1, Lsba;->f:Z

    if-nez v2, :cond_26

    iget-boolean v1, v1, Lsba;->g:Z

    if-nez v1, :cond_26

    const/4 v1, 0x1

    iput-boolean v1, p0, Lpba;->a:Z

    if-eqz v0, :cond_26

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eqz p0, :cond_23

    if-ne p0, v1, :cond_26

    invoke-interface {v0}, Lrba;->t()V

    return-void

    :cond_23
    invoke-interface {v0}, Lrba;->s()V

    :cond_26
    return-void
.end method

.method public final c(Z)V
    .registers 2

    iget-object p1, p0, Lpba;->b:Lqba;

    iget-boolean p1, p1, Lqba;->i:Z

    if-eqz p1, :cond_d

    iget-object p0, p0, Lpba;->c:Lsba;

    sget-object p1, Lhjm;->b:Lhjm;

    invoke-virtual {p0, p1}, Llz3;->b(Lhjm;)Z

    :cond_d
    return-void
.end method

.method public final d()V
    .registers 3

    iget-object v0, p0, Lpba;->c:Lsba;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lsba;->f:Z

    iget-object p0, p0, Lpba;->b:Lqba;

    iget-object p0, p0, Lqba;->f:Lrba;

    if-eqz p0, :cond_e

    invoke-interface {p0}, Lrba;->z()V

    :cond_e
    return-void
.end method

.method public final g(Llz3;)V
    .registers 2

    iget-object p0, p0, Lpba;->b:Lqba;

    iget-object p0, p0, Lqba;->f:Lrba;

    if-eqz p0, :cond_9

    invoke-interface {p0}, Lrba;->d()V

    :cond_9
    return-void
.end method

.method public final h()V
    .registers 1

    return-void
.end method
