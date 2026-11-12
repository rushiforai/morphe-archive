.class public final Lscn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkz3;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Landroid/view/View;

.field public final synthetic c:Llgn;


# direct methods
.method public synthetic constructor <init>(Llgn;Landroid/view/View;B)V
    .registers 4

    iput-byte p3, p0, Lscn;->a:B

    iput-object p2, p0, Lscn;->b:Landroid/view/View;

    iput-object p1, p0, Lscn;->c:Llgn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b(Lhjm;)V
    .registers 5

    iget-byte v0, p0, Lscn;->a:B

    const/4 v1, 0x1

    iget-object p0, p0, Lscn;->b:Landroid/view/View;

    sget-object v2, Lhjm;->a:Lhjm;

    packed-switch v0, :pswitch_data_40

    if-ne p1, v2, :cond_24

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "vpn.tooltip_premium.closed"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_24
    return-void

    :pswitch_25
    if-ne p1, v2, :cond_3f

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    const-string v0, "vpn.tooltip_free_closed"

    invoke-interface {p1, v0, v1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_3f
    return-void

    :pswitch_data_40
    .packed-switch 0x0
        :pswitch_25
    .end packed-switch
.end method

.method public final g(Llz3;)V
    .registers 7

    iget-byte p1, p0, Lscn;->a:B

    iget-object p0, p0, Lscn;->c:Llgn;

    packed-switch p1, :pswitch_data_64

    check-cast p0, Ltcn;

    iget-object p1, p0, Ltcn;->g:Lmgn;

    check-cast p1, Lrfn;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget v0, p0, Ltcn;->e:I

    iget-boolean p0, p0, Ltcn;->f:Z

    iget-object v1, p1, Lmgn;->a:Lcom/opera/android/BrowserActivity;

    const/4 v2, 0x0

    const-string v3, "vpn.tooltip_premium.shown_incognito_promo"

    const/4 v4, 0x1

    if-eqz p0, :cond_43

    iget-object p0, p1, Lrfn;->k:Ljava/util/HashSet;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    invoke-static {v1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    invoke-static {v1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v0, v0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {v0, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    add-int/2addr v0, v4

    iget-object v4, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v4, v3, v0}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    goto :goto_45

    :cond_43
    iput-boolean v4, p1, Lrfn;->l:Z

    :goto_45
    iget-boolean p0, p1, Lrfn;->l:Z

    if-eqz p0, :cond_59

    invoke-static {v1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    invoke-interface {p0, v3, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result p0

    const/4 v0, 0x2

    if-lt p0, v0, :cond_59

    invoke-virtual {p1}, Lrfn;->g()V

    :cond_59
    return-void

    :pswitch_5a
    check-cast p0, Ltcn;

    iget-object p0, p0, Ltcn;->g:Lmgn;

    check-cast p0, Lucn;

    invoke-virtual {p0}, Lucn;->g()V

    return-void

    :pswitch_data_64
    .packed-switch 0x0
        :pswitch_5a
    .end packed-switch
.end method
