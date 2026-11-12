.class public final synthetic Lnfh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/BrowserActivity;

.field public final synthetic c:Lumi;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;Lumi;B)V
    .registers 4

    iput-byte p3, p0, Lnfh;->a:B

    iput-object p1, p0, Lnfh;->b:Lcom/opera/android/BrowserActivity;

    iput-object p2, p0, Lnfh;->c:Lumi;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 8

    iget-byte v0, p0, Lnfh;->a:B

    const/4 v1, 0x7

    iget-object v2, p0, Lnfh;->c:Lumi;

    iget-object p0, p0, Lnfh;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v0, :pswitch_data_ce

    check-cast p1, Lf8f;

    invoke-virtual {p1}, Lf8f;->h()Z

    move-result p1

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    if-eqz p1, :cond_26

    new-instance p1, Lrml;

    invoke-direct {p1, v0, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v2, Lst3;

    invoke-direct {v2, p0, v1}, Lst3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-virtual {p1, v2}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    goto :goto_39

    :cond_26
    new-instance p1, Lrml;

    invoke-direct {p1, v0, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v1, Lqfl;

    const/16 v2, 0x13

    invoke-direct {v1, p0, v2}, Lqfl;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v1}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    :goto_39
    return-object v0

    :pswitch_3a
    check-cast p1, Lt0a;

    const/4 v0, 0x0

    if-eqz p1, :cond_ca

    instance-of v3, p1, Lr0a;

    if-eqz v3, :cond_47

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto/16 :goto_cd

    :cond_47
    instance-of p1, p1, Ls0a;

    if-eqz p1, :cond_ca

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "qr.google_lens_supported"

    const/4 v4, 0x0

    invoke-interface {p1, v3, v4}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_5d

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_cd

    :cond_5d
    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p1

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object v5, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v5, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v5, v3, v4}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    const p1, 0x7f140ef4

    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    new-instance v3, Lnhj;

    invoke-direct {v3}, Lnhj;-><init>()V

    iput-object p0, v3, Lnhj;->a:Landroid/content/Context;

    const-string v4, "qrWidgetShortcut"

    iput-object v4, v3, Lnhj;->b:Ljava/lang/String;

    iput-object p1, v3, Lnhj;->e:Ljava/lang/CharSequence;

    const p1, 0x7f110004

    invoke-static {p1, p0}, Landroidx/core/graphics/drawable/IconCompat;->c(ILandroid/content/Context;)Landroidx/core/graphics/drawable/IconCompat;

    move-result-object p1

    iput-object p1, v3, Lnhj;->h:Landroidx/core/graphics/drawable/IconCompat;

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    const-string v4, "com.opera.android.action.SCAN_QR_CODE_FROM_SHORTCUT_WIDGET"

    invoke-virtual {p1, v4}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    filled-new-array {p1}, [Landroid/content/Intent;

    move-result-object p1

    iput-object p1, v3, Lnhj;->c:[Landroid/content/Intent;

    iget-object p1, v3, Lnhj;->e:Ljava/lang/CharSequence;

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_c4

    iget-object p1, v3, Lnhj;->c:[Landroid/content/Intent;

    if-eqz p1, :cond_be

    array-length p1, p1

    if-eqz p1, :cond_be

    new-instance p1, Lrml;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-direct {p1, v0, v2}, Lrml;-><init>(Ljava/lang/Object;Ltcl;)V

    new-instance v2, Lvvf;

    invoke-direct {v2, p0, v3, v1}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v2}, Lrml;->a(Lkotlin/jvm/functions/Function1;)Lplk;

    move-result-object p0

    invoke-virtual {p0}, Lplk;->l()Loml;

    goto :goto_cd

    :cond_be
    const-string p0, "Shortcut must have an intent"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_cd

    :cond_c4
    const-string p0, "Shortcut must have a non-empty label"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    goto :goto_cd

    :cond_ca
    invoke-static {}, Lh9o;->p()V

    :goto_cd
    return-object v0

    :pswitch_data_ce
    .packed-switch 0x0
        :pswitch_3a
    .end packed-switch
.end method
