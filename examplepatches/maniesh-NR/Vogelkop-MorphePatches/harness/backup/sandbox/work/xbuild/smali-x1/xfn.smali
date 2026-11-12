.class public final synthetic Lxfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcgn;


# direct methods
.method public synthetic constructor <init>(Lcgn;B)V
    .registers 3

    iput-byte p2, p0, Lxfn;->a:B

    iput-object p1, p0, Lxfn;->b:Lcgn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 7

    iget-byte p1, p0, Lxfn;->a:B

    iget-object p0, p0, Lxfn;->b:Lcgn;

    packed-switch p1, :pswitch_data_6c

    iget-object p0, p0, Lcgn;->v:Lydn;

    iput-boolean p2, p0, Lydn;->B:Z

    iget-object p1, p0, Lydn;->l:Landroid/content/Context;

    invoke-static {p1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v0, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "vpn.bypass_for_search"

    invoke-interface {v0, v1, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    invoke-virtual {p0}, Lydn;->N()V

    invoke-virtual {p0}, Lydn;->v()V

    return-void

    :pswitch_28
    iget-object p0, p0, Lcgn;->v:Lydn;

    iget-object p1, p0, Lydn;->d:Lvdn;

    iget-boolean v0, p1, Lvdn;->a:Z

    iget-object v1, p1, Lvdn;->b:Lefn;

    iget-object p1, p1, Lvdn;->c:Lhfn;

    invoke-virtual {p0}, Lydn;->p()Lwdn;

    move-result-object v2

    iget-boolean v2, v2, Lwdn;->a:Z

    const/4 v3, 0x0

    if-eqz v2, :cond_3f

    if-eqz v0, :cond_3f

    const/4 v0, 0x1

    goto :goto_40

    :cond_3f
    move v0, v3

    :goto_40
    iget-object v2, p0, Lydn;->c:Lgfn;

    invoke-interface {v2}, Lgfn;->isEnabled()Z

    move-result v2

    if-eqz v2, :cond_49

    move p2, v3

    :cond_49
    new-instance v2, Lvdn;

    invoke-direct {v2, v0, p2, v1, p1}, Lvdn;-><init>(ZZLefn;Lhfn;)V

    invoke-virtual {p0, v2}, Lydn;->I(Lvdn;)V

    return-void

    :pswitch_52
    iget-object p0, p0, Lcgn;->v:Lydn;

    iget-object p0, p0, Lydn;->l:Landroid/content/Context;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "vpn.vpnpro_auto_connect"

    invoke-interface {p1, v0, p2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void

    nop

    :pswitch_data_6c
    .packed-switch 0x0
        :pswitch_52
        :pswitch_28
    .end packed-switch
.end method
