.class public final Lsjf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;


# instance fields
.field public final synthetic a:Ltjf;


# direct methods
.method public constructor <init>(Ltjf;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lsjf;->a:Ltjf;

    return-void
.end method


# virtual methods
.method public final b(Lhjm;)V
    .registers 2

    const/4 p1, 0x0

    iget-object p0, p0, Lsjf;->a:Ltjf;

    iput-object p1, p0, Ltjf;->f:Llz3;

    sget-object p1, Lrjf;->c:Lrjf;

    invoke-virtual {p0, p1}, Ltjf;->i(Lrjf;)V

    return-void
.end method

.method public final d()V
    .registers 2

    const/4 v0, 0x0

    iget-object p0, p0, Lsjf;->a:Ltjf;

    iput-object v0, p0, Ltjf;->f:Llz3;

    sget-object v0, Lrjf;->e:Lrjf;

    invoke-virtual {p0, v0}, Ltjf;->i(Lrjf;)V

    return-void
.end method

.method public final e()V
    .registers 2

    const/4 v0, 0x0

    iget-object p0, p0, Lsjf;->a:Ltjf;

    iput-object v0, p0, Ltjf;->f:Llz3;

    sget-object v0, Lrjf;->a:Lrjf;

    invoke-virtual {p0, v0}, Ltjf;->i(Lrjf;)V

    return-void
.end method

.method public final f()V
    .registers 2

    iget-object p0, p0, Lsjf;->a:Ltjf;

    invoke-virtual {p0}, Ltjf;->d()Z

    move-result v0

    if-eqz v0, :cond_b

    const/4 v0, 0x0

    iput-object v0, p0, Ltjf;->f:Llz3;

    :cond_b
    sget-object v0, Lrjf;->d:Lrjf;

    invoke-virtual {p0, v0}, Ltjf;->i(Lrjf;)V

    return-void
.end method

.method public final g(Llz3;)V
    .registers 3

    iget-object p0, p0, Lsjf;->a:Ltjf;

    iget-boolean v0, p0, Ltjf;->g:Z

    if-eqz v0, :cond_c

    sget-object p0, Lhjm;->b:Lhjm;

    invoke-virtual {p1, p0}, Llz3;->b(Lhjm;)Z

    return-void

    :cond_c
    iput-object p1, p0, Ltjf;->f:Llz3;

    return-void
.end method
