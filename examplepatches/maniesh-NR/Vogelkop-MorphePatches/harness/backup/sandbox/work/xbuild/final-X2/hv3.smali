.class public final Lhv3;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final synthetic a:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 2

    iput-object p1, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(ILgmi;I)V
    .registers 8

    const/4 v0, 0x1

    if-eq p1, v0, :cond_59

    const/4 v1, 0x3

    if-ne p1, v1, :cond_9

    sget-object p1, Lbo0;->c:Lbo0;

    goto :goto_b

    :cond_9
    sget-object p1, Lbo0;->b:Lbo0;

    :goto_b
    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    if-eqz p2, :cond_1a

    if-ne p2, v0, :cond_16

    sget-object p2, Lep0;->d:Lep0;

    goto :goto_1c

    :cond_16
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_1a
    sget-object p2, Lep0;->b:Lep0;

    :goto_1c
    packed-switch p3, :pswitch_data_74

    sget-object p3, Ldp0;->b:Ldp0;

    goto :goto_45

    :pswitch_22
    sget-object p3, Ldp0;->n:Ldp0;

    goto :goto_45

    :pswitch_25
    sget-object p3, Ldp0;->m:Ldp0;

    goto :goto_45

    :pswitch_28
    sget-object p3, Ldp0;->l:Ldp0;

    goto :goto_45

    :pswitch_2b
    sget-object p3, Ldp0;->k:Ldp0;

    goto :goto_45

    :pswitch_2e
    sget-object p3, Ldp0;->j:Ldp0;

    goto :goto_45

    :pswitch_31
    sget-object p3, Ldp0;->i:Ldp0;

    goto :goto_45

    :pswitch_34
    sget-object p3, Ldp0;->h:Ldp0;

    goto :goto_45

    :pswitch_37
    sget-object p3, Ldp0;->g:Ldp0;

    goto :goto_45

    :pswitch_3a
    sget-object p3, Ldp0;->f:Ldp0;

    goto :goto_45

    :pswitch_3d
    sget-object p3, Ldp0;->e:Ldp0;

    goto :goto_45

    :pswitch_40
    sget-object p3, Ldp0;->d:Ldp0;

    goto :goto_45

    :pswitch_43
    sget-object p3, Ldp0;->c:Ldp0;

    :goto_45
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p0

    iget-object p0, p0, Ld6j;->c:Lx5f;

    iget-boolean v0, p0, Lx5f;->h:Z

    if-nez v0, :cond_5a

    :cond_59
    return-void

    :cond_5a
    iget-object v0, p0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v1

    new-instance v2, Lck0;

    invoke-direct {v2, v0, v1}, Lck0;-><init>(Lzpa;Lx56;)V

    new-instance v0, Lyo7;

    const/16 v3, 0x17

    invoke-direct {v0, p1, p2, p3, v3}, Lyo7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v0}, Lck0;->b(Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {p0, v1}, Lx5f;->U0(Lx56;)V

    return-void

    nop

    :pswitch_data_74
    .packed-switch 0x1
        :pswitch_43
        :pswitch_40
        :pswitch_3d
        :pswitch_3a
        :pswitch_37
        :pswitch_34
        :pswitch_31
        :pswitch_2e
        :pswitch_2b
        :pswitch_28
        :pswitch_25
        :pswitch_22
    .end packed-switch
.end method

.method public final b(Lhbf;)V
    .registers 4

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    const/4 v1, 0x0

    if-nez v0, :cond_8

    move-object v0, v1

    :cond_8
    iget-object v0, v0, Lgbf;->j:Lvbf;

    invoke-virtual {v0}, Lvbf;->p()Z

    move-result v0

    if-eqz v0, :cond_11

    return-void

    :cond_11
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/BrowserActivity;->o1(I)V

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez p0, :cond_1a

    move-object p0, v1

    :cond_1a
    invoke-virtual {p0, v1, p1}, Lgbf;->l(Lbsi;Lhbf;)V

    return-void
.end method

.method public final c()V
    .registers 1

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->f:Lfx3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lul3;

    invoke-virtual {p0}, Lul3;->a()V

    return-void
.end method

.method public final d()V
    .registers 6

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_5f

    move-object v1, v0

    check-cast v1, Ld7l;

    iget-object v2, v1, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3b

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object p0

    new-instance v0, Lmzj;

    invoke-virtual {v1}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v2

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    const/16 v4, 0x8

    invoke-direct {v0, v2, v1, v3, v4}, Lmzj;-><init>(Ljava/lang/String;Ljava/lang/String;Landroid/graphics/Bitmap;I)V

    invoke-virtual {p0, v0}, Lnr8;->a(Lmzj;)J

    return-void

    :cond_3b
    new-instance v2, Lwx;

    const/16 v3, 0x17

    invoke-direct {v2, v0, p0, v3}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Liyk;

    const/16 v3, 0xf

    invoke-direct {p0, v2, v0, v3}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v1, Ld7l;->j:Le7l;

    invoke-interface {v0, p0}, Lb9l;->Q(Lcom/opera/api/Callback;)Z

    move-result p0

    if-nez p0, :cond_5f

    new-instance p0, Ltun;

    invoke-virtual {v1}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ll08;->a:Ll08;

    invoke-direct {p0, v0, v1}, Ltun;-><init>(Ljava/lang/String;Ljava/util/List;)V

    invoke-virtual {v2, p0}, Lwx;->run(Ljava/lang/Object;)V

    :cond_5f
    return-void
.end method

.method public final e()V
    .registers 6

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lz5i;->r0(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-static {p0}, Lz5i;->v0(Landroid/content/Context;)V

    return-void

    :cond_c
    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v0, :cond_11

    const/4 v0, 0x0

    :cond_11
    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_2c

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v1

    const-wide v2, 0x7ffffffffffffffdL

    invoke-virtual {v1, v2, v3}, Lq6e;->c(J)Ll6e;

    move-result-object v1

    if-nez v1, :cond_2d

    :cond_2c
    return-void

    :cond_2d
    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->h0()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    new-instance v3, Lsu;

    const/4 v4, 0x7

    invoke-direct {v3, v2, p0, v1, v4}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const p0, 0xfa00

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1, v3}, Ld7l;->E(IZLcom/opera/api/Callback;)V

    return-void
.end method

.method public final f(Lhw0;)V
    .registers 9

    iget-object v1, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, v1, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez p0, :cond_7

    const/4 p0, 0x0

    :cond_7
    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-nez p0, :cond_c

    return-void

    :cond_c
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v6, 0x1

    if-eqz p1, :cond_1d

    if-ne p1, v6, :cond_19

    sget-object p1, Lx92;->f:Lx92;

    :goto_17
    move-object v4, p1

    goto :goto_20

    :cond_19
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_1d
    sget-object p1, Lx92;->e:Lx92;

    goto :goto_17

    :goto_20
    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->h0()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {p0}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v3

    new-instance v0, Lxx1;

    const/4 v5, 0x2

    invoke-direct/range {v0 .. v5}, Lxx1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;B)V

    const p1, 0x493e0

    invoke-virtual {p0, p1, v6, v0}, Ld7l;->E(IZLcom/opera/api/Callback;)V

    return-void
