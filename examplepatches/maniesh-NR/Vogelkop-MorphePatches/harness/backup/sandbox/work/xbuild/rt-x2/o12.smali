.class public final Lo12;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lr12;


# instance fields
.field public final synthetic a:Lr12;

.field public final synthetic b:Lg7m;


# direct methods
.method public constructor <init>(Lr12;Lg7m;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo12;->a:Lr12;

    iput-object p2, p0, Lo12;->b:Lg7m;

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-object v0, p0, Lo12;->a:Lr12;

    invoke-interface {v0}, Lr12;->a()V

    sget-object v0, Lp60;->c:Lp60;

    invoke-virtual {p0, v0}, Lo12;->g(Lp60;)V

    return-void
.end method

.method public final b()V
    .registers 2

    iget-object v0, p0, Lo12;->a:Lr12;

    invoke-interface {v0}, Lr12;->b()V

    sget-object v0, Lp60;->d:Lp60;

    invoke-virtual {p0, v0}, Lo12;->g(Lp60;)V

    return-void
.end method

.method public final c()V
    .registers 2

    iget-object v0, p0, Lo12;->a:Lr12;

    invoke-interface {v0}, Lr12;->c()V

    sget-object v0, Lp60;->b:Lp60;

    invoke-virtual {p0, v0}, Lo12;->g(Lp60;)V

    return-void
.end method

.method public final d()V
    .registers 2

    iget-object v0, p0, Lo12;->a:Lr12;

    invoke-interface {v0}, Lr12;->d()V

    sget-object v0, Lp60;->f:Lp60;

    invoke-virtual {p0, v0}, Lo12;->g(Lp60;)V

    return-void
.end method

.method public final e()V
    .registers 2

    iget-object v0, p0, Lo12;->a:Lr12;

    invoke-interface {v0}, Lr12;->e()V

    sget-object v0, Lp60;->g:Lp60;

    invoke-virtual {p0, v0}, Lo12;->g(Lp60;)V

    return-void
.end method

.method public final f()V
    .registers 2

    iget-object v0, p0, Lo12;->a:Lr12;

    invoke-interface {v0}, Lr12;->f()V

    sget-object v0, Lp60;->e:Lp60;

    invoke-virtual {p0, v0}, Lo12;->g(Lp60;)V

    return-void
.end method

.method public final g(Lp60;)V
    .registers 3

    iget-object p0, p0, Lo12;->b:Lg7m;

    const-string v0, "image"

    invoke-virtual {p0, v0, p1}, Lg7m;->e(Ljava/lang/String;Lp60;)V

    return-void
.end method
