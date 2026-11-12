.class public final Lden;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;


# instance fields
.field public a:Z

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Leen;


# direct methods
.method public constructor <init>(Leen;Landroid/view/View;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lden;->b:Landroid/view/View;

    iput-object p1, p0, Lden;->c:Leen;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lden;->a:Z

    return-void
.end method


# virtual methods
.method public final b(Lhjm;)V
    .registers 10

    sget-object v0, Lhjm;->a:Lhjm;

    if-ne p1, v0, :cond_4c

    iget-object p1, p0, Lden;->b:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v0, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "vpn.tooltip_premium.change_location_closed"

    const/4 v6, 0x1

    invoke-interface {v0, v1, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    const-string v3, "vpn.tooltip_premium.change_location_closed_timestamp"

    invoke-interface {v0, v3, v1, v2}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    iget-boolean p1, p0, Lden;->a:Z

    if-eqz p1, :cond_4c

    iget-object p0, p0, Lden;->c:Leen;

    iget-object p0, p0, Leen;->d:Lfen;

    iget-object p0, p0, Lmgn;->d:Lgbf;

    iget-object p0, p0, Lgbf;->m:Ldbf;

    iget-object p1, p0, Ldbf;->m:Loim;

    invoke-static {p1}, Ldbf;->u(Loim;)Z

    move-result p1

    if-nez p1, :cond_4c

    new-instance v2, Ls14;

    iget-object v3, p0, Ldbf;->q:Lgbf;

    iget-object v4, p0, Ldbf;->f:Lgjm;

    iget-object v5, p0, Ldbf;->i:Lcdn;

    iget-object v7, p0, Ldbf;->e:Lhv3;

    invoke-direct/range {v2 .. v7}, Ls14;-><init>(Lgbf;Lgjm;Lcdn;ZLhv3;)V

    invoke-virtual {p0, v2}, Ldbf;->z(Lebf;)V

    :cond_4c
    return-void
.end method

.method public final d()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lden;->a:Z

    return-void
.end method

.method public final g(Llz3;)V
    .registers 2

    iget-object p0, p0, Lden;->c:Leen;

    iget-object p0, p0, Leen;->d:Lfen;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Lfen;->g()V

    return-void
.end method
