.class public final synthetic Lp6k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lr6k;


# direct methods
.method public synthetic constructor <init>(Lr6k;B)V
    .registers 3

    iput-byte p2, p0, Lp6k;->a:B

    iput-object p1, p0, Lp6k;->b:Lr6k;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 8

    iget-byte p1, p0, Lp6k;->a:B

    const/4 v0, 0x1

    const/4 v1, 0x0

    iget-object p0, p0, Lp6k;->b:Lr6k;

    packed-switch p1, :pswitch_data_e8

    iget-object p0, p0, Lr6k;->e:Lne5;

    iget-object p1, p0, Lne5;->e:Ljava/lang/Object;

    check-cast p1, Lpz6;

    iget-object p1, p1, Lpz6;->e:Lxz6;

    iget-object v2, p1, Lxz6;->a:Lx5f;

    iget-boolean v3, p1, Lxz6;->c:Z

    if-nez v3, :cond_5d

    iput-boolean v0, p1, Lxz6;->c:Z

    iget-boolean v3, p1, Lxz6;->b:Z

    const-wide/16 v4, 0x1

    if-nez v3, :cond_3f

    iput-boolean v0, p1, Lxz6;->b:Z

    iget-boolean p1, v2, Lx5f;->h:Z

    if-eqz p1, :cond_3f

    iget-object p1, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-static {p1, v3}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object p1

    iget-object p1, p1, Lhi0;->e:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwu0;

    iget-object p1, p1, Lwu0;->b:Lvu0;

    invoke-virtual {p1, v1, v0, v4, v5}, Ljf0;->p(IIJ)V

    invoke-virtual {v2, v3}, Lx5f;->U0(Lx56;)V

    :cond_3f
    iget-boolean p1, v2, Lx5f;->h:Z

    if-eqz p1, :cond_5d

    iget-object p1, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-static {p1, v3}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object p1

    iget-object p1, p1, Lhi0;->e:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwu0;

    iget-object p1, p1, Lwu0;->b:Lvu0;

    invoke-virtual {p1, v0, v0, v4, v5}, Ljf0;->p(IIJ)V

    invoke-virtual {v2, v3}, Lx5f;->U0(Lx56;)V

    :cond_5d
    iget-object p0, p0, Lne5;->f:Ljava/lang/Object;

    check-cast p0, Lf1p;

    iget-object p0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object p0

    new-instance p1, Lspn;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v1}, Lgjm;->e(Ln37;Z)V

    return-void

    :pswitch_72
    iget-object p0, p0, Lr6k;->e:Lne5;

    iget-object p0, p0, Lne5;->f:Ljava/lang/Object;

    check-cast p0, Lf1p;

    iget-object p0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    sget-object v0, Lph0;->s:Lph0;

    invoke-virtual {p1, v0}, Lx5f;->f0(Lph0;)V

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->d1()V

    return-void

    :pswitch_95
    iget-object p1, p0, Lr6k;->f:Le7k;

    iget-object p1, p1, Le7k;->g:Lmu5;

    if-eqz p1, :cond_9e

    invoke-virtual {p1, v0}, Ltjf;->a(Z)V

    :cond_9e
    iget-object p0, p0, Lr6k;->e:Lne5;

    iget-object p0, p0, Lne5;->f:Ljava/lang/Object;

    check-cast p0, Lf1p;

    iget-object p1, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    sget-object v2, Lph0;->H:Lph0;

    invoke-virtual {p1, v2}, Lx5f;->f0(Lph0;)V

    iget-object p0, p0, Lf1p;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    iget-object p1, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v2, "jump_minigame.intro_shown"

    invoke-interface {p1, v2, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    xor-int/lit8 v1, p1, 0x1

    if-nez p1, :cond_d7

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object p1, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast p1, Landroid/content/SharedPreferences$Editor;

    invoke-interface {p1, v2, v0}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    :cond_d7
    const-string p0, "start_page_icon"

    const/4 p1, 0x0

    invoke-static {p1, p0, p1, v1}, Lbtb;->d(Landroid/net/Uri;Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object p0

    sget-object p1, Llqm;->I:Llqm;

    invoke-static {p0, p1, v0}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object p0

    invoke-static {p0}, Lam2;->v(Lvx3;)V

    return-void

    :pswitch_data_e8
    .packed-switch 0x0
        :pswitch_95
        :pswitch_72
    .end packed-switch
.end method