.end method

.method public final g()V
    .registers 1

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    iget-object p0, p0, Lhx3;->f:Lfx3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lul3;

    invoke-virtual {p0}, Lul3;->a()V

    return-void
.end method

.method public final h()V
    .registers 6

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_3e

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lrm5;->D(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_3f

    invoke-static {v0}, Luy3;->F(Lb9l;)Luy3;

    move-result-object v0

    if-eqz v0, :cond_1d

    iget-object v0, v0, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    goto :goto_1e

    :cond_1d
    const/4 v0, 0x0

    :goto_1e
    if-eqz v0, :cond_3e

    new-instance v1, Lgv3;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lgv3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    sget-object p0, Lfj9;->a:Ljava/util/List;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->I()Lorg/chromium/content_public/browser/RenderFrameHost;

    move-result-object p0

    if-eqz p0, :cond_3e

    sget-object v0, Lfj9;->b:Ljava/lang/String;

    new-instance v2, Lwa;

    const/16 v3, 0xc

    invoke-direct {v2, v1, v3}, Lwa;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0, v0, v2}, LJ/N;->MGe8MVxK(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_3e
    return-void

    :cond_3f
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "package:"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.PICTURE_IN_PICTURE_SETTINGS"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v2, 0x10000

    invoke-static {v2, v1}, Lqvf;->b(ILandroid/content/Intent;)Landroid/content/pm/ResolveInfo;

    move-result-object v2

    if-nez v2, :cond_76

    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const-string v0, ":settings:fragment_args_key"

    const-string v2, "picture_in_picture"

    invoke-virtual {v1, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    :cond_76
    iget-object v0, p0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->c:Lz77;

    new-instance v2, Lreg;

    new-instance v3, Lgb3;

    const/4 v4, 0x7

    invoke-direct {v3, p0, v1, v4}, Lgb3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2, v3}, Lreg;-><init>(Lgb3;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v2, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method

.method public final i()V
    .registers 4

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->B1()V

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    if-nez p0, :cond_e

    return-void

    :cond_e
    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->n0()Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-virtual {p0}, Ld7l;->q()V

    return-void

    :cond_1a
    iget-object v0, p0, Ld7l;->i:Liga;

    iget-object v1, p0, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->m()Z

    invoke-interface {v0}, Liga;->e()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    sget-object v2, Llqm;->l:Llqm;

    invoke-static {v0, v1, v2}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v0}, Ld7l;->Z(Llsc;)V

    return-void
.end method

.method public final j(Z)V
    .registers 4

    new-instance v0, Lby3;

    const/4 v1, 0x1

    if-eqz p1, :cond_7

    move p1, v1

    goto :goto_8

    :cond_7
    const/4 p1, 0x2

    :goto_8
    invoke-direct {v0, p1, v1}, Lby3;-><init>(II)V

    sget p1, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0, v0}, Lcom/opera/android/BrowserActivity;->c1(Lby3;)V

    return-void
