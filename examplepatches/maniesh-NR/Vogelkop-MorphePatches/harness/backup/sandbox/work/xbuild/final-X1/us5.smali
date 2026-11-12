.class public final synthetic Lus5;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lat5;


# direct methods
.method public synthetic constructor <init>(Lat5;B)V
    .registers 3

    iput-byte p2, p0, Lus5;->a:B

    iput-object p1, p0, Lus5;->b:Lat5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 7

    iget-byte p1, p0, Lus5;->a:B

    const-string v0, "android.intent.action.SENDTO"

    const-string v1, ""

    const/4 v2, 0x0

    sget-object v3, Llqm;->d:Llqm;

    const/4 v4, 0x1

    iget-object p0, p0, Lus5;->b:Lat5;

    packed-switch p1, :pswitch_data_15a

    iget-object p1, p0, Lat5;->i:Lcom/opera/api/Callback;

    new-instance v0, Lyu;

    iget-object v1, p0, Lat5;->d:Lqs5;

    iget-object v1, v1, Lqs5;->f:Ljava/lang/String;

    iget-object p0, p0, Lat5;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->p()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Lyu;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {p1, v0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_24
    iget-object p1, p0, Lat5;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lat5;->d:Lqs5;

    iget-object v0, p0, Lqs5;->b:Ljava/lang/String;

    iget-object p0, p0, Lqs5;->k:Lsqh;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p0, :cond_33

    iget-object v1, p0, Lsqh;->a:Ljava/lang/String;

    :cond_33
    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {p0, v0, v1}, LJ/N;->M8vd_RmR(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :pswitch_3b
    iget-object p1, p0, Ldej;->b:Lmej;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p0, p0, Lat5;->d:Lqs5;

    iget-object p0, p0, Lqs5;->c:Ljava/lang/String;

    invoke-static {p1, p0}, Lphj;->t0(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    :pswitch_49
    iget-object p1, p0, Ldej;->b:Lmej;

    invoke-interface {p1}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object p0, p0, Lat5;->d:Lqs5;

    iget-object p0, p0, Lqs5;->d:Ljava/lang/String;

    invoke-static {p1, p0}, Lphj;->t0(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    :pswitch_57
    iget-object p1, p0, Lat5;->d:Lqs5;

    iget-object p1, p1, Lqs5;->b:Ljava/lang/String;

    new-instance v0, Lxgf;

    invoke-direct {v0, p1}, Lxgf;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lat5;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-boolean p1, p1, Lcom/opera/android/browser/chromium/ChromiumContent;->t:Z

    iput-boolean p1, v0, Lxgf;->o:Z

    iput-boolean v4, v0, Lxgf;->n:Z

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, v0}, Lzi4;->u(Landroid/content/Context;Lic4;)V

    return-void

    :pswitch_72
    iget-object p1, p0, Lat5;->d:Lqs5;

    iget-object p1, p1, Lqs5;->b:Ljava/lang/String;

    invoke-static {p1, v3, v2}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    invoke-virtual {p0, p1, v4, v2}, Lat5;->l(Lvx3;ZZ)V

    return-void

    :pswitch_7e
    iget-object p1, p0, Lat5;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lat5;->d:Lqs5;

    iget-object v0, p0, Lqs5;->e:Ljava/lang/String;

    iget-object p0, p0, Lqs5;->k:Lsqh;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p0, :cond_8d

    iget-object v1, p0, Lsqh;->a:Ljava/lang/String;

    :cond_8d
    invoke-virtual {p1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-static {p0, v0, v1}, LJ/N;->M8vd_RmR(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :pswitch_95
    iget-object p0, p0, Lat5;->f:Ld5o;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lds5;

    const/4 v0, 0x3

    invoke-direct {p1, p0, v0}, Lds5;-><init>(Ld5o;B)V

    iget-object v0, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast v0, Lk73;

    new-instance v1, Lge5;

    invoke-direct {v1, p0, p1, v4}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lk73;->t(Lge5;)V

    return-void

    :pswitch_ad
    iget-object p0, p0, Lat5;->f:Ld5o;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lds5;

    invoke-direct {p1, p0, v2}, Lds5;-><init>(Ld5o;B)V

    iget-object v0, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast v0, Lk73;

    new-instance v1, Lge5;

    invoke-direct {v1, p0, p1, v4}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lk73;->t(Lge5;)V

    return-void

    :pswitch_c4
    iget-object p0, p0, Lat5;->f:Ld5o;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lds5;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lds5;-><init>(Ld5o;B)V

    iget-object v0, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast v0, Lk73;

    new-instance v1, Lge5;

    invoke-direct {v1, p0, p1, v4}, Lge5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lk73;->t(Lge5;)V

    return-void

    :pswitch_dc
    iget-object p1, p0, Lat5;->d:Lqs5;

    iget-object p1, p1, Lqs5;->d:Ljava/lang/String;

    new-instance v1, Landroid/content/Intent;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v1, v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v1}, Lat5;->m(Landroid/content/Intent;)V

    return-void

    :pswitch_ed
    iget-object p0, p0, Lat5;->f:Ld5o;

    iget-object p1, p0, Ld5o;->c:Ljava/lang/Object;

    check-cast p1, Lk73;

    sget-object v0, Lks5;->b:Lks5;

    new-instance v1, Lds5;

    invoke-direct {v1, p0, v4}, Lds5;-><init>(Ld5o;B)V

    const/16 p0, 0x800

    invoke-virtual {p1, p0, v0, v1}, Lk73;->v(ILks5;Lls5;)V

    return-void

    :pswitch_100
    iget-object p1, p0, Lat5;->d:Lqs5;

    iget-object p1, p1, Lqs5;->e:Ljava/lang/String;

    invoke-static {p1, v3, v2}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    invoke-virtual {p0, p1, v2, v2}, Lat5;->l(Lvx3;ZZ)V

    return-void

    :pswitch_10c
    iget-object p1, p0, Lat5;->c:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lat5;->d:Lqs5;

    iget-object v0, p0, Lqs5;->e:Ljava/lang/String;

    iget-object p0, p0, Lqs5;->k:Lsqh;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0, p0, v3}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object p0

    if-eqz p0, :cond_120

    invoke-virtual {p1, p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->v(Llsc;)V

    :cond_120
    return-void

    :pswitch_121
    iget-object p1, p0, Lat5;->d:Lqs5;

    iget-object p1, p1, Lqs5;->b:Ljava/lang/String;

    invoke-static {p1, v3, v2}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p1

    invoke-virtual {p0, p1, v2, v2}, Lat5;->l(Lvx3;ZZ)V

    return-void

    :pswitch_12d
    iget-object p1, p0, Lat5;->d:Lqs5;

    iget-object p1, p1, Lqs5;->b:Ljava/lang/String;

    new-instance v1, Landroid/content/Intent;

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v1, v0, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v1}, Lat5;->m(Landroid/content/Intent;)V

    return-void

    :pswitch_13e
    iget-object p1, p0, Lat5;->d:Lqs5;

    iget-object p1, p1, Lqs5;->d:Ljava/lang/String;

    const-string v0, "^callto:"

    const-string v1, "tel:"

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.DIAL"

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-direct {v0, v1, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Lat5;->m(Landroid/content/Intent;)V

    return-void

    nop

    :pswitch_data_15a
    .packed-switch 0x0
        :pswitch_13e
        :pswitch_12d
        :pswitch_121
        :pswitch_10c
        :pswitch_100
        :pswitch_ed
        :pswitch_dc
        :pswitch_c4
        :pswitch_ad
        :pswitch_95
        :pswitch_7e
        :pswitch_72
        :pswitch_57
        :pswitch_49
        :pswitch_3b
        :pswitch_24
    .end packed-switch
.end method
