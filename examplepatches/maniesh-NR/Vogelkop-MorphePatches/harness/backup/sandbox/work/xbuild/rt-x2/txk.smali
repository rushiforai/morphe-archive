.class public final synthetic Ltxk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lvlf;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Luxk;


# direct methods
.method public synthetic constructor <init>(Luxk;B)V
    .registers 3

    iput-byte p2, p0, Ltxk;->a:B

    iput-object p1, p0, Ltxk;->b:Luxk;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final u(Lcom/opera/android/ui/catalog/widget/OperaListItem;Z)V
    .registers 8

    iget-byte p1, p0, Ltxk;->a:B

    iget-object p0, p0, Ltxk;->b:Luxk;

    packed-switch p1, :pswitch_data_92

    sget-object p1, Luxk;->w:[Lxtb;

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p0

    iget-object p1, p0, Ldyk;->k:Lbf9;

    invoke-virtual {p1}, Lbf9;->r()I

    move-result p1

    const/4 v0, 0x2

    if-lt p1, v0, :cond_25

    if-nez p2, :cond_1d

    iget-object p1, p0, Ldyk;->l:Lxc9;

    invoke-virtual {p1}, Lxc9;->a()V

    :cond_1d
    iget-object p0, p0, Lj93;->b:Lcom/opera/android/settings/SettingsManager;

    const-string p1, "my_flow_visible"

    invoke-virtual {p0, p2, p1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    goto :goto_33

    :cond_25
    if-eqz p2, :cond_33

    iget-object p1, p0, Ldyk;->j:Lkxk;

    iget-object p1, p1, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    invoke-static {p1}, Lna2;->T(Landroid/content/Context;)V

    iget-object p0, p0, Ldyk;->e:Lzxk;

    invoke-virtual {p0}, Lzxk;->b()V

    :cond_33
    :goto_33
    return-void

    :pswitch_34
    sget-object p1, Luxk;->w:[Lxtb;

    invoke-virtual {p0}, Luxk;->I0()Ldyk;

    move-result-object p0

    iget-object p1, p0, Ldyk;->e:Lzxk;

    iget-object v0, p0, Ldyk;->f:Ldb;

    iget-object v1, p0, Ldyk;->i:Lzwk;

    invoke-static {v0, v1}, Lxgh;->s(Ldb;Lzwk;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_73

    if-eqz p2, :cond_91

    iget-object p2, p0, Ldyk;->j:Lkxk;

    new-instance v0, Ldnj;

    const/16 v1, 0x16

    invoke-direct {v0, p0, v1}, Ldnj;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p2, Lkxk;->e:Lcom/opera/android/BrowserActivity;

    iget-object p2, p2, Lkxk;->d:Lwv1;

    iget-object p2, p2, Lwv1;->b:Lb6h;

    invoke-interface {p2}, Lvtb;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lzwk;

    new-instance v1, Ll31;

    const/4 v4, 0x5

    invoke-direct {v1, v0, v4}, Ll31;-><init>(Lkotlin/jvm/functions/Function0;B)V

    const/4 v0, 0x0

    invoke-static {p0, p2, v1, v0}, Lxih;->y(Landroid/content/Context;Lzwk;Ljava/lang/Runnable;Ll31;)V

    iput-boolean v3, p1, Lzxk;->i:Z

    iget-object p0, p1, Lzxk;->g:Lh5k;

    iput-boolean v2, p0, Lh5k;->a:Z

    invoke-virtual {p1}, Lzxk;->b()V

    goto :goto_91

    :cond_73
    invoke-virtual {v0}, Ldb;->f()Z

    move-result v0

    if-nez v0, :cond_88

    if-eqz p2, :cond_91

    invoke-virtual {p0}, Ldyk;->g()V

    iput-boolean v3, p1, Lzxk;->i:Z

    iget-object p0, p1, Lzxk;->g:Lh5k;

    iput-boolean v2, p0, Lh5k;->a:Z

    invoke-virtual {p1}, Lzxk;->b()V

    goto :goto_91

    :cond_88
    iput-boolean p2, p1, Lzxk;->i:Z

    iget-object p0, p1, Lzxk;->g:Lh5k;

    iput-boolean v2, p0, Lh5k;->a:Z

    invoke-virtual {p1}, Lzxk;->b()V

    :cond_91
    :goto_91
    return-void

    :pswitch_data_92
    .packed-switch 0x0
        :pswitch_34
    .end packed-switch
.end method