.end method

.method public final k(Landroid/view/View;)V
    .registers 3

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_1c

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->o0()Z

    move-result v0

    if-eqz v0, :cond_21

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->B0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldbl;

    if-nez v0, :cond_1d

    :cond_1c
    return-void

    :cond_1d
    invoke-virtual {p0, v0, p1}, Lcom/opera/android/BrowserActivity;->A1(Lo73;Landroid/view/View;)V

    return-void

    :cond_21
    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->A0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lo73;

    invoke-virtual {p0, v0, p1}, Lcom/opera/android/BrowserActivity;->A1(Lo73;Landroid/view/View;)V

    return-void
.end method

.method public final l()V
    .registers 8

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->l0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lq82;

    iget-object v1, v1, Lq82;->e:Lg82;

    const/4 v2, 0x1

    if-nez v1, :cond_6d

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_c2

    check-cast v0, Ld7l;

    iget-object v1, v0, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/opera/android/browser/UrlMangler;->c(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2a

    invoke-static {v1}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    goto :goto_59

    :cond_2a
    const v3, 0x7f140da0

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    new-instance v3, Lcom/opera/android/browser/UrlMangler$Builder;

    new-instance v4, Landroid/net/Uri$Builder;

    invoke-direct {v4}, Landroid/net/Uri$Builder;-><init>()V

    const-string v5, "opera-distiller"

    invoke-virtual {v4, v5}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    const-string v5, "readermode"

    invoke-virtual {v4, v5}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v5, v4}, Lcom/opera/android/browser/UrlMangler$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v1}, Lcom/opera/android/browser/UrlMangler$Builder;->externalUrl(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    invoke-virtual {v3, p0}, Lcom/opera/android/browser/UrlMangler$Builder;->displayString(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    invoke-virtual {v3}, Lcom/opera/android/browser/UrlMangler$Builder;->build()Ljava/lang/String;

    move-result-object p0

    :goto_59
    new-instance v1, Llsc;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lksc;-><init>(Ljava/lang/String;I)V

    iput-boolean v2, v1, Lksc;->k:Z

    invoke-static {v2}, LJ/N;->Mke9ps$8(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [B

    iput-object p0, v1, Llsc;->o:[B

    invoke-virtual {v0, v1}, Ld7l;->Z(Llsc;)V

    return-void

    :cond_6d
    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lq82;

    iget-object v0, v0, Lq82;->j:Lb2l;

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->d(Ljava/lang/String;)Z

    move-result v0

    iget-object v3, p0, Lcom/opera/android/BrowserActivity;->E:Lt82;

    const/4 v4, 0x0

    sget-object v5, Llqm;->d:Llqm;

    if-eqz v0, :cond_ae

    if-nez v3, :cond_8b

    move-object v3, v4

    :cond_8b
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lcom/opera/android/browser/UrlMangler$Builder;

    const-string v3, "article"

    iget-object v6, v1, Lg82;->d:Ljava/lang/String;

    invoke-direct {v0, v3, v6}, Lcom/opera/android/browser/UrlMangler$Builder;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v3, v1, Lg82;->b:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/opera/android/browser/UrlMangler$Builder;->title(Ljava/lang/String;)Lcom/opera/android/browser/UrlMangler$Builder;

    iget-object v1, v1, Lg82;->a:Ljava/lang/String;

    iget-object v3, v0, Lcom/opera/android/browser/UrlMangler$Builder;->c:Ljava/util/HashMap;

    const-string v6, "article_id"

    invoke-virtual {v3, v6, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/opera/android/browser/UrlMangler$Builder;->build()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v4, v5}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object v0

    goto :goto_b5

    :cond_ae
    if-nez v3, :cond_b1

    move-object v3, v4

    :cond_b1
    invoke-virtual {v3, v1, v5}, Lt82;->a(Lg82;Llqm;)Llsc;

    move-result-object v0

    :goto_b5
    iput-boolean v2, v0, Lksc;->k:Z

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    if-eqz p0, :cond_c2

    check-cast p0, Ld7l;

    invoke-virtual {p0, v0}, Ld7l;->Z(Llsc;)V

    :cond_c2
    return-void
.end method

.method public final m()V
    .registers 2

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->B1()V

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    if-eqz p0, :cond_12

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->b()V

    :cond_12
    return-void
.end method

.method public final n()V
    .registers 14

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    iget-object v1, p0, Lcom/opera/android/BrowserActivity;->x:Lumi;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    invoke-static {p0}, Lcom/opera/android/utilities/DisplayUtil;->e(Landroid/content/Context;)Z

    move-result v3

    new-instance v4, Lpii;

    invoke-direct {v4, v1, v2, v3}, Lpii;-><init>(Lumi;Lx5f;Z)V

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getId()I

    move-result v0

    const-string v2, "tab_id"

    invoke-virtual {v1, v2, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v4, v1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p0, p0, Lqim;->b:Lll9;

    const/4 v0, 0x0

    new-array v0, v0, [Ln6h;

    new-instance v6, Lwzg;

    const-class v1, Lpii;

    const/4 v2, 0x4

    invoke-direct {v6, v4, v1, v2}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v5, Lzhj;

    const/4 v10, 0x0

    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v12

    const/4 v7, 0x0

    const/4 v8, 0x1

    const/4 v9, -0x1

    const/4 v11, 0x0

    invoke-direct/range {v5 .. v12}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {p0, v5}, Lll9;->b(Lzhj;)V

    return-void
.end method

.method public final o()V
    .registers 2

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->K:Lhw3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lf1j;

    invoke-virtual {p0, v0}, Lf1j;->e(Lb2l;)V

    return-void
.end method

.method public final p(Ljava/lang/String;Z)V
    .registers 19

    move-object/from16 v0, p1

    move/from16 v1, p2

    sget v2, Lcom/opera/android/BrowserActivity;->E1:I

    move-object/from16 v2, p0

    iget-object v2, v2, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v3

    const/4 v4, 0x0

    if-eqz v3, :cond_1b

    move-object v5, v3

    check-cast v5, Ld7l;

    iget-object v5, v5, Ld7l;->j:Le7l;

    invoke-interface {v5}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v5

    goto :goto_1c

    :cond_1b
    move-object v5, v4

    :goto_1c
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->z0()Lz77;

    move-result-object v7

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object v8

    if-eqz v3, :cond_34

    move-object v9, v3

    check-cast v9, Ld7l;

    iget-object v9, v9, Ld7l;->j:Le7l;

    invoke-interface {v9}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v9

    goto :goto_35

    :cond_34
    move-object v9, v4

    :goto_35
    const/4 v10, 0x1

    if-eqz v0, :cond_41

    if-eqz v9, :cond_40

    invoke-static {v0, v9, v10, v10}, Lwqm;->J(Ljava/lang/String;Ljava/lang/String;ZZ)Z

    move-result v11

    if-nez v11, :cond_41

    :cond_40
    move-object v9, v0

    :cond_41
    if-eqz v9, :cond_167

    if-eqz v3, :cond_4f

    move-object v0, v3

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    goto :goto_50

    :cond_4f
    move-object v0, v4

    :goto_50
    invoke-virtual {v9, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v11, 0x0

    if-eqz v0, :cond_64

    move-object v12, v3

    check-cast v12, Ld7l;

    iget-object v12, v12, Ld7l;->j:Le7l;

    invoke-interface {v12}, Lb9l;->m()Z

    move-result v12

    if-eqz v12, :cond_64

    move v12, v10

    goto :goto_65

    :cond_64
    move v12, v11

    :goto_65
    invoke-static {v9}, LJ/N;->MvREqNZj(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_ff

    invoke-static {v9}, LJ/N;->MKmMXQdc(Ljava/lang/Object;)Z

    move-result v14

    if-ne v1, v14, :cond_77

    if-nez v12, :cond_77

    invoke-static {v9, v12}, LJ/N;->M7rGNOkl(Ljava/lang/Object;Z)V

    goto :goto_86

    :cond_77
    const/4 v14, 0x2

    if-eqz v1, :cond_7c

    move v15, v14

    goto :goto_7d

    :cond_7c
    move v15, v10

    :goto_7d
    if-eq v15, v10, :cond_82

    if-eq v15, v14, :cond_83

    throw v4

    :cond_82
    move v14, v10

    :cond_83
    invoke-static {v9, v14, v12}, LJ/N;->MK6TwYBN(Ljava/lang/Object;IZ)V

    :goto_86
    if-nez v12, :cond_ff

    invoke-static {v6}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v9

    iget-object v12, v9, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v14, "user_agent_remember_dialog"

    invoke-interface {v12, v14, v11}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v12

    sget-object v15, Lijm;->b:Lijm;

    if-eqz v12, :cond_a9

    new-instance v4, Lglj;

    const v6, 0x7f140562

    const/16 v7, 0x9c4

    invoke-direct {v4, v6, v7}, Lglj;-><init>(II)V

    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v8, v4, v15}, Lr22;->b(Ljjm;Lijm;)V

    goto :goto_ff

    :cond_a9
    if-eqz v1, :cond_af

    const v8, 0x7f140fcc

    goto :goto_b2

    :cond_af
    const v8, 0x7f140fc6

    :goto_b2
    const-string v12, "Opera"

    filled-new-array {v12}, [Ljava/lang/Object;

    move-result-object v12

    const v10, 0x7f140fc5

    invoke-virtual {v6, v10, v12}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    new-instance v10, Lrxh;

    invoke-direct {v10, v8}, Lrxh;-><init>(I)V

    new-instance v8, Lgkj;

    invoke-direct {v8, v11, v11}, Lnz0;-><init>(ZZ)V

    iput-object v4, v8, Lgkj;->a:Ljava/lang/String;

    iput-object v4, v8, Lgkj;->b:Ljava/lang/String;

    iput-object v4, v8, Lgkj;->c:Ljava/lang/String;

    iput-object v6, v8, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v4, v8, Lgkj;->e:Lekj;

    iput-object v4, v8, Lgkj;->f:Lfkj;

    iput-object v4, v8, Lgkj;->g:Lqp2;

    iput-object v4, v8, Lgkj;->h:Ldkj;

    iput-object v4, v8, Lgkj;->i:Ldkj;

    iput-object v4, v8, Lgkj;->j:Lql;

    const v4, 0x7f140812

    iput v4, v8, Lgkj;->k:I

    iput v11, v8, Lgkj;->l:I

    iput v11, v8, Lgkj;->m:I

    const/4 v4, 0x1

    iput-boolean v4, v8, Lgkj;->n:Z

    iput-object v10, v8, Lgkj;->o:Lpxh;

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v7, v8, v15}, Lr22;->b(Ljjm;Lijm;)V

    invoke-virtual {v9}, Lru9;->b()Lnv6;

    move-result-object v6

    iget-object v7, v6, Lnv6;->a:Ljava/lang/Object;

    check-cast v7, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v7, v14, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v6}, Lnv6;->w()V

    :cond_ff
    :goto_ff
    if-eqz v0, :cond_167

    move-object v0, v3

    check-cast v0, Ld7l;

    invoke-virtual {v0, v1}, Ld7l;->k(Z)V

    if-eqz v13, :cond_167

    if-eqz v5, :cond_167

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->a1:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmu6;

    invoke-virtual {v0, v3, v5}, Lmu6;->a(Lb2l;Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_167

    invoke-static {v5}, LJ/N;->MXw3KFE6(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_167

    iget-object v0, v0, Lmu6;->b:Lhd;

    iget-boolean v3, v0, Lhd;->b:Z

    if-eqz v3, :cond_167

    iget-object v3, v0, Lhd;->d:Ljava/lang/Object;

    check-cast v3, Ln9a;

    invoke-static {}, Ln9a;->o()Lw56;

    move-result-object v4

    new-instance v5, Lbk0;

    invoke-direct {v5, v3, v4}, Lbk0;-><init>(Ln9a;Lw56;)V

    new-instance v3, Lxsf;

    invoke-direct {v3, v11, v1}, Lxsf;-><init>(BZ)V

    invoke-virtual {v5, v2, v3}, Lbk0;->a(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    iget-object v1, v0, Lhd;->g:Ljava/lang/Object;

    check-cast v1, Lmgh;

    invoke-virtual {v1, v4}, Lmgh;->c(Ljf0;)Z

    move-result v1

    if-nez v1, :cond_167

    iget-object v1, v0, Lhd;->c:Ljava/lang/Object;

    check-cast v1, Lumi;

    new-instance v2, Lrml;

    sget-object v3, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {v2, v3, v1}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lo5f;

    const/16 v3, 0x12

    invoke-direct {v1, v0, v3}, Lo5f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object v1

    iget-object v0, v0, Lhd;->f:Ljava/lang/Object;

    check-cast v0, Lqie;

    invoke-virtual {v1, v0}, Lplk;->m(Lqie;)Lp1j;

    :cond_167
    return-void
.end method

.method public final q()V
    .registers 9

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_30

    move-object v1, v0

    check-cast v1, Ld7l;

    iget-object v2, v1, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_31

    iget-object v1, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v1, v1, Ltw3;->u0:Lii;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ly22;

    iget-object v1, v1, Ly22;->a:Lx22;

    if-eqz v1, :cond_30

    new-instance v2, Liv0;

    const/4 v3, 0x3

    invoke-direct {v2, p0, v3}, Liv0;-><init>(Landroid/content/Context;B)V

    invoke-virtual {v1, v0, v2}, Lx22;->b(Lb2l;Lkotlin/jvm/functions/Function1;)V

    :cond_30
    return-void

    :cond_31
    invoke-virtual {v1}, Ld7l;->l0()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Ld7l;->k0()Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lghf;

    new-instance v5, Li4d;

    new-instance v6, Le5f;

    const/16 v7, 0xa

    invoke-direct {v6, v3, v2, v7}, Le5f;-><init>(Ljava/lang/String;Ljava/lang/String;B)V

    invoke-direct {v5, v6}, Li4d;-><init>(Lkotlin/jvm/functions/Function1;)V

    invoke-direct {v4, v5}, Lghf;-><init>(Li4d;)V

    iput-object v0, v4, Lghf;->d:Ljava/lang/Object;

    invoke-virtual {v1}, Ld7l;->f0()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_59

    new-instance v1, Lfv3;

    invoke-direct {v1, p0, v0}, Lfv3;-><init>(Lcom/opera/android/BrowserActivity;Ljava/lang/String;)V

    iput-object v1, v4, Lghf;->c:Ljava/lang/Object;

    :cond_59
    invoke-virtual {v4, p0}, Lghf;->I(Landroid/content/Context;)Ljjm;

    return-void
.end method

.method public final r()V
    .registers 6

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-nez v0, :cond_b

    return-void

    :cond_b
    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->k0:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbuj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v0, Ld7l;

    iget-object v1, v0, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v1

    const-string v2, "screenshot"

    :try_start_20
    iget-object v3, p0, Lbuj;->a:Lcom/opera/android/BrowserActivity;

    const-string v4, ".png"

    invoke-static {v3, v2, v4}, Ln1h;->e(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;

    move-result-object v2
    :try_end_28
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_28} :catch_29

    goto :goto_2a

    :catch_29
    const/4 v2, 0x0

    :goto_2a
    if-nez v2, :cond_33

    const v0, 0x7f14114d

    invoke-virtual {p0, v0}, Lbuj;->a(I)V

    return-void

    :cond_33
    iget-object v3, p0, Lbuj;->c:Ldu3;

    invoke-virtual {v3}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    new-instance v4, Lir8;

    invoke-direct {v4, p0, v3, v2, v1}, Lir8;-><init>(Lbuj;ILjava/io/File;Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-virtual {v0, p0, p0, v4}, Ld7l;->C(ZZLcom/opera/api/Callback;)V

    return-void
.end method

.method public final s()V
    .registers 2

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->B1()V

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->U0:Lpyl;

    invoke-virtual {v0}, Lpyl;->m()V

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    if-nez p0, :cond_13

    return-void

    :cond_13
    check-cast p0, Ld7l;

    iget-object v0, p0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/opera/android/browser/UrlMangler;->c(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-virtual {p0}, Ld7l;->b()V

    return-void

    :cond_25
    invoke-virtual {p0}, Ld7l;->V()V

    return-void
.end method

.method public final t()V
    .registers 8

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->F:Lw6j;

    const/4 v1, 0x0

    if-nez v0, :cond_8

    move-object v0, v1

    :cond_8
    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/opera/android/settings/SettingsManager;->E()Lz4m;

    move-result-object v2

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object p0

    iget-object v3, v0, Lw6j;->a:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/BrowserActivity;

    invoke-static {v3}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v3

    if-eqz v3, :cond_a0

    iget-boolean v2, v2, Lz4m;->a:Z

    if-eqz v2, :cond_a0

    iget-object v2, v0, Lw6j;->b:Ljava/lang/Object;

    check-cast v2, La4m;

    iget-object v3, v2, La4m;->a:Landroid/content/Context;

    invoke-static {v3}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v3

    invoke-virtual {v3}, Lru9;->b()Lnv6;

    move-result-object v3

    iget-object v4, v3, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    const-string v5, "translate_web_pages.show_ui_from_page_menu.clicked"

    const/4 v6, 0x1

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v3}, Lnv6;->w()V

    iget-object v3, v2, La4m;->j:Lf6l;

    if-eqz v3, :cond_48

    iget-object v4, v2, La4m;->c:Lk6l;

    invoke-virtual {v4, v3}, Lk6l;->x(Lj6l;)V

    iput-object v1, v2, La4m;->j:Lf6l;

    :cond_48
    iget-object v0, v0, Lw6j;->e:Ljava/lang/Object;

    check-cast v0, Lr4m;

    iget-object v2, v0, Lr4m;->g:Lv3m;

    iget-object v2, v2, Lv3m;->a:Landroid/content/Context;

    invoke-static {v2}, Lv3m;->f(Landroid/content/Context;)Z

    move-result v2

    if-nez v2, :cond_60

    new-instance p0, Lo4m;

    const/4 v1, 0x5

    invoke-direct {p0, v0, v1}, Lo4m;-><init>(Lr4m;B)V

    invoke-virtual {v0, p0}, Lr4m;->c0(Ljava/lang/Runnable;)V

    return-void

    :cond_60
    if-eqz p0, :cond_6a

    invoke-static {p0}, Luy3;->F(Lb9l;)Luy3;

    move-result-object v2

    if-eqz v2, :cond_6a

    iget-object v1, v2, Luy3;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    :cond_6a
    if-nez v1, :cond_70

    invoke-virtual {v0}, Lr4m;->b0()V

    return-void

    :cond_70
    invoke-virtual {v0}, Lr4m;->W()Lszb;

    move-result-object v2

    if-eqz v2, :cond_7d

    invoke-virtual {v0, p0, v6}, Lr4m;->Z(Lb2l;I)V

    invoke-virtual {v0, p0}, Lr4m;->d0(Lb2l;)V

    return-void

    :cond_7d
    iput-byte v6, v0, Lr4m;->k:B

    iget-object v1, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->Q:Lyqa;

    if-eqz v1, :cond_99

    iget-object v2, v1, Lyqa;->b:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_99

    const-string v3, "und"

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_99

    invoke-virtual {v0, p0, v1}, Lr4m;->b(Lb2l;Lyqa;)V

    return-void

    :cond_99
    invoke-virtual {v0, p0, v6}, Lr4m;->Y(Lb2l;I)V

    invoke-virtual {v0, p0}, Lr4m;->d0(Lb2l;)V

    return-void

    :cond_a0
    iget-object p0, v0, Lw6j;->d:Ljava/lang/Object;

    check-cast p0, Lp8f;

    invoke-virtual {p0}, Lp8f;->E()V

    return-void
.end method

.method public final u(Landroid/view/View;)V
    .registers 6

    iget-object p0, p0, Lhv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->I0()Lnej;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object p0, p0, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->t()Lcom/opera/android/Lazy;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lswf;

    new-instance v1, Lqp2;

    const/16 v2, 0x13

    invoke-direct {v1, v2}, Lqp2;-><init>(B)V

    new-instance v2, Lim6;

    const/4 v3, 0x7

    invoke-direct {v2, p0, v1, p1, v3}, Lim6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v2, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void
.end method
